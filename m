Return-Path: <linux-arm-msm+bounces-109972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCxpJvm+FmpeqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:52:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E35E22AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2185B318D3AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A153F0750;
	Wed, 27 May 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xapy2Osi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2aZ7HmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AB3ED133
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875097; cv=none; b=reqIRGxNksC+cmw/HhG3W7QCu4FQQ5QrbX8mCOVDEbVWNLwvDh6QW5GRsFjZbLhAFl71LSInHLS9VnunOB7iLJaILQfZqfhQt8ioQ6G9RhnAq1eypYcDxu9VwRc3yig0lYZ40jFt90OpwTuJnyDvzuqndei9CjKk/SMueMyzguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875097; c=relaxed/simple;
	bh=1P6BEMtSK00TsWaqiDJ8t72v81fch2x3Fie4Nq3BdYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVRE43eOITqOP5ryBn88unJDUUe0JewWPSe5RpTlrK5XmtWUzjj/vcwjyHXFyoD3v3YdipyogYjfglDu6PuvSklOECGc6xsp196hBme1w/rq7ko3G19lcXNueNxhLEje4vuKGV5NQkAb/cWGtSNR9iUYqXtsJwFyR45xb10j67s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xapy2Osi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2aZ7HmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mZ2d051293
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SvYUjwZH0OZ
	oQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=; b=Xapy2OsiqgMCfaf/aDXR3LVZrFI
	vdkHU4j9gPoMDtAZzUflvQx7SIBBbcq13BhKrP6DOtZJv81Qor6+sh9S0bofgs0Z
	cU/73SBSyHRfJ9NbbZ6xTA845yi+OMyrPD4kf9NuWlHmM7ea/3l+CWAGNPMlNrYd
	HgttKFumZUBZy59gVSnOysXNwaSDMrFFMKM9VWPHzdJAjawd96TPzNwBcNFE4th2
	f261j+Qy8Dgina8ks71PmTYDRmQiH36pcNLYGt9HUUSreL83QfWjPWXWkUNSr5Qm
	NVmDZS7Gp4RoKK0RmKf+Svyid2lwruJFRcBLQpnQzTC96TQNckq2BVHl/XQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paxg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so126670185ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875095; x=1780479895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvYUjwZH0OZoQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=;
        b=g2aZ7HmUujawrGUEOHGhX/gW2SI02ss7PZB+hMuKY4DHhOfFMJ9d5kPmnbQr3CKhuJ
         YNGVBHAVXiADLqEY8bEr1DWNxt8mzJQSLoT8na7Mi36W91kL5ceDjONAL1tDA18VVkiC
         3/OP57DMGY0FUsjpoTX3k5C6a9vEH23M/Ubahi5YYPWuY+9/1qUdAKWnVMNKCZWtdZSN
         bkYS26Haf/e0pvo7tLMV3TOqQln49DfG2xAp3egRYtxYPAPUn+O/u83v0XgLmx6RM2GU
         mQi0ezb6iZZKHpe+q3SHs5svq4Sp51HmXP8BjnxjFpVErZ+SwnDgAOxhylaBAshtcHpX
         bbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875095; x=1780479895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvYUjwZH0OZoQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=;
        b=IHrZ3YZ+0Qt1CYIK0leyWUoB9s1kIWbTO+6IwNBeeeOov8MQ4hNNi6PdTFhEPQ7Vso
         iO32bPfEkGp3gtagOx3O+BLxiwStyCbQdtlUT0ZGHNihXq5//M1vPctN5LePf1EdMVcC
         DqDkWW3VBRYIiP0IpRmuywsqOpc5RE9TTKt9nId/Ixsgga1uAWNGK5LNiAIYU0tK8W+q
         1iebENBPxNq6jx7P1EdAslLmyAUcL2oTvVvN7VtwzBpb/6IaSJLjHXJIZIFr+kkNsaAt
         Hn1ZEsFAVvfAolddjOkNk0b1CjYt5UY0BaFuXV7JKSHzIXXWZTViVDoEQEH5S7t9TZx+
         z+eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QsRfrj8KF050RVReCSJELb7odwJBA39auWR5BasxADv9byXla1hgB74b0NTpdyuZfmg8fZBJ77cThiCNj@vger.kernel.org
X-Gm-Message-State: AOJu0YyDOwWiiTpPubaRq6xfWKnnD4YL7bpdwJR0jeQpb1H4mSKcmiK7
	d1sDtgxKHPbuSjQgB6qM4GIvxzfCMtDfRbGZFVemfDQs+31EFc1TmszRzQC86M1Pvy90b3Xahix
	gTxmku3ozE0U0hVs4eG7KhgPslcOjPVhBJxseOlveahdb3TkDb7b1kyAJKM+tP7PD7EmY
X-Gm-Gg: Acq92OEoqFEEJTz0YV7b36LRMS/zc/0a5CsvhwUXavsAklFULriyV5JRfNCYpByk021
	oB/6hOns+AmhUVE3MUf05ulSeoz8OvpDdmCog4moBGvb/m64mVi6Y0Ec3bhjAaGd2MyzByjKZMI
	LmubtVd1FGPV/YZr02QoNGhQHlmsMcEamaoE9OTbty5g18Lc8sgnHFzpmZgPkew6kTfgUG+SyVp
	ZM/pfUsMZO7jdvmhevI1KZUXH2FzWxul8oDblJxoP47JBu47QddM7u7gP6IrXRm4mCA/WdmLbI/
	4O9UVQMHug+/w6VUonq20H0RH8TlJlG90vzB290Vs03dIJTP9wClWpETfxrovgX1CjqC7UeG5p5
	aB0K6C/wvBhUDY9plT+p2Ix2D9RjBPZ9e508r766hdGd+TPUyEryslLockiE=
X-Received: by 2002:a17:902:c410:b0:2ba:5e99:93e8 with SMTP id d9443c01a7336-2bea240f094mr240726165ad.29.1779875094627;
        Wed, 27 May 2026 02:44:54 -0700 (PDT)
X-Received: by 2002:a17:902:c410:b0:2ba:5e99:93e8 with SMTP id d9443c01a7336-2bea240f094mr240725885ad.29.1779875094047;
        Wed, 27 May 2026 02:44:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 18/24] arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:23 +0530
Message-ID: <20260527094333.2311731-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5vGl468QoQ66FlwqAyO5xk0OG9mqqBp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1HVlGHio7H/z
 kM5Wi43HriqXQcrAVLrAHyxvaFFalzkn7yg23KQc4BvSpnKwoKXVcjTRV2375q0CAKo0w9gNl1y
 lX5kDHZfCPJOMKwB9Oa42SMIVoHV1Y4VROL3AA6S9Gfz5jgEAd4OuD7DrpxZ0EwJpFZ7o9sp+IV
 FfKPxmLkUl0pPgQC/K+PQOSv1k4oRFwwZ7NR2hiE8Hb1TZTH16cc1pm2XTigbUvGh+j2VFt/gnl
 xYeT4xP8SdjISNzq3mknH7QYoz+4D4jbZSSRsYqidYf50X59Lt9WwOT2aAyU5pVsWZ3iprWvZdN
 DaNcgbH/Ap73moH8Z5CPAGAxWll/HXetAzR2gABdnzperM4P+JoWB9cetjLDJ413x2C5khgrGkM
 iMN73280hC76uU6Qr6vA1Ov2/x/OXujNUOnmVW47DjoDavlSbcMOzkBADJU4+6Lf0XB1xkJ9SxL
 TVLE8bLei6y6IsWYuLg==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16bd17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RMwiql5bMxdNdqmTa7QA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5vGl468QoQ66FlwqAyO5xk0OG9mqqBp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109972-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E2E35E22AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on talos spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..4b6adad72751 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4624,7 +4624,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


