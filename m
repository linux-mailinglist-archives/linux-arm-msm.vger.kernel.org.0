Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22ACD649D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiLLLJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiLLLIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:08:00 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEDD120A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:58:13 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id g14so8110906ljh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KKDIIwC0muGe5b+qB8UELuXYDs0YM6jtOaRVfXtdpWw=;
        b=QOLjn72Kyxy4sxjiGDDxScP1UNkxBkF/8M/iTlnmW53PXHpKIentX3q0/wZTxyOcL+
         LWWFQmSQ/jHKGsOKJDF3AS8Ixt+S66Ny20pkwmaRVUshFxiyC1LouYWzmYgS5BVZIOwI
         aVIKObaeUnCuwM1wZTwmrW1NSGUgS/yEVmI0FXENm8UZ3Cz4883O3d97LMUf8U3nYHKH
         B6zN0vhFeShJVvWP6Oi/6xy2hD6cDwSOlgTChTCyNcSG5lDRdTXpKxXlrGCjc0YjNmsj
         9lldmF9Zct/sKxilY3U3y7fk6Osfpf8l84XNBtzlUS1fmLOBgtcwlNWjNTG0GbxuQTFy
         COjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKDIIwC0muGe5b+qB8UELuXYDs0YM6jtOaRVfXtdpWw=;
        b=2fd+F2e6wim0O+aXe07dGJxaNeTNbl+d625mLfoKGIn3upO9slnny1H4Fs/2b6K1fB
         zn+UYLTHLUBq5s7Q8DjBaab/W20QKxjHbwpX8zkqwLKByeb/mP5QZUE2w9k5U5WRda0w
         wz2bDCgmMLjn3w30gzrkP5ILMdXczlwjm7C+q+GPDONz89OW2flCjyqV1lZ0XSG+J3TF
         mFqhnvJVDNVzI30pOH7xYIhG7ijxsM5kV+kusIvPNVyRZis9N9vBnNJwZR/yMkOSmttj
         d0pvDRCy/NgbihzmoKtfA3A1voPZs4NNW49NMeM6L/fnXOg/hWj8HvG7BVAMqZ5obSGk
         NjPQ==
X-Gm-Message-State: ANoB5pmQUJMv4vyKOR2+hCapbVVUeW69vtnTt5DScv8JloQy9/PV2CT1
        XM5lTAp3w/q9qPhcaM0OsI5eZA==
X-Google-Smtp-Source: AA0mqf5Lzb3ZKCF/89HxYr7XxLLhyljEIA7mBJvEm4UjPpNzQi6ngb2mpoJc/FYKG3ddZZ8lt/tZgA==
X-Received: by 2002:a2e:3619:0:b0:279:c6bf:f3d1 with SMTP id d25-20020a2e3619000000b00279c6bff3d1mr3458812lja.33.1670842691686;
        Mon, 12 Dec 2022 02:58:11 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.102])
        by smtp.gmail.com with ESMTPSA id b13-20020a2eb90d000000b00278e9c0d3a2sm1183017ljb.33.2022.12.12.02.58.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Dec 2022 02:58:11 -0800 (PST)
Date:   Mon, 12 Dec 2022 13:58:07 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
CC:     marijn.suijten@somainline.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8150 DPU compatible
User-Agent: K-9 Mail for Android
In-Reply-To: <20221212100617.18190-1-konrad.dybcio@linaro.org>
References: <20221212100617.18190-1-konrad.dybcio@linaro.org>
Message-ID: <552EFDD5-4BBE-408D-90EA-C96F4A0876B7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12 December 2022 13:06:16 GMT+03:00, Konrad Dybcio <konrad=2Edybcio@lin=
aro=2Eorg> wrote:
>From: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>
>Add the SM8150 DPU compatible to clients compatible list, as it also
>needs the workarounds=2E

Please rebase on top of linux-next, this part was rewritten=2E


>
>Signed-off-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg>
>---
>Depends on the binding here:
>
>[1] https://lore=2Ekernel=2Eorg/linux-arm-msm/20221212093315=2E11390-1-ko=
nrad=2Edybcio@linaro=2Eorg/T/#t
>
> drivers/iommu/arm/arm-smmu/arm-smmu-qcom=2Ec | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom=2Ec b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom=2Ec
>index 6610f5d2877d=2E=2Ecd74c1efcfde 100644
>--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom=2Ec
>+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom=2Ec
>@@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
> 	{ =2Ecompatible =3D "qcom,sdm845-mss-pil" },
> 	{ =2Ecompatible =3D "qcom,sm6350-mdss" },
> 	{ =2Ecompatible =3D "qcom,sm6375-mdss" },
>+	{ =2Ecompatible =3D "qcom,sm8150-mdss" },
> 	{ =2Ecompatible =3D "qcom,sm8250-mdss" },
> 	{ }
> };

--=20
With best wishes
Dmitry
