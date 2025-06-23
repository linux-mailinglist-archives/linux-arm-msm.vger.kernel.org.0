Return-Path: <linux-arm-msm+bounces-62010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26508AE380C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C13E3B0014
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 08:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CAC20E005;
	Mon, 23 Jun 2025 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGlCjPcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2834920298C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666370; cv=none; b=aOfNiVuEQN12FelIqoGQQgOC8BGzbCJcyPV9bHxtqg2bj6s35D8G2jYRNeGijfzwGKOUa8Cyck5H1e1OfBS+QaF9Bgu01+inHEZrH9t0zj2Jg8YlQlg7IQKLukyyWuSiXETifxlg1tzUlmABdgF2oF7nmag7bl/L+0yp4pM9EEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666370; c=relaxed/simple;
	bh=gPbrjKfb3/t9+bJ97l2JcUsCeLq8NB/AHeQm+JnD8Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUEv2s+kPajb50pjIRgaVPwV6dWvIHt5MwD+by+wYsMxbz7RJWaQtPGIDtsZQejXtqagCoX1nLgywzSJzrfpSU+dNjyhanw4JcjaIAZuyqMjxMsMGijXSEUCksez1l79rxJ//WTd7wIOXZGtUZ/8czvK7n6eR7x7Iwso3cp3JtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGlCjPcb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
	b=SGlCjPcbPLKG3IAuKS6FFl8T2XpArNqzwnp5cOau+jDwwHYzVQBFQ2nW4zxjVcvalTXg7c
	EaI0ipAEe62eXL5cI7i8D5kF+OLM9vVA7vgVqL6H2bKuvJg9Sl1RmwWfnkgSdj/4AgIbh7
	2Gn63Pbk4pxBnl/pohHYVdbx6uxwYZg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-eAvIB8rYMByxHOTwE4V-6g-1; Mon, 23 Jun 2025 04:12:46 -0400
X-MC-Unique: eAvIB8rYMByxHOTwE4V-6g-1
X-Mimecast-MFC-AGG-ID: eAvIB8rYMByxHOTwE4V-6g_1750666365
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-606aea61721so3453298a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 01:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666365; x=1751271165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
        b=hxuaDT/rtepNFHopJig7nX0CwE8/nN0kkhp1ZiVDJkDsbePX3/uzfWtMuv4VQBFxBA
         +36qORs3CBFMwbshlvaW8WfEoJ41Qs2zTdk3JDqcj3X4tIqPHA0qCZIxuxu/k4W/plpG
         4IS+yvOw77ViDz6W+sY1IBHcswFC0DdX1EdAAJGbdGiS8cFPdCMMD61nHSibbcsH0j2g
         5Mjbn/u++d6kcEb0yP+zQAwhdAiSXiLngleje6j3JIuaJJng7UXYuGaoyk6svgfQfld9
         NC/yf137GAZi/hECBpgykNqt9M/ofPN2zuXFHZ4CkNiAlEP9plywne/81uXLLEkBsofH
         y/cg==
X-Forwarded-Encrypted: i=1; AJvYcCVDLlTnjnDDHybQ1ozgj54XL01chPtv0Q6Ol+bHE7rPpj4eGjO66VlkuEtSio0GeGOnLlpShNBxmhwjTbeY@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1Ped4dqSwVuThkToYyNnG5MD3cKeEDBYcc2jjBsyPUpv4u1V
	mjo1AMdcDIbrePyeeU1zb2CLpyzmpW/kbVBcHAKc+1DGFPS2JxuWZZQmcHEOE0UgrIgWwuWpebV
	9CI/AJq22XRNu5/AHXDMAPuJ5WyjpoBLB6V4LAf7p/Xe3nvfMRD0g8IoYk85KZgBxUp4=
X-Gm-Gg: ASbGnctDKDNZ1DgZIyAp1gWjCz8ROdwx7YoBHmtLX9FCYpoS46LokDHZMecsaD05dO/
	nNBsqrC7Btm93rKddiwn5wcfdlhcwFpuG43GeCyXd42RebnCF1an01LND1JYlyph97nqFA3Uqq7
	UEJF/sKw8qlJ6w5XtK9MFn3hYPHu4BnPdWddzHfAMpY1xYjoxfefRuVJ+QsDKBqqkhXhEO2F+TQ
	DMQ2OgFAEsPNYK0l7MdIrf/07K5/hEPZA6bErfS8sg02DGIA38aS8ydeMfTAA6Fyf9Brrb25b7y
	vvzjEJgz582CXIr2sTXT/pkOsV5K+5jsEZ4IKsFjCfQ9A2rShWK0KwqDo590J7zD2ekn
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9228988a12.21.1750666365431;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmSn5SEBbkY2WzQ8Wstprge0mliWZNTw4CyeFgF4x1e2Q598sLsTkhN06aRTXMr6PAByyRyg==
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9228976a12.21.1750666365083;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c9769fsm5838013a12.40.2025.06.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:12:44 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in QUALCOMM SMB CHARGER DRIVER
Date: Mon, 23 Jun 2025 10:12:40 +0200
Message-ID: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4deeea4b0741  ("MAINTAINERS: add myself as smbx charger driver
maintainer") adds the section QUALCOMM SMB CHARGER DRIVER in MAINTAINERS,
including a file entry pointing to qcom_smbx_charger.c. Within the same
patch series, the commit 5ec53bcc7fce ("power: supply: pmi8998_charger:
rename to qcom_smbx") renames qcom_pmi8998_charger.c to qcom_smbx.c and not
to qcom_smbx_charger.c, though. Note that the commit message clearly
indicates the intentional removal of the "_charger" suffix.

Refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41f13ccef4c8..c76ea415c56f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20612,7 +20612,7 @@ M:	Casey Connolly <casey.connolly@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
-F:	drivers/power/supply/qcom_smbx_charger.c
+F:	drivers/power/supply/qcom_smbx.c
 
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
-- 
2.49.0


