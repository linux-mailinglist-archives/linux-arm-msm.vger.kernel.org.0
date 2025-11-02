Return-Path: <linux-arm-msm+bounces-80019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2602C2914A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 16:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D266F4E3779
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 15:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293FF1552FD;
	Sun,  2 Nov 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOk4P0dV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEAEEBB;
	Sun,  2 Nov 2025 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762098578; cv=none; b=ZJU3TFvjBQDglVwAT9j7nYHtAsDj+tuQ/lnQI4hMOFrtNZxU/bmQkoNbteaIyjdZzhPT20O2r3im+0VZRv95/ikwLyx1iT8LDDMX1EEvykgsRnBTR4pnvDxRJFfG0sXdVk6EVFHb8WoVvSrCG1x8/BJTc2NMRhDfjnq0vDqIvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762098578; c=relaxed/simple;
	bh=k6CW04MKlxo92ul/DQACn80/W691w1AykhYdtrusY7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6c0aj2yYjgY63cHYvSc2eYd5qoohgiV2EvPTtlL20w9drd8CWCNBN15RL4hus6JYdZy6lRpaWmeLrTV0YtPlOEjP07asF+1p+3YO4evNXHVwFCeqkekxlMFWcMVLsnlb2E8vqEn6C+G2LzeaKONl22sAjnGENO/b4MqMFtNV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOk4P0dV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908D9C4CEF7;
	Sun,  2 Nov 2025 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762098577;
	bh=k6CW04MKlxo92ul/DQACn80/W691w1AykhYdtrusY7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOk4P0dVFEcBCYXyS7R/cHGF1Y89fYT/X8o8xGUh4W+E2rdfo2FthD/BsfZneqeCM
	 xjQqaoODuecOzfcp9kG6CKCY70AFgTD3q+BcuyMCnFGO0HdfwpvQrd9iezJPqf0xz0
	 Ofpfm5boJZ3819TtnKzWypVoZ7z5zwrzvUi2eeVJbvdX86SUydEhvCZ58Y6O5FsFy0
	 MJMh8E+nN+iEbqSZiRMngnnvs/x/lRGoszK8WSd26AOKhVf4X8Wn+KCFJ1fQYw0Pd0
	 yXC8dCo4bZrs5oL/BhMKAgSRUwWHmqxWxCpmpjxiC0LmPeOtxCAVwUsfcFJGQBBOTW
	 2pRNTvDEXmtRg==
Date: Sun, 2 Nov 2025 09:53:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <ev5gosxqguzdbufy72gcjmt4m4z6kc67jcaznrhvvjldcps4g5@fntcevrjpqsh>
References: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
 <20251101174437.1267998-2-krishna.kurapati@oss.qualcomm.com>
 <f2724aed-c39c-4793-9522-bae08ea97a05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2724aed-c39c-4793-9522-bae08ea97a05@oss.qualcomm.com>

On Sun, Nov 02, 2025 at 12:43:07AM +0530, Akhil P Oommen wrote:
> On 11/1/2025 11:14 PM, Krishna Kurapati wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
[..]
> > +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> > +			required-opps = <&rpmhpd_opp_nom>;
> 
> Probably I am missing something, but which power domain associated to a
> rail is scaled to NOM corner here?
> 

That would be the parent of the GCC_USB30_PRIM_GDSC, which should be the
CX rail. We currently have a NOM requirement here just in case we're
going to operate a SuperSpeed link, and the driver doesn't scale.


That said, your question is very much valid, because on SM8750 GCC
doesn't specify CX as a power-domain of &gcc, this vote goes into the
void.

Regards,
Bjorn

