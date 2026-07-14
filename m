Return-Path: <linux-arm-msm+bounces-118964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rrrGMYncVWrquQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:51:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38065751A80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:51:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eyV4dXbm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jd01Tfc7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118964-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118964-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 110B3304B34A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12793EC2F6;
	Tue, 14 Jul 2026 06:51:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C383EB11B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:51:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011879; cv=none; b=Qt1Ssc7sLkqjruJeeXtq3jhz/StDrL0DPB7KCIFE2lbhAXU4LyVewpMlTmH5ORhQi3SGGJld3pI4SuhMIaBDVU2XuocskEeHEWnU34kGuXi/ZB75+62J1RCJhcVhHJ0kVel/P2dvDMVYu89MZPfaoe3S/khey2DikWEXZMQyXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011879; c=relaxed/simple;
	bh=Vh4n8Sgr5gNSfRglqpd18y6NIZg2YpujOU26V9Y4p/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sx19lW7exNIUR+3BDvtqvd9Qqf0NE7c7MW1TaIppXUWEeQkTMa+8wp7AuDYbq+CITWAVxCfhfab+TiUH8r/G5CHeHeY6br2nXIzKFTCEL4Yb96IOSe5AFv6FdZooANcQg6DULmc9DJAnw2+OMY1uMJ4R4U9LfLhceJbnPPvgw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyV4dXbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd01Tfc7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SfUP3954888
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aPPVXlUigs1L66dAlguIlM
	9pcFrkBinFiJScI7IqTjI=; b=eyV4dXbmhJiJHbMu2EvKSFAfH2UGbr5u7gC0Uu
	Iqks7j9FbGgYzxYgrT7BRqL9+ySU0Fs9T69xGX1bvkXcg/euM4c6CaIKAWUFlVdr
	MRtZvrAtypxqz17DkDjUCl9/Wg2HOM9N8XIzFuyqMFLIt7Cvb59yE7OKAcS8KLla
	wAxNJQCJWh7+emph5Y+/dtKff2ja51AaEtxtOIiajIoC4bi5OxHtslhmOtEiwU1u
	ff2T155LxlT+uCRBzoUqbbW2dgeN/CGKv48zYBCpN25W8OyZfGhT/W7tFtcbaESn
	jRG3It833EXy2nyZn+woNty9lclOyrsPJEZHaHBPSIfk8T1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtfms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:51:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so748828a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784011876; x=1784616676; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aPPVXlUigs1L66dAlguIlM9pcFrkBinFiJScI7IqTjI=;
        b=jd01Tfc7oIY02HjjvrWnVrL1pvLqxLO8b+ygGlK3dcKelTCRF01phnrCf8ibq79Lrw
         xToA1ZAPNPiuGs2AddLW36w3blnMz4LDoXKKhg3q9oTLw7IQe7hI1yxzkKpJ9rdOf0KB
         B5AaA9G8sOyDyN2EBFvRVzS5g0RNzVXmrEjwDFD2azTdlGLwHqUO3nwoHLdOOvlWedlv
         Vj7UkuWmnJROatwxkZBR/C+o3XqSbk1uiUKTWIW8QUfkp6bSnwavkIRfHS8DqVTG5tPs
         hTqTX/yHOFfcIC2CjmkuR8HkszEnrolW3+2btSNqM/MT2R2HeghYDRTu6D+J97rmV1d/
         1DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011876; x=1784616676;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aPPVXlUigs1L66dAlguIlM9pcFrkBinFiJScI7IqTjI=;
        b=Qy2oOTf7QyLGlBAr4EmTBCh4sM4b5mYPEeoh6OC8Ld/d/bPBooDouF9PMaWS+AJmLk
         4NzUAq1nO0noVtxLcBx238+Ylh67hdXdpbG99eJjnw7PZpebWRyMsenrwUP99hOw1Zrm
         W075U+m5KCTMrllMQv9zi2+G+nIw0ANVq1PNpx0kjkQwmSb+SSJsVJWF39FPn4MdeTPf
         2FkSu5snmSPLYidxz6JNSAJGEDupXLofGpAEac+A2MCauTNdYSp1PgeWjKAI9YO2QD0X
         LIEprTlVwN7nWLFjiHUvsR7IJ6+hvyjVpI91vh0Gm5psQahC3HNzchxwrIZ6pWtaY9gh
         nBfQ==
X-Gm-Message-State: AOJu0YxJN7GNCxDvEbPWdxCKL0iuFp+Xvl8Pg/WAE+8KJJ53wSo9VnpI
	VkV3KSpY2ShrNWlzeE0hrAFLyAnTfLcAbuua+NCqW/UJhI/6IOdvu3nGqM7KYzj6MZDZlKeqFqu
	JfJQeIgx7qzDTrNWNxiXJRf1iF3kHGQnEKvzkw2iy6RjPb599J1BKogpIl6rQMTpMFEaS
X-Gm-Gg: AfdE7clkiAQEahouNUfAkYwdgPj36i9DqW+lB+R4Sijd2chIhOIpity56Ydoi7I6jGu
	wzKVmyNsN6ontKTtI+HmnrOl7Ja5zv4XH+wp+0neYcvMkO0tvdWvU9FPwv1OMWC7b4MMyGr9lHQ
	rNVPBFbW8FwvGqmsFx8b+mAapz6XQ3bJ+dAq+3eWBNEAh9KW7RXqKIjkOv+F6aWYrvGQ5uf8HN0
	vSGphywbhIqzCmIh2WfMN5KD2sjgXx1rTnCJyXYsOlnKqHeZ9P37eNTPQEuLDoma5xomWQrgWuz
	N2+TOMKf0vIdFqj8oalll1vXfIKL31V5JCX5GXFbJg7shaYGTxY1KjBuzaTmVmHf3QUf/9Z5fSD
	AIW5l8EdCt82OfdZ3AL+9AMETMOJ+DlEQj3YV9brrGnDDpq86FAMdNQ5fj2YV+7NJMkR0koI7TA
	==
X-Received: by 2002:a17:90b:5545:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-38dc74d0274mr11602358a91.4.1784011876008;
        Mon, 13 Jul 2026 23:51:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5545:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-38dc74d0274mr11602317a91.4.1784011875567;
        Mon, 13 Jul 2026 23:51:15 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6ce6sm975368a91.1.2026.07.13.23.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:51:15 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:50:58 +0800
Subject: [PATCH] arm64: dts: qcom: glymur: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFLcVWoC/x3MQQqEMAxA0atI1gZqHarMVcRFbaIGHJVURRHvb
 pnlW/x/Q2QVjvDNblA+JMoyJxR5BmH088AolAzWWGeq4oOeCMMWduRNsV8Uh+n67YoUvKnJubL
 zFlK9Kvdy/s9N+zwvGMzPRWkAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011871; l=4057;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Vh4n8Sgr5gNSfRglqpd18y6NIZg2YpujOU26V9Y4p/k=;
 b=PK52gvgEvIJ5/lnI9jyXonvvwXscpjteGU/qKTx2vk13LplIX8uhC/K5hV7WRBdTvhIeFdR5X
 xs9ix6Xd8isAcMOqGgDhLsiscL/iN46TEs9yGS0YzTU/WgTvCTQFh53
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Dc_igy7tnX57Wvv79Ahm9GkLfFfqcFLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2OSBTYWx0ZWRfXxSVJfGUexT09
 t6I/0+rg12J+3d85AYOfqPcz2S+xaHo+AML1HTCzATylZTB4DKccIL8VoUnElFfoQf6PwAerLJ7
 jnuwf7xovGt1ePVdZELkxniNZTb8Dzh2JE7Dw/nvmSv/rxO6HnZ9WbNrLK9IUZSYqUDhEiPO7x4
 8efajRKbtrMvDHTNOYy6BrNeHGguuB9X1Ls05W0d688KEMqQN4M+oYjR8ManNYxpMJfQdc+OTjD
 3j2H4x0LhyJg2wgjaXrKUOHbEvT+uBde+JawYEDrE7RuuSq8ookOTAGTGAcMd8BoxUZ3zEjRSn7
 6x91MTRoEoPwX7AQORsUP2huqMEgsYxCsaTxvEtyM/WFLCZTyhDZgel3O01SDUWnWbky71UiNxJ
 GGEwNqzvfP5mTqknnIRDKA8HO11Mn0bdX+RhiCtCKj8/1bkBhhaJn/GVsCBmFhZY07KmNBsiViR
 r4IIEjWgtDm7XALVW0w==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55dc65 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IA447Ct8CvcyBBeIGyIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Dc_igy7tnX57Wvv79Ahm9GkLfFfqcFLw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2OSBTYWx0ZWRfX1oPPCsX7uXwW
 h31ZUzlZMj0ksxEAO2ZesLOnrM8CqybDU2/rh5oQHGgw5nBZjyfDgYWtTyxjCtcGUyeYqcNLadY
 vOKpBKqUKHU/cFwI6Fy/BMzmIMBlKA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38065751A80

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 152 +++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..5f5fab830efd 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6266,6 +6266,35 @@ rx-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,glymur-ctcu", "qcom,sa8775p-ctcu";
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
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm: stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6379,6 +6408,121 @@ funnel0_out: endpoint {
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
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
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
+			iommus = <&apps_smmu 0x00e0 0x0000>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
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
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
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
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
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
+			iommus = <&apps_smmu 0x0100 0x0000>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@1102c000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x1102c000 0x0 0x1000>;
@@ -7144,6 +7288,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-ctcu-etr-for-glymur-dca08d663ba2

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


