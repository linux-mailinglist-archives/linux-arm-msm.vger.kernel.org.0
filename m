Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6060677694D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 21:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjHIT5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 15:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjHIT5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 15:57:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A45810E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 12:57:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso182758e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691611060; x=1692215860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBodoJrBHAgz/TzgDtibSZ9qk+u2fN1KDY0bxZS/Y3Q=;
        b=OjW53ClTqhx/xyhNIydqITOGL5K+qYj6dDyIB6iexWUa9VE1g+2Tmq7CAaTl6ykYnT
         XQc1gvuG4tIxSOQUhn0QHFWOkrVmKTRGz451J35EGRNyM9kRlW7V+N3iqu3MljcQG3+5
         TQEwqWvMUKQiw73wwvs7lkAGEWEEMBRzx8vSyRgBFoxYT4kG6KNQtfjZh6TSyNb+CMMi
         PvKt+ychU6PzxxNdZwbF+nJ8vrkMojrQXTe/mFstpsMne876Rshwy2x2z5fgODeKJdTX
         n1MTmcPFiMLi++8QbVeWE+ByyU8vxEh4ygB6ObwDdMjcwITLtJ7m8XRB4FV77Zw5Q8JU
         xVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611060; x=1692215860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBodoJrBHAgz/TzgDtibSZ9qk+u2fN1KDY0bxZS/Y3Q=;
        b=Fzr6B6z2Wrp3sXbBe5nzdaz4fpm6QTDGxW4Dfvj/rn383ib9Tu8hq8UqvD8uo4mfYs
         DRRe6/O2u5Usb/WwvR0RKKK85MgFhfiVjL9WBgIdd66PbHBMbA5FSNF9CEK6Yk5jjq6K
         OuOguWpwCmJ7cZ1K3EH0kadMLhHc06Z1Q1cSj6qjwMZ70sJGasFSvHRRYJJQp1YhxGzx
         /tF9uL8wPnVnUQimI0lfVEl0i3wbr5QVBwtTgid/u3WvI/ST4fZ4A5OaG0ovu4jVy7wr
         Eb4WuUkyJofpXVkzgwCG3qQ0O6fwPC7hp5tV5nIzRjHvtJq8pJ3ISfM7m85UnE58vlN2
         w5oA==
X-Gm-Message-State: AOJu0YxaLKV4RSYk6KO+ERCA0mX6BKF37G8DjrCUR2H0h5DMtVWJcLnh
        GEQnuAXhgYEzBq5Og/8SOJbdKA==
X-Google-Smtp-Source: AGHT+IH0jp+tns6Qhe/MujFD3RwBs+BZQb4A+4Hk24LTkrmL2sjAulAvZW5dkSubYyxJiXZ+d6ILOQ==
X-Received: by 2002:a19:770f:0:b0:4fb:820a:f87f with SMTP id s15-20020a19770f000000b004fb820af87fmr91778lfc.10.1691611059785;
        Wed, 09 Aug 2023 12:57:39 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id t12-20020ac243ac000000b004fe0c0235ddsm2445518lfl.143.2023.08.09.12.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:57:39 -0700 (PDT)
Message-ID: <98d0632c-7129-4e3a-aba7-e805e3281f91@linaro.org>
Date:   Wed, 9 Aug 2023 21:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: branch: Add mem ops support for branch2
 clocks
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20230808051407.647395-1-quic_imrashai@quicinc.com>
 <20230808051407.647395-3-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230808051407.647395-3-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8.08.2023 07:14, Imran Shaik wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Clock CBCRs with memories need an update for memory before enable/disable
> of the clock. Add support for the mem ops to handle this sequence.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
Could you expand the commit message a bit? What does this clock
memory do?

[..]

> +static int clk_branch2_mem_enable(struct clk_hw *hw)
> +{
> +	struct clk_branch *br = to_clk_branch(hw);
> +	u32 val;
> +	int count = 200;
> +
> +	regmap_update_bits(br->clkr.regmap, br->mem_enable_reg,
> +			br->mem_enable_ack_bit, br->mem_enable_ack_bit);
> +
> +	regmap_read(br->clkr.regmap, br->mem_ack_reg, &val);
> +
> +	while (count-- > 0) {
> +		if (val & br->mem_enable_ack_bit)
> +			return clk_branch2_enable(hw);
> +		udelay(1);
> +		regmap_read(br->clkr.regmap, br->mem_ack_reg, &val);
> +	}
readl_poll_timeout?

Konrad
