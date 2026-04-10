Return-Path: <linux-arm-msm+bounces-102738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJKmA2xI2WmkoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:58:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E613DBBA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD99530F33C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706F23E868A;
	Fri, 10 Apr 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDBjzsct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoi6KmUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EC3E8683
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846621; cv=none; b=o9UDM/WRqUBsz+V1TwtXiroFVPiZZ69S7CKEyur2A9XEkYoTlHffiTjeX9bN0nnvOB0M99N9+Iplf/qRfAKZzG8IKtijQlSMDXyJdsmAx3Ua7tTQOOzGdSfb3Y+fZ6EXn1bwztFOIexK2eIyjmHTAhgNokxi4RLIWe9jZdCIxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846621; c=relaxed/simple;
	bh=iZquXc0sPu2P/ndQa0+zylEP7jeBEt/Uu1vfrrgvqg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADN4FBR8E4Q4xhlp+8wayVDU9CWEQcgVLbyYMNihYjXWhqctZyk39pIbgi4/skvMMk1y3O/ooLQ4xAUZyDCj1ck1m5O9cd5qh7VypxA785wG7KQccUCRZncTLJeAaAm7XWONWvxqnPv9Jh6taEkD7EPup2cMii+N75a4A+rGs9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDBjzsct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoi6KmUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH2wci1498583
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oB5blGiSxqu
	hyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=; b=PDBjzsctJGu7feSuPlE8mSv9e2Q
	Wkz/L1veTpW7I0iE2nZAGbcFxe3bdfxeT7IQ+suSLqjTUP0A8ZB5T/ZteGb/8vcC
	86m12BBOsownZrrmiYtuPRNZWdDxzxy3A/rVslVtaEhxZKJ1Qp2oPsCVHoGnW0rF
	6VdN1VYdgNNxxxyMG9iNmDlZhMWSLH9bgc3Zub4yck5uAGbUYjUjSBrGWhdfWyFI
	635RMG5g9m7LlxshpEmYPxnA5hmQd9DGTDxxc9wy29kThMmIZCR0LS2ntd/iynbE
	oP4WJvCrrVxtsC1SXszTJuVIfuiMwGwIoqrAD3h3wK3qGj6g77JtXK35mdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b1hm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso23547665ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846618; x=1776451418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB5blGiSxquhyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=;
        b=hoi6KmUzb4FnQSRVOy0tOh2wcNlcQncpOY/G41Ycq9aGDTqTFWv4PNVJpAmd5bK58N
         DiBVnFDgAWeVH7iE5wkswdAPkI9jE+dkhBLjZGBlC2VLqJQMwDHDZ/59KZHxwo1Hlx9R
         jzzA/IbMfBzrF68UJoqY1BkJBzKJWVmX7z/MmZ4WeEF5gOY7bt6Q4tHiGMRQCpgkRsIA
         YZ30Rncbib5TkIYsRx2WhRmScXE8x1ZPiBVDrgjj6vpkDxoqk3sFeqBi9kEUg/kRwTdK
         CSQe3jrAX7wqaQ6tmZFLyGpJqICgekb0kT1AlvR3Kd4ysUrUUv9cJjhL5xkNndSMXsS5
         gU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846618; x=1776451418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oB5blGiSxquhyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=;
        b=jUS4IYt55lAEYKyh0qNm7ijplZoANM/TvRwjyiwdS0W3pRwiuw7WeU9cP1GTPXYX4q
         gtnsiRIbqCrqbnI7xO58I0hOwzb3Qgtq1JyMWdLophQqIyD5FH787X+615lrUAJQCaV1
         Sp7IkVrIE9yLmeqcjz+QjRoPfJrHsqXSE8oSNOjePZ84I3L0nL06xZxdiN/u4K8K2O4P
         eBdpEN1AoZ5ofI8R7hnPpNFywy+R1HGUSVO7Bh2n+Sxrt0wtEYyO6NdGxc09W0iLhwEm
         kcF5daxzKRy77PBHHMX7/D/gTCRl1wP0nnZVSUKDXADnHNj1kJYi09ux6EUBwZX13WST
         Z6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXygdpZHkLFpiisTF0HZVYrjEWQs+Z6d50XzXlAGWTlBGC4dSphWBe5itAS80jjK0SQxp3klreoitTE6MQk@vger.kernel.org
X-Gm-Message-State: AOJu0YySM16bvr2Dpz0Ihp7iBMUFMXvuNI27q2TRQiXsxmdhixXhvPJP
	JAXDJQHk7ODE/efWEF6SF4PcOytF3VE5NgnUfPWpjM6rs27zQSmZJZWsMZhR8MNchfkasPezlk6
	b4O+CHSjqo+5g2q3DFD+XE3HbMAbzLMzc8NZq1Zog8XHpmY1oFOFFlFlkeQwT9aUIuIRN
X-Gm-Gg: AeBDieuUv0MYLc45PvhbkjeYBj6bN7Lqt3invhhS2jfMisGDRSbyRGFQiSAgO3D9MDQ
	XGyYsyC6sixjVMSEb/5onYXXdk46xQPt8JY0u9puYEfZPZgKhJ6hCsJNOLK4rfLnWNrJrXd8tgc
	ix5jBMEpCxheroI0f+5DZo3vqED8/Ia7K4mSAgEK1mGFOzmFYqBfUEI/ZWsk6y6A2JTnOt6b9cb
	wv1LbGat59pS5AQdtdK9h4SLwoEorWRfhKQ0R/50Keo0JBsC+t8kV6x/7XDPm/sPIi2GWTd0SE6
	m5yEc+38p5cozlVS34uQyXxaiuzulghfATyQTWZiSXz4YxnZ+mBYYUJSQtJOtjah/35KG9Zh2Ax
	9MH0d+9BhbmGbZyyONUFss1Zhu+a9h7GHUaGws07oqlhwRxZf
X-Received: by 2002:a05:6a20:7351:b0:39c:2a9c:bbe2 with SMTP id adf61e73a8af0-39fe3d62ac0mr5254045637.24.1775846618311;
        Fri, 10 Apr 2026 11:43:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7351:b0:39c:2a9c:bbe2 with SMTP id adf61e73a8af0-39fe3d62ac0mr5254011637.24.1775846617762;
        Fri, 10 Apr 2026 11:43:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 24/35] arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:01 +0530
Message-ID: <20260410184124.1068210-25-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CFFkfKHfxjw2lue5W3UMOSw6qMhwrpBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXzNMaawKYY9i9
 mOOPmoW3w7RnIns68lc6pi+j2IZDLyIA853FGeftoBmxj4M2w00MBcJvZjVfc+w82TrGxGALSQV
 mRY4lk4J0rwaxq91vXNsT4C4ctdWP/XNdwdECnOWGqu8dGRl1DlqjawwKgYMFT8W+Yn7Fm2plk9
 7trpr1Os9/xV2nfnytUXFpGF84wTyu7Mkef11d2jzGS5YiQzoJl7crposM+MP2grFAhLB9eHri/
 jx5dUb9gvRwCVyk6/HrdlqLNnymLqmawrhqMKx78N3zT3WC6TVVmrtYM3qGFdG0TwiA0ncjp21f
 DfJBxkL1iLtvUqp3kqdLfHFOicB9oj5QMtqYpjThnY83rc7VJrb9FzcupJtIJr9mSguOSQ7A5aa
 39HlzjbOGfnDKkbLpQKHHv6ObWTiN+FQGhZ2qQsE7lD6bacqA4MLPgeVnV0UbJKYFDqOtH9/HUh
 kpUnEhmlHgokCJkXyrw==
X-Proofpoint-GUID: CFFkfKHfxjw2lue5W3UMOSw6qMhwrpBv
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d944db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RSTtAalInLn15RkLuCgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102738-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6E613DBBA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 0cb9fd154b68..84b22866d2f3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5744,7 +5744,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0


