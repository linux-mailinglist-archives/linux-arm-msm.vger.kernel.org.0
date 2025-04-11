Return-Path: <linux-arm-msm+bounces-54050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE51A864BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1329A372B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42C9230BEC;
	Fri, 11 Apr 2025 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPZzGZiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A20221FCC;
	Fri, 11 Apr 2025 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392230; cv=none; b=kXD0LvGne98XNzBwkBSbVNuuxLkQhnBUNcb/Vf7/M1/9G3h4FMH7wt3meV/rDEMY4EuQaHJkPpFIvz32eg/sXNFzPw/NxB1BpuMff3ykRIm4QKLiTcTpL5RWtgjbFvKw1pEUWm5+Rs6g0hrhX4j9edHwEJmTqnD64pdYs0EmCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392230; c=relaxed/simple;
	bh=A5RyENpGOJJhLN9yt6MaEzGOno0p/FsbaK6AG5b413c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+OYZjSwF0GCh/DulnzIl7OG7OcEAI3DEY3xmJSoVU9atX4BoaRHp7C3HHIKslrfI8venBBO7ykI+GK6JSZ2t32U/n+BhULMuKZZ9E4X8M306DiPbcqCDo599aWWfy3qoVrJDAEh+eH4HjGnzp684j/wRgfbH+HMuSTMhlQqtEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPZzGZiS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE63FC4CEE2;
	Fri, 11 Apr 2025 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392230;
	bh=A5RyENpGOJJhLN9yt6MaEzGOno0p/FsbaK6AG5b413c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPZzGZiSv8o4+dGZufvdny/b7NXQM30wE4PyTpmESiBZ8+89/axRN6ugXo5skuPzI
	 cGy4wYmzcKefEY2kgaHNk9hmSdERXPZOKbCOQer6IAfHgwabtguEy5BPe4oajVk90j
	 fTDA6jqNVMBDYJJRDQGaDN2nb1AoTUTDreFLNkle7QqscpD9y6qUdVxsqj+ypaJqik
	 wkpyPiTOHo6w2iU+/RledY51YgIMCYv6Y9c6OnW6K+P7Z8kS0Dr33Ys13CJgZbrwmC
	 HjDGKThmOBjjG1WioMH/6Htyw/dYnAkTn53MElgDb3nOrQTVa9H4M38QpUJTeYKND0
	 9+dJFNlS5ne0A==
Date: Fri, 11 Apr 2025 12:23:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: konradybcio@kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, rafael@kernel.org, rui.zhang@intel.com,
	amitk@kernel.org, lukasz.luba@arm.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org,
	linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Message-ID: <174439222845.3551396.4839377552706414911.robh@kernel.org>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <c8339b6ccf5ee19fefed762874560d6d8408ebba.1744292503.git.quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8339b6ccf5ee19fefed762874560d6d8408ebba.1744292503.git.quic_gkohli@quicinc.com>


On Thu, 10 Apr 2025 19:30:18 +0530, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS615 platform.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


