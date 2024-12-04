Return-Path: <linux-arm-msm+bounces-40308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D41799E3F32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C7D285C00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8380420FA9E;
	Wed,  4 Dec 2024 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OZ7R/FvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28E20C49B;
	Wed,  4 Dec 2024 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328273; cv=none; b=XkIhNWXoauH0vdnA+OjWhU9z7tKO6LgDOJtsEayzSLKIHAVz7cfSS9fKy5uABRRVodFeosbwnz3mKNiXUNkYt9rgAFbmtcoMqxw6ITuFcX7JAJ3i8flnBDbL8l5U1CsaL+rQ1p7Yg1D/15+qZLh7BQm8j0SHfIMZ+ihFGhAwCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328273; c=relaxed/simple;
	bh=FJr0zmZlE4zUDYRymx7OxP2xJcJOMiNhM+KbvndfJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuM3GsuelacAfv/qlcOdEln0/fwr6N6dZ7IGJWWu0tJokxHer/lKUghQqc96UtypffkTlctv1lW0khTFlCBvf/jDjLoXZ8zx9quKuZEyEfDwMSO3jpEjhy3c8WHPO5sFqWKFPaoqAFj0BqYLaoLtcOes5zD970tEv5QF0IKvwaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OZ7R/FvW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0N0iHfCuUo1t+gQYjiRw3/5D4nJ73sKAtZ2d4ukZ7mM=; b=OZ7R/FvW6YYmpKfSuzSQXMe0i9
	Qg7Ehbb/+KkZZqg653/YtBwt3dvKIoY/53ekuSBXEuSSsfsko4iJNgvJF2vHwDtK5e8HExBf3mhiY
	Qyhho/Gb3e21CmjxS5ya6l5xynWKMGmHrNFjUKPcIB41hW16HP3gO4hhsDppg2uZq+XI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIrrV-00FEDI-1S; Wed, 04 Dec 2024 17:04:25 +0100
Date: Wed, 4 Dec 2024 17:04:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default
 configuration
Message-ID: <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
 <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-defconfigs-v1-5-86587652d37a@gmail.com>

On Wed, Dec 04, 2024 at 04:56:47PM +0100, Marcus Folkesson wrote:
> This configuration contains obsolete configuration options e.g.
> CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.
> 
> Rebuild this configuration by run:
> make ARCH=arm mvebu_v5_defconfig
> make ARCH=arm savedefconfig
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

You probably want to wait until Arnd big removal patchset lands,
because this is going to be immediately outdated.

     Andrew

