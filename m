Return-Path: <linux-arm-msm+bounces-54136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CED81A873C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 22:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92E8318936C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 20:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAE11F30BB;
	Sun, 13 Apr 2025 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZcGKUAeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92C78F4C;
	Sun, 13 Apr 2025 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574963; cv=none; b=AjTRXL/orHFXYqAVoH4voQN1Mc/Sq5KwJv9Yy+XoI8C2y7q6Cfm7w3eYG3au7s0wG+n47Rr56Oa1axr/3o6dw8gAu1Fi9Ce/5JSGt1bTYKxqNP5YQOu1L6epHJiS6/xhkDGE33Q+zMFV9SxAoqNatbRNSMS/2KUiX4Rn83NqSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574963; c=relaxed/simple;
	bh=g5Kl44xfliZtc3F8mEZvzsmuva57Nej/HbnbF9B9CTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXooqcVi3So/EP2TZdp22ymz3Jx5VVsweyE4eCMwmAOxuXQI96O8bKxIYQ9gcduNLX6kRTDDENmx1LcXCUSLoK10YZ7ReDwrrGhc31d8V2Cy1EEoZ1C3PIVOpIpjCm4QEAB6oplUixqcFpz4f98tsh+SkUxSG12aS1laF1JOE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZcGKUAeh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4+bWvLNfqVXKoM92yRwQ99BQCTFezGqLq0CQ17PjyRk=; b=ZcGKUAeh7QEUUa1hdlTLhnNbV/
	iwc2eD/oDOI5JIH62/PG9XxJIzQV3QExdX6K+g5ZBNZrdW8JqakiMP/tZ3fWTI8ZRp5gSii7IKKIq
	gglFdW0PxMfuww6tSpdbHmNFgmoYdq6CJGpkQROcxxo7bOSd0T+BYj47VyfysMOPmh/s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u43dh-0095hS-QW; Sun, 13 Apr 2025 22:09:13 +0200
Date: Sun, 13 Apr 2025 22:09:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII for
 ethernet
Message-ID: <a21ccb50-1f32-47b4-b37d-d8250a505afb@lunn.ch>
References: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>

On Sat, Apr 12, 2025 at 03:22:40PM +0100, Russell King (Oracle) wrote:
> The RGMII interface is designed for speeds up to 1G. Phylink already
> imposes the design limits for MII interfaces, and additional
> specification is unnecessary. Therefore, we can remove this property
> without any effect.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

