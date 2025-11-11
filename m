Return-Path: <linux-arm-msm+bounces-81192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C2C4C384
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 09:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603053A5FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5448D2D24BA;
	Tue, 11 Nov 2025 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgohJDKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89A15E8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847830; cv=none; b=Oy8IfveKXXQL+oecmzx4/O5Gh/+eMi1zIWnxMg34mjYpFPUFl15qXAfg8IS+KVaRY11OdgH1SgJsmep3xk8I68xmIj80lqDYYwMwNeqQEwl8FFivRyX7OrXkcBhx57gVW0UFWRTcMKa/NvhHJDnUGIdMe4LVO8nsw5S5GdfLV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847830; c=relaxed/simple;
	bh=DjujQ4Ip3o0Fr7W1bLZTv2QT33O7HU1A7IoeReKU2rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=limlZ2Tak+fqFzIGeTEQBLI12rymXWqLKvDTlXjffXaU+GWFDB2TlNV/AycHct8FxDqNNmD3PGSUKh1h8y2ddxRorcCxiTgDUFMsCkVtdeL3dfVgOKaXWSTzE3iDjJX3VCgEjrXpLrFlnd/vNPjJ8A3p1LTIUU2jEY48zrFkOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgohJDKr; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3437af844afso2404440a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 23:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762847826; x=1763452626; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx/V++xyadOUZoH/bSkYK6cIm5d5YSgG1Ih7qmUz09M=;
        b=YgohJDKrizeipAwDqV1dQxmk247UldJSqlIYLHiL+l8OSSNRsnFsoIou8tZqWMmIRK
         vd14E4w/Ks9fW1uGlJIU+SzF6HR/7a9I3SqgCTi67GxlgG+Ok7hh20Q1ecDYL7hUkq5w
         2U64pROgnliJztuJUgDq99B9GDUoJKWNF1/Bg5XcK8VJ9TGeXEXxEe7zRpYVja/P7pn6
         +leXUHgCi7/yuC7KEUPWdoF3xyuC/9SM/yvfPH1wxcImiSUCBwfnMoLfRn1b43tNiv5x
         vtEzc46D9MSY6kscDNXv1aSzrMRm5JmWHuIB6NKgjHJjFu0mefWv/MeYrX1fQUJ/Zzmq
         Fu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847826; x=1763452626;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx/V++xyadOUZoH/bSkYK6cIm5d5YSgG1Ih7qmUz09M=;
        b=I/qdvdsoVP7QVgIhdXaGfInU3PnR+I1OIdWAHuYqy/feJXSAudPrBYfg1dfs3Fv0BE
         ztpg6qaKgkffqh0y+DQgkgypiI2kncYAymV5uyIlxP4Wd3saMw8d29FSaX01/Oi/azUH
         l+5VTiwHCG9kf/N6zPh/9VVDbdU8m2VqiqP3QYR+7AfedRsdaLC0MTbtuN6RmMYdlwVq
         hGp2mpt5ZOT+wXUXVPCQxA7prr770wWWtXlNSvHIVG5EGlW6smc8FxB8+1UcuTWvz+vy
         lR4TWwNO0BDlPDreBgftiflw9Yk9TLnVbeiiJG/G71b/hobX+oQDrXW9BNRArlTs4S4y
         K/aA==
X-Gm-Message-State: AOJu0Yz1GA0FI6e4Dv8iMTofry7BOn8PEkGA4vR/u28VvSrvU08CyPAM
	67MGcSDNJ0F6qmiB7f2ogmPjn71XJdZ6HmN05xzn8HUEVpEG3AzDRiTyY+mwCJGq
X-Gm-Gg: ASbGnctEf11IXaZVMdSIGIIY73iqESaRRbV+yxl8V3u7XjzLreItuhNbbH/oHiwE4lF
	204XkjkpfF2B3EC80XPb/kXYXo+Ku8DeDX2WU44o7CMOKUjbk9BbrhP5TmCOpztx9n3dKe4Z124
	SQnDq6nE7YPHqyqNM98xs7F0rDqh5Ep9tpDV0fAd/d1/FmfEErAFhp8M0wqXO7Xxq/TxGTQyRaD
	81vlZ0DVvOKMTa+3wwwqBs+cRq/18MdJXvXLqPVCIsYn3n1uB2+tO/+UZS05f1LnEHbaXVq5rxv
	QWUPwFqx/ophFi9zanrWklCYw4EHv9V0Tn4UDYNgJtFTmdGI21X9vyrJdJw6yNr9k5DLhvwlXyk
	XoDJjuCiEUTMHvd2q5DgA3n+aRGRdspfqdnhnqEEdY64qxp3/2Qj3jnoaO+N3FcZRqKPTsbUYUw
	w=
X-Google-Smtp-Source: AGHT+IHlgCsPGufic8ljFUM/F3tgYW1VFs7jgyf3xF1GaO+oK0dfmfAL1LcwALg8bAVga+ecAJtk8g==
X-Received: by 2002:a17:90b:3c87:b0:341:124f:4746 with SMTP id 98e67ed59e1d1-3436cd0bd38mr11876908a91.31.1762847825598;
        Mon, 10 Nov 2025 23:57:05 -0800 (PST)
Received: from aheev.home ([2401:4900:8fcc:9f81:b4f9:45ad:465b:1f4a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a7a62sm20318454a91.2.2025.11.10.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:57:05 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Tue, 11 Nov 2025 13:26:42 +0530
Subject: [PATCH v3] tee: qcomtee: fix uninitialized pointers with free
 attribute
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-aheev-uninitialized-free-attr-tee-v3-1-57905b913359@gmail.com>
X-B4-Tracking: v=1; b=H4sIADnsEmkC/5XNPQ7CMAyG4augzATFbiMVJu6BGNLUaS31ByUhA
 qrenbRTR9j8eni+WQTyTEFcDrPwlDjwNOYojgdhOzO2JLnJLVChBlBamo4oyefII0c2PX+okc4
 TSROjlzEfChGo1GS1QZGdhyfHr23jds/dcYiTf2+TCdbvP3oCCRIJiKqyKmqrr+1guD/ZaRCrn
 nAngvpFxCwqLJyrzZmMcntxWZYvCxm82CQBAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=DjujQ4Ip3o0Fr7W1bLZTv2QT33O7HU1A7IoeReKU2rE=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDKF3rhu2LG09/gzQZP8axXa7j0R6UG1515US927qBTuI
 McXluzbUcrCIMbFICumyMIoKuWnt0lqQtzhpG8wc1iZQIYwcHEKwESOsDD8r/X3m9BS3uzHO6nw
 mtQKjc3noi/8+tcb9n3iXpduFseZLAz/FPpfBaZFPTK5eayTs0uq/E63+JnotNdvzULy/ZiM3vN
 yAAA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Uninitialized pointers with `__free` attribute can cause undefined
behavior as the memory assigned randomly to the pointer is freed
automatically when the pointer goes out of scope.

qcomtee doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free`
attribute in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Changes in v3:
- fixed commit message and description
- Link to v2: https://lore.kernel.org/r/20251110-aheev-uninitialized-free-attr-tee-v2-1-023ffba9ea0f@gmail.com

Changes in v2:
- initializing variables to NULL at the declaration
- Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com
---
 drivers/tee/qcomtee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index ac134452cc9cfd384c28d41547545f2c5748d86c..65f9140d4e1f8909d072004fd24730543e320d74 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -645,7 +645,7 @@ static void qcomtee_get_version(struct tee_device *teedev,
 static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 					  u32 *version)
 {
-	struct qcomtee_object_invoke_ctx *oic __free(kfree);
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
 	int result;

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


