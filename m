Return-Path: <linux-arm-msm+bounces-109974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBNHEvq9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8865E2152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D51D73031B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E7F35F19B;
	Wed, 27 May 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gc9pvkfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMy3+YiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD73F1674
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875105; cv=none; b=kyBJnHuBjb7w69efNWPCiOv8R4KwFmHQ6s8NDlgbFd3hqE1KYhH9PwF8smTLmVPjxMLi2wwd/6luUWSFh3ohuUC7yNuGYSQ9KWTRlXh9fjfvHAXRrNTk63J4AbI3RRPAG+q3m0zJf1cEKm3rVLX2OOtvOLdjwgvu3vZqCbckFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875105; c=relaxed/simple;
	bh=bcYT0ign/NPjTE4xVsFmlHq7OIYkEpCE9pjn6SenNjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6mtBldPkBva4OhGdWvv0kqCD49mmet20zmZpnei2ZbEPF0BHKp6+CJbuHWKU++flNEXv8k4QwDYfSDLHTnl29OZs6kJuHf5SG9nsh8/ua18BG2bn9jFONXZl7R34HyKnXxngKiYJCeIWjoAhmVrqQY0NpsR3YvyoMU9Kk4bCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gc9pvkfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMy3+YiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mhrn1168558
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gWrgcJbHnRY
	cSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=; b=gc9pvkfwoGuUyJCQuabOti/ZCbL
	GFItzYn6SMcvIz/y3PaCiGfG+FFB8Yf0eBBdy3vpjRTYfZLVvxN0UHBCMjBZHUmn
	If10ssu97coFu5nc5Y8lC3Mb6cou4Vc+q3A+G8jamXb6Dfq3ZE8fQaYDh3sYbRpH
	a91ssLX1f1pmmuma+gel7npv+psO25qH3DjnmExV1TU1r1VRx0VXV3w4+gvNPqZm
	ZiPniueGqGgKZX4JugFRfackCpFtNtygPmjPYydZmscSDcJeEZihQFYq8+ijbIPN
	/G9piFRtqMn9IVNO4G6a3yX+nqPUh2ZxJ0wQjaWTsZm7HruColFWeQrth+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk338a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso61074625ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875102; x=1780479902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWrgcJbHnRYcSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=;
        b=bMy3+YiYDDFzJnYkVKmXbr/QypHqohdOmiLdBvIXT/KQfrRxPamgJQSP/JtPwG2Dj3
         aNLcFbsWaRcGhJySXHA0bHQaS2dTmCwE/efsJi/VUQW/4tY+zGl3uyV+laokgtZ9pEl5
         HwBk57cmu2MnLcQCiBn/0ZUw+3qr0VbXQU7IDsHd8NsM+AR5RT81xCZKRPPJsbId8JfZ
         utHV8ckt7wztFw/w1XH86xLUrp/9qmuY+r/ZNihsWdU4AXWrFx5sK6yZ9NJVM2+g5QZl
         iC4D5gLs0T6jjBJRPi3o8MomSx7NI1HGO6F0f/Th8ABKdX1MUm08tjecDqdmAfaE9J5q
         t33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875102; x=1780479902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWrgcJbHnRYcSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=;
        b=Ev/OxkG6CiDetURNB3Y0sWxyAXgXonAAkiiu8hcRvKTl5zP6+jw6grsNIhlcofqArp
         nH+pcEiiecU3tUWaBOV/Y36ern5rU4BBjoqLzRyHt6u4MHVYzPMlyUy18gOATEChp7v6
         q2ZsusI7USi2zuDj+lgDRm6+KKeekBGobn9N/DyJ/A1dr1Gr8Zk+It2GzC4hPXN6K4KN
         cSRC1SUMCA5aqYCp5cFTxsBu/iyFSU99JjYRn2VzmT7X9oDme7xXCMN2Uoo+aSrjZ03S
         q+AajzaT3/GeZ2Jsa6B5ZiT0znUUxcf2HYUycVYn4ktPuJNsmU4a/IlFbZyc+tTCEV/E
         0OSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sewiC+8W/u5bRz/3Ov/2JV1uDHM9eGSEw01rsvkVSxmf/LS4Psqvn96MukIyaIPP/9+jf/ktxHK14LB5z@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUO4ANLTCQdHZw0BfnH1dcZlsYGEb5pEA3KrpxQnwvsUFcOsj
	/b1VRN/f5fyUqrDHqaaMNarMcsHjHzFN0TF780A3oVZuluAgYoHl5BeyMCAQ3T1GgvKBoYSzY3y
	RLa8aanqiz9O99bmrZSRfRCAlHyiYJnxlLUnIgKmRM5178xRg7k5xubo2QvDFPNg0Gu6b
X-Gm-Gg: Acq92OFxu6Cst/cJ+WNI9xC79YSeP/S1rpu7L12GUked761rDd2DdCJVwAYcQrrh+Ds
	FTgLPW0xaT9gGT2NvsL0ZdU8NjeUpj8jEgPY+S4Pm3MdkHG0+cF06DeymCv6J0kdKDMBV6IJ7mb
	VcybusxdVByEQJhB8pvc0BH3KeehCvi2oktHDbFrEPNAMg2Ci6mFk6t/BL4w4ONelajeSnfN/LO
	inj3f7MKmBUBVZe3ak/nL/vmGsHcAaZ4SZwbjWm4gx2spCTMFwLyxV0FD5g9meUhHqk7NSO8pG0
	K2qkpQdCN/Rw9L6YF8xmB9/yUpx9VHIpILB7VsZBfGNDsZDVgkMphRGpzOCRlFpNTg7bq/Dqs+q
	VJC6HyeTlj84rULyK6pZM/+4F1EhoiDya41ibZueoTxfLnZrX
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr259277415ad.13.1779875102464;
        Wed, 27 May 2026 02:45:02 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr259277155ad.13.1779875102012;
        Wed, 27 May 2026 02:45:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 20/24] arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:25 +0530
Message-ID: <20260527094333.2311731-21-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a16bd1f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xoE1jMPZzYIr1SwPS-oA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: W1Y5Ku4IjxSRYa_VvNfiwJjW5LVAMqAY
X-Proofpoint-GUID: W1Y5Ku4IjxSRYa_VvNfiwJjW5LVAMqAY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXxdxKnSxHRfNW
 zuluZwwusCWhSoDyDywKnDVF4zU8jL7fTVrqSCYRpJGt/B41v4lwyiI/TsvUCBjg5mvmIyYipUm
 je9ktNzQSl0clItTz43qJjLKsvHILq926nhxgPm4tI/k1gtFwa1o1L2GHrE3oS5DwNI2MqJqrN6
 lulLhvCJNyhYkgPPwFKLqUFGC0iV5QPKIfhJFVB8lRs2NRIBty/9rQENlCYgTgSkTDdWQ0hOFSv
 0lp4pRNJcOEhzL5ZNI6O92bytZ77/FVe0aJXo/TTgLH18J2SmxxOUMo3OOtwq80Yi6PLXLmCXzv
 2ZqJCw8C7Lwa9bf940f5CDsN0Ty7rZ0MkVBn7xZq/W+U2Di+pxixRdrW/+ASWTGDWtk9J4b7oN4
 3NJJ4DaWMmqYH2+ExNZ0lA6PD6UqLZnbAPJ8XY3Wj9PpfTx+8x4DOKPcJosBqDD9SeqmgAF6Bie
 OSR9qYTPK6bwWoP/uwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109974-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,af00000:email,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB8865E2152
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on lemans spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc7b4f65ad5e..932948362eb3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5865,7 +5865,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
-- 
2.53.0


