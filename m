Return-Path: <linux-arm-msm+bounces-50864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C4A59AA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 17:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9874E3A7309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 16:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE5A22C327;
	Mon, 10 Mar 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFdLWwR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB30522D4DE;
	Mon, 10 Mar 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741622751; cv=none; b=ZPrzYBx+6DKkeoaIculzp4KbGrzs4NZF27nNGYK4/fiJiQRzlbrQtNMLefQTTCaq+lGgDPRutw9ZbgywtbJC9nfid40oFN/iwQ+9wZtWJVdFChqgIl0+uX8UO2SfmpCauz80PClh2K2iATvUZPma/VoPbu0b49upE6v6pNYl8dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741622751; c=relaxed/simple;
	bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqzcbANwYP6b4CgP1AhJQ0VzbVX+VXdmRTYln3T0ceK74Foe/LntN25CEPxYLyyNHC0SlnvFzJHqrLdFpbXweJqa4kDmdu/zxGTL5LVewcctz7VuENTUU289aN6CeXPobMJTnAxzKsy/cJPD1+TCQYSeyu/bwm5GcJk7oitga6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFdLWwR6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso27034305e9.2;
        Mon, 10 Mar 2025 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741622748; x=1742227548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=UFdLWwR69Mq7wYurBaUVZ8xlw6NHfRTsErBWOwwtDaaMqUvxrpwnAdQVRSQHmlZxvB
         v7Fxd8ecCd1Skb8HM+T61KQXKZq9Mde4RH3qMYQTAcRUMvTshNvdA59Wvjr0pskQvErx
         om3H7pg+HPlW00FpKVkekBte/se/RY/bLHZJmDZT0zSixBENkok9Ks+V+7EcC5Hkk/dM
         12X0F+YOdBHnoljpxqN5Q16pFe9Ki2o3zsEELxL8pBY7SQBSgCblPc7IPXHvS99cbQwL
         HRuXpM3FqMV3y1mdhMJc076LrIXbwF+0IuNcsspr+zk5SBOU5xvrDsR349uGGoIWXrEN
         juSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741622748; x=1742227548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=V4sdUKgS3aYAmZR23Bqroi1Rh9H+ape/mxACA6whL9mmHpb6na9gZy2HY5efD+q0ce
         YmXDhDQXlBmZrhh/4zRFbMtIXdvo7gaKaxIaMEJ3WL6XKXoYYinkZtPr1RmAr/nIKMSK
         aJvSh5BNZaxDWRPqwj3FXNqKd+WnTrgmkNsHAP7szXZZS5tmthEPNRDsgOIOEC3iTxl+
         6Va29htmdPb6OYY4Dc7rz6Wl5Wpx4QrkXz2JNoRKB2Z3pyc2SblQMGVsqrd/qCLKgM1b
         O614JCW3kK4Rvwv0xcLKWTfT87QBO9c4vr/DpquG4l2clhX4FM6oqLev2B2v8avZGkhL
         XgDw==
X-Forwarded-Encrypted: i=1; AJvYcCVkyQ+z0mKyZyq5v68NodCvECPe4A6HuGAZ8XY3t9vp9RGeoiyHYkea7OHp6YhK10gaWNSkA+Ao/02hQMAD@vger.kernel.org, AJvYcCWLQLtAj8gazEyMeefryfot2oGtJZQmutX/N5SH7INYMSmOgufZyuU9jV4hksnxG+awg0IovCAk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8OVKDJfR4Dhb9oLcBd7viDwrQeQslYWnOWqTLzhYhemysyZfO
	xzYEolG8smpUNPneL85bW4JJwERNiKgHchCqOez6YE2LXUaC5u4Z/vC46A==
X-Gm-Gg: ASbGnctFF1Dbwwus7z3kGg6dDpZRDOoWd1FhOtECPZAmiUX4eet/up6qHWj8MZJwfQ3
	JwaeLIxDnQxgMT++KKqVdlXj/iEBcyUatlWi4UpSDbxLkngO3YNJwXB+Lh1EF8NFyyqi21PJszq
	Xpzzkf6mJnqw3yIckXFSHZRUp1gDm5fzCK58THW+RJkYrOHuc4vpWjik5AmUqY7dtQLcz3w9p96
	79+o1GBnPfme7fPmLp7V5aZpR1wXiaRTNgsEZXdLXXGQEKPOy0WCNGUdyofi06pPpW7XG74R96O
	uxkrT55UoAkX5ok8vQw/nVx/zmYzuIkhu8Yw/85pZmMM6kYstkPw2gAIYz15SSUeIg2r8Y5VlJE
	eG9JT8MJ8dl4qCZmSs0iL
X-Google-Smtp-Source: AGHT+IH1HHf+1OpwkvFsYArfklWxYPjgWRGPYO6MW19aTR4oUCtXkTsxgz2AKwy1itY/6jY/cI2jWA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39145598929mr2906294f8f.36.1741622747749;
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfa0723c9sm34686035e9.6.2025.03.10.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 9/9] net: stmmac: sunxi: remove of_get_phy_mode()
Date: Mon, 10 Mar 2025 17:05:45 +0100
Message-ID: <2774218.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
References:
 <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
 <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 10. marec 2025 ob 13:10:59 Srednjeevropski standardni =C4=
=8Das je Russell King (Oracle) napisal(a):
> devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
> which is stored in plat_dat->phy_interface. Therefore, we don't need to
> get it in platform code.
>=20
> Set gmac->interface from plat_dat->phy_interface.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



