Return-Path: <linux-arm-msm+bounces-82296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B3C69612
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 07C832AD9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EB93431F5;
	Tue, 18 Nov 2025 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6Uaoqyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0631B805;
	Tue, 18 Nov 2025 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468993; cv=none; b=ODHpuYXeKLZbkFi6VYXJl+hwrYnTcQtJPnWs6Mi4JeZcFF50YnCJnE6B6BWNCL4Dyp+S8PlHD9roz7JcPvMAhZMqB0qgvgbnYJNPocMSdYOaoIBCZTgNpsRLL5za711gQeugh5dmyhXhYLbtwP7zjSbBFp8DkTB76j2+AASm0M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468993; c=relaxed/simple;
	bh=jSHjbdIv/RXhERs0Gz/+CamJpHkBurMpBrXksmqQUQc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=joyPoohWHqUpckh5o7qEPkHfBB1HfqpXwabGnCqRAl0PHDT/Ws0GptjWhhGjPfYEz9O84hRLfSwHpaEcPYyqsarREkKyQR+ZOl53e6NlHnjj7W9jtypspnkP4je4D939ibdZSIJeDLwplX0qPVNkY+/7mEbGRNfCCyiQy54W10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6Uaoqyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8DBC4CEFB;
	Tue, 18 Nov 2025 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468992;
	bh=jSHjbdIv/RXhERs0Gz/+CamJpHkBurMpBrXksmqQUQc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=n6UaoqywfpPvQzulJCcaU5YaqO3rjWl1NxOPOgWZYVf0gNIL0SXf5kKoXAtTm8hPl
	 6sqadUdHB+EFLcCl96tYKzYL1YnLNRGXOgNBISYmBE33WXt1qByG4LoDrqcd5Tpzqx
	 3MN883yAGJQRdxeTgakZKrHxiUyaEwa8UUYU7vE0CPyjLmHonVzyXpe0WM58phE29Q
	 GvHfTp9e+qe5aQf5+2Syd5ISgAl131r3Y7OkMOJNaO/7/hu711SbV2HtPQ7Zf1FZDN
	 WJDE6t0thw74BwQ3CFbM1BjRKIosYgx0Xvo7R5OiP3Sum9tLzFjos9jEUcQoYXtksi
	 IaxiAWaWSM5gQ==
Date: Tue, 18 Nov 2025 06:29:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org, 
 phodina@protonmail.com, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
Message-Id: <176346899005.2610273.2055455026150162691.robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: panel: sw43408: adjust to reflect
 the DDIC and panel used


On Tue, 18 Nov 2025 12:30:37 +0100, David Heidelberg wrote:
> Add compatible for used LG panel.
> SW43408 is not panel, but DDIC. The panel itself is the
> LG LH546WF1-ED01, so introduce combined compatible for it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible:0: 'lg,sw43408' is not one of ['lg,sw43408-lh546wf1-ed01']
	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible: ['lg,sw43408'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


