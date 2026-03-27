Return-Path: <linux-arm-msm+bounces-100162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PqdGgPMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:14:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB133D63F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B32843001FBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B881A23A0;
	Fri, 27 Mar 2026 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtynslot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InbzlWlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5AC188596
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570476; cv=none; b=SNjIWG9olCMYjwjTJ+QXcrozjLjJ1tt+Csdvuh/RjyfPpEc9NqbY3aH6guakkYQ5h8d08eYaxyYs2HxmisjIKJGlqqMGGH31664dUqVLNa9Gr5tDKPhurL1x7hNzqWrC6cYARZ64qPUw5xgbkmFYjkOQpZiaqyd/s2JSB0y4Wlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570476; c=relaxed/simple;
	bh=obyboWBP3UrpDRtKN/55V2OMReShR93eEU0GfYkS7mo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rNs9WJUe5VSuIJc5OWoobKAXnb1IbRg+a2TjS9pYlHD7TOhVijQf1qzNkJbyq3F64t2X+HmwuQbE/MmY6wzS5BDqrEPtnsECk1GvtyZvenrLq/Ji+an/CnixEFnFipA5r3UVwm/hFmMoUKZa76V4AHjjiRPslsiw/XIEMpxCHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtynslot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InbzlWlh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QMCoYM2583850
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=86oPhv+gqLMAa0j+cJ2jUB
	7qTPKEeQ/+LJnNAbKDKb0=; b=mtynslotJpTOczkxLElMzs1iWs/b2oJTH/8PAa
	dQqglelng4O/8WaDqruaiqyDV8kLGKhEwZHoILM67aWsylYgSsrAG1Cjq3L573XJ
	gR3Mi9HupXLv4cp2uXb8LhFY6LDep2s5xgGP5XH/N2Y8XbcCFYanjjH6dTu6jGEx
	oqVtPBYuhQibJ+ttE7KAKItGoWwfAR/+9EArMkHKgQ4yl6TwNgKSeHe569JYP2AM
	phTWaaRVUt/UblVzuW/w5WSiGtQ6ICHh0BDCSePvSxS4wHQuo8TZsOFHeKrGa4Ia
	ePX9xRO7wrBMFV7/jk54AwLhX3wZrXCNWdGPxUVpF5m6O+UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6g90w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c0f03b2a1so4431760a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570473; x=1775175273; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86oPhv+gqLMAa0j+cJ2jUB7qTPKEeQ/+LJnNAbKDKb0=;
        b=InbzlWlhv5QKwTrHkhXWw1CbBHFbx1PtnqFskRl28ffEOYKrjmFZshfJDdLK5HIQcO
         qjtQb8bS5rUUna5WWgoCQOZWrxoNccHgZ89lQnrGmxzOF6sQMxo04d32epYgcAKde7eZ
         NtAqkmlyOzVUGsExGry9mBQ6apv78QGwhW5SvJOYPenpD/3rOJiBxfVMQAzK3AvuEmsO
         u0LVSk74Fzyz5TSVOYQ33YK0UMe+JvVitd+BRipEF/0pSTKEUKU7ISeFePZBhxg+mrFh
         ypG29Bbq6coQ4aCmzURe544qrA5+8HTEQTtnAkQmpDJQONQIFzEaQXCHDs+UG5L+8A3g
         RX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570473; x=1775175273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86oPhv+gqLMAa0j+cJ2jUB7qTPKEeQ/+LJnNAbKDKb0=;
        b=EDceFNPD3c5KcZdPm6i/jka35jM7H13oDA6PiXjTXdHDFqFnqKy+LXpCxbbXVBJKcY
         65LZvzaHTrTMOl6WEbOZEzDvDYJTlU1jygz6YjAnMVOMZjtrpsWR0JyDQTjL/ISZ4fRT
         nQQkutSXjGjszWtpdMQoBAfSbvNBtK3zvPt8ebMbJQgvc+aPYVHrBSR/z4O41R2HpDpZ
         tSsb2XxpbmijMNGUnLOQJ/8+2kh1LtosFcrgJ6Aq0WNYux0g7q6YZATZYKChMa2WNQdd
         AvOQFkIJprvd8teRKcYHMWzW97nq1Bmo3QFLetKDpUmzZHA9jOSf66NoXfVTxJ+x9rEq
         xaAA==
X-Gm-Message-State: AOJu0Yyjqk8rRC0gXhSWebC7PgNbzz8SQynKSlNVIB3phastHewJmbQn
	ZPCZi5PsUH75RHuZVeR+l34A3AHAMdjneCumkrZDC/5xW1lZKEh9XKT/m/W7U//AxPbeI/GdY37
	VGpSM7wm3ApqujrRr7G7ZaZbo5mNg1YQ/lutfq7l9xnr3IQjc4ui29BIkr2bWOF8jARdx
X-Gm-Gg: ATEYQzye+Jad7VYxIGHhAF3t/NeCYwbwVqiTwcc8DP9/p1/TfnOb7ZP6bVlaM743g/I
	yNyNT5ERRiU6pfwsE3qvmHyWay2PtyxivThACuxReFcYHSDptsi/GoMlqFfSqOkAnurxb8EZ4DZ
	bM/c6HgTOiLU1/OBZxUth1czXCJLkDqTJrnTK9l7uwkjyt39OvfTrmKR+7eXrNeDUmST5sGGMO6
	mXzAdBjYN09robWQ3bfpotajfeTlI/AgNI5w7Ljk8avzINTLaTWd33TQueAklQol8rTrjXcL9tm
	cO5Op+cUFn4fzPTmML2B7XSI6sF8VORkqxpLDdxRrEsrmWgn7T1nXk6k2PQOju2Yw25YMrpqlDY
	yvEb4tZHqAv/RrvC2Xe28K+2FkZXMYsr7wDFs476L3VEhww==
X-Received: by 2002:a17:90a:e70e:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35c2ff07dddmr509853a91.4.1774570472978;
        Thu, 26 Mar 2026 17:14:32 -0700 (PDT)
X-Received: by 2002:a17:90a:e70e:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35c2ff07dddmr509832a91.4.1774570472483;
        Thu, 26 Mar 2026 17:14:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:14:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 00/17] drm/msm: A8xx Support - Batch 2
Date: Fri, 27 Mar 2026 05:43:49 +0530
Message-Id: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7LxWkC/2WOywqDMBBFf0Vm3ZEY3676H8VFEqMGGh+JikX89
 8bYXTcDd+Dcew6w0ihpoQoOMHJTVo2DC/QRgOjZ0ElUjctACc1ITCmyYt+xm1bkbBE9Rd7mbcr
 KhGRMgKMmI1u1+8ZXfWcj59UVL/cTOLMSxai1WqqgMRq11egZvFaQxEgyuNhe2WU0Hy+3RR7+e
 SR/HluEBFtRprxoSkGi/DlaG84re19ToTtQn+f5Bc+qZtbxAAAA
X-Change-ID: 20260322-a8xx-gpu-batch2-bf7f5a9406ac
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3550;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obyboWBP3UrpDRtKN/55V2OMReShR93eEU0GfYkS7mo=;
 b=iwnQ4B1lqyh3HmXj4oNcEkiHP/fmein2NVgXXBA/6iLAdefGorMq2FZH40argtbnXmRD0/MsF
 2eK8NKOxU+JDhSEr66KU+fPKwdrvLj+YOddoxhpmeJvW9Ptba3JBQHY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c5cbe9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kWU0ogdI3319zGDV2rQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Y9_xMcXyHy8LGIZt0Jm0dFjWCHJaxGU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXxHU3GIKK7h4w
 7+9A3tJi9KE+bdd04SiwJbQqrq2ofrLJ0MXCSkFqym4lUCXoMEDno6wmdksveBeB1PTeNozDmmU
 6tPj58cR3XDt8SqmK8Pw4/cylui9ADHW/ZXUtsxDcbeoP2m53JQ713WOX5E9I5tOvSUsmyEVrHC
 wkQoHtlP9/ROP4OyK3Zv1RbKNutnkI/l2P/Qg7faAZ73C7AOsQVAt/7nEei7D6N1OzkoedSWqS8
 BNCZXAYN8LI50u34Yp/18KkFvah59pNbvo7McWqjEHDOh1XM+faasb4h8uNqrnOEx4+8lmVVBGk
 3gbG/FDjsCXBKO7QRYQQOy9Z1ETaUU5YHvmCo55Db4myPtbdrrXz6gRw9i76/Gy8EU94Lpwvhnc
 SlXK0bPFnqy4p+CnS4RARjAnhEk41gPfc8af95i49rV8dBBVJbtN6PRmnoahVmNqt5QhcfiqlK5
 Bnfj62BESZH1GIgOJyA==
X-Proofpoint-ORIG-GUID: Y9_xMcXyHy8LGIZt0Jm0dFjWCHJaxGU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75FB133D63F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series brings a few additional features for A8xx GPUs which were
deferred in the initial series. First few patches are a few general fixes
and improvements. The next few patches adds support for SKU tables,
Preemption, IFPC and a UABI to query AQE support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Split X2-85 SKU detection patch (Rob)
- Split out a7xx_gmu_gx_is_on() (Konrad)
- Avoid secure init on every gmu_resume (Konrad)
- Simplify code in adreno_load_gpu() using guard(mutex) (Konrad)
- Correct the payload size for CP_ME_INIT packet (Konrad)
- Remove unnecessary gmu_wrapper check in a8xx_preempt.c (Konrad)
- Few misc formatting fixes (Konrad/Claude bot)
- Add Fixes tag & reorder patches to move fixes to top (Rob/Dmitry)
- Captured R-b tags
- Link to v1: https://lore.kernel.org/r/20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com

---
Akhil P Oommen (17):
      drm/msm/a6xx: Use barriers while updating HFI Q headers
      drm/msm/a8xx: Fix the ticks used in submit traces
      drm/msm/a6xx: Switch to preemption safe AO counter
      drm/msm/a6xx: Correct OOB usage
      drm/msm/adreno: Implement gx_is_on() for A8x
      drm/msm/a6xx: Fix gpu init from secure world
      drm/msm/a6xx: Add support for Debug HFI Q
      drm/msm/adreno: Coredump on GPU/GMU init failures
      drm/msm/a6xx: Use packed structs for HFI
      drm/msm/a6xx: Update HFI definitions
      drm/msm/a8xx: Add SKU table for A840
      drm/msm/a6xx: Add soft fuse detection support
      drm/msm/a6xx: Add SKU detection support for X2-85
      drm/msm/a8xx: Implement IFPC support for A840
      drm/msm/a8xx: Preemption support for A840
      drm/msm/a6xx: Enable Preemption on X2-85
      drm/msm/adreno: Expose a PARAM to check AQE support

 drivers/gpu/drm/msm/Makefile                      |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c             |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c             |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         | 243 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 141 ++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 169 +++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  33 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h             | 155 +++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  77 +------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.h         |  82 +++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 162 ++++++++++++--
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c         | 259 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c        |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c           |  20 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   5 +-
 drivers/gpu/drm/msm/msm_gpu.c                     |   5 +-
 drivers/gpu/drm/msm/msm_gpu.h                     |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |   6 +-
 include/uapi/drm/msm_drm.h                        |   1 +
 23 files changed, 1137 insertions(+), 273 deletions(-)
---
base-commit: 38d568f154c66430920b01edc9c722ec14aa54d7
change-id: 20260322-a8xx-gpu-batch2-bf7f5a9406ac

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


