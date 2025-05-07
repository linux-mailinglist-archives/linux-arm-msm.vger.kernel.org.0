Return-Path: <linux-arm-msm+bounces-57202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D46AAEF01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633831BC493B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09C529188F;
	Wed,  7 May 2025 23:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teQm3MgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD529188C;
	Wed,  7 May 2025 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659235; cv=none; b=VQkhsTKRLM2Y/cnFvahgiGB98nalTI1l99568peAOPp0uhX2vWLNIrPiiVo0cDHg2wZjvtKrRX/3KOJJhgF5AVrsCNVK+ZUiPGcp3F4o5CsozHhzy2arailDBXjEn12WFKqq2/NP+FseU8hL6IpzlEfAEsiyfpiDlC74Oxc52uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659235; c=relaxed/simple;
	bh=Tj+CpAv5Rlb15mBsouZqKDGarni4Uxcs5ytEL68aR8w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=abNji3dqezs0sk/UC9vrdBwvSdcppIzRYID80ycqMm5aVGUYK+zanSs3R+MUERuwTjP4npNn0Rl4aFLVj4x15aXL9tQtR5M7FaZ/O2RDdLQEaz2F3R3rECe32/p9zhoqb/bjyaTMOxTEpRT0N93GKzMMqRArAEJf9+cDddlAQT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teQm3MgY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007F1C4CEE2;
	Wed,  7 May 2025 23:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659234;
	bh=Tj+CpAv5Rlb15mBsouZqKDGarni4Uxcs5ytEL68aR8w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=teQm3MgY/JIOJmtEzPcr940QQslHKja74ESjbeSSXw2N1lQ2wpNV+KNvY+ZsRY35y
	 ckTdJoVtTkVnebvVJQAj7dfVo5RSrarAFX1px/KQ/G+V0y+vBSTRT1AewGiQkhmPaQ
	 9Ez1/qKN28APvlNqNFPHQosGOdAXxTgD/H9j+IcQliIOXyCME8yesdmN5y93BfaDRA
	 CWEHcKrFWRzLj85HUMxxSQ3lUMcBUUrseNYsQrMDubILNoFSjydlFaZKG92zokp4XJ
	 +OU2IVV6nQrlyeoCAdkh/oayg5J94HVmjagDeYgc19OFzgSkLIItgzf+euof0aMAUw
	 zXiG4YkmOt5PQ==
Date: Wed, 07 May 2025 18:07:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
References: <20250507215912.2748964-1-robh@kernel.org>
Message-Id: <174665922903.2893840.15913516766743050523.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties


On Wed, 07 May 2025 16:59:12 -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215912.2748964-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


