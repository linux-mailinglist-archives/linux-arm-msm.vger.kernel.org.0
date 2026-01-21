Return-Path: <linux-arm-msm+bounces-90050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGb6Lb8JcWmPcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:15:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E65A62D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36055B24BDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627E236402E;
	Wed, 21 Jan 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZt4phtW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6863644A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012315; cv=none; b=Z0wx4C2JqFiDhkb7iF+NvHNjDrvG4Rk/AyesEszFW4+25p7FF3fcVTBtJ5mkVzx9qr8LmRLzTsJtFKVGliChh9Qz3NY3ZcQPxPGLvtQm0RMil6XtJDgmE7+gzOUdSwyMC4BD/C63ZMfqsahGIfLHb0irwQadUm7NZ9I7pxa1oFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012315; c=relaxed/simple;
	bh=ba3WhcSk6P2p36HdxyacePi62nLw08KJ6HZda1xuPT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aUJLu+jemZXj2+QVUbTjPNmdwRLGTDd66qA+qxH+OlQ0MCY8qQFKD/ttFMwhbxH5105c4c4CHlMDt8ZS4QJC8DkcALRMM7dUUnYllqeGFlMWcUjfORMhC0DNNOy9LnOdUQEneSv/PnoE5Hh1+yFOj0deEHkXyTiZg/f+myhayog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZt4phtW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so148855e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012311; x=1769617111; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKklyqyTrKSpvhGgd6jrC26at1itayOZjiSVWtQUXJo=;
        b=lZt4phtWzsnPruTSJmCvJ5/ItDOH0o7gTr9IUvY49vyIEBGseO1On4E5SJ1fwdMUag
         CPFbnNbiQvfha1EP+10XRjDScxSYCxHmhiM1kxQM/4tQtZz/jWQmv0q+dmEIVZwosUaa
         EYFdtARLvzaA+TR35QRomG5rV+6dyt4argByg9PXNtWu1yrjl7tA+ZaFdD5fe7GWF1+4
         VWz1StUHgpcNjQdtblLUoirSLzKKd98/dZvbCvxCRcv2vm62DSsJ21Jz9OFHGJ53yqDD
         XQrgrLvXZHff9QaLSNsxaIujEPbCQUfv48IJNSmAd89j+XDiTQe8DkpDllGUW3PTs79x
         iDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012311; x=1769617111;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKklyqyTrKSpvhGgd6jrC26at1itayOZjiSVWtQUXJo=;
        b=vxVgX9iavo+0HlTdDPUC4sdC4CMNR2DripcqzfTftPwmbtsJ8H9KCTyUwRTXO4Qxta
         /yM9tw3flKypXuifE3Ps1Ykx/PcM2YiifS09M8F7Xsn4eh/79TseP8Yl4YBOSy/gtDKe
         4Y7AW+5BXHZu7RSqlWa4BBOeIjYiC6fFoC3v1Bk7Tw65VVLWstwRx4cE8oUYR2Myku16
         zxGYynou4JWQv9jDAtPWKmzOiZ3qasUSwJOvWCGY9v7C7kNVKagiJZ8VjA2U0npx5ZDu
         yo13CxZFyHL/Q0ZmP50AesXvYEHo6l6tOMyNjSAgRirVkkjRgoTKW/SnglJXeXMmsmZQ
         +LOw==
X-Gm-Message-State: AOJu0YxxSACTkCtzxEErE5ODkfgP1RPGc0xuC3EOdmJiKiR9jSgPs4/o
	a/Q/s0KldvAP5nqy1b9yQpvIs9MyQj70qKcSXQ3//iraYhIXZNCBTsxh
X-Gm-Gg: AZuq6aIpRjwiWBigapQeDQmuUbCjhFkfziVmZkt4pcUvTLaRoKMIPm+X0ZfH5r2BSVq
	HTMMuYJOfHMAtvr1CTnWo4pQ3VskBGUrCkM2c0xz1/tzHcTU9t65rHjQB6ZdfNSqLa0O7XQ44+c
	GU1HRsI176Jo5yBQcnB6HQgtMiaqT1ZnR3BYJaZzi2TvP9GBAcD+9+/jQvBB5w6G6XAxRyoquxC
	hVexVuitiJ60fujQb1rsMbIFc8y1OXrn/17SP6VpxzaWd8U3tMOkuZGz2yqvV0YcL3YHJSI+rcp
	IMA/KCw4vaTzhlrjDCIB7PW46UF6qYWdCIyOky3O9hUMi8LADBBs/rtQFvCwU0cJOXP/BYTP9ze
	NG/dzvMvdTCNCdobjUOnnVmypiHrDlo8ByGzz8GmwFQ0LxzlhpFH9/XH601+WNtuwpUZ1EfDLqB
	M5L2tXwKVw2A26XKsEreuc5lMju23TwoWnYmAdgIhP
X-Received: by 2002:a05:600d:644f:10b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-4801e2fef40mr224325935e9.16.1769012310980;
        Wed, 21 Jan 2026 08:18:30 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f4289b83csm373525615e9.3.2026.01.21.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:18:30 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 21 Jan 2026 17:18:25 +0100
Subject: [PATCH] pmdomain: qcom: rpmpd: drop stray semicolon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcom-rpmpd-semicolon-v1-1-9bbdd9478ba8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFD8cGkC/x3MSwqAMAwA0atI1gaagqJeRVxojRqwH1sQQXp3i
 8u3mHkhcRROMFQvRL4liXcFVFdgjtntjLIWg1a6VaQJL+MtxmDDiomtGH96h7T1XTOTIlYLlDR
 E3uT5t+OU8wcBlqVTZgAAAA==
X-Change-ID: 20260121-qcom-rpmpd-semicolon-1f985a101e0b
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-90050-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0E8E65A62D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop the unnecessary semicolon after the rpmpd_send_corner()
function's declaration.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index f8580ec0f73785544aeb6f686438f39b477d134d..a7b311f966a04210dbb499066cd1105e2c621cd5 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -978,7 +978,7 @@ static int rpmpd_send_corner(struct rpmpd *pd, int state, unsigned int corner)
 
 	return qcom_rpm_smd_write(rpmpd_smd_rpm, state, pd->res_type, pd->res_id,
 				  &req, sizeof(req));
-};
+}
 
 static void to_active_sleep(struct rpmpd *pd, unsigned int corner,
 			    unsigned int *active, unsigned int *sleep)

---
base-commit: 95fad101a21d31b4facd1b9e0713bba1c517db6e
change-id: 20260121-qcom-rpmpd-semicolon-1f985a101e0b

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


