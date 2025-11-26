Return-Path: <linux-arm-msm+bounces-83498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0068C8B266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0068D3A8CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC7833E36F;
	Wed, 26 Nov 2025 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFDjfllD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0A33B969;
	Wed, 26 Nov 2025 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177128; cv=none; b=gj/dHB7AvtaoMIEeMjZJqZzpdisqXwpub2OODTaFbOIUWUYRNr5OgRmYijc1mvyyVdwj+CKsZiHfKjWZ3KiQEaU/ISVg2RUQyAbvGSES8dFUFx+Lwx5mcU1n8T/zTlU98OxT8EZrh068qichlHEsnz7ah9wg+1Rnatd4SuqrJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177128; c=relaxed/simple;
	bh=7E4ZKOEtq7KZS/jEqD107O+Ke3fhClqZt1ezGhaIWp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1/ThLFCVUb5/SHV1e2FEOz7s0XsgONNMkuu2ZzFRZmNWmeq4u5Eaw6kpqTdwS2m1W4MzRW0VJ6L+iNQNrdLFLg05en0Y6c9qGvFMpTo6+IwCKInZOUYMhdGEDGdYcUO1PDb26Vd/SHhHaPfe5mQ/s/cHcsuMNgY6SnqfOtMpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFDjfllD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B291C4CEF7;
	Wed, 26 Nov 2025 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764177127;
	bh=7E4ZKOEtq7KZS/jEqD107O+Ke3fhClqZt1ezGhaIWp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFDjfllD9TaYpHh+WqJ9hS2ZQQxAMXrE91BS5PV20CdSO2oxTUZkFXxZJm9Y6LfVz
	 2xyZbIdi+Pg1lMMJSTM7trs0ewA36jaRjjf82D/zmBJPAfBfve/vv2lWzhsTkDk+aS
	 jjlsW5RKnrVH5Xbp2KPx/4zATlcyPfg5Z+LOCQoAcnmOxPTvSNzug8xYsv9Oz5GB8F
	 WCHd6StY0hxvPyq9B0eZAgFcxulaaWTMA6cf13OyqdWit1PIQOfGajmBZ9TgOtzzP1
	 vhDzHjB2NSWpfVpy+pt1NNZO2FYaCLlXcdCrLGsOAWQtHMYvaFmcmqPREeeEXFrLCp
	 CaCxDgPxwjWsw==
Date: Wed, 26 Nov 2025 11:17:38 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Fix usecase id macro alignment
Message-ID: <xswvpxmqii2cvus2rgjenynt374hgt7qmcibq5a4wv3emudi5b@kjceg2b6dltn>
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-2-75a10be51d74@oss.qualcomm.com>
 <20251126-gigantic-dinosaur-of-bloom-aca95f@kuoka>
 <7158bde2-bf70-4a2d-b19f-fcc24cc37d28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7158bde2-bf70-4a2d-b19f-fcc24cc37d28@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 05:08:35PM +0530, Pankaj Patil wrote:
> On 11/26/2025 2:29 PM, Krzysztof Kozlowski wrote:
> > On Tue, Nov 25, 2025 at 02:46:23PM +0530, Pankaj Patil wrote:
> >> Aligned macro values for usecase id along the column length
> >> -#define LLCC_CAMOFE	 71
> >> -#define LLCC_CAMRTIP	 72
> >> -#define LLCC_CAMSRTIP	 73
> >> -#define LLCC_CAMRTRF	 74
> >> -#define LLCC_CAMSRTRF	 75
> >> -#define LLCC_VIDEO_APV	 83
> >> -#define LLCC_COMPUTE1	 87
> >> -#define LLCC_CPUSS_OPP	 88
> >> -#define LLCC_CPUSSMPAM	 89
> >> -#define LLCC_CAM_IPE_STROV	 92
> >> -#define LLCC_CAM_OFE_STROV	 93
> >> -#define LLCC_CPUSS_HEU	 94
> >> -#define LLCC_MDM_PNG_FIXED	 100
> >> +#define LLCC_CPUSS         1
> >> +#define LLCC_VIDSC0        2
> >> +#define LLCC_VIDSC1        3
> >> +#define LLCC_ROTATOR       4
> >> +#define LLCC_VOICE         5
> > This does not look right - you still have here spaces, so nothing fixed.
> >
> > I don't think this change is useful. You replaced one poor alignment
> > into another poor alignment, so IMO better not to touch this at all.
> >
> > Best regards,
> > Krzysztof
> >
> Sure, Will drop this patch in next revision
> 

No need to send a new version unless you get any additional feedback on
the two useful patches.

Regards,
Bjorn

