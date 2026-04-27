Return-Path: <linux-arm-msm+bounces-104774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG0ZDGuX72mLDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E5476D21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 026473007A5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA8B3DC4DA;
	Mon, 27 Apr 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mckn4aEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIMnKDTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D03DCD89
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309529; cv=none; b=Cz5AOgSFzkTlfPVKaWKPnXqvxrBNGKB6vMsAwUYREPGT3BlVvRemlgOucvLXis7PrywbA1wdV9SCjD88tV7skt46fZFIXCL3+Q/qcstXsUFPfRTxPBMSdlvSVVZ2HHT+PdezV9nJCFDrL1jvJE3PEnTOot1exeQ3yUrQgB9POJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309529; c=relaxed/simple;
	bh=c6ViV4a8nqo+JUb40nOAbhedaH2/OCKupwocr+o/ihM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYJtEdDTby/BtvBA60/1KLLNDZMnl6PujFnhePKry7/2Q749tcCE05NbSSzLa/WfjjFWI/9+M7p115q8kweaPr1z6m60g0VzUBs6egtVRg63pRSV4MexwxDkpISBnJEGmCUWgT8pIlBM5G1QLvFAc6imDpEk37Bkn5hKWUmxqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mckn4aEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIMnKDTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLSn8441000
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TPaDlQ8nd1g
	D1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=; b=Mckn4aElLhp0qH736SY3T2/zrvV
	rWtj+3WptZf65z6Xi+Y/4AIl7lIOTZmoEW06Kjr2CJkU2MLrIC9YWdNlTetwjUmy
	+5rgA4k64wcc6sNU7OGEFJc57K4RJpURwSSQZUxHOICcLyC+HkvbLAfAfng7vWJh
	g80OIDY5gryjiGyJu3+lmeFykdoNLaso5hUOzpMAugJf2NfxIldLJCjofiibhp/l
	VcKW6ZJo4s+CLJ4QjmP/xZUy3y6n2Zj66pXbIWdH1b0XWBubiOjlXCbUbWiBZYkv
	r61aa5h6cEZjGDX4Kcit6EBa76RuyCOhEqUczrvM8XM2LSkRT9vgkDd/bEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac40cdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb22422efso2359350a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309527; x=1777914327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPaDlQ8nd1gD1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=;
        b=LIMnKDTJa/JO9uVINJBW+uL4DLNwZqj7bbrkgf5PbI4aPW79R6GKpqK7nd95dX+0GS
         gIXIK6dWiweBVKQwD6uC/MaH8K2kY93zzf//imIiqL9vdpSf4uFeZlCCJE4ENMfi/Cgc
         nTI8tVnGSoCze+QIzskuq4+MNkBf06uO9ognf3g0dlDuxlXmD9MliBWp4IeiyNI8aU1L
         n2+Xbtjfa98g/8WXsSAa1hdYBjb9WEYQSex5xlJm5H0l/SDHJYa6Cgr3IGXR4lqsqx5K
         ldH05/Z4Y1K7UYVhqgNQ+5rxMryt+bA1sxtXIBr0811M2/jmQ84ubTRe0+vcLA8I8QXv
         4Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309527; x=1777914327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TPaDlQ8nd1gD1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=;
        b=PfDQKtYR8BZ8i2ohIL+YQlyDRCK7P2NzXiuASg6hQkk7sR8wf6zpe3Kp/6PlYInPyl
         4PX9yaqqCOHnYSN2yCDDZyzEXpMRSzWSfI8+8DLGcBhQ62fKG14uD6JCUEIebL9YmeN1
         9NE8uyOB1eaDg2yrjAo52TZJZN/S3GmhEbG9kfYijNMj7twpAZ1Oe5/fQIy9zN+nBoKs
         d5f7HPb38q/1+fc/3xLWGZnQXN+TdBv8Mt8mp8FQUveCHiMbpg1h6hVd/GHlL/hjZ++S
         G505fpeYzqu+i9fJbocRzjijSk0qeiUvO+s5QB/KPdLVb0T31GvxC8EUK7CAFAdLGdgZ
         8AzQ==
X-Gm-Message-State: AOJu0YxrM5v2isvcLZNtc4HTrMRjj1QA9uJUqeeonHUyTV7ytTusI97U
	NZxLWYt2vW/nsj4db9G/lxPMrNW3iMOBnQ+wEWkb3L9XV6eism2icU5duJl+zSiCAiBUulljpm4
	TP5gBpP48CwExG5wdWnMB2W2uGlUBw90TJcFfIQYFnihrittLqhGJKKrzs5wJe2082A3u
X-Gm-Gg: AeBDietAfFahnNtV9itexOj8Qt527UIiA//NvkDQehwqnBkZrl9HFBDOgtYlV+Oiuc7
	8UNHeMvCygKdATVEk8tB7TPy4zZMgAY7cLfjoTUUYtVmvRCiUNOIarpW98zcwuY/HYmpxHPMkFg
	BjFDCfGr5aPJHbOtmSrE8zQDWt8skEDcvHYkUR9YSDnwJn7Od39bM0V2UUiB8/kzXcq+Zz0pj3k
	CuoAZHKqa2tnYjsWEQh3vOFPgaZ0DiXa7XTC2NoYS9HlLTlx5bdOM2/HFB4IgVT1GyqQqU+D0r4
	wgr0Y7lbpTM1FyS6zvoqEGYxBba1Tn3MOC//yiRTr6JK1GFyKAib36MUWBA84li3jJTGnnt/tcR
	qRJu7iFQN1y8P4YrlXL6uis55gTN2EzoAIz6tRi4rMmenWNwLNZK9rGbSb0R9sn4=
X-Received: by 2002:a17:90a:ec87:b0:362:bc7c:55cf with SMTP id 98e67ed59e1d1-362bc7c5d34mr14125568a91.8.1777309526804;
        Mon, 27 Apr 2026 10:05:26 -0700 (PDT)
X-Received: by 2002:a17:90a:ec87:b0:362:bc7c:55cf with SMTP id 98e67ed59e1d1-362bc7c5d34mr14125548a91.8.1777309526399;
        Mon, 27 Apr 2026 10:05:26 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:25 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 4/4] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
Date: Mon, 27 Apr 2026 22:35:05 +0530
Message-Id: <20260427170505.1494703-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9TAfVnk6wPpFT6lGpfbX6nXshQV0EcSn
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69ef9757 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lesJYhStKq8E7S18cIEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9TAfVnk6wPpFT6lGpfbX6nXshQV0EcSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfXy6tgpelgzxRY
 ZXGwhrZRAG3WSoyQ9pztOnYA9x8pT/BfoeDFfSh8zyu/Y+qyVFvj/XdJdvZowt8ewj1VBcDw5xF
 6WmkgHPXO8OdpPu4bkB7GMppNSP1MqnBhykvECt+bC8K9noS6vQnTbKLEkQT1gW0BmRW7Zt5aOT
 SfcIkHmwkIhqiVa8PJ14J1NgzsfJQ8CgGM5qIyEmuhnD7Eq9XUF9tZ4eOG/Su2aUjA/zxHT79AG
 fi3RNKeTVTDg42VE3M8aPRSEj2I9AjERRMomjdEoTHa/OaGRysBB7Q1zS12NsLiznui3nc4jvwS
 klFHgWIh0EOhy3l2OkZxY/ttCwEuh+LSR2uXJlgIvrIWn4F6o5CPg/EpqKUgQq+3ovepARKXbPj
 AMh3IacAByt+QdrnBxJNEeEvte5BM5Pv/XeeYcWndwYaImEAAxzN9Re/ScW1z5h6KazHYuzMsUn
 JR9IuE4oMTLDOEZyoYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181
X-Rspamd-Queue-Id: 3C9E5476D21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104774-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.

Add combined DTB for the same by merging monaco-ac-evk.dtb with
monaco-evk-ifp-mezzanine overlay.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 852d2b86407b..25013a408062 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -66,6 +66,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo

 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
--
2.34.1


