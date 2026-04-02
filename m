Return-Path: <linux-arm-msm+bounces-101530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KC9LJhKzmknmgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:53:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE6387F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A83C4301D24C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796343921CD;
	Thu,  2 Apr 2026 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWCqppI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwOfD4Go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3853845CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127185; cv=none; b=aLPX3WHxWTP9OF/yJ8tN6nDmOXh9iSqqrDTa8RKyT+Zgyh69vcPs5qHpQlCoGW3W+DeCsGluWEchMpbkA2TNoq/+DxmRhOJpXrzIgzFVaue9R3IrLJFZ1mkyXl220SPCVWWDysYQpsympXegDsBZq9RGpKXl7H+Zo7BECoLS6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127185; c=relaxed/simple;
	bh=fJF+CQ34GAc96FQ9I5iJV5TGKNk9YFLboer/co68qD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J+tmd2d2y1i8NS/cNCXB3QY5dWi2s+09xQo4hyriRB06dURspHRRaGymprALYtIoABFzcmSAml4liGUKmDKjQv0aATW5HuwK9m7LDWpJpFSZxF4TO8657dfi8kj42trWAdcnNc/18UKegDW1j451pSbVMHOQsY1/x7F1INes+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCqppI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwOfD4Go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326k51p1424253
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEM
	V5QdhHj8=; b=eWCqppI/7uU8Lairm0RTEiWtb7ITgdA4H4G0L5DFypEUDih52sj
	6hcESnnkqHpKyQRnclqe1LmGTTaxxzidpodN0JCWTWbEJLDpPn86z4v3Hd/5NwoV
	dBplbhsc7d1MUsIAiHJKTP1Kv0XECg4v96hphNfMSfKTGU205VD795Ikz5/q1Oa2
	pRfHE5e0ZJHIixri7M84IZ0xSa96v6MUW4kkyY+G6Qc7evyhUIZiQU9MUVk9qiK8
	ZU5aBsjfdCV8Bamfv8aGoPv7iW6f7J0zoZISe4AGEMe0ISZyib9QIUL3xTprAlse
	mXtosAUxJ5sXjC/2batmmjL4db9vnZzzu9w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511ca9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 10:53:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso718916a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775127182; x=1775731982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEMV5QdhHj8=;
        b=CwOfD4GoTQPE/dcfeqAShcpmujK6bpoBjoh9A2S74R4Jt0P3xzZO8vECjr4rfz5m/h
         mtigHgNxJfDZaXGyl0+9iD4KlJPnQCpkV2COvQi6hWWegazvkKum4HpXh0QM4nHzR5k+
         7/i10m5sqhxRe+sK9pFXZNJk1NGoOczhsPz/qk0b8yPiPCKb3W+H01BU5fTcjMwwEwjY
         weqwTPwL7/HnngKcYZnbwb8SlmnSR+eqtNhnAFYacuFs/xjpWKiGL/IAJYve10l6Yc8/
         eB6+aRQ38Myh9e6cD2GrdhxbgMPzhgU9pkKQGiZl8//dQliyyeJkUin51LjR+SudYfQJ
         EMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127182; x=1775731982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEMV5QdhHj8=;
        b=YlSZ3sPPy9xKn7fjDDMocwxCk3d7srmmThkN3dyvoMVSqUOJEq9lI7syojSWlCbYOY
         YLCUgNKX5l67wJIUr/yXdKTpWJQMxIk0C/EPkz+izQHf52v1rnsx7z92vprhWO4rRUZX
         hhXFVFjbqCxmgnwi6qc47+c6i7aejVeDmYG8kFvrE5QiU8T/tL3ljNm1P0ioLYNVBLRc
         1kZ2xqKaUOtyiHLZe+Xd0hSNDCN29LIuw98Y9SRBH3/1jYsVLQy0L2nfX+B3T4YVMHtV
         GJordX+D+DcDDF3uFE7SmXUzOyNpgEl8jWuEGKtgMeQrGxGSTeh2UlGFV8sRZl9sMsHN
         81Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW8TZ0xEHQIIYcUR0V/PLmzIgI3MlFx2LO3s0VRYlkK7m/RBlILRHGKljz15pbcV2S8d+08YqVKE44QMCTg@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3mOmvybAV9dbynFuptGBUgk+YqScZF7ArxRT6r34jqAQOdHn
	LCV5RjoeCogwlEH/IiKBukyzXq/T4UJiOaKmjfyu/euWbVxRYjKofpeTLjQe1/v5uyi2VR13ogr
	QQ0Mlw/ALs8A05ZVpHsnE1i7Aq4AikA2FFELRurA24D0/PLwTSDn0AkOrIWeRLQh5Eqx/
X-Gm-Gg: AeBDieuiPwt70wf6EfG4zmvafUwuD7uavS1nJRW2yf8fguJfbWRhR3s6MimO8y1N7ZB
	U2T7WwYRerfcR/gKqFjX0nOZ/v1WQ6/2IJzJ4YhqdOCj8yGA5KFNnMb+grZd+v7qwHXOxWFQBKu
	dojTY8yTwsHrIdN1naAAGHbgZ1pF+sKY0y5JmWgwDHWVx6m+oeJIPjh8dvNrTjyTixAIf3cKIVz
	Z6XDP3+i4823YAlLjyaqBWNPpG/e8tAsQjeJUDKz8aAx2Uzu4NlpNJfJOSg+oUj+2ICTBndDl19
	PkpZjAvR5vX1N+3Zow8roN2aLa2dSSLECe0nyxjKJs5aMp0/5c0zPx4Ph5NjK0pw+P+DPGA7MX1
	6VDJ2nzPZVl465+EZpHpZ/8BNp9vfzSpkjlkbejBatsAFLcA7u9KWXwU=
X-Received: by 2002:a17:90a:dfc3:b0:35c:1695:24a0 with SMTP id 98e67ed59e1d1-35dd410bc07mr2599636a91.30.1775127181690;
        Thu, 02 Apr 2026 03:53:01 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:35c:1695:24a0 with SMTP id 98e67ed59e1d1-35dd410bc07mr2599620a91.30.1775127181212;
        Thu, 02 Apr 2026 03:53:01 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd368f538sm3464203a91.14.2026.04.02.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:53:00 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Date: Thu,  2 Apr 2026 16:22:53 +0530
Message-Id: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5NyBTYWx0ZWRfXwO7UIGsDhlVy
 95idyyUtqyM5qay2i/xhYry9GQZxMrGtzwWaXY+wmzSk1j+5nNTcloRjxwvWSauF3LPScqvebn2
 LeZByyiSlTidtDbyDrJ5Vie7GKBOymEfUma2CLFn6yc5JfJHnf89S7YRupvDMuB/tNo3oF9B2KW
 jDeXBf9/M9lTO+VCWqP7bpuybyoE0RNhW5LBNYGZILk+l8LT97YpYaFK1k2YaZmRKQg9AM33WLa
 aSguktsleECx8xYw6Spaog41aZ/cmj8gMDKekJ5b0HQUJZNVcF3bJBBW941smbmMSeMmh0QdHu8
 bl25FJCDD2J0wTfSkD9AvF7T3UPNS5T/v5poIK4H1ktIqox1xSzErBtOLxjXKWo53BEhXT6FeBJ
 r9GFvBy1eMmNUOLOXDuELy4qqkgBFERxXvA9gRZn1CO4gG8nXggYqYid/O2wpbeS3JJIjZQCYgQ
 gUTCIvc+Wj8+zML6X1Q==
X-Proofpoint-GUID: bP9MwQkfHTLXKJudLkNKyk3YkrwxGCg7
X-Proofpoint-ORIG-GUID: bP9MwQkfHTLXKJudLkNKyk3YkrwxGCg7
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce4a8f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HURNEOczjUzzROzEHuAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101530-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anup.kulkarni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3b:email,0.0.0.50:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52BE6387F55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Few CAN controllers, part of RTSS sub-system on LeMans, route
their RX signal through a I2C GPIO expander at address 0x3b.
RTSS subsystem is an MCU like sub-system on LeMans with independent
booting capability through OSPI interface and supports peripherals like
RGMII, CAN-FD, UART, I2C, SPI etc.

Describe this hardware wiring by configuring the expander GPIO 4 pin as
hog with output-high, asserting the selected line during boot.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..b8371bdf9933 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -615,6 +615,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1


