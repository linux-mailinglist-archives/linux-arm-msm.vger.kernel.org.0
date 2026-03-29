Return-Path: <linux-arm-msm+bounces-100634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F43NE9nyWm4xwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:54:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCD353722
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFCF03018598
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1153A3859FA;
	Sun, 29 Mar 2026 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QuYmbRvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffCZpHo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0534386577
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806794; cv=none; b=fU2rCzw5IdMO/m5cWfFYzH8MHebJ5pVD93rYyB4/TKzj9p3nCM9xTiyPIQYFwLOCO5oZ/r+QY/R93PiCRjtks9cdX1OOjfcQ/zqqIcxBnpvkhwv3TJBe0cq0U3uFppbAFVaYvaasjsDeceToo5TIdGGgMQvmMchAmqV1FdkZpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806794; c=relaxed/simple;
	bh=ODr+g8vdL7jPxZ/Q/ckZLQFp9txrNdD1+OU+x8VJWuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUit/0ONK7T4fDBuew+95SZhedRjLW+uTArujQwF2MkWlzJ32DapaWoYCIqqOY5mrGFEEZafB5kaEVrsnPkR0l2RaZ6zC2POyE8OK3LiPtOkwF7GdGUvmG+D2C0A6WfrGbCpgaa2kzR1mAzvKM2jtvEOixVp8NWXq/sSdbzcqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QuYmbRvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffCZpHo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhXCi865969
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=irGbC8e67Jw
	K9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=; b=QuYmbRvKz5MO7Fuc+a0NFS5DbEx
	KbqBDeW+rzDEZVXaPmXOrH5KKrxH/6wZqwEuCdg3Pf6EhxACzeByJqrNY+ub6HyC
	9pe2niCCIoaS+zEzTORS3q49T+hQrKPwflqu1VHDZaQthBCb3AIC5aWSxFgxTAkr
	FVKXDvpZRVy+xHuhLcuOlIMA1AT9kxDmqJiA8w6c9I4PUyyDg/aZyqbQMsmSOLst
	7GJKMtgZZ9KCbxLRY00rm5adhfYzBjvZ44nTl7ScTPewy1ewVAN4JO+TKUEGuqxN
	jHLftdCXMTNGcFo4ILw29S3sRqzx9qt3GuVFvbsGAWiVII1KjDqLVaFmmlw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hb8h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c0cbe0f64so10803034a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806792; x=1775411592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irGbC8e67JwK9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=;
        b=ffCZpHo5SPTmW8hKI1AmJF2ocp2Vky0Kgj2nSsRxxR8GcvBmcnMM+TXBrc/OFY123s
         tLMaioAAH07gewNZ6mu81pq9yp3e+IHnIrjZVegtULKEtBuNGbtjlZc/hrGNtb7OXs4j
         MpdUlqdmbgIg6H8s5PvhOaz5Hiukq8QqP/jqZAju4/znGfNoHj5nLVolWw2ND1f7HhSH
         kf1LSM7kbSuQz3h+bZNr+NXvK1TYBmoyI1KNMMs8LH31jbOrI/tknm7ndY2ea3zYiqn6
         ImEyH/HWZx+yXmb5yDsKxNPBvFihr8L8eLGmRQoXksJNh7/BSK0SoVQrmfw0n2tVhPxQ
         QFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806792; x=1775411592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irGbC8e67JwK9xD36bR/61Sw8Ivxtt3zJDyD8gAuLM4=;
        b=f/Vp8d6kz4i/z4tm7kUKJ7B0Oa7haZc0005lezVramv3KRBSO3VY7tOgRPbnfn9QD9
         4Gm068WibmplhvddN9wdUUSe1reY+yCM8Q8IqmiFw2wD7zj13psJmTdZvyiV4smvXlqR
         x3FmuPCZZ2NDKY1nB0ttpGWCFMPgcES5mqfpSt/pq4HLEl4DUCu+YKCSogl+I40216z9
         Wu620RrNtTddxhb9aoGQnch54en9VVprl0Ft16FHBUohQPcJvE4CJqsfzRUp2ho/3vjJ
         LppNYTIIpOURfu8FI8oxvtPssjpO780e04T81tNWggdvHcrLN+GMG8bQ8Z5DZOicMB2c
         EKLA==
X-Gm-Message-State: AOJu0Yz95z77DuZiBoWZfjGI8ze57RHGfFLL6QLzf3ZiDHL81/u0flao
	wtrqvUE/y+5ZsRe9MfJHXjTec5Ho9m3Pm49tkJTn0mv2UG2C9+SmGme5nyrJAL/WASY42fNAW9C
	wXvPbq5c8xfsESv2yhEsq3WF1dWPihlQu401EW1CcMjs/8xjwMGlzgPaiqx873rOAtaf7
X-Gm-Gg: ATEYQzxsAw4I1oi5tKa2el9i25W6PRrO0NevRWSrV4lmiMx7aSv2d34CsSSVsXEiR6M
	G5oTexH6jXVEH2k07YcAJufc1xWijF4QEY0hFF++KXvbBUhpK8klv+GeOvglEIRmK1m6uM/pubJ
	wUWNWlAnDwogOTGFz81Px2oRra2TMAy/fTzaHPW3+D3iB1aOa8iUZUVT2XpmY8WCmjLcAeTeyo9
	k/HC0J18VGR8qL/XjZOMsYbACDXTcQ/aSF71l6yKdEU97E2nVmwTivfDSrKRatYngl3ZKvp1IiM
	VMBoMN9reQN6GMOGBjB6+i8DJTMW1PfR/Ud8uRB4bfBR7E6DPCsxRt3qfWHx/iQyLkqXpnixmsI
	Mqk9aYBfdyuIR7HCiVDEUR36fMbt4Fw6Tjp8Vtko4RbcIVjaTkSZSlZKIHxY=
X-Received: by 2002:a05:6a20:914b:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-39c8787a81bmr10444191637.2.1774806792276;
        Sun, 29 Mar 2026 10:53:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:914b:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-39c8787a81bmr10444180637.2.1774806791818;
        Sun, 29 Mar 2026 10:53:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
Date: Sun, 29 Mar 2026 23:22:49 +0530
Message-Id: <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c96709 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xssyCF4TROwZkTjcOHoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX60de0sQgdo9s
 szB+FgNQpuwIknGtjto/B/qcOfS8GyqzG6LRsRJeUGf9ouFA3dposZZOGZgTbnfIun/NXV8TemR
 u43ojcOOR0u1fPnqBuDhM9bKTUh8wcAcPmE+3EZlgvKGB6KlWfhmhlFv1W8mTYbXqiAKk4k/NT5
 eGooIx+Rn8nj6hSjQGspeOl0artRmH5CeuC+LVSf9LQ7yqpKEC2gkLOkF5h0F98XzGxV3tJJqsQ
 xGgMNA3qFKOP93rWaIx2CbLcp3Q2BDT3rgdEIrlyzuHfTnDOIBGJKpEMVpA95xBJQIJ1F/zh+mx
 oclXz4+l27MdvJQ+asEdOFPmXBYiZZ1blokofEQWiDfarKy4HKJxQ4rXfBSlBmiP1DXuk/nJ27K
 Q1b73GtAYzpxUwrH1cYr01gWJ8r5/cukiPA0yNpe4Q/tIjVx6Kkxn5WguM70nGZnnBQqbamSPup
 2xxVL+y+a2puqiiO36g==
X-Proofpoint-ORIG-GUID: mQFLlan4emsUQh_tGz-rkFTMeDNYnAUE
X-Proofpoint-GUID: mQFLlan4emsUQh_tGz-rkFTMeDNYnAUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100634-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47BCD353722
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali QRD variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 6a7eb7f4050a..1929ea273a4f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -80,6 +80,11 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmih0108_e1_eusb2_repeater {
+		vdd18-supply = <&vreg_l15b_1p8>;
+		vdd3-supply = <&vreg_l5b_3p1>;
+	};
 };
 
 &apps_rsc {
@@ -821,3 +826,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1


