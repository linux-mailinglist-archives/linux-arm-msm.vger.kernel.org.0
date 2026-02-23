Return-Path: <linux-arm-msm+bounces-93666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wITLJthCnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:06:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F5175DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A771300462D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52689364EAF;
	Mon, 23 Feb 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkmlylOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2BJEmOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00F8364EB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848112; cv=none; b=aRDrMMj5fFhIq7d6uzU+cJ2o38C9pNgLF6UsDpS9UuiElcIyfuUvWJ3LMBSkCZuDdkcl0C5ONWSgBeRcaT3JtaaDlgKV5Yr/BINdbP1pGq/J9F2BgBZC8dIfNEt3hvxe+NsAwXvL22FgVSvq2vdgW85n9PTge5Lw662k61IHFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848112; c=relaxed/simple;
	bh=49CCo8rxOGN20h8kH6fGhQ9CLCog1oCVLRfQHVvSUPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jF37IM4mFNo9jgiLKiQFBlWh+XAOIMs78qcglYGZ5VzrOEosIa9/b2CAxBkOk+QrVKAXhI7KomrSPh4EtmkAT/g1h1FjJKPbQGSWCqqwGPCKk5MWxBV0CSksewMzIX/mdetjGSss8dlMO8KzXn+WilOBjHgv1krS/XZtBsT9QV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkmlylOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2BJEmOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWDWN3732653
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rvhNc1bipXcMsZcVw1Cr1w
	TObAR6O8bjLYrKKUfU/PE=; b=QkmlylOFiqW7eMvMO7zqlvWkHCVQQ2PFVAN3YO
	LD2o3qBBAss7+hUf4YUPIPwYhJagqOidjBnjVy9W3M1ikbe36KwlKXnf0dQ/sivV
	k9EFT9Qe5MnVtdi/6fQ4iV9dpqJ4087wWkUR0P73RhM2zBOVaZh5ShU1JitAmk+r
	wXEM2wBszUXUPpW4aBuXMTw6k3ZuigUlx8kEay/dG1I37GddncZ2UY4R1dmQ6TK4
	D8FKQFt8rpMWXltHkLaNoq8ziqYRJSBd6qiSKR95DGVhvmsAvU+As5LYo9gXDwrL
	oB4Bp2VxlvOGDXS0GlR1ULvw7AdDtELw5HfUp7oe+NpFufyg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t889v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:49 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d475e17bd3so56913761a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848109; x=1772452909; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvhNc1bipXcMsZcVw1Cr1wTObAR6O8bjLYrKKUfU/PE=;
        b=Z2BJEmOQFQHME60w4XiPYXamMDXn4w9UzpEhwibxtD8I6pI7Z0Qy5noMqYR06R1o4n
         Ruy+EGW5AFdqn1HmMkz8KfR6gzHbyai2nE5IPKxiHvane7pVla066owkoKcppe+VKWOT
         TV98QpVLRBQI+rerOsOqogNuzMmhnIzBEV/SUmTtzFE11A5CDTzDzXf6cQb6CWBaMVdn
         aG87VS6Ku1qAh9XsCB40yW0NIQrdx2YFCo4MVXpzB9hx6GhDM9XQyOY6g1ghDw/CoLH8
         Nl8nAIlbQXxPQt7El/so4zF9PzGP0sqzZg3KHUhj+hahIZhcSCEEnifp6kmoPDW0d0Nk
         FwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848109; x=1772452909;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvhNc1bipXcMsZcVw1Cr1wTObAR6O8bjLYrKKUfU/PE=;
        b=F2lS1WAnbbOI/ZRnMQ9Cn1pfanaUN8aJxV9UBDkNshaXQZVoLocYsGhT43gOTUET8c
         ebvhNYUsGCc0TStMJ8EyG1ahzdekb9CRqFnm1/4vjbbyFhp9zV4oMOopGiE9AwtuWEuF
         4AUwWbLG0YYOiPdpeXPZExCbeC4GNY2jfDP26nl3loy54pxblQ4eEMsZhE6AIIYFN80n
         yR2u6y6QYiwypU1ZR4npAzt2DPITqVaavsi0af0RMZIk/+P5oB8BqcrmOn3dLbRaJ6/t
         udjX4rb8vonM1+SKUvIUThnqeFMtg39D+xMkkHt83MqDXflju7Bj4Q2+YRSxnnXoUTCS
         vomw==
X-Gm-Message-State: AOJu0YzbMB/E02Dm/seuJoyeoTibDeTs32nPlRD1MeKmqm+2TWcZOMHb
	jxntgisg4A/xY7rYXPQqw2XUqoZGLpC92xr+KjK2V4KCSavNekVdU8mqgVvTtNAjTp3gt+1tAF9
	A2/M3Ckbn40NP/Xk0We/zqzIW83hzJ71yhBUxXAqIUrP2+kaUu7VXzZhkEoylrjGGjuql
X-Gm-Gg: AZuq6aK/1iAekqEHlysMDGWKZDRchhc0ylspW8j2AAHXYnSscNQxn6PiZKhn3Sjg6xZ
	YwfAflG03a0+UuXavsbXrCAFXBv2nEjheCScW9URgQBll8ARABHh0eAOHI4duXLBzXtOPUI+nAt
	scEhumBBb09CnTQRcTu7CBBS3193jTXg54DBI8luy2/NNDiRYMssdaoS/x933OCdlTU0XqYuH86
	KJaX2oaOCUm3FuJ88C52UBYSLazFOOMvHNaA0OgH3pA1kcoyI8I2uZ0fYzcOzCPT2qhNXlLMjaj
	i4L5pap0oefh0OyaNWaAnv1z1ucKsL+YfBxL0rMQLeIzBAEnuOtjxR92zV0olrlv6LCv+INSWs3
	PHSEK1m8l4EbJeswg6l3d0o572rW95g==
X-Received: by 2002:a9d:7d98:0:b0:7d1:8be9:e6a0 with SMTP id 46e09a7af769-7d516a5cd43mr5269735a34.13.1771848108923;
        Mon, 23 Feb 2026 04:01:48 -0800 (PST)
X-Received: by 2002:a9d:7d98:0:b0:7d1:8be9:e6a0 with SMTP id 46e09a7af769-7d516a5cd43mr5269701a34.13.1771848108361;
        Mon, 23 Feb 2026 04:01:48 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Mon, 23 Feb 2026 14:01:17 +0200
Message-Id: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1BnGkC/3XOTW7CMBAF4KsgrzHyb2yz4h6IhZmMwRAwxBDRo
 ty9DlVViGAz0pPefDN3krGNmMl8cictdjHHdCxBTycEtv64QRrrkolgomJcMIpN/PYUmgT7TDW
 iQXA1Q+NIWTm1GOLtwS1Xvzlf1zuEy2AMjW3Ml9R+Pe51fOj90fKV7jhltKpU4E7yYMEsUs6z8
 9U3kA6HWRlkuNCJZ8OMDFEMAESnpF1rsB8M+W8IXo0MWQzrA2hvUHr3yVDPxvgPVQxdMxeErZX
 Q/I3R9/0PGeWWKY0BAAA=
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=49CCo8rxOGN20h8kH6fGhQ9CLCog1oCVLRfQHVvSUPI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGWSuUyps5uNc4jNd/KKxFnYBWGsPMYpjRYe
 XCZmraKoB2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBlgAKCRAbX0TJAJUV
 VhjcD/9Z5ob6g2E/lCJFqX3cMxkzAwDgRPb6vq6rmHjp2/3X0/Wctyxj+K/RgmPB2w+mWY0WGEy
 ng9MR8/7Qwh/wZgoyViw8rbfAXerpRf59MrGVjbde/FgETJO1JGxjwyUXEmvuEOPt163Dn2bMx3
 409RL3RUWSvOu3tPwF2RZBcJgVRy0MND6KQMRaRGajxPS5Mvd/bAoVX6bgGslMQRZVEWu9HNv13
 tKclaT5tZmWaHtjd/2T5dMF8QwieM/TK31jvgriHmlBPCQslDyLrKXfM9TdR6w4Yg1zYeAcJT65
 Ldkt9pQtfN2fxvsO2thfHlVOdX6yoc9te2VODIgttKmJMtfx+MvuhQZhrJm8cNEzo7P/8MrheRJ
 wOyrjGGM6+vn5K1UYYCYFOhT/+ZdKkFzzefuUB6vGtNH0McnaQk/IlEOcMNC0+JLA2hqkxTvIos
 UMvJ9wHE3W47H6cr00bEDNlCG8TD47zgVCzjIpmRrsNDc6/P4i/ZO9XyQwrT/11A2y/6/LEJAjY
 AIvXlbh46YGOMancLUqVoHjfU1XdKHK4nISGTcQX2+BlVAPixYF0AvhZ37mIZ0aDFHUR6PXoSBh
 Rg7OXV+yyPURfUcbPH3rdPQPLwWVTqfqeK/sZW6u3OebpZM5lE2653LHkO/Sxci52LuTP8SaMNV
 tJGAuC0dGxeIUbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c41ad cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_fAS8OA3c_KVdZu2R9EA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: HKHIfawks94xWkdUHMS40yCNvXWBXhEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX8LZKXTqotpEs
 9egfpik/UUorZd1axTAVvthHHko1cFc1GdX0jmEXGZU9J2BU63aj8BRpgOYWvIy1kei29GyQ9hE
 RZepkIX8Mfr/JQBIuJA+uR0qxUFlapZunRXoOBQsFqlNaw1y+KaU17jWc5vWvdSOPGEq5Q7HFRU
 quLGygWkzhg4COfYO57pvFqjpfsEE3ISncdHcfmShwlLcPkZhfsBtoBgdRjI2vS9DSGE9lhyi+U
 JDhKE0EaZedQ3UK1WaEqGXYPwlW8Sn2UjzIA4Uyk3wjbbQKANZjSMLQiy0Mbx6ITHsyk6KwmL7R
 0CAVqvpQVqwWU7FRqHPSeOCPurqytzo2qM41G4JimkqTiyjvC2RH/5PSRsGcL0h5DjChwlOxSRt
 CObnVGHfZx3ZlUZl+gTxyTXWIP5gd45dyIAHCFSJSoOC1zVfOe7GVizoQWq7k5zza+hSuXfgE1k
 l1TpTE9lTk66ksQZPmQ==
X-Proofpoint-ORIG-GUID: HKHIfawks94xWkdUHMS40yCNvXWBXhEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93666-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF7F5175DEF
X-Rspamd-Action: no action

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Added force_mem_on for GCC_UFS_PHY_ICE_CORE_CLK.
- Switched PCIe pipe clocks and UFS symbol tx/rx clocks from
  clk_regmap_mux to clk_regmap_phy_mux.
- Dropped the GCC_CAMERA_HF_CLK_EN_SLP_STG, GCC_CAMERA_SF_CLK_EN_SLP_STG,
  GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG and GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG
  from the GCC driver and the bindings header, like Konrad suggested.
- Sorted entries in the Makefile, as suggested by Krzysztof.
- Picked ub Konrad's R-b tag for the RPMh CC driver patch.
- Link to v4: https://patch.msgid.link/20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com

Changes in v4:
- Picked ub Konrad's R-b tag for the TCSR CC driver patch.
- Added the rfclka4 and rfclka5 clocks to RPMh CC as they exist
  in the cmd-db.
- Added the missing HDMI and PCIe1 TCSR bindings IDs.
- Link to v3: https://patch.msgid.link/20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +
 drivers/clk/qcom/gcc-eliza.c                       | 3109 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  214 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3575 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


