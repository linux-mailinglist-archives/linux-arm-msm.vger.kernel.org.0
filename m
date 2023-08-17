Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E240C77EE80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 03:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbjHQBB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 21:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347384AbjHQBBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 21:01:25 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7AA271E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 18:01:24 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-34b0f3b792dso1162365ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 18:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692234084; x=1692838884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBPzqaP5DfSy9q7dC4AwA+Rsr/csT2NvsA7E32jUJuA=;
        b=QGnJcmg1M+N/dT923UTrS1eGYdpA3rFOCMdbqNUxkcSOLh9Z4WRuJL+ygkC5SoQDov
         4zZspO8ijqOPwC4Y6q+AyRUMTAbgTZtEuF5+hFwsA2mStm3suhBdkQcjgxgMNXcKFzFY
         cP5BIXlhRaSD2k5PwrPxxuKZCf4Ar7X6RBtLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692234084; x=1692838884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBPzqaP5DfSy9q7dC4AwA+Rsr/csT2NvsA7E32jUJuA=;
        b=Dgap7wmHlXE9C2cI1nRdvNq+kxGkC0MXhp1b+nx8j151uNL1OyDTM8UyZwtAbdgJ2h
         eOXk+Q7BMs7nuqjVqYxG8yGioWtb9oSr+p5XJNasjsDiCxODhEw11wcUqrD5ojWIDz+a
         NBQJNGEaw7gsTIIlEonaYHUuT1Sia2+59Yrnl0EuleQsaY3SE03NtTSojx0fkWxqtuWV
         /lA0o4kx4FLt9Wpe0XidXjVO02eVdruupZVInUGOQ0yqI4RXCpERW5HI2zvrhczAAu1k
         CPIvmuqmx6PquZ4LQ1NAbzIvRxdk32UYaIMcE93h0Xx35Z/TiFP0FS3PFZ2QkRCzpHYo
         aBWA==
X-Gm-Message-State: AOJu0Yy/0XJGYxy13JH1J4vuDvnAb0DvEwuy/l4uvTvNUTaRxz6a+VH+
        zaPxvL8spF1fL/+aCkJSxRfp7KA1Hl8eBtXvzb/CL/Lsv0xY3v0W
X-Google-Smtp-Source: AGHT+IEo14MBJ7bucS0gCKsBBraoOjjpAOGAUF/QzHhj9Y32H9nyJ2x0B+77O/LnjzTJw8GGAEHN/dUcgLJ7WpUdn+k=
X-Received: by 2002:a05:6e02:1a6b:b0:349:191:af05 with SMTP id
 w11-20020a056e021a6b00b003490191af05mr5442592ilv.16.1692234084205; Wed, 16
 Aug 2023 18:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230816225509.11070-1-quic_aprasann@quicinc.com>
In-Reply-To: <20230816225509.11070-1-quic_aprasann@quicinc.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Wed, 16 Aug 2023 18:01:13 -0700
Message-ID: <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
To:     Aravind Vijayakumar <quic_aprasann@quicinc.com>
Cc:     will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
        dmitry.baryshkov@linaro.org, quic_bjorande@quicinc.com,
        konrad.dybcio@linaro.org, quic_eberman@quicinc.com,
        quic_psodagud@quicinc.com, quic_rvishwak@quicinc.com,
        quic_saipraka@quicinc.com, quic_molvera@quicinc.com,
        marijn.suijten@somainline.org, mani@kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 16, 2023 at 3:55=E2=80=AFPM Aravind Vijayakumar
<quic_aprasann@quicinc.com> wrote:
>
> The driver_data is NULL when qcom_adreno_smmu_init_context()
> is called before the dev_set_drvdata() from the client driver
> and is resulting in kernel crash.
>
> So add a null pointer check to handle the scenario
> where the client driver for the GPU SMMU device would
> be setting the driver data after the smmu client device
> probe is done and not necessarily before that. The function
> qcom_adreno_smmu_init_context() assumes that the client
> driver always set the driver data using dev_set_drvdata()
> before the smmu client device probe, but this assumption
> is not always true.
>
> Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index c71afda79d64..5323f82264ca 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>          */
>
>         priv =3D dev_get_drvdata(dev);
> +       if (!priv)
> +               return 0;

could this -EPROBE_DEFER instead, or something like that?  I think you
patch as proposed would result in per-process gpu pgtables silently
failing

BR,
-R

> +
>         priv->cookie =3D smmu_domain;
>         priv->get_ttbr1_cfg =3D qcom_adreno_smmu_get_ttbr1_cfg;
>         priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
> --
> 2.40.1
>
