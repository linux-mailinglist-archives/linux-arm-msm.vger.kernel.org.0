Return-Path: <linux-arm-msm+bounces-81779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0EC5B53B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 05:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12C0E34DCC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50FD2C2AA2;
	Fri, 14 Nov 2025 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgtZeHEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771E28725C;
	Fri, 14 Nov 2025 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094961; cv=none; b=n+NHWCvK00+MJ9wu5H6SyjLYKGyCeKCMAhSqEAXpD4x3CneSgjUEVOMvJUwwO9E9LqsV82kidG2216KfdDqH2Lhc3RPcAuVxG6Zno4Yd/rBw1bC98WTWYL0+Wcv+fSjxY6WH3j6mKfX5gB2rRbuUTJ5zjnj2yak8wxtFZU64vGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094961; c=relaxed/simple;
	bh=OfGZLvFQpSlxN4/JOHFMPeL6kgpDPwFBi+BZUuqqWMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxkls7skfwQIfoRmHGPcENdfNYTdzYMzmbc8xDn9QJFFbcelUW6fnY/oFey9mQTZOyarUp54Fz0cFVVsH9WeGWK7ObJ+HvSCT/GSthzD8a6G54dFnrOxaAg/V0TWuVg7RsUzinR/RoXm5A0P4JYy8qg+tV66DCxfBZ/PwCKMvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgtZeHEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D818C4CEF5;
	Fri, 14 Nov 2025 04:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094959;
	bh=OfGZLvFQpSlxN4/JOHFMPeL6kgpDPwFBi+BZUuqqWMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgtZeHEeyT/tlKLsvIA+TGHePCNE5BSMErQpviqiQecpqIKSxPJ4ywVADbdVuISgk
	 btAXgWIm3sypcio1+Z6zSvWSpMxVneQMK6vy3uy1VkF/eDABjWHaAEyDlM88rLDaIy
	 UrThLp0usXmJsynsgjKEHg5RwR+qjlwHgh2ngTUB6iwLr83d5NQGoFIgfUsxFVhxOh
	 qk+WmqRAK+BPCI0JeSkHie/Lzb/50QmO+964ysGu4f03+It+S1mrw+hfUu+nLdy3Yq
	 ItYW/BFnwprCXja6iYW87xixvHujBZXPzeMWlaadyOHMzxgneZj0DyYlWbItR3/Ohk
	 WKg0rGqmnqLEQ==
Date: Thu, 13 Nov 2025 22:40:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <3qk6i5infwcahkmwn5p4n5hfspdvjd3azimrfkk637z6ar2hpe@vb7zvytl3zk4>
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
 <20251107105735.1491273-3-tessolveupstream@gmail.com>
 <badmoityubqmjsxune27vrh2e6htwkhvnak4uj7iiixnxhjpkm@qi56e6kilyt2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badmoityubqmjsxune27vrh2e6htwkhvnak4uj7iiixnxhjpkm@qi56e6kilyt2>

On Thu, Nov 13, 2025 at 10:08:20PM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 07, 2025 at 04:27:35PM +0530, Sudarshan Shetty wrote:
> > Introduce the device tree support for the QCS615-based talos-evk
> 
> You can't introduce DT _support_. It's either introducing a DT or
> supporting.
> 
> > platform, which follows the SMARC (Smart Mobility ARChitecture)
> > standard. The platform is composed of two main hardware
> > components: the talos-evk-som and the talos-evk-cb.
> 
> are those the actual names? I'd say, the platform is composed of the SoM
> (following some standard or not) and a Carrier Board.
> 

That's likely accurate, but in the patch the "carrier board" includes
the talos-evk-som.dtsi. So, while what you say probably is correct,
"talos-evk-cb.dtsi" describes what I believe is actually the EVK.

Regards,
Bjorn

