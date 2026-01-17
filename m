Return-Path: <linux-arm-msm+bounces-89508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D590ED38EE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 15:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 101963012DC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 14:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43441D435F;
	Sat, 17 Jan 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWh2mXm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715B1DDC2B
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768658641; cv=none; b=oYeIokvLcdvvxjlyJxHudOS0I3qbSizTSckoBUCkGGxfjdHIIlAN8Q8Ex63JjyxB+q4b4Tt96Z/aBAzwoTEgSUxKjunPZ6JmoWBzplUd94fTkzOWAG4FOM22czgOFHCI67/1vR6htzj9uXjSEb84FQUr30zWFzmghIdNY/HhxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768658641; c=relaxed/simple;
	bh=T2EP8YY8A1QEJG/l0Q9ZutSDVgcmLVrU4I+CmBcoaSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iGTvtIJjo301eNO0kY8K0YmQeSnMhr5hyG3HYJz9OwsXhdo6OG8g58SWFRQkGMFl8cwGV1RY3E8WQatH1Fjx+jJ3TWiD7C/Fs+AeAOl/jAlqINr/nah0S5CFJle7wGubd8BM4AoWrXyCDuyOTY330k4tvlbfaMpnB+88kTC/gsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWh2mXm3; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81e7477828bso1593966b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768658639; x=1769263439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvSd70I0U5DyZJZE/7/GpNsYtzxrPkdLztxfXI10Q04=;
        b=TWh2mXm3x7lNnqa7R1mhylySLbNBh+8eM+yEHzM9cY2qLu1biyFz3zQlLuO/2jt96F
         f67Ci1DGjkXZqtozm3LXJ4dDmlE/4sRCQTax99JooUAuAV7aNjKLLtkhz9vSt1MXNK92
         ZNcAL4uO9kCfcbOxgNKHo1otcUuNi1M7k4zoqFeZz1/DURzWzob328G6rvZafBulhytP
         0IyoGFW6VnJkADDtaOuHwqIYr6i7PkDKKZ5X2uyIpGV9W+/SkMno0lWMSuSPeF+C2VqH
         x87Xkdw3hLua668rKQF9boMOmu/iycXPGxasmIH1Bzdw3h3uiC2RXMiyXsAumZ+9cG7p
         33Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768658639; x=1769263439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvSd70I0U5DyZJZE/7/GpNsYtzxrPkdLztxfXI10Q04=;
        b=UwnBsir29DklNUTsKb8f+SSZs7m9XzjQW88PIfONMXDteBar3pT3M5iwIvsBUfEkB2
         PSw3Ij1Ab1mtJTvDpS9k1u205rRFm1Ni3NnbchKctT61X8K9TJtanxgYyC3FEUYTMuQ3
         gbr1RgUv6nNjsCenTHTMYxHp49Qvm0LU5hJCSYJgtvApGH5NooCyJEf14ZLdRKW0HFBo
         FViOIFwJq9pUCphPwHwzIA6oAjdbivDi3tbnquxyG6eaOLKW/7nyjUTLwdryvE0d3dKi
         qHSzeXVaqQkAt51QvNrd6UvOMhlTjqcehL5S9ITKrllabnr0m9Yez+5t8occjRvLvnHX
         aLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFsssPfZKV9DhLOa94nJ3YC2hlJx7uQNY4VI24qEhrti3P0o3m+qmtdczqukoElQgmqDIUiAL8BGcEKdcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YytGnc5+0J1w2bHWuWGmaFhxQf5nO+lAwuOrBB5IWO5r54+QEJ/
	YxEi7cLzMU1dfNQFB5SWy9sQ+kDmjwObE9kq+WIcCflAcRf0Aw288Eg0
X-Gm-Gg: AY/fxX48VTqQmhj7W3c14SA3V6I9wlxhdr6oxgFpFDsc2mLYxT9Jn5TKX6zNcd9rZ8l
	DEEnSye6pyjnYpAMVD34RY2rfUBNOb8fucU/HN8/+XikVfP7kC1SdLRV6xIhr96p8e7MsMZwRF3
	ScklcVXF0iQHqsbnw+E9fdLnKyX1D0umZsCC3cFn2m04ZarQfH82/QuxMHOXfP/to6ZVgdMQ73q
	i2uQ9cPVm0m3BNXkoK1RFzZJH63hQZRhNeEh8YR+YuT9ZDskk9KpPCK3bI8EOs6v2VJXbDYUWR7
	XzTKiuCO7shrkGxpqEYzPaRgv4rW66Xp5W4cUCIMR7qBkAUBJOBiR6BmwuyFAzFTZxW4es/lALJ
	8ejvghNRc7KxfuGtQIp+OF0NW9cQdtBKoP0MAdTJ5sQh1lNl98PovUH7JnZ9F+yJNTyYr+iAXzi
	BVeEdm0FqyUyIJHuYiWkSj
X-Received: by 2002:a05:6a00:3e1c:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-81f8f151940mr8455685b3a.25.1768658638797;
        Sat, 17 Jan 2026 06:03:58 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm4213580b3a.29.2026.01.17.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:03:58 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Sat, 17 Jan 2026 22:03:51 +0800
Message-Id: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not
checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

The file has passed the check of checkpatch.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v5:
- Squash the functional change and indentation fix into a single patch.
- Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
---
 drivers/misc/fastrpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..d9650efa443f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+					data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+				    res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1


