Return-Path: <linux-arm-msm+bounces-102731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GARoJkBF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35E3DB8F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39CD63042D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E453E638F;
	Fri, 10 Apr 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0pU/kMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/q3gEeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC4E3E6392
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846594; cv=none; b=AqmG5ugQZ2g+HJRLEsP63WUEsvOGnRI93Wk3S1RKR6DE0SbYusdviVXvFY5GvZ2Q/RsTyponOJWHuTgHvyzWcCLLuaCzr4e26tvvBSt2y0BI9VLXX/WUushpvDjX+b9QBu9k5bzjK46R06RPFBBpbCd9mKOvChmvv0UGYjyX65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846594; c=relaxed/simple;
	bh=aCVCm8p2Eyhi6/SLe4iX7FYymqXIQYhMVyB+2rqnbeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aG6QD+eRflG0ocElxtyRO3p+qehGwrwtz9wWM39n8AYXaCs9Is/BZY7nx0JNsWgFoZJl2bx2WL+x1tasbf0yIdR+n4c0LcpCZK3VZiPr89aGV6olkR7ul01drZjQJTfdo7k5yD42Ov0MFzhHJovXqcMvr8K8YiAxU5U/+x2LeWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0pU/kMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/q3gEeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHUf9A709079
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CTKGsDauXyE
	AmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=; b=m0pU/kMhzfFYL1FNsDWPr0tJQ1V
	AzZyUb5n8O5RFqmrXNmmnF1atORzd9FG7IVg8UJ1NiFTn1ijiy7uDJyFlmD0oeBh
	ezObQrqrS9KldBAfbUFYp1sAeKseedqEooojF0yRqclLgnwgOVQ1hdLjNVYSYCny
	/VxgIAfu2LvDGsaWgsxZqJwmayxSr7qsJBpZYPW6HNTOSJ8tFQBaeXiq+5QQJ9jX
	s8m3Jcn9DUhUwMNTaIZZSzMArjTPd0N7SD3drJUGvytwQxoz/Y+x2wEiFZVWuLow
	xvmExGAPHHaEt/1lzdTermDkBg3tInC5h8zlvRKPA2x7qWlzCPi1n22cycQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1357745a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846591; x=1776451391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTKGsDauXyEAmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=;
        b=T/q3gEeQbPEK8sQeA1x+BWiTPIfMgvZlKZk8gtkOE4G7jmWiqha54FlbVhJ+MfLLWL
         bDqoZsE0mCjZiElNvmDuoN0QkS94+vv/fGlx6+Kwx9uN+m3le7G4ZHeiubAYqaYKlocb
         czutzE/JlpHzS2PJi4quXA5LL/C5nQfTKDCIOsI1wDNsM3rjJ8sFHY9c+QLMtFtFecwi
         qqZKi30vLx9L7QIoVxtSXw3qYbgncuI1jjPHIhbceMVeYQ14zEilNPbDGMWk7n/CMIXt
         sB3ZbpDz9vML475hUmOE5KZINVCxYLrgu48Xb/ZY15eYgczdgqN+nNp0kJHLRjmw378b
         dbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846591; x=1776451391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTKGsDauXyEAmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=;
        b=lvX18v+koHsQewy1HxF9iTCSB3C0SX4SmgdTJmqdAXK8gYnUW0akKsLtTolRk1Wh0z
         jC0CptQeeIKOiiOc0cxXK3yW1Rczt9beWK0QDWcK03dis1eBI2ARXgRqH2Qoa95FWoHe
         L9eO8X4+gCfU/RtNKGJxX/yIxkDW8ICnQpy0Jz29Cl6187SqjStY32Dfbak2fOhmu7MA
         TbQbevalE91ex9qV4Wu2xG+zXJVrKHlQmBRGFADuwzJpIIUOtrPMcId4Aa6wFdYdW0kH
         OHeszO6bpBagS6n55xRbXFcp4OxGpYbplDJpDVrUgOLbdSJ6Z9j0fhNoZnHRlYspO2tZ
         Lm/g==
X-Forwarded-Encrypted: i=1; AJvYcCUsp7pE9O+ICOxMBy+Ei7VjmFiMuNxdMUo/8axQOdx8dKSB1N8FGE5g5azZgi6zNRjmWPckmTfTqcMKjqqq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CvEeHrrTUMMcLPcHzkcWTHHsuD7k/c17grXdZIdGMx9nPnUH
	vpgnxzPEoeHIQrONqrkenduaqDC9CJxXlkmnKAjLQHDBfpkjKIK14T83f5asWNFL2A2VsH5vp6c
	mheUqvdnWlZVJJ1LFxsskMVckB0cxSx9/vThlwmh3HTmQm5EaqcDwp4oxS3WT9mfw7PWl
X-Gm-Gg: AeBDieu/iaOuTACODyl+KFX2RS1cVSV2rVVrh2L8YJQySWxDDPQU559yfT+VGdTC63n
	404aH+f1F/kLdNjjw3BbFaZdf9L2twp/ZBWfMPgnRNyDVgqZZGzTC+O+eloKAy6R2+hknZomZwr
	BCTnXD89DNtuGO0zUNwG4GGhXss5CtIhMUpUFU9hUAZcj1+xrjwqORamsT2ZKYJ5J6gF70tqdLk
	m6W+oQY4LwpCuZmjn2zXxafoXyko5J1Ykidmzk0CoZWh5964m3rbgYAhDmMv/lmGorMZ7s8QcC0
	nws4pH/ERiJX/LxbHi/5SoTITxtfD5VA21XZNhq2YWNKARYVbv2p4keASLbhZi7a9D7+QasrSrC
	NscjmWgY7XUCN8EpaqZmJZXhJP/XMeU9sS/pGZZQfdrOW4PNX
X-Received: by 2002:a05:6a00:bd08:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82f0d23f825mr3836833b3a.20.1775846590753;
        Fri, 10 Apr 2026 11:43:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd08:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82f0d23f825mr3836813b3a.20.1775846590197;
        Fri, 10 Apr 2026 11:43:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 17/35] arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:54 +0530
Message-ID: <20260410184124.1068210-18-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bQKROCBYkkywXXpcTf0wWZ4rQoR9S_IU
X-Proofpoint-GUID: bQKROCBYkkywXXpcTf0wWZ4rQoR9S_IU
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXwWZ3JTVKF4YS
 2cI/7OGFraYGByqdI28xo+WgKvJv6T76TDZDwTOjViR3OXkHZmuyR17PZg39ZmS17a/gpwuOO6k
 KMHM6harM7/mu7ouqy3XX5Cb4iGryrehxrhLISQC6qpLQhPiLtIeJaQ0PhPgJXDMzzC83Pqwznp
 HDELTJXk7ao+SPWaNvMRG/evDQot3iPWQ7ZOfXFKuQS0futIcT1WGQbwu+Vs0vWUj5iI0XfTUTr
 kEvfpN1aFllnLgvwXTVcWyBYCwEhLhgVExG9ES2B33rBjcXOzZALq5RVWugEp8fY8OqYFemduZa
 0ZqJjSXV8EzPNj8NZq1adUZKiFjtQrthDICm74UOkR+HxJvTbkIb/WhNTEGb5MPeBsvapXyvvN4
 veoI/UUNZor/FGXCP+jUAinWUvU7rewehwZRiHLq/5W6nOtr+Zgz1HU+RxeRmG6FAnDXS9i9Dek
 DJN/HPG0vvPRWpXIxgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F35E3DB8F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..975382cf4066 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4222,7 +4222,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8550-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>,
 					  <138 251 5>;
-- 
2.53.0


