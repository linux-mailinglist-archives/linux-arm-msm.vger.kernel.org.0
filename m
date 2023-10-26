Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B5B7D81B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 13:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjJZLVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 07:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjJZLVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 07:21:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8016B1A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:21:27 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-508126afb9bso1033822e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698319286; x=1698924086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSKeXxSFvdhUI991XGbb0vn+r/xj55RtU6bSV+aiUUI=;
        b=kJRZvA499Io+GyM5T3GfbM3+h2hB/B6Mk9Eae3A3WpZL3lRI6tPy0ObDLxUXaF8tSX
         Of21RetbJ/j6AwP+TzQeNu7pFGggXs+c7GAzdxka3mr7ojrRtoLrPcYHD1X0fpmfFRTN
         irIcgvcBL7WENLRrwexE9AJ2GXrZUDEkHcsZevJOFqewIm4EytMRMS/Lse8TvtotrWQb
         B91fIkJsDJAzpXi2sGvlCHUtq1mVrgMq9qj2SgAaHqf+ZwtuumH6AbAm6fMj1Fs+uc42
         j/Q9x0e2tASb10eCvnBxdJz96Uo+N3J70ks82CaAOidkX8S9A0PXWPQLa282z8z7G+Z9
         Gj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319286; x=1698924086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSKeXxSFvdhUI991XGbb0vn+r/xj55RtU6bSV+aiUUI=;
        b=TXS7c3GefaR7hnqsDs6mYJji5CQcoZj/tshsUKEOA5U64FDckJxPwbPibLEFxNpyec
         J7oScnMfXLFB7kJsmHrTchqkJ3ytgAk5KhxLYNcd4/JyZF9i/4ag8vPyxzChiUiANZuR
         UAiI9Vbk1isAfGYnVOfmIrXadczClXAzoe3Ee/WY0z2S00wsHEzi/zy8DcIAbmvsdwMZ
         FQ9r7uOAOBndI7A7rhlFKQO4pjqSMc8H+P5LSqeFGKwzY/8Rijs8uPrQfXXsLg+gg6Bh
         zK+RDvyGt5+ppiWTH17lTemvnLeWNXAiPjbNLy1GFa0T7Om1DCXk7i4i1q4sczcriGwE
         vsHw==
X-Gm-Message-State: AOJu0YybasoIUcvVVbVpinheX4WDFJtP/WoCbzDLz7ZmbCy3yLM3rwBb
        71aR2HGCHOm82ZH2+0Wbi+Qq+A==
X-Google-Smtp-Source: AGHT+IGMDRJ++uq47HfhGaS8EshCxhhx3j3Ev8XjrLvyBnG+fsZOQ1XrKzrhUL1bi6EvEiqHg752kQ==
X-Received: by 2002:a05:6512:3094:b0:507:9f24:ad17 with SMTP id z20-20020a056512309400b005079f24ad17mr15567200lfd.43.1698319285654;
        Thu, 26 Oct 2023 04:21:25 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q5-20020a056512210500b00507a14e18d4sm2974495lfr.222.2023.10.26.04.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:21:25 -0700 (PDT)
Message-ID: <20e2801d-df4f-436e-a677-2c81d43e3273@linaro.org>
Date:   Thu, 26 Oct 2023 13:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp
 CAMCC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
 <20231026105345.3376-4-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231026105345.3376-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/23 12:53, Bryan O'Donoghue wrote:
> Add the sc8280xp CAMCC driver which follows the sdm845 CAMCC lineage
> with additional CCI and IFE blocks and more granular clock parentage.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]

> +static struct gdsc titan_top_gdsc;
> +
> +static struct gdsc bps_gdsc = {
> +	.gdscr = 0x7004,
> +	.pd = {
> +		.name = "bps_gdsc",
> +	},
> +	.flags = HW_CTRL | RETAIN_FF_ENABLE,
This should really be HW_CTRL_TRIGGER from [1]

and then downstream uses cam_bps_transfer_gdsc_control and
cam_bps_get_gdsc_control to control hw (fast) or sw (normal) mode

similarly in drivers/cam_icp/icp_hw/ipe_hw/ipe_soc.c for IPE

[...]

> +	/*
> +	 * Keep camcc_gdsc_clk always enabled:
> +	 */
> +	regmap_update_bits(regmap, 0xc1e4, BIT(0), 1);
/* Keep camcc_gdsc_clk always enabled */
regmap_update_bits(regmap, 0xc1e4, BIT(0), BIT(0));

[1] https://lore.kernel.org/linux-arm-msm/20230923115008.1698384-4-abel.vesa@linaro.org/

Konrad
