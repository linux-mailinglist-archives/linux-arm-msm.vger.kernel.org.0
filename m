Return-Path: <linux-arm-msm+bounces-101990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAEADPvx02lxoQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:48:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F03A5E48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1855B304809D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 17:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9F392C3D;
	Mon,  6 Apr 2026 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQOQcRXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOmUr3RW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2B38D008
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497601; cv=none; b=QUINHNvnLuXVIDLDy70/mBbWeM4K4uM7CqVF5MLgJzKrUrwRvze8RkKv1htD+xYIywThxVDY/jEZKzkqICIkTlYHD0OJ2HA5Th6amBKrKBEonsA06KXZkZZWe0iZ7SJUVKVBaqjTD8Jeoec+5RnkPqqO7do42CoOz76vwquMTNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497601; c=relaxed/simple;
	bh=4fiNNq/Emf8/pIwO2FmC9gxHuXnHVSbaafeVigMF7fM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8C3DsHpy+Kao5sMKpgxHlPaDCKlCY7R/QM7q6Nk4U46KUWLW1tw2SMTCTEuOA9iMiDsuZ3DPXKyTL8zsn0NpwROCMN08fJh0sI/vvCu2NSSzGzFwip7SDofkC3cHo2RwyGmcV6DbjJJOs2ofy2G4SITYs6DU8wUzNNNmMJiPMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQOQcRXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOmUr3RW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636F0nU2582094
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 17:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yoboWPPRyhP
	B0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=; b=cQOQcRXSQFE3nDBmBrKsamhCv7i
	yVpoJH5hpmrH8x0DTIeJwVuuKQUeRr2SlPfF54ZveXDdh1Rk2uW2uqtSDWKkodXZ
	f9MhgPM1AFJie1Gq6zK3HTrxys1g+78WtxgJM+fY5eJTyUwst0tjhkpEW9/JU3dA
	P1NQ7VSDjwVoBmRoyIBTz08oATBudBhciyxyPWuJONHb+osd5uXpV2hBa0wnzi3q
	n7luvkoHBka4zmiX7YjCRcafibCmHsm12XupE6uY+XLfk6Rd+kfzLSMzFsX1hinl
	eUsPuC/X6f7ilUyZ0bIgvojoxyaO1yG/BR0QnfAh2cTlkq5j4WSU1r6ucZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf3r0hyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 17:46:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso2856205b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497597; x=1776102397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoboWPPRyhPB0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=;
        b=kOmUr3RWFwdGKj7EsoOiDIBhEYNUo7+bnNMpSNRFNHPz9YOMh0r3MdXmKG3UDhNHdq
         vVc5c4BV6skDND/3mgT52w2L3Dajx9PtnJ1n6iG8DH8KOgaSG+04jqEiLF05qR3vDVsO
         BxaY3XwXS5k9WF8UDef2WywpDYwuqm1c0lWyuFKbSCPIU4YcUsPUu/WKWKBRl9yjyx3z
         tWqIRKqrdL8gSNwbpR3n1NoW/gTlccikIhcIFWbX11QEmHRUz9Pi+PwdFh4J+cUtryDH
         q1MSu/d/H0eG3SKESWPgWpqNNBuHOfdewM4fXRoDdOqc6FVTI7oGYAY6vXKpWi9UJUQV
         FYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497597; x=1776102397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoboWPPRyhPB0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=;
        b=egeEFaXDmvD4V5z7c6IF7sIwLCki+clKYAn5Z/zwqyQcwYhWsJ36NYJljqSBmbtJqu
         eSa5Slm5GdEEfZ2BJKdQ5DHvn+x6+NS5juK55u3ZFa4GZ7bYB2OiHklTovj7mtWAnb0O
         bX33U5sEi/S28ezWeZQmgGT7znGSbJeYAH/+lY0k1bPWCDLecf+59N/myDTreOrURvYb
         2GzcMXtWLX+tNjh4XY1ngCVYgs0e1ZI/Lb0TRy4dVmwSn8DnBdbujvZgdwQvjcQ+d6F3
         b6dW4LW9WBH83EvyhHZ+hMl9U5ztPmGsEFvy136W6AWgUJuzeC6Qi/s/2HNy66Wr2AJ2
         h+kg==
X-Gm-Message-State: AOJu0YwqQ4Wz+jZjIFJV3qybosb3mAa27r3kxaCjLXlKz/u4S+X6Ol4l
	9h6dEpvN7q9H+rJ+9fRTuo7BeMAHaKvq3Dz2I3afqLG70HWbLMlI4TjFq/glahSw6SICiaDUTRD
	Oj4KYcegcGbOwV6EBW68XJXGzD7u/D0tLCH08JDcbD9BXGSJv1pyQhRTVeOasRLOLrk4OcMAmcQ
	YN
X-Gm-Gg: AeBDietfqufRDiRTBdGWvN7qoihMLdOA4bsQ3FnQz4auM0UDXYxGUpI0NJPn1QCppCY
	2WYY5Jtq3c7mhjgoU4XGuuGv0dY9K+Npeawo0D1FXpDXMsnwOOS/C2XVmRv6LGlFXV0by8yFKKM
	SUio8JrzTQN3RV/0gNVjGDAZpEyUXafqOICgFzaB/GysJQ1fwo78PppMW+Em/qQTeCIs2b5aeob
	JL7P6eyvZ6cBgUUtOetKQ+LCYwa1w1iSVg9OPi0LHyYcV2c8qQjK56iAUITmMOW0ueniXfeqnPz
	HoOilCp3s+9GITT58z0wOXqXGCRruLLoRvPmePxjbdzuR/lQ5xl1icsF6mHRWmbWHsEevv7Qyfu
	nrXPzZ7+C+nOxj5zzJC6lhVjjOGCJwzyps62nTl848I8jyyo3XZvm+AMNlEw=
X-Received: by 2002:a05:6a00:1250:b0:82c:daa4:ce30 with SMTP id d2e1a72fcca58-82d0db72ea4mr12253270b3a.30.1775497597059;
        Mon, 06 Apr 2026 10:46:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1250:b0:82c:daa4:ce30 with SMTP id d2e1a72fcca58-82d0db72ea4mr12253228b3a.30.1775497596515;
        Mon, 06 Apr 2026 10:46:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:36 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
Date: Mon,  6 Apr 2026 23:16:13 +0530
Message-Id: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mE1EoyZQ8oeWRX6hmrWuLa37ZmO7i9E8
X-Authority-Analysis: v=2.4 cv=Us9u9uwB c=1 sm=1 tr=0 ts=69d3f17e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xssyCF4TROwZkTjcOHoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX3j5B2AILGn/d
 aVMyUFuUV7DPQ+idNqJgx2lZvtNwge1Ete/1hYC1QUi+CQTwCn7JkIiP9HkydYE6pYThRO78h1W
 3LW3VBqWqGEMFI/C5yt6Zb+9u+gdPTp9pbaWx6OsO6ILessEfVR+fk9VEAVkKqRgL3NvYgPrVHb
 R4rvwcjyJb1trZdYLQqnWvCP9FfhmVV7hOWnjdyApoTPWAvFASBwQkFje/00DL0D7g8/5JCkeTJ
 wmbpd9eVfTTCU5/cfxVIhPfITo+wvUozmMHZuyTcA9qbRXEC7ncNbkt4QFVdhOOnAX53z/DwaEO
 tdLBXBATdXfAp0TtYBK4HWLSu4V+PODWYPJG8Re7YIWE7Rl+62hjXD4CWSHxgxU+q7cbcb33nZf
 L2RpBAGyQv9u2eOVP+N49b5fln2VbMoyWwIkbKA5cRHufygL2HUYMTapDDjapkeqQ05o2HXDXQg
 ChNxnj/kKuxEiyWCZlg==
X-Proofpoint-GUID: mE1EoyZQ8oeWRX6hmrWuLa37ZmO7i9E8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.3:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 927F03A5E48
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
index da0e8f9091c3..55d02219ef4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -744,6 +744,11 @@ led@3 {
 	};
 };
 
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 
@@ -816,3 +821,25 @@ &ufs_mem_phy {
 
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


