Return-Path: <linux-arm-msm+bounces-104582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vNz6Azm57mnHxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:17:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7546BDA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8287830097EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F41C2264C0;
	Mon, 27 Apr 2026 01:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3giS1M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hab5wiLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621A1A08AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252660; cv=none; b=LC+aylh9t2iaZu4GMtvXAjyZ8l4QnpfoZENsVnADtDhtZecio4gyIkx3+4ABLxe6jqBGS4gGw2FkyBIszZCECv+hUaS5tIGIlzpYZo53lPUlIlHCkeTYJ+j7zTTySIPrrH4VmqO0O/e01aa1hQ9p4KgKAlyd0IdWWGVZJXD7/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252660; c=relaxed/simple;
	bh=zJdUasQw5n6MSUZveDYI4QDlwGVoR/JI7lWHSlofxIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgTyTZ6fopZW9xA2RGU/gljdhdsOfztWukJUfr+XJMcGZQBVEtX3ZJrUUTAeSBDnxDT23i/zeBJMRmQ8pS7qk5jYohvVNZCjePGCOD+q6Oyf7BaxCVCdHj7IqcM/dDpqIvWKrByTnWhQoHoHDia3csm1N/wIEP7ZSZVnj4DEsm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3giS1M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hab5wiLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q5ogav3809755
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCL
	kBKyeC7o=; b=n3giS1M67ekglqMHaOfYmzXvfeBY+xmxeKVrpB1SGGq0M1s+XJw
	wHhohA1tp1gxEupyY/2FRSv0kpcv9PCxLjfol1dWpxXgH5vTPrckMD2enTLtQS4i
	yaayGE/R5Sp5s7ZP+VT/C8iPOkWK5z5jyIZVT4ICiyYoERRmBLRa2I2B4Hhgp3k6
	TuVuhi14x2FLRnKoX4lzoHU2Dl3akUnmg8b052aCc3NDewLyjRE7Ai+hP8nO9QP4
	Rt4DmzJxvl8rq1Tsx/NDiANTucd4VHKZKdl0J1wlHsR+fL1h8n/bMwiE5vkC/PvT
	c4r+F6JHMGzY2rMNQsMcKPzgc/y/Dn3wTTA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3v6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:17:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1270dcd11c1so6428100c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252657; x=1777857457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCLkBKyeC7o=;
        b=Hab5wiLpHD8R2QkR5XeY0eXhIeQKpdJnKj52xgw9KW811u3wVdspP6qZEeBxhAIF6J
         Jro1fLXWcAZxQH2si9zis4ZFz7Y0pPFY2pYajbHnv0M+O9W3PD5x2277Lr19GzrY5jqU
         HqA6L8eTPc21CvhBw0fXz5Fw0O8iocPBD/UXMnoFhRzATg2QGbvnam5m/TiWFGGw+ZZP
         VZ75URZFpk4laRuNq2pwD+SEh7Wr4+ZMvCVYjyy2Zc2sp5c6vkgkaMifvw06BwIQ0pnq
         cZ+Z/gc99/rx/Yb+QA31K/FdJkbiAzr0x9at9qam0mK0paIJugIteP2+AXLFzpFTLmxQ
         k72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252657; x=1777857457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElxAM/fPS/X7Sb5MFzLSQ7x2z75vRG6KYCLkBKyeC7o=;
        b=R1o9R+P7FtSEKHJrYqF8reOvBe0l87tlphAaFMjDwU+Q7jrQmAI/AC992PyLqp2uYJ
         SaUn7PQKSrtW3Wzb/RjkI/2vLkgfF76YYiWoWKxZoXOz5eNNFWNgtqO7NhVCMFx+xd6v
         rkPk3AG86uTbTU6XCUEzEDfXPKPdpT9I+cAajrgrBf7siUhJ9ytbUfXWpPBih8+Tkx8H
         ZK8jb8pHajZVoNNIdMiAB2Nnbza7Ujo0Gdj0Vn33MxvlrKRYHjSHh7oE6NfunF/dRXeN
         YRsxsEB3sEWxYpeBHOCJHOGcwcR83qujU+3kRScnPVjDawuYEkqjPt+YBaoXA2EoLVUK
         jh7g==
X-Forwarded-Encrypted: i=1; AFNElJ87qxbcBEFA7m/6AqhFj+17EWmm5yOVWya1Zo2JhSoZ9vFE05g9xCdP18OArhIAIZHV7lY7Pm9uP77BNUJI@vger.kernel.org
X-Gm-Message-State: AOJu0YzXeTHrhn5MWpehkYxYg+reAomcZ0X8/SCJw9u/KVAhydI5BC4k
	Ah1r6pDQ2sS2AdxN85oSkmhtamNFR0ZVQ6lcn96VvUza4NL+c82mvfTytVFWStlTmu1RfZ65bjF
	Eg7bMrFE2pb8wfDOdSsF2b9yurvtbEfb0aoiFDZ7a63yRvZNspuL8xFDbfOHGUyW32H85
X-Gm-Gg: AeBDiesER7zPbMyWLepYlsDwla1hEFh7jd1cS6sDX7DLrQlV9O82+RXUaKpTAvOb0cN
	8JNjj2Z/60h+gMxRBRC8KTygDMoWWH+D6RSHu4psDhE05TV4La3pc6RyPNzvRgB8yR6TcoN+rLK
	b2qvr3w55HORNqRlSurwjQFbuNUC/eKaGt1ryaSmxZRSQb7UNZXgMnbTOYGe0E362MK0MukLM1f
	YUr1nG4YMucda0gMZjjUNc+pmMQkCWEJxD42b+FagMlEHzD1u+yQIwgRTVxwjA3rM3VnJb4UqQd
	MVLV7Qa0HdB/bvV1n6eDZGDeHFmxmrSooRchuCkfQ67bJSVwgH/eYK/ruZmKPn2umVlBJM17JfZ
	irSLyxYNtjQBcZ1voB7FU7YZWsssVR9w1PsZhZAlKxvN8h+8GBLeHqwollRx/af3Ge3DnH54Hci
	ezzSfNzrgskcAYmMbM
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3465924c88.31.1777252657137;
        Sun, 26 Apr 2026 18:17:37 -0700 (PDT)
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3465917c88.31.1777252656606;
        Sun, 26 Apr 2026 18:17:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm17182104c88.12.2026.04.26.18.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:17:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 09:17:28 +0800
Message-ID: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WboTTMS4l50Cpd9TWFmgUcTh_Twr0iWE
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeb932 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c0LU5v8-wekVdGmAq6UA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: WboTTMS4l50Cpd9TWFmgUcTh_Twr0iWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMSBTYWx0ZWRfX1BCpoVC3+vA0
 5NTb4OUkamfb/yGZp81p2K/twDSgz2fcAHrHvxQkdMf/pKGsjt5MN11AeYJBDhKFMn7KukJXYon
 xrpUQBdoQY+mFn7pKpOBrmc0du/ZlAgbV0SQw+gObfNid+ZmJPBqgtet7b13RhphPxFJZu9mxHg
 RLKln7nOC0rePJVMOtVKmGE1LQLS8MhLsweOznpehuvNYJx6wKb3r/VB3BrG5PNmHVvJIah9pSG
 +jRQAhdIJgYU7y6x7IcaukYzOoBIMW4igNiD6lHUKU01o7ymkt50KLy9IyLEk5Cj0C24AnvXcVB
 sQC57gpxB45h/m8zlUOuOyqtfnKZpNvQ8G4VrFzVyPiCWLq2qpjdE6OtUn2kg6sDro8XTg1IaQK
 g3ZDBqQl9XqbIoht8sBA0hnuXgwZ/298YndxID4mpOaZQl+k7RPXiRKicFd27kcg2o/1lnTQrhw
 orLehHEICb9ra6Sh4jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270011
X-Rspamd-Queue-Id: 33F7546BDA3
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104582-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document APPS SMMU on Qualcomm Nord SoC which is compatible with
'qcom,smmu-500'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0


