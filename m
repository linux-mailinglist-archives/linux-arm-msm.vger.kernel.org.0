Return-Path: <linux-arm-msm+bounces-106673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHoMOdjM/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671C4F5ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C01530A0EB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3997B3C345F;
	Fri,  8 May 2026 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdAfwAgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMprfOk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF61175A93
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240507; cv=none; b=MSJPny0lMWBdvUVvoe7oOIz/lHKjNDEAS/aDbKAU3q8XoTGNiMnNemH9x/NqBfYQpRSS9ZQslXEqi7BToWH4NQefbBXiRk5T/mFY5a3mBHDlgHKJZ2Rk9Qo6p3FFNggTGq51pUvoRamBOI/8DBikdenjnBNEEDEj9Q0Vqwci+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240507; c=relaxed/simple;
	bh=32jODA13rVX71Zub9iZ9JION5MzYjUkv5FW4RsKBnds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGkkgKqmsPpqKejHQFdHeyR8zDChC7uNeiS52Z2loac7rsu+ERha0Ty9vW6SuQtf8rqkV/e+MEQpRZyqtanpRvs7bqnzhlgqFzvSHiJh76ugCJVBjjl+SGTDKaP31LJCejApb5UzC/O6BmJDVEzR5ttY5xUf/H3ebAfRH0Slq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdAfwAgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMprfOk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489K9jh2771645
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=GdAfwAgffubA/UlP
	7ento7RCBt/jJNAUgbQYKFTwZ6YgH+zZeJbdKQt4o2LRJa5ZbjSanxgDjVo5p3ho
	O3Fibcf8v91Twa9Fi5YrAom1Z2MSQ+CJNYGKIMHkcgzeDOL01lbatcVZjGZ2k1lV
	5n29ZDDnahfpx65AOFv3OEtzAF7kf17ELITdUP3nzaR7VwEjxA0cr5hYOEfTQ+lJ
	MRdJdSSG7Ivj5CcoQO8/xsSPxjJYF3wKAwR7Pbn7Kw2JTSV4RDx10oQ29dS5h30r
	HwwmwXuB+qlZa3Bs+cv+z8AgPam7PM3FYAH4y4yzQbmufu0ItcY221RP2EKO2Oet
	JtmxCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kh8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d60fca52b9so341943385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240503; x=1778845303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=iMprfOk+L5oV3GGM5HexRpe5o8INKDbqktBuzejZalS+nR2FDR91f/QZQ/0+XuhKOQ
         L+AQdQLmmmuflmHcOhR5B/yB69pfhtqAGyWP9Z3fGG3gzsM8JXVkMl6HgTROVSyiJBQH
         snWlmqTKqKSl0qaJ6tOoh8J1fXUP/59FvNivHD5IT62T5YFWRZlHgCt4IMBzBwLf6JJY
         xAM6qlgxKtR6EyLL4AqICZzngRM4kB19JIJsgpJuHtS9Vi53+dZBkPEG50fQPQcCjfKS
         89mHujdUC8ZJY9YEg6W02SjfL/rcp0MBPEuaAa0blGx2G28zDdKcDo8iN+Yr8KO1szh0
         gdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240503; x=1778845303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=YAPR+Uzl2iTHMnh+RCPN+VH1r3kaZmlF5aLlbwlBUFcaBXtdtzSbsvSNjDOFUHE7UP
         lNXh4nzwW+p0PSjB0Ycn2V1/lR3kf6uVVqldFU1nlc31Q70jV6eSuG2Tr2KpA2YisWx0
         bFK+C3OVOR5NF4Sszmv10vrJstMvtaNADJzYEMXNv7dwDUiU6BYIUeal8dFH8UC7dPau
         2x2qZT2s0ao0DFQRoH27gcE3XkNxCavGX92SQa7fn9HT/Xy3CDT+p/xPM9GOkUzbtlYO
         HokDfB1E6y+G8kSgBTrmUXz6WNFCzrSPHIngSuWLDEIipTUKP2USAPfFHMM3nu1ydpmt
         Ybfw==
X-Gm-Message-State: AOJu0YxzeILm2CN00jtLtf2L4P/+1oOb9Z+GOYcXJnmat1rwabgCx9IW
	tWtIViyNT+oNNcNm4U4djH9G2qIOu8wzEXh3ivmjC5sjSjyTSe6JhH4r/3PI6prj9teRt5U4UZw
	MNY3I3Y9jjGJDsOlsJBmYoms6K3JgSzHozcxYiv2jWouWr++Y2eiWE6qtEreH4vDNDqpA
X-Gm-Gg: AeBDietw1O5dtfvzTliE0+j/JYg9Y2UTblEiFH0gHDNrGn1effbF2jLQFkRNKo4j878
	POh+l0QEO+lsZG0F82WRjXVgvn3G94RQ3SMcHZ9/YvlSbGTnFXHwAuqptU0oviApejgFTSJNKFl
	TFM6Wn/yy9JYZxz8O4IHuxdkbLnIOQUTTQREdLClsJ1Sr0+R5D8/oj1OqnUcI1+FIYk1d+555+F
	HWLnCpy6sHdK5GlQj4YdwU0bj7swkFeStrU85dNj5+5+a9rX5leduOoTxytF8YQDlfAfdFWvd1Q
	cKlLuMffikYDiEBMMEMhSHb1T8R+9NqEm71/BpyEJEGhYaP8gJ/fsA/YvDCC+WwDBKvZUO96e04
	UwiPH520M8UzDAKSQfDYutCrbEdez0+lWh+UMTGUo1QRNyGiDHbAXsNU6UI6GznTPonCoIfqSBl
	da+HX6H2YX+CHrvTNmpy8qe3w=
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285703485a.21.1778240503042;
        Fri, 08 May 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285698485a.21.1778240502612;
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:02 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TIwiNaPtfGEt7M6lhlfidGbwYXL1gLP4Ebpm5LfFo1U=;
 b=j2xXh8saEgkacjWqHlWFnlm8eiG2Fo8yBQdInRz8Wor/E59qm4wk9Uu4mQ+9JxOMgl1DUPP3s
 +hAxpV2N4eyBKU1apy7polO2QWDqEgYhPEOF3Lao/DsaUEnCMw0WvTm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdcbf7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1zh-gwcEdKZDVeQ_qUKe3Uyfs8Ey61CX
X-Proofpoint-ORIG-GUID: 1zh-gwcEdKZDVeQ_qUKe3Uyfs8Ey61CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXwHx7vIeL60H0
 teDovxc11I+cFCGDE8CfE5PaUmn0jp6IyodQivCeLGsaYfNXDy9SN3QyA3oIqNhYTkh8VK+IMWr
 77tJ+uDmf/O6B8UyYC7PJlwFfZ6GIQklG1CQmiYaJyyxBI5/M7+0Epp9RAMOtiaj7Iw8gJhdVSp
 ANRmfAqdLNJn9s2WFSL0kR26Qos1jQDflYQcYMzUfF1C1hASDN95skXPlJ6Pp3HmyTq0pXIQRrK
 dp366MRfQK1NbJojZuGf3jn85b8hBh+KCw2mTB9uw96idNGmbuCYeaCJ1O73jfdGZl64+CEVhkj
 4Z56x4KCfVVJLrVzRxdHGIyNWfw03zdMpjrUWg0qUFzpixOOdDEFK4le7MNJh/9phlog9uFhXRD
 9+DH1C6Uy6kwo7xo7ll5GcFb1K89UefZ/fPo/golNkQCImlQAzOU2oiB7spMHQAZqzV2AzH5Z4r
 o+EGDTrOEv9ww7u2pNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 8671C4F5ED2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106673-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054763c8a1bc8de72e296f4efdf9c58..5c9fc0315f7dc125e3176dc4038ec655b7fc4018 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


