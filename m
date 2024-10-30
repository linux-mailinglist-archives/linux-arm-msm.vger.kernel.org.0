Return-Path: <linux-arm-msm+bounces-36469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5E9B6A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787951C22A17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 17:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B44421A6FA;
	Wed, 30 Oct 2024 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThTJtD6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68821745E;
	Wed, 30 Oct 2024 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307533; cv=none; b=c0+yVoUF6Atg/KPa3reGIKwDSy0i35Kqj59jbGR1Q8iE5otoAAUfTsr9W5egAW2SYRpKWLJPmUoNXAou9YM0GLJnG90hjzJyBxSFc0zKSZubReMxLc9Lm9WcewLjxKG0kEsZhz5t6IHdWMGmhTFAQSNbPdCbPUZUBRU59nYyr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307533; c=relaxed/simple;
	bh=ZaNj72bHwwAgPrYGtNeBr2dlriKJWTyEW9RryZ6X9Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0jftW0n/ceL2gE0diQNRb+heoaTyJrCGmpKAJLbQTxSeabhMMMFevwsQ7YB4sReYJImhnvz06CooisoYlm9/eqQBbIgX1UpB2P7rBGYH3iWKGp151KBggLoEUB2KRCskAZwYr69xfGDmPVoPFXAm8N3BIl3wM8Gzsw0AO2zbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThTJtD6V; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a3a5cd2a3bso69755ab.3;
        Wed, 30 Oct 2024 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730307530; x=1730912330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSgEGqLSHYW5dJnL+akJvNntnbwcTcLxiNTHrobsiFM=;
        b=ThTJtD6VFpkxuTR7Ql0rZp4tZQA/KDkFD5UzJvMbPXAH2yfktUbo5Q/TRKENFftReg
         cJDZ32GdUs7yFjuPyFce+phj8ctR/+aM0EP581K0t0/K1BIWKPEXYR2hiGrI/dTKrf4+
         ARd872PbZ551kFlfBIWwMwiXcHAtYIgQsUxoxjdiBlSDxoFhVpWVRHlT3xYAgDeogr/t
         mPYIAhObsksslxjdCKT2LruBNbD17X3zn6/nsksceqOQTTBETvegRJi8rdNEyl6pRByF
         /xpG/rLSNgz7Xu8ku2TpIGSdUi55n6pxyH5y1MhX/gVgxq82FKKX8H2phPsJZrI9TYBx
         bTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307530; x=1730912330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSgEGqLSHYW5dJnL+akJvNntnbwcTcLxiNTHrobsiFM=;
        b=iKAoYClNQgNWI0DW6WhVyTMZDs9SNPXI0qR1e4m9sdJ2gxcEJARd5rF1oN8DVMYx1g
         TluCaPc5RWBXNGvtnGE5lE9vgsuIttN3FcnpBJFJemO9b60TXBNYkrg5Yvj/kCsZBqcj
         HEaQF+0Zii4YK8GQhir3H51fEtx9+Ue714fmnoIOBbCi6GgXRIlEdZSKf5CcjK1czPYx
         zMlSb4b1XiyLZdxMSR2z+9LzWg8SBiu2GsTzSvTjlq3ZWfyCM/ht3Kt4pLny4exm5isH
         YMyFJumm3m1x7rLACA2IOUE3X1qQjfKjH9BvIapBZFY22Rwj+36rjXo6RvUBC80AYcXD
         i9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVyPV+u8+UZB+SBcRYZBHZQVQ2kUrQDpACRHYq36f6VNE7M2VKLNJIkwkq5l592LgwdFwJNFoma4PSDJljD@vger.kernel.org, AJvYcCWT6tZBSa2nRsahlD9BtP3uc1sVSMkLY1Vq1jA5uJpQYFJbHAeAFWyeimn8PS/1n9n27fojN7OegdohTEdn@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXwpby+ErBld9fdUEo6QGnqfgRkd7+nQgZmTVPlWlAZrBaakb
	YcgQBOFo9wbh+EmtiCATc4utT4fp3S6JSnMTHB6K9jixsJRg6ZQqV7VOcH2SLN2ainjimtfR6In
	Mxcbxm5TqkugjOa3x9C2wwUCZ5lk=
X-Google-Smtp-Source: AGHT+IGmbmSXox8oAVQKBdxqprSBcxGpJ91Xocq6QrwRiJgePmhF7ve9q4dPiAMajWeQWmKzteD5uHeTwomcrUrLAXY=
X-Received: by 2002:a05:6e02:1a4e:b0:3a3:b4ec:b400 with SMTP id
 e9e14a558f8ab-3a4ed2df0f2mr181154985ab.17.1730307530123; Wed, 30 Oct 2024
 09:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com> <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
 <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com> <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
In-Reply-To: <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Oct 2024 09:58:38 -0700
Message-ID: <CAF6AEGvAYeY-fuk1Dg-0gsrod7Dy91qifKvChCd03=bs_zfs-g@mail.gmail.com>
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Robin Murphy <robin.murphy@arm.com>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org, joro@8bytes.org, 
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:23=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 30/10/2024 1:14 pm, Bibek Kumar Patro wrote:
> >
> >
> > On 10/29/2024 6:59 PM, Robin Murphy wrote:
> >> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
> >>> Add an adreno-smmu-priv interface for drm/msm to call
> >>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>> sequence as per request.
> >>>
> >>> This will be used by GPU to setup the PRR bit and related
> >>> configuration registers through adreno-smmu private
> >>> interface instead of directly poking the smmu hardware.
> >>>
> >>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>> ---
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 +++++++++++++++++++=
+++
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>   include/linux/adreno-smmu-priv.h           | 10 +++++-
> >>>   3 files changed, 48 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/
> >>> iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> index 6e0a2a43e45a..38ac9cab763b 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> @@ -25,6 +25,7 @@
> >>>
> >>>   #define CPRE            (1 << 1)
> >>>   #define CMTLB            (1 << 0)
> >>> +#define GFX_ACTLR_PRR        (1 << 5)
> >>>
> >>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>>   {
> >>> @@ -109,6 +110,40 @@ static void
> >>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
> >>>       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >>>   }
> >>>
> >>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool se=
t)
> >>> +{
> >>> +    struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>> +    struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>> +    const struct device_node *np =3D smmu->dev->of_node;
> >>> +    struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>> +    u32 reg =3D 0;
> >>> +
> >>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
> >>
> >> These conditions aren't going to change between calls - wouldn't it
> >> make more sense to conditionally assign the callbacks in the first
> >> place? Not the biggest deal if this is a one-off context-setup type
> >> thing, just that it looks a little funky.
> >>
> >
> > Let me know if you want to pursue this still.
> >  From the current PRR implementation in the graphics
> > vendor layer, this seems to be just setup kind-of thing.
> > Also if we keep this conditional check before assigning callbacks,
> > and vendor layer caller won't be having any such check,
> > wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or
> > !qcom,adreno-smmu)
> > as the callbacks won't be assigned?
> > So as per my understanding I think it would be safe to keep the
> > condition check here?
>
> Like I say, it makes more sense to me personally if SMMUs which don't
> have a PRR don't offer a callback for setting the PRR which they don't
> have, and for it to be the caller's responsibility not to call a NULL
> callback where they wouldn't need to call one anyway. But the
> adreno_priv interface is kind of Rob's thing, so I'll leave it to his
> preference.

We can go the route of NULL cb if it is not supported (but should make
note of that in the adreno-smmu-priv.h header comment)

BR,
-R

> Thanks,
> Robin.

