Return-Path: <linux-arm-msm+bounces-102552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLTGuAR2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:53:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B13CFA4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E51F303FFED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EBC33F5A9;
	Thu,  9 Apr 2026 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY8dcJh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIPpqhSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4A342CB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767908; cv=none; b=rIwtt5dQCtnBJaHlAdqbowLeFykCTucfJM+seNGv9bI5xHB0Rm30prLRziMV49K7OxQaz6a7PYSBXOT8+2t5p/0puvnueTXlhr7gAMS0AQ/7Jp9ogij6vLQuhANiLrpND+gR7jrhNJGAZSAisqXD3Dn5dTOddZuW4U5mNLb+AH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767908; c=relaxed/simple;
	bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biTgnTl3dP1c0SCbVjeW8z0R8IUQAe8CJXxxKSbtZ98qzcOR3vdBrZrOZVpmQExlNw90suyOWWFSrV0vDOF8yTErSNps6pDjy7zrfyFuAIsRI1WHCQrGueCXFr0CY1FuESNp4mATYMDIU9r2Vy4989VFE2gfNPxWrPc6GikVdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY8dcJh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIPpqhSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JnHnJ1433507
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=; b=MY8dcJh1YX8W3+tc
	GcxdiUnNgqIRS+WZyec4bRxH/Q3F4uXNFndJD6M901gkDfOIMW7++4ef0PmTZ8Jk
	Y3VXQOCMOr5J2EBUZEN04HwsksaVsIzqFiIWQhng4t9zK42KmCUkuiEvq+2KYwRm
	mhjnwS9RRozAIDJUjNrqBUhGcRVA4CSGt2PV5JyXCXh//nG2nuoClEkx4ZF0fiIS
	+JwFCiJMrNA5g89AHQHp8ItxTk2ucZHDP+uSxssAeV7EdGt2BY9Y6geVpvsbt+H+
	knhTI+HPF+iFYFAkgZ0N+KhT7xF4ZuaZUOXSCxQ54FzJjt3D8xsMY2njk5Kn5Hfc
	Swu3Tw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf9npw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430237eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767904; x=1776372704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=XIPpqhSm6qunOh85DGQUtKTM7iafbxWxSFMdDmcgEo16SbsW32NhpXBJZssTp3G76S
         TAHZQFZbfLXZgF5kQPcC/kj5ch0Z2DTOyFZ6hlqlRL8XmDoy2PRsyzBXO80dqX6/4t5V
         T0tF23wXf0TmPXDgFKt5CaNQiJSc/QT+4xPnjO+/6ff+zFheqy4wIoP+grKnovDy0YL4
         1ebc3jIigDdSAHfHX4ycqnIWGIa/3O4cLV6bIALiRsBr+veoJkhi907LyENn/YxrGctB
         ldyzBSwCmRQbMM6SR+HNnpcKKbcnfMaXseBgwqJ54r1Ch7GX1JbRzhzPwSL5Je4twR2d
         O8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767904; x=1776372704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=L0q8YRJbxUs0/wMdHlUMP4jUdFAivBrah7eOA+vT+Wd3YqafLthrmLZB3mzSLm77tW
         0JA9fRpYOtDYf6jmavba0iytsjsrCFLPwHy3Ynz5kOfTWJKn1+EdIEHnigCSqtJKERq4
         kHx55lP5wv2refPn9qKBcQ2V35vr3OGx77PzDKLAJKEUOz4omors7O6z1xahVh5AJ78U
         lPS9wtTg3WrIHalzgnhBIn0rq2EqrKjZ42wVamx2WlXbXxChOdamrrbs6kw44VZyiqmX
         jsuU3mD50DsZ5MDCXCRO1CQ0NVN7E07q8p/sxOnpUBOfGAIg8KukSQMEuyW7WiADsUiM
         Gxpg==
X-Gm-Message-State: AOJu0YxuDVIUKA0T62MBbNkT4W6eBEkkR9awFacRYassVSV60xYW3S/c
	dqBZeU7vscT7x0p9ougd+6lNpLQhNpSqs05uJR4CKpIFR5Z5WV3MlrXdM0Fcjp4zoueD4UebeA/
	CPfqAfvPMhtUTdNUcUz/cMUabOl3VRr4ln2OQwEyZ1fWOMzCFSpraAPFq8wbkE1ePKWoo
X-Gm-Gg: AeBDieu8SP/ZiNqKdv6pq2XtBNc74mO32QVrkiBSFnc3eid6bxgVaRrxEzZtUwP+3ms
	1tGR5clXuQvW/Sbbn/XKcb1EaRPG/neKRR0H0q17m5WOY98veBkmF1lBDECYVOP6bJ7EcKfG6/U
	/koXFl8hzkmJNiMy1qIXTgDle8kDDMXM+AgSqDubE0ydP31RVfx05poRQLnY7LSBAXjpaFf3FiD
	GdiWAVd0rSCsdwcIQqE5koiU4vAjkrwR+J2AG0dg4+cM/9YpdzHiJtrpjjY4o+7Cs3vbc8BG7QN
	vvk4N5c8W1+OJ942m2SZaTptLi9DTr25bZUlk4ryLs9HE+A0ixvzVaRNT3mdxmxyeJLiuPkoOTB
	bVIP5p++LgUohiNAOxg59R22g+mZpCkLyFBFbrSnCjnCnBAsufKletuZ1IjcyRjRHYoHIXlr43F
	2Z
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343696eec.30.1775767904076;
        Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343672eec.30.1775767903579;
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:40 -0700
Subject: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2956;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
 b=tdLOisN46KKO8zB0Mgal4aiLJSqC1KhgfivuRFyd0KBHgXT3/O/ljhHgGx3g1Tt/7YDpqM1hT
 EmZwlw1lmbTCI17sKia7jk1j5HC6K60HT4kjAgIPx41EivoONkFnQId
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d81161 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX5gNECjBwyG1Q
 cZSTfDS6GsDeamNwTHL/Vti7y330Ppz8XKs12h/UZBpH+ZAhyRiZjvoshcBTZwXgQ2yNprZz6DO
 ZYS49QB/MHJ83EzGEppMVUEN+8bIOd28z6nu2jky0BQfWgo/l+FjEnKDX/dnPip76DPyx3+C3UX
 2iO1BIgZeCVDVdRhYH7Tit4tK2wiMmHf6U7cDUjq4DdCsoZ/XnFoqpiCgIHXCKg/+gH31Z406Ak
 A4jVKX++WMfOWxaWF0XZA4wq+4RGM0HtMBZDyruQgbBTPKuZNL11I3puS8Eu3Cr+MPC44BSPspt
 6IlH/dF+HVCWMhiSjT4KaXjThpmSQv/mecX1N7JPd5uFmQ8Gb6DS3YgOXPvCX0jicyyR9USe4jg
 ogN7pfcesfog/7B5/KEhabJYdM00NbohL6XkYyTjP2uz5E1OwDARM/CZOS4fs4U19DitgItV4gH
 b5kyfFQToHEjB/r6uIw==
X-Proofpoint-ORIG-GUID: mdQ8Iintlo71_8DskMaVUYr5XeAeYeHB
X-Proofpoint-GUID: mdQ8Iintlo71_8DskMaVUYr5XeAeYeHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102552-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF8B13CFA4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1


