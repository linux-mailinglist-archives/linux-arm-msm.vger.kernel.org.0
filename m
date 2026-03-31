Return-Path: <linux-arm-msm+bounces-101096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M82KYYFzGljNQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:33:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A674A36EECE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DB50317A6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29ED423A7C;
	Tue, 31 Mar 2026 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA7LCdeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP0lhFwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F108413225
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976213; cv=none; b=qeCITrcQTs/3rbpKciNyXY8wKQ7KA+FrDXGRVhhKIAxW2fbOPBn+QAOzObyfZ7cBOdTCQJuJydRCmtY/oKBcsYb3gq3WhRBIbmulDQqHDr9MbsCYrXeYU6wCFUl8JTI1uNY41QGBJQQcME2RJ66EKlFZUQT0hpwMdGcVty/lU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976213; c=relaxed/simple;
	bh=92089Z6mrHRNtYKNhqqcWsVrZlIsvT9kMeVOiSOimL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svjRjOGiUV3CN8YP9Gh83n0qnJLPhu9U9hGfQ0Vese2ZYqYoPFS7MJv+cb8lywn2YqxMiXWbiYCB0l4z/uYQ5vU36kFn2TTI1gKMLQSF1/T0msii19JPzkQtJOZjmLRJZ1eoOfUJ9kZUqRzs3p8jT+s9C9E/m9dvPgrddWsAlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA7LCdeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP0lhFwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdU1F3239958
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03U
	luz4BRYE=; b=KA7LCdeZw0b+aHT7tPjMB8N7QSuRc9MgeP5BxqAUQyS41ZJKHHW
	VJlUyxe+r8ffFlb9pLgFEL6Bx+gVsTIiPQUrxbBaDjeBfNl/hNKjqWxljEiRk3PS
	DF5dhikY4gMq/KmrmgkbnE2cO6jkUQ7NcLCtYbldE+QmkHXao43rDudH6gHXTEVY
	kMFVr0IdvRM0IhcZM5cprNzAUoFN9aiHk4XgGO2Ah72fE2ajPykuVfVOgwsJVJbo
	IhxTmsAnTF2MzVe08iwUdk2Ir5UT4nkOBKyxE53RtsuQxYIAQauj/ZMPvvmPboBu
	mV5pahBsN5tWy0sj6NNw+nWdkIaT/r/xdOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yt2hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:56:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso84792941cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774976211; x=1775581011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03Uluz4BRYE=;
        b=NP0lhFweKh2SmcgCQWAMQJChn5vxQW03MiJ6dORHKY809dl8fwMvKyJx+he62o7BJD
         6WGKCswxDgIx093umoK5bxdvg+B1b6Va+EFosX0DkXbbc5Sz6gsXcMw1K16EiU6o448L
         yw0xl1cLXtG9XdPdRAsXhA8cs/JqEJ8LjH9o2xAK/ne6rp3e3Max2qTu2SahOyr9NJ+P
         lTWKjwvydrk/Hbxgu6iBIKA9mjcHFkUXuw+OzYOfSDA7nCJkPr2RySqgIApy6xf4UQ5p
         fVI8gLhp9m6lLCxfFBU4KXvWdfIXAsj1nRDueeB5wX8psA7p50MO+yH/pORdade2P6/n
         2OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976211; x=1775581011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03Uluz4BRYE=;
        b=ZG9E5+hJbZ8zSXXeEFVuS4gmgV+NCOA0DyWNy+Gz1El9J8E49d45K9eZJgLNL9EVUG
         btw+dkKtZPuCy5UC33/sYkpJu/YuM27meQIfFxl/mjBvTxDyYWEAwd7nLvgVM74vzP43
         w9M//cQ921MoHrkTBl0RJ1LV6FB2BmorGcj91WwYBKO64/UlPhSuUTT0rfBYCvUPLmCt
         M7cBfCLh9NXe9OpXA1VqE9n9mXFAjw7cbV+M5s5jeyWMmUoVVcAj9Eh6MIiaLMCOc2t6
         y5YJd2cvHlqoq1JCctHRnzTTLwv0GwlWdPEGe4QaseXw8geAHRw4kDJ4mmqjFPxi47WT
         ZaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKpJJ18cyIzc5fyhEPCCYkphjYJOCIJTpFQ/UXwHh7PxYifbzI8a8+8Dg/RyKzzCXuDjwJxPfJ/rFcWiR@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOD7g1PPWjTXyRWttaZBY9XGKe/f3Q1yGqLKM3jGt2NckQWR9
	X/Ant3cfSBMRuBR6QttaEBW+hx3x2B1p+Ax8yLmbKyE8et7R8r4LRYPUJIXXE5ILwvUaxal3mpc
	z2FNOeVX14HrwvZXJJBpqI+w1JatNg+3n3VMLgvso8zUZ51WVCu8n55NyBE2TkBZDu0li9tydcO
	VR
X-Gm-Gg: ATEYQzyxepdm2VvE+uG6zk9ygVSQlK+HZnZ/6wb8oeJ02IVBRVTk7IU9xqPE1mgm8PX
	afR+iCoFAaMT62H0mnwbQw7t+BNRqyHa5NwzIPK18YLowcdii0nq3qu1zjWqILcBeR0nzCnHQBs
	jRtpbRjDe1r+mLeqbQwhkO1x6ImMH6jN2Kb6faDzPPKf/quyBcVqB0nwvpTgmOWRQa/0cM53pht
	MXuXV8dVfxSDBxYk2Dsa3RRGOkiMsLIt7ckt0aqA468jn+arwabdj+bJ/TKSPIvoyT0VuTbt0cI
	FfStIrUxqizk5HYzOLtggSW0bah72LJhuxJrLT97VOrjy6WiV9hzO06rm6KY2m3q8itlcPx5uNJ
	sk3vsQAV/NJBLDM5UPu7c6Zv4XozS0tcOTCl2
X-Received: by 2002:ac8:7c54:0:b0:50b:3f50:178 with SMTP id d75a77b69052e-50d3bb93149mr4425131cf.14.1774976210596;
        Tue, 31 Mar 2026 09:56:50 -0700 (PDT)
X-Received: by 2002:ac8:7c54:0:b0:50b:3f50:178 with SMTP id d75a77b69052e-50d3bb93149mr4424641cf.14.1774976210097;
        Tue, 31 Mar 2026 09:56:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e843a55sm37072775e9.12.2026.03.31.09.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:56:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
Date: Tue, 31 Mar 2026 18:56:46 +0200
Message-ID: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=92089Z6mrHRNtYKNhqqcWsVrZlIsvT9kMeVOiSOimL4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy/zN4y7oXAG4S9rdenj6FGu4WAaNzH+5B4WMb
 7BF3MywTSuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacv8zQAKCRDBN2bmhouD
 1wL4D/9qfWQJtNQPtwQgMDYmi4l4Hgw+sJy8sW+QWWaC5Ie4DIL6mCK5iovTgaU8cUSoNpBLvn0
 vs1LqQEV8qMKMLMhXre00hspGIcuo89R2974i1oR15N7k9vsvwePqNuP+bGgywCR3LllfLCF3gs
 D2C+AN4PEecrKbZqrMWApTFagtpXf6l8DgzcfItuK6DMewVHVryn0QHxX73jQKs8N6Cy30z0c83
 Oj24UUQQPJIKeTHbalTHJxelaAEMPncHTeFu8N7QV+lC5WiLDHscs8a7gNsH+49b5fKv//yA++0
 FaKk/ojoayZspGb3hyEDJbXwoL3jDYy1iimHa4O6eQ+jQoaOpxmCqm2su9698DHTEBYRmWKEC8x
 eYhOB/AKEeHpTvTikLAnFRHi8cGfNmovS7ykwgM7SzXlIFYqhmr2b5NsyoYiU+gCEidYgaemHnC
 aD1DJn0vDnH8Yb86uNVsflVwVWqFrDJfmTYlOU6BE8t4yNXamI4qW1ByAcAObQYnt/orGZUG7SL
 TUsLXDXqMYB5GG9XtpkE4qrT4dlLhOiVR/n+K88myoPlE8Dn9MFeufy5k/wSgiMbDcIqdGIsdlB
 PcyCCjNm+rwoX4ZVHuwPMhx55g4VwsPXT0bTlZEZQUaQxQOmoaFCrVV7TyzFTmsMzUhWK3s12BD V+OvnYc4oOHsm2w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 50yZbYkv9G4dSZhOT69NQnCUQdeADBre
X-Proofpoint-ORIG-GUID: 50yZbYkv9G4dSZhOT69NQnCUQdeADBre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2MiBTYWx0ZWRfX3cWxLymOL4OX
 plGYe4Oldv4wMWaVLlTqx7M16zbcnpZ7xU1kBR6/d18sNaycjVLZp99J6Wz1eQsrN0ecNZ2dMiF
 tNQGUpf5EYltx5Gz0sFiyumIIGSMFnKusk2D4lnM/J0PnrUjRcjUHKec15ZlRTQ2z4Yy/f4bxJ3
 MtOHlhYsHVLismoO2wa7kq+ErLhI8zmxmhrjXxjj8eFv+du1vID8aMrFPrebzEgr6WFtRxywD/X
 VytHOB/BvwsYoxA2TiCBcTbSWjANhmSptTwxwoRt3bf7bzJJ7Kt63f+iv07ZejCY7jJwHvkbFA7
 S4cAZfc/bAZL/5iCcWGMhLHYkys1UH2sp3/uaud3XA8k+kKCRtvkPdUBqx5XaQYw4wJsGnjU0Ry
 E7E/8BlyOZ254Dvss/PLoWTrco67iyb6zd6E28EOg5JXHct+6Ggtw2dRvOALxtYlgO+51OmAeCR
 X1ZXOZ/iwyEqxNTfnpA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbfcd3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=13iKjLuWfy0j0Tg89WsA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310162
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101096-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A674A36EECE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
parent will cause incorrect DSI1 PHY PLL frequencies to be used making
the DSI panel non-working, although there is no upstream user of DSI1.

Fixes: 818ae2b389bc ("arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for next branch.
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..320aec62e462 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3313,7 +3313,7 @@ mdss_dsi1_phy: phy@ae97000 {
 					    "dsi_pll";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
+					 <&bi_tcxo_div2>;
 				clock-names = "iface",
 					      "ref";
 
-- 
2.51.0


