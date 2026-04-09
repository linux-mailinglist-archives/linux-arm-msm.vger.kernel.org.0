Return-Path: <linux-arm-msm+bounces-102458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNfNAA5v12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:19:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF83C85D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37AFF30158A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32673ACF04;
	Thu,  9 Apr 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAs3i0PF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mv8+PcYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DB3AC0D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725931; cv=none; b=jozpaGu84R/W3b7dRHpEZaJYujbGoIDoxXGlGYNYBbeag3HhR3sG+NFRnrFkx/8KYBLKi6b+hYHgWNM8x20fenuyDQmknlXStOrkugmkBqb1ojeMf9A2XL26IFaTgxHL0UBFI9vLHQh7u3ZYv8tv9XoxBejW97Hv9LbQZGGF1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725931; c=relaxed/simple;
	bh=Jnl4GBXuRqKFoq3w3/8r5XBP3zLOApQs75sq0Rs58ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2lXDgGP+zF99nMvKOBhz9kXrh1gJ61AL0XJoMYCy5V8nn/cQl/Vr2jSxul1ROn84LwQ3g4JYQYb+d2qSz6hZMg8/mrSs+/HwJ1o1XAfMthjK0rKEgxHE+u0+thjjU/s2FgzyWKYvw11e+/5AS8/+cvCaiZYp7S1AZvWp5KPL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAs3i0PF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv8+PcYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392cvhF3326048
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KuJKTMnIwvR
	eNjVGVZJlJwIUEVTgBM1r1bqLjSYAe0c=; b=dAs3i0PFJE4Hh4EAI0UZA3fjtM+
	WdrOggVPMBg69lCsYIbJHDFtvAdKDXQ+H9blEK4WEOCZFGEwxmMSzhtExfAVOzf9
	s42vqlvkmGFx6MWxtb8q/Wd9R2RKcx5W+hOeA3RNGrboPyL7qU03N7p7Neu6oVu0
	4CW0qthFruLqgtSuzpDnq6CTj/7Dys1R8HpMrn3mTLFk86nuJinVu2weHgAzskW5
	cIvva3OTVYwcbYTHEa+cHNcmoctQIdwmuJIfXoNSHzNsuagT6Zxfe1ZTJXOjtDPC
	r9rRJ/LyL2gY/GxzDC6EWMmzOKuca1gKWhLO3FjmPPao+bwXiuLgcVL+RUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mtem4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:12:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d054421d19so1863509eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725920; x=1776330720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuJKTMnIwvReNjVGVZJlJwIUEVTgBM1r1bqLjSYAe0c=;
        b=Mv8+PcYZzr5cdQvu/BlNctZzHQ09TUOpSPyhIADILTJE5xWBUodePRYQ54+tEIsOPA
         LE5wlvbIupHE0ZLCO4F9AtL6vJXoRbhqZsyyLSyIzLsTbb5B/CcPJp1iT2iH85ORS2Zl
         SnRwBj2loeOCsqrPB4TFmwwssRBt7QGLZ+8ez2chtJHFSMKwV7PzVICuZmxi96xb/Ol1
         HYTwnF87gXvdAWRP9ybShoGysKS2tfOqTV9AUXIuNamDjeMvBDt8051Gb2CdEJ3PhHSm
         74/xrTgBpSdVl/I8o6G2dy42btXtBogkKHVOV+DX8VOF13SmfoTxTbHEofEM/kO1K46c
         Bzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725920; x=1776330720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KuJKTMnIwvReNjVGVZJlJwIUEVTgBM1r1bqLjSYAe0c=;
        b=jWhm37rwRjc390Smye/pdLDOfhsa4OuSuMLeKYwLs31Kmuj1OPQ8cO7SUfUHnfku3G
         rJ8rRzqXm3xUPw3x+wAF2mEJ0tCSg1uRg4UEqOolsmbARKynQzLUbjyZUiYMu6pgNuU6
         NFwd0l6Sf7n02UVExUOgoAqZIOOHQIpZccWrBo/Cf6S06AhdvtC2ASh9LKTo8gNXAIMv
         8fyLmr5CNeRVq6zAFNSFtbZnlJX45EMAO6VFZ4biZdlgZCQjeO5EHsjNQr2Do0edVUUl
         RA6L7PCPh/c7TIJwtPA1nq72hpO6B3AM0hNTnTss4iwS0vSIWbgXp/T9PxFkZ5w8XKIQ
         X39g==
X-Forwarded-Encrypted: i=1; AJvYcCXUe1S7ckpHy43NjOnfLc9q7p/NbPxeTTIHejZ9zgGVMeCc+KNiSimnANz/11OKFcCu5XPewb2VGmpQIOGM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1rOnC01X/BrNlkpaf115J3ybQUW62tZp0Ud5M0yebx+eNP2L
	v+Hc99kDFRHmK91dsIzpUV1HsYc5k3MM/mY2Wkd2Jb+r/6nAePylxx3DC2ivuk54tHRtOVjYSRR
	8ZL8sCKndoLwuJzL3fO50QsKI1HkRp1q72MU+QH5p0HFe6HrfMDRK0KWlBI6ScJaE7w2l
X-Gm-Gg: AeBDiev8GO6SQMrnyUDiCEyne2xBhvipux0gHTRcMV5eNYKiHW3REQU/If4I2F1rrHW
	w4MBti7e6FWcDhzECQk/MpZ2wUuwviwoDhNWFOzTVwBJQhkbSxUgk9sdgQXWhzg5FjXVIUJiFj2
	5uatYypf+Cy/QlYZO0FFAxCdvknKmEO46rJKFoapOW/ttV1GqopkUGwakf49ghEKwuXTvPCdXgU
	60S4IU8NDcz0V12zi822rgUJB1F7Ac/2nLuckiEeX0bFcvi8bBNOLtr/5N6k6EZcbH+wYZc3q5o
	ehVqX82SyjFO+e3ndZKZ1EnY0M0yl0ViGkGwcUhJHzU2y0OG4EvYKa5vj9rlT901n3Ep4AxMKrb
	cAz0Ql4BbtYX4HHEyUshTDY7dURhLO04gn4FaMLXxo9ndS6a/sFa94Qll6S4EvIICILvY9MG8Ww
	rtUPb23g==
X-Received: by 2002:a05:7300:371f:b0:2c5:50fe:c771 with SMTP id 5a478bee46e88-2cbfc45be20mr14396809eec.29.1775725919436;
        Thu, 09 Apr 2026 02:11:59 -0700 (PDT)
X-Received: by 2002:a05:7300:371f:b0:2c5:50fe:c771 with SMTP id 5a478bee46e88-2cbfc45be20mr14396785eec.29.1775725918698;
        Thu, 09 Apr 2026 02:11:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/8] arm64: dts: qcom: lemans: Move pinctrl states into lemans-iq9.dtsi
Date: Thu,  9 Apr 2026 17:10:56 +0800
Message-ID: <20260409091100.474358-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d76d60 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lfu0pQ9szTVn3MWTFX8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: rrVvyRU61uuThUlQGU0Vv8MPKfcjrj_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX+Yi6v4MGhBh9
 pVWrh3Dw+i/E1LZo56dXbM8/Yj/WzZDajS0/vmWB7BrxlmFEujMkHbqO/NzILc2DC5n8zZOxVTP
 QQmmDlFH62Ko4O88TYghvyOlHZNuaka4MsS/dYg+nqkOlxnzteh20fKF43dvvWvoDfC1uebNTZc
 envMCRTfFUc3mIVG5aMOwxfSSJZzU/KzurO0u6lecpgFCjA6oL+owASt9es78GzozTO9wTgaTcj
 uuwexUmBzljDOSC8EOGRrPGGnaz2tjUxgiDBLhgkiDeCvrFmsKUIjhK+BbGDBuVTTf+tLk55qTr
 Tq4WeIyS9fXYxlXw4d6ZFtLAmWNj7Zl2wc77US0Ps9VDXj69IciTaevsATLDKk0XzdLcX5rNPnW
 F10QgI5137r7Dp0zq8C8FVHTKQUfeqdgfjhA1GJ0o7bWQpjO2IgB5ZhBq+IRhSYoDSQ5SNi7Y1V
 87fliZmntDdbULLXl2g==
X-Proofpoint-GUID: rrVvyRU61uuThUlQGU0Vv8MPKfcjrj_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.885];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,f000000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CEF83C85D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The lemans.dtsi will become a base devicetree common to all Lemans
series SoCs.  Move those pinctrl states into lemans-iq9.dtsi as they
may not apply to other Lemans variant SoCs.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi | 812 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 806 ----------------------
 2 files changed, 812 insertions(+), 806 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
index 80d8c75e4895..5c2aa83fe8b4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
@@ -4,3 +4,815 @@
  */
 
 #include "lemans.dtsi"
+
+/ {
+	soc: soc@0 {
+		tlmm: pinctrl@f000000 {
+			dp0_hot_plug_det: dp0-hot-plug-det-state {
+				pins = "gpio101";
+				function = "edp0_hot";
+				bias-disable;
+			};
+
+			dp1_hot_plug_det: dp1-hot-plug-det-state {
+				pins = "gpio102";
+				function = "edp1_hot";
+				bias-disable;
+			};
+
+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			hs2_mi2s_active: hs2-mi2s-active-state {
+				pins = "gpio122", "gpio123", "gpio124", "gpio125";
+				function = "hs2_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			cci0_0_default: cci0-0-default-state {
+				pins = "gpio60", "gpio61";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				pins = "gpio60", "gpio61";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				pins = "gpio52", "gpio53";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				pins = "gpio52", "gpio53";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				pins = "gpio62", "gpio63";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				pins = "gpio62", "gpio63";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				pins = "gpio54", "gpio55";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				pins = "gpio54", "gpio55";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				pins = "gpio64", "gpio65";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				pins = "gpio64", "gpio65";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				pins = "gpio56", "gpio57";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				pins = "gpio56", "gpio57";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_0_default: cci3-0-default-state {
+				pins = "gpio66", "gpio67";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci3_0_sleep: cci3-0-sleep-state {
+				pins = "gpio66", "gpio67";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_1_default: cci3-1-default-state {
+				pins = "gpio58", "gpio59";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci3_1_sleep: cci3-1-sleep-state {
+				pins = "gpio58", "gpio59";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_i2c0_default: qup-i2c0-state {
+				pins = "gpio20", "gpio21";
+				function = "qup0_se0";
+			};
+
+			qup_i2c1_default: qup-i2c1-state {
+				pins = "gpio24", "gpio25";
+				function = "qup0_se1";
+			};
+
+			qup_i2c2_default: qup-i2c2-state {
+				pins = "gpio36", "gpio37";
+				function = "qup0_se2";
+			};
+
+			qup_i2c3_default: qup-i2c3-state {
+				pins = "gpio28", "gpio29";
+				function = "qup0_se3";
+			};
+
+			qup_i2c4_default: qup-i2c4-state {
+				pins = "gpio32", "gpio33";
+				function = "qup0_se4";
+			};
+
+			qup_i2c5_default: qup-i2c5-state {
+				pins = "gpio36", "gpio37";
+				function = "qup0_se5";
+			};
+
+			qup_i2c7_default: qup-i2c7-state {
+				pins = "gpio40", "gpio41";
+				function = "qup1_se0";
+			};
+
+			qup_i2c8_default: qup-i2c8-state {
+				pins = "gpio42", "gpio43";
+				function = "qup1_se1";
+			};
+
+			qup_i2c9_default: qup-i2c9-state {
+				pins = "gpio46", "gpio47";
+				function = "qup1_se2";
+			};
+
+			qup_i2c10_default: qup-i2c10-state {
+				pins = "gpio44", "gpio45";
+				function = "qup1_se3";
+			};
+
+			qup_i2c11_default: qup-i2c11-state {
+				pins = "gpio48", "gpio49";
+				function = "qup1_se4";
+			};
+
+			qup_i2c12_default: qup-i2c12-state {
+				pins = "gpio52", "gpio53";
+				function = "qup1_se5";
+			};
+
+			qup_i2c13_default: qup-i2c13-state {
+				pins = "gpio56", "gpio57";
+				function = "qup1_se6";
+			};
+
+			qup_i2c14_default: qup-i2c14-state {
+				pins = "gpio80", "gpio81";
+				function = "qup2_se0";
+			};
+
+			qup_i2c15_default: qup-i2c15-state {
+				pins = "gpio84", "gpio85";
+				function = "qup2_se1";
+			};
+
+			qup_i2c16_default: qup-i2c16-state {
+				pins = "gpio86", "gpio87";
+				function = "qup2_se2";
+			};
+
+			qup_i2c17_default: qup-i2c17-state {
+				pins = "gpio91", "gpio92";
+				function = "qup2_se3";
+			};
+
+			qup_i2c18_default: qup-i2c18-state {
+				pins = "gpio95", "gpio96";
+				function = "qup2_se4";
+			};
+
+			qup_i2c19_default: qup-i2c19-state {
+				pins = "gpio99", "gpio100";
+				function = "qup2_se5";
+			};
+
+			qup_i2c20_default: qup-i2c20-state {
+				pins = "gpio97", "gpio98";
+				function = "qup2_se6";
+			};
+
+			qup_i2c21_default: qup-i2c21-state {
+				pins = "gpio13", "gpio14";
+				function = "qup3_se0";
+			};
+
+			qup_spi0_default: qup-spi0-state {
+				pins = "gpio20", "gpio21", "gpio22", "gpio23";
+				function = "qup0_se0";
+			};
+
+			qup_spi1_default: qup-spi1-state {
+				pins = "gpio24", "gpio25", "gpio26", "gpio27";
+				function = "qup0_se1";
+			};
+
+			qup_spi2_default: qup-spi2-state {
+				pins = "gpio36", "gpio37", "gpio38", "gpio39";
+				function = "qup0_se2";
+			};
+
+			qup_spi3_default: qup-spi3-state {
+				pins = "gpio28", "gpio29", "gpio30", "gpio31";
+				function = "qup0_se3";
+			};
+
+			qup_spi4_default: qup-spi4-state {
+				pins = "gpio32", "gpio33", "gpio34", "gpio35";
+				function = "qup0_se4";
+			};
+
+			qup_spi5_default: qup-spi5-state {
+				pins = "gpio36", "gpio37", "gpio38", "gpio39";
+				function = "qup0_se5";
+			};
+
+			qup_spi7_default: qup-spi7-state {
+				pins = "gpio40", "gpio41", "gpio42", "gpio43";
+				function = "qup1_se0";
+			};
+
+			qup_spi8_default: qup-spi8-state {
+				pins = "gpio42", "gpio43", "gpio40", "gpio41";
+				function = "qup1_se1";
+			};
+
+			qup_spi9_default: qup-spi9-state {
+				pins = "gpio46", "gpio47", "gpio44", "gpio45";
+				function = "qup1_se2";
+			};
+
+			qup_spi10_default: qup-spi10-state {
+				pins = "gpio44", "gpio45", "gpio46", "gpio47";
+				function = "qup1_se3";
+			};
+
+			qup_spi11_default: qup-spi11-state {
+				pins = "gpio48", "gpio49", "gpio50", "gpio51";
+				function = "qup1_se4";
+			};
+
+			qup_spi12_default: qup-spi12-state {
+				pins = "gpio52", "gpio53", "gpio54", "gpio55";
+				function = "qup1_se5";
+			};
+
+			qup_spi14_default: qup-spi14-state {
+				pins = "gpio80", "gpio81", "gpio82", "gpio83";
+				function = "qup2_se0";
+			};
+
+			qup_spi15_default: qup-spi15-state {
+				pins = "gpio84", "gpio85", "gpio99", "gpio100";
+				function = "qup2_se1";
+			};
+
+			qup_spi16_default: qup-spi16-state {
+				pins = "gpio86", "gpio87", "gpio88", "gpio89";
+				function = "qup2_se2";
+			};
+
+			qup_spi17_default: qup-spi17-state {
+				pins = "gpio91", "gpio92", "gpio93", "gpio94";
+				function = "qup2_se3";
+			};
+
+			qup_spi18_default: qup-spi18-state {
+				pins = "gpio95", "gpio96", "gpio97", "gpio98";
+				function = "qup2_se4";
+			};
+
+			qup_spi19_default: qup-spi19-state {
+				pins = "gpio99", "gpio100", "gpio84", "gpio85";
+				function = "qup2_se5";
+			};
+
+			qup_spi20_default: qup-spi20-state {
+				pins = "gpio97", "gpio98", "gpio95", "gpio96";
+				function = "qup2_se6";
+			};
+
+			qup_spi21_default: qup-spi21-state {
+				pins = "gpio13", "gpio14", "gpio15", "gpio16";
+				function = "qup3_se0";
+			};
+
+			qup_uart0_default: qup-uart0-state {
+				qup_uart0_cts: qup-uart0-cts-pins {
+					pins = "gpio20";
+					function = "qup0_se0";
+				};
+
+				qup_uart0_rts: qup-uart0-rts-pins {
+					pins = "gpio21";
+					function = "qup0_se0";
+				};
+
+				qup_uart0_tx: qup-uart0-tx-pins {
+					pins = "gpio22";
+					function = "qup0_se0";
+				};
+
+				qup_uart0_rx: qup-uart0-rx-pins {
+					pins = "gpio23";
+					function = "qup0_se0";
+				};
+			};
+
+			qup_uart1_default: qup-uart1-state {
+				qup_uart1_cts: qup-uart1-cts-pins {
+					pins = "gpio24";
+					function = "qup0_se1";
+				};
+
+				qup_uart1_rts: qup-uart1-rts-pins {
+					pins = "gpio25";
+					function = "qup0_se1";
+				};
+
+				qup_uart1_tx: qup-uart1-tx-pins {
+					pins = "gpio26";
+					function = "qup0_se1";
+				};
+
+				qup_uart1_rx: qup-uart1-rx-pins {
+					pins = "gpio27";
+					function = "qup0_se1";
+				};
+			};
+
+			qup_uart2_default: qup-uart2-state {
+				qup_uart2_cts: qup-uart2-cts-pins {
+					pins = "gpio36";
+					function = "qup0_se2";
+				};
+
+				qup_uart2_rts: qup-uart2-rts-pins {
+					pins = "gpio37";
+					function = "qup0_se2";
+				};
+
+				qup_uart2_tx: qup-uart2-tx-pins {
+					pins = "gpio38";
+					function = "qup0_se2";
+				};
+
+				qup_uart2_rx: qup-uart2-rx-pins {
+					pins = "gpio39";
+					function = "qup0_se2";
+				};
+			};
+
+			qup_uart3_default: qup-uart3-state {
+				qup_uart3_cts: qup-uart3-cts-pins {
+					pins = "gpio28";
+					function = "qup0_se3";
+				};
+
+				qup_uart3_rts: qup-uart3-rts-pins {
+					pins = "gpio29";
+					function = "qup0_se3";
+				};
+
+				qup_uart3_tx: qup-uart3-tx-pins {
+					pins = "gpio30";
+					function = "qup0_se3";
+				};
+
+				qup_uart3_rx: qup-uart3-rx-pins {
+					pins = "gpio31";
+					function = "qup0_se3";
+				};
+			};
+
+			qup_uart4_default: qup-uart4-state {
+				qup_uart4_cts: qup-uart4-cts-pins {
+					pins = "gpio32";
+					function = "qup0_se4";
+				};
+
+				qup_uart4_rts: qup-uart4-rts-pins {
+					pins = "gpio33";
+					function = "qup0_se4";
+				};
+
+				qup_uart4_tx: qup-uart4-tx-pins {
+					pins = "gpio34";
+					function = "qup0_se4";
+				};
+
+				qup_uart4_rx: qup-uart4-rx-pins {
+					pins = "gpio35";
+					function = "qup0_se4";
+				};
+			};
+
+			qup_uart5_default: qup-uart5-state {
+				qup_uart5_cts: qup-uart5-cts-pins {
+					pins = "gpio36";
+					function = "qup0_se5";
+				};
+
+				qup_uart5_rts: qup-uart5-rts-pins {
+					pins = "gpio37";
+					function = "qup0_se5";
+				};
+
+				qup_uart5_tx: qup-uart5-tx-pins {
+					pins = "gpio38";
+					function = "qup0_se5";
+				};
+
+				qup_uart5_rx: qup-uart5-rx-pins {
+					pins = "gpio39";
+					function = "qup0_se5";
+				};
+			};
+
+			qup_uart7_default: qup-uart7-state {
+				qup_uart7_cts: qup-uart7-cts-pins {
+					pins = "gpio40";
+					function = "qup1_se0";
+				};
+
+				qup_uart7_rts: qup-uart7-rts-pins {
+					pins = "gpio41";
+					function = "qup1_se0";
+				};
+
+				qup_uart7_tx: qup-uart7-tx-pins {
+					pins = "gpio42";
+					function = "qup1_se0";
+				};
+
+				qup_uart7_rx: qup-uart7-rx-pins {
+					pins = "gpio43";
+					function = "qup1_se0";
+				};
+			};
+
+			qup_uart8_default: qup-uart8-state {
+				qup_uart8_cts: qup-uart8-cts-pins {
+					pins = "gpio42";
+					function = "qup1_se1";
+				};
+
+				qup_uart8_rts: qup-uart8-rts-pins {
+					pins = "gpio43";
+					function = "qup1_se1";
+				};
+
+				qup_uart8_tx: qup-uart8-tx-pins {
+					pins = "gpio40";
+					function = "qup1_se1";
+				};
+
+				qup_uart8_rx: qup-uart8-rx-pins {
+					pins = "gpio41";
+					function = "qup1_se1";
+				};
+			};
+
+			qup_uart9_default: qup-uart9-state {
+				qup_uart9_cts: qup-uart9-cts-pins {
+					pins = "gpio46";
+					function = "qup1_se2";
+				};
+
+				qup_uart9_rts: qup-uart9-rts-pins {
+					pins = "gpio47";
+					function = "qup1_se2";
+				};
+
+				qup_uart9_tx: qup-uart9-tx-pins {
+					pins = "gpio44";
+					function = "qup1_se2";
+				};
+
+				qup_uart9_rx: qup-uart9-rx-pins {
+					pins = "gpio45";
+					function = "qup1_se2";
+				};
+			};
+
+			qup_uart10_default: qup-uart10-state {
+				pins = "gpio46", "gpio47";
+				function = "qup1_se3";
+			};
+
+			qup_uart11_default: qup-uart11-state {
+				qup_uart11_cts: qup-uart11-cts-pins {
+					pins = "gpio48";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rts: qup-uart11-rts-pins {
+					pins = "gpio49";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_tx: qup-uart11-tx-pins {
+					pins = "gpio50";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rx: qup-uart11-rx-pins {
+					pins = "gpio51";
+					function = "qup1_se4";
+				};
+			};
+
+			qup_uart12_default: qup-uart12-state {
+				qup_uart12_cts: qup-uart12-cts-pins {
+					pins = "gpio52";
+					function = "qup1_se5";
+				};
+
+				qup_uart12_rts: qup-uart12-rts-pins {
+					pins = "gpio53";
+					function = "qup1_se5";
+				};
+
+				qup_uart12_tx: qup-uart12-tx-pins {
+					pins = "gpio54";
+					function = "qup1_se5";
+				};
+
+				qup_uart12_rx: qup-uart12-rx-pins {
+					pins = "gpio55";
+					function = "qup1_se5";
+				};
+			};
+
+			qup_uart14_default: qup-uart14-state {
+				qup_uart14_cts: qup-uart14-cts-pins {
+					pins = "gpio80";
+					function = "qup2_se0";
+				};
+
+				qup_uart14_rts: qup-uart14-rts-pins {
+					pins = "gpio81";
+					function = "qup2_se0";
+				};
+
+				qup_uart14_tx: qup-uart14-tx-pins {
+					pins = "gpio82";
+					function = "qup2_se0";
+				};
+
+				qup_uart14_rx: qup-uart14-rx-pins {
+					pins = "gpio83";
+					function = "qup2_se0";
+				};
+			};
+
+			qup_uart15_default: qup-uart15-state {
+				qup_uart15_cts: qup-uart15-cts-pins {
+					pins = "gpio84";
+					function = "qup2_se1";
+				};
+
+				qup_uart15_rts: qup-uart15-rts-pins {
+					pins = "gpio85";
+					function = "qup2_se1";
+				};
+
+				qup_uart15_tx: qup-uart15-tx-pins {
+					pins = "gpio99";
+					function = "qup2_se1";
+				};
+
+				qup_uart15_rx: qup-uart15-rx-pins {
+					pins = "gpio100";
+					function = "qup2_se1";
+				};
+			};
+
+			qup_uart16_default: qup-uart16-state {
+				qup_uart16_cts: qup-uart16-cts-pins {
+					pins = "gpio86";
+					function = "qup2_se2";
+				};
+
+				qup_uart16_rts: qup-uart16-rts-pins {
+					pins = "gpio87";
+					function = "qup2_se2";
+				};
+
+				qup_uart16_tx: qup-uart16-tx-pins {
+					pins = "gpio88";
+					function = "qup2_se2";
+				};
+
+				qup_uart16_rx: qup-uart16-rx-pins {
+					pins = "gpio89";
+					function = "qup2_se2";
+				};
+			};
+
+			qup_uart17_default: qup-uart17-state {
+				qup_uart17_cts: qup-uart17-cts-pins {
+					pins = "gpio91";
+					function = "qup2_se3";
+				};
+
+				qup_uart17_rts: qup0-uart17-rts-pins {
+					pins = "gpio92";
+					function = "qup2_se3";
+				};
+
+				qup_uart17_tx: qup0-uart17-tx-pins {
+					pins = "gpio93";
+					function = "qup2_se3";
+				};
+
+				qup_uart17_rx: qup0-uart17-rx-pins {
+					pins = "gpio94";
+					function = "qup2_se3";
+				};
+			};
+
+			qup_uart18_default: qup-uart18-state {
+				qup_uart18_cts: qup-uart18-cts-pins {
+					pins = "gpio95";
+					function = "qup2_se4";
+				};
+
+				qup_uart18_rts: qup-uart18-rts-pins {
+					pins = "gpio96";
+					function = "qup2_se4";
+				};
+
+				qup_uart18_tx: qup-uart18-tx-pins {
+					pins = "gpio97";
+					function = "qup2_se4";
+				};
+
+				qup_uart18_rx: qup-uart18-rx-pins {
+					pins = "gpio98";
+					function = "qup2_se4";
+				};
+			};
+
+			qup_uart19_default: qup-uart19-state {
+				qup_uart19_cts: qup-uart19-cts-pins {
+					pins = "gpio99";
+					function = "qup2_se5";
+				};
+
+				qup_uart19_rts: qup-uart19-rts-pins {
+					pins = "gpio100";
+					function = "qup2_se5";
+				};
+
+				qup_uart19_tx: qup-uart19-tx-pins {
+					pins = "gpio84";
+					function = "qup2_se5";
+				};
+
+				qup_uart19_rx: qup-uart19-rx-pins {
+					pins = "gpio85";
+					function = "qup2_se5";
+				};
+			};
+
+			qup_uart20_default: qup-uart20-state {
+				qup_uart20_cts: qup-uart20-cts-pins {
+					pins = "gpio97";
+					function = "qup2_se6";
+				};
+
+				qup_uart20_rts: qup-uart20-rts-pins {
+					pins = "gpio98";
+					function = "qup2_se6";
+				};
+
+				qup_uart20_tx: qup-uart20-tx-pins {
+					pins = "gpio95";
+					function = "qup2_se6";
+				};
+
+				qup_uart20_rx: qup-uart20-rx-pins {
+					pins = "gpio96";
+					function = "qup2_se6";
+				};
+			};
+
+			qup_uart21_default: qup-uart21-state {
+				qup_uart21_cts: qup-uart21-cts-pins {
+					pins = "gpio13";
+					function = "qup3_se0";
+				};
+
+				qup_uart21_rts: qup-uart21-rts-pins {
+					pins = "gpio14";
+					function = "qup3_se0";
+				};
+
+				qup_uart21_tx: qup-uart21-tx-pins {
+					pins = "gpio15";
+					function = "qup3_se0";
+				};
+
+				qup_uart21_rx: qup-uart21-rx-pins {
+					pins = "gpio16";
+					function = "qup3_se0";
+				};
+			};
+
+			sdc_default: sdc-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc_sleep: sdc-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 03a712d82d78..fa2f20a7b11f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6025,812 +6025,6 @@ tlmm: pinctrl@f000000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
-
-			dp0_hot_plug_det: dp0-hot-plug-det-state {
-				pins = "gpio101";
-				function = "edp0_hot";
-				bias-disable;
-			};
-
-			dp1_hot_plug_det: dp1-hot-plug-det-state {
-				pins = "gpio102";
-				function = "edp1_hot";
-				bias-disable;
-			};
-
-			hs0_mi2s_active: hs0-mi2s-active-state {
-				pins = "gpio114", "gpio115", "gpio116", "gpio117";
-				function = "hs0_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			hs2_mi2s_active: hs2-mi2s-active-state {
-				pins = "gpio122", "gpio123", "gpio124", "gpio125";
-				function = "hs2_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			cci0_0_default: cci0-0-default-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_0_sleep: cci0-0-sleep-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci0_1_default: cci0-1-default-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_1_sleep: cci0-1-sleep-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_0_default: cci1-0-default-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_0_sleep: cci1-0-sleep-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_1_default: cci1-1-default-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_1_sleep: cci1-1-sleep-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_0_default: cci2-0-default-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_0_sleep: cci2-0-sleep-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_1_default: cci2-1-default-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_1_sleep: cci2-1-sleep-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_0_default: cci3-0-default-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_0_sleep: cci3-0-sleep-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_1_default: cci3-1-default-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_1_sleep: cci3-1-sleep-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			qup_i2c0_default: qup-i2c0-state {
-				pins = "gpio20", "gpio21";
-				function = "qup0_se0";
-			};
-
-			qup_i2c1_default: qup-i2c1-state {
-				pins = "gpio24", "gpio25";
-				function = "qup0_se1";
-			};
-
-			qup_i2c2_default: qup-i2c2-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se2";
-			};
-
-			qup_i2c3_default: qup-i2c3-state {
-				pins = "gpio28", "gpio29";
-				function = "qup0_se3";
-			};
-
-			qup_i2c4_default: qup-i2c4-state {
-				pins = "gpio32", "gpio33";
-				function = "qup0_se4";
-			};
-
-			qup_i2c5_default: qup-i2c5-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se5";
-			};
-
-			qup_i2c7_default: qup-i2c7-state {
-				pins = "gpio40", "gpio41";
-				function = "qup1_se0";
-			};
-
-			qup_i2c8_default: qup-i2c8-state {
-				pins = "gpio42", "gpio43";
-				function = "qup1_se1";
-			};
-
-			qup_i2c9_default: qup-i2c9-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se2";
-			};
-
-			qup_i2c10_default: qup-i2c10-state {
-				pins = "gpio44", "gpio45";
-				function = "qup1_se3";
-			};
-
-			qup_i2c11_default: qup-i2c11-state {
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-			};
-
-			qup_i2c12_default: qup-i2c12-state {
-				pins = "gpio52", "gpio53";
-				function = "qup1_se5";
-			};
-
-			qup_i2c13_default: qup-i2c13-state {
-				pins = "gpio56", "gpio57";
-				function = "qup1_se6";
-			};
-
-			qup_i2c14_default: qup-i2c14-state {
-				pins = "gpio80", "gpio81";
-				function = "qup2_se0";
-			};
-
-			qup_i2c15_default: qup-i2c15-state {
-				pins = "gpio84", "gpio85";
-				function = "qup2_se1";
-			};
-
-			qup_i2c16_default: qup-i2c16-state {
-				pins = "gpio86", "gpio87";
-				function = "qup2_se2";
-			};
-
-			qup_i2c17_default: qup-i2c17-state {
-				pins = "gpio91", "gpio92";
-				function = "qup2_se3";
-			};
-
-			qup_i2c18_default: qup-i2c18-state {
-				pins = "gpio95", "gpio96";
-				function = "qup2_se4";
-			};
-
-			qup_i2c19_default: qup-i2c19-state {
-				pins = "gpio99", "gpio100";
-				function = "qup2_se5";
-			};
-
-			qup_i2c20_default: qup-i2c20-state {
-				pins = "gpio97", "gpio98";
-				function = "qup2_se6";
-			};
-
-			qup_i2c21_default: qup-i2c21-state {
-				pins = "gpio13", "gpio14";
-				function = "qup3_se0";
-			};
-
-			qup_spi0_default: qup-spi0-state {
-				pins = "gpio20", "gpio21", "gpio22", "gpio23";
-				function = "qup0_se0";
-			};
-
-			qup_spi1_default: qup-spi1-state {
-				pins = "gpio24", "gpio25", "gpio26", "gpio27";
-				function = "qup0_se1";
-			};
-
-			qup_spi2_default: qup-spi2-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se2";
-			};
-
-			qup_spi3_default: qup-spi3-state {
-				pins = "gpio28", "gpio29", "gpio30", "gpio31";
-				function = "qup0_se3";
-			};
-
-			qup_spi4_default: qup-spi4-state {
-				pins = "gpio32", "gpio33", "gpio34", "gpio35";
-				function = "qup0_se4";
-			};
-
-			qup_spi5_default: qup-spi5-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se5";
-			};
-
-			qup_spi7_default: qup-spi7-state {
-				pins = "gpio40", "gpio41", "gpio42", "gpio43";
-				function = "qup1_se0";
-			};
-
-			qup_spi8_default: qup-spi8-state {
-				pins = "gpio42", "gpio43", "gpio40", "gpio41";
-				function = "qup1_se1";
-			};
-
-			qup_spi9_default: qup-spi9-state {
-				pins = "gpio46", "gpio47", "gpio44", "gpio45";
-				function = "qup1_se2";
-			};
-
-			qup_spi10_default: qup-spi10-state {
-				pins = "gpio44", "gpio45", "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_spi11_default: qup-spi11-state {
-				pins = "gpio48", "gpio49", "gpio50", "gpio51";
-				function = "qup1_se4";
-			};
-
-			qup_spi12_default: qup-spi12-state {
-				pins = "gpio52", "gpio53", "gpio54", "gpio55";
-				function = "qup1_se5";
-			};
-
-			qup_spi14_default: qup-spi14-state {
-				pins = "gpio80", "gpio81", "gpio82", "gpio83";
-				function = "qup2_se0";
-			};
-
-			qup_spi15_default: qup-spi15-state {
-				pins = "gpio84", "gpio85", "gpio99", "gpio100";
-				function = "qup2_se1";
-			};
-
-			qup_spi16_default: qup-spi16-state {
-				pins = "gpio86", "gpio87", "gpio88", "gpio89";
-				function = "qup2_se2";
-			};
-
-			qup_spi17_default: qup-spi17-state {
-				pins = "gpio91", "gpio92", "gpio93", "gpio94";
-				function = "qup2_se3";
-			};
-
-			qup_spi18_default: qup-spi18-state {
-				pins = "gpio95", "gpio96", "gpio97", "gpio98";
-				function = "qup2_se4";
-			};
-
-			qup_spi19_default: qup-spi19-state {
-				pins = "gpio99", "gpio100", "gpio84", "gpio85";
-				function = "qup2_se5";
-			};
-
-			qup_spi20_default: qup-spi20-state {
-				pins = "gpio97", "gpio98", "gpio95", "gpio96";
-				function = "qup2_se6";
-			};
-
-			qup_spi21_default: qup-spi21-state {
-				pins = "gpio13", "gpio14", "gpio15", "gpio16";
-				function = "qup3_se0";
-			};
-
-			qup_uart0_default: qup-uart0-state {
-				qup_uart0_cts: qup-uart0-cts-pins {
-					pins = "gpio20";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rts: qup-uart0-rts-pins {
-					pins = "gpio21";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_tx: qup-uart0-tx-pins {
-					pins = "gpio22";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rx: qup-uart0-rx-pins {
-					pins = "gpio23";
-					function = "qup0_se0";
-				};
-			};
-
-			qup_uart1_default: qup-uart1-state {
-				qup_uart1_cts: qup-uart1-cts-pins {
-					pins = "gpio24";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rts: qup-uart1-rts-pins {
-					pins = "gpio25";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_tx: qup-uart1-tx-pins {
-					pins = "gpio26";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rx: qup-uart1-rx-pins {
-					pins = "gpio27";
-					function = "qup0_se1";
-				};
-			};
-
-			qup_uart2_default: qup-uart2-state {
-				qup_uart2_cts: qup-uart2-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rts: qup-uart2-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_tx: qup-uart2-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rx: qup-uart2-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se2";
-				};
-			};
-
-			qup_uart3_default: qup-uart3-state {
-				qup_uart3_cts: qup-uart3-cts-pins {
-					pins = "gpio28";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rts: qup-uart3-rts-pins {
-					pins = "gpio29";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_tx: qup-uart3-tx-pins {
-					pins = "gpio30";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rx: qup-uart3-rx-pins {
-					pins = "gpio31";
-					function = "qup0_se3";
-				};
-			};
-
-			qup_uart4_default: qup-uart4-state {
-				qup_uart4_cts: qup-uart4-cts-pins {
-					pins = "gpio32";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rts: qup-uart4-rts-pins {
-					pins = "gpio33";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_tx: qup-uart4-tx-pins {
-					pins = "gpio34";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rx: qup-uart4-rx-pins {
-					pins = "gpio35";
-					function = "qup0_se4";
-				};
-			};
-
-			qup_uart5_default: qup-uart5-state {
-				qup_uart5_cts: qup-uart5-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rts: qup-uart5-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_tx: qup-uart5-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rx: qup-uart5-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se5";
-				};
-			};
-
-			qup_uart7_default: qup-uart7-state {
-				qup_uart7_cts: qup-uart7-cts-pins {
-					pins = "gpio40";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rts: qup-uart7-rts-pins {
-					pins = "gpio41";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_tx: qup-uart7-tx-pins {
-					pins = "gpio42";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rx: qup-uart7-rx-pins {
-					pins = "gpio43";
-					function = "qup1_se0";
-				};
-			};
-
-			qup_uart8_default: qup-uart8-state {
-				qup_uart8_cts: qup-uart8-cts-pins {
-					pins = "gpio42";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rts: qup-uart8-rts-pins {
-					pins = "gpio43";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_tx: qup-uart8-tx-pins {
-					pins = "gpio40";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rx: qup-uart8-rx-pins {
-					pins = "gpio41";
-					function = "qup1_se1";
-				};
-			};
-
-			qup_uart9_default: qup-uart9-state {
-				qup_uart9_cts: qup-uart9-cts-pins {
-					pins = "gpio46";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rts: qup-uart9-rts-pins {
-					pins = "gpio47";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_tx: qup-uart9-tx-pins {
-					pins = "gpio44";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rx: qup-uart9-rx-pins {
-					pins = "gpio45";
-					function = "qup1_se2";
-				};
-			};
-
-			qup_uart10_default: qup-uart10-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_uart11_default: qup-uart11-state {
-				qup_uart11_cts: qup-uart11-cts-pins {
-					pins = "gpio48";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rts: qup-uart11-rts-pins {
-					pins = "gpio49";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_tx: qup-uart11-tx-pins {
-					pins = "gpio50";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rx: qup-uart11-rx-pins {
-					pins = "gpio51";
-					function = "qup1_se4";
-				};
-			};
-
-			qup_uart12_default: qup-uart12-state {
-				qup_uart12_cts: qup-uart12-cts-pins {
-					pins = "gpio52";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rts: qup-uart12-rts-pins {
-					pins = "gpio53";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_tx: qup-uart12-tx-pins {
-					pins = "gpio54";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rx: qup-uart12-rx-pins {
-					pins = "gpio55";
-					function = "qup1_se5";
-				};
-			};
-
-			qup_uart14_default: qup-uart14-state {
-				qup_uart14_cts: qup-uart14-cts-pins {
-					pins = "gpio80";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rts: qup-uart14-rts-pins {
-					pins = "gpio81";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_tx: qup-uart14-tx-pins {
-					pins = "gpio82";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rx: qup-uart14-rx-pins {
-					pins = "gpio83";
-					function = "qup2_se0";
-				};
-			};
-
-			qup_uart15_default: qup-uart15-state {
-				qup_uart15_cts: qup-uart15-cts-pins {
-					pins = "gpio84";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rts: qup-uart15-rts-pins {
-					pins = "gpio85";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_tx: qup-uart15-tx-pins {
-					pins = "gpio99";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rx: qup-uart15-rx-pins {
-					pins = "gpio100";
-					function = "qup2_se1";
-				};
-			};
-
-			qup_uart16_default: qup-uart16-state {
-				qup_uart16_cts: qup-uart16-cts-pins {
-					pins = "gpio86";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rts: qup-uart16-rts-pins {
-					pins = "gpio87";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_tx: qup-uart16-tx-pins {
-					pins = "gpio88";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rx: qup-uart16-rx-pins {
-					pins = "gpio89";
-					function = "qup2_se2";
-				};
-			};
-
-			qup_uart17_default: qup-uart17-state {
-				qup_uart17_cts: qup-uart17-cts-pins {
-					pins = "gpio91";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rts: qup0-uart17-rts-pins {
-					pins = "gpio92";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_tx: qup0-uart17-tx-pins {
-					pins = "gpio93";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rx: qup0-uart17-rx-pins {
-					pins = "gpio94";
-					function = "qup2_se3";
-				};
-			};
-
-			qup_uart18_default: qup-uart18-state {
-				qup_uart18_cts: qup-uart18-cts-pins {
-					pins = "gpio95";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rts: qup-uart18-rts-pins {
-					pins = "gpio96";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_tx: qup-uart18-tx-pins {
-					pins = "gpio97";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rx: qup-uart18-rx-pins {
-					pins = "gpio98";
-					function = "qup2_se4";
-				};
-			};
-
-			qup_uart19_default: qup-uart19-state {
-				qup_uart19_cts: qup-uart19-cts-pins {
-					pins = "gpio99";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rts: qup-uart19-rts-pins {
-					pins = "gpio100";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_tx: qup-uart19-tx-pins {
-					pins = "gpio84";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rx: qup-uart19-rx-pins {
-					pins = "gpio85";
-					function = "qup2_se5";
-				};
-			};
-
-			qup_uart20_default: qup-uart20-state {
-				qup_uart20_cts: qup-uart20-cts-pins {
-					pins = "gpio97";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rts: qup-uart20-rts-pins {
-					pins = "gpio98";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_tx: qup-uart20-tx-pins {
-					pins = "gpio95";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rx: qup-uart20-rx-pins {
-					pins = "gpio96";
-					function = "qup2_se6";
-				};
-			};
-
-			qup_uart21_default: qup-uart21-state {
-				qup_uart21_cts: qup-uart21-cts-pins {
-					pins = "gpio13";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rts: qup-uart21-rts-pins {
-					pins = "gpio14";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_tx: qup-uart21-tx-pins {
-					pins = "gpio15";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rx: qup-uart21-rx-pins {
-					pins = "gpio16";
-					function = "qup3_se0";
-				};
-			};
-
-			sdc_default: sdc-default-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
-
-			sdc_sleep: sdc-sleep-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-			};
 		};
 
 		sram: sram@146d8000 {
-- 
2.43.0


