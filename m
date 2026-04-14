Return-Path: <linux-arm-msm+bounces-103023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDGGGuu53WnciAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:52:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D74423F55D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9985A3016D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403E533EAED;
	Tue, 14 Apr 2026 03:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+6CkLWz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT6g6Ua8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B03370F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138677; cv=none; b=jLaKpCezu7E5TOGFthj/SVescD+pXmC+PuIQOobZCe+CQkXdMYn0CqrKPVIyMqnj2BZcLdEaD836SIf9BGx7XtaXiXIQe3jKLFWtgXdmd0ZaN9vsD9xoyWLBHo0cJ4qQzZgNLIfa/dV2DAb4w8osNjCKkU4b1HBGo6zFcG3vGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138677; c=relaxed/simple;
	bh=Eu5qaAe/3AK+ucItsSszulOZnDDMIku1wvrqgO45C7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BYT7OyFcSYMLOixGQDUKksqP7i7uuAzHl+nGSi+caTto4BX81Hrvw4wIHubYeeLPbiIkT+HzHjYYO21IQwPUB9LnQpXHGMTOYD2KbxHnxevIJk5uhVwfZMATXA84gzagkwdhZzplOmL9oVDaguUwIkYwbOz/69GiTpkj54mhhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+6CkLWz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT6g6Ua8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCbhs2386429
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CCZnekCSCnej5NJvQubf/D
	3Z1/MSRkl/mWvIr5kdz9A=; b=h+6CkLWzxec/SA/IVIEGgX9PgZ/7bx199jrBei
	ZExx6dmE6sr9lgs7eYDxrHAnBKjWMAB/aEMMQmXv6iw6hLgcN2uX66lYDQmIReeF
	PfwtxWiLPKWOQ3uYDiuWWE048ZEoXHlANxdxnj1OZ38sP0LHoEbDw/wwgBG/U0Cg
	gtiVg1RWDxhE4QS9Q05JH3JFscBLs6olWPJzj0Kd2XRm8PZVRakA6XfuAk+PAzIL
	sdB+CdTXWrleXCCHKi3qqEdbM6KDxTFmFCJee99QRRfcq7lBM2kJxTsJ1C70ODaT
	Ej/mhx7bFgOrDJJeWPtUD1mBE1X2e203hSnFX1/m+yzmAxRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w0wcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:51:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9278587bso4978570a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776138668; x=1776743468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCZnekCSCnej5NJvQubf/D3Z1/MSRkl/mWvIr5kdz9A=;
        b=aT6g6Ua81wjgvSXVpmnqe7IwJan770anCGyVIWjQ/KJxB+wt58yA5wSmuPiHqWLzh4
         05hRmgy9rbTZVYfZwGPJ35w2FpnU+eoHCwxAd+vf8QobmWe1NF8wiTE3q/yr8IHkghIK
         Y46eucMYG6gB8r5NU3+9HHdmzzkngDvoSWxJ49p5WA8dszd7QzEiXRFEHHz4fxFD/acz
         zs0YxuZMvDPR/Lm5xTkWZid/vySKcZyLv27/F+fkuO4yHf3lzgu3lvqt5kGNBVZ0Jgx8
         /3snCIduGK4Jhbxhly6R4F5HYDhhXVDgJQkmA4DGT4/EUB1ijoSWTp/mnX44R00McsXW
         i5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138668; x=1776743468;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCZnekCSCnej5NJvQubf/D3Z1/MSRkl/mWvIr5kdz9A=;
        b=AyY9eiGOkK9d+V0nV+WK8FQNd4TYSMrtMvz+6fNWxmYa1wpGyIfKAXoOW+Np9GNmIZ
         saUbwwrZs88tWtpSfbH6UAiRsXoCKLutU1gegRi070//BZfL+0x2j96Q80eh7mEZwcn7
         IXLUhsv1SzUoypmtStFupktUoSVCHv+//pAT3bBzsHb6VVCALjC+nKD2gJ2Mio2tWbd0
         aUycrKGLrDR0lrfS9iokg0xV3PoJ5HqAE/QKl4rzriE4VkBbp+OCwfqJ8u0hZXcrKQmc
         DeapERmFZb1eUO3SxlZMvT1bJk94qRLdMe0Q9fhSZz+AzAN1fFzPZ/Uz96eTzRUsuo04
         wTCw==
X-Forwarded-Encrypted: i=1; AFNElJ81ewyatHy3ErpIO10LPhPC5qrRAJeRoDWhvA52Nijb7ubQD40WdDFwjH1EwkXOJae+s2DgE77DJ3Hgk7lR@vger.kernel.org
X-Gm-Message-State: AOJu0YwevDPisUO5RTwijEgFdYNpTGUtCEOLEAcIO+XytlXRoT2lffJ7
	4kazQ37CD0W1mquw6QhGo+fficK6cxDIIlvYJGJ8TC16+GoBS7iRa2FYX7bUpDa8/6F8nfMPmgV
	H4Rqb9tmdAi5dqjTO9/56vdHWhR38+qY6+ZP4ldHjkgTIuiAPIg99V8j0scxJrNyNPUGFjCbYVm
	Dt
X-Gm-Gg: AeBDietM4j2Z0dN25zERwneWfwQNOGa5NoY1t5dPqveAW2UnCKSQ1YIgkqEteI7Mukx
	KQOMNcDQgsXhj0jGHbXyn/aSSrL6Vix2uSNpwl/kYFBC8zzP0KzUJGsMrHNcsT5Ahc5reVlK502
	WndqqpZaDAmoSwMmMHxtj+NkCHG1dNtiTy/t1H9keyecAtCnEqs2dSKtkOjWIC3VH70T4AXnXGI
	+3nENteF/MtyFajb3FnrzAvtOzygwpcTpEpIcZ4/3GFXnt2mYRmKCn35CpfAT9mHtoy4GHzg5bO
	Jxx6bDb4doomtUlZZFW6VUv/KFDqTNeLMpWoDAwlOV82S1/otiw6CwR6lwd5nHzJs4nitKwF2cE
	KtcaBBNSIbYhjQAvsv2Qxu2aTmZzAjC7lOCXSzH7PHcERJg==
X-Received: by 2002:a17:90b:538c:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-35e42854dfemr15000814a91.27.1776138667783;
        Mon, 13 Apr 2026 20:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-35e42854dfemr15000799a91.27.1776138667335;
        Mon, 13 Apr 2026 20:51:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e60635sm667725a91.5.2026.04.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:51:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 09:20:56 +0530
Subject: [PATCH v2] mailmap: update email address for Taniya Das
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mailmap_update-v2-1-73781622e702@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+53WkC/13MTQqDMBCG4avIrBtJbPyhK+9RpKTJpA4YYxOVF
 vHuTYVuuhl4B75ng4iBMMIl2yDgSpH8mKI4ZaB7NT6QkUkNBS8qLgVnTtHg1HRbJqNmZFZqiVX
 DLUoDaTQFtPQ6wGuXuqc4+/A+/FV8vz/q/E+tgglW1mVjTXnnlaxbH2P+XNSgvXN5OtDt+/4BA
 1Rz+LMAAAA=
X-Change-ID: 20260410-mailmap_update-f4c4e680fe4d
To: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: rN61ELLkbfkH5lUka8GCSaocFr11Iwl9
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddb9ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=pGLkceISAAAA:8 a=7YfXLusrAAAA:8 a=yC-0_ovQAAAA:8 a=1XWaLZrsAAAA:8
 a=DISFzqtZAAAA:8 a=QX4gbG5DAAAA:8 a=RZ3WUB_SBlng_sX02foA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=SLz71HocmBbuEhFRYD3r:22 a=aug85vrO5LANNmmtkfAW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMyBTYWx0ZWRfX3gKx8Pbl0ity
 +uw1eAoyEWIpGZK7mq61weSRbKa05NUBOct5L2IS1nG/W9F5pYKt+//OBQBoGaZ/kzDFfuu5CFs
 XmfLTSHohACbf6yoSBvexJPHgdfLoPH2IZpODsxb7/R6KUqaY9IE4sv5PLgAtAR7ue/B6knGq4H
 l32rMFTSz7adS1m+6lr82UhYzirf/ReMQhRxEfL9kXjv860dqN/P0b1nQy8tQiyU5Z/VYVE3DsB
 XgliHDd4KSomA7T4qHKFVgmOXCbCDjbYKqiTRzWEMrXzNKGm+b/YJIlAwl9FLQ8+t8A9JzVfbMJ
 WHJFW51BKz8/Nw49XbnA0DcloKyD4kMsCG9XZcFIeQl04k/8vmIrfewFjyjYDVUeO4zHmIsp5sm
 W3Yacz8AdYe29C+LDiDBfpoBMs/VJkpKitIQkECViePMTuS1wUuQXE0GwaYsMGL9Z02wxJc8u9f
 9ntZY32PjhevdDcmM0A==
X-Proofpoint-GUID: rN61ELLkbfkH5lUka8GCSaocFr11Iwl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103023-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D74423F55D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the new OSS Qualcomm email address as the canonical address
and retain the old quicinc.com and codeaurora.org addresses as
historical aliases.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- Update email one per line [Konrad]
- Link to v1: https://lore.kernel.org/r/20260413-mailmap_update-v1-1-5758fd5b0647@oss.qualcomm.com
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a7202837c1f0f4afa52c2a057fb25530f5b30ac6..810b7d88f996ba082e1a3cd813ed09ff40f3b6cc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -830,7 +830,8 @@ Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
-Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
+Taniya Das <taniya.das@oss.qualcomm.com> <quic_tdas@quicinc.com>
+Taniya Das <taniya.das@oss.qualcomm.com> <tdas@codeaurora.org>
 Tanzir Hasan <tanzhasanwork@gmail.com> <tanzirh@google.com>
 Tejun Heo <htejun@gmail.com>
 Tomeu Vizoso <tomeu@tomeuvizoso.net> <tomeu.vizoso@collabora.com>

---
base-commit: 3fa7d958829eb9bc3b469ed07f11de3d2804ef71
change-id: 20260410-mailmap_update-f4c4e680fe4d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


