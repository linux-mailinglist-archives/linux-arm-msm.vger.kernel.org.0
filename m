Return-Path: <linux-arm-msm+bounces-50049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B2BA4CC82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B77160D37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034C523642B;
	Mon,  3 Mar 2025 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIwbCEoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C72356B2;
	Mon,  3 Mar 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032778; cv=none; b=W//Du41729oOA2GbivAiFvqK/Dtm/ZJu483iW45v4NZLud93bd4AaaMr40mK+ud4p2Cq5NurqRvOeFSzVMGEFa7JeoMAV/EpYJjMIkhYRBhZkNrxwwuiMn2kLjfQjmgD9l3FAjn4GTj0hd+KC/y4TTZ/izqK8JoJ1oWOt0pb2xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032778; c=relaxed/simple;
	bh=VUXuwRBNBccHLZtMavhpBQ0yUyfJBtHm2Q6FyTQH2rM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R0L4H41qwJI6xXVoBmOajWPDZye8ZmX3+3UO/qj5sZQA4rs3KZuPLzKpAnTOnurH3ZWLFE9AzKcWBdimm3Hl519fa7RoGAlS5SCSx2jluNQEBCMfN/6Lz8jEE79weyT3L5P9aBLC2ZMsfjUuhLRge5K8pLH6Zxwx2C/5J/x6Z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIwbCEoS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so33577065e9.0;
        Mon, 03 Mar 2025 12:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032775; x=1741637575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h9qG8BT2xfz5J4kWG3W63aa1AkaaS0DpNQsWbgtOsUE=;
        b=HIwbCEoSCQa3jkn5bT2BTR9D06wpq/DMRWgXsLt6hvuCCiHoQEyaRcgHKgyTYLiPm6
         iT80RwFqNxOYzHXSojF8K2iELR9BeaRxXf4ozWIVzYD+FjWIi8/e5FMY0Fn81nQ/62Bz
         p/f015FzCvCoZGIPLpv4PZfaiYf37HP7JRvlqM/Gd4/a04PD6vaLN1jTjqAcNtea0hat
         0gQS0fxk0xMpF0m6BN2IWPEH8hxmSiaoh9FqD9TqwgId2gxhJweQD08EkBP9AwU1OkiJ
         n9yh2z/YHRltjku7FTio79X90r9tp2VyCMF5EKBEyabkndPebChRCCtQELcfzeNqAaEl
         THJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032775; x=1741637575;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9qG8BT2xfz5J4kWG3W63aa1AkaaS0DpNQsWbgtOsUE=;
        b=YCSD19es1aF3546VUSfRcvQ9Po8WpA6rtZ+OiNJ/ETXswR3Nkpk2zpGtFI15h/7dan
         KgXgGaj6neYESpBtWZ57FGwFX0xC2ufqwBLqqc6vbjqSoht3vqq6vA37MUw+fNFRPj5H
         YMa17yjD5N//VIUxEoJ/36Wh4E1WLTJ7Bbz9vUOgQmINzmCN+/fWm9yIZcfnEWms36HD
         7dDV5hoiwmDmiqMLKv+zYtsd0CIsNSJpBtvUDawvS2eiXhrDd+MApm0zne88u963XEfm
         Bixm+IHTKUBTvjND56Mi5djj1ThuXrM1bf7AamRw9MzmDcC/J5DBLClQgUMc1MknctDl
         sVzw==
X-Forwarded-Encrypted: i=1; AJvYcCXy6z9jZ4f8+r4U6OrcbK/GyZy+pDAr/BNQWpWs5M3TbOf28WXaWcBiJnvAdkcf4kv/5sQex2/oCrAVvAQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tjmha4QNPF6xkMmw8t4SZASO0zo8T9TGxUnGOCwGX55rKQAf
	WqUr4dQ+unnCuluuFa4HuRtFEb6n5WMGDDyI8t01WYpj684zd/oU
X-Gm-Gg: ASbGncsfwfN4JBvqmxeRGJmWZJI7od8V0w2DH91SGCMmLfL6iAe+8RTmqhuk+JGT+yF
	Q3tsUza5A5WMVDV+wW919PvK0cI5ginkOX+NhE8EY72foTHDlYkFkhOnzEZkSDOMVFgs6iztRcu
	Px6RRmATdscG8saUhrZxRmQSEbQU1Z6aw5LSaxswCk9wmtk8jfUriPBTDcrV64AFNnkmTUGAKB5
	tFo6zNAdfRXz2gPhuPgLwNYs7nVvvoeH81piLv/gCj8FSRN2JaOeeoJ5PrniYifo+68G7B4ky9o
	fltPwL4Nd1juG8dAr0HeraD6mcIPKgSi3gdC8v8FXhn3S61MhsJIMMuMvaXXCQwDIOzaWj1Sqej
	/saUaFRsa8akrFH0CnJf5w2njC45J6j4zAVA5EvKvt3t3avm5C7LAnT6xALZ30Ujeq1zRzvBnXK
	qGxk+hCF+rlz8HqIqAR4BrOGaiGL5T349JPjqJ
X-Google-Smtp-Source: AGHT+IGtg2RZs2OP36MRQcKWWR4cPqIy/XP3QPtq4n2Y70LXeh2l2L6fkjaDzoDJ0TBRJVSn5wu9hA==
X-Received: by 2002:a05:600c:4fc4:b0:43b:cb96:3cd0 with SMTP id 5b1f17b1804b1-43bcb963fc2mr722665e9.26.1741032774582;
        Mon, 03 Mar 2025 12:12:54 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm172148255e9.16.2025.03.03.12.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:12:54 -0800 (PST)
Message-ID: <57df5c19-fbcd-45a7-9afd-cd4f74d7fa76@gmail.com>
Date: Mon, 3 Mar 2025 21:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 1/8] net: phy: move PHY package code from
 phy_device.c to own source file
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This patch is the first step in moving the PHY package related code
to its own source file. No functional change intended.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Makefile      |   3 +-
 drivers/net/phy/phy_device.c  | 237 ---------------------------------
 drivers/net/phy/phy_package.c | 244 ++++++++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+), 238 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index c8dac6e92..8f9ba5e82 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Linux PHY drivers
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
-				   linkmode.o phy_link_topology.o
+				   linkmode.o phy_link_topology.o \
+				   phy_package.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_MDIO_DEVICE
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a38d399f2..b2d32fbc8 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1686,243 +1686,6 @@ bool phy_driver_is_genphy_10g(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_driver_is_genphy_10g);
 
-/**
- * phy_package_join - join a common PHY group
- * @phydev: target phy_device struct
- * @base_addr: cookie and base PHY address of PHY package for offset
- *   calculation of global register access
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * This joins a PHY group and provides a shared storage for all phydevs in
- * this group. This is intended to be used for packages which contain
- * more than one PHY, for example a quad PHY transceiver.
- *
- * The base_addr parameter serves as cookie which has to have the same values
- * for all members of one group and as the base PHY address of the PHY package
- * for offset calculation to access generic registers of a PHY package.
- * Usually, one of the PHY addresses of the different PHYs in the package
- * provides access to these global registers.
- * The address which is given here, will be used in the phy_package_read()
- * and phy_package_write() convenience functions as base and added to the
- * passed offset in those functions.
- *
- * This will set the shared pointer of the phydev to the shared storage.
- * If this is the first call for a this cookie the shared storage will be
- * allocated. If priv_size is non-zero, the given amount of bytes are
- * allocated for the priv member.
- *
- * Returns < 1 on error, 0 on success. Esp. calling phy_package_join()
- * with the same cookie but a different priv_size is an error.
- */
-int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size)
-{
-	struct mii_bus *bus = phydev->mdio.bus;
-	struct phy_package_shared *shared;
-	int ret;
-
-	if (base_addr < 0 || base_addr >= PHY_MAX_ADDR)
-		return -EINVAL;
-
-	mutex_lock(&bus->shared_lock);
-	shared = bus->shared[base_addr];
-	if (!shared) {
-		ret = -ENOMEM;
-		shared = kzalloc(sizeof(*shared), GFP_KERNEL);
-		if (!shared)
-			goto err_unlock;
-		if (priv_size) {
-			shared->priv = kzalloc(priv_size, GFP_KERNEL);
-			if (!shared->priv)
-				goto err_free;
-			shared->priv_size = priv_size;
-		}
-		shared->base_addr = base_addr;
-		shared->np = NULL;
-		refcount_set(&shared->refcnt, 1);
-		bus->shared[base_addr] = shared;
-	} else {
-		ret = -EINVAL;
-		if (priv_size && priv_size != shared->priv_size)
-			goto err_unlock;
-		refcount_inc(&shared->refcnt);
-	}
-	mutex_unlock(&bus->shared_lock);
-
-	phydev->shared = shared;
-
-	return 0;
-
-err_free:
-	kfree(shared);
-err_unlock:
-	mutex_unlock(&bus->shared_lock);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(phy_package_join);
-
-/**
- * of_phy_package_join - join a common PHY group in PHY package
- * @phydev: target phy_device struct
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * This is a variant of phy_package_join for PHY package defined in DT.
- *
- * The parent node of the @phydev is checked as a valid PHY package node
- * structure (by matching the node name "ethernet-phy-package") and the
- * base_addr for the PHY package is passed to phy_package_join.
- *
- * With this configuration the shared struct will also have the np value
- * filled to use additional DT defined properties in PHY specific
- * probe_once and config_init_once PHY package OPs.
- *
- * Returns < 0 on error, 0 on success. Esp. calling phy_package_join()
- * with the same cookie but a different priv_size is an error. Or a parent
- * node is not detected or is not valid or doesn't match the expected node
- * name for PHY package.
- */
-int of_phy_package_join(struct phy_device *phydev, size_t priv_size)
-{
-	struct device_node *node = phydev->mdio.dev.of_node;
-	struct device_node *package_node;
-	u32 base_addr;
-	int ret;
-
-	if (!node)
-		return -EINVAL;
-
-	package_node = of_get_parent(node);
-	if (!package_node)
-		return -EINVAL;
-
-	if (!of_node_name_eq(package_node, "ethernet-phy-package")) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	if (of_property_read_u32(package_node, "reg", &base_addr)) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	ret = phy_package_join(phydev, base_addr, priv_size);
-	if (ret)
-		goto exit;
-
-	phydev->shared->np = package_node;
-
-	return 0;
-exit:
-	of_node_put(package_node);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(of_phy_package_join);
-
-/**
- * phy_package_leave - leave a common PHY group
- * @phydev: target phy_device struct
- *
- * This leaves a PHY group created by phy_package_join(). If this phydev
- * was the last user of the shared data between the group, this data is
- * freed. Resets the phydev->shared pointer to NULL.
- */
-void phy_package_leave(struct phy_device *phydev)
-{
-	struct phy_package_shared *shared = phydev->shared;
-	struct mii_bus *bus = phydev->mdio.bus;
-
-	if (!shared)
-		return;
-
-	/* Decrease the node refcount on leave if present */
-	if (shared->np)
-		of_node_put(shared->np);
-
-	if (refcount_dec_and_mutex_lock(&shared->refcnt, &bus->shared_lock)) {
-		bus->shared[shared->base_addr] = NULL;
-		mutex_unlock(&bus->shared_lock);
-		kfree(shared->priv);
-		kfree(shared);
-	}
-
-	phydev->shared = NULL;
-}
-EXPORT_SYMBOL_GPL(phy_package_leave);
-
-static void devm_phy_package_leave(struct device *dev, void *res)
-{
-	phy_package_leave(*(struct phy_device **)res);
-}
-
-/**
- * devm_phy_package_join - resource managed phy_package_join()
- * @dev: device that is registering this PHY package
- * @phydev: target phy_device struct
- * @base_addr: cookie and base PHY address of PHY package for offset
- *   calculation of global register access
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * Managed phy_package_join(). Shared storage fetched by this function,
- * phy_package_leave() is automatically called on driver detach. See
- * phy_package_join() for more information.
- */
-int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int base_addr, size_t priv_size)
-{
-	struct phy_device **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = phy_package_join(phydev, base_addr, priv_size);
-
-	if (!ret) {
-		*ptr = phydev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_phy_package_join);
-
-/**
- * devm_of_phy_package_join - resource managed of_phy_package_join()
- * @dev: device that is registering this PHY package
- * @phydev: target phy_device struct
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * Managed of_phy_package_join(). Shared storage fetched by this function,
- * phy_package_leave() is automatically called on driver detach. See
- * of_phy_package_join() for more information.
- */
-int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
-			     size_t priv_size)
-{
-	struct phy_device **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = of_phy_package_join(phydev, priv_size);
-
-	if (!ret) {
-		*ptr = phydev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
-
 /**
  * phy_detach - detach a PHY device from its network device
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
new file mode 100644
index 000000000..260469f02
--- /dev/null
+++ b/drivers/net/phy/phy_package.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * PHY package support
+ */
+
+#include <linux/of.h>
+#include <linux/phy.h>
+
+/**
+ * phy_package_join - join a common PHY group
+ * @phydev: target phy_device struct
+ * @base_addr: cookie and base PHY address of PHY package for offset
+ *   calculation of global register access
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * This joins a PHY group and provides a shared storage for all phydevs in
+ * this group. This is intended to be used for packages which contain
+ * more than one PHY, for example a quad PHY transceiver.
+ *
+ * The base_addr parameter serves as cookie which has to have the same values
+ * for all members of one group and as the base PHY address of the PHY package
+ * for offset calculation to access generic registers of a PHY package.
+ * Usually, one of the PHY addresses of the different PHYs in the package
+ * provides access to these global registers.
+ * The address which is given here, will be used in the phy_package_read()
+ * and phy_package_write() convenience functions as base and added to the
+ * passed offset in those functions.
+ *
+ * This will set the shared pointer of the phydev to the shared storage.
+ * If this is the first call for a this cookie the shared storage will be
+ * allocated. If priv_size is non-zero, the given amount of bytes are
+ * allocated for the priv member.
+ *
+ * Returns < 1 on error, 0 on success. Esp. calling phy_package_join()
+ * with the same cookie but a different priv_size is an error.
+ */
+int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size)
+{
+	struct mii_bus *bus = phydev->mdio.bus;
+	struct phy_package_shared *shared;
+	int ret;
+
+	if (base_addr < 0 || base_addr >= PHY_MAX_ADDR)
+		return -EINVAL;
+
+	mutex_lock(&bus->shared_lock);
+	shared = bus->shared[base_addr];
+	if (!shared) {
+		ret = -ENOMEM;
+		shared = kzalloc(sizeof(*shared), GFP_KERNEL);
+		if (!shared)
+			goto err_unlock;
+		if (priv_size) {
+			shared->priv = kzalloc(priv_size, GFP_KERNEL);
+			if (!shared->priv)
+				goto err_free;
+			shared->priv_size = priv_size;
+		}
+		shared->base_addr = base_addr;
+		shared->np = NULL;
+		refcount_set(&shared->refcnt, 1);
+		bus->shared[base_addr] = shared;
+	} else {
+		ret = -EINVAL;
+		if (priv_size && priv_size != shared->priv_size)
+			goto err_unlock;
+		refcount_inc(&shared->refcnt);
+	}
+	mutex_unlock(&bus->shared_lock);
+
+	phydev->shared = shared;
+
+	return 0;
+
+err_free:
+	kfree(shared);
+err_unlock:
+	mutex_unlock(&bus->shared_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_package_join);
+
+/**
+ * of_phy_package_join - join a common PHY group in PHY package
+ * @phydev: target phy_device struct
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * This is a variant of phy_package_join for PHY package defined in DT.
+ *
+ * The parent node of the @phydev is checked as a valid PHY package node
+ * structure (by matching the node name "ethernet-phy-package") and the
+ * base_addr for the PHY package is passed to phy_package_join.
+ *
+ * With this configuration the shared struct will also have the np value
+ * filled to use additional DT defined properties in PHY specific
+ * probe_once and config_init_once PHY package OPs.
+ *
+ * Returns < 0 on error, 0 on success. Esp. calling phy_package_join()
+ * with the same cookie but a different priv_size is an error. Or a parent
+ * node is not detected or is not valid or doesn't match the expected node
+ * name for PHY package.
+ */
+int of_phy_package_join(struct phy_device *phydev, size_t priv_size)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *package_node;
+	u32 base_addr;
+	int ret;
+
+	if (!node)
+		return -EINVAL;
+
+	package_node = of_get_parent(node);
+	if (!package_node)
+		return -EINVAL;
+
+	if (!of_node_name_eq(package_node, "ethernet-phy-package")) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (of_property_read_u32(package_node, "reg", &base_addr)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = phy_package_join(phydev, base_addr, priv_size);
+	if (ret)
+		goto exit;
+
+	phydev->shared->np = package_node;
+
+	return 0;
+exit:
+	of_node_put(package_node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_phy_package_join);
+
+/**
+ * phy_package_leave - leave a common PHY group
+ * @phydev: target phy_device struct
+ *
+ * This leaves a PHY group created by phy_package_join(). If this phydev
+ * was the last user of the shared data between the group, this data is
+ * freed. Resets the phydev->shared pointer to NULL.
+ */
+void phy_package_leave(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+
+	if (!shared)
+		return;
+
+	/* Decrease the node refcount on leave if present */
+	if (shared->np)
+		of_node_put(shared->np);
+
+	if (refcount_dec_and_mutex_lock(&shared->refcnt, &bus->shared_lock)) {
+		bus->shared[shared->base_addr] = NULL;
+		mutex_unlock(&bus->shared_lock);
+		kfree(shared->priv);
+		kfree(shared);
+	}
+
+	phydev->shared = NULL;
+}
+EXPORT_SYMBOL_GPL(phy_package_leave);
+
+static void devm_phy_package_leave(struct device *dev, void *res)
+{
+	phy_package_leave(*(struct phy_device **)res);
+}
+
+/**
+ * devm_phy_package_join - resource managed phy_package_join()
+ * @dev: device that is registering this PHY package
+ * @phydev: target phy_device struct
+ * @base_addr: cookie and base PHY address of PHY package for offset
+ *   calculation of global register access
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * Managed phy_package_join(). Shared storage fetched by this function,
+ * phy_package_leave() is automatically called on driver detach. See
+ * phy_package_join() for more information.
+ */
+int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
+			  int base_addr, size_t priv_size)
+{
+	struct phy_device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = phy_package_join(phydev, base_addr, priv_size);
+
+	if (!ret) {
+		*ptr = phydev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_phy_package_join);
+
+/**
+ * devm_of_phy_package_join - resource managed of_phy_package_join()
+ * @dev: device that is registering this PHY package
+ * @phydev: target phy_device struct
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * Managed of_phy_package_join(). Shared storage fetched by this function,
+ * phy_package_leave() is automatically called on driver detach. See
+ * of_phy_package_join() for more information.
+ */
+int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
+			     size_t priv_size)
+{
+	struct phy_device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_phy_package_join(phydev, priv_size);
+
+	if (!ret) {
+		*ptr = phydev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
-- 
2.48.1



