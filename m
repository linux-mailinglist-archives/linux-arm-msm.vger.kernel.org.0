Return-Path: <linux-arm-msm+bounces-110926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HJAoJcP+H2r2tgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 067E3636763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mGtpZ2Yb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KxTMgbTb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D02FA3093772
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE41144D031;
	Wed,  3 Jun 2026 10:14:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF944DB73
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481685; cv=none; b=Tm6xogg/6DCaQGoV1jyBPerVemv76IQZdG3hwbWKaFPc2ws3nGNsbSbfkJhu+TD5hIoZs+fz+ykcefkwtS7kOiUkPMz+hpJJqDvQsxMyeAbiD5DYPm3ZctVpPb5mxXGPrYp+2ifyrxj4H/HuoIudrTo+j7a8kprwNPdYuVUdEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481685; c=relaxed/simple;
	bh=UdgwrPs59zMJ4eRy794D1R1z9mrbLfLKaDvwv5BaDs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1AsU3XKizZGF1SP62djUwDQ1Cfjo7+8B1KPbihyAg+0oEbSs7UZLZRw6BAtT5xchpf0MFsNh6C3AjaNZ+gbxswBuZspCAhEzj61QGmV5Oh88D7GElBfP2/0up9cZw9AAsjX8TM5g2baVcpUhwrNZvTNyNQPThny3PSmK64QWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGtpZ2Yb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxTMgbTb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RLjW873749
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LnbS4S8scpmlpCiNC5rbWe
	BiS/XtufgOSI7MG2jtorY=; b=mGtpZ2YbEg09pe6btlTHmO9seMEskf1338dwuw
	XoPmrXZmApOQcxmw1RB7ahwGesw+BdTYXeXylPzArraTRrYcjE9VGkxk451zv1Ig
	kQk94CfCkgxVz/uN/qseMz0C2aO0SPBsCrBJqQf/c2rENwnTi/mQYUO7O9mXvVBF
	vTmI6vqAsxcHDHc9kieHaMiCU6G1njX6Ob9n+E9TKXk9lNSDi9E4OB2UKjPNl/73
	dZzNDz73mH7yxY6v/9RGIJlNxrDNCuDKv65Lm/CH2usnSB7nSxptdt4LEWKqPLoZ
	UHtNswdn/bwBSgTHq4qxHVTrqG0H2yOX3jShG+BGwnROKQdA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jxc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842446a3851so1857567b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481683; x=1781086483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnbS4S8scpmlpCiNC5rbWeBiS/XtufgOSI7MG2jtorY=;
        b=KxTMgbTbUHftGtoqQCJOKh8ojyoiIK4TtAhtCo/SocTOkffjpVcZNw1e9Zd+dmqPu6
         RfgPSNvacn3z9Ls/0qyvoL2hSKp1mnVl5a/3GvcfvwbJ6WJXlLUeg3rRpmr4ieRb//wJ
         p2/ORW8zOUbtfDNkoVZidJmqHZ3CFziw6p+fJnmySbtc7aAj/sFXG9nlrDmkIQeZMQ//
         8YIErDXtLDR1HXgMwLXwXrer0sxk16aiBnMlLXf5X88XO4xHbv74iwYJ0C3PNbU/D+lO
         wU+yNz94l6G4VuhbISqNsH+NBAVEyctZHrUPeGHk2+vw+fQkNUdnmlobQqfbst8xdHXp
         xomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481683; x=1781086483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnbS4S8scpmlpCiNC5rbWeBiS/XtufgOSI7MG2jtorY=;
        b=HR38fQSm0NTYBUvIyuPRApSGtftgiw7SzF5T5QoTyvwToxLri7tb12AEXgBYGeI6sm
         IUwLALnqKF8vJUgABsWzizTCFL9ugDVhFvBxaytCYl+xIQJ4vaxnzNHyBdOEdTUiJhpA
         vaxrV9PM8oN0+I1pHQX/R9Km9eew6tWL/T4Ovsk4B7IIztKV0MbNn7V1+B0GGgYTN4k0
         s/JJDPkbHKuY24e6/xpx0MyUwRCswqQOVZGNlfvvkNPq8y9SFXRu81hG8H6OfoirB2nb
         TSdz8fNhQkzAacTqTx3TMfsQN3d21GyoNPUptNMvtBeTkASoZxAs05ZZ3smdrs89UAU0
         jiPg==
X-Gm-Message-State: AOJu0YzQrL+8Qg5EfsG0lEhx8mDySeYGBlmHz0OZe85y2pURuOdzFdzp
	+xJFoDIuEhaArJaPvIvES1OQvjsmCTS4I0Hu/uL4NA1V5/0f/dUoXEr8iqZqmq4z0RhOnbRDQod
	/7B8IOTPQ+KjQSkrdoyJ+z9WbEOhMd6Fzij3mrCLLyoF39TwEAqIeGYHeSgDLuAiwI/vn
X-Gm-Gg: Acq92OFLA4E9PHSChLoMakY0yj3tS+7vlXA39OCwuos8KvieH4F9FJgLomCIdWXw4WU
	l4LYdDjQ2tjr391DKCpwkeeDWl3dh9C9DGua9F+CeVle5kx2/3KhfIbBFaVJjjDJwHKMqd27HpL
	yI8cDYYAgThS6f2ulycbidq/21QySpw9oUOsuRkUsolhTdan8Un4tNO2oJ8DrIfHVC/EkzmzcYz
	ZdiMJ8CHpzEq7moi2h9G1rMQhBfB0SS93bFyZjTKJsjC9HiPzYY1lsTVAHoudzErJ9LdpETtTLq
	u7TG2vvW7gNuBCOEqBjWtWx0C0CVqyJrdlHUt3uEc7m71eNJAgJNALhBzvRjenfJ3Gn7ZnsMThW
	hQNpySu01bcfuFXDlG+ibRgYp9Pn+xtiMi7/tbZwp5z+PyB6Qv9qo9qiSitE=
X-Received: by 2002:a05:6a00:4b16:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-84284e6ffccmr2664453b3a.11.1780481683055;
        Wed, 03 Jun 2026 03:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b16:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-84284e6ffccmr2664419b3a.11.1780481682578;
        Wed, 03 Jun 2026 03:14:42 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:42 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH 0/3] rpmsg: glink: smem: robustness and debuggability fixes
Date: Wed, 03 Jun 2026 18:14:27 +0800
Message-Id: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT+H2oC/yXMQQ6CMBBG4auQWdukpWYWXsW4QPzBMWlpZpCQE
 O5uweW3eG8jgwqMbs1GikVMplwRLg317y6PcPKqpta37NkHpyXZ6CQVnRYk5NkcX2PHCDEOzFT
 DohhkPaf3x9/2fX7Qz8eJ9v0Hm6qWonYAAAA=
X-Change-ID: 20260601-rpmsg-improvements-643a6e133f66
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1327;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=UdgwrPs59zMJ4eRy794D1R1z9mrbLfLKaDvwv5BaDs0=;
 b=sheDCtCL05bMlt/bm7DYIScR3WD3L4vIE9GWvQbF7xEJDrvHdseZ2dY/mOALKdS2QvBoYCRaz
 IJlPR3jFmBUA/sgwyF+DrMQclec1IclfC+CYBJe6LZSo63iFAGwWt4x
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-GUID: -Gc88v6nI8oJY8ZuqF6HbvLLq5L93aMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXxi2bSm15weDs
 GZheOjjJIAamOe+i/kImhBG9ZS5U0g0niDGdXZojehEalCXHt3zr2vglBwDuBCUU8/E8kfBLmTG
 1gHZB1VKAaXpfG4Xx4+n8MQL8/uITDDbOk9dtEO2i0mbGCjsqIC+zGYba2DdF+5jbgESUgsbfow
 UksZSBT5wySZ4/Zk081dL03n12La8E3w/1L3Zjbne75Sgae0qjEXs84gPaM7sE3ayz09H0WjeTC
 sS0JCF2Z5haS1CcWyybxyyMwdZprlCZSRRwUbTkzBDwzYX739QFJkA81ank+wZ5rzcB7aVxYJ0M
 8a5nTu4jhA37gkEND9rDhgnhRsZsRppZuy18TiEPdDphC1bPp50JWqnOrpNP7QeCxlonnkD6taA
 /h9uOX1FoXLXK+zbL1qlhTunNqo6v0OlO9IMA6PLYSrQNMA6CRyaQHKZXc7NvNMoHKNfdqvGFPb
 B0NQ1YESEa/mpROraNg==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1ffe93 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jgieur2UFhqAYsTxqV0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -Gc88v6nI8oJY8ZuqF6HbvLLq5L93aMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110926-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 067E3636763

This series makes three small improvements to the SMEM GLINK transport:

1. Use modulo instead of subtraction for FIFO tail wrap-around in
   rx_advance, so the index is always normalised back into [0, length)
   regardless of the advance count.

2. Add WARN_ON_ONCE checks in the FIFO read/write helpers to catch and
   report broken index invariants early, rather than proceeding with an
   out-of-bounds offset into the FIFO.

3. Pass dev_name(&smem->dev) as the IRQ name instead of the static string
   "glink-smem". On platforms with multiple remoteprocs each SMEM GLINK
   instance registers its own IRQ, and the unique device name makes each
   entry in /proc/interrupts identifiable without adding a new struct field.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
Chunkai Deng (3):
      rpmsg: glink: smem: Use device name as IRQ name
      rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants
      rpmsg: glink: smem: Use modulo for FIFO tail wrap-around in rx_advance

 drivers/rpmsg/qcom_glink_smem.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-rpmsg-improvements-643a6e133f66

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


