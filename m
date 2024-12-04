Return-Path: <linux-arm-msm+bounces-40298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A45359E3EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5192855F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E11199B8;
	Wed,  4 Dec 2024 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA9NUZnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7E768FD;
	Wed,  4 Dec 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327868; cv=none; b=GxQJy902+YiKKZ8B2UCZ6qCkW14dDuZEgbWz2AnryzBixCiiv7eldDAJV2epDI+6MA2pl/7DOn1rkOwUy6ABazTQB6UjShsMyhiyyzFky73tUVLQZwgdytTgOElXH7Ko1fBrDqSxm/UWqnsIygcg5kr5DvgEDtvXA8z8ob/WGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327868; c=relaxed/simple;
	bh=YnG7z0fOKJrMFIenIZn/cMyKITkPo1UCS66LL8X/56M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGAZL40xByrnpgXgTNWTgqnL+BTHzEr/blqlkOaECkWVf/c+wbWNUEb/fVmJB7EPaMc3cprLVR8MnHlOLNhip3RuRb3CEsnUh8KOZ/NjgpyJwpJagPK5kuSLWquOhnfaob9N5getAEZrpNsFGLwGMW+v7fJYi2za4rlS2eXsMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA9NUZnU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e1be0ec84so1697949e87.1;
        Wed, 04 Dec 2024 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327865; x=1733932665; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=SA9NUZnU+wfQ8clMcHW/kaoi5fpqrfqwAN9CgYg/E/RTdFNYtQ5oXjTBQDju2wNmpu
         G8KI4eNiQ7JBJQ+/C3M+doEw9eLi2YDR1GXr9eHtszFm4wsueYDvzXFRRePi+f/7Fnje
         MGKly51cjhOqMcqxOD1q82oNi9mtzf7GZax6D07ciRKNitadfs0YeWB/zVbKjmKJw+5r
         spAk4JOXYJFh+dtUwovQHN9GyG1dVJo+F76RXCqVKBKbeXRRvEv05pYMYKM9gWm/BSug
         ka+gV65pxk8VwxEHtDq0HwB1wAOFvqTRIspIWdZMhI1vuTfQmPZ4RAhO5qnHX2H8X53H
         n2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327865; x=1733932665;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=minERGmyn+CMwQIG7BcMJPq79yxKx3XP8LEdMJAb+9WeyIll9D8QuZCshiXkERhGWp
         ow9BsJIeYXWmDU0qUamekqstY/izu6LgblTij0Kh/r+I+LBVp3WGNG6xA5H1ZxRh1cwM
         RFSiV9unDIIFg+OHmqq1mwYbe4gHpiMwVN5NNYaqfKQZMw9IKrqcfBgHk4cvGjoqQRPM
         +5Gy5g2OId8byWv4UfohcpcI8y0hbFwbQ5R/O86jglhnFWutmzqoUOxin308ao0CvfxE
         MvsatdwTTWp4af4Dsq201A1jMlG+bNZB77Rj8LwgLVDrcEx34TuP/TckHE0aO/qv3sLM
         xXBA==
X-Forwarded-Encrypted: i=1; AJvYcCWYe/ao2V4ZlqkPRQhB3AqinZN7K+EUJg1jOxOMNzdwWTXFOiqvbGkICOy1J3Zxe1j/5jAXsZyofrwLY6nV@vger.kernel.org, AJvYcCWvzJoxblLUTK9ZiCJf4u9b2sSij+6puVdKENXNr/MjQck2EOWu5sDKX+auI37Pgzih4wa5gooa4cI9+Xpf@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhp1Ri1tb59mF9LYP+meiX8xyLRPycW8tNELWPWSE1eSSyzJJ
	rsM0nVTCdcFPGE6QMuCaX3lSq9a/CQ5w/1pXYqtgD7KSoOqqZ6Sb
X-Gm-Gg: ASbGncvAHp9BhEAr8yGoLdQ3nAvzi2lt6oSlWXvhOZmRgUFrLydCC1kVwx3XbDq7yqG
	Bi4tR8vsGSTi8P+aGMKc1F7KIe2U16nx7zKpONlBq0hoRfbsVpPpg2aXl2N6T+gvjRJ2ByqB3mt
	6M/UQZWeoadqM4EVrJoMIAu7hUrdgXY52VhDr44ccYej6Gx2VSBnJAOARh15Ziek+romXRfrFqE
	7qrQq70cewmozD1pkEPftdEijqosKlNUD9vJLlMZBaXYPh/DCjJGHT5I4VmQGO0ms0gG1QW4G0O
	eok+QND+VZUsduA=
X-Google-Smtp-Source: AGHT+IEy9n6nxWmwqhFSvEOtXxa2/T4QYEk0NY96t8djbuTb5+3DKRoxBp5roEh8mU61qF3g4m3EWA==
X-Received: by 2002:a05:6512:234a:b0:53d:e4d2:bb9 with SMTP id 2adb3069b0e04-53e12a3521cmr4486318e87.54.1733327864801;
        Wed, 04 Dec 2024 07:57:44 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:43 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/9] Rebuild default configurations for some ARM boards
Date: Wed, 04 Dec 2024 16:56:42 +0100
Message-Id: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALp7UGcC/x3MQQqAIBBA0avIrBN0sIKuEi1iHG02GgoRiHdPW
 r7F/w0qF+EKm2pQ+JEqOQ3YSQFdZ4qsxQ8DGnQWjdOeA+UUJFa9muVE62lmRzCCu3CQ95/tR+8
 f4GScaFwAAAA=
X-Change-ID: 20241204-defconfigs-706a21dc5e4c
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YnG7z0fOKJrMFIenIZn/cMyKITkPo1UCS66LL8X/56M=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvE/sKv4AaxRiWeBOth6xz467RGh5qwWXEon
 sjLcr5gT5eJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7xAAKCRCIgE5vWV1S
 MimdEADQXFpBCP3zM2ifwMzmUGOrx6G7P/aLw8UR67mVpyR+t5nSRIqRdDwJGb0BbSdwEKFGuZd
 MgOPNFZDkKduYqnqfcFoPOW0s6GKmNBsH6zsCvx3n2XwX6nvGVzl8P7DZqfNE+a7DajajRt74pq
 tI6bpsVDQLM/7hphDkLVkOb3MiITjryc57v9p3DSsqZf4Zr2ImKOtt+pvXTmrpmSld96R6LmOVJ
 A23Z/cRjWRtKyJnlFwt982t/zVsu24ebApAvTHYT4aZ4EY2nkWIgBTbUtdZZjF4J2DWu61JCRrb
 /AubGtaFC/Gt5c7CVhHYEF1VYEJLULwdEVesAxMGAU89wfPCzt2dC9k656g6jxUejosEt7txbq4
 0ALq/dp9tb34ud+PvelWF1kw9peKgw18yyitFo9jy5fAliMcNTOFSfJ+ddzs5r//pZiVvTL8WDS
 8AQd1z6bpr2y6imt3u4J3Jr/xT+iF+klJgp88h1lrgIi9i6JRgVtPjhYJ6sRpW+j5iRDe5caHuT
 ENZDbbatG80h/+IjrAbYJNoERNarGQWuCFyDCt40sjZ3vi9E+ymYJh7IE7RxXPHmcvZfqymPWP7
 1OumeLUAJ2WwfFS8ehe9mJ+bfqVuTY+xSovrB0r5XzWP3OALPcnEFly/lPjTiatJmuD/VWCDATH
 tG0cwW70ZxepPsA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

I was building Yocto for a davinci based board and got the following:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_MTD_M25P80
     - CONFIG_DRM_TINYDRM

Both of these configuration options are obsolete in newer kernels.
When searching the tree for other instances of these I found a few in
other defconfig files.

This series is simply a
$ make foo_defconfig
$ make savedefconfig
$ cp defconfig arch/arm/configs/foo_defconfig

for those defconfigs that contained any of the options listed above.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (9):
      ARM: axm55xx_defconfig: rebuild default configuration
      ARM: davinci_all_defconfig: rebuild default configuration
      ARM: dove_defconfig: rebuild default configuration
      ARM: keystone_defconfig: rebuild default configuration
      ARM: mvebu_v5_defconfig: rebuild default configuration
      ARM: mxs_defconfig: rebuild default configuration
      ARM: pxa_defconfig: rebuild default configuration
      ARM: qcom_defconfig: rebuild default configuration
      ARM: socfpga_defconfig: rebuild default configuration

 arch/arm/configs/axm55xx_defconfig     | 30 ---------------
 arch/arm/configs/davinci_all_defconfig | 18 ---------
 arch/arm/configs/dove_defconfig        | 11 ------
 arch/arm/configs/keystone_defconfig    | 12 +-----
 arch/arm/configs/mvebu_v5_defconfig    |  8 ----
 arch/arm/configs/mxs_defconfig         | 11 ------
 arch/arm/configs/pxa_defconfig         | 69 +---------------------------------
 arch/arm/configs/qcom_defconfig        | 27 +------------
 arch/arm/configs/socfpga_defconfig     |  3 --
 9 files changed, 4 insertions(+), 185 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241204-defconfigs-706a21dc5e4c

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


