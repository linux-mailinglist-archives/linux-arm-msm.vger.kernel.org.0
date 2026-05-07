Return-Path: <linux-arm-msm+bounces-106503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BxaMGLh/Gk2VAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0534B4EDB05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B48302A064
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 19:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AB9346AC5;
	Thu,  7 May 2026 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/sBTXGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4lkzOY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D7466B5E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180447; cv=none; b=RI3kF72CLY/bqbHbdrvFbKygc6ey38SaP/JXtHXK4twVLs7Wja3YbSzqwEN8LdmjRVypdmN4606F5Zan2yKF8yikWytHoVKe8rAaJdjAx6iLmnrsH5mgajkJoxB4WEL0dRhQPd42ZXJIWND6RzZzbc0XQNIzebCsqkWATiqPErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180447; c=relaxed/simple;
	bh=Iv676f4FHqGF6sow8D9+X8nM6vaaJBBA/c8qDmBAc9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDVwu/1JeYXtGpdxGzBghIW/lLbInr+KNn6fKpbTxWYdkRMWkaMmro59vDAspjCzUaCer51lWZTGt7/47agsJY6kb3ap5Ndrm3wdQ9meABuIONugn/1CV7Z9HVqm8PNXgda7kb9zrfsEVmDuMUa/t82IWZYlQjqKbaePtcz48lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/sBTXGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4lkzOY4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GY8Nc1669566
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 19:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Krz41mp8lZlLx6aqVFvVF
	umX3vO+SmX0XbdTZu8gxA=; b=d/sBTXGzMDMxixmLtHnhi1nFY1X51H0H1uUYpD
	WULd7IfzkTS9cimVkvtJBGL1Z/krtk2WIY0kMj68wNGDg4x9UvKCQiB5mgtaZOvl
	RIqZK8vxlmVM6ZUJ6JNQF/qFtmVDTsfHViO01k3Rg8AgJIWKcbZI7z1yBhaKwOnr
	ba2ZtQCY9TzFM7bKevvn7zjXVM/4VekYy8feuw4lKCQzKgI8WgoDcY/PqfBtXPl8
	enx3251pwZD+mvx2lcjmSVvCi0FPBTwmDwSDVhrLlEUStX+qU9zTdJ/HU31UvVAQ
	9EGOxIF8V6WPLJ5aqyJx6N0OIpwEJF3HwbSE7u/6QrRwURjg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p3hhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 19:00:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83603145987so824387b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778180440; x=1778785240; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Krz41mp8lZlLx6aqVFvVFumX3vO+SmX0XbdTZu8gxA=;
        b=W4lkzOY4322N+E+8+MBbB9n+b6yU41TChcr8sVRpCcX+9tYErJHcbfMrkq3sNHn1Qb
         rhUBByNs/qntJPhoN3OvHyf9a+QRlw6b19xW1Zzh3dyuEbMQpg5jKlCZiYT6gE9FRYCm
         TL7e2/S7BK0ev46fIiq4laLu9hbUiBOMvVyrB6eA9Fp0Aet8ZN08BmHGuKCE4oc7Gp3G
         /HIHRPm6zGlPEzcguAI5sORa/HBKnpwuLLIkQdhH7AFW5s/OseFKmkxhZ5lAiIGWf4x/
         uOZ7QXqRm3hBJheQ8d1zcMTOAx0eu7q3n2osyguhMWeUWjRkfoUiDTLxTWZek12p2rSP
         hVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180440; x=1778785240;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Krz41mp8lZlLx6aqVFvVFumX3vO+SmX0XbdTZu8gxA=;
        b=EkrJePljLZRbeNHD0SjE0+bi0/iew22x6MudbUiTFhbRGu7n9HNPMHmRYDmbsff4+Y
         TiYI8I2A6qgY+LVgdClyq7Jjx5KrzAQlsgY6P7bydkUJcRL3IxoFO3O+tJYauiKXNC/2
         cxUfPMVZCid0jb69ZW9nmop5kWLJoUW18VKNbrZMME0FU0YZjllPuJFvcVJqXLtf3Zeg
         yY9ofPoNsxbK4d3NQ7t4ADNT+0nuVFs1Xdnc1l687CUzlyxKrto3iFNlOFeLa9ITwuRh
         v88VBqV60NxYpv7CmgQHorI33l/c0bsXARvv4buBbXuLu9gkrKJkhwHgN8oGIoHXoe/e
         EUiA==
X-Gm-Message-State: AOJu0YySWa/xjp9XfXl+tN2kt8NZO9Sracp5BrJJjcw1kw5eS+dkIo46
	w4KwJK+ec+gxE+0yxBo15EDe50Lq+2P4KIw7U3ghIEdhknWPyahkRAkYCoBDdxyQMaWXVwuCdAw
	wTXkyUwoa3ymLtWNDAl521YsFthyQIiHmo8VmrLd9okC3FnGlMZoht/o2PXZ+6zZ4FAPM
X-Gm-Gg: AeBDievk0dPiCmSp4Ni8JcAS1ReF4XSxFO+f3kY0MzXZbzR+LeiPZYTz/8IW3bvMYqx
	RIps5xpBs1XquzgAIyHyxyWsOpDDGHl0WjzLqLHxyh+i3F/x81pg4CzHh45SMSbMtIcD3s/v1gB
	3hCqUQiFL9brf/Hypj0vGssijZWrHaILlwB0rmxAz3NTdEHBZ1OhzUimLDz1YjWFT/SyRoeu8bT
	IyHxBfINEllMsFCgyzEsyeG+rBlNk2fGR7NXjSfGRNbw6/LZ3f1fbdbb5KuWDr5y/LToaMNAM3S
	Sb7uhqcQcoo3szGzGoc0Gb5giCve/1khQKXqUKOtI3JhZX94D5VsTz60z4yIusT1++uL5MfFukm
	DAAh7slOzUMgzvqhNS2gbFPHoFIjP4047RsnyEGPQ3CoG3fY=
X-Received: by 2002:a05:6a00:2444:b0:82a:12e9:c75 with SMTP id d2e1a72fcca58-83a5d388892mr8928682b3a.30.1778180440449;
        Thu, 07 May 2026 12:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2444:b0:82a:12e9:c75 with SMTP id d2e1a72fcca58-83a5d388892mr8928622b3a.30.1778180439723;
        Thu, 07 May 2026 12:00:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbdda0sm9914950b3a.44.2026.05.07.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:00:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:30:32 +0530
Subject: [PATCH v2] dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/h/GkC/4WNQQ7CIBREr9L8tTSAFasr72G6QArlRwstXxtNw
 93FXsBMMsmbZGZWIJvQEpyrFZJdkDCGAnJXgfE6DJZhXxgkl4ofuGDk8Z40m92U4shuGHoMAzN
 SSafFSTVcQ+lOyTp8b7vXrrBHesb02W4W8Uv/LS6CFR2t2oumNdK0l0hUzy/9MHEc62LQ5Zy/Z
 9FRiMEAAAA=
X-Change-ID: 20260501-shikra-qfprom-binding-c262fa19640a
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778180435; l=1285;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Iv676f4FHqGF6sow8D9+X8nM6vaaJBBA/c8qDmBAc9g=;
 b=y0hAQLxFzn0yAmgofzFhIQk8TTj3w2sf8LblordPjDEBeEY8N+3zgAWfxW1AlfM2IBmX01e4G
 CdZ7OCqTcDLAp9i9ivkApwOP5iIaPjkEaMqzY5fOHWav6nCb5/kNVL8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MiBTYWx0ZWRfX0J3z8H7KUwG3
 i7zpEolwxyxE9q6RfrQQ9Lw17rDjVpzRi2XWM3x9VKdRkIr9yX8QFfp1fYZ0srReX+7KftI2nZd
 +cifwDK7//bExOuww+GNAWpprIR6UAcf0JBje0DQejeQbySETSaRukPMS/Ca2kkPuEJMmPVvMTV
 DynkR0te6hevaCyV3sz3hZtVVLK4cSHviMBS3+Pwn8LuCiUOzcoxy+1lJStkDozTzILpkZpe0WQ
 jRQfEb6cH8NEhzRvD1rd/hbEOe5K/AYkCt/SzkfpANm7yQunRyPUDaJNU7eq0TmYfYDkCT9sttd
 FpGn+5+A9Tj1z3ghZg/VMvw2cTdec7RULrWwwAC43pvr7LohbVKlBM81hevpgItxCP95StlJ4nk
 dfJ4b/GAuITkH1eLZb4s22UfzOHvJcqzgJI+W+hKPQUK8M/h0otp8FOl3ziyH1S52nPbfOHZnOD
 knVxMweirk8bMonbF4w==
X-Proofpoint-GUID: hG44ecCA4YEGdHjg2Q9zLmtB2a4QrEQc
X-Proofpoint-ORIG-GUID: hG44ecCA4YEGdHjg2Q9zLmtB2a4QrEQc
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fce159 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RENOrG6OWV5kdoAFrl8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070192
X-Rspamd-Queue-Id: 0534B4EDB05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106503-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible string for the QFPROM on Qualcomm Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Add the QFPROM compatible string for the Qualcomm Shikra SoC to the
qcom,qfprom binding document.
---
Changes in v2:
- Improve commit description: "Shikra platform" -> "Qualcomm Shikra SoC"
- Link to v1: https://lore.kernel.org/r/20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..52b86133ee00 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sdm630-qfprom
           - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
+          - qcom,shikra-qfprom
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm6375-qfprom

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-qfprom-binding-c262fa19640a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


