Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A961D7B0305
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 13:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjI0Lc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 07:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjI0Lcz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 07:32:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9919313A
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:32:52 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so12007212a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695814371; x=1696419171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmC28zPzyeN5h9YOo0onOq5tTB/Izz/ETCc1GIhKzK4=;
        b=oI1+htW7Vw2/IF8kofX5oHiHUBR3jgyrU2NLfkMsgfxZG0+x+gwBbeQtty77IvnCr/
         2AUlQTpJjkdqIf6vwe+NAbfBdJ6i+cuibOFTXBFEFTPjGXc+IcpqOIhHtozxkXBdIrZE
         xLhpDZ9ZaYwPkunDRXrj9n3LwzRjaxG2JvywGQ2EEnYYbEre6bvs/N90uFfzQSPkbYyd
         2aobsUAK1EdJKIJJlA/cMsS3aE0+xn4Gh7BUwuCKrUIGU3W4/WMenwiO02d3UTDlAB6H
         5HpSkbyTduclwq0DB+NZeaOl+trGmVYNdAS2vbnTHNDybVJR4Ra825fotK1MzFIqOsSG
         77xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814371; x=1696419171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmC28zPzyeN5h9YOo0onOq5tTB/Izz/ETCc1GIhKzK4=;
        b=AtOJ+3qyS/HVEYrkLMRjlo+qPpGlHAaDH8fAr7d0MpaKll2jutQF7RzHJIii6EkuGL
         x5crQiCahiiJ4CJx18iMMpRtDtkrvSyaqSaNXVz2kAYPbdwd4Edj1gNw29V2HmJuAWus
         3P0UHDTvlu0juVglGKTg+puHy533ue0V+as81lyFbXq+TAw5YAY9de/5uu1CXxTBaFsS
         yZqqjVMhz1xPoi8q8D9FhDy9F2DBmrxYQ3UoRLVZnv0hGw98UJGS129uIUdDlXDHp79s
         fu26b3arz+vt5jnf0lkXjpqx5aWNmsWKFBI/8+UUf2vMLBRGZ4DnwZ36yaA4fopyep+R
         4dLQ==
X-Gm-Message-State: AOJu0YxbQ0k+MZRAGLpF3ukm7jeTcYXW/uIkN+8RjvPUOzepIqxT6yDp
        k9J9buw7oMwEQpT2culDxtRzq6sTpA2Cs5dVV+L6Xg==
X-Google-Smtp-Source: AGHT+IG7b4dxUf715EpVT7JaeWQyYHxZTmTb/A2hMQ5pNC3MfQaQEL3VieWRBerP205I1zLe3CPCMA==
X-Received: by 2002:a50:fa85:0:b0:525:73dd:4f71 with SMTP id w5-20020a50fa85000000b0052573dd4f71mr1919174edr.14.1695814370804;
        Wed, 27 Sep 2023 04:32:50 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7cf02000000b005232ea6a330sm8065681edy.2.2023.09.27.04.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:32:50 -0700 (PDT)
Message-ID: <4fe7a8ec-bb7f-4b96-bfe4-20b20c0fa4ab@linaro.org>
Date:   Wed, 27 Sep 2023 13:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: qcom: ipq5018: drop the CLK_SET_RATE_PARENT
 flag from GPLL clocks
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230913-gpll_cleanup-v2-0-c8ceb1a37680@quicinc.com>
 <20230913-gpll_cleanup-v2-3-c8ceb1a37680@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230913-gpll_cleanup-v2-3-c8ceb1a37680@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14.09.2023 08:59, Kathiravan Thirumoorthy wrote:
> GPLL clock rates are fixed and shouldn't be scaled based on the
> request from dependent clocks. Doing so will result in the unexpected
> behaviour. So drop the CLK_SET_RATE_PARENT flag from the GPLL clocks.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ----
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
