Return-Path: <linux-arm-msm+bounces-110753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NxJFKiQHmodlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:13:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7D62A4AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E56E33087748
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6083BE146;
	Tue,  2 Jun 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYpYAAWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX5vZbKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F983C4B60
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387710; cv=none; b=cqB2MGF/LH/LanFoD8Wi8v/q0/2TLxq92M94vFK5QCO3J2B8ua0nRjNt/nd0ogG1cg261LOX2z1n0oIzbhwaP1R8IiDuzm8oW8Rsn1zT5eOUiRxFYqmQfxH0Hg4nbt8vZVz8lxQTbpxxALXdD0hrBPIjpceSZCQ1hWPQ6r7Z7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387710; c=relaxed/simple;
	bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lP/8yeP/jc84GvBToXp4rRhHSGZov3X+UWnoiFegSaE8Qyk7VVdzJvRJilUaLOzIeVRvuynTpyTwDuZhuxjoGpMEtsLIx+QIEFqHqzQGOu+bIcxuOc+3HvbpDyk1n8uqkHrNkyWJb2sD7+oRqUf1SjayHNsQ580vLh2yrU7Fvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYpYAAWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX5vZbKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tX3L4012419
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=; b=XYpYAAWtnkPjDxQo
	hBKdovVf8zA6Snv9NxqOUo2EcwJV6/HdPZS9c59ODm786IVm3YFJqkt1W29ixVj+
	uLjH54JTHQVRb6PFHv7KnBM5+czeAo6V0MHEdNkdr0gdVpSmp5HlJJOwO7WOgJUH
	4kaglDo/QpL5SC5ZgwOWDKXwxjOZc/D4QFkyg/oyoC4gFsEX9H6WEPsEYjU1EHfn
	1nxvB5Gnh603+sFHIBWYunrqqskBWjCNlUh6sr+oZNkmN/hqUOQIi3/IjiAYkuMI
	SOUXdrEF8sHP44DJZjbLst+YR6oFA+HG6+mdugmTb5Co4qvsfTTAFx8JeiVZ6S4E
	lysDGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4ghjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:08:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ee7d1368so3929683eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387704; x=1780992504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=iX5vZbKS0GZh27zjYr80/RAvfXMwJ7b2X5qnCQZHjlKo4g1F5KLCUJsBJeGatXXEJx
         tnZlF+2WoSb3kRVZ+qpCUljB82ACMOCNBheloKk1K5bwiGMLAFWl+QnV9qVpnkdF9ibV
         81w+0LytbcdrHmAV9XPFW2TBAqSRNENU37ZhRJfJDyYuiavBA7DIzOvRPeXvBWYcb55U
         4N8fVyFAtaqnMFCBuYEPl8RmeP2LRYAEPkUPts+gjSN2Bu+7MPIlmZnlD1wxkB09Epxa
         CRGQ0oCXX847N7QWdPLw+kS34CiEEddsBUZ9q/shcYkZyP3aV0EU9b5kDLTKYl7ZmA1r
         +zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387704; x=1780992504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=p4ZnnI5/RAw4yTUv7+yfhVuavBc2gpB4lhbgMbT2G2fmpk1LLSDzBBvqxm9TeJUpGC
         JBiMrGOVCaTWibm85P6KIhJuauzEi0RK900iP60HjGgrTOt9h4D/br2TDgfs2BrHIH3i
         pKhvkYhEZhQP3ndJkyQTXTZe8TgnPSVfCLMiYDeqjNSR+hHtKmPEAyYRNhgHoTVuXr1H
         YadiNShBpSea8RxiKfV8TsqvfzPGIf7mGsWNEhsJK1V+CaIH7W4gbeZeAlS5Z/cHynrQ
         FZHmRJIauOtAWMtDxtSfmRf25ouI6F/XHQtMD+qSBYVhs3VX56vVh7KWQqYHGanDCxXt
         krFA==
X-Gm-Message-State: AOJu0YwYKCt3+HvvJ12/aoqU9GdLQoxgvXPlyy5kgKbFYiLW0EwgdOxz
	+wLkGys+KYI1rbJL+R/Lr6SE0BTS1RmBti4GWnBNtcy5RmzL4XAIGI3dIqyRamDMT2gLIvqjcsM
	BGyAnb2kEAUmwJWAVaS4NNIEyL7FDsR3VnULJ92PVlLCpFnsXXajSoVfNOdJHC3kSbbJk
X-Gm-Gg: Acq92OHlhwom8LHu1Rzc/LC2yo98z33caR4VZk0ogdL/4xvxOkDyFVOSJeVc9W7acCX
	GzWg+rzW0XpsJJ6kmsROtPDP/28dtUTl0Zp2k0G0L2Qs5rKcxHt1GRkoXBzPfSrqDxxHn9wYSv9
	yf+zVgUC9/sqwXt+MYIiNmvtaYJeE6rloTk3U3TqLU3vnVNszrxPD/liuhveuLzJwIgyH2z81M/
	gcZg3mVZRFXndy06JdfwD3TGUrXbTKK9tD79+qplbFRDLHkq9I8V2igIKaVjOG2s5C1fieUvuw4
	dqWd36iVobtYCPDo0qjzjOCE990eC1VK6dDT2MmOXQveoMznY+kEt/pLYl9FXHJIkztyiRo1Nw+
	3BoIMlfUCRtXU4/u/x01dLFujlFnWRrCEuSRGalKnUF5GzSEjBXV/MoVBuXLoqoObV4MC7raMYp
	D8t/I=
X-Received: by 2002:a05:7022:e982:b0:136:e639:9c05 with SMTP id a92af1059eb24-137d428d1c9mr6030481c88.31.1780387704102;
        Tue, 02 Jun 2026 01:08:24 -0700 (PDT)
X-Received: by 2002:a05:7022:e982:b0:136:e639:9c05 with SMTP id a92af1059eb24-137d428d1c9mr6030466c88.31.1780387703446;
        Tue, 02 Jun 2026 01:08:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:21 -0700
Subject: [PATCH v5 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-5-8ea174a59d7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=1625;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
 b=UPCq94NTXyAjj/8Kr/J51oXt8zn3kwg2mLwcEXLnSiq66MrMPu/0BH8qk4i8skP69x6wkbnln
 MlG8QA+8IKvBgXxaxr/ppuPWtrMaq+B/x85wAKv16QoQAsssLJ+wiDR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfXwW6O48L4nBhS
 OGiwN5ylzT5QoTM0g0N0ynzwwqTwh2ysqP0bFehZRJQVR9dxfNY/winCKEe7vOO9vInznLLDuIh
 2kJlcSl7ipaE6Tb8q9q0QFSLydLboIFW4Vf9XA8XUu6ZxrkDd3KAOBUtGrDMQnb2jwFKnDqpveh
 nFpPDmj0UOLC5tGweeIYcw+Uit8WwrN0wY7IeIxijIGB2o+go0loZ5Rhr7Vmwg36ombDwBS2AKw
 mnESpYSRtzQKQcswFhrdilDRDzs/bAHmlJmRWuedh73KszHbDq7Y8zFkkrj4T6hOgQvLqtnD/8i
 yeBHkW1zhjBE2y4aZ7kkmlVC3t47fn0rx3z3tebLft+mRKpqlKG7Afh9s2IC+uFcZ6xZM1A+HXk
 Sbk/WUaUYCn43HHnhxjWck+1eXDQOnf+wiTb9bzr8i18ZKn0hOUDClecCvQWVdc/1gpPkM2ZWVn
 Tjv7fuYxvluA7sf02eg==
X-Proofpoint-GUID: 2XmRdB_PIYII9IVqJ5ZxAtbkPJdUp2JE
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e8f78 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2XmRdB_PIYII9IVqJ5ZxAtbkPJdUp2JE
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
	TAGGED_FROM(0.00)[bounces-110753-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: C1B7D62A4AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1


