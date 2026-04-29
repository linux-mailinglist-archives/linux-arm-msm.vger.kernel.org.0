Return-Path: <linux-arm-msm+bounces-105117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BrSFR+o8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70748FDA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FFBE3042EB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AB38E5EF;
	Wed, 29 Apr 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP6mufPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/xjwA7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D438F255
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444866; cv=none; b=DMUtBezlGNxfUiZ7gFApFlYYhaKRGqnMMtG8PsePszcimH7WJXZxRM1vzZ6m1AaIjOiYZriGOYqvMoxsv8YGA4ibmei0xrNAyIAHmcuQI83YnuJTQ4WrphYK72x8z4TFTwSCvN8roX/IBId1JQ7d2pBIpp5MIcGO9tmxNCOebiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444866; c=relaxed/simple;
	bh=hHpdZED3kG+CzgYU7SmExHEA4bKiC68AArVVEK+g8Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQZWkHtXt10nVgTwpI6z5pkK0NTR8xsUFelHB56VKLOg+GbzZkjrm5u3VZ8kJJCL5dIZ0gafAY/VObS7HpZhjNl7vMrW8OgluOr8rG2OGdBFjOyPsdNGWmuDrrgiTY9fV2R9Fo7lY0OQS1iOT4eGSaDqBc0OmLgHRDhmMerqIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP6mufPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/xjwA7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3A20d831622
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=; b=aP6mufPuT/XzheV6
	PsFKSsXiXiIT63dqLnKivVEZcbMS3APMZ6phWGZ1HHbPS1Ia2L1yK6AR/3uAauMx
	6NCCfTrVy48D+8G2Q08v/QinzuUSOPxX1DixouVPde69OSd7Q9DTqPpG2j/rivt4
	6/OyjgPdAI6EyeqBv5PMMupDkwyn8FdE7FS+S3JMSK6DNxBBCGLJUv6JZkcQVqWs
	FbI76dCJXSFbJFegp0DNgDKHGt3ajk/2VXyEVeRCWzvwvP/VMtZtYl8seS+/pYEv
	h+jGhPKirSmsghqn742jkzj6gagOJfScU73lYH4bEbiP7TWFsI/iuRoFm4WPCGhN
	UFrnhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqaeqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7ba03ecdc6so7497947a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444864; x=1778049664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=;
        b=d/xjwA7PAOzOiihxvXFdEo8EeRwSNKoEyD9hXjsBo19aJW3uiYt4mcEt3xtA8XeUbm
         K6XiVXuwIupguJ/XO4F6UOzn+CzPAM8aJYAyVM4DNwjCgSvZSL/2oLMMO5Hu2XmZvTOV
         ooUgMsEjGGyeeFBH2rTvQOO/c/0MRRkDM89sAqUf/bJii2KA2PCIhthnJT9ndjQb+Px5
         QxLWIKe6Jsd/dZJxRXbAKaCvZjvTQeVtgt1Oa+LjaHz9OzEE9F4hXu9ivcfos/nMPsDO
         mXW7YgBxU6++EaAOgyMgbDwu3+yq3qOF6QJcwQH9xo2S/kFmKtWJ2lDL7Vj3izW6MBRU
         8dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444864; x=1778049664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=;
        b=Fm0GpSb7QDsViiCKVDA4Th8R1vTfBhRnkBFNZkqNTaOpJs+a6dIcciYjJmOQdbSE1W
         1tQjNaXBkswcnsiHDsGmEKxu1frVo0pz1blrM0nbx1Gl8K8bQStMV64N0X8c+Gam/I2F
         EW2kwQMXL3JJZFVTmib1+ttTI51xpbFPdbwMkNbCPsnTZZsXJnpNDtkt25umOlrXMM9I
         +ooN+O1qf/eFzc/Pl47BP2fDscicLsf4Q9gh+H1Vq837DVqGiDatzWnj/kZZ/aiDC3VX
         mBLUSCoLDs468CGb7+zMugIjTmSWakeHBN3k1F0EbdYYJmt5WubuwAMG8DwXxJ//TKKY
         zcMQ==
X-Gm-Message-State: AOJu0YwW74/Q4z6SNz1KagzyIpb4Lg6AkljSFlEg82xUG43/BoEcQ+iG
	PRdURKiUJLpb1nZPwR6144/ihGZuZqUOunjm+ILL/xtbReKStA5+xiQ9hr7DBuZk/kq9+juOKX4
	PbxUSca05ooBHTXXHyADF2qy3SEZQl+CknGxnEVu3gAdNz2Pj/jTxlDJ18lpfp546i0hD
X-Gm-Gg: AeBDieufxAQ/D4S9t4YxZ0TscSFP+QgWYTklWt8q2OpCJrFiBDw+panvaEAZpFpm/XW
	EzFOo7aH6CC4tKeNp7KeFhZWpVY1h/mlIg4C15n1aDPLim2LlBbwmjys+Z9luFll51hyMw1A84n
	Xofml1+nx/jTdzdbjyVBhAw1XuGsQh8OYEukMAX+Re71qJVqww15xBvPy7o7u+dMRlrhBQ8xyiS
	uivHAfNA+edZHjsKXlim5pgr5bLcKvNNQhN33f5BhpeQkUfMyws3eityVwTmm0hx39h4WE2OUvt
	oZxDo74KqZtEsjpw8N9R1g7UWQU1XRulWkE0+qZrREwihFl514CmstI22grfFrD3aGI/X90jZwX
	8riO7Hm0KAodYJq9c0B5cTK6RYOjGIQxCcrybDtfr3CP8D64dfb/VHO+f3Tc=
X-Received: by 2002:a05:6a00:3686:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-834dd913b2emr6517290b3a.0.1777444863950;
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-834dd913b2emr6517264b3a.0.1777444863475;
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:10:40 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: kodiak: allow mode-switch events
 to reach the QMP Combo PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=654;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Zr1RSWzQ8TOIe2WIC5gCEH/PYD4EGtkkCpy/OpDeGHE=;
 b=+PV8Q50bTwQwudj/B2J83617iFOg1niRj1iHnDb3YOFWw3L8AjUo331nGV0PxD/G0mQ0mRfkZ
 wDz7peewoRnABIJim+55oZbonnZW1U5WiIQN5bnLdLcQ2v0u+tJ4EBA
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: Etj5blrC-psmlewODmANufVwbVrT-gBZ
X-Proofpoint-ORIG-GUID: Etj5blrC-psmlewODmANufVwbVrT-gBZ
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1a800 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6t0rsOXGyWROS5meZBEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX/aySh9KHZR5u
 WT3Y+sQw8mRZIkeRSG/PfOSSNWvBEzIeNRJYF2O49SkJMkutxSNXtEw3NtVIZOAgzybgPFbMcpK
 x2XzvCWhLrOBJLOsTYCpcbOOqRUPnaUJ5l0yCFVR76UQ7/cmWsLyumTzjNyEbTUfpR6fg3vUEDa
 bU4etam+Hlt/7V6kmcnI0x4uHsC7AfkyigZ6MS/ZXeyYV/qLpr3r4uqBZ2So6cV5XyVAXloTiRz
 TnzCr3IEw9vpLXDe24NKkFGtrnNwOpGis0h6mo5AblTYHCzG0Fh/evjoalBZ3E7rXV93pv2Cziy
 01Ri0ZT3+Iz8519q8gRgnbqMLfMIhZtPsIsiI1RwfGacR4IM13s6XzwY9ABjW489JNb0Tt26G1G
 11sFG+FEUYXCHAOMFaB/Oevn/ZDTeq7/shrVLaXbntTLT2W4QaVF68/UAw39UTa3i0AcJfnXnwy
 BHJBRJShRYcnVNlbIfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290064
X-Rspamd-Queue-Id: 0B70748FDA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105117-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Mahadevan P <mahap@qti.qualcomm.com>

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..96ac3656ab5a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4320,6 +4320,7 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			ports {

-- 
2.34.1


