Return-Path: <linux-arm-msm+bounces-94164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHjxM4ITn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:21:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79578199805
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFF9E30DB688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A003D9026;
	Wed, 25 Feb 2026 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqSpPeeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNj4s12C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047D3D7D8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032493; cv=none; b=mRqH0LSG9DcIyaJr5EsnwqDFcxIvt+r3/j/htlkqPoBZ9TzDT39b22RjXBgHEHSSPuO7xHugDRCDvdehEp2tn3H/4SlQGuLBxsrABD1YDQA6mweZJ1TVFHBvb/eTzYNtLzHJ3guYx204Dys6brq6lNP5sqdZdEjbxGCeJEVs6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032493; c=relaxed/simple;
	bh=3MdzuPnKI8xibEvGBKLSXUll+b2RNRlUuYPWmseI2V0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ktgKpRWBylal7unrV7fHOkL3P6fVzzD5YJ5Sh/wGj7PDmovhTFoSb+78XuI5nz7OtWncvxqaLDWOB0VbHFUAqi3b6Ku00onuHLXErLBbAHxLLj6uULhB46WQiDee09oHBmLBsjtWRh4EAnzAyK06QHiDGYpaCuZ17BuU0iNRsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqSpPeeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNj4s12C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCdg806771
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTC
	QHWzO2mU=; b=kqSpPeeh4WIzet2wpVDUjWpjNpM0xjah4bTbYPKEawPTS++dJ2S
	pomP/Pc7kSxhnmxoY2O+/sXbFaG/YiX05wqENs62+lgpQ2cDyU8MfTuWPVXJRiRK
	Gla7eBFIGHgr7ftwccGxeklHmJWyC3mDt2d8LsWMd7EOkkWLrUE7rJS4LHI5iHj7
	Pu4hnUbLi00a4sevjxS8SaKuEnusz99dqCmRBiko9t9ajs6wvLt11jAiIJlkmUbr
	qtfrAf6wQcFeCkKOiY+JP9mhZukkEc79Thlu/ItugMzjXntnwViLfznZk+k0w6lX
	j/0x4CvrC279v7XWkJrovyqfzMHl7LLhk5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5pa219-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:14:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so3751478385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772032490; x=1772637290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTCQHWzO2mU=;
        b=eNj4s12COLp30CTnogpuZZxPZNluMYHaYK5u4M2m6wX46Ilcn5TVICgUxAolX9QlWw
         vd6JfXCa4+NQzvaVomhYApuiCBY+EenH4ShXx176h+LTglglJaDmt0IH7ZEb0vUrUCEt
         JYMIKnjIYOEaG5DBxGtWONsl8ik875Qmyrt9jgMsGQzf/YwanQGNLqm/VYbYfxxQJ8Wv
         G/xEM931/pcoW+nbnNU+8owYbeO23ETT7x7pSOvaM2GoToNd/rw0xfnHiYyepMuYzdbH
         FZACupc3soDKWBLjAGrQQHUMglqSPptmVSueP89E7bSAycLP6iV3+x8ZLUXhOnikP1UP
         HCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032490; x=1772637290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTCQHWzO2mU=;
        b=RxCQjMKG1L/qKk1nBOTGOv5VjLyf3YpDWNLrapsL8VAVXfi6x8zfwlFJVttxfwRSlq
         dev4tCY0cL9syx2bJQp9yYXWbJ/AExoqCiuOPtzjp8aeOUjYkPK9b75EecjMlA3DXipm
         1XsEujc+yD1nLwZOEuruRf86M/M61kIcEEpEweqF/J2Bm1EajdTj2hxEBhgytxFt1D1h
         7feiynIhBdOycTOusuPjmAPKsk4PLiUgsU+Mbu6Qzp1j+/kWBZ/TZKo6PaYieRM0mUOz
         7akx0jHHXo7z92Y34Hvw/eegN77Lr6HPOVWYwyjDztq5cDeCnGpvp07FhSlfuiXLOOHw
         k72A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2PtD6hFLJheLytWvGz9BrHDo13y02WINQNhLsU6Yap/2xfrZgy6vVd3zB67gTSTTnAM9DZg+vAINAiVN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sRzbsVwVXFRCh0etMOX1K31XIB7YtF5C7e72YbL0MwkU0FoW
	p8sL3+d/bujdC0HYMSToumDngrQP+BjznT8lb8nZDTCptOHbKeQEPiCT/qQ8V5XcfbmsqF/h8YG
	XwDk7t9bTU7Qq88KAZTQxvgY6MOK42uuazbRwRwK+SCU1oDr3cRctXrV5So1treWUM+NR
X-Gm-Gg: ATEYQzw9D2x72D0RvfFMq/Dh4VXStO9ltlNv23wDcPUQodvL38G1tAZpEac3BY+fvNc
	xGURw0w3qLi7OUspQCiw73W11/dUOnZp+nUqs6DCMXoAknVN0sTmHeZeKmk9UJV0Ea2kL/+NfnY
	MtKvnOmg6v2WqMVz/NUesyC9guz9lmHNTrHvI6RWwJB01AEh5UqwPkbAOdaweJQm8yC4JZpTQec
	FdBT2E0OkpR3oscAuX6QnG2VB8RJnp7YGvbSNaKREf3OVzpchFrm7q95Vc8+3FNiU8sGKe0blPt
	3N6auV0zW6GCIb1878+nePhS3FFcvXezv1YuL3poDOEESKLAZNFK6W2TucqbBNS0aDq3H/bAgbu
	JEUk9qZ8dUdUkEHebI79IEJzKBk7YqGvj0SnVoRgRmiQmYfckI/hKBbtsZYEAn2oO4DRXsWnn6T
	IHsqhwMl78DBw=
X-Received: by 2002:a05:620a:4591:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbbd00f4admr101591585a.41.1772032490141;
        Wed, 25 Feb 2026 07:14:50 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbbd00f4admr101584485a.41.1772032489503;
        Wed, 25 Feb 2026 07:14:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08e2sm4553982a12.2.2026.02.25.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:14:49 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: add myself as a CAMSS patch reviewer
Date: Wed, 25 Feb 2026 16:14:46 +0100
Message-Id: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NiBTYWx0ZWRfX/rd/N/oxjsye
 AzQEM+xfNT+s2Hv/C9OS4Z+xDJePUfMcbTnDjRVb1aAQRpMECHortFwhsZ0OyFtGyukLYqi5EiC
 FqN6p2A+WrtatyP1VQg90SOb/T1w/fHVeoTyzr2xtzfYiVuYbFaaIgYWDkEN1vS9o4vCMq1TnP5
 hchBwhkSMJLypRosnMoEXwiG/FoH5QmoC7cLDCVTkaDdTg8Q/eAI1jliBbcSnbGQtwDRIN/RYB0
 TYlGpVmTQlXVXBqL4XPSs7XGmIgI921iduLUnuailWVaN36MxciPzBCAF75vP3ZjMXBE9oblENg
 8SD4NKjS8vqhD7NSUDHgK52sHi8Xkf9lEySl6ehnVWVwi8rutKy/BDp5aR5q0XgDK1CL2avf+gB
 2tDbL3kZCyTSWDNFIbI5Gio3bKeI4wpE6uYa6EzC1JlLMzhZaJl0EjZfs57kZSg51ULumIS1qmV
 wiiABU51wVZcPEcQ5WQ==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f11ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=_yruD161ZOVzySigRPAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BPYpCqIMFl45ewiZlYtIcmZ7KhmjVN4N
X-Proofpoint-ORIG-GUID: BPYpCqIMFl45ewiZlYtIcmZ7KhmjVN4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,cisco.com];
	TAGGED_FROM(0.00)[bounces-94164-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79578199805
X-Rspamd-Action: no action

Add myself as a reviewer of Qualcomm CAMSS subsystem patches
and delete inactive maintainers (Todor & Robert).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..b7a79a8fd730 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21390,10 +21390,9 @@ F:	drivers/bluetooth/btqcomsmd.c
 F:	drivers/bluetooth/hci_qca.c
 
 QUALCOMM CAMERA SUBSYSTEM DRIVER
-M:	Robert Foss <rfoss@kernel.org>
-M:	Todor Tomov <todor.too@gmail.com>
 M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-- 
2.34.1


