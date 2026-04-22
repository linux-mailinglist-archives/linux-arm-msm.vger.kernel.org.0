Return-Path: <linux-arm-msm+bounces-104138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cODTNTHm6GkHRQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:16:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDE447BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A432301CEC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783D51E0E14;
	Wed, 22 Apr 2026 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JOKazJ6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E473148B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870932; cv=none; b=mM9bdXMtO2zil2YjKI3f2xhvDWUtNWWYhsZrPQ2QAJEPNfeUynlO//KzLZ9YBgy51+JnUEO4PGZ/AcWCBC4cEHlAyZ9rb+dZMULeBQ0oxxhjo0RFGpz4zFsVYFroRJL3LAS2vRbKJgdORims8TmXbcr3tpX6pcjDhNayhKqK0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870932; c=relaxed/simple;
	bh=sHNqh4ED7ri+md+IpvU9rdyr82PR7DeT+0YsgFMyNZg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwACoVgn8DxWl6I91aqdNDpEw4YTTN4dQZCUH+GB3K++WN79p6jQ9uXkWyFiLYSlhE9FfzcSD3EIsnKOb36Qg6cmEiWgYBiYHx/rFo3c74G/djL3VYtlLgRi2ECCgZL3aOcssLbGzBh2wenGFh/FhxYnN5qJcGiQmKfNyKpJXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JOKazJ6Q; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776870922; x=1777130122;
	bh=l6+PqlJB6HASuTZjBIQFQZe3Akfa9hmumLUXf6H6UhU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JOKazJ6Qrt3IcKfOCJ2R+puLhsuG0PS9wbKU6oiY83W/8/iZQf0287hjj7TlFSrJe
	 popq7DENBYUch/7vHE4uR4G9UFTmt6uRkYXkLbTEvEf13bQpiALW8WVrDcZF5o4rZT
	 QiaG5yd7FNm184NDVWJMNl2lr5GRPH4jfnNC+4je50SjZB6N6YkoYNXnzUMCKwzYGH
	 8OGy3N/FAveAzRZauHeJdRHJ8Uk8cboZS8Eo1yU0zGJywuMydVc9ike5Iu6X5t/eD6
	 pVYHvOPmZBJahqtVQexPpUR+B0zRFiOqDymaRTFUQexgpNDacVD2mgrXoZsD0Xs+gu
	 3YDspHvM5QvrQ==
Date: Wed, 22 Apr 2026 15:15:17 +0000
To: Alexander Koskovich <akoskovich@pm.me>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices in one packet
Message-ID: <9vOWCBGQu4kqkzUaF1cAimiRnCHzd7NAjB98ZcmVygN9kNr7G2H-UzhkQfyiDlaj7G6wxWqKlGvAprsMtVE-P2erdkutRN7LuO1GQBOSzH8=@pm.me>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me> <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fd442c31505b96e580cd2d83842a4670e0592a66
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-104138-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E2FDE447BFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 18th, 2026 at 5:58 AM, Alexander Koskovich <akoskovich@=
pm.me> wrote:

> The MIPI DSI v1.3 spec defines two modes for transporting compressed
> pixel data: one slice per packet or multiple slice widths in a single
> packet (Section 8.8.24 Figure 40).
>=20
> Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
> set to indicate that all DSC slices for a line should be packed into a
> single packet. When unset should default to 1 slice per packet.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 3aba7b380c8d..d3ad8c5d3ebe 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -138,6 +138,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(s=
truct device_node *node);
>  #define MIPI_DSI_MODE_LPM=09=09BIT(11)
>  /* transmit data ending at the same time for all lanes within one hsync =
*/
>  #define MIPI_DSI_HS_PKT_END_ALIGNED=09BIT(12)
> +/* pack all DSC slices for a line into a single packet */
> +#define MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT=09BIT(13)
>=20
>  enum mipi_dsi_pixel_format {
>  =09MIPI_DSI_FMT_RGB888,
>=20
> --
> 2.53.0
>=20

If there are no objections, could this be merged?

Thanks,
Alex


