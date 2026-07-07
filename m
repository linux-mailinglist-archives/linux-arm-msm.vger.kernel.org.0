Return-Path: <linux-arm-msm+bounces-117402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3XMHSpjTWrNzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:35:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1771F917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:35:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D4te5oz0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T4GrJZBa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117402-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117402-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63E2230A7DCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 20:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113643EB0E9;
	Tue,  7 Jul 2026 20:33:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457713E557C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 20:33:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456399; cv=none; b=jwEJ/WVPY8MF2/Tdc5LyktQq47sQlbdCxuzq9PjTBHYeFbU+cJPuZO/yHcD+Rk5OfJHnazjvmc5skM+ki0WBJF4irIQSjsh8mu1CmNM1jOb1TmNubwfQBoZud1ygSBrt8PhdB8iDfxM2lAmMAAbqytxhhniFtqJ5fTnT74tdB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456399; c=relaxed/simple;
	bh=Ers90E5n5OZcfZCnnXF+yZyTmU+YDE8SNMcuiTigNrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejWFtjmHG7pc2tiCU+Q0bBpwNu5gGuyyT1hYOzIWgNw5a+8+TLQbyGRg8HxL5CVvXW8WiXm4Owdmw2UyuP2lQDXC8thddQhK7wIrE1ftKhE6VP6ENYyVTcv0WygcariwMxX0UBbmzDrE/FXKJOMO+VVmPyztxzc7MO2xrsq9okw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4te5oz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4GrJZBa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Jer1x371583
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 20:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=; b=D4te5oz0etoeifdI
	MVqFShPvcHjD0Bo1DJY9lBF6L/mt2ZCyDvH1L37CF7gLMFPp3DXrp2lk0HjOP937
	fbENyp54GOLQ5zIcdSxP7QwYOQtN2RhIAEkPBe8V0ghHSeBKLbyHs3od55xkwAcI
	XbWQYgryyMBhNxn2bD8F2fyEH6SUDpF8/i1s8mQPWk/FQY63xTr6YtKh6tfAPq8m
	LIc45CccUB3gLO8QbqQ3ChbkHv1W343RN2KQ/LAhVydP9QLwZyYBBLnZXSrsq/Wd
	v6b6Z+C/jCOcpeadipWGUJviSu+Cli8TtBj5IWSZrTo1EoAaeZa4UCi5A6FDwrAL
	1dLi7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u104va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:33:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso3366007a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456396; x=1784061196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=;
        b=T4GrJZBavbNBA5/c7qlY3p6fUTeCZrYdemBHF2ACQW9oQyxkySotTU3XKnDZjqkU1I
         JVi4pJ6LqUio4jRADGmzfw8rCpgEMQ+I5vaAwU4XK1/2FDIlITi2xLdddeeGENoOSaXs
         H96SDUWf5VtUFX9FmIY3ufCjfYijvVfOIGqIod6EP9letgEMD1XyAmsosLcMPP1JP1kj
         0N9o1Xsmc5bNdSljpXryo26IvP3rjqCHe1em6MaXIOr/+DrxmuX+LiAc6sB7zpE/gidZ
         qtvmEU1g0HTorvtGJvMUBS5Gq2doJsPlXsbYTwkEeEhAli8l6f+MDeJoisDxWysiDMAX
         tNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456396; x=1784061196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=;
        b=OSZXP+CrF7jokm9ysemB1Md569zSVC8OovdN7gPWaoF/pNuz+8vW/GCdV44FJcW905
         EgTyiHBOlaypFuXPAvDjQ7YnzYsdtig651w9Bf4AXLniIKk/SUJ2Rb2n2qYNzBwlrwZj
         UekVTpzf/l/sReeps2TOLW9S6vBoRgK/vTzX3z2kEusKEHRXkiBIaNF3MQPmISGf1yY5
         q3QPrH5x29xnbpFOpPlApCg9fvWWZ+S2m3qbIrtJR5QgAOU9ue7OvTO6yKPtQVNXSw1q
         oiSoV++1AL771/zvJ7lbRBzRh2+PkM9LMx+9FJU3v4Wv1nn6Gq9o2nKgwbAjmbcfVV/p
         kt2w==
X-Gm-Message-State: AOJu0YxFE2v1aNbGc0UPiOuJpKW3MQ2jIdfEEuAYlnUPBMo3Ts1Hzfov
	Qzqv3DRazTrEIFPrbm/i0SZT0dac9KD1vPTKCVMG+/cBrrpSId3QWE7Jf7EYkm4p6Y8vmyTh7Q3
	SD/SZTaNvN9FFPFGtrTisu1/9CjVmu4bhHS5GoDVFXYkWvWXzn/X91btZqRaFR5HTfXdB
X-Gm-Gg: AfdE7ckU7pWJkZm0/4y6XSdMiPYBBFmAdMk8ztyuRZyI7k0fCVtYAWxf2qgp5q1MuRT
	LIzddAPOluB11L0lsOsDM4vk6rzQG0deNvhi9fnGtcdCrU/qFNY+YDclOgaQty1j7sojXdGioOt
	DDCNPxKGXPbP8feQOYtv11Lh9XZu+zVJbaSj3hRea0/MVsUy56/B8ZJjdNCG5KDKFBvDaG7Umr4
	VMLKwrmIbPG5zyxxaLc+qwep1gJTD8iRGTIO7j2Wq2WeYo+VcxT7qJOHvAZJoWHN80XK0Em9FeM
	GlSD1xm5u9UAQvC8lLCfl1k2sb/9EaaV5qb5nbMjNgSqCN/yNkTL2YP8CSdPsjXQ0A7HmTCUcZ1
	tg7A7YzGUTYuJPmK1ZHFgMnde03JeN0Omy9JlitkPvxV/reIV
X-Received: by 2002:a17:90a:b108:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3875547805amr4965568a91.11.1783456395883;
        Tue, 07 Jul 2026 13:33:15 -0700 (PDT)
X-Received: by 2002:a17:90a:b108:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3875547805amr4965545a91.11.1783456395311;
        Tue, 07 Jul 2026 13:33:15 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm11975804eec.10.2026.07.07.13.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 20:32:46 +0000
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hawi-phy-pcie-v4-1-8d9cc6324947@oss.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783456392; l=1941;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=Ers90E5n5OZcfZCnnXF+yZyTmU+YDE8SNMcuiTigNrs=;
 b=L8Oo4nvaSFcOAV7wXnV/VYf/fok6fXiHhGudQxCRoWxWPjRFKk9JVcIYh1M9TBhwhPnF64x1c
 pq4YLHQi50PCQRYPZJ+Whk3Yvee4iU0azaZT0cIcHpeO+w9KIJ4hXsd
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: WbHHfTuitwRss43Np55KqvD6mxRG_tCd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX7xaGCrJIQFQk
 m09NQjUnu2wH7piYGk9psYJLbnGsh2eTrbOz2u0UU6s+KehMIH6SKZCmU1d5lbLh2U7F7gBmDIg
 Lp+DErZwAtL+9szgzVtVGCDDka0j+wA=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4d628c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fc9aOexgWALdB7SI6KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WbHHfTuitwRss43Np55KqvD6mxRG_tCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX5nxfN+etxGRf
 vt7/IVAw+HhvCPBQy8faBCQUgnKW29AZtGdNDpbuOIzV6J1XhgSmqY03+htwcA+JrgVRR6P07Vj
 Pu0p+afvv5oQtoAQv8oinnmJV1c6q134n/fJJVKXPPsyf0UHhb4zJs747MhxrdpaxaRHikp/4PZ
 96xEO3V8UZu5OnOZ/Ea36R+tuN3ZE8KBK+zA7NL7fAk8Hkbe34Rt2e2xpULQ9V1WFE6Gfa+Hcdn
 jenvFokGg88YOhpgYZlraGcnpgyop+QQDZBl/21lFOzSWjiX/gQCCaXE75GmHzpDmxUbzY+936P
 NbyEj8vHikAnXq8zUI9n/DkkdKTd+rBmEMszGd4HoiHNw9e/jDLnvjoK2oJx5fWeJNJAQx37TQ0
 v3CNUgywwzc6Ugdm3zIp4S+E+xjYbcZ2Q6940eAemKqtbreUonrLK2NMS04JQ+gPcIZg6j/xhIC
 jfZz9IBwl7awe3fNShA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-117402-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08C1771F917

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..259ed9678393 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -20,6 +20,8 @@ properties:
       - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -196,6 +198,8 @@ allOf:
               - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -223,6 +227,8 @@ allOf:
               - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1


