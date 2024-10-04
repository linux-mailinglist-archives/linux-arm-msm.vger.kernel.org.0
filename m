Return-Path: <linux-arm-msm+bounces-33071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE398FB50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DEAF1C231CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63101D14EC;
	Fri,  4 Oct 2024 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyRf2wcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6512B1D0F58;
	Fri,  4 Oct 2024 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000032; cv=none; b=Xy2sTqV4JPfwejw1wnsDHhw/urWSZIIewa42kVyKjiBWdQEnRBpbSurzFNyV52UcUrOVrC/QjOMHf7yNB6MmYG40sMKRenvB+Z9qGNJKPGzGeYit67dwu3SIHTkBFbwip8J76HGolF9fP9a22mxNFzP/WaejLUimj0ISnurG4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000032; c=relaxed/simple;
	bh=shHER4u0OAOXldgRE1LJnGWQ82XScGlYljOXINFDXdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHJW1azkRI+W6tRzskkPc2/xMb4UF4IOy/ubglr/Rql99RJgDt96RvFlLADvMsDbgtsEGU0WcmraUmEpuN4LlUs4ObCu7WZM+kqFR4Dw9iUZCtRev5pWhJer4Ry5VhWpQYbcL/MBOtSfpkaYf/oIII5umJokOU3lyiDIuHRK0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyRf2wcx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1295290b3a.1;
        Thu, 03 Oct 2024 17:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000030; x=1728604830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=MyRf2wcxahqMzjwKRyXpNjDR7lIOY5he0Viys+kEKwXY1A+J9XHxdv8uvIXqnXpWdQ
         vrjxPhpK7TADSWXSZ38CZ2eg8HbSUH0QnakEyvV5ayyKLuEG0ZQPsue3w+RT47PUX072
         k41zGiE0728gUx6RdZRBqSvVviw3aLanUxEHdK9HCM6Dacy6zfd4CSElgihmY4Po7iID
         uuLuIIpRiq6ArOm2T608o8hgTeYKhKulravXgkJ8raeH3812iYqx3ACrmj5+gAs4c2KV
         JoPGrgUoSXwyRvAbBm0hnI8mx16Zrqa1LzE64msQg/gko11B7miRgVxAFFFJlV6KUgBt
         KZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000030; x=1728604830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=Jein/26PuJQwhLAn+AhkJtrEh1eZrU9A5BpQOOZzqKMTJU+xZS34Sdf6mORh0jgr7c
         sR8a+yGin8eYKIYnxV/BiTEQK7HTuCWoRmzCG+2rAxkTr/pBhN/8xvnk5cH+E1PixVTv
         8pNwMugYnUmvKkwFgeARQAn3p3mfIggcrghyzliQXNc8NK4iaIfZyQrTvNHLTyIyNBM4
         8C5tLUDdutC25aHHdma2yVLGXZC51mku9KHmjjG0XmKpubTVLBfbJjfaecU6YedmbJvS
         9VzebgUhoeHGF4eLWIgIUya3WiYAMeCI+kc8XR0FVHrfm66N2ngJsN4fRINZkVtBnrcJ
         42Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWcBhxnB1QgZZg0GsvmH53YFNDZ89KwDOQw+xgjB1gKCG+RL9dfKkWQB7puGtx69zHbA7Sml43pJF6SFDOP@vger.kernel.org, AJvYcCWuq6A1GhfQiMm1Exd2fNt469Yfyp0h/1CuxnV50L1oouVsXkxIdAUucAvgeUmYvn1//UGzP4/g@vger.kernel.org, AJvYcCX5ku4d54juAUfPcs8sE4T+7fiVhBxIuPySLARYwFZi5UuRTPdouMYSwcWP5tzBcqj4HmCbijUpn+SNu5GP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3PKSHr/6e/J6vTQHXZironmgOMHvuWotC6dKoemXTxLuG/8Oa
	UlBscvN7WAEKfZS93SsV7GctI4sTk2ppU7FLmUZdBxu/64uxFxcfoJYfdKQx
X-Google-Smtp-Source: AGHT+IGQKNnEzQ8aL7h/Dh0IMEqkbtSWju+f0UHNIlA9oFQ5gkLCt2cqEgTO8XLsflQWB7i7x/N04A==
X-Received: by 2002:a05:6a20:db0a:b0:1ce:d9a2:66ed with SMTP id adf61e73a8af0-1d6dfaeef4fmr1477126637.48.1728000030448;
        Thu, 03 Oct 2024 17:00:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:14 -0700
Message-ID: <20241004000015.544297-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
index 08b3b0827436..9a6625d8660f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -121,7 +121,6 @@ partition@100000 {
 			};
 
 			partition@180000 {
-				compatible = "nvmem-cells";
 				reg = <0x180000 0x200000>;
 				label = "factory";
 				read-only;
-- 
2.46.2


