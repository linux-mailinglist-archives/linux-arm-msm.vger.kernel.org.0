Return-Path: <linux-arm-msm+bounces-96117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFm5AOtqrmkgEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:38:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922323449E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A477303A120
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18A435DA77;
	Mon,  9 Mar 2026 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkSgjlrX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYVbhpjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA9331077A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038255; cv=none; b=JTKFtZJFYPNA16mkoFgcet/msN+Ri6qoW1Cpy82Tb98LMLckxvpn0rbtzwKrvGIvvqvRDyu1jsd3VxipF0Nb5tfsc418uqLZMGysTo6LTelWo+7hNQSOKtlY3I6m2OI11TbWQJ163as3xyZNwMk6u+Ven/sZtLzc7SOmRDyIH9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038255; c=relaxed/simple;
	bh=BANGpb2pTLYLkExQ0zMnsBgrD8C6VbkTG23KlR+dnak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e/pQzdZIrWEe4Rx8zX3V4+QBqK6FbYlL0C4wJ07bEwIKLjRxWC3PZRhvoGhOLllDq7CnjB4BcbcbEBSoz7Ta01pYELnIdkIGnlDeyeg4loGVjBWGqOYuMV563XQjTKP55XxmHlHeaT6dXu5QddeXLX4+LWkqg8F8yBP8LhXW5hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkSgjlrX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYVbhpjs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N02nO3014716
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/
	A9Y0mA1g=; b=AkSgjlrXNbn+wUffsmmd6f+go94gDEr2bj43OEHe82/5M/iAncp
	8CGuUIrd9M1BXzqpV74ji7lobUKarCC5lnERETIdLmjj1wlGTrMp5yc42JHHMowv
	eNVV5Ts32JjrZeksTNYMAI+ovgc/+bUvhh9NfyLDjx6k2zFFpkG+qhW8NHiLQLjf
	d39rSjprax1PqUj/rRQLDSyoJrc0ZGdDZxDPoq25ceG1OthZTrpfpZYEQGgsggw1
	EQjwLP49NgZchsFWkSTe8/EeeN10LhMSsK/bpWdJoT2ZLu67axqKhI2sKopURnK0
	Nx+ziYI7HSTF10HF4LdahgpDVrzDbXlzN3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxv6em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:37:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so10506167eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773038252; x=1773643052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
        b=MYVbhpjseFB37rQYqEb5gCplXjnNX2mgFx+hWdhfKCzdxfYF/8JzGVxU8R+wtEYysV
         hTljHdq4PXRqjiNbfxicXFfOqa15y9rcbtJ2XHKGv5JWqV8BlVqHoIJiLGIv4jWsV4iv
         TPCMFfw72Ar6DFQSHjTe9+B3936Kbzb3nRKiRyJUOm+ZcFPuPR+SfFRECFUCZnaGjOrd
         N1f8CTvBdCvTznQW+p8fh2/FiFQlnOf1AelTyw19GpoWZE6G4F+EWg3g4OzQELFAcwuU
         I1rbhLnajiU1/uKZuVQsgC4XHseTwh1vE/IRsPFPtWonNNbQYTHATDa+OuPBkahi/3Mk
         kjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038252; x=1773643052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
        b=pibIsWbAu2ZuDmvwHOkkc/OfwSu6VE7/K4T1SQr7nYmCugJ7AE+0kbleBHkWmSWnXb
         AGt5xav46xLeVuEy/X6A1AHLl2bOvtMZaJSMnDGu1ERrPtLn9Z3NS26KX/5RhAkC1aVP
         4BpqtLUcB0TabJR2Ll3nk2pFgwyg7/Ya/O9/dAMyzjsrPNu+vDs+I/P0WQ7v2TeWAjhN
         wk8vSr8B/OJn1zNmvi2R6aLLpbv6N8SIGTd1l1PLjhdoF2WoWrPWzU7KTyt+LvD4ttWd
         f3AQQG/MJicLCMyKU82J3MM4wbi56BCAJ0ST77g7K2EEAlyGfe/a+YbCObzUKyH5vpfN
         WVCg==
X-Gm-Message-State: AOJu0Yzt2I/XTPZv12Mn5563ZNF8Dern/lJl51vfMwozTsogCa0otkih
	y9IeW9s2Ro2Zl+mHhAPngon7f0fM8Vg7CDLRVHMXZgt2GZq4y++6a0fdhwn7yKswIM/vRlUW7F8
	SJTYAJ/oE8Hjz/1hfGl76Y+8LapxxixC6izPD3peIjHMJdkRHKuWyZ2WouFVx6+5DOgeo
X-Gm-Gg: ATEYQzzaHZ9kQi8jciV3hnH1+HFPF0aL2wDvCWCQrvEvpHAzuvUmnCm3eCRg3NyofN1
	Yb2UDL/ISMpi7RoB0j3edrjhESRskzLWTatOYNUunc9gnEmqKDnwtBM9UCQiv5sRfTDMIIf2Nfa
	kZXnfgux3y1NbFpobNJ8sCRT85Vty0rHN/vbHMSazvAzSQ0qv/2ydicdBhgwMLw6eJ4FdEoYov/
	pbO6godtFTRybdHhkGjzLzCpxw83ICUK8FaKHRgICF2bI4ieIXbHqClub87W2jnc/cS5mfHiYxs
	RreQnxtmOTQg0CZKamF4P3iSE8RQmhYkaKW1OYwMJ1zVCxHZk4myy1NnflrXK5WgdJ0sinEHn+K
	gKEp0R71h3/yekveHcOEIZRK6/6Fzve9tB155BE5t9FkpGaSnSj+LRiO++2+IGYYN+Se7J8ob
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id a92af1059eb24-128d55ba213mr1040239c88.31.1773038252133;
        Sun, 08 Mar 2026 23:37:32 -0700 (PDT)
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id a92af1059eb24-128d55ba213mr1040213c88.31.1773038251559;
        Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f5a102sm8488626c88.13.2026.03.08.23.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org,
        krzk@kernel.org, abelvesa@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2] drm/msm/dpu: fix mismatch between power and frequency
Date: Mon,  9 Mar 2026 14:37:20 +0800
Message-Id: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1OSBTYWx0ZWRfX+vvlWjQqUxm5
 1ux4v4A46cgOhUxctf+3zePk5A3gUXWV/nCPQDzddkgYO7H0kMTZzcUEYzB3LVOrt703IKxvrNe
 oEjZS/47DchTo0HhtBuE8wNkX43UwfhhAFXBaiHQusEIWjlFwvv9CCMHxYiksE7XaJQr5yCpiyF
 twk45u0v7zXx3Lcp+cO3G4M6BeRKYIl/91wapOUFG3dMv1QAeF5/qVemiZEaa8gFrMjk4Whydo0
 ZvvkQ0ze0TgpeXPYhPFioAk/ckYufW9RuWNl1nNtwCio2j9AgEz7eGlPAGF22fG1cu9xAweg3Dc
 fxie9YZ9M1hd8P2wilZMV8wrWP9QdUM2jvYslRuKuMsfBV4D7RfMuoeXY6ZHkJjfV9Lo9uAkTcx
 NvGmEd+g3Xz01/MmAR4RfwEwrCqAetfg2fYpbl32mYm3OnWvtqLLG/OTFYyhjmZKshZRU4LCDIA
 u5hO6GmTu44P54cBT+A==
X-Proofpoint-ORIG-GUID: yaARPuwuvLPg2jPrjEmA4mvVT49zUfhJ
X-Proofpoint-GUID: yaARPuwuvLPg2jPrjEmA4mvVT49zUfhJ
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae6aad cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kp0xKC1fNrCP_-QnSFkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090059
X-Rspamd-Queue-Id: 5922323449E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96117-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

For example, in the DPU bind path, the sequence could be:
  cpu0: dev_sync_state -> rpmhpd_sync_state
  cpu1:                                     dpu_kms_hw_init
timeline 0 ------------------------------------------------> t

After rpmhpd_sync_state, the voltage performance is no longer guaranteed
to stay at the highest level. During dpu_kms_hw_init, calling
dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
fall to MIN_SVS while the core clock is still at its maximum frequency.
When the power is re-enabled, only the clock is enabled, leading to a
situation where the MMCX rail is at MIN_SVS but the core clock is at its
highest rate. In this state, the rail cannot sustain the clock rate,
which may cause instability or system crash.

Remove the call to dev_pm_opp_set_rate(dev, 0) from dpu_runtime_suspend
to ensure the correct vote is restored when DPU resumes.

Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 449552513997..327881056dd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1463,8 +1463,6 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
-- 
2.43.0


