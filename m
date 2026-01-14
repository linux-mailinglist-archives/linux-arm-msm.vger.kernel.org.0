Return-Path: <linux-arm-msm+bounces-89060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E36D20E21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 19:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00B3F306D503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846542D5C7A;
	Wed, 14 Jan 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nszmqe99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B293396E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 18:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416440; cv=none; b=FFnPf2UwPj57/OM3qS03AMa9zUYeqqYFbL3lce3ASQ/HOKhPUsP/9cgnRd8xAI5wHB8kG4nCh278OIiLz5+poJWE4GbVygKbfoZB94RQ2p1KuYOdjffCketh70ezQkbFq1GPuug2rkVpPYSqO83zWw8/wXmm+IAw/3LlHqHBZIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416440; c=relaxed/simple;
	bh=jYYx3ICzmguprfORr6CeHewRj/Eyt+HvF6Iy2rZ0UoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awX+4Ui3TQdhB3bDblivu/KTGtRD9JLBArnsfiL56G6JFpgtdve9kAIYrLNnAgaW12lzee5UGAQb3MzY2VgfnxsgYBhynIfxpRgZrUnHjTnlWOz1Ich6cTIyaDGr6wKr7LGTvu76F75v12fPFwd3/PfyGEw7lYIjU68btp2r7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nszmqe99; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso9453a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416430; x=1769021230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
        b=Nszmqe992s5WDkU6CEkfnC2NoO0TjxKUv+BuqCk4VeBinBqML3rJz3/dgIQBr+I0Qx
         fRU+kk4s5sgBaEN2nx+ZIMFtunuiePP97cuPiS71bFCfiI9Q5bN6+HdbqXnrx5/wAtwD
         5hnTUm59zLN+dFSgETkTQDZ0zOmW8yhCjbbk77q4avXNbI1KC9ALigwKLTQk0f8jxwM6
         SIXEsZ52gOLuuqxXXikJm5K86S3Lc0OcIELa1vmnuLw5vfZZRWmEjoaWCwR1x1JOZMCG
         HXOckxkmPfkW/3Qzo3PyOXpEYswwW6EuW8SqAHgDXnfzlolnX1ikyUBPgXIX0QeDx2iW
         TEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416430; x=1769021230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
        b=IUXOq8DzeJRBzu9VRAmXdLuTECLKIYvSi6S5qN5za4DIOJ+iIrBho0TctM1PiSgFZB
         wg5wDia3c9jgUof1EN6tvYuktFhsLTtQOvWVfiDi4L1XyDNt76IcnqxuB+7KTd23UhFi
         veGi/+MCuSY7gdhAbqBuw+5jVdGndMxSLnPuLhZpFRbvsX1rifIbVW0f1q9DHU2muhKX
         GWLgFgDkvnNlmWW0/8V/8bbkNVk+zatgAC4BKpHnk3uqR+AkOK5KsHed34Z1IhZ41xs9
         zlhUapQVdD6/8swUyTJpVEcgWgo7XPNGmWbeZoAXZH38KzctoqfimTI2WuE9vvyICCK2
         Nymw==
X-Forwarded-Encrypted: i=1; AJvYcCX4vMZiakA0/3h1cN2BizAmrwptOJjJO0XqLPPQD3L+DHFVXCDbAq7wOmmnwow4qLrFi7+NImdyQdxh2BEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlGj3uFrV/bVElt56j6qp+7yMB8axXpTAcj2r+dJeII3riXFJ
	SkOwoWTKDIFF8IbD0KkAH1bZnzd1HUaJrBcawQX5vTLeHrw7vLd8aP3T
X-Gm-Gg: AY/fxX5a26M8AI4lK6DI0TGLcocrh3uxoR1GTkt0AdpqSwrw3RylVCjDWjEPHLGN3Cu
	/nAcAA5btzcJRH9KYCPtHfT/Wr2BnQYA9hwbaeYzAGWv6rvkbUrVSbtdN1iuHukl+RrBxxbxbGL
	5qqcuDJxkSk7JllrUBfGM7AvHUxP+ns0p/9j29DGv1HsdjEh7uckFe+kEDYQp41tA4KUVgiIwrI
	Tcl7Fx3UP8AC4mwel7pSS9ZcG/+UPuE7harvLdGKQjTLd7CKxPNF16SGd47hdFlSKNOkDZQGGTW
	utt2q497JBSiB16A//KZFhdlfqc2h4MwjaI1IiKTVBB7D9dbcFCFhrvO7Ma3n8NHWVS+9HlpCOa
	3zn/TPVRCovZaGL1HFT5E8FUa8H5/YpMV3X/xz4B2brr5vzw5MCLCk5NSkW/0gSNlJRwEkVY1KN
	E+eGU=
X-Received: by 2002:a05:6402:1ed6:b0:64d:46f:320 with SMTP id 4fb4d7f45d1cf-653ec47b906mr1748710a12.7.1768416429553;
        Wed, 14 Jan 2026 10:47:09 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411882043sm327189a12.11.2026.01.14.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:47:08 -0800 (PST)
Date: Wed, 14 Jan 2026 20:47:05 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <20260114184705.djvad5phrnfen6wx@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>

On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> using SGMII, 1000BASE-X and 2500BASE-X.
> 
> Add an implementation of the .set_mode() method, which can be used
> instead of or as well as the .set_speed() method. The Ethernet
> interface modes mentioned above all have a fixed data rate, so
> setting the mode is sufficient to fully specify the operating
> parameters.
> 
> Add an implementation of the .validate() method, which will be
> necessary to allow discovery of the SerDes capabilities for platform
> independent SerDes support in the stmmac netowrk driver.

s/netowrk/network/

> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

