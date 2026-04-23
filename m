Return-Path: <linux-arm-msm+bounces-104372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cObxG1NZ6mmgyQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 307204559F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D661430B07AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3383AC0C5;
	Thu, 23 Apr 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0+U7g1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaZI/n7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C93AA4E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965774; cv=none; b=amkB6XRJGUq3fxiV8YCo+2XlIYnfzjW++bRee6qYxSA4Qw4CTxIWXpn9ZM6pnqfrbk7nZ6gb4jdWathlvuPyz7rsx3YpDF9Jt8imonfNuqrvnRfSZSZSKNGI85V4zt5HsX6FcnaA1X5DbDYarW7ftgpuhkjFjW8fKk8oqrGebMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965774; c=relaxed/simple;
	bh=C9YhEHRpWNsd+pGliRQKbP4Jj+f9q2ex+MgRiiQYy1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z6PBu1FGUWdWpoJ/8JOHAN1kFoNfMV4hyOv6l+IhZrJNQClb04dSeAeNfB7pMXnkRWKIZ9haKMQgo3v+pWWrPA+ICY2EfvVotbVNHQvVTK1EJzIWkGU6PXjwXoP7odcczWZSVF0BCoMJr9SRR/H3/i1EFqkgzxmrF4VPDYFo/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0+U7g1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaZI/n7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFergP1888659
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eu7l7VxgpEnPFkcoT5OAEbU2fMjUYSr1dSr
	YnvTxZ1E=; b=X0+U7g1xeOUFc0lM3fDhSzHLz1VF3wopvDl3cqFiHDLH3nDuUcT
	DeCDBHkvGQ4D73YRbXSkjPihxJaC1PkQr0k5Pfb9n+Cr6sjw4jQ0w/P7wEzwfmRa
	G+cAZXtey4gds2g2wUjQglqFysU/KIruP3D9f7UIB6VlYCb07q6x5bwmhfAc9+TR
	V6UeZ3C1dNKyKynu9XoACK2SQ0vuycUwaNdGcRU48mX+VIHUMjO3h7CcDRWJPla8
	cy8/jWaF/A8dZvI7ityrnASvt1FpvAMPTraHZwE+rHOYAZoUzF1YNNEJKl2j+DGJ
	5zbzoKJY4BJlnMremMoIjN57HLFaRoZoDJA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9drfap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso3049355137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965771; x=1777570571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eu7l7VxgpEnPFkcoT5OAEbU2fMjUYSr1dSrYnvTxZ1E=;
        b=CaZI/n7NChPxZFSLMYiQiLTM7kaManVYCN2a2hBdfYJto98W0eVOCisz8Vc67g4OUK
         FHwp1v+HltwVYrOOrLJmyUVeZnhXomrFQtR9I8kv8UtaQgZ9QEbRQ8b6belvErAAwTgs
         He+GzksDdRklCZpbZ5OBlthiFJ6fd4pMPh/Qbmgn0Qgr+r2lpiD9LK3goTnsn/YwpaE6
         pzDxWb6mcb03pUqf8xh1qEmTlgzG2QNdmP5FcBEm3QwTC/MewaWwGh3P4RjCvQXDpFUd
         vYkpUmepkN1WOAejVIQ5+dZrFlhlK8xY/RkCYQmRGF/DJqrZEyUyetqd1survIYakJTs
         nNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965771; x=1777570571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu7l7VxgpEnPFkcoT5OAEbU2fMjUYSr1dSrYnvTxZ1E=;
        b=cnGF2NnBUfrucoRNcz3vYWcQGXor/Lh3d93r+RkUtR0L4npKDFCYVAUTOC7EyKZOyA
         DAHXAAa6YjPvMhs612UVrH1N/yC46Dz9vTAaVsBcb7NvODgO0YPcg+LQh1FsDMBcq5xy
         Mm+g1OQAfA1E1nKLO8ZMvrVjX3PWiki4FAjrhbm+P8/GfSaJ3MxU3CplyIGAIwJVz1JP
         WjH1sezVInNG5dDGAaZHowDuVfxcGw3CWL258Sz+GaZAVSq3Aqpuu2u2VHMxBz/Nte84
         KQoUd2hCHdYVeAvVQDTKdhaTos1fiE/FRqJ6mPlJqVx77FhInMiA+/5rYoBJvUBKLO62
         Yhpw==
X-Forwarded-Encrypted: i=1; AFNElJ9TxP5vbHEqfs6CsBDRgmnLMw3NBCOaTratjSEFrRVYunFbPE4ldxePIzR3EdHen4F6f2Q/n29DJs7x/z1T@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+85mGxvhgE+Xt8DzSx/Fzdx0w4IVbA3UIbqYYtypdEBa+aIp
	H3nI2P1Lv1ziguX5Ia4nuZPNkyknEJ8GdFsazD+HvFDBcHHEg4pVnJJu50vkkW+DELqRyfxKAnK
	yPUqDVNOosJfnvHpB2Ovr+5rSuKxgOpbRaoNT00j5Z/ptTmnm2C4fHHQ/uDCQaA4viaL12g6opn
	2A
X-Gm-Gg: AeBDietwU7bWiD1BALHXRsr+vmbihiYzzWN+rnw44wK/dMx49UuFiKDyo7OfqhSxTQd
	u2ZcrUMDc7RRYlNiiEla9yot4SQBAQ5wxOo08ODR8bCd+ZNcniu4NELrFAHYtR4/D6YIMa7V7Se
	ZiTnPFDwlNM6f2Bq9cltyZc7oaoQx9XJq3TGbjTWj8LBJx2Z9KP7AC+S4bESLSt3fCjFxLcSNAQ
	AyW/xySqlmy6bBKDl3RrCdJ37qrFOSc8uRKyoZYKsRenEyO/02tjGTP2PX9Biwiyj2/M1IhG/Gz
	bzvKFQLMMijeM2DUAEcAx5dTsE5XQynbkanX7p9lacKmNKralEDXDES8R4RrJYMgaqNWGn16Joy
	YUjiAuxRJiQJYF/N50D87b3fEX3OvGX7mmUMfJ5b0KLbOQR0=
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr11549898137.21.1776965770994;
        Thu, 23 Apr 2026 10:36:10 -0700 (PDT)
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr11549878137.21.1776965770506;
        Thu, 23 Apr 2026 10:36:10 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm54297104f8f.13.2026.04.23.10.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:36:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] cpufreq: qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:36:08 +0200
Message-ID: <20260423173607.92564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C9YhEHRpWNsd+pGliRQKbP4Jj+f9q2ex+MgRiiQYy1w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6liHGahYfMMaWMwqoAmSNlsy4onY+v1QSZmsI
 xav1s0jyX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYhwAKCRDBN2bmhouD
 1xa6EACBqLP7wqtJRWRRJf4kI8hLAL78pNuzAlsuyMr0tAAvGSLrBYgIM017ifZ21GKpicsAXec
 KSLMeAPOfQTRXjcuJHoiCMNWBgna2InbX9T8+JfEwQr6qKtlB7dbAkd1QgazAgpo9ZCLs/5HqmH
 QImMDeyJF71JHFrhY/knVFwBD0VbJuJGd052gD4d3RXN4B7xt0K9ziUMZ+gIfuPVOBCJ34YeKr/
 LqPKBqP8HnXg1h0ah1q1WEAYQG1TWZrp3PbQGJ8szgIIUCBras3GOw6Q0arU95XdSl548P7nuL4
 ebSvVy2zfWftZdWibaX/+E3Naa/uSGHGS5pVyGxz6B2tn5lo5teXZS3RS8CKXQQ6AZWmWNlxk9Z
 jMI0ABbGKxf7BAzYGWylk2k//iuxroTivzbIO7sbazugzD/3wA/2crhKwUBbl2f2du97jKpd9yo
 Vwf0Cqcez8L8DhxiqjUu2OM6Ay50DXDX/mstGNk+kvKs5R1lA2HbGZt3d8R8DEZkbb2/t0tG25n
 YiIX+1ivYDjrKTrWXgm8orv7CyU08lyPePgFTxQQL2Ko/EKhVe56levtMuV6LKouW5Uy9Er8A6v
 EVYlCXaPr+Pw6HODCRUWnap4D/UGsmXXe9HL5PwSQDFm1JeEiTUQYAv2hpP9Qvd1lhd5VyTFjFo xObkia5e4XATY/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xEGjIIjHRBBaMG5Ai-oqnR6gnwoll3Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfX+u9b1w8Tqvl0
 /dosZzmmehexpo3ImdUDIIuXKCI1moeXIpMA62I7brSHfzUzBtgwZlWTNQ6NdF8UnsPDgi+YNDW
 1/SOHfOl7skijdn+7FH27f0uF/85jPtVdMiTGarq8zXMk+evqS3wjSz1HEX6V10VdasW2inMnp3
 qOZR+9TowA/6WaF6sgA82HuCZP1qTycoUnkSAs0gcfMzGTXDOfj84k2yUyuq+lzLKeFcscz6zej
 CaLG7QAGgqcUWzn2ryW3DT/hb5Ux3elyACWiLTUs8Gw5d9EvNbLV25z03TsXCkvfai5y8v/+Per
 QLj1PxWiJ3Ndetcvq7hClVs231Eegv4ImNhsLnHf+uV5vMA7JGyGgCBfuPDWdKAKVEFYv07WvYW
 POs6HPTdskIPQZgvJj6prRxt7drLeqA6w0s4d/EjTKHn+OFJsmKEUuoPpozcB3r/nPdSVlB0Fl8
 yrfTHdfZhJjUDglHr3A==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69ea588b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fRH1FL4upxs0yR-D3sQA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: xEGjIIjHRBBaMG5Ai-oqnR6gnwoll3Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230171
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 307204559F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options.  Switch to unified "Qualcomm" so it will be easier for users to
identify the options when for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/cpufreq/Kconfig.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 47c9b031f1b3..a441668f9e0c 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -153,7 +153,7 @@ config ARM_QCOM_CPUFREQ_NVMEM
 	  If in doubt, say N.
 
 config ARM_QCOM_CPUFREQ_HW
-	tristate "QCOM CPUFreq HW driver"
+	tristate "Qualcomm CPUFreq HW driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on COMMON_CLK
 	help
-- 
2.51.0


