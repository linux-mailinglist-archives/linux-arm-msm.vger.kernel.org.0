Return-Path: <linux-arm-msm+bounces-39286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AC9DA543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BFEBB253E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91143194C65;
	Wed, 27 Nov 2024 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LmzqJbUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D4140360
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701689; cv=none; b=Abv4pGq/rwUQ1b+fvEVcHcZmrZyo4kWhSJNpm3mis0INrozqzLaziSR73NFsrrbu8RQY4QFgot6l67aGpJNXrIEeABZK23+dfhQBKpaXFGJqU5zdaNeD1ictLPYSfsBMPv1XIXAVg3koQs3W/W9BGveEQBkxVbn2I0A+KmMO1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701689; c=relaxed/simple;
	bh=XLqDgnp1yFVfiWlR0GrEdX6R1DH7mcqwN+wz0NdDyxI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uCgcPAXt6kjPnIe5cB4Sne9qSZjhRxEjpSJ94efK5CImDM6VYZ93TabYseTpLB9FHuBTQJxCLaTlea51VjmNEzckJWhqiHzYxfSLjUtjBsO9RPDxoDCKYK9A94H5SCJM4bfMayiL6LRQttVU0M0iRT+o8fTtTEtG+fPHKbWPKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LmzqJbUy; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1732701678; x=1732960878;
	bh=66P6ggnYeUDi/EHridzX7Z1/9E0H/USpV0AUC5vD4tM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=LmzqJbUywCErzTGhj54FWK8gD4rOhgrgTmcjSBGz8GMCRZkKTfTKpocNJOfqCXC5J
	 +F5j5rj8Fzdj7vL18KLSvL1OrDlmG6NvT+9ebXc1vbujBGT422J3qHqrrhtU9yX88M
	 TyZEiU7AXCCliFKO2OI2YesgirZ0EKbgi9gIZB+BKR999bMp9SWejVtBa6cc2Ax96e
	 YSS4xhK2PE65Hw5W7Mb6XOYUK//3bGUliSga+3GGE7Z5Ns1+Xnn3dbOyvXVYbxjtYn
	 nZrD7GFZ/kHFHR0yqkPdJju6NORiQB9inLxtBT3TnkWXf8/DP63oYNcPvsRPO26cmV
	 hTy1cbYFpBfJQ==
Date: Wed, 27 Nov 2024 10:01:14 +0000
To: =?utf-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
Message-ID: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 8c1afbd59a123533d50dfe030e9f085bca306614
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/11/2024 5:06 am, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> Fix NULL pointer check before device_link_del
> is called.
>=20
> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/pm_=
domain_off where applicable")
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
> ---
> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> change-id: 20241122-vfe_pm_domain_off-c57008e54167
>=20
> Best regards,
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea=
263c84d851c8a31 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>    */
>   void vfe_pm_domain_off(struct vfe_device *vfe)
>   {
> -=09if (!vfe->genpd)
> +=09if (!vfe->genpd_link)
>   =09=09return;
>  =20
>   =09device_link_del(vfe->genpd_link);

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>



