Return-Path: <linux-arm-msm+bounces-96658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHtdLBsqsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:26:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6C251EC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D51F7350AD90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE78B3C1414;
	Tue, 10 Mar 2026 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UivB9OLD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNCuh9H6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B873C13FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148138; cv=none; b=sKOAF6TnDsNgqN8JEraxbaMeB1ErrTgkq00gEevyywT5CVh/Kr9pBB9Gxx+s6AuI8xFMv6J+kWRcpoKTkCPYszB/aypv7BA32D/dAKhVA1VzKabbfaBhllxsKvk5DqVmNM+EyJglG/U6mAzbeBW3NlbA1Y74eQ56WAkEnsDt6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148138; c=relaxed/simple;
	bh=PZ5DCBjlvcOz2FLUlUEeXGIXlFc0bouDGB+cw9kDzjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDyFR65TRJY0bdA7ywQ78ryx5MwpcmDBGgWmAnt886O03YmSb/sGyYgbdGDi/lgngSk2OXaUpGpCk8aBC3JtYum73111+BcaH164JGD2aAWGrQOvxPadHa66aCk0v71ePMRnO4vMw6PWjs/u1yUNeUdoWUz1enpifor0tHVtKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UivB9OLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNCuh9H6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACacsQ024548
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68RiKgwmCzM89wF1uILYApl6272R+ffAKbOBnewhtAg=; b=UivB9OLD6tfVKN+F
	AE1A3F7jqVha5wFesAce3s5MydzSrKmcPJqP2PLMUGGr4DzZ2zqjW9GKjunIxBmB
	n/Nwqj+LUj80qahz/qzz256wP11onrY+rJs48v0X3b7EYNyxcIimHqKJuCf/SUuP
	pQfFRs/WrlfgHntvlTRr/EGkEsE3ttgmRI3AVQqAVQgmeDahIVJmVQDMWvuKMtlK
	ONN6iliasPF6kB2W7zN7WWBW4eRVPgYKNTCDolj4uwUKdOElI41Cnwi+43sKthw+
	UfZr0vpYNXFuHN1V0p9p9CayA7CRhV+AzczzdrW0MX7x/zcVsLgwXBrq5Lu6pw+m
	rAaxMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngyx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so2077279685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148136; x=1773752936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68RiKgwmCzM89wF1uILYApl6272R+ffAKbOBnewhtAg=;
        b=SNCuh9H6gqw4QPCYp+tAhVE4SB5Tp5vM1ABhiIrBw6K0o7qxj1mCe3yLNxuF6eaw8M
         mx7epJReWfGeb96+yH72WY5IphzjUDZgl/ZZTNkXukvJcGhqhKw+Ld0WBRDtI19vf4ag
         mOa1q4PRgVESepflFUxBjjjC8h7IUGNOP1wvNFmFGW2rSvHLnwkdFaP6EuP0FNaI7PwJ
         bFDKr0V2/Q4I9d2+FN0jgS8HosRqvWBym3bn2oaTNtCLDqf7kizXBKA+Yu/vJgCPMYk1
         HNtkjczNcxwWpzaPKqF+PMvoO7y9lg/AkqMejzGCY+3+FpIhBpQnNpsVlsl1d1w9uvZ9
         VdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148136; x=1773752936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68RiKgwmCzM89wF1uILYApl6272R+ffAKbOBnewhtAg=;
        b=QoMBSCLAbgThTqJRuq0mzswnnvZfB0A9nmCV6KwpdTtZBx4QYmHJ319ONG46TOHYG0
         XH+1LiHXBow9Lw+kvuM0QOWS1lR/9CzZYayq+cu2M1BMIeNfOUhIfb66QotBnHoYL6BR
         iTECPSteTkAIshXbLRvVz9pySWv5a8XF7N8X7kF+OIRbHSWU4+Gd/KCjW827bRaLsANw
         kcHTAX5+3cBK0RIS5j8UjPqryizh3pL1d/wWluuBSUZRw1dbAcLSXki8i64Virn8MlNF
         EoRC1PNSvrXK+3HXf0Nx9s0xLoCXcGBthUZpu5g860CIo+7YqE6vywS5muGXPY0iidwZ
         0YKA==
X-Gm-Message-State: AOJu0YwfyScnHbI/nXhVSRLbyZPeHmTA+CfgvAOh2iPhsjbq2n49FyER
	RrTz+4kJPzsTwnP7BOUEW5L5fkUhRgQp/I5+VVgnjsBupZ3VM/dHDSsm/obqrHE0q6LpFOvqxE5
	H5TJPyKpPL2QjoBgK1JG6KhPbCmjhG/N4CWaHQgZJhqLzCBFLv9w//OU0fEOGs3IWrogK
X-Gm-Gg: ATEYQzzHrnnhTOIts0kOt22q2ngUjJyogUx3scP8IHERZrDM5tlJIPrAbMKwib5+y6H
	vKKESEHmwddoanFY/IarBmT8LM8s8b+0Ldv0rV+Oy4x86D+ud3BvRSSNDNOON2Shz40DwN7SiEo
	xLVOyGL7zAQqw8OsCeC3MNHbVeNOSixWwxHz4e7wmF8OMmy5VQGj1kUpk8BqCfwWcvj90zmXDvl
	J4Z2etZV78mbn1wNTFddC1HeWKmGb9pSlQyMH2skPKl36aeO2nqcrQg7l/Ia1H24y0YBc8ONpBB
	5MAnqtX2GEsHibk63nO/GdSuCTlprwUeFL8nnJe/7BQCFQR6iRce5Y+y/40ppPSgx2wEklUaozf
	oarjYcR77iV2iqs6FNBMCSukMhhCrrt/9krhVxuj1GdsL
X-Received: by 2002:a05:620a:199e:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cd98c194fdmr140976785a.11.1773148135817;
        Tue, 10 Mar 2026 06:08:55 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cd98c194fdmr140970685a.11.1773148135184;
        Tue, 10 Mar 2026 06:08:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:08:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:44 +0100
Subject: [PATCH RESEND 1/5] arm64: dts: qcom: lemans-ride: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-supplies-v1-1-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZ5DCBjlvcOz2FLUlUEeXGIXlFc0bouDGB+cw9kDzjY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBffW+8CP7zc1tfI39yb1P5PXTPmjWS4ursOz
 AQnpJ8aBfiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX3wAKCRDBN2bmhouD
 1/deD/4huKP2OHuKF4m4nTb96FbjoDH6C9IN5A5TCx13uoEkWt+BH8sBAFubHYq3HXg9BGgD8W0
 NnJ710A27AwuJPzeBjfMvg29oTxy3V9OPqmwkx8RVoMJCfa5+bc5m3UXMsWHuamlGXnAvL/l9p7
 jN5X1a/eQnnYYFrNrnhE2fMn0cZn5u1dztvkOrYIk7TSXMx7m+mXylOKAM/wZ7cA0I+aWel+A0r
 /dF54XATTgl3rHcuNWVdU9anLoFwFutnqlnYuhH+uvUroc5fyRlzJ1ulvK9zwPrzdoBCJNgogSn
 C5lfR3Ctrvq5W1A2kzu6y/dLUwvQv0by57pl82ZCXaqnYU5ERB8rcrBBsytdsjssaxpYPE4+H6y
 i9K7zRkHLDsTsl3B3gquY99M6SoTvQQU3yv9AAUhwJ8UvgZhVMk4iWEN5c068vrko5HrdQLt5tP
 OPKhx6YJXxTstdPIt2Sb6i6KJMjSWc/Itc6suNfJRBHaEI6gJlITfHaatJsJAbwg41J1udEZEUm
 k2FiakFXwmSHTmRCbKV5bpNN7VNUytWxSj5wKr2B45WRyjI9OCBWDJEVMHSYBAHQxNSrcvwN3Pi
 56ZA2GlgdKDRUAjVZFNgY9vUf2i1s9Rb82unlUNEU8ngCQYGlLa+cjcjh6HfYi9s1XaC5npIa3b
 6eRmVxnfMQFZWbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: br-jXTrJOSTGtXWI7gH3HDkxkhJIqPLC
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b017e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_9iiUgdG0rMA4LjK8P8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: br-jXTrJOSTGtXWI7gH3HDkxkhJIqPLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfXwkyNeJBjHuqx
 WTDEbgyuYNj95Zw4UFvlgjkE74EYd0c0acVcu3fLgnl6uDgiRt16+Nzv7YI1hiOOaAPynxPxc+J
 rSJ2q2ojnin6SaHGrvekIEJmILnpMt1fIw7sXY6ycE/iRIfoBKUbkqWCVcZUYavLNXxQq+qOOfS
 087gGhkYbklDqfdjPq+xqdmHiG7cRM3jgKfARXJcl+FVWbi1fI6XA7yodJIYaSPZLPlLrpUDZwa
 0OXktvtZxFRSgI+3QGjxksCZhpihGMbMbAH2tQxC8pjUjju7RBZ+P5eF9GNOSIKcPSWgiIy+OM1
 mVa1RrlGPSWC/tclodiLYzCvAX7+YC1kMCY6GrDUjyfWGi1zjHsCaundzKuq5+JScWx1hiTG0cF
 hbfybpkPHJw7iBJLUZsXViQpwusZxtaGQZmXCMcb/6L1JolBUy/z5geJ+Dq+QdC6Lqlm0P04jot
 3T2ylhB57Ly0NTrcrsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: E3E6C251EC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96658-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 8fb7d1fc6d56..31bd00546d55 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -21,28 +21,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	vreg_12p0: vreg-12p0-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_12P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
-	vreg_5p0: vreg-5p0-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_5P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		vin-supply = <&vreg_12p0>;
-	};
-
 	vreg_1p8: vreg-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_1P8";
@@ -51,8 +29,6 @@ vreg_1p8: vreg-1p8-regulator {
 		regulator-boot-on;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-
-		vin-supply = <&vreg_5p0>;
 	};
 
 	vreg_1p0: vreg-1p0-regulator {
@@ -75,8 +51,6 @@ vreg_3p0: vreg-3p0-regulator {
 		regulator-boot-on;
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-
-		vin-supply = <&vreg_12p0>;
 	};
 
 	vreg_conn_1p8: vreg_conn_1p8 {

-- 
2.51.0


