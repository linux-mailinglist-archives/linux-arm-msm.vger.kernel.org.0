Return-Path: <linux-arm-msm+bounces-109079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FKMCN0ID2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B65A5CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB52303DA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19243E0245;
	Thu, 21 May 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTWJna6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEi5iRGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4743FA5F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368856; cv=none; b=tyo2KweIq4nwnuJoKraRBUNTSDRzC3Tz/Sm2J/m6JZQTERksHOnRCDF2LVn95j85XE1yzBuSsdCZ2ZmzCTntQUC873XApjak0ew5DS+0HksXD1d6PBExsfmB4U/2BeWPSStl4ivXhrXqTLvY3kofWsJMhfyG9QzamOtBUaYhHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368856; c=relaxed/simple;
	bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwDWHTBR8/Fez3qbO8A2wmZ/B5U9dDp2Ge9pF3dejIoP70w1RoxZJQuKycCBw6oc2NWmH8tJSVyiYSS1X44I44SIOiLA6BcqfBijAVDzTMaU63eiNUPvpQm6rbj2ros8jMbb/G+j3FhO6xGOkffjA0r8CQYYs90trXN2Rvgo030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTWJna6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEi5iRGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nLI3009516
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=; b=eTWJna6NLmUE+AZa
	JEIelb/mejCH+13l5ImCrae/nlLhA4Ds3HBslJy4AHylDz56SMsEz3sutYPi0qDX
	6oR7flLeGUSbYitmmvXKE0+RL8JiRKj+EDo549eCOhtqeC6s9Befi+QiuBsnCMNX
	QNqVK2lLk48JSJXXFAWC6XkXlJi98iSdZLexCH+IEER8ZLE4lwJAEGoVLcuEn+c3
	6XU4xVV1fUKpkQeMiXo8ZG49yYyBOuSdjf0oCHtIa6lcrXU7HNmGnizfoCcTc1ai
	mkXz6z0UnpPQ9WCZaAZLo9kdvmmE/zxgF3zmxH1bLlDrzvk3G9LI4qdZtvUvmpaP
	qswV3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so6694731a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368853; x=1779973653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=iEi5iRGJ42NwyY+QP8NjD3BqSwoQVNYtz4S3GV5FeQph6y3oQgnk9/FkYutq3z6/mv
         uNl1ddd0rkN3GAOVGtmE4gTDd5ul+zMYHNZdVk6VrQLhb/UKlaWA2fqkKXUgRK4Y3i6m
         I7fzcyI+iWoBxL2PpzEYSrkOQkHRDQSz7bjfl7Fye5yLRb9wFCp5UuAW788D9qUQzq2a
         MrH7pQ+J5QWY/ruY8ISlHA6Geozx64YyNZEERkJhI4zDkLHOZ629k2cVNeNhNiyx+Pmq
         w0Ckro+hF/j8eJxhlDm6c7Hu2K1W6QaLsa8DGDS6Md1/rVL1uGxWTjmNbIujO/YeRQmm
         7NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368853; x=1779973653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=lZy4NBihap4L6FvdIk5EFKVnHrfvkvnBKOoGL1VhjfP8xJLODSidSUxknp3V1y6sNX
         S+bh2puX8MM7/vgACrH844sIWOoGnfbY7pALDgF3TJUDEUFuP7nH9MfsN0MM2jzbc3ih
         sjTTNMBrH4Xp9V4LWfHfl57tY6guUigAiL3iYkltCUCeR9INe+PscXd5bRn1okXN+m4v
         am0yrI7qYfApfaJIgs/pdWDJHCCMJgPuvSmBD/ZQ/JbF2vAQkFQxcydOYEr1mu2Swvgc
         rekbjzAy//wv9kZ3ibrVszBGA7E6uR87sX2elgZ0qfHvKmFMf0Dovskm4HYF19kHuTmL
         0V9A==
X-Gm-Message-State: AOJu0YwGbNBgT0Mzae/m0aWa1+5VQXEurlUsqIzAr+ZXoNvvvsMuseLw
	gGZSHhL8eeMGHGhckXQKd33DjptkFgP0H+8dJDqLhwkSnLQ+512eD7I98EFqi9Like9yV61q3+h
	/7d8kZwFHqCOrum9RQCFI5LYfbhF55fG4FUbwiTs1TJEA7KQ8Xk4nspXnpHfywnArS9GN
X-Gm-Gg: Acq92OELStlxKpM3Zt5R4+NH6BXmr5bO+zn/dapa4BPxW5dVgKaQi9CWG2iIc1skrN3
	hW9HC0U/UxWFzzE59e/8/LP7vN91pEolzItXvF7TuLm5G794eWARfIEANw9YMJOuXWdt/wvL93i
	Z8QXfbpkVQ6myu7IaE/m29iqgFrDIusCbPOw34rOyn/0xqtLMgUEl4srbuaP/pm3Xm+KUEpbF+f
	BeKjSPeQkGhLg49WsxYpEdxOZm1mxdLa42/3MH+SZa0tgXnH/q3Kr2gAsNFWIc9HoizuCR/25F/
	j/70lSAnkzfnbbVmCSFjEIKEufJtW7jVOubRchA29b7MPNkkd+2ykiVWonmSvYzyyxWpiPvenfO
	vavtxh06EGUtrIWwFaqP7qqP833Mz3qXDqvpN0tGAKcJo6FhME7jAlc5Y
X-Received: by 2002:a05:6a20:3d19:b0:3b0:98f3:b120 with SMTP id adf61e73a8af0-3b3087326bamr3506720637.22.1779368853310;
        Thu, 21 May 2026 06:07:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d19:b0:3b0:98f3:b120 with SMTP id adf61e73a8af0-3b3087326bamr3506669637.22.1779368852897;
        Thu, 21 May 2026 06:07:32 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:42 +0530
Subject: [PATCH 09/18] arm64: dts: qcom: sm8550: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-9-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=4508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
 b=k6adMTJy4CttCPiQ6b4972+Jh5QQtwZvSLmdjNiYV2XgiBaCwzTlqM5PXtpbmGZno3hCwAiPl
 FOjZZYgnWokBIqcnT1/8Gc/qDJhSgJ5qr/ys1e5L35dsxJDV4xwjDFQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 6CJUtRpmvyNCe-cViO-2OAjRpaLPvu2Z
X-Proofpoint-ORIG-GUID: 6CJUtRpmvyNCe-cViO-2OAjRpaLPvu2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXxdP09bjPjRUA
 kkTfrIk3WzGqsNtV5wzmXXby94q3YZ6O/3FD7YSNBs34/uGWdHDTSFv+6DwaH+YtbsjztCRh2UK
 hwryxJwzhFXWv3onaIktvn4pfHUUIrNaaxgg0j6HYyayjOjnGbbPbkwmK1PT+9hIzsoy1F33ewQ
 7/G969Nqt71Tl5SEiOhR4/hwYaYTC+8XSIeuZ8X/qwerDb9O6dzj4lzLewtRsgJfZa3yieui8tQ
 oWidKx0BCpSrQtoWbQZ6R4+7gheSeudV9EqP1O28iS4RuvXaXvXUoyOhpkTjZ/Eo6ycOm7gBLxB
 spK1clGwfqfI4wtOjzxdFIB16zT+4KDuHp0/3rCaP3Tj9MwejZhgFOxFNsYpgCpbzia7nQ9pDm+
 nTyOYaUX/6jeZSf0OKeayfgn6h0K7/cSBMp+u4t/sUJHAoFeMHlQSX6S0grcZ4r3wGy7gQFfpOn
 34VVt92/mGq4UTb2eEQ==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f0396 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109079-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9A9B65A5CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ebb643203b..5eb4626c6129 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -336,7 +336,7 @@ &mdss_dsi0_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -349,7 +349,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..4709eb34521d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1037,7 +1037,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5769be83cfbd..7703ebfc1b67 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,7 +739,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -756,7 +756,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..5ce81ac3ab4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,7 +903,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..cf4e4e9d9e26 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,7 +510,7 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 0e6ed6fce614..d23fe714bd27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,7 +584,7 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


