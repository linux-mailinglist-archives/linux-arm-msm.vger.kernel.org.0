Return-Path: <linux-arm-msm+bounces-75736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C6BB224A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA99C179E74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC551339A4;
	Thu,  2 Oct 2025 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="X5Ycs8Om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2701DFF7;
	Thu,  2 Oct 2025 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759364637; cv=none; b=Z4YdwENlr5vg5ggYyjvB1WGH+x0CHtYR0t49lLVsOFlM/zrSbg+uglxUBWJwF0ESM6K4iLU2U/vpsDemz8eVcBv2hq32S/m5fSmbHKVYTaXaqdxEgorky/3q/IM5eSttksYzCYl74QNlMBTy6pEzdvS8ZFoLlLZsrOjk4v/q6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759364637; c=relaxed/simple;
	bh=Sdb1+wtHZb+FPfadxxqZAuDijR/adSPjWxuLJEkTF2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0e1zeOIMhiLtJubNpVfBw55ksI1X8c2PpPbfSbFTiz2cv1ieCpiH+HdZjXt/GytAgrnpoSm3LM9mqrPLAo6sfjpOssHhEUzU7sVgV9pzUF1n2JMVlxVZ9k9JFrJqxQGSpJHt00hTGd5vv/R5KJvhOR7ZckcmPNlVE0mmddOm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=X5Ycs8Om; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1759364625; x=1759623825;
	bh=KfALADPRY43GntF4MFm9RPEBQIOEJYHeDbUmR9+DFyg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X5Ycs8OmuzOmS8Z0lk98QzCKzedcDfdrmuSUzaQ7tgp/Ll4l6EoiCKQFAFAvDi8Ek
	 CgLCvFgSpCqj5Xyq33Hy01XlP8Jkr4gYdPBtpxaWR7jDmykvocrZVOjhOTlXOuLIbF
	 5KGdhT6Y9norZdoe5IlC2C8u95zOaOfx+54YlSpchczxj1wMbd6ornRNjnG/dEhFyi
	 aV9Ms5QHE4CmXxOcTqSx8U2lPI6Ti2McHjTlby2sWAI0QUPI0jwgfLpHdDk9mH+5NL
	 PcYluYMvkfOYoH3ego95/ejfKGB7mLMZbZILheZoWBq1Exw+Ely4EC6i+vhWk0vmVv
	 N2RJ+ZkB7dyww==
Date: Thu, 02 Oct 2025 00:23:37 +0000
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <d31e4bba-5438-480b-8d3f-229ac5b4ddf4@nxsw.ie>
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com> <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: d642a5663908cbe0fc7d6de3975240d510a45876
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/10/2025 12:38, Abhinaba Rakshit wrote:
> Scale ICE clock from ufs controller.

UFS

>=20
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed93=
99cc02d37b5229a 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypt=
o_profile *profile,
>   =09return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key)=
;
>   }
>=20
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale=
_up)
> +{
> +=09if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> +=09=09return qcom_ice_scale_clk(host->ice, scale_up);
> +=09return 0;
> +}
> +
>   static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops =3D {
>   =09.keyslot_program=09=3D ufs_qcom_ice_keyslot_program,
>   =09.keyslot_evict=09=09=3D ufs_qcom_ice_keyslot_evict,
> @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs=
_qcom_host *host)
>   {
>   }
>=20
> +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, boo=
l scale_up)
> +{
> +=09return 0;
> +}
> +
>   #endif
>=20
>   static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -1636,6 +1648,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba=
 *hba, bool scale_up,
>   =09=09else
>   =09=09=09err =3D ufs_qcom_clk_scale_down_post_change(hba, target_freq);
>=20
> +=09=09if (!err)
> +=09=09=09err =3D ufs_qcom_ice_scale_clk(host, scale_up);
>=20
>   =09=09if (err) {
>   =09=09=09ufshcd_uic_hibern8_exit(hba);
>=20
> --
> 2.34.1
>=20
>=20

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


