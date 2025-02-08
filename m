Return-Path: <linux-arm-msm+bounces-47232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B187A2D5D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 12:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DD2167D82
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 11:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6371A3175;
	Sat,  8 Feb 2025 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="nnILzhku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12514EC5B
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739015297; cv=none; b=ulQ7UIMdn8MQEruFOubwJOXM5QFRkkS1t5E4vGA5+gU/V3273Qze6HyqzVbPOruD9N35ZOLpgC3K2sDdXVZLpkkGcTOmOJfQBRlHN1+vlPWoF7nHg7T1F8qpUydt4xXgw1fDNctbWIjYRBPJPxDkwvYKXRxRVHu6bUa3+euIVrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739015297; c=relaxed/simple;
	bh=787HLahI1gR3pxHVdvg6VbZ+r5+hu0/XsUcLMYmKGo4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hff5HoioNpHe6EG/6RZfyTd0DTV7/BHFLcWHG4/isuzGtzCWcBNetvjcFvaMirbiGRXCIplge2Q/mhXQWSagB4tqF0aQHZFM+HarsHpTb2eJjA4fJggQ9h8kTsth69qLtlarV+ufYuz2a5ozYn+yQ883PlWCviGpSRCxqGcbTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=nnILzhku; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1739015285; x=1739274485;
	bh=fqXGb4xkbpQ0L35eAF1vg2qfe+5RtceymN/yB4WQDN0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nnILzhkuR3Aq8k6D0K4iPC2REP17wtmxD9xpNgpDGPYQGSVnSjWs94Lkq4sQWxHJM
	 pERual5Vr+52zkCnaZzU5V9X4MrUDkkNKHTbudZdjfxBNl5g4u03JdF5RaKRSLvTYK
	 eDo4jLkhcID07xVDCyRWGivjT9270CVDBHenTJ05L7tQlIqMLEN3godz9qricy1XTd
	 g9q5ApIV8A0B+ORGwcSM/x++403Psc01rIVihbmTA+d459ZHz+VbfY5IEQ1VlGMnBE
	 EwcBg/yiE+SV6duFtusRO19RDwLUVTFrXBXTMmFTkG86TnfWNbooR2y3msbcZ1gy+N
	 ncPWmsRrh0Zhw==
Date: Sat, 08 Feb 2025 11:47:59 +0000
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>
From: Sam Day <me@samcday.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Avoid accessing BAM_REVISION on remote BAM
Message-ID: <D7N1GSRWCLS1.1EZM4HWUDSE75@samcday.com>
In-Reply-To: <20250207-bam-read-fix-v1-1-027975cf1a04@oss.qualcomm.com>
References: <20250207-bam-read-fix-v1-1-027975cf1a04@oss.qualcomm.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: fb3c4aa22d5d73dc3fdabfd7684db8b96e20f2fd
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Fri Feb 7, 2025 at 9:17 PM CET, Bjorn Andersson wrote:
> Commit '57a7138d0627 ("dmaengine: qcom: bam_dma: Avoid writing
> unavailable register")' made this read unconditional, in order to
> identify if the instance is BAM-NDP or BAM-Lite.
> But the BAM_REVISION register is not accessible on remotely managed BAM
> instances and attempts to access it causes the system to crash.
>
> Move the access back to be conditional and expand the checks that was
> introduced to restore the old behavior when no revision information is
> available.
>
> Fixes: 57a7138d0627 ("dmaengine: qcom: bam_dma: Avoid writing unavailable=
 register")
> Reported-by: Georgi Djakov <djakov@kernel.org>
> Closes: https://lore.kernel.org/lkml/9ef3daa8-cdb1-49f2-8d19-a72d6210ff3a=
@kernel.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..d42d913492a8 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -445,8 +445,8 @@ static void bam_reset(struct bam_device *bdev)
>  =09writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> =20
>  =09/* set descriptor threshold, start with 4 bytes */
> -=09if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -=09=09     BAM_NDP_REVISION_END))
> +=09if (!bdev->bam_revision ||
> +=09    in_range(bdev->bam_revision, BAM_NDP_REVISION_START, BAM_NDP_REVI=
SION_END))
>  =09=09writel_relaxed(DEFAULT_CNT_THRSHLD,
>  =09=09=09       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> =20
> @@ -1006,8 +1006,8 @@ static void bam_apply_new_config(struct bam_chan *b=
chan,
>  =09=09=09maxburst =3D bchan->slave.src_maxburst;
>  =09=09else
>  =09=09=09maxburst =3D bchan->slave.dst_maxburst;
> -=09=09if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -=09=09=09     BAM_NDP_REVISION_END))
> +=09=09if (!bdev->bam_revision ||
> +=09=09    in_range(bdev->bam_revision, BAM_NDP_REVISION_START, BAM_NDP_R=
EVISION_END))
>  =09=09=09writel_relaxed(maxburst,
>  =09=09=09=09       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>  =09}
> @@ -1199,11 +1199,12 @@ static int bam_init(struct bam_device *bdev)
>  =09u32 val;
> =20
>  =09/* read revision and configuration information */
> -=09val =3D readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> -=09if (!bdev->num_ees)
> +=09if (!bdev->num_ees) {
> +=09=09val =3D readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>  =09=09bdev->num_ees =3D (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
> =20
> -=09bdev->bam_revision =3D val & REVISION_MASK;
> +=09=09bdev->bam_revision =3D val & REVISION_MASK;
> +=09}
> =20
>  =09/* check that configured EE is within range */
>  =09if (bdev->ee >=3D bdev->num_ees)
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-bam-read-fix-2b31297d3fa1
>
> Best regards,

Thank you, this fixes the early synchronous external abort in
bam_dma_probe on my msm8916 device.

Tested-by: Sam Day <me@samcday.com>

Regards,
-Sam



