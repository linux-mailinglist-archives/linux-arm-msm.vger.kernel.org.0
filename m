Return-Path: <linux-arm-msm+bounces-99783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFZIK71lw2nLqgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:34:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9631FAD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E18E303BDD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5713D8B1;
	Wed, 25 Mar 2026 04:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfX/Tn5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YI2lHCde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400B2F3620
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412936; cv=none; b=lROV73prBI1dX2Kdtf5iiHd5k6pazCP5Y6RQPVIraHfkCzhtoUCjK0jSQq++JP2OQwZFxvMyIBLpDkf6YvjakIoQ4F02539nVQcIyNUvQzoVcbyJhhfiQDjNm93uK6Gr7nmWCBJ9r6Bw5vidwgqHEP8JWPiXz0kOjL2S7HgCuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412936; c=relaxed/simple;
	bh=O9k5sbNbliyjwCfU4/2rvQsib07HELJ5jU7XvpY0BZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sE0wj1SHGGrUqi0arYzQjdHRIpItAaf5NDdZzma7WW0wCWJTz+OEwTXw4fJPb4RIj8dFDMJbo3LKlnd+U6GnyBwTQHJWN/wCQ7D8qUdSYemiDV9fw2AcCvzpsRMDEGV46aeCzz4n42K5lULuacJ/YcW8bDofGt+vpR/HDWYv5PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfX/Tn5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI2lHCde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JHPF3057532
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yCUcZwnRSz7kINo8xzqbZt
	uw5fBlTi+A3o+3zPGO0Xg=; b=FfX/Tn5BVd0OwI0xQOWZaftksZ9kEFV/QVUciu
	UV3iZv90M80GaZN7o48kyTkEbX90pNcmBQKAdrVKaUxSORGtdag9clwdGdiAIwxl
	CDkDUa59YDTmfCwXfHyuFeJ3jJwFPuLn5+0YaS0TxpEUTqr081MkxbOm737vM7gM
	Arq6hwhfS3E11d2c2bBg9amvZHC/uXwbYjpCdPM7cQQjb/nqxQH4dVdpKSOJeRGL
	FR841scB74Baue6E/6GnJFTRU6j7ZIh9Qv6H1DS4gR6V09oBBHEVytNCpno3BaUI
	3PMfOCErGRrJB0usOw+8Cb+WcWbV83dPAlpdULwREKrdnAUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0c1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:28:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06c242a34so384734045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774412930; x=1775017730; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCUcZwnRSz7kINo8xzqbZtuw5fBlTi+A3o+3zPGO0Xg=;
        b=YI2lHCde3eiRldqTV9jPwT2h6XlOtCDr6ZM2zj5PCC0qnx6n3h9AzxqDiAXAiECwF7
         fWSEPVgBh28/pVgznak7Dg9pX6nniCDBCsETcC8vRDOjdvnA6aJ7ko2yDlm/Nog2l12Z
         KwgxEC9+EiQ8RfAR1r28wFDqwhXkWhuPkhKdWM+Z1N3c3XHvELD3+kC9hVWVRB4lPRKY
         DCR5swcIcmgI7IwYgbBBKGNXApt0PjDljiZSpTbe5ZHibkO4MZIwfIL2DqRsVaqDPZLX
         QWmxL5INkw750wTMVA+zpS3ZJBNiV4w8C1paAZ4KxXO93cGn0TuhoCO9VvqMS3J9DhH8
         irFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774412930; x=1775017730;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCUcZwnRSz7kINo8xzqbZtuw5fBlTi+A3o+3zPGO0Xg=;
        b=DCWIqXpYD79ARMWsNILt+3IByDFFOZoWOs+ysHgCZfxnyQYkJ3kDEGO0JTZ8aS7VI0
         RxuaEPqem7JMWUG6W/HRLF8y3XBo1JOAqfit0XM8fiTZJqrnswhnBg3Cs7dZvdu5pqPl
         GHIUI6KV4CZBJcEQQ3I8NL0J8IGG3X+uF7VthLFSyoNZKRvEdNtLp5WYA0QSyrLTijzD
         61pkAZGxFr6sgAM6irEQpHrPGl80NG6Is5KzzgdI2/AEmpNHeE0wQ8c3mt6k9gKqi+3M
         JBM0AW7w1lCuNQAzBlwVQF2GkbHZrEUuua3lMywvH2RB50G7+w0bUYz/GtN249d2Zkki
         TvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3AHnTqARPIfF5L/wlQJfQYvg265Jr9GQZs7z2uRGuHUF1F4tq8LAbqCI+X35hgiHqh0r6Jtic/lRKCdrD@vger.kernel.org
X-Gm-Message-State: AOJu0YzudZK49uGwNLZUct5hbBYEVba1AGF2CNDNLRNBVUPOkV0OzOoC
	EobAXp6EgrCFGVHm8q+ZWS2Xq755hIX48U+pEN31pIpBNo7LYY1Bca64lWlwnZPUoZx8/y5JVGl
	M38vNi+Xmby0A4K/8tzpUuF109OLlvNlQpwuncxqL49DPxgNpK+5ED74UnmssxN1xBKM7
X-Gm-Gg: ATEYQzyAmevyYpvuBs50jZf00zGUJ/s9ZQJa+E2nizQRInP68ZmbY77Wj1XkFI/4e6B
	BBDtNhKeSox53IioJYFTwm0yAKe3/xaTFGk7jomtbjy5CGVUhfxo3ZMkRotGRR2ed1bgAabd2ia
	ibJm1QYedcR4UK0m95VNyFJ+02nYoVWc8qPqfyprGkA44gga9C0i/vQVxJQgTH1+uuu7EIKLya6
	kxCNPJ+aq6k3qhNrsFEjWfTlk2MnGqiFMlk5MZoAYEjY0GHROt59kl4ebzQeRt0Z7Jj1l0CYbdo
	VYqwK5XTj9pQrbba7569QIUh82BTPsYmJVOHIIxe/iNtHL4PkgihlOrRbB08NvjIb3iwxxtWEyp
	bcAVdG+nG6hU65ONKgZJ+SH5sIcsXtoAwYENYxw6lgLMxJyI7dJAoqec=
X-Received: by 2002:a17:903:2ac4:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b0b0acff88mr24108775ad.32.1774412930356;
        Tue, 24 Mar 2026 21:28:50 -0700 (PDT)
X-Received: by 2002:a17:903:2ac4:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b0b0acff88mr24108475ad.32.1774412929897;
        Tue, 24 Mar 2026 21:28:49 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549f63sm159890435ad.30.2026.03.24.21.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:28:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 09:58:16 +0530
Subject: [PATCH v3] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGBkw2kC/4XOTWrDMBAF4KsYraugX0vJKvcoJYw040aQxI4km
 5bgu1d1Nl20dDPwhpmP92CFcqLCDt2DZVpSSeOtBf3SsXiG2zvxhC0zJVQvtDB8nhAqnYapnCJ
 c4nyB2l743hO5wVnhgmTteco0pI8Nfn175kz3ufn1uWQBCvE4Xq+pHrrBCkt751GCMEYBhoBkP
 BBqH4U3iAQ99sS+rXMqdcyfW+dFbth/9RbJJTdEELXTYIU5jqXs7nM7aQ12bWzyon5q9k9NNY1
 0sDHGIJXpf9HWdf0CRCtR1F0BAAA=
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774412926; l=4463;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=O9k5sbNbliyjwCfU4/2rvQsib07HELJ5jU7XvpY0BZY=;
 b=/7aS1bDEnahBNol9wJblFhdEj1eTVHGO6PR4n4+KkiHRETDC6ViFMwqt1ObLqrk0jVJDfBchJ
 P5HxgdxYZaaDa5xcyvuEpoYVVOrDqA5WVXlr0XbUCk44Nkp8EbtuNfO
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: LOfu9FvMXLdGj2txbsy50r_ELNBJomZZ
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c36483 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LOfu9FvMXLdGj2txbsy50r_ELNBJomZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyNyBTYWx0ZWRfXxlf5QCfEPF1m
 KKLE/niHRVui0GKmRGkRN8fm82M0q7mHQ030VPwAEEHULj9nks11J/Ups6WFvJ2OWVYgLyRexyX
 K+2b+AXrGuIqPT7CJNB4IBfbW3r9NeF5a7l3QBG2UvFzSSaByHOyZldguD3VUWde4ppezNHz0gS
 l7rZ/u3rk2410FdgJdhKepuJaGKX7cjAhbbKvhuETDq7ZwZxD+QIH9LXFNgwFglV/XYEd8xl3f+
 VQHsbMjCEFRjgux4RjqN5AkpCOxASWbNJVHva0h7d7IFydeKn306XHXRVmi8flMEcqy7TKu6Bzh
 mi8hIwsUKocSXQ4IZvyq4so2jmNIOp1XdyULAcgt9Xs10cH7agVT66+egfspiQDjqygCizrPstF
 COKFO6/rTZievsB85vScum6PBGNpIJ0mIZV93YfKeoju5R8+KYd2hSr5WjtHzDcyWG+mBZWSWDA
 DG1Ug+hT1slgAG2A8wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250027
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99783-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACF9631FAD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Updated the frame_count condition check
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..180cba36a7f2 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -109,6 +109,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_recv_time_ns;
+	u32				frame_count;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..6d982802e5d4 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_count = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_recv_time_ns, time_delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_recv_time_ns = ktime_get_ns();
+
+		if (!inst->frame_count) {
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_rate = MAXIMUM_FPS;
+		}
+		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
+
+		if (time_delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_count = 0;
+		}
+		inst->frame_count++;
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


