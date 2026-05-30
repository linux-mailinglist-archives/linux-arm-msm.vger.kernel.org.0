Return-Path: <linux-arm-msm+bounces-110409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OExwEJAtG2pa/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:33:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B824D611FA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DFC93102AB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67343C5835;
	Sat, 30 May 2026 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHgIef0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPRsA6js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F73C2B80
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165720; cv=none; b=pghx2shC3hkOr37XNf41gO+W2QNpbH/8t/wiP+HBN6xKyKGcJkR/c0kN9PzQuBKQQySHHdezDPRoaoSVdntbDJeBzTsbgBEnemAamyNQPzEnn6Ae+h71HRPnTgw64msQBLWAmrTGeUa74uSbhMjn42OB7Gt52WhABagqYWDJqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165720; c=relaxed/simple;
	bh=O0ITinEiBDoqyNtfUbyM/puvl4+BRtjPN1CGKUba4DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoZP/xg4gUtYCJGSrYQKIAEXXVjtoIIA7I6dVrNAiCE8++HqpvWjRt8juw8rNiqhQmcsNYIIxPWbleN8of7/Vf8bCCmyk1bhF7RzmRDkTjgFYBggop5FMxwEs2eg0ZIqDkvYa/QgFfpCNf4c/gpFyzy8u8CNSUIZm5WqhZPHLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHgIef0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPRsA6js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UGhA4Y3635675
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=; b=dHgIef0qJ0ao9xb2
	I8wRr9pKXlFy/pwzyoWOt0Wg8YEi3RROYYxN69szm0eEgLsYTlrnZYNla7UOOuB2
	Dv+6JywuMacAR8/jnx73/EG1SrPebVeqWg3jC4FfyYDLcpLavfly2EROb8/6sKrB
	mODw8lEhBzU1pyvQB2Nrk4cQfjka5H4jSDfqinGRIW1EdK18fHCsBnjP9yMZrFzp
	JNznWyN2AYFYE044+ME0cUe9u+4DAT0ztXoDFggYQHy6LkaWT+3Hro0JbtBKkPo6
	wwtl4BQfijbEV9Z54QLzWFF+PryWzp54vUna+GfyhOudnS1an1v+HDZrFs5yLvL+
	Yg0H4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2h9jpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf0d79d41eso19969965ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165718; x=1780770518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=MPRsA6jsJwN7ezEg1C9rMUesoewPRg1kBUnKaRaSgPM9+GU+6rUafFj1M3tZXBoMfC
         58roQ/+uJBwBF88Slj7xKsiJOvkJdyILywaL0k371KXs5weXlAii9rkAAi3XrKXYkmnA
         yH5UMIrYOirlmJ5knzdULYT7jB9HxpbHL4Uf6u5dKS9E9oG6dibY8AJ+dUPTnLQGu+vc
         eVstQsBGv26qaoWyf0aTKXMRTd4o3QW8V0hKZufjeZcBkhwIDvejrZZO9kmHdJq0Cntn
         vMMbNkPa4Deqmhh4D7yRaXFk/yFcAEZ6cC/WXcWpZlDAY9pDdohKLs5kVZ/SH19XaQF1
         CCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165718; x=1780770518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=GyrZxYwoAOAAK7R6joJmFUINiDJ5b3hN18FyiaTlBQ7j1yQT3GpqFzmR3UHwMR9SMy
         kP5y2+u+n6K9WplO4TmD4Au+AfafkdFXcjEToN2DboY5WqLSXL07fhUqhZezOHii24nM
         v3FO26/AMbp/vqK4c31gBIrWf0wy9l8r6Ev0xoxkbAmFOFi5mjpbSjUXOWVM0PouNJOx
         FXDBUdQ/yoQoCOmvlcJNUizQX4kJrlrTcvJ1sdueNEQojhv4WV3gQankXyU4zFHjohBX
         vzXG0n24Lmt0oHxHqE0Fipy9u0WpHsQiXbM81Rqtjy9xO8zGcqcBGCv3xzMpc//8U2UE
         r83A==
X-Gm-Message-State: AOJu0Yx61A747yo/vJuzvwf+9c5yQzkoCiZWm8ch78QdCvwm4pBhQq66
	C+OowHdzuFeR1f3O2egdnFqe+CMV7aJ5+T2AUHRK+qJg25YhA7wph/C/fuR+mk1JDGepw8snTJP
	zAg2LClE6GBOSXsoI6vWlUn+zqFGTv1MZia7nvGjMGf3Arpqhl0y4i3v6z83wc0bPhDF9
X-Gm-Gg: Acq92OHjTiH6ON1GFVyJbKOjoTFjBnK12NSbwl5JGFWlmvp+2iks+wAEuEsPow9gjtB
	FPUE9PhMQXg/VTB9N44HRiqpfSjXCiS2lqFTx9l+aSgEbF7ojhqtv7oovJNb7EglO160GHF7YU3
	Pf+m4mUpL4iokAhUB0llFde9v4ODUVBCWLnlUDO4H37lT8FqkJR7mKAWCvO0bip2ZzubIL0kygZ
	KN7vUN307Tc1oO3aHdrx9r6dMK4uHd0a7vkpWNiHDE3sHmFaEuK7be8oydab3eYGhZZCeAJS/40
	aQH6TF5FNEw4v1MfEZA8kjW7uN64m8F+WZu2DNOJOfIQpKwmbIFljbU5Mgat/ThU3MlAEC/7/sY
	kDCA025FrqqKEhYGknC52/zfvhHyz/DTKM4ISZnAN19VncpM=
X-Received: by 2002:a17:903:380d:b0:2bf:343e:731c with SMTP id d9443c01a7336-2bf367c0d68mr55836635ad.10.1780165718239;
        Sat, 30 May 2026 11:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:380d:b0:2bf:343e:731c with SMTP id d9443c01a7336-2bf367c0d68mr55836275ad.10.1780165717752;
        Sat, 30 May 2026 11:28:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:26 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-8-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=2571;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jZ5sk6mDCOuUmvLcAvbMml5Kmz0BhTO2YLQnfm6VPW0=;
 b=PbFIyNvoBdBIOscCpaSJwnHPwIZ7/VErt4P/TvuWXAVL7yjduiICUyX9woCSpVGUs4zKGSRoQ
 wUI9WC+gqh1DxR94QUJTAmiiTmY9BbNN8XmtiEtKX7/M7550LwbHgQp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX9aXdANxlf5jU
 mhKgp8fiQyupFiwi9S6YRCRberqsyHftSI6wlPqc3GZljf1TqFcUl1sOdn2elz1qIgM6nFon56W
 PMJgPKuns14qnn6q1DOzb+lA9ohj0Doq73TtQjT+6W3/DH40SQazOMtemfBAT3VSbVPGnvBu1ls
 1J5n5d7c5F7UB/s/iNQ9Rx9vEwJmUhYmz7YVpzz6uiidsuk7o86DFhkifzDxjQ+CjhQaYRyDeR7
 MlCYDPZ5dtSvOvDZjgKiFaXYAfr0l8qwoW+BGpfVm7J9MwvfGSW/HamRpv78DqoaohfsYEqluEx
 jB9LoHqesiQtkhWGDfPm46ccRnHKza7f94Xwd7sHuDzbBSn9q+jX1BdQk0Doset/tp/Bc6b+mPd
 MnM1WC0skBJ2tyEbr+YGQcuciLkhfhPLmYSK97bGf0OeqQWcWIL4cmhrPGMy3685W2L1YQYQCiN
 bAwsalu3IMgqB3pYydg==
X-Proofpoint-ORIG-GUID: wSnnpfjTM6eR9Ik6x5buRK88_ad-sEQn
X-Proofpoint-GUID: wSnnpfjTM6eR9Ik6x5buRK88_ad-sEQn
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1b2c56 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110409-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B824D611FA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1


