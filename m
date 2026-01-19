Return-Path: <linux-arm-msm+bounces-89686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DCD3AB08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 785CE3033677
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91C4374185;
	Mon, 19 Jan 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/yXWD0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1536D4F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831227; cv=none; b=U2G464AcDGJbctXxu4GI3cGcsUttp7xsbNjt+oHkE9to+E80bxjtbr3zIls+g3IbfN9z9PcAkxDU+IENC1sENahm5bQ1i0+3IXk0agkpTQ9mg3tA67OSer9h9ixAphDJ5iB+itfypbiIZ/jfftmXzPNtflVs4Ph1om24+sF09CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831227; c=relaxed/simple;
	bh=nNTJfPbd1YV6us6RVjuHf5jxYqDR5Sbvdeb3Dsc1xvI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbK3x05815thftb/bz1IAK6Lkgyzyd9WrmyboQRqVtvdQCMFwupgr2ByxJa5tZosEInX+3VpX5MmrhBFaQOuqt5Knm4lV3m1dpc1yniEA1CwYmsFEFs73wzxzzBn8JZnH3uYa4gzfk3S6QgCblANWqbjq3o4Dv7adn8NCKuOLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/yXWD0n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BA2C2BCB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831227;
	bh=nNTJfPbd1YV6us6RVjuHf5jxYqDR5Sbvdeb3Dsc1xvI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=r/yXWD0ncsL2nyj0HdwR3sH/Th7Kg/j5/M3SisKCKyBMwdLtzXqvEWLvtqcxGuVa1
	 kUrswwItcjh0YT/v+N+4EogiYiD2tKkVBc1Vjux1Fvx6MOFcEuVrIe0ebUHSZr7Loh
	 bcblPCxkN7qFc9o0+nlW60HhdWA/LUf+O6d1xq4dHPr+EB0cxhSGhOCBNJHLSSHUkw
	 IKgqimkhjoiouLXZ3v/z1Bv9pKIG9H9+YbVclnB57aFmmj95YNA7FllRPz0vFlfZ3z
	 MEy58VFZcdA2Rp+WCM16+c5x6yObn0yRQrbwgJ1rPK/iEMd4U7sNfLfWle36jE9poS
	 yGa2VHpzM+zKQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6c905a46so4407532e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:00:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSC0TCrPl2wy2Fry+/CJkrtORjrjw5YdASRmUWND6HKxvRlyx0hNaqfNo3X5rz6wGR9YTFbgKbzCGjZgYO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lmw9XCPtdPMCJOPO3AJo4L/ckHgoPDqhiHkDCwq0CfD2kmmU
	O2w4u8dYhaaFmlr7pZJsksSVFJA/9ibDbIaol7umZHounm4AuyDRVOPiBjnu0pAqOidwCTbhMSx
	jajcKTeR8JcWxld2R7PHhCEeumImfvpAGCRn7giiI3Q==
X-Received: by 2002:a05:6512:3c90:b0:59b:809c:f659 with SMTP id
 2adb3069b0e04-59baef00064mr3462366e87.40.1768831225908; Mon, 19 Jan 2026
 06:00:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:24 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:24 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoS2-00000005H1N-12dx@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk> <E1vhoS2-00000005H1N-12dx@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 14:00:24 +0000
X-Gmail-Original-Message-ID: <CAMRc=Me9wAstONC60jdu0z1QrADZ01_2+goZ1pOXbAx04W5LDA@mail.gmail.com>
X-Gm-Features: AZwV_QiictzFqKNrCGHQtJGJYIyDzY-qHcNhS9W5nbIYTCl5UyVNn5jCiAv_d8c
Message-ID: <CAMRc=Me9wAstONC60jdu0z1QrADZ01_2+goZ1pOXbAx04W5LDA@mail.gmail.com>
Subject: Re: [PATCH net-next 02/14] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jan 2026 13:33:46 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

