Return-Path: <linux-arm-msm+bounces-20366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB18CDF25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65BE4B21B59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B20FF9CB;
	Fri, 24 May 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llCJRFs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C63D51A;
	Fri, 24 May 2024 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716513681; cv=none; b=WYn8wcfr0LzfmGQvvmwQVD7gFnjuj0/famFSVQhLWbp4vkOl+Kfw1E3L4OnEC/F/xo1sN4qmpWP1oNq+vrBQ1UiDnBEE6lk+ZUx1z3E3wz3eYwcGaBo9xYvuASvoiMncGdx/F4M495a4b311WIELHftwAK/0ueL8rxCXM4DvIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716513681; c=relaxed/simple;
	bh=sLCc5svtWpvyyyVl5yIOg8bH4aWfDXmoSVuuwmCbQjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NV5FgnkmoqWERCc1LYZ4C/W/sgfltrZxnB/o8c/87mpxoyq5ztQZ3LcH6EoOCjWaFZc9FEsgQMZyrg8mmrb8y0FdKM3Wh90IkN8JJ8KDPqd3hpiqiNYVR0kdj9tn+CKpAvdeUJDuwI/+LbGhP/AfDUugtfeAQi+3vqazvPm8Dx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llCJRFs9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-792c031ffdeso561807785a.2;
        Thu, 23 May 2024 18:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716513679; x=1717118479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Sq+a+AmVXaAG7OIyB0g5Dbli9/5l/PmwaT95Z7Yj0I=;
        b=llCJRFs9k64B8t9L3SSGaiXFrTq5DIh3fF6vGAKDw8H9olGYCf3b+iN10wtAjG4ZCt
         LY/hojiSFBtpheoJzy+9IiO5rZHCgDjQm2LYRtcf4wnTxo/79CSDIqumdc8hqiFUsHf3
         L4kizsG4NgH5Hjye/Q8DgRUH3ifP8ip5MLdl6qnL5A0Hndh2K+5Fgta+YPtIPbpGkqJu
         L4y/mfvDi9W9wiovB2tGgshPRORExgrjhBTwWbzS3eWn2TMIGVBNaBCYPUc1sCRlYrjG
         JraCi3qQEH4ljaPymK9HQGw659e9CFxPAacxS3EpzkbDx1qgkSgpwJmamWciNR7eXzpd
         7xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716513679; x=1717118479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Sq+a+AmVXaAG7OIyB0g5Dbli9/5l/PmwaT95Z7Yj0I=;
        b=QGzJSvfid0/+CAgVP7tcxzjB87Tq936K6fL0wPyvFqO3JnO79Lzk4GonWDFd0cyNJE
         xvNK+UUxEdcmsZ5U99kKE9GbNlC5KGngpsZWJcUPG2U3gITZVg77IQLDcZ7jNpxGyigR
         FmfVWGYSQMHZD6rPQqKfKMghqfiM4pncyKkMabM5XJSGr2qX8WRXkpFWUHNlKyoesg2C
         PuvRyxMm+wdoSAd6+A8u2OKXI4XhOpGVp4jZFOFmAG8q3+ufpl80UBzk0fRlEY7z2HDt
         lkdCVQ0DmE9PswhpsQw6zX+hTgV8HDZhe8uxv10womG9PVBtdK/lsNK1u8o8DKOjbfB6
         cR1w==
X-Forwarded-Encrypted: i=1; AJvYcCXblbXCgvZ+AYVC7PFWcjZ2Sfy4ABI+KI/YiMstCCqOyPGxy298GDcL0cq5SXH4nY1YGarsswUxf2nYBEICYAlM2eaqquTQX+4iqyxzwEP147P14Gx0sWxMaDIthekrnkOPqGhLfKsltNk=
X-Gm-Message-State: AOJu0YyansUNr1A4qpFhNA8AZoEmPxVwv/tFe/n9YsMpX3TQi3wi1zCy
	SsFyl/B7sqlOohVn6ua9dspo0wBzd8gLtIusRE1rvObAM9iD9dbl
X-Google-Smtp-Source: AGHT+IGLD4FXY609BJenzUNb2HT/Uk1NQw9OYESMooCq+c762BSRugXWRRe63NQmeoP8fi+jdkWBaw==
X-Received: by 2002:a05:620a:817:b0:790:c803:7425 with SMTP id af79cd13be357-794ab04dce7mr97338885a.2.1716513678922;
        Thu, 23 May 2024 18:21:18 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb182c636sm2421841cf.52.2024.05.23.18.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 18:21:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] soc: qcom: socinfo: Add SDM670 SoC ID table entry
Date: Thu, 23 May 2024 21:20:26 -0400
Message-ID: <20240524012023.318965-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524012023.318965-5-mailingradian@gmail.com>
References: <20240524012023.318965-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is support for SDM670 already, but not recognized by the socinfo
driver. Add the table entry so SDM670 can be found in sysfs.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e8ff9819ac47..8817eb8c1f1c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -347,6 +347,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDA630) },
 	{ qcom_board_id(MSM8905) },
 	{ qcom_board_id(SDX202) },
+	{ qcom_board_id(SDM670) },
 	{ qcom_board_id(SDM450) },
 	{ qcom_board_id(SM8150) },
 	{ qcom_board_id(SDA845) },
-- 
2.45.1


