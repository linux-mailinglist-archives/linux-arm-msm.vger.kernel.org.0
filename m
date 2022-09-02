Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C024B5AA78E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 08:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235325AbiIBGDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 02:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235336AbiIBGDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 02:03:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8B0AC26A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 23:03:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bt10so1856078lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
        b=ZJoMUA0CzdUCYA4eJRyo7DLyyhB/Fsx8fQ/GFLCh3ehKhSFwb/l1+9+I/EHCI+Cvld
         MJC6IuSNfQDxJ99OsIpA30LS8c+Lcxw8jSJCfrt9ptEKsRMfUZK5U1lv+Tjz7vG6b5WE
         QwqDKqiWwAF+SY64GT9dbsqM3favzq0dY/2r/OfYAE7MNQ+jiOS/+rL3xTTiG04xjAQQ
         LzjVd26yukIxs6G/z6BHddJkQ2KTB2G/17iWSxrRYUV/7f1v50FKCeIv1pBzgN88lTaC
         ytZ+0ViLmyLQ8kM2bg6lSHa+IzL4+KIBVZls/jEX6WZMY2zstIbGAtnmFUDFoNkGLoHu
         3TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
        b=UYq+k67apQ+lIuejRNal8FNCZ8W9P9hsWYs6iOETZPhrl4JKxXIYdozGN0Izosvkpp
         ylcJiFRZkdGJiLV1j/2cak+UnR8cGWRCGeleiZhjIawmvW28gptVMfc9+yWM6Tp+Te3V
         eOV557qTbio+na3wW8h+Q/U2hdGBvYBdCC7qt3PZG95f0U9XB/EW2hejtN6pqlFNWhyX
         aLipYg15naPaLug2e4lrKiutWYjFntldULIne+iCepvQ7zFOoK5VOEmG3KokfRb+tu36
         LrRSROoyvhUnDTkCxhgX3Ys4vPty+14Wg1817ovH4BJVj+1CJKEWaKABOrtBAkq3nqqf
         hz6w==
X-Gm-Message-State: ACgBeo3PGyaU1A9w62QOSdKNPOn8/GBIjftmxFXg1ADBrRUIZAWC2/5+
        PWID7B3/nfNfwXqMdwp95DrmNQ==
X-Google-Smtp-Source: AA6agR6NPHOKfoGhpIWRmH8tuIUycivkQLTgGb6ER/1vjV/cqczRuQqHyi2K0W/l4IGo+q5iOOo0HA==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id i8-20020a056512224800b0048af8f93745mr10821431lfu.256.1662098584229;
        Thu, 01 Sep 2022 23:03:04 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ac09000000b004949761d330sm135634lfc.128.2022.09.01.23.03.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 23:03:03 -0700 (PDT)
Date:   Fri, 02 Sep 2022 09:01:56 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_2/4=5D_drm/msm/dpu=3A_move_re?= =?US-ASCII?Q?source_allocation_to_the_=5Fprobe_function?=
User-Agent: K-9 Mail for Android
In-Reply-To: <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org> <20220620213054.1872954-3-dmitry.baryshkov@linaro.org> <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
Message-ID: <24DFFDD8-955B-459B-B9C7-06BFAB32F817@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2 September 2022 00:37:30 GMT+03:00, Abhinav Kumar <quic_abhinavk@quici=
nc=2Ecom> wrote:
>
>
>On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>> To let the probe function bail early if any of the resources is
>> unavailable, move resource allocattion from kms_init directly to the
> allocation

Ack

>> probe callback=2E While we are at it, replace irq_of_parse_and_map() wi=
th
>> platform_get_irq()=2E
>Any specific reason to replace this?

Yes=2E To use generic API rather than the OF-specific unusual function=2E

>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>With those two addressed,
>
>Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec | 62 +++++++++++++---------=
---
>>   1 file changed, 32 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms=2Ec
>> index ae13a3a5d8a5=2E=2E756be04d804b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> @@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	struct device *dev =3D ddev->dev;
>>   	struct platform_device *pdev =3D to_platform_device(dev);
>>   	struct dpu_kms *dpu_kms;
>> -	int irq;
>>   	struct dev_pm_opp *opp;
>>   	int ret =3D 0;
>>   	unsigned long max_freq =3D ULONG_MAX;
>>   -	dpu_kms =3D devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	dpu_kms =3D to_dpu_kms(priv->kms);
>>   	if (!dpu_kms)
>> -		return -ENOMEM;
>> -
>> -	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> -	if (ret)
>> -		return ret;
>> -	/* OPP table is optional */
>> -	ret =3D devm_pm_opp_of_add_table(dev);
>> -	if (ret && ret !=3D -ENODEV) {
>> -		dev_err(dev, "invalid OPP table in device tree\n");
>> -		return ret;
>> -	}
>> -
>> -	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> -	if (ret < 0) {
>> -		DPU_ERROR("failed to parse clocks, ret=3D%d\n", ret);
>> -		return ret;
>> -	}
>> -	dpu_kms->num_clocks =3D ret;
>> +		return -EINVAL;
>>     	opp =3D dev_pm_opp_find_freq_floor(dev, &max_freq);
>>   	if (!IS_ERR(opp))
>> @@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	pm_runtime_enable(&pdev->dev);
>>   	dpu_kms->rpm_enabled =3D true;
>>   -	priv->kms =3D &dpu_kms->base;
>> -
>> -	irq =3D irq_of_parse_and_map(dpu_kms->pdev->dev=2Eof_node, 0);
>> -	if (!irq) {
>> -		DPU_ERROR("failed to get irq\n");
>> -		return -EINVAL;
>> -	}
>> -	dpu_kms->base=2Eirq =3D irq;
>> -
>>   	return 0;
>>   }
>>     static int dpu_dev_probe(struct platform_device *pdev)
>>   {
>> -	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
>> +	struct device *dev =3D &pdev->dev;
>> +	struct dpu_kms *dpu_kms;
>> +	int irq;
>> +	int ret =3D 0;
>> +
>> +	dpu_kms =3D devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	if (!dpu_kms)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> +	if (ret)
>> +		return ret;
>> +	/* OPP table is optional */
>> +	ret =3D devm_pm_opp_of_add_table(dev);
>> +	if (ret && ret !=3D -ENODEV)
>> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n")=
;
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to parse clocks\n");
>> +
>> +	dpu_kms->num_clocks =3D ret;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "failed to get irq\n");
>> +
>> +	dpu_kms->base=2Eirq =3D irq;
>> +
>> +	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
>>   }
>>     static int dpu_dev_remove(struct platform_device *pdev)

--=20
With best wishes
Dmitry
