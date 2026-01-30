Return-Path: <linux-arm-msm+bounces-91246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBfpCkpefGkYMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 08:31:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF8B7EFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 08:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2254D300788C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F3A31197B;
	Fri, 30 Jan 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9azm+H1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYRqOY5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9CD2DECCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758279; cv=none; b=l66Loo68v5+TVIdYnXmyGGge7WClb8uRuXcXT3xrtab9yVEgK5FqVqYWZs9zIBV2KH4miAwkQSgMHJluoTVUPWKGytzHTXmjvuq6nAg3G737uzqZrjUtnq5DjH63q2m7pfvGdlBBaK18sBZ/6PDkGi2AkixzuB2qNW2/th3wjl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758279; c=relaxed/simple;
	bh=K9o4+8dL4DAs6FnCTOf0dkAwq+TDIYPUZlFlla0eTDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+vV5tsmODLClZB34R48/plqsX/6dftPnsn51x+yzLxJa9fLpoAELohds9/T/HkNASo0Q1GyVcyIPVlSYh0ti2NmBkZcHlYBKHAEYf0E6N9V0CqLcW9TQ/wGip4OVGwVW1nhS7Kxqx0WLYsprgOikGKEYRRSlxiBqXzLqke1vgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9azm+H1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYRqOY5C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VbKK1022148
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 07:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=msnY9GJTIxur6oPtc9V4Y8nN9Xbi0+qaamT
	0oROp0MA=; b=o9azm+H19zuO87v9CERHRZoPf8lYMuEIS9Xdbt5bVkIcmpAGDrU
	XCt86zfpKgo3LKtXRUlebRYxmZuCHAauPJMkG36wy2+c8ebjEGZQ8ryV6Z4isy5/
	0er+h8oLFqhYhkscUKcAU4IqZGWYxge5mPlJcX3ZHuPF/f96Kb1ldpVLM7xQfapT
	rCX25M58kiiDGJZ48g0doq0aiKky6TZvcZ+6/6kzZ46IWfNs7w8QY4H39zmC99GV
	8Fd/dpu4FUV+rh/tKAKLDoMf+HY0JfQjCWwBinC073ZQ5SJ/KbAfz4kJfFX5slYu
	/eRPAP7xeCOV1I/+xepdA7NdaIJNaNAtLKw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3k9nd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 07:31:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b7a28264c1so2969473eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769758275; x=1770363075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msnY9GJTIxur6oPtc9V4Y8nN9Xbi0+qaamT0oROp0MA=;
        b=aYRqOY5CKjTYAcLMcxBy+OJJoTQfAkeHoQtgrFr/jWJsHFq8ifOjQM9z8V7iWflohT
         xePz3afT00uxJ9tWayWY5wurF/sdDp5VFGohqMPFEXWkIanmvODwx4OLtz+NpytMlLAy
         yYalwuX9E6bubl5mq2XXQsOL5j7S3k7p76bwnz1ztkwGzFzddyBY1OfDsRqCM/3WWn6p
         4pq3TV3+iu+0wHFpbYrsMdjCUlypOkMslA36qL3AeiyfEbenUYtZ8IUJ96BHepziQrRj
         835QfuQFzb0hO8QGDWfZjZI7UxrWwJAITomZXzSryuLR3XlTrPJwJ6hie/WT1waxUQkH
         IUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758275; x=1770363075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msnY9GJTIxur6oPtc9V4Y8nN9Xbi0+qaamT0oROp0MA=;
        b=RvXRz3Nwfx/4QqEv56gFd9nFuqQKdV+pk5bvgYe+zLitX08DKHN9PErFjTHjQoFPxv
         cUNbfW0DgaBHCOLo7YBXpCeQoH/1D0f5TYyR4aRSo4Jv0TchaFPh3M5nid7DX8Teqeyr
         C05VeuAlwrYmixhWKY2QI0c/9EvPcPIzBoHxCNEzdK44JjsEIVviGlYzBCh7JKvs85qm
         YAMq2gPZtD27GqC4ESJ/2JXlbYUb+m5LM7geooa9hiWqlNwEQc11UAk/AxG/8tIiGlwk
         JesOaIS9ode+4tEAV52FDET4RxzIOLBR9kfWcuETCw/APh/sR7dqIfexFNcTkTQf+SD9
         etXw==
X-Gm-Message-State: AOJu0YxwnOMf8KzRhuM66oG/osDljCsDlMML3tY4/uMoT7s8IAL57qJA
	WnqT6ABttF+uco1P+pwovueDtfiy/+hQ3ez+iT1r+IfOuomJ1D6W4alv86mv3U5mp/qNA4SFisC
	6bZtZQNxse6cpNkfC1sN2xgw1KLzxsz8/m6OlOxZ5DLYSGgQhwfFcCoSml/L7xiD4Y4yN
X-Gm-Gg: AZuq6aJ4Uo1mLkEMOPG6aNW1ZSy2nQTZ8KL+vjR9yQx1uMoun/Nr5nNY0/GCKcmGSsl
	cWmdCN+y0rE3w8pDq0L88YTuZ8NDru6lv4Q3N9HMdqVXcIxXB+f9hSBhxjtj2koqgejmLGLa1e1
	rfXFvK/TyugBUMKC4x20S9CAxpFeyS0w5M20A6n9TeKQps1atLRhPwwHOjBXalnvxvdNvXIoYlE
	KUA6iEuV15npg2GyhgyyQ2bBx9WT82ixS0l306fdoJQEmJM+tUCojhxDOINr1an67OuOt9tbChi
	pSQuW1ec/Scy83FoGCg2UT0MjuKJMLO6OVL+ohhv3kk2Ix+HjW2HAzdkE3Z6h7zlBlXq1Ut1UkB
	0BemY0PYgoHqJr2ES9XlkTBYQyWjMYfhoTwluiEad2+Aj6PzRWVePts4=
X-Received: by 2002:a05:7301:1f0b:b0:2b7:1c58:dc97 with SMTP id 5a478bee46e88-2b7c8634916mr930201eec.6.1769758275322;
        Thu, 29 Jan 2026 23:31:15 -0800 (PST)
X-Received: by 2002:a05:7301:1f0b:b0:2b7:1c58:dc97 with SMTP id 5a478bee46e88-2b7c8634916mr930187eec.6.1769758274786;
        Thu, 29 Jan 2026 23:31:14 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8f2sm11197535eec.7.2026.01.29.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:31:14 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device trees
Date: Thu, 29 Jan 2026 23:31:13 -0800
Message-ID: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c5e44 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oz4SV0ID14j8E3haEeIA:9 a=eSe6kog-UzkA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ytC1-0Wy7lTTJfF6vEK0h4HXNE0q1fiI
X-Proofpoint-ORIG-GUID: ytC1-0Wy7lTTJfF6vEK0h4HXNE0q1fiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA1NyBTYWx0ZWRfX6I4vhRjaAmzo
 SYngNkNG/1oT/m40PySj1um/UhVz8OQIDC8oDKnhFJQvsqqQwQ0UAtU/8sJ4fYQO/mXSF4KwFmD
 AZPsCR8UY4qOQ+hplvR4hqvM7oolkw6yHQbMHS0UdtcoLfY3hWEVO55ekfJJLBSSCqBeyED3xw9
 H+hXuwgGTispCTPJtFIxmSOm/mIl2gyricMwVbMGUjdQDenzdpbSBjEBhyxgC0vB2f3rBhZAscu
 2JtdCq+nRigqNpOyPBIcwoISedzdDU32zV9Kg4yUFAdWWgdDoJC3GRdFJD218HOhb6e/79snJso
 IV6PBp5433u1LyR0JATJDwce7y4N23QhCeig84+N+EKMCIcBPXPzuwpxEc2ltQWpsFpkJ693bfa
 BXt9684fnSCvTAd1XY5lQvUB8iNaBJLEbjSaDLyuqZUaec3Yc6aO9mDOvaC3TQYkpI7EmSTmOaT
 PKyuy3i8yL4yiUc3QBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91246-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0CF8B7EFA
X-Rspamd-Action: no action

All the existing variants Talos boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on
those devices.  However, it is possible for us to boot Linux at EL2
on these devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add remoteproc to the EL2 device trees to generate the corresponding
-el2.dtb files.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 175679be01eb..8279854fd73c 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -52,6 +52,14 @@ &pcie_smmu {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};
+
 /*
  * The "SBSA watchdog" is implemented in software in Gunyah
  * and can't be used when running in EL2.
-- 
2.43.0


