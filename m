Return-Path: <linux-arm-msm+bounces-50048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B5A4CC7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7705C1889764
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42959235362;
	Mon,  3 Mar 2025 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dew8SKHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84815225390;
	Mon,  3 Mar 2025 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032722; cv=none; b=L7vRC/kb39fQGPPqSIKv4o1QtYytccy/w6RmPHmTjmFT2B/mGOKNFieF3uMS6xMgOPjm+u1VGrR095UJB/PZt3rw6dvhdH1uOsmYHt/UfwuoNFogz4+tq08f8wlaHSq7P1coP0UxSnueUqfGYhYG0WTB2kzcTznPwMlNxp0Udxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032722; c=relaxed/simple;
	bh=LazGdWrj8vtVKdJudr76WaxvRjZ4i8agEN2wOJCbIFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=EY8ViQlbXnlobBqlXM6YJGgQ5k8Gkb1sG0yB3nTJpCUW844LA9Fqf2e3H8Q0+A3McjgdKOo2aW4wnKQJ1pdTRIbKdbSvxeTvUcR8ZiQC7PjbKG/UlQUPKDxkYaawN79Lc42c8PzoVFJupD7Qssg2Xkjm1zno/k7VaNdt9zrUHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dew8SKHJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso7900325e9.0;
        Mon, 03 Mar 2025 12:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032719; x=1741637519; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uWxfPZ9Q9PKdspux27aAUMfhltwVPuv3Rq9ADQuniAM=;
        b=Dew8SKHJUuitO+tiEH3iX+WNgwuJKeqsOc3wgeSKYwOioT/SnL+HB86Dp5NynUKu0B
         aaxVMMPSnvZgMbVW35WDZ5Atc57J+RUMkBbmMF0UkO1aK7q+AE1dpEmUS1vq23UK+WX9
         SLyeYve6tUpQpqzihp9aVeGhhhxwDaGkiumj9Q5Pv5tN0zKjTjg1ShTKRzrYVlrV7Zx/
         PS7njeMI0ojyAQTw3IhIAaB03IjOsjPu/y3yfPmPrnAmTmKy/LxQNK3QK6icejoxVJbp
         O/q2IAnoXJpIulPbtuWnImz1FbbeJbyasO9LedGbCzr0A8B4z0FqE73k0zyQ+adV+pty
         1iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032719; x=1741637519;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWxfPZ9Q9PKdspux27aAUMfhltwVPuv3Rq9ADQuniAM=;
        b=S3a2wcLIMRwHnZmhpJONUwBtqyejS0Qlo+NXgW54yPyA6hyJxYDCO2OyjldWSvQuEb
         qSKP3/S8heYlWTCUDlrLD4hDqjiING9bHsvoViqpEj9TXoGHYVlha7glU8NuKBXbEaor
         99gfoI+haXy7fDsaMj14ndQqAAsUWx41sf5zONqW31dncNLxXF5WiTWrnnl1j7FceRn1
         u4RSWag1hGADW6YaLj997hdBB0yjnq0K89FWCxIE4WiVuNawT2AvxItBhz0vvtVoW/op
         NKFzr290b+q+2gMXRb5fJjihcRyyztAoAaR24BusWvyobuIvvomZF9ZhzMD8jCGDhUG0
         0zYA==
X-Forwarded-Encrypted: i=1; AJvYcCVRPX+spPoqRk/OiIGpglEiXO35uCYczKsKGl3EJ8Y3o1swshkVGNEFFeRAxwN5OgKoE16t/eZfNneAC7rl@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWxkCJPa8F/d42IKFJlvzUAE+nTXaKf8KhdhXIzaWQJRo53O2
	hACBRXw9EeaKQmTBwWTWNx90XXp4C+2KLDelvJCZgMQ9Mx3FYWIC
X-Gm-Gg: ASbGncuH88pqL1U9iUmi07z6URj+9q0wCtztg53YR8T394qamWyWeGcfyoBPxeYAhup
	vEC68d/amhg8Elk7xCFsRwviMCGb+EIx7Oj4M9kR1ReDKBKb25u8GiVNm7qy/en6MYyPdOLObL7
	7Na+WV8yy8FE+6LeO46WphVnMNM+6n+CgS3NbesnJijvxqtApM8RDW6zB2Ml68ILD4cN34vMdgj
	WV9yuGqLcJpEudRGlyFljmvOKr+tJcWo/ZfKiOXtIt3YnXkNlmbEOgfF93rON/fbV+1oji6oqXW
	Ug4IwobYTAinVb/TpZ+H3Ys1Wip7dJDmyNM12rqqoWCL77xANbZfn6L6TExMEEdZH4bp+bjl+DH
	MyLvfar4ExIj6vmTzz7TG3JmGZs0Qd/cRQF5d3KJI6RPE43+CkLRont+jTwSsvfiomJpwcnoelw
	KFXUPbMIbT+SYNxWpdfilJv4lS8oC/uFx46V8x
X-Google-Smtp-Source: AGHT+IGrliRmZWsiNQ1SKtuhzNkpQ2g/Wj6wuMuWur5bf49+A4+rdLUGngy6KWs9s/OHdhPuU7bzng==
X-Received: by 2002:a05:6000:18ac:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-3910454634cmr6485950f8f.48.1741032718374;
        Mon, 03 Mar 2025 12:11:58 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43b736f75c6sm169721715e9.1.2025.03.03.12.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:11:57 -0800 (PST)
Message-ID: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Date: Mon, 3 Mar 2025 21:13:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v3 0/8] net: phy: move PHY package code to its own
 source file
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series contributes to cleaning up phylib by moving PHY package
related code to its own source file.

v2:
- rename the getters
- add a new header file phylib.h, which is used by PHY drivers only
v3:
- include phylib.h in bcm54140.c

Heiner Kallweit (8):
  net: phy: move PHY package code from phy_device.c to own source file
  net: phy: add getters for public members in struct phy_package_shared
  net: phy: qca807x: use new phy_package_shared getters
  net: phy: micrel: use new phy_package_shared getters
  net: phy: mediatek: use new phy_package_shared getters
  net: phy: mscc: use new phy_package_shared getters
  net: phy: move PHY package related code from phy.h to phy_package.c
  net: phy: remove remaining PHY package related definitions from phy.h

 drivers/net/phy/Makefile              |   3 +-
 drivers/net/phy/bcm54140.c            |   1 +
 drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
 drivers/net/phy/micrel.c              |   9 +-
 drivers/net/phy/mscc/mscc_main.c      |   2 +
 drivers/net/phy/mscc/mscc_ptp.c       |  14 +-
 drivers/net/phy/phy-core.c            |   1 +
 drivers/net/phy/phy_device.c          | 237 -----------------
 drivers/net/phy/phy_package.c         | 350 ++++++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h     |   2 +
 drivers/net/phy/phylib.h              |  28 +++
 drivers/net/phy/qcom/qca807x.c        |  16 +-
 include/linux/phy.h                   | 124 ---------
 13 files changed, 410 insertions(+), 384 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c
 create mode 100644 drivers/net/phy/phylib.h

-- 
2.48.1


