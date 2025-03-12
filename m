Return-Path: <linux-arm-msm+bounces-51193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11255A5E41C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 20:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6C03AA7D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5350B256C9E;
	Wed, 12 Mar 2025 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byrug321"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF57250BFC;
	Wed, 12 Mar 2025 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741806384; cv=none; b=cKJ8cD8zF2Hjh2ZvZxw7EgfxzgxwnKrHdI19dQwb8BPH2L41K4M+djBzzefUdY3JQkknsxOcVLRmSHChap2eMpscBLhxVsD+GHmgCFIFtWxsUNDbrG3uTy7jsu+k+q8d6CU9FNg1AjlrmQAtHMSFcohFbu146lTxo+k5yv5Kcu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741806384; c=relaxed/simple;
	bh=59hxJxczmtJRD9AjP9dImrpiPr5PKifeoERgMGmkCUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii8KG2Dvk0U+dbRnEklbwW/qeZkhwzMegQUcfYYV4tQRh3sXMdR1ww/++gpUFUkFDEiibFpgx61bwPy9dRNJWVKUUHawTTyylEy49GzgGhn476vY4nycxHjxtN0ha4xO2JbeH1JhHlPlakzZraPLWPhf3XFZJemeF44Nu1TwkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byrug321; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED28C4CEDD;
	Wed, 12 Mar 2025 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741806383;
	bh=59hxJxczmtJRD9AjP9dImrpiPr5PKifeoERgMGmkCUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byrug321pPE95aUOrnvb48tmdWaZUxUkYcHtY6LmOiFMkfQ27+xqSQ2cNX+jN12TJ
	 VnRrvMrShqavvQ8oXEIZdDnlYVKU2L65yInzOqs9/H6hAPIvHDdXBFKpZvFCzduABX
	 4M8CbQwdmLlvkdve0N5etUfLwNNbxePJnsNzAM4bmjC17HOfA0ySypa6nbs0wpI6q7
	 oUdWn4hQTS0OJWAkozP90xI/B0mwfYlo4cn7t3K7wFvwCvfXTTJlnnqAsQ6HSxDM+w
	 MHKcmlKT/BzDnPuG+To2MwZPqdo6sP3q19hVr4oDzWNuwt2HfxmfsmbRrEa3Z7cVts
	 b5vjrz0pOtysA==
Date: Wed, 12 Mar 2025 21:06:18 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Message-ID: <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>

On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
> This series adds all the necessary bits to enable DisplayPort-out over
> USB-C on Fairphone 5.
> 
> There's currently a dt validation error with this, not quite sure how to
> resolve this:
> 
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#

This comes from usb-switch.yaml, it requires that 'port' adheres to the
/schemas/graph.yaml#/properties/port (which forbids extra properties).
The usb-switch.yaml needs to be fixed to use port-base for that node.

> 
> See also this mail plus replies:
> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Move adding "*-switch;" properties already in earlier patches
> - Move wiring up SS USB & DP to SoC instead of being done in device
> - Pick up tags
> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com
> 
> ---
> Luca Weiss (3):
>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
> 
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
>  2 files changed, 104 insertions(+), 8 deletions(-)
> ---
> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

