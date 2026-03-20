Return-Path: <linux-arm-msm+bounces-98916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNl4CbYsvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:17:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7E2D9639
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3C1A301060A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4A63A5E7F;
	Fri, 20 Mar 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gY0I7cHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4yPg/W9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C43A544E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005422; cv=none; b=QO7lozMdVTESMoUVunMHmPihdxG/RHEl/J1ziR+xZTVw1qsAQ7VjRLgnh82mLL1YsjOtndV78bumoPKqdH5z8q4ItAFjHy7r34Kh0yhF7Ixd3CL5nMTJrZJS/uuv8iBPwVsy43B7nembkxp3g/uhzSoLh19N0fz0UmguBKmF5Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005422; c=relaxed/simple;
	bh=/AeddUdb/6KiqMmA4sZstwt6KNRhZvoCR0kr/UlavTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJsDwENh1tceV1fHjo2VzQlwu5kdZ8R42RcHr8mQumViT5UFZeoK4FlyukHObk+qBgXW63qPBcx3HKR9fE+vo/uPV176iHzufAzGJVzWzV0zEvGcKyDXbepV2bPkJP+dZw22FP4V3lhAIn3L5WT8pYRva601FrTPF96GajEuhrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gY0I7cHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4yPg/W9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XhkT989439
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiv1a3QG/gfr77yOVgT4G0xIyFqWlzfrp2GD3EZik8w=; b=gY0I7cHvJZRySvz3
	GylLzQnQIthpD6UV1UMmCyedhkU0AfAEet8rI6nK0/smMYXtVuOhY7TRJd9u+6Hv
	/K4X9SDapg2w0Rc2haT6Gt0YvgbkVI5TzwRCG9KOkQfShe5vRXVjrVKYxA1M1cua
	tb951oRh8NrRwnagtT6e7vVi4j1BcV38aRy9E9ta84cGauKLrWyZZTNxgBQOiM/2
	oMnfJUeU/8b/iqYCAE31NHslaGi/wYS2hVU2A2Nm03to15f8ynYyEFGPaUBsgJTo
	kesy0h0NcP5eSgbvF0OD8Lk//buuj9wouu6RBxy+eEAD9OenH3zqEQ4UdvUos56U
	WXnKgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0vb637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso74104241cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774005417; x=1774610217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiv1a3QG/gfr77yOVgT4G0xIyFqWlzfrp2GD3EZik8w=;
        b=I4yPg/W9hlCqp3wwSFc4aR01uHeoy7dF23hndIOfUJUvlh+BnIhF0MySGuz4rMPgbM
         Ip+Yjb14mkaUiPWD0XGvyL4Aoa8XV+4ZBtZZlxZGESA3oQmSO7GYvj8lEGn2yER+AMec
         9BU9hne42fMPeAlkuqdg6W4ic8dAJVXWiWiwvV+uImkIZJocrQ3ll25REivo6YWiYAWs
         mlB35Rvz2iBFt0I7dDiK/y9Taf/OomF7U7OXbn+5nqEp1sSvZBTaeIEgjDFHiKLsVSdY
         AjleT+ne0nwokJmy/vYeKzRijeDzuw+V1cP/scP+uR2Q4uwGxdzx9nU8IaK0DLV4jWnX
         38kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005417; x=1774610217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiv1a3QG/gfr77yOVgT4G0xIyFqWlzfrp2GD3EZik8w=;
        b=rNv8L5wCNRgtmXaoR4E1OrIXj4ACSPTux0bQqAHoej1mZyvc5PbmGGpkKgOci75Eft
         y7DEw2rFF06sDcwitpAgzwySvXt523zaSm9odVE/eFjDFiGZAFumrDAJSA1XeuI1OB2k
         qPdcQt9JOxOtUFQo8T/HbTZx6wUFgOXvjJMYWQJiWOGBZRKUa28EmfJuvTdx+0Zb9Bd6
         aChFjgA+v675ytgkMNhTSHRf2mXKAF/6HVduU/Iz44YiVQSkEDOXRv8s8/mgWj/wvrJt
         I2AwCL8UQKifzRTneLQSmsTALu979ZyftGiGnXqgrKWU2QL2+630a75C0s4Nr2Yli46m
         eo1w==
X-Forwarded-Encrypted: i=1; AJvYcCVMREsFuIARb2wpnI+ssqsQy+X7vlyYXla29x/417qu/XluqHQBryXMk4vY8OzsjMua4S1I6GnQl1CCOaYS@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0PIgNBYPHFDOfwpGmf/1cIiLN3j+PUhgPWokL4uJfc8VB81U
	ZIyYJbsmru5MgE2QSZFIt3jGQtF4RLEXVUsMWThr9ZhhJKXKLECNOTxy6UqKVlR0+OXw4MNL4XS
	g4jhoadr+w5y17t89DB9eIcQVeDWea34TXTPQ/V3lCgK7X3d8CE9zkrJ6apOn69sSA2yx
X-Gm-Gg: ATEYQzyBbq7oIrSSH0QpW16QhZfqHSyWRAC+5P2HTthQ8xshH88jlNGZJXSTPpMaAzN
	4bhfX0ebxHn7DKf+d1L3VGFdhCi+l0BCD39HCKgcGbX3efjwRuFjZEJu8FIdfCWz0W8aGVwWfyl
	Mql475SshXX89VfH0JxleN5TT0M8u9tC5FI3Xdfp4XAL8iSFR/NtZj4NFIhC9aaFRTgUafWRaha
	MT4ALr4zloAn+nl/YdxNJSW4JIKN6OjjSd+/N7hh06ZDd7BW+2YvH+bY10W7uC70e7787SYlTpt
	tkA/rYi9QsFUTOUCm5BFfxYVtj10Hwj7uE6X19GFF+LzgCPRjAd6jWZnB8NXOqKgm4guKvHp3gc
	Vc2cpTiQK1B+DZZ0VEvMkRBacd84=
X-Received: by 2002:a05:622a:34a:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b3744a44bmr37185401cf.21.1774005417333;
        Fri, 20 Mar 2026 04:16:57 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b3744a44bmr37184911cf.21.1774005416671;
        Fri, 20 Mar 2026 04:16:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm5905898f8f.25.2026.03.20.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:16:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 13:16:44 +0200
Subject: [PATCH v7 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dts-qcom-glymur-crd-add-edp-v7-2-ca415560447e@oss.qualcomm.com>
References: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
In-Reply-To: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=2627;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wddP1/oPm8XMDxmZ7Q0ZQ0TfR9EUFjSq+ZHxIXET2zs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvSyhxe/+4loKfJIhvD1zmVI9o/7Dt23JTm7SM
 Ngqa1FTIv2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCab0soQAKCRAbX0TJAJUV
 VhKsD/9zJtoAihucb4XM3Be8TxNtn3L41CfmYyPvNrHdEd+tJl1uuJ5y+cJAQfo11P8uJPrGEH/
 6VOJTm+r+2IJIEuVwJMi+VHkTnpz2tCEP+5L3pJDDI01OmsffDA4EjcZTuWLroKf7dMc9y9QLwC
 Nm3nlZW8z8tvD5MRIZKBmy/OKfNoiTtawG2tBH0vHyKG83PLjd128H+3645ebkJezSERbRuSXRI
 8P/28lxrxPTqodbJmiW9pmw9tLOlcPZGld/2AdZ6KOvxZr7V7P4DK7Br19txnevnGizkzJR7SlA
 PXt25wMTSYcIIow70U6niMaVkAMR90E59KuHirBijl1QEGVCfZfGs24gQht+mq+PYS6EYURa13F
 jCtXZ8piiFyLMMDv2FaNq7Wk4ypTyVLou/h9R8ogfstN3k5axH3nld/UJsY4zaRUtHUiu4p3fCp
 slrBB1XyrYj9YGH/ciQKFWOV8KNAGUHhssPcbdl249WPdpVD/RhwHrWyKkmtM21hjpHzHPh0pkH
 JS3w5E9EpGe3vYQBXkH/QtZmoicOqDMsWRSySVaNh3hvA7lyoRoSltePacVUmwY844Hngk7vut/
 JNTQX1vSfoqfgVFFB1kDmzxAvaAZtTejE9fBmw/kAsiOrLRcZ62q3ZMal0nAcWaVIzliXZFNL1K
 8XCi/wiiliveZhg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: eNB9-Wx9Lc07jCIj96dWYC-dRAEGOuqV
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bd2caa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=68_4jy3stEaJOreQ4WQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eNB9-Wx9Lc07jCIj96dWYC-dRAEGOuqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4OCBTYWx0ZWRfXwXC31+9qAQZC
 jhna1ODiBFrLpqDU22D/QMKoR4Fh5vb+ue1bBFkP/iXLXkbtlrUiM4RwKpRhMoz2USYDIL912Jk
 RdXnW5PYcBds9drGe5wQm7H58+ITDPQ6BD+fPMB+7HevccDmJ0E428uS2ZML5qtwpQuYTQ3Jc7U
 4qftmCtNCLQIe8o5hNNYYq1M9XqN6SYNEayD+UXXL4yni5MEDVAI+MYu1Kw9KkbS5bOSj3ocAai
 iJQuYoL0liViw+LhuPEkAjWkO28EzjuEQTC6+I3qhDSjV/yrTWcXfqavHfm0ooJf5QwWJVRQ7Ur
 jSpDcrZeljAZXZI0XngX41MNQJnbzNDOVOOX84Yw01KuddQkJJI0/k6yLULYCi5LAthW3SRsnS9
 xne/J585q46ymrHfovTVmkd6Kdi5WRzlhfILTdlbCQBwMazPUUd7k79YF9mcP2BNLQsd6OG//NH
 D6bx/7chOOkHUS2HFPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98916-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.47:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DC7E2D9639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abel Vesa <abel.vesa@linaro.org>

Enable the MDSS (Mobile Display SubSystem), the third DisplayPort
controller, and its PHY to drive the onboard eDP panel on the Glymur
CRD platform. Also describe the regulator supplying panel power.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 73 +++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 4df8fc4ec254..09a532822787 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -74,6 +74,22 @@ pmic_glink_ss_in1: endpoint {
 			};
 		};
 	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
 };
 
 &i2c5 {
@@ -106,6 +122,47 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -116,6 +173,22 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tlmm {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
+
 &usb_0 {
 	dr_mode = "host";
 

-- 
2.48.1


