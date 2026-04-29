Return-Path: <linux-arm-msm+bounces-105171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGWaNeTS8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:44:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E950492300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09FA030479DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E253B27CA;
	Wed, 29 Apr 2026 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8T9uyLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkWUiVd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2323A3812
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455367; cv=none; b=dfhx99Y14m5vSIzI8lMzojK/kHcCVup3wCWmWqALUJPGtfAONn/nK2/sVuQn3nyy4TyfxY3J3qhavPr3jrhBzOH6Rg97uavRGNu9I6nNMvxkC9yhR2Ivmn+Q37xz0IFXDt7uRlkKOAepP6UrG/UEu0fbzoA0etUvutTNsFYJpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455367; c=relaxed/simple;
	bh=UVm107WhzQ5WkZdgFr90sAxI6S4u2TmSP/Q+GBZpQFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E8qtFoJOX/yLN7Ie/UpRKX4IiqDrB08u4wBXrF+Q06G2q6UtPUow9I8SUm2FNc1zns6Gla9WoKaBMVfXOwwdLRvju3pPzbOQk1myvUJSLBz91C1sV0zPif6+nu3hsEV8v+7gIozuPHpPHKig3ER1XDA2OzQUJyoDR4co3dFQazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8T9uyLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkWUiVd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWaa2889803
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XOLjpZX8HYTI3cLRh9OOLn
	/J1nWesnZ3svuiRmcBZaQ=; b=l8T9uyLZFvjJij4S19E4CSW9pPicRSut0K7B0/
	SrEu+0AAHGNs7Yw/96J2zbGxRhOovAsJEKoz5HXiWYHkPQz3ZN3wkp7yb/kjp1BK
	3rE7XR1D+kXwZuLW++hDzWMO1QWvxPwjmrdgMDIGNm4iXqE+XCNUWhh1jF0bW4XG
	OH+MKXrNb2DG0WLU+9jcJJGwksYrZIXbWp1QhR//rivGmqB+ZK8KA1Hz/MlkVUEn
	ByP8w1xh2IyhS1RRpfDtp2Xj0ycwYg8XulLDoXOZ8TiCly/EUB4Ahk3EbqkDSnDj
	Yi+U74D4YoG8mskkVKJlFFNOFO53IwgP4UQvK4AsYU44r4eA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqb8jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:36:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so116705385ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455363; x=1778060163; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOLjpZX8HYTI3cLRh9OOLn/J1nWesnZ3svuiRmcBZaQ=;
        b=AkWUiVd61jE1bkhZBKWq01UBCgxmjR4RgtV3uum9w7rE4NpA5PD1EUlAYljg7AkzZ2
         3kycP+jShgeV3eYuw+XpaVyZvjSHkV8dYKZvh2Lhtl/9rBZoC+X9lYvwXrWZX5Y/81gI
         q3RUfb+04yamysOFusm44SYlz5oLDgIpLo2W1t0JDCgB1ToZGq8Oeu4qBjD8a+gjMabt
         YlZa3KKtKF7NY5ayC8cb8F71OYIdiihthi7HE8D8seszXpOilYBVGx4f2KU2x3Bts55m
         6zLnwSJjzFCcJk96qXJsthEAIe364/QWw6ZpC7ke9/263E5qWHyZoFiG2tqWia7PXjED
         KVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455363; x=1778060163;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOLjpZX8HYTI3cLRh9OOLn/J1nWesnZ3svuiRmcBZaQ=;
        b=i+MlWto7Tn+APaLwHQnwKrBRExmkSyLhj6CdDdizBLNHvh9EPyXCswkMboUcvwGrO9
         jTHYdei1W8KSOeYK4cqsq3IvA08e/19bezSgRrIEDXBwF4VbZaiDXfCQYGpTo3QHTJpc
         kiELn53imXwHKec4gpTbmX8FEstKYQ8dsia+1xIlf0DWyU03oSoagTSCHReJCiVvN5Qi
         BmyGNC21PlH2OOY8Y/5GzUaHKOCVXBh4VNuHve3tLO23l3qaT0+xS/qWagn4xXZo2HDK
         MeGKGFy2xk+53fhncmsywPwgLB9Xc4DoDWyinHxtkit4IM1EGkiQc+2Komz1WE+jFAZB
         VYMw==
X-Forwarded-Encrypted: i=1; AFNElJ+NF3h5DcKdkTOdpNLv+b6KxEvxYRDRjBnFyvvw5EYDIOWG4SpXDgMLP3KxU16FBgbbvkkK4SrDhG99FFKD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3Kle4Mj2xbCuwCfOpOBW+D1lnF+xLuej1WH7a438a4Y9YOu7
	UFFLf0mliAfHLj8xA+uDs5CDIRpyRvQco1Doh2mYKlXdvaGgThyyerWu2HO5PZplLhX/G2kxEYV
	1BRN6UWEFW59WXsa4CsewZM9B+i0LUhYS+qqg549FRyclWj5sY4z85Zt0aarh65gyVL4m
X-Gm-Gg: AeBDieu/MiIlY/Qz8FqHPS9M32XchiLJvL99dXJTNwYA9kp+oY7tgfAUJlf9o8EPL4C
	bcwcuUeq3gbkO1TcSSCHj6ojIAHsf5pQwEL7cv5NsC1lleNqW/OVkJuJLyzco2oci1GCcGGAz9s
	yt9s5p0YI+kHU6V83zmiqR37ibujIckuC0Gp819TPkDxXvDLcqKxEyv5CMiOeZqRxhGRwOlbwsk
	2DSLi3bzeiGEhLZzufb9wbPiX7FX5FC7oRaX1X2mC69hrm8GjBPO07p7/c4Rzul8Q4AjAP0QTcQ
	pf10f4GYQ5PHfH8riEcGZ3sEnVtaGJnHZ3IMO1PN6681uORXkqnUQixCxz78qhjDJpRhseCCzG1
	328zvjO6YY+B7SdkQUmY2dAq/9AyE64UfrDt3iLirxKL0byJlIL/BrEFSirqoewZN3w==
X-Received: by 2002:a17:903:985:b0:2b4:5986:cd80 with SMTP id d9443c01a7336-2b97c47b524mr69884885ad.26.1777455363356;
        Wed, 29 Apr 2026 02:36:03 -0700 (PDT)
X-Received: by 2002:a17:903:985:b0:2b4:5986:cd80 with SMTP id d9443c01a7336-2b97c47b524mr69884755ad.26.1777455362839;
        Wed, 29 Apr 2026 02:36:02 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988989d67sm16568775ad.76.2026.04.29.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:36:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:05:40 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOvQ8WkC/yXM0QrCMAyF4VcZubZQ06nFV5FRbBo1gttouiGMv
 fvqvPwOnH8B5SyscG0WyDyLytBXHA8N0OveP9lIqga0eLYteqMffznZIMQhlfCQr0kOyTtPlly
 E+hsz13lv3rq/dYpvpvILwbpuijc3bXUAAAA=
X-Change-ID: 20260428-sm8750_ice_dt_fix-d32c838c0c3b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: dKKGMyIXLab7RZBTd7Nf1ssCasFhbHDr
X-Proofpoint-ORIG-GUID: dKKGMyIXLab7RZBTd7Nf1ssCasFhbHDr
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1d105 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YMVLaHQI2UQk2HygKEgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NiBTYWx0ZWRfXxvMYFdtAMVNc
 0pPXKeuymD2qsSbihUbERxdVK+K7ee+xD/pM1Jln9uU1JAArTtvGOhGcs1+KH+rxPFLhmVf1w7v
 DdtfEfMUOtIUOX+La4K6PuOkp3SOuixmig6Ya0DJCrSkPtMAxn86RFsAwPjv3d8MBP0ZqLuHPF0
 y2AR4PQcNoT0McmMaeLThQ8uIaM+wFbvS1wUe5FAh8QRIzP9dhCxXLIf2zkg4PH3qrxziE8ffpf
 hONKPx8VzaG75AGI+Et6Rzu7RCO5bk/q2VKhdSnf8Abd8gvjFahPPNMiRWIqSnin5nPZr8DNda/
 FJNT3Z/09DsEekqYytK4XgaZlpIQrKWWOfAcDZZvGggU/9txvMvwNTTE9fOobp2DkPuWkhicYjq
 /+5v/hRTHkXne3fO8EJjrlt5NKEjusEvXprmSFBoPdHucageowWan5rnYPp4w5LG8MKcrf0jf9B
 PbTJjPJILodnr4hHmng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290096
X-Rspamd-Queue-Id: 2E950492300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105171-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
UFS node lacks the required qcom,ice phandle reference.

Add the qcom,ice property to explicitly associate the UFS controller
with its ICE instance.

Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Validations:
* Driver probe
* FBE with standard keys. 
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..4ea7f6b7e20d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5396,6 +5396,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "ufsphy";
 
 			#reset-cells = <1>;
+			qcom,ice = <&ice>;
 
 			status = "disabled";
 

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-sm8750_ice_dt_fix-d32c838c0c3b

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


