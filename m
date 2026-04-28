Return-Path: <linux-arm-msm+bounces-105061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IKOC5T68GlpbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 741EC48A95B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90B89302F5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3280B44CF59;
	Tue, 28 Apr 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9s6jmIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmeZ6UKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7844D023
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397575; cv=none; b=B3KGJm0+tq3H3498x//Y9uBalbpdcsXRRRAX81q+XgbbJ/DZztYV/YNlLHFNqQYQJGyLBxY+CnsfTU9uPGHGq7BRK21xbdYgBRCasAdxSyfjohNnoKBbQafJUZIm4pPbEfNQmJNqXDcB2ol2BC6D65Q90/A82UvBds3VZJM/hJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397575; c=relaxed/simple;
	bh=sWxRZSIVrfi9WvbsEWE1+L1L1nSmizDIwws8MkDeLgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IYhHQ3Z34+9GBrRoUhlcvPqogfyY3HqGCuPTILGXmJQrLoFLVoIEqNse5SpZOFnSsl7hWSGO+OZHE6E8M5xa5a9mVf8obL4tvKqQeV93PoQ7aMtcf5ORWqqQHuGnzfr2iLNfpV2lZzYtcmG80y2/OppiBNSseGuLIhxCDssMOsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9s6jmIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmeZ6UKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFscPf4070835
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qz/+EjbHjFMwiqGr5dMO8y
	hfFwdsGsf/guraABNaMfk=; b=k9s6jmIGIGOQIROF+QREkaPV1JfzXO3tdTj9MX
	HWwNMMbHEAzr7E2GV/paL2BXoo79rZGHPt/HVyalE2TvhNz3GqrETzTK5GQaes7x
	1L17hWYukWV8azHkGSWrhdnOWPUblcZiRgqc43JVkMiPc6xXuTnd6FDcgaHWC5cK
	onKjUVCS7vYMu0GB260C34EC8f/2ACyPpV4N61OXG/dlmZQLZt3/ElWUDuiPK42a
	KjS6vnFEMtoIt+23Aad/esA/3ucaRI9odSKtX9GCJO5OuKjUG6E7Vrwjijiheu6Z
	Gy7X0XkWieig5oKX2S4l76dGO9lCAEgKISo5ik8qm8ldxveg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhrtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:32:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so1633961cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397565; x=1778002365; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qz/+EjbHjFMwiqGr5dMO8yhfFwdsGsf/guraABNaMfk=;
        b=BmeZ6UKDsULMJMw8GiP4uI5VBr0ZxhJwy7PtUTFRq8wa1q3bXCqtaqbLRvXBVyhd58
         42i5GRcsxkSyBtt6I+W1Y9rMG0CkVzYP/lEIgVbHfN22JnigRfhyy10B1Lr98sEiO0kL
         ThGmus1Qv2cXva11QuTxFOQb79qew9OmFiUZMgTrHONPHkYluBKTd4znbmkwzMgR+Dt3
         Y42/dGmJ0H/IId2XfucTWCAqAKpl2mXred1HB2AvbOKb4dHwEoYK9FJv0aE1mBH3YOJr
         nZu05oml8SvDkJmgeWGtojhAVU64aRVTPFVUlb1yd6IJfgO3BfPMsJDnLGuqgRSjJAE2
         HXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397565; x=1778002365;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz/+EjbHjFMwiqGr5dMO8yhfFwdsGsf/guraABNaMfk=;
        b=oWw8ab0mmMgS3EDoKvMgCT0py3ecslIYeCcmvxOdkGzt4HwZgn88Yi0jP8ebsQwRYI
         pW5M6fF9DJsmz3vzLcPPqNVqvZiyL0xiFGInqeE7pceh3hNaqCyb7RbmyyUQVJnJx8Qv
         s+Qed99IrKOwnCA3REJiSwKOpcvXboF7Shm6IxsLRjg0eeDSIplOb97e7/SYgGt4xk6Q
         eM5/87S5X/IKQLW0+jUTWpqMRxIEt98DmqnUGjAbddkYAgYSJIWr8dI6iUw5LcsUzxZ1
         OfVkCy7hZuUFZEo5Upzv3cbpTBLA1TqLwsAiOG5FUxTWFOGnPyQ6WuISTVZbVb26IGAM
         mQ1w==
X-Gm-Message-State: AOJu0Yx1+jHrqSiOWlxjJjptgNo3iy0EhK9x01kEfH8kkneZbl0qkwv3
	eBL3f7b4No5g5pEMNM578eIF9ewqgxlFA24qYb8WpIguz8AYN02CGnhQ9Ia1v8EtvYG0NCzegLD
	BvKe8fx6QYjkmO2cW0/CV/WOnhUu6Rkt7pdrPrT8yp3fcWUHOHSB7JYRZYxoG0Qw3eU4y
X-Gm-Gg: AeBDiev872JXfgXjt0IW8nYfA8YsuVlbNNDhI3OguloaJ3rQmXP+AQsIuMsSLAN31hT
	aKFankCyqeN/C97k5uJiDk/iYRejjMuCOZnlMqrwXF4UtvsfeZw98kDZ6HeQWkYvADtRjhsTlGK
	67g/XZFHC3hPU/mYzDVT+Td6o+m/sCScC3quttuDr5aqx/4cqd7xlMHyBKlMaeyakXVOYFxZX8/
	4jwz04s6y4Y0cH0Y19q7HepOaP//7PJIa+gyOpdfEYlryTA8/2GaQ+zXPxCeE+JQmt0BB7+SGsf
	0EIDq1hNWPu/gpL4sudHh+Jm106/gxAf8f8PFxvz0HQHD6i8IOJaieUZoqC4Y0BkcZPDgcJbG9W
	eU8ijI9qDxoP47Pfxhot5pvKilHRAj0kbXlkHYPsR0jsuVa6E3nWC0xc=
X-Received: by 2002:a05:622a:5d0:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5100d9b1c64mr48785001cf.8.1777397564622;
        Tue, 28 Apr 2026 10:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5d0:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5100d9b1c64mr48784511cf.8.1777397564168;
        Tue, 28 Apr 2026 10:32:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] interconnect: qcom: Some defconfig/defaults cleanups
 and improvements
Date: Tue, 28 Apr 2026 19:32:36 +0200
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTv8GkC/yXMQQ6CQAxA0auQrm3CjECMVzEuSilaIx3tgDEh3
 N1Rl2/x/wpZXCXDsVrB5aVZkxWEXQV8JbsI6lAMsY5d3cQDqs3inMyEZ3xympDvQobkU9cgCQ9
 EQdp96KE8Hi6jvn//0/nvvPS30n6nsG0fyaJ9V4EAAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sWxRZSIVrfi9WvbsEWE1+L1L1nSmizDIwws8MkDeLgM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O82gXCB/guorllzZBTQxlWYO2FxXI3zNxygL
 E+kOv+qPayJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvNgAKCRDBN2bmhouD
 107tD/9ByQwbryQhQjId9ZVIflCv9C6DcPxp35fudhSH3LeaHCjxILhn/03ELeGrdC0L9JvOFzm
 p5z6UErrmjVoO5lPX8GgxDbjIWoCnK5u8M2G0We3nU+p8qHaxpSg1ZtxUUaViYHUOIYzw1iAQCM
 vTtb8HAnmuFe82mhIPLdRqWecetIrvz3z09FOgnkCCailvrGuHP6R7qBhjfa+WXl6bvlK1Z7LDD
 VxeD4YznRixjR+NHlLNKML0myATbS9noohd8RFPR3CQP0fvi/fglFpKCnb/ZLOYwYoP6smD0iRD
 E0/hSQzVFvZjEQVqpwBHkjoCeFgT2l4UwcCgAEexhqZynKf2Wta/I3t9qlr5ij6FpqKv/HDHOh8
 KgCEVA0UFEvsaij/I56tttmurZDfUQR4Q5pTLdm6/p1DfUBUqqZVHUbb7FTifkOLBYO63V8K+7M
 i3kGmvYLbxDf4eOqSOzJfe08mxSgCFegHR7FNPSalfkvO20PWpox7WDN5A/GL7i4OopUvumHUaO
 nA6xLC1wq4+578hnrNj3UzAbRDa3oEGAwNlHL8PphlRyW3DKQeoNnR0+OK6KZO63zKpmlpyocsl
 htoKDVTcb4g+0CZhkUbsgiH4VL/7Y5yDlIU4dfNYdEO1avXOC/PAQAfxhEJxNH6idg8VesaeWqS
 J5PgD31kPmPf5nw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX+mUfRGg5A2Vw
 z24MQdmGjeu5wOaQEn8fScGmsm6SQ6Ig7kgIVZitH48mJn+BYWK7/hLZ860qeaX0FYLpXnt11f8
 M0Sc4EYi5niHe+HR5UQW+vo71SGXzOfKFklP9hV5cHTVtRENz2uGFWJpn5sYTi3MlIGkmIqOVkJ
 OkVKpB0p2P2dqfio5PhG7qKy6i9ZO/p75LTQBRHd177xB3S/FrrfeQjYnpsVKJQjVMwJ4mzpTZj
 Rc4F+sJ4KW43wViTLUi/rp6HqxRWprKJKG+/qNMl2CgUA5+sCPPCGhQkXbdxFMduw8deSklIuKC
 fnXm9sfjXpYza61c5nTux5OuYdon36MLJuFDEcKXfrXAfQL4ZQVOF7jH0k84ZRh1nOmrX6AgE+l
 SHLniD2F4ZMVKCUgaZZ0z4ttJUn9hkjCwVvlzryAkycR+XkDNPMEF5dFsLv3XwOAyvjiNT9+fb6
 7JWg+A45LJ+L5MkYw4w==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0ef3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8w2PXEvidvIgLFpFqg0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: AGYx7XyaXMLKFzzSsfOjpJ91xXxwHz3t
X-Proofpoint-ORIG-GUID: AGYx7XyaXMLKFzzSsfOjpJ91xXxwHz3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280169
X-Rspamd-Queue-Id: 741EC48A95B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105061-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      interconnect: qcom: Fix indentation
      interconnect: qcom: Restrict drivers per ARM/ARM64
      interconnect: qcom: Make important drivers default

 arch/arm/configs/qcom_defconfig   |   3 --
 arch/arm64/configs/defconfig      |  31 ------------
 drivers/interconnect/qcom/Kconfig | 103 ++++++++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 48 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


