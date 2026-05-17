Return-Path: <linux-arm-msm+bounces-108037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJq6KRzXCWoDsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1D561C48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 361903013A8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E733B4EAC;
	Sun, 17 May 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZ5I25Je";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsVkpBoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C987B35FF6E
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029782; cv=none; b=MlcWEBFrofW7puFdgKQS8/sQWcn8mLqlwi3JNMJ/vmjv23kHhF3Tqq/MmXu67V3phm3pXCFQxo451nQVvvpomN4t2Vv+YTnn7agWj99mjCJMDyoNHn2ClFs9sWV6rHhr12iU2dOFX4sA5xeXPScDwrMJtmDsr09QRtepdk4RApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029782; c=relaxed/simple;
	bh=jjAIzuTBWj3EOyOz+zkSGV2fGsKmUzVqbAMHbZ41s1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=It+4U61HUF1YDMBd8tmpgy5cv2/w9jNWa5UNhC2kseJSI9/9O54V6lytNBoQC1y+LfuamswRCFvSXJiFybaYSmaOeYwe2uuY6vPgFEYU1iW0dxOLSVJOMCcBW1eBn/mZqxCRS+XQq2v86VQub5j5oNKVIcwGfLy6ZP8CfAU4JD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ5I25Je; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsVkpBoL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H9R3oX200840
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=; b=EZ5I25JehHR4yPnY
	rJ3Yu4ick6bvW+fmPNZhzYG1/TQ2p0pH3B11M0Q8y+lrCmTZohpv9kNYF0YAPzIX
	hWwyVP1PKeBWjqGLeFglXs9nauL+u57CbnrflEIMgZAfIfxWOGyfcXU2Q5MD/Nx8
	Y/ZP09CL3/mcGhOREAaLg6qQD0AoreT2zplBdEPn+gNbeGiwK/m2PtAcQ9zqVcFb
	E4f1cA6krE/Kuh5JPARSoTHqL4/8JAO+aPMPH3rg7VgWO65CLIS3zRzXEMfdYtsM
	MRL+dSllsoZ6P9Yb5/UpPoZAxhNHOwDp0jMZemirqqDsKFXVptce0ZFgdEUQ2hzx
	xKtv/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyu1sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so37469411cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029778; x=1779634578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=;
        b=LsVkpBoLK4R6utervkH5krEMy1yIozDUVmM5elBVCjLvIRL+rNuH3P07LMWgr2u7Pb
         fzq5YEkKBhTdKrQAvy2e/jVrofMGxIteWy+sRN/ZN7hob1IZUAEn8iqdMaNXzcNbbUA7
         fkschDGJwh13JANuOrB5d8wsvQkwXb3hhAHFs7cf8Tv3KNPdMxcUQAa0LH/yw5WXkX6x
         UpgXXwlBYrps/8XNW77BjWGWLCiLa71hs7jaglu7GopD82rRtXundonYPWRtAPOBHjlj
         JZoimatUX10nAe9SwH5TgFZqWnayqtsXHg2g5N0iHAjUTB8m0Cj/dPNTGkGNYdbzDg7H
         YScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029778; x=1779634578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=;
        b=o48IybJHgRrgYYu8ssJOcn5zTDpUHaRLF8LDAerGMJi0wAqm9+wMwYPjStRApnnHSB
         hZvKNBOJRzObJcPnFHF4yY7DWpNF4RdmuY0/jsoK24UK27Tqmj8U07vHF31fUr59zXwu
         sSHirxxFRxnL4XibAzinta9rHSllkIpGr9bHW3VaNGacCAa94fGawWJi/yu61uDwoLJR
         78N4/MqpD5s/we++xv6O7/95l1WfTPT0NOqnlVBf3OGrnhJ+Yz6KC2Vd9Txqnuyi2u+K
         MV0p7sbVsvqRJYxyU5JtmNZjTpXR1ETh8rwa7g9KtyXrlfGSfTDmhq8cZGX78s1pWYHR
         jVpA==
X-Gm-Message-State: AOJu0YwdHvSX1oe1sVdiJWGofE8+dnrMaT96PT9mnnnjtDI7klsYDGto
	OLuiCAXQiD+yxnpYI1LVfrKNE11ukYtmerJHc5yqgi7DxBi173EsnuExxxBByJpClwBsYED+21r
	SQVDp/vDs8O86DurRSRVxkXzFUHL6t3gOxM0XE1ne05GoAuh7TpbUifKtLd6mTRlGn0gD
X-Gm-Gg: Acq92OGuE0DcQpiKxOKf8hWpP5eZmdRTDlrRBIXwb7aWovzpT3pzdt/0n3j3xb18ktl
	IQX5eAj+jKxCMQdjOOY0mjV1YqCdcZ9im8iwnM0LcHrZ3mwLmSmtDiu6bgikzzeRG8zMWZtSBbE
	+i/rylA0VaQEJ001U36cEjdC4so3X9rMN2q8ZFhWVjtVqHKUoYsTRITtNYVJpnn/ydzyPQaRRpG
	N8n11PtvWRp69A0MX080W6ynzg44NVuKmCcfuWpISOTYcvJzsdGPLo9wA7IrAhX1C/sgEJcEF4S
	4DRzaDZimZgzxtrZQ13ySyFvF66vFeneWbf7Iw4iIw4QI1pSeKl2xWZtB0HupyFAo3nDCijdh60
	cUToE9f2xBPjvG5egMoL2zlKSyMwlnetyd84VMX6oe6SRsCa9GVXAWkUyruBQ88aCNt6UjIAUb4
	0TrUUmdWrjJABsr/6wR3RySXvFAngofMkMjmY=
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr160437661cf.14.1779029777647;
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr160437351cf.14.1779029777194;
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:07 +0300
Subject: [PATCH 1/7] arm64: dts: qcom: sdm845: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6123;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjAIzuTBWj3EOyOz+zkSGV2fGsKmUzVqbAMHbZ41s1o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcMQiE510ydpp4A9/H8fMSdFpP6DQ6NYePFO
 CKHgmQTv4eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDAAKCRCLPIo+Aiko
 1cFAB/9A7UgiV4A7spEtO/KHNa5i5tK7fXpXO4uk1Ntdg8BdfNEvcI3P9hSwrdhDF/tYJXV6Cmm
 0tD1P072OS1X4ywRjzz5gOkbH1kWXyL32gcIPzdNdPI3zIGB1pG/mTLHOLftnUHao20nAJZynLo
 7OMBU1DrdGiuNIgw8NR1iptMxRu2h+q8BnNO6WsQj4HHPba3nWZ4jH536RC3R8qJD3zonsi1SaY
 imRxUjRAWQVdsYzOLpQ+LJiojLAzehrB4h47bE47cm0XLpr+H/XKRWyHagMQnI7nhkUSYCMcZsx
 O4fs6pLu/MC1Fcf1HcwBVkunImCSvmFVq5OuluaZWgbbqywj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX69OlMEVsuAto
 3tRqcvK37Pk/O+excqrBxevx80edVfkF4q4nUq0x4MvO8wdRH4S9Dg17H0MW3ThB3Zvv74Nj0gP
 vQ2RWYPmYnTdS6vUF42RWUcRQ59UOK0HoPvt28aR2u+hy2Ltz2mH4al1CPYGEnRMa0MUFBrXp9I
 wNVrQRV5cIHCiadUi9sddkdyf6eQR+kHv850c5vhWdZwSeS5KxqGnBdpSa7g1X9P5OeRhEvfqjP
 ceJwVmNeI/iEL7DDuU9S8N1hhDikEdTnaZKIMSlvTLE9MOMO0F08+z1CUblQ7+ow+UPK5ZDfMmS
 C+uYf7VGAckMHxipdENedFikEjKiSCr6aDDL9ZE2aWFnkJpxILdpP5xNlnMJ3DJVO0nkf/+Xjdn
 5Xmtu79Nt6S/MI7awzR38C3tAdEPkhhi2l63Dxic95IIIJILvsmE9xZMkV/9F9UvnKH18EZ8Wt8
 B+4bmr7ROsX8L3GtBVA==
X-Proofpoint-ORIG-GUID: yCdWTkCaFs_Bm4T2j7lydDbMhqbsXvzC
X-Proofpoint-GUID: yCdWTkCaFs_Bm4T2j7lydDbMhqbsXvzC
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a09d712 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XiFT-Wcv0oYtBlDdk_UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160
X-Rspamd-Queue-Id: F3A1D561C48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.9:email,1e40000:email,0.0.0.12:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108037-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.34:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi               | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 2 --
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 2 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 3 +++
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts   | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 2 --
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts             | 3 +--
 11 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index e0c3566761bf..5ac2e058827c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -472,9 +472,6 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 091568642faa..97c79b51ff42 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -428,8 +428,6 @@ &i2c10 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index a6c2519a418d..90136a9b7ea3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -551,8 +551,6 @@ rmi4_f12: rmi4-f12@12 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 0d915ecb0444..a404a23086d4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -913,8 +913,6 @@ &mss_pil {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/Samsung/starqltechn/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 14a683ee3823..590dd9352ee8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -493,8 +493,6 @@ audio-codec@34 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 9b7fdbca9e1c..7f0dda5204ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -285,8 +285,6 @@ &ibb {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index a44d6e776c82..96d4f7496f2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -409,8 +409,6 @@ &ibb {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/Xiaomi/polaris/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..13b85624c186 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2780,6 +2780,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index f04865381870..e38b768d16a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -565,8 +565,6 @@ panel_in_edp: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/HUAWEI/AL09/ipa_fws.elf";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..981074a40e38 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -584,8 +584,6 @@ ecsh: hid@5c {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/LENOVO/81JL/ipa_fws.elf";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index a676d3ea01b9..1dab0582eae6 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -384,9 +384,8 @@ digitizer@9 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/samsung/w737/ipa_fws.elf";
+
 	status = "okay";
 };
 

-- 
2.47.3


