Return-Path: <linux-arm-msm+bounces-107694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLw0DUIxBmrhfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90E546BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A5BE3013698
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 20:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534ED35B64C;
	Thu, 14 May 2026 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBHCraI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxzF+asI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B23235BE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790648; cv=none; b=ckwmFRE2UaK7oEdj6Zr4j6kxsYvt3NwEbqaYNoHLQlU8sQuUV0fpqnrWSOg3g8BdoYZVOOWMpPu9txEb3T/B0Ez+RgEPcsxXLeQoaFXhBjw5C9S6eNTOvyfLEi1HJA6LZJjFBxftE2M/3G0NnmCgAxWlJ0Tg7XjfkhXqNtK2GYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790648; c=relaxed/simple;
	bh=ENRAB6NaAfz+N/esGn59rAS1dbyvJcqApk/1sxjO5Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNjvoRQXPn74wPiWb/bhzN/T3DO9Neg1gJ8dUUs9LXmRcoFR+vzJ9ZUAosOsq3cgw9Q6mL/KgUzViWznzkGlVMEs1mTZUKSMTob/dudmRgVJaKDq+M4IgPEsciAasEPCalMyrH+qhsOJlPDWarqMGScKk4842eICP/eifGf3998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBHCraI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxzF+asI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpcSo656082
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=; b=GBHCraI5y1rPwzFw
	WFcvkHTQqGILl0MlKJF7AUlBkgEwf+WnbNW6zKBYbBt+y5KPlWMFPSaGHoHb5cuj
	oFNRtKz4Vp1Rmu6e9xE/0kXFS7qLqRsccs4uqzJARwm+zPXa1KbmcM0e+E2Y+eYh
	2adZz/5WPI3bIRbzykZfMN6g4pSz6pWoqvSAJBD2IUsL7C+wf8RVsvTk29AHRaTZ
	wqZRY1I6VsYRInyl7CmSYlbl/haAaand6yTKcGFJL8PRv572OVN56TzptpnGV+Kc
	UrtLj0VcePBu3a8ugDs47+fySkhevvAx0ThONDwddR02F4aWVeG1pKLKpLtFOOrw
	Q4JcyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1prahv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso4403394b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790646; x=1779395446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=;
        b=NxzF+asIHWQHaRDw05hiBMWU/9WCYlmlHgddp0XsKBAhl374FtrrK9vgRw6tLyHGBg
         MA+7RTxpTaEw2JViqtcLeh+rPK0zQ3Y6ZWlYbEUulQtZJWF2ZyawcErwTTZIHZKwvvt5
         +s/RkXqmoZ4jbTYw86JSlMvzeWbGotyZ96/Ju2QCcHxJrI3mcERM9sfYCIZ/qktS6lXc
         EGubG50PbCft20KXDUueRsoi4fo1C95PRTipE1KvcEgncaGLGujnfYqORK0NXoANS9QP
         sv2wunTsCj/d1L6wWP8VylVBZB7SGdRRa7h8HMlf7vS3anQzlnhTAfCRTzNxmi0ZpKc0
         I4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790646; x=1779395446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=;
        b=B6SdV8F95H4XIwu+1mHkuwjBzsxFwlY/ykuEQAsL7mXBDG4kP2BkxxErN8OwlJ15+x
         js/KsUuIiNSQANsrJEUGNbHzdTyYO5r2DiDZ8nCXKPqmbSsY92ygO7eyLFWSUanD45uE
         eGY7RgJMFOAhPeYKhLUw1EWfwjOFqk02X+/STUu4/CGk85Xdgn4I0GhVHjlyCsvL+bdi
         94yaw3HPII0DGLjNXspsPhaE4roQg5wxpxg0/yKkgts0W+tdP3HKWp/dt+K/1PYSQHzL
         gm/pAg11OoV9BJ8sAgb7Iwqz7Ix7h94qCF3NgjVV+xppDDnarXVUCmW7BE7xHPAiDV5Z
         fTdA==
X-Gm-Message-State: AOJu0Yxo8aVR0ulCGXydatBFwrB7nGj9EEChSAnDU2FS6amc0TL9xZut
	+lutC7LOnErl+XejsRJ8m0HU4i0jSc+mOOm0qXVahwYg03Bu798axlFIzIDuRqhu3C61faFolsM
	vroclNL2PlRFEFkUgwgMA2MPr+fqp26Drg4qb+MstPADpY24Az465eNJ+xKgj045JD67W
X-Gm-Gg: Acq92OHgNnhOdQLRJqIJOYCu3FYJB6NhwxJMs44Ahi4BW2UZsf1SqeltqXJiEJrY3PI
	kU2cAEqo7Y0QevyVCkFlANjxEUEF1j/xvn+H9+MztuI4eJf0xAaMySJgNdVqJByPiWwwVAqHxf2
	xfSyx+5v3GoHhe3Y+e1L2P84Kegk/vqlh1YQFBfYu/RFA6wQ0A0FIo0Mm4WNMfHt5AP6m6T3b0A
	ZuFnC5nY4kCX9KPmhmhw4wxC+9tbkCXLGBF61cFnavOn3GZGUrnLqAeTzkpw16bKMBNvEn0PrOt
	DhDjre1eO/683CgCg0Ll7sMtYfupzUXcfzxgIFKUvY0P1pxzff9pocBWmwmySI4zeEV49IdNlG6
	xtKyDLP3KyRcsAWzrL3NPOrYTfw+1UExgezJ1kHqjw9feuZqoyGxeQzk=
X-Received: by 2002:a05:6a00:1d85:b0:83a:a55f:c3f9 with SMTP id d2e1a72fcca58-83f33b4e019mr1029709b3a.20.1778790645759;
        Thu, 14 May 2026 13:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d85:b0:83a:a55f:c3f9 with SMTP id d2e1a72fcca58-83f33b4e019mr1029675b3a.20.1778790645262;
        Thu, 14 May 2026 13:30:45 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:44 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 02:00:09 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: JLCJZrlSGvJLSAQC7DpMQ6uXnbpk_0nA
X-Proofpoint-ORIG-GUID: JLCJZrlSGvJLSAQC7DpMQ6uXnbpk_0nA
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0630f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fg_DINg97nz2W6SJEv8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMyBTYWx0ZWRfX4wRieaFGvD3J
 v7xAZHRVrKoe+ZiMxcmEzJvPOoADIwdaoTVoGrZt6n6+vZjOG1TYsYE79GgTTiOVPmN7VosLW7A
 klNzpzENR6t3DUE/JX3AQj/9OwENyuOosWIs/EOu/GEVCfuHLaRtGpsS7pCcaQaNmoQngdMs8ww
 K8SOMX4xnDxDLOlc8D6/yzf7pcTYNO851kul1J3CzbzzOHUrASW39OitAKqGf0cuINNFEibvA7n
 gDX/jWveOdbP7SS8YNFmTKuyQXUjDzGM66sGQL3tfkgWymmiNlYcBhk+PNejBL280Q59DpUWwTU
 1fIMJub6C9Oq251nRECw4TzuKXHRC1XdGgMzSekxWBvifSga1Bkn8PG7JpROd4I/5UGiy61pro3
 ZdFoRyDW411WH2hBHCE0VqWp3mNlSrUcI+9PVCfXcT5+/+4ylyvVMvWjRxF9m3hvHxZWPEJKkFW
 XnKUEe7aUp2g2EDcx0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140203
X-Rspamd-Queue-Id: 8A90E546BBB
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107694-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.72.114.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add UFS inline crypto engine(ICE) support for shikra.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..0b988dd607df 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -641,6 +641,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -663,6 +664,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


