Return-Path: <linux-arm-msm+bounces-96596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJFcLMb2r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:47:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D104249A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 564BA31122E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A1F372B5B;
	Tue, 10 Mar 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swx2o5BS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3si3jqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11CD372B21
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139496; cv=none; b=fTl5MYI1QKlbdaDaG1ld4G15Dg3J2UpnDj9MLWJn2KXMCtIzLzPY1cdzNam7vYxzCAgtJ/oaYzdNuDi5ZzkXlMBsXwDEMkAlZNPvjaQA3O0MRhcOK5klR8wkc8ARjWIIAh6D4NDwVlWtP+Ah3vjfDqWAamz2iQbn3eGVPzJ/PgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139496; c=relaxed/simple;
	bh=VYqZFYY1+cE3kNpEyMABsGXCNNIr/F4JFJuKQ4WCFOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IK2xmxb9wAm6mNy8nGPM3IJ3oReELdt3molmAGlmBuDg5MN/Hdq6ayvb1jKS8MyQbAobfiRTlrWdIrre5SfYNnBu09kFU5X+Dz/1njfKfKgz+HBA3589PS/gmgjKGz26TfJF1Ul3Rtqojy6pBDvDJ/PYvAdP307MItksyfVunkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swx2o5BS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3si3jqU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lJlO568763
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+OlrFIqiEpL5qAomcbolrp
	dzGN+78ymBS+haaySPmI4=; b=Swx2o5BSDQ1qCJrg5GQ1QQLVLg5GRxnWm0kBy5
	KHeG/a5RnJnDUpgHsm432Nx66Py/8anHn+xyvsMvGZ2cyAC+V9QVaqb0g6cDu1c7
	AJjjycCCSjy1tf49i91dci5fyFZw9Z1AQlsFwKxMunjowpNKw17h/2de7xQH+vyj
	76UKTi7fWvoBEJEU2vhz6WXenV6Fmwiin9daGjRU5W6g4dj7gn/hi1AKue3CM4JL
	EkeLs7Xv1VUDfsq9cJenYDdO8HsefHuIclvJNMOH8eIrFU1C30dvgZx065OnyAWk
	RCQJ/cBicShN+rU5PAE04NkF7IjgZNnZqsQKYTrahBI3TDuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h3qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:44:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so1263062885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139492; x=1773744292; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OlrFIqiEpL5qAomcbolrpdzGN+78ymBS+haaySPmI4=;
        b=i3si3jqUwBTrj1nJMP67q061a1soxtjN/b3DaNA90nk0AVbAgHUaxNZFnfMnZBa0TE
         d+DZpixnSH8SL8aoPb0E+9rUozGeM1k6QXxekxpfTOjwq1UbxxrC7wPZrOn1sCp5Z243
         ZWvtrQKdw15u0D1jDzm2wknUwmYp06V1sltzgV9Efcw+KRqebXtjs2faK4RJ8gP5cQVu
         JiJa0w/mmtgRVbczTxRTnxrNnIcSqCWn1QSI9vQ6E1D87vIQpRNDH6IRTWdLjmG+FN1G
         by9cgNh5GJPURasgRjwqYKMOKRz11fp40IvmtCaNCVx02SKA6L7YErRkK8c3QGsvMBiJ
         PdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139492; x=1773744292;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OlrFIqiEpL5qAomcbolrpdzGN+78ymBS+haaySPmI4=;
        b=t+nh6rfYG8jwioWo/WG6k1nnm9z0NpR9L6zeOBFUVyYTiFCnNIqAiDcSEdQFUFD1z9
         H3oPT1stSxdYUYTMZerrF/8+VITaKXmOQxv/bbDbON0Ohw/xsRJPW5vqmmY2V/FSSSNj
         AL3gO3/Un16Jk6IvN1l6cW6Dw98Q4BAY3rH+22LcJavhJxbRCIVO9xhVxAiBNSnHFWpH
         +SS05oMY5vINVu4Jmc45vQYW4ayKPvxAwtGaUROILpgyh8NtJozdxlav/RXiUXuIfM5M
         Z93nuqRrBD2m/CtSGaXnfUGYgFeDO2LQtnxApdeOzdHb82DycdewCjemCppBZS9JL0Su
         PkjA==
X-Gm-Message-State: AOJu0Yys1J9J16xweaaDCwHt43TVpTGfU/FuKOdMoKo6ZJlMfGY0njZ3
	4uRuxWHRL0QV4Y+YMtKGnM5IFGEN9/zrlynqskYHXjuiP8Lr72cIe78HMosPeaIMoh6asDttfMb
	5dqNtKpAm1jsFYg7HSU7Bt1L0P/1Niz7waLzjopXxtKIQmtYAFX34ETW9t7JCMV7L4xsEIPsawZ
	jX
X-Gm-Gg: ATEYQzzIMC2V5E9e5dIYdGqz6N+nq0PLCGyVI55cfAfWv7Rug+OIIU3kZ27aTwc7HAa
	W+KL4WhmpNxK/sESPNjNKaBlUSh7Gy00L17UAeXkUGm6Wh+JuLeyjgnvOv5RYTxt66lquabdxQr
	9Fj+Ab4yLPdT0NuJYP3ovJ3Z06qjpEBIsDUlCPxM9q+2dWbbSqSs8JOsO/aiYpQoDDhYDpVvm43
	0sm9RVUH3Mlu0ZN2ajLzj4qwExOA0cFOT95FHFVmM5haiFO+YYQcOynldFBv4ZjUlGGFnFktXSR
	p6qaJSsP0BaF8yGsZoPsLiV5o73n7sglJJKdmMBgPIx3HfoRdUzYaS/idF+WIRl+MR40xtMrmyn
	BjUqoXpfWajXkS4NPdFZRkmRHqeyE5A==
X-Received: by 2002:a05:620a:700a:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cd6d4fae62mr1741635985a.52.1773139492426;
        Tue, 10 Mar 2026 03:44:52 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cd6d4fae62mr1741633085a.52.1773139491899;
        Tue, 10 Mar 2026 03:44:51 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852aac79b3sm126515265e9.19.2026.03.10.03.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:44:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:44:42 +0200
Subject: [PATCH v2] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-eliza-bindings-ufs-v2-1-1fe14fc9009c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABn2r2kC/22NQQ6CMBREr0K6toR+BFJX3sOwKKWFb7DVfiAq4
 e4WjDs3k7xkZt7CyAQ0xE7JwoKZkdC7CHBImO6V6wzHNjKDDMoMQHAz4FvxBl2LriM+WeKgFJT
 SSl2BZXF4D8bicz+91F+mqbkaPW5PW6NHGn147dZZbL2fIP8nmAUXXB+zQhayzPPKnj1R+pjUo
 P3tlsZg9bquHzbrhJjNAAAA
X-Change-ID: 20260221-eliza-bindings-ufs-2aa269f9c72f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VYqZFYY1+cE3kNpEyMABsGXCNNIr/F4JFJuKQ4WCFOg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpr/YblxyMdrh8pMJXdQyBLLqd/6N8LzUhzNOxV
 /iFoOC/l+6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa/2GwAKCRAbX0TJAJUV
 Vv5sEACdSCn5fOXVHlKN/nGOtWGK5OCSBVM0EjPteUNC/faOR8JT0JlE3SQkXRox4ZiH9hzkZTs
 4ly33Kr22EdsMsnls+JVqMxFp+RFbQa89XxO08SIjBG/3uEYiiuoJr+YwqlVy9fgEQ53kP43gg4
 SIvj+4wn1lWCtgTwauRCLKC82c4Kj0A7+jJrt8xSgojkfPsAFRMrOnomHwTQJnAOmIgIgzeWOEF
 b3FLVilcO+HdUkgTz3A4H85OdU5KsMix3ar8GI5KKq6hpjWhhD9jZmGJ5uCo6H0VBIIukms322C
 GLz6jNY7mI/XOnATmi749z88sNP+MBaMCXKL3u3hi40xB+N4P/Hjfw/6T/1lSOXlR0rzE7FqEyA
 6ePKFjygnaBa1/G6aMfx8+lf4pipDJxKRcLMPICxLFoZbAQFfg3MBRjhToS6MiLuhT5oXD1bE6R
 dtDVCc5DnPzl+SHdEXQGX/s+rJsjEKHfTlXonXYj4g3X6RCO5cZvp4tPFuGsqA3lHNI+F7TQClB
 /8G9766M0TubVEIlmgn/TzRXi5PR67PWASm55/eIN2VapA3ineGUFUtCHr/Gr9Vx9lklScOTti1
 M00UgMESEYDHMukC1w648R6RzpFalTvzeBbFojPo9N8dV4IHx6Fdgm72QoXEAOsdUStpeK+AORQ
 l1zPE6DMosleCIA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MiBTYWx0ZWRfX22/z3saOSqG1
 8raVF2tjZt2VKvS3Z0/gVtwxfsjbWGs8g9I8mIjhg8/AhqaPX1eRE4ZCSlnaFhmKYZCHiU4IaJb
 glDx/svLEOQLc31ArHzMuDCCHyxpZXIQUP/3zoCPih6/g7rTbDAhf2SAyhYT27ghGarYdUWLVIB
 tDajvFTYye0EB/MlPxQxXYPgoYUV7DNer63LW7RJ7758xF/rqerINwFMOzJuqMlVs2EbtnNg7Uz
 lVoxHKYynjyVAuhXWc7XIURnm+raEsbP/MMWvo9TjKeZtL/7pKvJrDePbW+m/z7VXrbo6vNYhrz
 Hn+xqSg50plZJO9WLRoTSAoyb/DVoHEPZneRdbGTGfQSmadN12zOE5IndSCiwhCVLxvKHIsxxYA
 /xHRu0FdMrld2/frpMGOo6z3VcMNukASrPLu7WA73p6X58+BaFKysT+xLcMRp12X5qb7lr9CzSa
 Qf6EsFEgEk2cujpnttA==
X-Proofpoint-ORIG-GUID: 7uptyJ5zT1103mLSnVpJkLjK5dMDLkaN
X-Proofpoint-GUID: 7uptyJ5zT1103mLSnVpJkLjK5dMDLkaN
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69aff625 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Xt2ahHBdTslk2qdXQsYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100092
X-Rspamd-Queue-Id: 5D104249A04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96596-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the UFS Controller on the Eliza Platform.

The IP block version here is 6.0.0, exactly the same as on SM8650.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260309.
- Mentioned the IP revision, as Manivannan requested.
- Link to v1: https://patch.msgid.link/20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index cea84ab2204f..80550144f932 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -25,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc

---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260221-eliza-bindings-ufs-2aa269f9c72f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


