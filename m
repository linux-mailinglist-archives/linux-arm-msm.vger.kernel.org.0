Return-Path: <linux-arm-msm+bounces-109078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ES2DeIID2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC65A5CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E99833123681
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79823F9294;
	Thu, 21 May 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmZNOY5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP46BMX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938AE3F888B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368852; cv=none; b=GgeniOrUK80fctHIJ+a9tAJ9elsZNLL6lsfSnoMW3KCkrA9rw/Sp6Fc9/loASVN2cRYCRbB+Nm/FC8mnUgtUMTJ7WxCQBg/jaaTsVokdYnT0VYJ04YqtgYZhQH/WrCzr7Q7RxbeZSkkFv3bJHjKzcCutBJKa6RunuHZtJfRIYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368852; c=relaxed/simple;
	bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1eoKVu7fXXiklWc8It0QIhSgVsE4IU/mEpwKAL6G+LAWPUUedsBXEAQq+Spx4j0A9tdFuyxuf6VLqzHxsKqdg7X7joCD+v7SDI3ycjPNCl53It4QTjvlSOstp6EG1CqmF3ZQNz/Sip4S358/N7Nt+YZnwxX8qPx9yFis8njFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmZNOY5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP46BMX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMYs1731237
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=; b=kmZNOY5GrQ9sE2fo
	mrCCREz/lkZX+YSiZpC+MiCb4Pk4fWmVLkgfB2E2tVxyg8EbP73gVnUhN668h/O3
	trkOaMfxmS67BASvSjiNuWzb942FjahO99hlXDAm1fmbu1zypocJjBxC8NAZLKXE
	gGvINTNU/3hPDofynlg8X7W9wUeFAkxQcFM5fpj7xjCdmlm7uyfkH0FdCqtwdXeM
	LEIuZYSTSjdc4vNRt6bojh4DevixWnO2DS116ppd2Okfy3TC9Uv5TdVAL13JgeQs
	gL6deMC2sIaOxzBcygWHLejBdPqZgaF0sztoSuicvZlIlECtII/BKs4pxrW6xVeb
	1BhpIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5ftj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so4777962a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368849; x=1779973649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=QP46BMX7jkbrfps/ga+7qz6Cxab3J6r+lHhTAKX6HLOJpW0XDw+xKRAauot54D5AWx
         W0OIEVnMyVKeHh22VJLrhDyRbSvqFtWT8fl0SGVY+2VASjOKZDTUOvWM7jHDhsRJPATB
         4ae+1aXB7jsjUQQZ3wxMYRY/TQSaYXpy4PR73M8Hh/LHZHLkGt16KntrzLV0jHsFYnvj
         WdV2yryqkLb88ZV+Uax2eVF0dE+Y1z1v5Y18VtbYyIWiqk2lQFPeskATnPMmJhDyGhWL
         7PRUKtxkIrKP58meGT/S0BPWxnMOwaSsjWzje9GUonWKOBWYR0lJ0Tf5k8aoDL2NjMZ3
         6aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368849; x=1779973649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=bXE/Xthfjs1L/cUaXURiuGuTjKudLgfsl+0GWX9xHz6wPbahrVN0NIeXnDTUnxuLr8
         nrVfGvdOb8r1rdvDUSqY/g5VTMTU4rD74KE6BjHoeUfBiFyJf0k/hZssthBHvfxUNtaT
         DarTySh0pEQKzJ0el9o54TioWwaS246dsfgWBaimth2OLpSdp4yTdSFi1JSTsmcIn7/b
         h5ytB247X2v5cC5GGfxHI0QiVGxc2ASxK6lGxh2x1r6SFTm8+NfEBMX5mmIhY1+8mINT
         Ma7X66spR1CRglvBlUXKDkAAXe39jjsMdQzHQR73FSLm6E/EmgvUPgPMw4lymKPUlNnI
         c86w==
X-Gm-Message-State: AOJu0Yzq/mlSSj1AjTE5AWEXkA8m+Nv3mRRmVWFxQWmCTniOU+JmAaWS
	bog4V6NEqMD2u22pp31S8JySqfHG251xhLpD5gm01wvJkYzuaq9KiZTH4T30qRlXTVbhfV9pylS
	U2qFSgKVlwpOOUwO6yxsyYz47sZSrDMeyzmE6qp9ZvXDDfakL6TG6+G0YJ/ZRPL+Q7knV
X-Gm-Gg: Acq92OF1VYgZU89h0L31xBLrGzoKKUh2sXw162Xz0YjBMFPCVxAjF0KALxr/XVSK8R3
	NShIcsVP9T2cNsbY0AjghcWklqtASxsgjsXNA0/uG4QZYOdQDQGFKG+jDEOm2ejyBuCdPUGhgGh
	cwzxlvTVON0LXScFEBnfctpMgQ3VsgdeKRhuUsT5AFH8QNSUhbZa6FGnoSAca7O+CErhBLdT2B3
	eFKbKPArcWkdJ1Bnxg8tVK1Xxpbjic7oGwD+k9I6TF4IOw5735qYXc06RMkuHg2ZhWbzrkuOd+a
	CeHFOwX7F/WlkAE5t5gxGhS/506++i7pooH0Ko4a7aBmZfIpVZONipK405lX0WTsfDtNm3De5Zl
	CuVenigojUirQsBizRsZwX+X8q755NyKljEN0NX28hv7NLs1QtqURwWK6
X-Received: by 2002:a05:6a21:ec07:10b0:3b2:86e8:a817 with SMTP id adf61e73a8af0-3b30878faa7mr2425203637.31.1779368849368;
        Thu, 21 May 2026 06:07:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:ec07:10b0:3b2:86e8:a817 with SMTP id adf61e73a8af0-3b30878faa7mr2425166637.31.1779368848889;
        Thu, 21 May 2026 06:07:28 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:41 +0530
Subject: [PATCH 08/18] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-8-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
 b=cZyX19qierI9e10Tx/4oErjC+UlxF2/8cf0vyC+QWA8KyJKI8xSKVVKUGtz/L1Lh1dUy5VpS0
 yS0AT2OV/N4AdLtZSNPvaIuGFwXYESw+73065DHsi5NSIqGYosOY74k
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f0392 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: sg5JeKXWi_6gd5EUxSRF67om7cB8u3Js
X-Proofpoint-ORIG-GUID: sg5JeKXWi_6gd5EUxSRF67om7cB8u3Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX42U5ZHho+pb3
 2ewEwTBILFA79ZcBAc/1/oUcoxOdnzAoHcm1WE0aaoRetAbRELRIoBQJqinypizJEpdfJaIk+Rf
 C6mXgzoSveZeFxNzrXrzkfQJm1SGo/lb50ekWeg1/LwirMh/X6Q7Sr7bCa3sd1zNAayG/dVpvxK
 PYbhEq0C/jaTCnZzsvDri3bb+Yjx4slPDvCbZs8wiYrbRL4U+1CA/bASS0wb659tBNcowZfUPa2
 UFBSlByqHksSRB61ucH5uMAQh9l5IvKrp7f/lOct5CVzeE4sINXPenlSP3umKfxOHhinm/hByuU
 1doQFeLQAE8ul4ZIRLW4Q6l+Uhxij3Li3oX1wkA38gKgG0/gGrCjg1Ydhc4VqcRK5l+fK+ucMlg
 5SwmzjW+ksfLE4+1wRLVK5E63KOmS23MYDvqP0VjUNTZQrQx29XjkO3Bcprm/uvyRAi6bJF/3kr
 EHaL9DGZXIbWIOHmjLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109078-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1ECC65A5CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..acb36aaaf20b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2035,7 +2035,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2200,7 +2200,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


