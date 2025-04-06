Return-Path: <linux-arm-msm+bounces-53288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C93BCA7CDE7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 14:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A292616C049
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D5D21770D;
	Sun,  6 Apr 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRAl3ayh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8BC8E0;
	Sun,  6 Apr 2025 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743943008; cv=none; b=SAjcxYroZyHq6aU1bSH9bgH+rrpzhEy5zf/6SAYnkIRfHPf2AWA94nVBB3ZW6ZPQnNAeI6CUdKm4WvP7Dr5g1HHzVFxzI2dVdzGBcV61GLljsitzJpfpWr6treXlZW1C+SOds3NvfOgqQmbooNydwzSj6DYtKLgtga1sIGoPYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743943008; c=relaxed/simple;
	bh=vUTWrvW/2OBcC1F1Bh/tjKBTEE36gpFTGnRvicQXbgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCXszfvKouhf0bmTGIQPjbrUQIzTKO9QuxQM6ylEzhs7aRcVQXcUBumAfdEZ49gqDgK6i/6mBlwBSBgT/FRZXBv3Pt3NqXd87O2NWKgD1iOS7Me/AcfKWjwLc2zFMz/oEcDA8eTyBfN9BOtv0xZh1a/ojkC6L7a0Vb6T4e2s83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRAl3ayh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C376C4CEE3;
	Sun,  6 Apr 2025 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743943007;
	bh=vUTWrvW/2OBcC1F1Bh/tjKBTEE36gpFTGnRvicQXbgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRAl3ayh4tXfcLdvmhZXIJQj//2nek+hU2tHzKMNrG34+O0I8AkwuzaLF280wa0x/
	 4jCke0wtQuuQKaQh4JHRHJbGXYt8NBFQ4pILo28syj+xS9OvrStH9FBb2W5iinXCXD
	 Qpkd4WlHZ4nLOuEI/EtbpmkjzFfE6EAuB/qigShMRbdXJmmNKS/fyTRnoRVoqy9bU4
	 x60dMKqzgDFPccFPJ57EXBnI3OYtq+dk6G0EL3XsSJZV9JGDOyfHcLY5a0kbNF6WFN
	 /5Tj/5uQV8sCaIwBTKTkxHir00qHuumcLZ1DhGzHHuuu4kvG/4AAIyZxg7UATWt3+4
	 nuRR4o4xZVVgw==
Date: Sun, 6 Apr 2025 14:36:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 02/10] dt-bindings: msm: dsi-controller-main: document
 the SA8775P DSI CTRL
Message-ID: <20250406-gifted-vulture-of-science-4fa1bc@shite>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-3-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-3-quic_amakhija@quicinc.com>

On Fri, Apr 04, 2025 at 05:25:31PM GMT, Ayushi Makhija wrote:
> Document the DSI CTRL on the SA8775P Platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


