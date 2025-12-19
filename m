Return-Path: <linux-arm-msm+bounces-85912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBACD05EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A83CA303C9EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6FD338580;
	Fri, 19 Dec 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcbqg6vy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4BF32B98C;
	Fri, 19 Dec 2025 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155479; cv=none; b=QVCpFFzuwCDxGNt7ghLct7wDvaRUNFezVHvotoSCZn16iOjQL7SQduvRlsyrjQoc6q9b13rkPeXRTL29wTlM5w0rbJNP7V+atH9I6M7MfnOMZP2XA8zbGG+kGUWGcuuHShHjH/XtDSndq1Bx7kpj//EoVxcrezUSkP4DIoYuOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155479; c=relaxed/simple;
	bh=HBStnaczxXeJ7ZgSO3LMmhhyPNgy7dgRuuBgSRV4SEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJaPDOzs9gxTo2Q3e5E0eIh+ue2T8kHJ8T9/X9NyWZ2GHn2wgwYACowmTMLue6JUzmtiEezUWSqg6yIzViDb60w51Alb1xxYWcwyaFLHaPzpRORTi94PvDdrAUxHHzNqkO47VfQp03U179ldXiMMvuGffRPulRi+7rcv/xGe/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcbqg6vy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F801C4CEF1;
	Fri, 19 Dec 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766155479;
	bh=HBStnaczxXeJ7ZgSO3LMmhhyPNgy7dgRuuBgSRV4SEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcbqg6vy4gLATEBHP/CXzCWjeKUXnnMMb76x1Fbq+p1MInw/tgidYIkjWXmKeCRiE
	 KgLzPJquglZAY/TefGaqHTWQnU2gDIM3vvgbh3WQZtAR9USM3h3s2kUyNiRJ8QNs5z
	 YT9InpFWqeNCctvC3ApVN5OzpdT6b20HgUvvXSBhEji7HoF6ZvwMiGpMLoBBx7hLxI
	 zpLRJpLErObacC392luCWaplkYaigfr/OabWBhh6c/zPOstrJY/ML3XuHj7GO76Woh
	 Je9D+lsFJGm2WTiWsod6XtthoR9KYMF7S/+q3Jvn8aP7RCAmA7LZZ9IelTIfFkkWpR
	 XnbYiPIaCsqQg==
Date: Fri, 19 Dec 2025 08:44:33 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader
Message-ID: <20251219144433.GA3163791-robh@kernel.org>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-2-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219043425.888585-2-mr.nuke.me@gmail.com>

On Thu, Dec 18, 2025 at 10:34:10PM -0600, Alexandru Gagniuc wrote:
> Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> enabled by the host in non-PAS mode, and are not optional. Add an
> example that uses the "qcom,ipq9574-wcss-pil" binding.

Is the new example really much different and unique. If not, drop it 
(especially since it wasn't even tested).

Rob

