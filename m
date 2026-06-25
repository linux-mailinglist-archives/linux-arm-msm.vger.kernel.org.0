Return-Path: <linux-arm-msm+bounces-114557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frJjFpY5PWrszQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:22:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD96C6933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=UNqNaxku;
	dkim=pass header.d=redhat.com header.s=google header.b=MSMSGZfP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AFE73011A6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229083644BE;
	Thu, 25 Jun 2026 14:22:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4A3624A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 14:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397332; cv=none; b=ViOaochdnhye+J9rfxlleLasDdNbBToZMrgP6ZfD6W3oFuRO8hm7rOdGd+9ufzw+B/Gy/NnUp7tjd93GQ+iLC3JCGfwXXn2Hbuhh7dggHHYPr2JL/16YDkF3AI/YQ3rcKT/z1Ds7qKQbjL6eCkd2OeKE9w0n26JGFEA/Q7q+ZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397332; c=relaxed/simple;
	bh=7P5OVSlBwQBa2L1a2kIB+WV0bNP9fstAVD5b2d4VczM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e1UdZiDxtnms+sO4lQ3E6817G+V/KpMb8NnIo2ojRaRHK/VMlOYMl4GJiHGko2P3NMHWbtXUjMXcWgynQwkUoZkcmGnrdd1/dVqiPgFK3OoUAXH87tO8MnO2zyguonjiYHOG7ioHZCEZDDYF2pppmNCiSJaMHyHG0ZqxZ+gR/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNqNaxku; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSMSGZfP; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782397330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B8X7ICklwV+HU//r/zX/JXRLi9ZAF8M6fuhETaloCPY=;
	b=UNqNaxkubtTmi7+eWhha7aVARgQoUg2/66xl6c30rOf8jw9bJdnayAURKbjogtV6Opgb/B
	SI1o1Yp7Dwbjxxlp/39vuonJtCy33TJyFo19ayC6ujlJNI3Vs1aK9LJz74yPdmPiurVGFc
	oWUBaQNlEDL2YUImsC1yYZMOHRH6GRU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-NjsZFMmuNVecS6oeJnmIfg-1; Thu, 25 Jun 2026 10:22:08 -0400
X-MC-Unique: NjsZFMmuNVecS6oeJnmIfg-1
X-Mimecast-MFC-AGG-ID: NjsZFMmuNVecS6oeJnmIfg_1782397328
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91598ab3a1aso245273385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782397328; x=1783002128; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8X7ICklwV+HU//r/zX/JXRLi9ZAF8M6fuhETaloCPY=;
        b=MSMSGZfPy+LmvP8rRdCMzG13Vtbg4vGWm+/LMJlZlMPoqasCkv/3Q48sLINucn8lAu
         nfEmTkZhGf4ohMt/UeCY/jFaQ5PZMGPseKr3nbx+RwIKDWb6R7E0MJ2xh2QcTfY0Tx/P
         HfT+i86WSTfXIQCK2hBId81kphjekqhol+cfyuM3qM5TfR78B/aRcDC4ahDWISGIjP35
         hgvbPwK/mFF3M/PDEPD7ftv4Z65guM6vTbjhvMyVO0JnLu36LHs4PIATfZzVZQ545jcD
         rPm6d8IkSJ9InJQBq+4EXoox81RfNKXCOcWTlLhMD2Tl0stK3wPWnL4N0pdcVwSoaRdk
         7SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782397328; x=1783002128;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8X7ICklwV+HU//r/zX/JXRLi9ZAF8M6fuhETaloCPY=;
        b=L20c71/Os6u3uJFLpKdGU3S25OE5VRaSHjAk1nUDLD9V6G2+smwlVA/wGVHD0zhBmy
         RuO8xr/Yw/oAKqDYl129rHp6FVKR1CyT8YKL4rhdICpgE01i+1hLCZ9FVdFVAQCViR0E
         2dApOg+fEWxix8/0dm0NUjEBJV0aPnsbRGct9j4a/x8+9naTcluHGT1EB9MkesqLzJJ0
         BJcTY+pw3DaqBgfHEzr9FIBXs+y+1ApPE2N9HjgIlJvhFJJhYchtaF4AsL1vekmBntQx
         FjERuZpzbyhwCeGG4BIsxDhbjfA+t9dJZZ9dh7Rvbxhio0jJw3KQCeFO68NZ/DdEkqOR
         npEQ==
X-Gm-Message-State: AOJu0YyGktQkgf7eeIxxTQfwpLyXCLyKPp9o8G4FL6zSW8oOiRKVXIAt
	svieijohg0ScTF1ClIX9Ka1zcg4aNiKMH/1kiyOyN+7Z7JE1o6bA1QUQcCT2nKw9sMBrMLEOaFv
	NoCNIAWVAp/gV99qGR+XimxIpGfY+ZpPvClminfABRutTkBeTFfyAuLBdTwYlw0v+voM=
X-Gm-Gg: AfdE7cm870SXZUt+4poAUNhgfpmpp3sYu91SGez5x6MVFl7/NN1OpZ3SY38YyCU4jLJ
	zpwJ+/Yw1ptgw1Gy4safaU/KJLe4wTT7al8gAT7rQWiIJtz+2ElradEGKWt94yipU6RqNwLdFDV
	/PQ34LfSetQpEh7oa/pJSeGKiipM6cBOoYRyo2jLgfX2x3eVEDJt+Le9a1Y+nGJjOSXmyQSN8iH
	p2Fndh7Dbgfv0lrLCcZpVZdqzHmA5WKMSLGi0I/7PQBnOj+JwbHgD8wVYBbeDxXbz2kdvqjzg88
	A399hacPrhPI2nYjD5ddfKNYb38N9c8IcZOqEq2E8qXq4ARIa3ClFE4a0Q3sF+1uPq/VMGhQSZs
	G9R4PrN9GCwzA
X-Received: by 2002:a05:620a:46ab:b0:91e:e613:9c5f with SMTP id af79cd13be357-9293c5fcebfmr395647885a.26.1782397327822;
        Thu, 25 Jun 2026 07:22:07 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:91e:e613:9c5f with SMTP id af79cd13be357-9293c5fcebfmr395640085a.26.1782397327239;
        Thu, 25 Jun 2026 07:22:07 -0700 (PDT)
Received: from [10.1.10.209] ([162.255.191.18])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926000c343bsm851247785a.28.2026.06.25.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 07:22:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 25 Jun 2026 10:21:36 -0400
Subject: [PATCH] dmaengine: qcom: gpi: correct channel name in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-qcom-gpi-err-fix-v1-1-5ca3f00fe2e3@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsEsJfpKdIhabQ+lrRCB+Pek4
 wzMZEgkTAmmJoPQw4nDVaFrG9iO9fKEvFcGrbRVVhu8t3Cij4wkgo5fVJZcNw6mt2qEmkWhqv/
 lvJTyAb+kt7liAAAA
X-Change-ID: 20260625-qcom-gpi-err-fix-06ef18453608
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7P5OVSlBwQBa2L1a2kIB+WV0bNP9fstAVD5b2d4VczM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJsLTsnzTy618WQvTYz807Krb8ZK2Y4G3ftX2FZd3xP4
 JGbU1cGdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARd2OG/xWM9ZaLp263L2Z9
 +Poyz7yphzPu9Am+TForN/3eTsNS2+kM/zM91G99nNBg1j3P+faj98/q+5Kn7fu0xMi1afHqCw+
 SdjMCAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114557-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDBD96C6933

When attempting to start the Fedora graphical installer from a USB
thumbdrive on the Lenovo Thinkpad x13s laptop, the following errors are
shown in dmesg multiple times:

    kernel: gpi 800000.dma-controller: cmd: CH START completion timeout:0
    kernel: gpi 800000.dma-controller: Error with cmd:CH START ret:-5
    kernel: gpi 800000.dma-controller: Error start chan:-5

Looking through the error path, gpi_send_cmd() sends the wrong gchan to
gpi_send_cmd() in gpi_ch_init()'s error path. Let's fix this by passing
the correct gchan.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
There's a separate issue with the graphical Fedora installer not
working that I haven't had time to dig into further. I can work
around it by using the text installer.
---
 drivers/dma/qcom/gpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..3f390b5821ab 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1965,12 +1965,12 @@ static int gpi_ch_init(struct gchan *gchan)
 error_start_chan:
 	for (i = i - 1; i >= 0; i--) {
 		gpi_stop_chan(&gpii->gchan[i]);
-		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
+		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
 	}
 	i = 2;
 error_alloc_chan:
 	for (i = i - 1; i >= 0; i--)
-		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
+		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
 error_alloc_ev_ring:
 	gpi_disable_interrupts(gpii);
 error_config_int:

---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260625-qcom-gpi-err-fix-06ef18453608

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


