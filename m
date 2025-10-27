Return-Path: <linux-arm-msm+bounces-78846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6FC0BE64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 07:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEF6F4E752E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 06:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501472D9EED;
	Mon, 27 Oct 2025 06:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhN0Udah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28C82D94BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545180; cv=none; b=KpkJXs6a8G988Hw1MaCio4K/fUCc26zZ76CtowIJK59D1KX2z+uJIehuoAkz7JGd1zFf1buXjM52ITvtE4Nwpxz/KieXaZT0DN7NveasRW+KAY7GuSlSmsnWhmBhC6bR23teT741AVqLba/KTV9KQZvLXEbf9WGBDneOyLDrxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545180; c=relaxed/simple;
	bh=NkM5OOy0ytkuYdLV31rIkddcp0KAU5XfIo38O7mQLp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WSk20AJJzs/SDch+1jzKvkyNlx65pCRIT/CtctAUdtdLWnGo/wZeOODTpK/DM96WY2Mlh5j7byGaBOlcv5pslBmZOxEmrYMEJQQ4Ce0pV0aSlljf7IBsInH6E6700rUk9x8ulNMQsK7zeLatmT6PfRn8DDhBupuZMYx/CEX9U80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhN0Udah; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29470bc80ceso45878405ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761545177; x=1762149977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awSfWJCX4NOY9wrF+e8kbd/fw7N/jjAHRA0gUFKf03w=;
        b=UhN0UdahpzrrAPhmvLivbhqb5qh3PL+X//OdV8ST4M+LYgORcTORh3+5sbxuafLuR5
         hLx4HuMWwkC5AltIB1R4B/tIkBCeiqoIA6oNmPpmi1BO2z4BlXwLwH/iwMN6JysbSdcf
         RdopUzLcfdKRBh0YuZNxzTInMFK+eVq+vWwszZ9EmbsPK/lq6NlVe7EG1HS8CcQ9bj5y
         zSR6XfHRSX80+eq81WVhrHJCLiYIOLdsmlsPij69C0MLg7lPS1t+hF8ajmujC936JB1A
         hJfc9pU7ldtLzrFlX/poKU8JLTJTfzFP8eyAGkFSNsYltLOhHbML8alI3sJhxAbhTBrQ
         Ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761545177; x=1762149977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awSfWJCX4NOY9wrF+e8kbd/fw7N/jjAHRA0gUFKf03w=;
        b=uQCGF3eh3jooBGJBU4JD/3lUHIUDbTlK2orWJZxZ3VXrdIv407InILJBfA07Krjkma
         zEzYR9dy2a479xkpX2vdsAQ6P4mLzw2byWyWtRjV5YMf7BygYAqxrzwA/OgaLi5UIpTn
         QULT11FTJdH6lnRAECItuqsuIe3cf3hNflDDHXsYjoM6bsDfNvWI0ngDJ7ZuyhG3Lxtz
         8AIFwYLJTL3NtgvhwypfEnS5RkiKTEU/56sKLGe7y/LiB9eIpb82jI7RPxfR6fxLNErl
         4oVIjBOe94Rc+vFfBXNzL5xYrZd/cRMZs9jsEWjNM3p3V76VZMr4LTy+VWtloasr7Tbz
         isfw==
X-Forwarded-Encrypted: i=1; AJvYcCUY06hN96Sw6RXKMfoQL6zB7noieXPuJV2Yjjm/bnV/fma/jxNEskFzAZvpmmz+BqvZPJqOGU8yISjc1D58@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdE19leO8FTQP/xK2nRtXZp49FLRjTfCzuCwd9ywuPHN6/z6c
	OvSA7eZeq/YWP/bmdHrllgPSdKunBR6Kzz2bDJgt9K0IGYRD82uujZPE
X-Gm-Gg: ASbGncsrXHaJb8zb3ZK4ZcXD0SLqmfO33RpS3UHcJs4sJVIXpP4bMS0x4/9/KIxVVEK
	sIU45brdy+c7OioRmmR8bs8pn2Hf3HcjeEopGZBp1hsKao2yfCdk/VOKLDeemcB0h9/zkHp7t6u
	j0kKLvTmkbDElf2mFLZv+sYoENrpSHBcICm3rBhekqaxHeymgfQXKcdyJhEupx8s5+HwnZHuiBg
	SsAr/88ykDmpuTz414ccC+Z2M+jDTembHQH8KUtfsE42UE4y0Nh0PPQKSxznsjeocTa/ssFp79F
	Uqd4PhFh7ltLItnar49ODtjqiC740EqMlLQIX2CjPDxmlOvjBsXvSENs6r3McBiEYsUoyY/mhin
	QTv3yiYVU9q2JjA1HKq/sbuSV8+Wt/jTXpoUWHG3DyqiaK6rtzsLsNrMvwhuYsza23bJTutUwQd
	mWqIfzETGUn9igTNigr+eZfw==
X-Google-Smtp-Source: AGHT+IGGfNR3pDzrLXsRHQ0DtnR/zCDD6PytEF/eEQoukh39nKst0A1lb0nK6x8BAecxfbckIr0K+g==
X-Received: by 2002:a17:902:ce81:b0:294:8c99:f318 with SMTP id d9443c01a7336-2948c99f5d2mr159955775ad.3.1761545176998;
        Sun, 26 Oct 2025 23:06:16 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498e495e8sm67837735ad.110.2025.10.26.23.06.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 23:06:16 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
Date: Mon, 27 Oct 2025 14:06:01 +0800
Message-Id: <20251027060601.33228-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
internally uses device_find_child() to obtain a device reference.
According to the device_find_child() documentation,
the caller must drop the reference with put_device() after use.

Found via static analysis and this is similar to commit 4e65bda8273c
("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 4fb66986cc22..cd40ab839c54 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1241,6 +1241,7 @@ static void qcom_slim_ngd_notify_slaves(struct qcom_slim_ngd_ctrl *ctrl)
 
 		if (slim_get_logical_addr(sbdev))
 			dev_err(ctrl->dev, "Failed to get logical address\n");
+		put_device(&sbdev->dev);
 	}
 }
 
-- 
2.39.5 (Apple Git-154)


