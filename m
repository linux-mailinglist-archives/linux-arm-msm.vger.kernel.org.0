Return-Path: <linux-arm-msm+bounces-112582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R8+nOfhBKmoolQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076266E5D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:04:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A4T3Y+qg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LeGzUk2p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112582-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112582-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31F2530588A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74808371043;
	Thu, 11 Jun 2026 04:59:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846AB366836
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153970; cv=none; b=cuFBaverCbN6jtJ1zJOC1n8LN0eWj6nDXWWinCBZ9Zpn9DkWFfgiEgJoDITLwKr4z7EN8pOXGfWirjZ4l5N40L2lextKYY+HqLqAF+Ukdgsxyvf1OgQ9x4MCsDVVCLXtVckIhAbrxBwhLw/rM0Ho6xzW8BmMCadsS+/CgwY+jUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153970; c=relaxed/simple;
	bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jA1yjNt1RVB1QP1QI7ox1Va0yBuVv3+sM7qJr2/8++tyi3TPayD6NLm7/VlNVPH6Hbb8Q5X1srMVCNlqmPZAJsmEq9LJsrOTRH+tglUI/im2aZFL4pvggr1GkJrAt8CSQVEoe29iNg8KuEz7WZliaXBPjmg9v+27rmTp89AAj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4T3Y+qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeGzUk2p; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nxql3160173
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=; b=A4T3Y+qgjAobxFS5
	zg+l1JoBIu10n6H0W48xer20R5r+zO5Pkw7GSMd7mRTiNGBeqJcHzyOocCD7Aaeh
	tOuZiCEPcv8WwbNf7h6ITCNjvmoESqyxg+GQm9nC6PmaPVpRI/nicm+6+9sAicUD
	E74uyw07tQNMA+OqScH+GPgVT0Rza9y/k9aB00UGsNH/9o7W9XmM8F6zPjx/2Yvd
	5T5KCVbHIxTl6brsqGx5pGLS09lu6VYptXffdVWUw4UnMIWzfazxnf4r83SKWXrr
	i93P0TffavsSGhovOAXeB8nfQfLWseVDkfUD9dsRKpuinDTYt6PnLXHP2MTediGj
	PKh0cA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf160f7191so45020905ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153954; x=1781758754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=LeGzUk2pU3oomLcXcVNw71mg6OIHQ5cxiSro4/twVD7eRE/vDIYla9TUtHp1OZfzmy
         ZfJXgGsLv85t2FP9C6QDXyNEWwjSPMbfEN4MjLpjTsGdRFk56QDJn/s2QsJ7e1zwFlBu
         zZyrDsmJVLm0evyiM5D1NtdQtIAsMfO0sDgYvWJa170ZC8UxsfhzvwUEVE0NRI8Zbqv4
         Rer88O4mwiydWpTJS2Jk+Q6v9tfgPEXLsueIEpwB8S6lcXSd3USS+mgyXeeF3f5PxIDO
         0SHyBsmA8/JUSHHPJkMNsySz9ghbqmXXPjWMjkSStXR9Tx7jQdLPsuMb7Dr4+REgY/8a
         oIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153954; x=1781758754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=GQ3d2BSx9qTO3N9ALtho3P3BHmBfjrJOB4v9R5DQfioCKqVtwnY/P4f3OyyHo/P77I
         AwScIqsRozz38Lr7tF4xSXDs8/Xw1qctTlUli9khBwAgrVt5r9Dt9zgh+E7vR6QRt30b
         QiCnKzCoj9kHg22pGL/vwiXmDlLW1nVmBeqnxibjRNPh9bOJ1VRh02nsGWSYeFlAdA/L
         Q/5g+qNI8NMRFa0VnT62E/orQDL5NVbnwZE6PYYkUnfpV0r/Z+DTtvhFPrrVuMbrfMF/
         Y2VHjWXpMoh5q40XW5Ck/+W/uZBPmVp9Qno3nBEzwcRSLht4wagEeGAUQwnJKPcr/zdI
         X0CQ==
X-Gm-Message-State: AOJu0Yz5xoGbGMEicg6ig4/0PZE/kFCZalVJ4TwFSBT9xOzOjvBC69mv
	lZqvjLGAscUekce9E0Z56ZSqdJvgvmZzTHUeS4BZGlDtATSu73nErYOAetotVxz95Qzw1Bc0kKd
	FoAzCDg4c0NVwKmNYqBQjtS7+RVkxHZbUPiTiwV+QAL/Wiv4r2Jqi+/r2wQEop73rtx388GlDnO
	+j
X-Gm-Gg: Acq92OGUdLJlQ0msuleobsT5H6p/LVoDHgprRSSu9ZlJEHpFKgkyb+MF3yMXWKmGkLD
	rlIxQOlU3bAQ6imRHeAxWEbhdIiwUrsQ7ZndhVLeL9rr12bY0UXLtXBqDhbxb9RYVBfqanj2Iwu
	JDJ8bb4GeO55JWdzHln9S6A+ykxiK3CJdG58qkz9DIwiUyiGJ2GeF9p0gbQAcg5hoGma4BKvK0Z
	chEIfN/lN3SZFGSDt3Nh4JBcDTzNdvQF/v1DD7ggVdM1AdRnSWlq8SA8O67SGpuO1qKV5kruRgF
	mqdgzyUoWXFYH6S3JXARSJW6cj5fj3bFMiGGY8zC0e1zSWx6VsUYKxBAdzKOpyxgQILqh78zSfi
	Lwj2yAm2Y++jQxiytUq3rdmuzRIdlncEsnSzRPeP6FGi/VLdDlZQuzRUQd5/8raiZ56o=
X-Received: by 2002:a17:903:950:b0:2be:3850:297e with SMTP id d9443c01a7336-2c2f3c06bd5mr13685875ad.31.1781153954036;
        Wed, 10 Jun 2026 21:59:14 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2be:3850:297e with SMTP id d9443c01a7336-2c2f3c06bd5mr13685585ad.31.1781153953582;
        Wed, 10 Jun 2026 21:59:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:41 +0530
Subject: [PATCH v2 05/37] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-5-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
 b=YKUHRAh1glYPZA2lvR10XdJYr0X/WLLCp0PvmB4cUILQZcVr1TYrIarHzK5Vd9g6BBFnSelCK
 fzj790zrJqgBGfjjfsxVa156+wN2uofzmxgD4+8O/u3KYVfKMwWhWQ3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5wXplvQf+UHi
 Rv1XOibmYu+Fuqf6mgUNV6Wo2JhAFrqee5cuyWtbJPwjLEWmeDJ3crI3MYcF7HSpYNrO96GZZKZ
 L6c5tljoapMn4XvXMHKOTOWn6JQmHvCkgysawcGiatrUS0PmlcAD5g8z+hNrLjB+VVXv7WhvPDv
 32dynYo2aRzYvg/o/obA6L7AO+VCzuVY9x5p14Naeyrxvu/xYSrHrw2hpV7lejbeEzw2bgGzGny
 e04tKAIYkFeeSNpc9rrEGkxZaHS4Mlxu7pSVQ+QtnwNzGdWxkJpu6JzA8/WcsEyRpAl+xemvDfc
 gmKeTlCUqqSpwl6Nw+PWDazcgicszVW8A3mbMjvD6qTWdEaBlHSJlmbXHopX9p9x2orgak1z1Wp
 tPVOsXZEioMM4tOTe1R3xx/rRrdJnUsHWm3FOC36Bs1icAyHNFKs+7xCi3PQEclpo8dOEQhNldo
 4gGXRuARNB9STd4S3WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8ncSF9bDjRK0
 hmvw9EnoysC4A/iRKq8gvoVBMm+1nXlCpy6MkX0wzj4dhpVk4POF/2xNWzjKBUt2G/4+SytTaoF
 QvnIxdN5wOxhUNtMIzRfX764KebR3sM=
X-Proofpoint-GUID: jJNgR5nBqFiv-vRD0ULn879569weQpmJ
X-Proofpoint-ORIG-GUID: jJNgR5nBqFiv-vRD0ULn879569weQpmJ
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a40a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112582-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6076266E5D5

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..8da494de4308 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


