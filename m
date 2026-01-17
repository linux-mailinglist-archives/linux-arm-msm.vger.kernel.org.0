Return-Path: <linux-arm-msm+bounces-89505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBBD38E5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 12:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0085301B2DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 11:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E40E30F805;
	Sat, 17 Jan 2026 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlNbN3Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7932FF64C;
	Sat, 17 Jan 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651081; cv=none; b=dlclNk0WPNx/Eyqz67Kx7cyKukh3r0C3ISYLP50CK9b1NdmlU3s/LVfpu9qLuYl9bXnNZxt2wkiYj99chxq3VcDeqIWuespROBSC2pdEZp4R7ejDo0FyKzBAFmS/SgpdMxuLHzeXJO95pzdhKueM+4Qg+L4m7EbwNirOiLXnp4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651081; c=relaxed/simple;
	bh=3m9NVur3xJXFkbpVvdQRJe6x/wLXG0aw5ncfmllx2TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB83Bsv06pAdGUdrdHfM/FLUKK/z+p21VqxlesaGc+OBJapOohER9kir4y/3xynG3lXPnP8FVQWtuY5JOfLfOY2etwplhd0rlBy48ODoCcVzdqXT6kY+wbfhlOpbJp9P6SOTDoI3Cm3bgF7X2lgxVG07yHRY/CkLoVthh6p38J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlNbN3Xi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A98C4CEF7;
	Sat, 17 Jan 2026 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768651080;
	bh=3m9NVur3xJXFkbpVvdQRJe6x/wLXG0aw5ncfmllx2TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlNbN3Xi9t+fj5ib/tPuch0NbiHd8yD1yOuEvmb1XzFJgR5zi2frzrQa8JO6zMHwC
	 zuyyy9WDssWFbXtcjJa0WKr8VPrhxEqr1+HryYGBbJvJtZtmru1mG6/fIXzf9toYJI
	 +MY1Gr4lFd39do/XWHsTlc+UqRKtAzmrIzdm/o0QNCCoEagdrGcL5iZpQjO6apu5bU
	 KKb6xbt28tZjYmoKFjMnnj6cSJ1+JfTColGnNHNa8r1uZ8AoCzhA+vwaR7jGLXm9T/
	 jk+UdLlpXFHnHH0vjTSOTpessLhqYHWafVVurVHyGv+J0d4agfmnnZMWuqc+GW+0/G
	 BaTB6K8wuFvUQ==
Date: Sat, 17 Jan 2026 12:57:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
Message-ID: <20260117-courageous-chamois-of-focus-20d5d5@quoll>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>

On Fri, Jan 16, 2026 at 03:20:58PM -0800, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
> two independent High-Speed UTMI data paths, depending on the SoC
> configuration. Each path operates independently with:
> 
> - Dedicated PHY interface
> - Distinct USB connector and controller associations
> - Role dependent routing
> 
> Model these hardware paths as separate eud-path nodes to accurately
> represent the physical topology and add below per-path properties:
> 
> phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
> operation. This property references the HS-PHY associated with the UTMI
> path.
> 
> usb-role-switch: Indicates that the USB port on this UTMI path supports
> role switching. In device role, debug mode inserts the EUD hub into the
> UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
> directly between the PHY and the USB controller.
> 
> This change breaks backwards compatibility, but the previous binding
> omitted critical resources like PHY and did not describe per-path
> topology. Without these modifications EUD cannot be guaranteed to
> function.

It was working for 3 years, so your guarantees are just imprecise. FUD
is not an argument.

Qualcomm task at 2022 was to post complete bindings. These were posted
and accepted. Three years later you say that previous posting was
bollocks and this cannot even work?

Nah, take responsibility of what you did in the past.

Best regards,
Krzysztof


