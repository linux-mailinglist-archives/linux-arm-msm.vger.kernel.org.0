Return-Path: <linux-arm-msm+bounces-52899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD322A7707A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD8C3A6F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC1D21D3C5;
	Mon, 31 Mar 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R236LhQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754221CA0D;
	Mon, 31 Mar 2025 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458251; cv=none; b=Vke9gjgTyaKggfbQDAhmYJQPn01NsQahtubfm/9YfuFLyS0awg9om+eH21XwmvXQ6lHRwFZBJnT58jHI+1q/z7g/kKUm9qBPRNV0xmfOdZ688Ws6TV0cIvmX60HwonHFblnUgHW6c5z12sqkotjs+H6eKkNyPI6t4h8pMmRBvs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458251; c=relaxed/simple;
	bh=5reK9rRuWPFiKXUV8h/gx5HSsPgOtN0QMSjSENxoYf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/5h6Feka8g5JTH9yxCYpBp8GBX24seijNmMFt5f5+R8VKmv6eVAV2vneXwMDljgHTVR88bctIxHa3nlH2pWNefmySeZ5zDNysz8yiqqDPfD38tT3abesKH6jmnJ3RIrM7MUyyqooh246rDIwbLMVzPYFrGpII5U1SuLoWCBkkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R236LhQa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso31664385e9.3;
        Mon, 31 Mar 2025 14:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458247; x=1744063047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/D78IF7DZkVjJ3zVSXhYfqtr/1FUft7gDf864omcsc=;
        b=R236LhQa3UoyDN8eof45YUA9NfdrdGNDCwEt1MZrgzDPZ3/KSOfpJYEOOBP2cRuPOe
         5I76Z4AfUdoTn3kZCQoLqv+mWRpFb52NQbaWuIjEvmh9TAX0SD1JHy4udJKHpCShqBG5
         Xzaf5J8zSk4hXJpNouC51CNTIk4ZMKQ11Jz1tnQhHFNd3VFa4ySJV1aIrKIushieiiHK
         IwKCCw5wBdgyabTIy9AhTbNDgVbn5HL2Aysv8xIqGq1Bq0SOrSQNDkBxBZ7SXqgtBKHH
         CQV36wR4sg7XH5zi/g57FkGx3lreKVh6CawwA4EqlOb7m4rrSgGEUPPV5YrbINDMIE0w
         6qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458247; x=1744063047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/D78IF7DZkVjJ3zVSXhYfqtr/1FUft7gDf864omcsc=;
        b=lpoHxj2XB58JiEmg86OhlMjKZfFQOMlFETQXbwOFh2qchVr4LMiRT2myXVEC9xq145
         HVYPADm0pI031ncJwc3MuV9fIJrHq+zK0DIhPEeDpTo9Zni1vcQCY3er8UAkLqlBhovJ
         I55GAC/R4fQY40ihCZE406DLuZpzLUBTwmfRg+90CcfLhTlkMw134otWJx1gb3uteGKE
         WW9T05vEiAxugbzyJgRwoDWhxRJnXkmTLUR1HEMIkITNzazax/gAU73VflY5itQO5X3E
         fOumKjfz9XjE8srqHHN4CRi5dVaYKC4N7CxJjhw3Gn10YgTZ9LB2Rufx2LVJtQ4Mgmzf
         zGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU42FGR3TsIvvYcV1uteLiLyaTVRyA5MzG6JQ9r32AwcXKQ/7LFufOssuOKZNyXD4eopofUHJyX3GLl3Mva@vger.kernel.org, AJvYcCUfMoGV8/1uty5gwkJRR2LiT1A63i7B7/aH9UXIwK+QiYxJiNmkASMHdkBVFj4Aata/VYpxgzphMlAMPV1hUg==@vger.kernel.org, AJvYcCWhNpTbTsA3KGucp0KU444uQirLY4Vc4E7sVVsTOIUXywq87bXz8YW/OmR6r0YA+2SHrx+fzDR5OaRe@vger.kernel.org, AJvYcCXseUVgJpeUK4xBmnz5lqNVX0gTpM++CmIG4ua9Hnf2f3Gz8WUarlGgT9uIRku5XYJvCrNP6SJ+LaRS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4TTO8ikmx3702Yr1By4Yn4XkXq59szFbx3wYIaU2QdMYgMl3d
	Fc3fLgoypba5IfgfuErDpen9YAHKNdKgU265G+ZHsD0/pSo4fhM=
X-Gm-Gg: ASbGncs0yX+6JF3lWXXxLsth//U7E2qJ7E3odEPS50eEoNWacBrNssMhMcVnsUv4WXD
	1jvc1X4MyXQEr84gcPOOpW23w+kfHAWRLzNDsUlCnkDwvff+k3eE14HedII+CS3eVFmGE4iglQi
	6R0U6m44Q9ATCS1ErZkE9BSiVCTWzeB1efIt6h58TaE4j5QFrdEhVSZfHFoDfjTphnbagmyiEmL
	ZNvLLXYs2xnzkw4HUjDj7VhX0zT6J7VbTtm2I4uTIzgo3Q7Xy/ecqNkooxOBizkn5Yqele42XuH
	bZQacVtpeLYSsXW1U+5K0dJfUBpzi8WrKrxq33nkYx+H2yE=
X-Google-Smtp-Source: AGHT+IGKFSxSJwG4HpLPevZVhwtW8R/rp3GUpQphon63dwZWx2kFT7bXjKsPnwcNjAXgBDH8mldIvg==
X-Received: by 2002:a05:600c:1912:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43db61d75d3mr98159115e9.2.1743458247103;
        Mon, 31 Mar 2025 14:57:27 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:26 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 2/6] usb: typec: Add Parade PS8833 Type-C Retimer variant
Date: Mon, 31 Mar 2025 23:53:36 +0200
Message-ID: <20250331215720.19692-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to behave similarly to Parade PS8830. Found on some Qualcomm
Snapdragon X1 devices, such as Asus Zenbook A14.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/usb/typec/mux/ps883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index ad59babf7cce..095c36530904 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -447,6 +447,7 @@ static void ps883x_retimer_remove(struct i2c_client *client)
 
 static const struct of_device_id ps883x_retimer_of_table[] = {
 	{ .compatible = "parade,ps8830" },
+	{ .compatible = "parade,ps8833" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ps883x_retimer_of_table);
-- 
2.45.2


