Return-Path: <linux-arm-msm+bounces-13969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F687A20D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58825282FF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F139E13AD8;
	Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZpLyrRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8E0101DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302068; cv=none; b=fZyji/Yg1CCD47WfDImo+38ggS8lJUFc4S5Fnba3HEN7OkF1CcHjGmhx79G2I5SZPp2ThDorf5SItVllqEioRDGFzqQgDA3gSvYq/5Mn2u3eXj86aUEyKjfeFzQH9x1iN0pfpQ8Q0464+V8ooFeOnu2LrUFI4NMkbshooWyB2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302068; c=relaxed/simple;
	bh=6EYmD69sWZmGoX6AKwzh0M4O6uXmEHRrEKh/yt0/KPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtJfa/JwoFmcG+VgHmUXozfl8sKTu0u3TrsPOjZJl6Y5twagCXMV7oIgXkOhUdtjBTxOnR2Jewpy5nuncH3OKe3ebLPB6pN09iMyhTlfHnAGOBeIFHhUSFm5TnbacpySmTP76lD2EZtaGkvKocAlWaouVBmRczOm95a9OspLIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZpLyrRt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d2509c66daso73702981fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302065; x=1710906865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fct0VZjsurRkzQqPpB3JaLxWY0P6FclFVQOW6mKz5w0=;
        b=YZpLyrRtNe2B1Z74VpEfjNExU+KV+xHRq721Jqup9DucYxpJqxzIFvh9avQ/qKPqDO
         h1Mz4ZvRom+vPWuVqmXnd3iQE0k7EOZXBKWaYyf9Kb1tr62civn1LRhJomfPYmjH3N38
         F/WphJ2ow9iYQ0T9FiGJ2CRVGlSSzVMfLUJmSSBSuTdXrsvHLtmuTVq5Oz3gaInMVfW3
         UbqY+KkAI7U5Q4cmBu7GpB7PCFmCT++FOT2B7ywqY/1NgHuaCpfCAQaRxEVWqik8H39w
         v4+kK+RYX6NbZpBoYBqq07Hsxi4za5v2YwP/p0r6i2nhpCZ4E1rMK3C31ap63M3PFwWq
         Cc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302065; x=1710906865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fct0VZjsurRkzQqPpB3JaLxWY0P6FclFVQOW6mKz5w0=;
        b=A9tkM0qgoU3uzexs5yL0NyXDuhXZWfr7Y7ho5mTpwer6RAnCKrepnxdGl09tacHEBS
         ivr7wx8WY4fiFB4f4+nE9gYMw+Qoh5oGt3kne9JGmxkzdHwWuqVUasSIPA51efrcrftS
         h+d4+zOfur2lTvv4RK72Z+la9IzXlmRWI8RlUhj1A4P/H958F3rtkuctbuzX3PqoVQYZ
         iNQY5t6CpeV7aaaWM/Ff34Ub7/n6Bg2IT0pgyYWBgfT/2105Nexq564F4chweid0Gjmt
         a3hi2c971V2nFdxr9lClSUhAgOzjmdj+ZSG63CTbb4ywg4KH24lluNeF3Nh/MMUHOvIb
         xnRg==
X-Forwarded-Encrypted: i=1; AJvYcCWETy56Yp6V+LIP5MJmN6rxnd/GZDyooI0ND1HXYcptKqKPo3O7YdCwEUo3Y3DfV9yYbT8inpLisoUo9aRxuQU+A2A/fw//hTS7VBWwfw==
X-Gm-Message-State: AOJu0YwadcwYCAejeAZKD4HEDWPEuNMn2SqhPeLSFu0qPBEgUpgzuV/D
	jFTAHkojhRdEcSsuaAkMNl485IJNZMF5kEpACRgPu5zx7Ir/gyhnzAK7pvVQkFO632279A0XbYd
	P
X-Google-Smtp-Source: AGHT+IGU1nKa9yZZSaZBVwxotiWxvgYGip66g5eNu2UPhAK4cjTwOilx3MCH81jbjbDHlShtOoBQOA==
X-Received: by 2002:a2e:350d:0:b0:2d4:16a5:b361 with SMTP id z13-20020a2e350d000000b002d416a5b361mr1431441ljz.25.1710302065397;
        Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:14 +0200
Subject: [PATCH 4/7] usb: typec: ucsi: allow non-partner GET_PDOS for
 Qualcomm devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-4-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6EYmD69sWZmGoX6AKwzh0M4O6uXmEHRrEKh/yt0/KPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNreDUqybYN8KU9iG18YedS4ZfehnlaTrZRv
 7/A8LzaOIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1cz5B/9rl0hub4Z5WK6m/HRp2u0VhWm7/iLCPxfkgXFaarI7zCOiQf41D8H4NbEWJ6jgcecy/OU
 nl0B5nbBw52Ix4jTdCe5Gh3sTn6yDoTcxcsNln/T3ncQowxE6g7W8qudfBxEv5AJ5XosAtSWEP8
 KiSRh/6WUQOGnwYLtuZXPACSjnp5ObKVHCpiP7RjYov0fO8tmYDaTbzfhf1IuKYkYd6jKjMZGPs
 KfyunsuG/2tZ36zX8L2X7NVbqltjSEu6X8wuBZLXbOHpilZNv4r+wxTi5EYAHCDqFWuxI+smGY7
 0YEgHg2AnKgprVC9jqXv9diDMCum1RYwGNSZp+tQCdHSxmM4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The name and description of the USB_NO_PARTNER_PDOS quirk specifies that
only retrieving PDOS of the attached device is crashing. Retrieving PDOS
of the UCSI device works. Fix the condition to limit the workaround only
to is_partner cases.

Fixes: 1d103d6af241 ("usb: typec: ucsi: fix UCSI on buggy Qualcomm devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 05a44e346e85..011d52bf34f6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -641,7 +641,8 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	u64 command;
 	int ret;
 
-	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+	if (is_partner &&
+	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);

-- 
2.39.2


