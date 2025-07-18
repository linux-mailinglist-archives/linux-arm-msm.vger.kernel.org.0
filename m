Return-Path: <linux-arm-msm+bounces-65666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC9B0A572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4875CA432A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1FF23507F;
	Fri, 18 Jul 2025 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UREHLc1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29C2DC321;
	Fri, 18 Jul 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846222; cv=none; b=E/fnSsBauhhONwkXMlMaxzydWRT9ZDH1I6pdeTiI8Pqaa+XQyjA4bYQSALDQqZJRH4gVi3JeBclOiAZXDfF1HtUyvKnKA4as4EfVZBYYmVmlpiBiYLjH0oP1eNUTXt8ax8NcsJdIyRfDdJ/GTYyXxd2Ay98y/fEa/sBhFYYUJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846222; c=relaxed/simple;
	bh=uBFaY1eWY0Kt54D/KGx7RxaBROAqBDFrlnassMoNjdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSx3VJbCnyJfzEPU78PxoDS+82HMaRLprYJ4uNyJmDxQ7BXx9vkHYjXE8wanzm1bcIevPCn3qDwRn9JZFN2Ytpnc3/a4VZx508fvs88cUQeCuZ8Kbbqi25n8bdvshcKqkDrVGN8gaAmPzO172/S6jIb7CfF4H0+gxwiaBg5ZNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UREHLc1s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D332EC4CEEB;
	Fri, 18 Jul 2025 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846220;
	bh=uBFaY1eWY0Kt54D/KGx7RxaBROAqBDFrlnassMoNjdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UREHLc1sDz/cKNHBnnGMPgfOTeBm2t0WatyjrFs3eKSMzqx+7vaGqsJHnMCuV0vMp
	 81keleilaOGrJrET4GaX3rUDT5CmEhCKPhyWl5zvWPW6NXI0ae5vA/pTBEnu91kio5
	 +Fy5GYKdtlrRDUXqC6MCOjCc76mldXmeoA0Zf36HTr2avokZm+j3cYGVvlsD6Wy1bf
	 FMdrJThLalkU7iSa4lpyIJorbJ3Ix7NIDzZyi1MDfjS+ZGXtNyh88BzbLZwETM9D+O
	 f+ZnC8izYZIS4fOH7VEwWOcmLDssy4OjXYF2q1Ro4/od02f3sL8dKMJ3vxzrCHd9Jf
	 vNInhwODRO64A==
Date: Fri, 18 Jul 2025 14:43:34 +0100
From: Lee Jones <lee@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Message-ID: <20250718134334.GF11056@google.com>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-1-13e6f835677a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-1-13e6f835677a@linaro.org>

On Fri, 11 Jul 2025, Alexey Klimov wrote:

> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
> It has TX and RX soundwire slave devices hence two files are added.
> 
> While at this, also add pattern for respecive node in mfd
> qcom,spmi-pmic schema so the devicetree for this audio block of
> PMIC can be validated properly.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
>  .../bindings/sound/qcom,pm4125-codec.yaml          | 134 +++++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++

Do you have to submit these all in a single patch?

-- 
Lee Jones [李琼斯]

