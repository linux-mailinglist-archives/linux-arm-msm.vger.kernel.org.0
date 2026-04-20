Return-Path: <linux-arm-msm+bounces-103819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHlKJhdj5mmavgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:32:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBE4315E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 834D13051EB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9ED3A257C;
	Mon, 20 Apr 2026 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deRkc+AV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOEeS2rX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77D39D6D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705937; cv=none; b=KMH6OtytmPjlLvzoBI2fILUCXiqdyoz+NvlsOmQZ5rHzLuLyZxdyUyhghO6yNUalKil4mATHOw0352vzKMItJjvV03uA91ZtPRqTvQon25N0bVJd2+QF+l2/5PbRzi2d5zbYqmiLyhortA5BYo+0M1uxcA3uy9g2vhqSFUexAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705937; c=relaxed/simple;
	bh=jYa8noxjSneEwKKI80YQTf17d+/soCGjTRTQKVVhOvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2lBHaEzEAInNBEtPnX7Sb6zUD/q5+NE+hlizRFy9/dW6hMg5LnDKjFRdZR/bb6fQ/Ka/PDs2UradnmAqIGtR5wg8wiDatRGb8vvEYkz4Vw3dCkaiHShjgzqshbJGW79oyiFInxg0wGPuVdxDmvSdomK8NhyEGuqykO2LM+SmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deRkc+AV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOEeS2rX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZ23O2281708
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qP9CDOYQkD+
	vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=; b=deRkc+AV19InyKecLcv4OcuxQEu
	QbsCXLmCquqq01+uCexXJwwYt/HqYsaBJBViXCWWCfs0HKco3gzt2bZO6GfjKTIx
	WFMztMP8rWjZRGhHXECW2QBEFT0kXVOYXQLN8VJPbI/gjOEEvHCfksxqJqmvD6Wb
	cxTDsTIujEgbnNdifGW+7QJPJPdIdyaqBysNTKPaycq+rR5UJreR/Prmiv1dp1Jd
	2aP/fCpfvjMHTHzFy1eQ+P41yM5eCcKQJ3gWxGbclkXaalcZNABuTZz+3X930slr
	ZAYOli5Xzb+3uhvyMETkzoI2VkPk+CtXTNVKgMsxY1FjA+4RGfA/d4IsZJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599vk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so1627024b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776705934; x=1777310734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=AOEeS2rX6sha0aLOfLbrvZIhhLope9OoKUJF9qkwyelyUOJYPjdCcfHA5SoYlFhzHs
         wgdsnV1enn/cUMO3B8LwFKYZmMD0ph/gRUCBS2MRTua1E+HqdCWIxWnE2NNRnXZccuV7
         WFVLJeeo49KE0dBSdh5pNRi82lp6Lr3Bgd4Rpp3kwHi9GkKwMuHsAnWWnYzZpKCgFOw8
         FsbEFayP69ambg5h4I0ucrRBcUgoFdyfePLnqELRafIJRf2NhMNRFXvvWetfARQ8AED2
         w027BaDNmA1SD+Xmxo5zP2olPxyyiJL1NnRK7JHujRiY+zXk3Va0ebYbHmBsEIvbYtAa
         P/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705934; x=1777310734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=WnAARdg/2Img//rAagL1cLguyh7057ax+rtuFkZPzE56eitjO6d35vIZnNQXurgIFl
         dNDj57IGRPvLBGvw7cTEm5OAhXAuGeFJNtLW1Tt/T+A9eWUzMF3Hjmi1X5EgZJkWnEIY
         arA0DuLPzI0RaZdGiJLK5wa1I0GgBfGhCfqJWQuIfiB1DPy3P65gl4PrgI+JQrtUsvpz
         YBmSE24Xd0Wng5PWwVlK+ucUquyat/Gq3RF3zFYs+9FOSO5cEiyOiIE5hYy0h4CbI8Au
         AdewzkyNHFotpK25DP6U6eUXGLd5xq7KQSpsa5XM3DAS4S5K4kxi6oDJIwoW4MiaYMCl
         umkw==
X-Forwarded-Encrypted: i=1; AFNElJ8vNjYabQwwyRpSCa1tH4Askf4KQv872uqQoroW9xpSV2j9KPOUdvV39cKPSaQfSR+H31TVCCzAlaredwgG@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxYapmyrPWNsGNV7xkMuYD7NASBEj/rdrtcpxqBroq5DQ4+Lj
	1ZN3UY/BzrsCyrsRTkEs6iDUGm1z3+f8UUZJWJZhYg7ySJ/Gvj8li2F4Z9JhAajHwURpghU1eak
	6OLRhWvb1FamfgYlc2+lP97xIh7fTjI2V4H8nPgjjBMan9nJT38t5MZ6ZSJnk3QON2m1i
X-Gm-Gg: AeBDieukn35KPjTQ2NDDhDag96svQg7/lpH4cfGXU0MlmnaoPyCxxyWgcdMNx/vY6F3
	s18pj0MVU4SDrARlY4kQBIBntJbwb71VcJQwOf9xcLsAdwqQtI4Svjc1RPgLo+M3hu+ZBJVBFWu
	Y3Iu+3bL4vrVPb3/osDCVbeeYzzMAf3+lK0GaNLmeJRbfFpVO90g0sZDOdBA0KuMvloBSFUKVaU
	Vlmo8eGmRbksMc8n6FvDXDwVXDilpH2TL219s733slvG9/ZZdYNR9EwHkBvPWzPHeX5elvuJX3E
	njaCskAgcyiKDMa7uBGXSLI/KsBpowtGyJ87f/HsKdjMM1V2M4CWBezLMumfkIdWKJTpS0B953S
	qONyw1RA9gp2mV6lPmv/MnlCJX3DUKEArOu8fdn3p+4+sO9C8SdcklVeOoZiqWw8=
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565398b3a.33.1776705934276;
        Mon, 20 Apr 2026 10:25:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565362b3a.33.1776705933634;
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm10217353b3a.0.2026.04.20.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 11/13] arm64: dts: qcom: sm8750: Add Display CRM device
Date: Mon, 20 Apr 2026 22:54:14 +0530
Message-Id: <20260420172414.4123379-1-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: El3WEtV3kbLSMI9hEgwsLZ4cwOLDTRE3
X-Proofpoint-GUID: El3WEtV3kbLSMI9hEgwsLZ4cwOLDTRE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfXzJfPe0sQXkGO
 Hput94KEB5L2tEHifAQy83uFeinWgWkPMvmNk500ZQTTH63WryKAlawdJS9KuFK/NgfrMwu1Z7+
 4KoeGL53u7VZ4qRF0y92w3+rn1+YyN9+xOLI8xLCxTU3rAVA/b+T4A9RrxtfDRIBgZzM85Or7uC
 aRpkYQWB/z4xBfsP3LVwbYPrCvXwRKf919RPGV252KH9ZAX+wFYpidg7X23SAP31fJiSUVbAJB9
 G/YUtLBpvD0V0qfHRo4UIsbZNwhBRsiAZ6Uc8Doorzglk29ET04fSOP5r2LWfw77pwyENPegGYG
 wk2olmrLAJXp890214FfjKmwNBneSnwcW4RTqwDTgZp98dwjzK8BYolFEm0c4+Riao/qnsDF1oR
 EoI4hgctFxFDGnT9KLeUqfvPNGXSbs6aQwdUBbP98So/DB9PtEO9VBw12CPTvTF7UG0PLwyCk1O
 Ggtmx6s2tJeRQIQaLnA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e6618f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LxRhXBDcLp6q28ypcw4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103819-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,af00000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15EBE4315E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

CESTA Resource Manager (CRM) device provides DRVs for global and local
resource voting. Add CRM device to vote for resources needed for display
subsytem.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..5d2c59f37015 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3436,6 +3436,22 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		disp_crm: crm@af21000 {
+			compatible = "qcom,sm8750-disp-crm";
+			label = "disp_crm";
+			reg = <0x0 0x0af21000 0x0 0x6000>,
+			      <0x0 0x0af29f00 0x0 0x100>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+			qcom,sw-drv-ids = <0 1 2 3 4 5>;
+		};
+
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
-- 
2.34.1


