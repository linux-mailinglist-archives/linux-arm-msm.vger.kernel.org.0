Return-Path: <linux-arm-msm+bounces-85079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BDCB6965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 17:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 159633020375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5233148B4;
	Thu, 11 Dec 2025 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWTqzzfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC482313261;
	Thu, 11 Dec 2025 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765472275; cv=none; b=G+3OYtho28BR3zXvBhlaphYxO6DHYLWEfN36QkVokbiJr308eQ3yOkx33vNY3y5Gg0HLPOjX0RNJxS9zW6PE1LmT4esF2nxiZImKA4IUybat1wSFFGZu9vYZCHEASTThwalqrSB8USYt+BvE1NVtGAZyywAkM+Q7nAAnlhrrcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765472275; c=relaxed/simple;
	bh=GOOa7pyc8pgcsj4rkI54ZXso2oh9w8ImmBS2E66SmOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5TZ1nkKevIUUvrLgkhfYMCQ3MLmDm1xcTYqQRFYyKy6o/JxOVEIeOLpzf1fWqmOeLg0tL6EGB1iFYZx2D3iD1yelhXqWx9Byo8AFiisarFPKZtsc/ZX2dgzplgcqsMJQCwbDsdi7+53vPl356VoQeX/OQ41nBdqEWsiqIffx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWTqzzfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E3C4CEF7;
	Thu, 11 Dec 2025 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765472275;
	bh=GOOa7pyc8pgcsj4rkI54ZXso2oh9w8ImmBS2E66SmOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWTqzzfal6kTf4NF6utEjI2ff0Wi8CLskGjHOYBLejIP3VT3Wcm0Wug+x/P4OGkno
	 1IXMdRwjBzEfbRG5MvHko5fOBRRVa3c3bRsBWZqq/bEQgWMmMnsdV09vL5MJTtXKv5
	 VElKTCaMUF4gnwKlm26CAX28/rT7EDAtPixz/YVCQlbXE+jGa/8gIj4NY15QjyqKjH
	 vHo0j74iNlCNLIvG7nvFZfJd5sewT6sIUZ1Iw7ifWFniCVBiQPt7QNumGwplWkLwKN
	 9Ut+/LbHx7sc3vt/QFNo3Z/209Jx1QqmbD9KIGmlwCMcoFdr8q6iocp3DEv6gadkQa
	 o7VaJdBcVa3Kw==
Date: Thu, 11 Dec 2025 10:57:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document SM8750 CPUCP
 mailbox controller
Message-ID: <176547227194.1556323.17599582527909662491.robh@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-1-394609e8d624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-sm8750-cpufreq-v1-1-394609e8d624@oss.qualcomm.com>


On Thu, 11 Dec 2025 00:32:23 +0530, Jagadeesh Kona wrote:
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> SM8750 SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


