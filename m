Return-Path: <linux-arm-msm+bounces-90248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGxeJCVkcmnfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:53:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5F6BC17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E27830ADC56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A638A70B;
	Thu, 22 Jan 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvmUpGT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DAE31CA4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102438; cv=none; b=mGG9MWsHZmM2dgAUwafG/PZSm65fNhaWuRcBPdS+pfvI22qnjGZ3CAUrfFkFMW1WGjKPewUTGXJ4Bgb6MBWxWSJuoquFdw0gJhHxe1EKJAtwn+cV496oSHcz2PdN5y2tAivlpbi7ehn75lzw59DRUFSlSRfNEThm+EAr3CNi2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102438; c=relaxed/simple;
	bh=n9RZtPFllLNwOyCjbUMdTCvnrM02g20QTY6jzHJIkQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=neoK71d8iZB7JlFI3hCBMZw21so64g9o4p1UsPTqou8IXwx41XmbxGVy7BDGOgYqkfHbqnFs0JKxUYkS2HwzrN/SV+2w2B5YVDDUvKpqY05cGHKTmQ4bEZ54bFSQHqLj27ORZhLUj7BjCF4rjxpWJBjKhQ7DdruoEAkRrQ536bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvmUpGT8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a302794so854594f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769102428; x=1769707228; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp66PoEMaro4oICpmfiKYxfo9XQqIbFmXqoLz93VEMo=;
        b=BvmUpGT82iiIhC3Xk+d071xVm7e+IRxoewBvylH+AeIcLMLqpCYXu9E9WU6iWUvdcW
         QoP9DWr6MAZQNO8wr/BBC2AV2LnYm/EHIuBtRmLYqvt9rWMuDD8koYNMNE75+v2pTtuy
         3LgvRDirQKYmuvFmITKEioZlvQ7uZ6t5QhKclecL/U1zKP9W1Sjb2Dhh61CvvzmzMXMq
         0+EXWZ1uMJeqCLAcOEnlDAUjYXXeClfNYXj3T9i5lQb3lT6TVh8ypWUK2+Ww2LjEMdBB
         OmmUolQrBCFTscJINHcKwoBU3zjXcDbgSF/Flm8NgUA4PWBIS56W3CUOBWRGUQVCmKry
         q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769102428; x=1769707228;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp66PoEMaro4oICpmfiKYxfo9XQqIbFmXqoLz93VEMo=;
        b=TD6imx48N9ltGNOrthlkqBdx3fuIM8/QGwvMZ4lhLZuj95ytJhUTrFebZ2tqHs+fmY
         yy7RecWudbbeLrmqzg8vHMyXUlndrfCTQHhr2Tnlj76xR41MuEsPpNykbgGTMmhNQFpY
         F6IURqRSAGOVMMTBMd2APP7CtEOpM7+auE2QKjLsSEzser3JfWR+c39rq8xSjgCOTadG
         dBxekfG7Q3JtbiAs5i0hkabqOeTSSmR5ywH8IBzkDhKH/ng1JqKHuJmH2w8QVR6RPsms
         ayBK0Fybg1ArmE+GJj9HXqfdUQc8i9ENTPpDyifUqVf3E1Et3gZpKSjiIGnjjPKEnFay
         yTnQ==
X-Gm-Message-State: AOJu0YwQ4Ma5JSapPtfyLHbCBlq3Uo7QVf0imuAk2Pm65G4GYrWD3g8n
	85s0EHyktdJMUjR8AvmcS+slbvKRF8ruwQ8e9p3EuemMWz7WmT/yBlkD
X-Gm-Gg: AZuq6aKV91lsfta3/+bMvvUq/uhtL6qLScxvn11K3xiMphL5mKCKwHl7r1cO/0ePlu6
	YBw3POc1+ubXWlJ6i9eYXEDZ73eYuNgn6u8teRi00pnMivgfggRaXzCEP5ZVio/Lcirq8/9Fjb9
	oan9lbNxtayKVzKJRKQc5J2rZYcWz43Ngkw1nLxtSffLHqBv2Wz1Tnd5xU3cew6xCnuRLuwPJpA
	3bYY8D/Qg0hFplUFsPAJuqDVhlfANC3+pIdvQ5CT0X+csFs1pemZP63CHjEiMg4wSy+QOKJdlHb
	2kUGeUH1RhXc5U8bv65Fmgu1XTOJcCgXcno0Deeukj9a7wGcVCtq0d5QCMzm7J739YD7VVYdH0j
	13+fDxUY6WCt5ij+XyEgq9coPmG97wGK2hD+gl+nd7xx0i5Q8Dxl3abaHekrvD6FGCOD/I39Ltb
	PUB+1Psv/pVIEd6KoWzCg88vOya0wodaS1cDk8KHh8
X-Received: by 2002:a05:6000:2dc3:b0:435:ae97:b37 with SMTP id ffacd0b85a97d-435b161343bmr424678f8f.52.1769102427581;
        Thu, 22 Jan 2026 09:20:27 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435b1f7ba0bsm51378f8f.40.2026.01.22.09.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 09:20:27 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 22 Jan 2026 18:20:12 +0100
Subject: [PATCH] pmdomain: qcom: rpmpd: fix off-by-one error in clamping to
 the highest state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-qcom-rpmpd-clamp-fix-v1-1-7b6a67975a69@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEtccmkC/x2MQQqAIBAAvxJ7bsEkjPpKdJB1q4U0U4hA+nvSc
 QZmCmROwhmmpkDiW7KcoULXNkC7DRujuMqglTaq0xovOj2m6KNDOqyPuMqDyqiVnB3JDT3UNCa
 u+t/Oy/t+432zk2YAAAA=
X-Change-ID: 20260122-qcom-rpmpd-clamp-fix-060fcda9cd74
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-90248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6A5F6BC17
X-Rspamd-Action: no action

As it is indicated by the comment, the rpmpd_aggregate_corner() function
tries to clamp the state to the highest corner/level supported by the
given power domain, however the calculation of the highest state contains
an off-by-one error.

The 'max_state' member of the 'rpmpd' structure indicates the highest
corner/level, and as such it does not needs to be decremented.

Change the code to use the 'max_state' value directly to avoid the error.

Fixes: 98c8b3efacae ("soc: qcom: rpmpd: Add sync_state")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index f8580ec0f73785544aeb6f686438f39b477d134d..98ab4f9ea9bff431614739f37cd32b7b3bb407e4 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -1001,7 +1001,7 @@ static int rpmpd_aggregate_corner(struct rpmpd *pd)
 
 	/* Clamp to the highest corner/level if sync_state isn't done yet */
 	if (!pd->state_synced)
-		this_active_corner = this_sleep_corner = pd->max_state - 1;
+		this_active_corner = this_sleep_corner = pd->max_state;
 	else
 		to_active_sleep(pd, pd->corner, &this_active_corner, &this_sleep_corner);
 

---
base-commit: 95fad101a21d31b4facd1b9e0713bba1c517db6e
change-id: 20260122-qcom-rpmpd-clamp-fix-060fcda9cd74

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


