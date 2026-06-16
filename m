Return-Path: <linux-arm-msm+bounces-113457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gru3MaWHMWoclwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:28:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6795E693282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qF3V3AJP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C347E3045E35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2457A47AF6E;
	Tue, 16 Jun 2026 17:27:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315D47A0DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 17:27:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781630865; cv=none; b=vF351ACKBhvOQ7d7WKyR1iOHsLK9UctAFZ3ByRkEiAcXmNf/Ib69UzRPBj7ywV8BOmhXeGKtB+qoQ/UFKdPUfGpkG3s0hU5lrFRtGiP53HmQsh2Y/5GvWZChqdr+4iggnc+7PDlsPOdB3xu8ZkE6S9aL8WwYCgaB0LSA7KOo7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781630865; c=relaxed/simple;
	bh=O8cbjHqHqtkMgHfh7cfL3XvH7d1YL05sNt3MZ69NqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GafUfNb0SmKWt+/qIARMsTTJp4V8nfmsVVLHsl/Jy53oFHLRBHS076KabvtbZsclSbzSvT2lacry96rCD/6ofMsvXNYmFBoh85PfOjM+dJ/EOZE4ZhxT3eY5T/nzUTRzGFZlh81A4utjwQrn06MUsovCnF0NdvMlYAWk0quGki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF3V3AJP; arc=none smtp.client-ip=209.85.208.170
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-397e391cb2aso43087761fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781630861; x=1782235661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihatTAgtIM75Y72cnH9JImL7Y6UJlEwRW9iaLN7oWc=;
        b=qF3V3AJPMBkAunfzp6smDuq50T8vfHKKgXaMbD+DMCaFiLRiAUbOxUSTvux5azhrVS
         GdrLW6Zn37NC3jvHHlg+/nPtMtiS+Eep73n6zefZHlGUZlla/C8Vn2EoJDhO/BpOgfLx
         DTSacEVcL72kOZ3UxHFbB9+hsZPMYH+wrZmCwVxwkhy0r+0tbUlbCpP099GWTOFit6+/
         XuD43zN6zqsu8WcJJRIUKX82lMJftJAGLgrk23PRGLrKF3i4Mtgqcsr9jzdrBBy/E4Xb
         hTLZ21rhWnB0U3274ZDhzJZaD1SV+/w6lVSztDo4918TMm57pdwQYyfHQYkrlAnKQvzQ
         m7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630861; x=1782235661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihatTAgtIM75Y72cnH9JImL7Y6UJlEwRW9iaLN7oWc=;
        b=Oe+0axz/RrIu+evWjAFuVRlqOqplChpazRjZ5w4oAV2jgaaJH9OFhEFKPCFRlkDHni
         BQngYqGKnNl5TqLllIhoh8uwqJ5RLp6cM2n0IZ3AX8yiqIiSQfsFo0trax6FXidhK1My
         gb9gub6qVaQxzi4G0qxdQ0+IMR0I3Y9JxlAahISuc8Bp9IssJDvlPwhDiA0ZuTopuGMI
         rbO24jDWinqUyZ3bAPU5UpXLU2J0CwEMMdl+KI9AvRGGSUZW/pbMLExcOrI/0UDy8SMl
         R5OatvCNIVDZR7DOCho4+/fFLgMcOBhmdr/Eyw6rlEcP3+2bZXKcMr2uQabYqqkoDV+n
         fhMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6VobiZL4rizlXBUqvefPJ7GAG+CEXBCmJ2F6TPyeQY2santEJ4hAILKmz4Xw7mpflSmUuq4w8qPVI/35d@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQjW8St70uAB+LMeVaC00QVhRYIuotpsBfNaQUE1bhwz7tDgq
	fFX3b4riCvSuU5GKvUhShWWFzp9GHpls4vUjIBqAb5oAqJSwv+QK/Rht
X-Gm-Gg: Acq92OEQHVM/6cDMXnE/k9FhILvwHEUPKOa7pykppc6I4bdjB6PPReMszD8iWiKtjBa
	Uyskq/P0lgb/YQPQSVXkO/Q4PtCLqZtbxYJIhVcaHGhdFgk6OZYqZZmEf2pbnt3xznZIzU8x8tL
	FgZaQbUUrJuJPEVSIpWMaMZky9H2pOMApiVncckREGeiDVTxbeCtfhjxDMTmYsEvZM6WokVzvuC
	pjm+7dHheUP0toEPgfDG8i4lS0YiUXpc23RbyHcJf22XgkqdaLgIwGE/EZGqpLyiTsbjStN1YTW
	S2rrxkhfCKGp/3XiMBI/oEfDrQKIbKyUuLuhfD4f6C7gSafRQLd5XchTS3rlfNCaqxaYLdEYqwK
	Tzfb+AdxGmShy/v8LFxS1x9RI7KurBSJnlbeQShH39ZuZ0feIwtWKOqjzq1KQU/5e9KlvEhbVG6
	alm7x09vns6EF6Mln+cohYL33J7CLEBvaeQ03IGUI=
X-Received: by 2002:a2e:9a0f:0:b0:396:7b20:1a77 with SMTP id 38308e7fff4ca-3993575584fmr52468591fa.22.1781630860527;
        Tue, 16 Jun 2026 10:27:40 -0700 (PDT)
Received: from grower.astra-academy.ru ([185.32.135.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05acfcsm7978201fa.13.2026.06.16.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:27:40 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	mhi@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] bus: mhi: host: Add alignment check for event ring read pointer
Date: Tue, 16 Jun 2026 20:27:42 +0000
Message-ID: <20260616202743.84303-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	DATE_IN_FUTURE(4.00)[2];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113457-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[alexevgmart@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,codeaurora.org,quicinc.com,vger.kernel.org,kernel.org,oss.qualcomm.com,lists.linux.dev,linuxtesting.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:alexevgmart@gmail.com,m:manivannan.sadhasivam@linaro.org,m:hemantk@codeaurora.org,m:quic_krichai@quicinc.com,m:quic_jhugo@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mani@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:quic_yabdulra@quicinc.com,m:quic_vpernami@quicinc.com,m:mhi@lists.linux.dev,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexevgmart@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6795E693282

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

commit eff9704f5332a13b08fbdbe0f84059c9e7051d5f upstream.

Though we do check the event ring read pointer by "is_valid_ring_ptr"
to make sure it is in the buffer range, but there is another risk the
pointer may be not aligned.  Since we are expecting event ring elements
are 128 bits(struct mhi_ring_element) aligned, an unaligned read pointer
could lead to multiple issues like DoS or ring buffer memory corruption.

So add a alignment check for event ring read pointer.

Fixes: ec32332df764 ("bus: mhi: core: Sanity check values from remote device before use")
cc: stable@vger.kernel.org
Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/20231031-alignment_check-v2-1-1441db7c5efd@quicinc.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2023-52494
 drivers/bus/mhi/host/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 49c0f5ad0b73..57c8d15b687c 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -222,7 +222,8 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
 
 static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
 {
-	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
+	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len &&
+			!(addr & (sizeof(struct mhi_tre) - 1));
 }
 
 int mhi_destroy_device(struct device *dev, void *data)
-- 
2.47.3

