Return-Path: <linux-arm-msm+bounces-118984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u/viDePtVWrvwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4507522B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jX6dNk/F";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bDtsvu3U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118984-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118984-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48865301D75F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F363F0AA0;
	Tue, 14 Jul 2026 08:05:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD633EB80E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016351; cv=none; b=S0a+TBI04Q3WYkOueC7Z0+8xouKSROtVKilJJ5nP3uwOFfre8YsgX25BRvUepEc7Q88sAWHvN6ZvHe/HaSKlmhPhfR5DCUHqxnG79wOq+g63a78GDX+8da8W7YBnXw3QWWQGjYAIBCfPgcR/vOzD6Vgg+pxAV94HpApNaHNR4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016351; c=relaxed/simple;
	bh=0vCBMdkYAOlhZ2IrpZTkidKTy/r/g4NHUcgQ0bc9EKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u4OI7HX5vIOIzxrvuQsvWQxxCk20nkWuZDeG8jsIsfhh1zxnX+/87wRqMMcTtxNrwAbp6LGm0cZm8DwSzZ4MqAhmtroDTIr6Uy49jB6rVwLNN1AFBQEf9SeiluWHC8i4ONQsVsrzVWpijQG0n94IY2LPQFQUWoSel3Pz/AegL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX6dNk/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDtsvu3U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SQp13912687
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxGxbKSyYjsm4ASc3fnh7q
	cAoK3RjS4NFUqIPd0lMvA=; b=jX6dNk/FnIerA6eSsvGDchQqDU1/j1/Fgzq4EK
	RQM1IoPdqWu6UCwDWLV2DA4/5bD/pYKTT/4RZ8lOwkAm/tCep43GgAvuvWojAcEv
	qBNi2HGz/E2gRTm+lBxg1eWY29CvV21vCUg0FzOoHZHYRD/AXKrXuut0OFbLlcAu
	XHb4FORXmaOpB06PTWo4cV3FErf9cqhVTfTC4MIJbO0r40jBNrr1Igjj7/LGgeIu
	YVqepEy0YCoxmh8T+KW3RypI1II9mwgBXJBVpZ8bA2d8rYjA6q0ma7gBhbJxDcOW
	lf1xnQvZib2uYU7ZXjCNy0hIuB51tnLyLzqSH6FDu+s0riwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4gnsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae455cf6dso57213635ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016348; x=1784621148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxGxbKSyYjsm4ASc3fnh7qcAoK3RjS4NFUqIPd0lMvA=;
        b=bDtsvu3UUPD8phKAR6pPuYNkzQ4b4I2a8RroQ5MNmn7pVt/Y5KuY6lFCD8832vxmSc
         SwF19mMN/KebfgC8RzgfKUJAq/GqbjtkvNnMByiNp+rnRwPQCsoKWKNgQFt4OenOKNxY
         shkSxBdjA0cICNlaUNMDoFkwcQCkS8DGzXIMDKjr9dVdUaGZl/oaGUSApVMIoQu7iW2/
         kaOal8c5dw1kJ9xQu1YfHP/qilZlFi0TxMIlxS//FM2KNmwNp5FbdKiHZ7LABi5LRblV
         DRpRqFkshg/Ix9NJnylfzz6LB8OQQmpC458vlg/5g8L/yhRfB3/FKM0tWZWexwjBDqvR
         aGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016348; x=1784621148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxGxbKSyYjsm4ASc3fnh7qcAoK3RjS4NFUqIPd0lMvA=;
        b=E76asogTlT9dbOHWiOE08x8IOLWJWFXeBAocqp5EhoVgMnDQ29kD5PY9ua4bzo/0I9
         Jr84Sf20AG4o+R4Kr9+yYwhinEAmIQLo9o3Fhm0IBa9ljwOZunm4/lV4TDZvuzJP8yEp
         s7qxKTF2zt5Ced/T7kMIkhag50F7GbKMRJvXiC+gwnN5uGRcRlykKuZS9NPMqeFkeH2d
         eDBfPRQJx6sncMc7OzHJLm1d9YY1/uO/yojgRa0cQMui0PBufGnxb6PSDUjnLBwoU4Gr
         AobnexjR83fNV/pPzY7HfTB0s7hM+0Cpzz1OnGtoLwddhmDnsQBSbQNvRSpuUKw11yUa
         h/pg==
X-Gm-Message-State: AOJu0Yy9FwnntnOphXEYaOuJD44agYd5CHKHir3jKtiTTHakffaWHjxu
	baWYAZew+4ktFDffHRddXWIN+86l/kf0/roo8FyD67F/ItHEuKICmvtwEdt5Cy6T4yN/Cp2/vPO
	+NaxbdrXHLIAgxx5QBIUqsoNfuzvBSHZIGJ15ee2qhD1P0G0RrLH4KJ/AZ7ILW6Cy6Ul8
X-Gm-Gg: AfdE7cnScLRyrzadIbw+KU7OFKjR8aRn70k5vIZMEX+ENyH/59+Lhe/OMZeC+Z7TMBa
	HcbqPBF/HwJIfytgRrdO8WERfXIDC1QTx9cFxekjOm3e7TAkRU0v6T0MMBn41XdRMmy4tqghDo5
	xLiIhoTFE6PW4eLURQ36wCJID0mgmKYJa+8GI7ilJIUlkW9mS7V6EBotPkwYm6eJBCom/w0nk9x
	TJRhwEDgzqLNkxUq1bBwOOn5INgpqS/e/llizMo0vEk6t282nGrubxV7VtezsHM9yFlF0hGYwKf
	B/fewppmyLuIocz/1OAWyWQ4baLpFHkuDpDX0bumQa1J6Ad6tBO2v0F1ryu/+8hu8uQfmwYSGk7
	KWguJzOpfJ6XW8cNMXvWIP2xM1osLPjqC0NxbPNGuAn41YXvErtSlk116Dk6vXmHGFehBdpw41g
	==
X-Received: by 2002:a17:902:c950:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2ce9f052b0bmr124254605ad.24.1784016347690;
        Tue, 14 Jul 2026 01:05:47 -0700 (PDT)
X-Received: by 2002:a17:902:c950:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2ce9f052b0bmr124254345ad.24.1784016347131;
        Tue, 14 Jul 2026 01:05:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea74sm112259425ad.41.2026.07.14.01.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:05:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:05:29 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMntVWoC/x3MQQqEMAwAwK9Izga0iNX9yuIhtlGDUiXtLoL4d
 4vHucwFkVU4wqe4QPkvUfaQUZcFuIXCzCg+G0xl2srWDZL3yEnRJffDaVdciQIdtAn2RO1oemt
 t5yAHh/Ik55t/h/t+APCjUwtsAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784016343; l=4651;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0vCBMdkYAOlhZ2IrpZTkidKTy/r/g4NHUcgQ0bc9EKc=;
 b=uvitfdh3/RzwHNC6N1xw9SH9Khw/wWOyK34qdpGeDe4u/o7h7BxvDtcmNAXr4u6Ew9sfruB6O
 TsS/DOaQ+n9B9JufAP7ghGPILeg1HlFo4JjAgj9r6ukEWajYOZRwI5y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: L9JdnGx15TAgRuBWv8fet5aXGhWaiUmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX+fOTxJRGGH6b
 uGQAA6VgIWOFCTcDhoL7Ay5/o4itwD/KHKcwgyREio6UIDC52ROFV28GR95bOQmMwZpFpkA9IKG
 18+8rTNfwIxyN+ygvTf0n9SmP8c8fQkwYFkrAqWM0kjGJjSciYkLwHc75DhImMVbcfBBAQbTgny
 3l2mbHHj3GEIbWKguCErXb3q96Y+zOCvH5CSXi8+J3PjpUGOVfl3QPf11ujmO239UzQ0/fUBxQX
 sz9lyVftMuq08f1Hm30XOBd2pPgOlzXFbrvZjVGePQkw9Rlt+8jRwbLR79rg1FfK+JTb2lKkxSR
 WQARgOlFbF3tffl/RT52E2oay0VCJxzRjlMlIHNpaR+elIIJPPrXGJa2A/4ydIXkDJfGTvVy2wc
 mDSbj+iavURaPHRDayVRrBxOnOOTMoMs2vd4sPSPlRC3b31Z+5xpYuqb8MDNZzI+9Op3AxzfUgU
 iXSD7qvmGYLDdm6PmXQ==
X-Proofpoint-GUID: L9JdnGx15TAgRuBWv8fet5aXGhWaiUmu
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55eddc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX/ONGVXJWrOhI
 gWhP8CAs7dEfUz/cDt0U5R73y0V7goN2OAhEzHMkWpsr/ZK1jMOzPPNsGDzuTlgBgNQ7y5IBRa8
 3Wi8Vd59awu9i3F+bNiugMm/npxCP7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118984-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC4507522B1

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 176 ++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0bf664cd4b40..07a0b00dfb62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4984,6 +4984,35 @@ card-detect-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,kaanapali-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&tmc_etr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&tmc_etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -5123,6 +5152,121 @@ funnel_in0_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&replicator_swao_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_qdss_out: endpoint {
+						remote-endpoint = <&replicator_etr_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x04e0 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator_etr_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_etr_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_etr_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_etr_out1: endpoint {
+						remote-endpoint = <&tmc_etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x0500 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr1_in: endpoint {
+						remote-endpoint = <&replicator_etr_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@11000000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x11000000 0x0 0x1000>;
@@ -5937,6 +6081,38 @@ tmc_etf_in: endpoint {
 					};
 				};
 			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_swao_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11306000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11306000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_swao_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+			};
 		};
 
 		tpda@11308000 {

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-etr-ctcu-for-kaanapali-9aa6b297778c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


