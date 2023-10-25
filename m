Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2927D6585
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjJYIpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjJYIpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:45:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F174116
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:45:29 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso80317361fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223527; x=1698828327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lz4GBEe2iYd2hPiUbHjNhJfJE8hAsaCc8WBmk1URiJY=;
        b=b7rhufxxmcb94qp3i2N35UWGm/z6Xl42Rl8pQWlvmy155jjhjEEfHwrPfFkOdOPOtA
         T+iOduuURmv4p3C7bmcz05q7D7AHR0pOi8PyPuv0U7CXTpX6Zr+sFHrzamyTQv1lY4jh
         FquSufL5cluBloDJI3LyJ2WYYIge1M+cvauTtfTs68U05MFWZ5H2Msy+I6NQz9W17B86
         8K1/Rh1BflYCUA7ATD3Knznog8BNGtaTOzVYEskfnV7+JxBObbx9l83c7ud57/N0YUwG
         54qTrCEYDlx5JrVTTiyOhDV1dgQ2hiGvP1UIuZtlehZ1P1wl0OS8tA7HhLtp9uSs3svJ
         gG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223527; x=1698828327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz4GBEe2iYd2hPiUbHjNhJfJE8hAsaCc8WBmk1URiJY=;
        b=cYeToEK/2Pc4eDwL2Db1N28u1kBATvud460OHgN29nGlcXM8ldTQcITCFirovZQ2uQ
         qh3ez21Plyu2TVzSNhB4LjnER/wCoaqt6VZbIHweoftQArjzT2CpQipUD55TdeG5gZFM
         y+CvmXGzm3Nq6m3klMZZcXd9G3eW5iTEK3wn/+JV44CWHOtQ/GuoUleOJX3DSFH1zRgr
         1h1lR49GhjbsSQ1NFGVWCCMFsbMn+XO4UwLyNJG4xrYUirpBamMVNkSoY2r9yBd9nh5h
         HlMXiEkJupgljX+LYwt8vQnHDComeG/OeXLhKupm6awhZWkMiiQ/eqAz99k3WAWtfY17
         Ekeg==
X-Gm-Message-State: AOJu0YxCsOeP2z7jf2nEzFVTjvwQ1Hk2U0mXpEVSOFZQtgElcGI3OxIg
        nRlz2mHnT/nfqNfBaxtjfEym9Zd3Z95lDZn/BW8=
X-Google-Smtp-Source: AGHT+IHRs8ioYUF0uiv43OgYZEf/cTRv3dTA9nQGwcK/q3lIqgD/wBvpiIIeY+3yK3L3jwhMQp7voQ==
X-Received: by 2002:a2e:2e06:0:b0:2c5:cac:e9a3 with SMTP id u6-20020a2e2e06000000b002c50cace9a3mr10482614lju.52.1698223527595;
        Wed, 25 Oct 2023 01:45:27 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p13-20020a2e9a8d000000b002c5122f13b8sm2320875lji.30.2023.10.25.01.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:45:26 -0700 (PDT)
Message-ID: <4d6b8e54-8ec2-4774-9a7e-881af58093e2@linaro.org>
Date:   Wed, 25 Oct 2023 10:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] clk: qcom: add the SM8650 Display Clock Controller
 driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-8-c89b59594caf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-8-c89b59594caf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 09:32, Neil Armstrong wrote:
> Add Display Clock Controller (DISPCC) support for SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

> +static int disp_cc_sm8650_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	regmap = qcom_cc_map(pdev, &disp_cc_sm8650_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
need to clean up RPM

Konrad
