Return-Path: <linux-arm-msm+bounces-67760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9578B1B117
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783FE3A31D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563741F5858;
	Tue,  5 Aug 2025 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOeHHveG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE99946C;
	Tue,  5 Aug 2025 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386407; cv=none; b=u0OmcGKI3LXP3VRyym3+3giGUOV+Ep5ApbkULJ/UyWinEcLHkE8nSGtnTGIOcZY6UATQ/gqKZXmlqMeKBk2351AynluN39OsKQAygKJavYTIwa9027SFWbFYgsEk2LUBVZiw73sXHc9QIpBvTcg7LXSbOV9mLN68hmoER8fwGqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386407; c=relaxed/simple;
	bh=skyxs9Z4sBhwoUDir0xa89YmAZ3DZFZzARtZtVKT9nY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PEf8rftsmbcgmD3H5vCvquIdBD0DB9+yDRbB2VfDZUndCqkwpMWlBYqXzK5ZGMC2iUB3hRgsyov36y/5ab3AZ2joz/6mcZ9q+/6TkuI2Obg/dxyd3TWKy4LM5chRikzLzF/LRbt+rui8eylAm6UMfWdovLC8kRnwrtOnKIPiOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOeHHveG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C675C4CEF4;
	Tue,  5 Aug 2025 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754386406;
	bh=skyxs9Z4sBhwoUDir0xa89YmAZ3DZFZzARtZtVKT9nY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qOeHHveGFku077OzUZ+BrjD3TfvDv5KQFpbJDXspG+4tSuPKU3/NqKVDdbvGwfAwf
	 hOTlh7D0pbRVNRYo8w4GxLmMjJR0RETinJK5+IKvyC/YGX55v256iWAPUKm38kUjrQ
	 1v2UtcGjZi9nRKq7p6uJk4JdFvmKol9FXfj2jBermx0QKgdzYFFoWHyHzK5HV6kK0f
	 wXsAyoyjKhgotdLpdhSiZ2xHr5VuAlMcsx4R9Gvpkha1MyDujrZXOaJ+FnsUi8SzgI
	 lYCS36IkxHWiixj3joz/M2dhJ5yomLnTtkHrGsEvvfKTw/z5FKiDYrpPREuA1FX356
	 Z1u4Qq8C3v+oA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 11:33:22 +0200
Message-Id: <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
Subject: Re: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the
 driver as remap
Cc: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Danilo Krummrich" <dakr@redhat.com>,
 "Connor Abbott" <cwabbott0@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lyude Paul"
 <lyude@redhat.com>, "open list" <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250804214317.658704-2-robin.clark@oss.qualcomm.com>

(Cc: Thomas, Boris, Matt, Alice)

On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> The 'keep' hint on the unmap is only half useful, without being able to
> link it to a map cb.  Instead combine the two ops into a remap op to
> give the driver a chance to figure things out.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..e21782a97fbe 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				 offset =3D=3D req_offset;
> =20
>  			if (end =3D=3D req_end) {
> +				if (merge) {
> +					/*
> +					 * This is an exact remap of the existing
> +					 * VA (potentially flags change)?  Pass
> +					 * this to the driver as a remap so it can
> +					 * do an in-place update:
> +					 */
> +					struct drm_gpuva_op_map n =3D {
> +						.va.addr =3D va->va.addr,
> +						.va.range =3D va->va.range,
> +						.gem.obj =3D va->gem.obj,
> +						.gem.offset =3D va->gem.offset,
> +					};
> +					struct drm_gpuva_op_unmap u =3D {
> +						.va =3D va,
> +						.keep =3D true,
> +					};
> +
> +					return op_remap_cb(ops, priv, NULL, &n, &u);
> +				}

I don't see why this is necessary, a struct drm_gpuva_op_unmap carries the
struct drm_gpuva to unmap. You can easily compare this to the original requ=
est
you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.

Which is what you have to do for any other unmap operation that has keep =
=3D=3D true
anyways, e.g. if D is the exact same as A, B and C.

	Cur
	---
	1                       N
	|---A---|---B---|---C---|
=09
	Req
	---
	1                       N
	|-----------D-----------|

In this case you get three unmap ops with keep =3D=3D true, which you can c=
ompare to
your request to figure out that you can keep the corresponding PTEs.

Besides that it changes the semantics that the documentation mentions and t=
hat
drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap represents
an actual change and any call to __drm_gpuvm_sm_map() results in an arbitra=
ry
number of unmap ops, a maximum of two remap ops and exactly one map operati=
on.

>  				ret =3D op_unmap_cb(ops, priv, va, merge);
>  				if (ret)
>  					return ret;

