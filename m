Return-Path: <linux-arm-msm+bounces-110754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJw5HtuQHmodlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E697562A4F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0658309514E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32AF3C4B60;
	Tue,  2 Jun 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEHxGiEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbKWjzG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A13C554B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387712; cv=none; b=ntYrkcpFZSxujYxgYgEejulQrVaYPOPKn78SDOM2MMGGCw5BKqyERlcIrEnZ8uqUzP94W7QxTj0LGRxLM3c0ihGT2C8xQZ4+RCHZgS7lDNENFV8LkDHCod9qvIxddSzZk9QrG5U8E/+LwLSOTBQIHQgwzRTyxe3kbgsr++uRHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387712; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WweXvtjNjh8tvntYFCXmM+UhoC/aEd7fEuKymgym8MxYhL2WfnVFdN7PX9GDuVI45RIw1tXjgO0NGI6gfU23duKmlmIKi6nsAMmu0E+C3xjktuDMPj0wu63tdajOttOMZnTvGnFMxie3fA5LmRNRk58e7lXQ4DKfTM15Qv/G6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEHxGiEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbKWjzG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tX9f4012412
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=cEHxGiEcIEpxkwDM
	HokAmkEm/wRdydnNJ8fAKbhbWTdPsErnY6i7IInjtI5h2TCyq8aaqCHbJ4m6EBPQ
	ApGNtLKBTFMnX3lDB4iG5uIHl3kzAQcLcCaGNnQW0jEO66sgk9SQq93jJZ5Ritom
	RtDJhVjpo+tk7GzTTDUy0+oDhmTdx6bP6Pgtu0CSULj6xMjnIGVDG50DF9ht6LYt
	3BNSQAKnpgifZjE5/YNl3QRUw2dGJzVPKKysSSXtp9Vz6OoE6LbxUey8b4QtP9S2
	xPJGnLYIUCYyoa64tzohT1c5dhniyrlOolHiV5Z516/AxAvrg524IjL0qORqnsiU
	9okyrA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4ghjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:08:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137dd516985so3800668c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387707; x=1780992507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=NbKWjzG/YqVaTTHaSNHO2z8XBKyx0vrn9ipT0Hs97zvNBOo4p8v1xNSGKXNM/L0dgr
         TckjYDNsmu4y6KYYyQKMEfPioH49yHylenkfDP0e8ph9HECma/6XDwXOxbYzsuO3ZqXh
         1eLR8QtRnUZY1MEa6j8ODUEXpG6loX56KEzdtqFEwBNrQsBjpBn/aV0HzdIvF7EJXAFV
         xiEyhDnjtshdjERcagKa0TkqMOPq752IweR3sdmnU/qBn65ivLYzMq9JrmeKDZZCPaD3
         Oi/v1IXYqAEZfbYIVig/sp0NuPGfnJQ9Ei04bhNZIXP31YO2VWFRIT+d2Vclb3TOPs4e
         t29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387707; x=1780992507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=QxxcHDyuz9XEtIOmVBH6Ne+BOWo0xwOyRgZb5xO+zm4iObxw09BFUk1W1DxKn2//Z7
         yUeFFpSHkO2GwDeQtX0lBP+sAqRIYzqMpaj43p0asG9BuOckxZ5cJrxqEMyeucOlet6P
         lADNCJ6s6AGVXE2qi2jl08MOODrh5t0IZmB/uC1kNs8oCCj6edZfk5AHr8NzYrADBpqU
         uiHg5K9p9RTGvvNBcp4//XD/ANYAKKBfRrLDnxuoBT1PLNVdUyYXboGiuJCspSvPd7rt
         kuhKYmcuHvspqlHCqWp2+AqTJOOkbgH+3syZKTRqeifNgeEWPq1ftlN9HJo1LMQtysGn
         hpew==
X-Gm-Message-State: AOJu0YyjPp7+2sRqraQn1xGRqiSVn8Ce95eris/F+5f8C2zoEP5wgOiZ
	GRevC37X5GW9krCbxZ9fufxsGKpITGKTQguJ0uTNjihordkvrHLZEQULYl37T8SLLf9FU6IK0AI
	wTjMN81XicSwMep1fc+cJb14VNejx4I/D+5C/ii0/Ka7YVpXnXpspoJo6VqKHkiRlLV/N
X-Gm-Gg: Acq92OFHUi5xEAwYDm3cJTyYbHmWmBDe4MIDNhTjGsTw/Na/tc9JmNkM6QQCu9j+CY7
	hn5vRrkeCxvepBk59zCk/sGeMHdjyqluCinW/SRTq5zZ7UjfxyUdDhQ9l0BK+iY90PMr2mp6IUh
	2/kFXIumIGJRZEH9L5fcNwaV+QYORvBrdoBXeY8UPzuMW6dqB25dS5UBv6tTrU7nwI+bSj6fzoc
	jsdAyMERNxNAb7EF4R80FDdyp4ewbMVibxEDiNeW87gIHjqGhLPOWpk5I/Q3up8iPuE9HDHHCsM
	l6JpcuA3O9ZjTfU2my+0p2wnd/dtnv552NKL0RuXj7ZcIcP0EfrSCrHkkLIXYOK3+Ju0qx6A9Ob
	nkPKa7FW0nA5O5E3YXAINf2VWK0IbJd8kFAYZIfLnFNAnXD/F9uhPeXAoASwQqzMKPe1LXKWrKW
	v0DJE=
X-Received: by 2002:a05:7022:6298:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-137d3590729mr4973657c88.0.1780387706666;
        Tue, 02 Jun 2026 01:08:26 -0700 (PDT)
X-Received: by 2002:a05:7022:6298:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-137d3590729mr4973640c88.0.1780387706135;
        Tue, 02 Jun 2026 01:08:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:24 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:22 -0700
Subject: [PATCH v5 6/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-6-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=6LBIv43mpEfkfHXQ9J1Uf2I1ljIj6shVUw3vO/VG0Clor0LcFLiasU+Pv5cJo1DFaQsfvMf8r
 EB23OkT1pZ7D0DJ7lTSvwcajgHex4Q2kwhkUlieUUSzq0tXt+J17vEN
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfXwMBCdx8cwMmb
 wzBUMrysIfNCU3KPdlih5GU1CyfLB8SMR5pJOknO2JKyelcutJa2PrT+tScgGLR/kqgqJtpF5wi
 RxxA99foIHDHT9II7NTtFM0JiS92bR9E1Ld4T8rjh3zMvyr3ZIXf6ZHy60JnO8CDT96z7b6wzi/
 FHWnfn71Zc475CkgHzp0aQBMk544G1qJCl1SR15TlduAammWP+MnJVk1h5KcYa6XWKPWTNndP2Z
 Nv+VwYVyZmSCgVRdM5EqSjlLcVr4442xMBKleUNEBGaHjiUL35NgJiK6dSauSOYwLOGsv2fXluC
 09VLQ15314IotMBdCUHrdkKWUGKkUwWFAiSnDmlJgAMm2Axhp2otHsoeyrzDqddpRvdjJvxWsVT
 Wu/6DhieQSLhNFMYpxkn0kG3ATvvKoPbnTulffzhoRyevbKYSEmcCsz9VONPEq0jkLWsEzo/Rxx
 v2Lx6wpViLei7fMm+8A==
X-Proofpoint-GUID: heHK8EL7Dl1FkIJiLTgHQP0gHWVoc7Ce
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e8f7b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: heHK8EL7Dl1FkIJiLTgHQP0gHWVoc7Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110754-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E697562A4F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


