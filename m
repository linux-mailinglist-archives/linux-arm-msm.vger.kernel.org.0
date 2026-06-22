Return-Path: <linux-arm-msm+bounces-113925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qU/BFbPEOGpNhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:14:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC896ACB2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:14:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B3nUAXpx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZnV75WMM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 902CA30234D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDDF35DA6D;
	Mon, 22 Jun 2026 05:11:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D735E1C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105104; cv=none; b=mgZk1oOF0bVeKx59fFFTuS0s+/L+Cy5SPxpgxZRYB9rEIyGFnG7dqKci+EhCS8dE20tYPbG83nUfESLdLQKt/rx78e4bUcrxJ5C0iKJENiZYgL897pIby7vZE35nuZ5YOnbWUjtL3gRw5ktYO5DgRhCghuCaThSqx2nr6QVyAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105104; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvY+/7Qaq9owG86exd2hlgOGQByfQPn08lF1J5SHwSOF/TJVq02N7epTYGgv4j08wV6+bbtC/n5LbnwW34vnwojjTkOQGQiM57IM78bgoQT1teAEhbMfHzzsUby74znpZg431K2Sm0EeI/peefagu8y/t71v6GZPBYBOSDC2vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3nUAXpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnV75WMM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59WSP3880864
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=B3nUAXpxydDkHzpj
	RpCvPkge1uhUj7xpIHU1B0XRIhW3oMEwZ6O4lE21BuGpeTjMejldgEjQiZPvqtgP
	zDasn0O3wV96sOiHamKhME0i2ypK+uv7Ga3smZmcVeLJch1SbeCfAV44pJIZ0e7S
	q10rzDvqRpdJ0ZJjphaHS1eA/V75cHIp4gUtzk/lOFq6aqRlIVYX8NromM3zRThY
	fXHHnN4L7wTJkzxU8MId0Iehe6WeQrBd8MfUcOJU2ofBZ0Qywlv9n7YAGGAGr06G
	Dr4HT4b1zb2Qt0C+Xeqt3gHS0Etsnicc110LFBc4jOXKakxye7QqP01AKiP5eCVR
	oW1fVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjed2ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2422135eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105101; x=1782709901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=ZnV75WMMNcEP+sGF+KDMhLHMRZQJKmtsd6oXkZ2hm+S/9pZdy5sanJEmMBtokBkwEM
         0Dk6/X5dnHvJr40HMA0cTxu8yKEsxzuf7s7G9NVTQd689bS+tbT9smIwfPDjv1rl3eeV
         iN460HzahuEoKSaKepPGj++FW0JZTcW1Ic6d0/aPCSBpz4RTNQlhnhlBUBblMqCDDvPP
         NfYiQ5U0WdN/FblpkLJUhWaVNkmkVIBzO09lfNDVwkpm+4m+pN6itgIDXfNw4eAPw4t0
         G8WoAcyCf0MiKoEgCRb0iGYyorCkwQlpHJZiP5ZmuLjFsX3gx+DKC2BD+3LPScq3Ijil
         OtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105101; x=1782709901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=k88DLKv148IXxppAAWtpAyjZwoXMtNBtZ3aJR/WovFaEfPUIbizHrKuXR3nrzOVgH9
         I0ssDNDzMcvFvyXBiQeiusmlh/G76s3K2XYzoebioojmV9Y+SeIltky0tpl1wCWoP8ev
         Rc6lG3jHru56UrEHRa2sZAM+Xdb25OjWpDcrWtzB/N6kitRpi7IhFRAkiQlGvcVPU0Xd
         w56Sp2sdwNBfcG/mNkLkhpVa+Mz4lX9vL9k6bnNIrof7sQ3y9984OaSIUAfnho8kefP5
         HdqD5EqKwhRBCoe5jWKrE6UOqtIyZZ+VrrWMjd/nF1cth/FVS5ZH6le0aHS7LAN15mbY
         nhmg==
X-Gm-Message-State: AOJu0Yw1iv7VEto9d5BY1aMM0LEOaTI8as16r2PD1wGvUlvlLdiXGKl6
	C2aCoRaYcZwXwkagt3OG8Fo2TJwV/E0k9Ph2KTEQkljEoP+zv3+YKelgDwl1H1E9Ykpma1rE6KS
	sGMp/iqFkiYJDkJII1DzHPq14X7E4gvd3HUpANzLtwZi6T4RL2Fe3mUoA1dsdAkQSsVV/
X-Gm-Gg: AfdE7clXIwGZ1Nxr2MiAqXFUb+8J7tZqYnTwXm6p7nc2iMjBhDXFAYJHvwfJ0LwdbLp
	+GRJu0uB7W0ECA2eyAzJ/kC/FLCm+J3qhMOWM/UokkPmQOo3gJNp0pKajQjNP4QaqnmeuiIOO8c
	6WH38DX01Yb2WFTt4UC9PcNNw5uQSBaS3oeKOYuhjuL4C8bL99ysM86b2XXjfiCpwMX/293sbna
	3HjZrj5t0uDs0yYEpQJxlAj//4MlRzSUVpTxVruWQpM65gaSeChcfSwztks6OKCDDZFVzGRN7nN
	l9t+3/CTA1WqYz8M0aPnAw/sVgrb7MCI2zha/bn9v9KH1JcFi6qepB33cKpKvlFTbLlbnspGDgf
	wuLjcaZyz8s0lP045rCXWHGJYFM6KzM1+/N39UCvckx8cTdnZcgi9ohhNHw==
X-Received: by 2002:a05:7300:4312:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c0cd3d93cmr7984340eec.4.1782105101387;
        Sun, 21 Jun 2026 22:11:41 -0700 (PDT)
X-Received: by 2002:a05:7300:4312:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c0cd3d93cmr7984313eec.4.1782105100879;
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:30 -0700
Subject: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=o8zhv90rMwkk5gvr1tqt+A1b/RfYAUkUASnkVqcALhDSLOzedDXOtf4lsXoasOHu251v7vjky
 9QGVIcTEt39ANOBxAprxOiFrwOdVShbXn0CnWXDO2x4I02M74r0htz9
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: -OiNcXeOGJNuaZkOQ9UDrOP38_WP3Lr5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX20nBGLKSKbAh
 1R2TVhPlnS/x2P8+HOZbcy/02FapMQCzKZnRyhIe27iDiqkVCNBRBEh3qlnnhjSehikWKxGdJs1
 I4JXgUYWa34miPjQqFXWPuUkZhVkXCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX4++pZ4x/A8R1
 2uFaTsRQYFvQuISqcJrOuWEn3BTS6j4uCg145oWb7GVw8RdCURr7vxgpg40PoPAqoN9jo4EG+Aw
 G0wt1roZimKc12PKySH6dzO5t8CbjFaw9DxJ6YSWbk9Hs7OSrBseoN2/E6yL8DFzdUONo6qTsWs
 JAM5w3uoXBihD6xa4KdMNGRZbf/iCiavzf/W26+tXaQBG6dGYayHOIkVfNewUvMfx4QkP9w2UX2
 jv2wNL7a+87bSfryuCeDKsut0InwD3FRsQRx9mLaktmaDHidP9O0I8yOWO/l2ptKhh+C2hiqCGR
 1MpSpq1lMGqm0w6eNEsqKo4InQ2+fE1xRe/W2+pGl7XpR8GNMUyKIzIYRRt1ZhHG20jsm9Tx32H
 NaWwtT9w495XpoeQw8gX54c7ZkjXpjm0dw0ugjOxv64anxqgHVF/XyhcRuY+kMuTfS9a4zgWBGZ
 jNBWTMW5+tav4r573qQ==
X-Proofpoint-GUID: -OiNcXeOGJNuaZkOQ9UDrOP38_WP3Lr5
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a38c40e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCC896ACB2E

Mahua has a different PCIe QREF topology from glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies for the PCIe clkref paths on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..8b42f5174b31 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,18 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..eb45adc8a0a2 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -286,6 +286,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


