Return-Path: <linux-arm-msm+bounces-43683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEC9FEA82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 20:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A011188386A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 20:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EE619ABD8;
	Mon, 30 Dec 2024 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmk9shUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD222339
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735588790; cv=none; b=KYT8kaECvLjgyKKAjRZBcEFrJx6MjKO/+T0sUg5B+jzRvRL85ZTlq1vcORwOVS4JPpiNfoeoLVCBKQfufA/XtEZNytsMDDK7kVgRffsio+6g7wozJNuxs8GVcEu9KA/HJyZMRG4gZOGssLzIq9ulqFf+HEufePuXZjWS0j+n+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735588790; c=relaxed/simple;
	bh=jqKk5T5lIBOI1QztQyZJ393y//Bdt9WcIiq6uelv/tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUnmTXJSyCW3kXpu28NP20EsOHxKw027xOyD00k8Nvtwea/xue/l4iTfRuF9CkQavBJowRguKeo7os4p2SuFFgTfJ3PHcepoixOSpUBWLtmcPyVrD9JpGQBnFn6TgqJfUsNTzvPjrygGp9MR0ha8YNzdMWspBCclLfinHPZKgks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmk9shUH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso123802166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735588786; x=1736193586; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8ITBzWchsZ6aiNKydDGT+QBnZjk0ZvKoShykaX3QQc=;
        b=kmk9shUH/PGDJy+oz+booiJ579Dig8n/Zi8VGfaveAnMI3VUO94EEpw8cS+6vfQZRO
         ju8wtgNVCNTdVTokWWDHTUfpNfriwCKuvm872DLBldFdULqe84E5yaVcOYyXmLUoPT4d
         QCQWs0zq7+i0ETSIGpY8WDK/vwb4dMlpu0YwTWTMCA4SqkZWFuRHrc7w26i20GH8lQXl
         VkJVHMU9LpeawsI8G7EuQELV7/Qq44WubXZ4IxN/bbfwPWkmFsCPo8m1Bno617tDbz0F
         B0qdtleaMN2kRbRCsMCsidUzyF2jOK+mhWzXtsyjH5uySLvTVf46UP0xWtNEWnauhDSi
         I7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735588786; x=1736193586;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8ITBzWchsZ6aiNKydDGT+QBnZjk0ZvKoShykaX3QQc=;
        b=VTBORgQvCYbJgVIp/KIBLiY6Zk41vnIYMVqjjmp+Omi7vLkhtRZSmqH0xEktRd1g7E
         HOQM++qf64ZU9QtjLz2SCYXHPhbw7N4XFg5nG1xAT2PcK27bG5t0+74U1kZOfG08DQ4k
         vAxWvffKkA9XT2eRQW21ZyEhpQAtjzZrF2S8UNVjafTAF1iD8qpckseYmiEhztfOtKiZ
         WlhKIlYGuIbkDLhb6SrsF2eaRQh8TyTj7ywUKtNz1NOlHceaY9foz5Spte65CLaD2yjN
         BWRieSUXV+JETrjUEr4hk8pN2pkOC5UtNLtdeJ1YwM0gT6vTarslW+mNjsi3O7N0Eus0
         dJRA==
X-Forwarded-Encrypted: i=1; AJvYcCWvob9kBHgrMUKVt9m3GXBMSGBsZjypHkNHOOZ8HmL86TfhsP9seDGnZxPv6awDT9G7pzT+joQ8A7Q0QGUk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxud9bOYAfXExAjpGZfSh+OAZT4mGtFp2xkYBrU/9/LEEDWcKlW
	DatwBPVVJovnF5pGHVFYnYGOCUo1FoU/ok/aPF9aebaojTBosS63sAwIOSp3+aQ=
X-Gm-Gg: ASbGncuojKnmW1AuBU2IVmlyXVClCtJRAatSem5Id0f4bSigGeI3ulrnifgggjzZJZu
	1c5iDY2iCs8Bh8fPaZQwrCy0kKtNOV5NdX2A81EJFoWnEIGFXc0BaD+mkZAioikpYnAjAlDos0O
	uJ536DE5/BYoarxhEBHxtT5bEoZ3HtNNedrWBARtxZiG26jLwX8JiORXhqINW42jSbKU9x9VKpa
	CFmYCpuASPrcIFiKaZg+7b3DFyNY2UppZeDTOq09DAZO7+ETT8OsjNzgTf7/ZaCni/1gw==
X-Google-Smtp-Source: AGHT+IEl73fx1iMH9phpTdGE5/7WHNBN41U0T7++LZh46oaIBWF/nu5kJDZmoD+HKv+QAOervaTSNg==
X-Received: by 2002:a17:907:3f0f:b0:aa6:8b4a:4695 with SMTP id a640c23a62f3a-aac349d32eamr3129514166b.31.1735588785911;
        Mon, 30 Dec 2024 11:59:45 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:4241:5a6c:e13b:73f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae74e4sm1495200866b.91.2024.12.30.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:59:45 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 30 Dec 2024 20:59:35 +0100
Subject: [PATCH] soc: qcom: socinfo: Avoid out of bounds read of serial
 number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-qcom-socinfo-serialno-oob-v1-1-9b7a890da3da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKb7cmcC/x3MQQqDMBBA0avIrB2IUyvaq4iLNE50QDM1ASkE7
 97Y5V+8nyFxFE7wqjJEPiWJhhJNXYFbbVgYZS4NZKht6GHwcLpjUifBK97YbkFR9Y3PvvPG0jz
 QYKH4T2Qv3/97nK7rB0KX9FFrAAAA
X-Change-ID: 20241230-qcom-socinfo-serialno-oob-586f0a2d929a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

On MSM8916 devices, the serial number exposed in sysfs is constant and does
not change across individual devices. It's always:

  db410c:/sys/devices/soc0$ cat serial_number
  2644893864

The firmware used on MSM8916 exposes SOCINFO_VERSION(0, 8), which does not
have support for the serial_num field in the socinfo struct. There is an
existing check to avoid exposing the serial number in that case, but it's
not correct: When checking the item_size returned by SMEM, we need to make
sure the *end* of the serial_num is within bounds, instead of comparing
with the *start* offset. The serial_number currently exposed on MSM8916
devices is just an out of bounds read of whatever comes after the socinfo
struct in SMEM.

Fix this by changing offsetof() to offsetofend(), so that the size of the
field is also taken into account.

Cc: stable@vger.kernel.org
Fixes: efb448d0a3fc ("soc: qcom: Add socinfo driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 62fadfe44a09f86ac641a4f6c162a1a1c185a985..d49c55979bb3080c724c6cffe27f3a6ef29ff62b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -796,7 +796,7 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	if (!qs->attr.soc_id || !qs->attr.revision)
 		return -ENOMEM;
 
-	if (offsetof(struct socinfo, serial_num) <= item_size) {
+	if (offsetofend(struct socinfo, serial_num) <= item_size) {
 		qs->attr.serial_number = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 							"%u",
 							le32_to_cpu(info->serial_num));

---
base-commit: 643bc7bbfa59a89d46819949dfd0baf8fdb4c3ce
change-id: 20241230-qcom-socinfo-serialno-oob-586f0a2d929a

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


