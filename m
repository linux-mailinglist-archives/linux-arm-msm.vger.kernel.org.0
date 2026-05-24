Return-Path: <linux-arm-msm+bounces-109525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GaYGJ5XE2p/+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:55:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2735C3FEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AF653037DCC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D0E318EF4;
	Sun, 24 May 2026 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f11KwDAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLzv2EHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA38315785
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652192; cv=none; b=nUcV1GIRjcxrqbdUmGNjfXYpgwB6hHkv4V/seIIcCupH/gSuRKu+OQHFLzWx/NiLbc3J7kHgn6F67dChFDbBY3W2s07M4gCag2hm8TO7HB9SnnJEeiZcQUOPsACZGQzKBFoihSzGL9V6/opNtUMj/wQHyRt8YZxWkbDyUHblUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652192; c=relaxed/simple;
	bh=BIGk9NUVoNDrOtt6d4N1Uq4IdfPUi7mT/rywQ2ssYKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fclWz/0UdIJrHAml6Em61tHvX4JQCIf0/fGjW3FD643luNVI0zpWKUMCrs+y5vwZRk/OMZ//kiH7WEEUTcCZYUBNOPkMeS0PsoMl2nCvxSEVnVnnmE90LaxyFJ1gVFuq6vzajxxEJeK2FUYcuRvyJgCpotaSW8iIct4issHTfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f11KwDAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLzv2EHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ODe6dr1919588
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=; b=f11KwDAHJGu31tiS
	Kz8lwsS4BECL1KzQ55FgxdQ8k7m0zLCLf4XOcX3MMb8fQB8mNZirDkOvzAt5k3vY
	UGWbwn/v1ENp/5ZhRDEbElW4VxOnCoAS5y+hemT3XV0x9Z+gdUHbbYvBYnbXTk8U
	JlP7y3dv0yVzNQheJtJB8/qXtPsjrl65iRde+lHV+lAGkbGtMR6tA7HTC3VlcTwl
	DfQxmZXiPfunsiV4hMgh2rerqlkVlLd0MEg/lr2/l63Xq2wRWnP7tyKELiA5Y6Gv
	CowxyRcjq+Y0Sd+X3r6As/FdcNx0vODWxItItFiHUUlurB5TrjE4nFy5FuO80/JA
	g+G6Pw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t41t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso9237435a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652189; x=1780256989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=;
        b=DLzv2EHrmi9vfs+pNxxCCbSJs/VLnAXD5pVPeylO+nUrF0cFnhc265uc9sQUjiMNIY
         5Ej1CQ9nRqdXUREWlQUSFegIHt+oHQXLmwM+81DYdE0mJYIpd9lfKOgpM67Kovnp/D3h
         yGYG3+uTJF5xWFKvAkJJmBjMYJvK2rxmyMk1ybRoVgMU/m2Y0gOhWVqwLHIBwkwy5XU3
         u2jAKqYdBYT+2j6+4Be4kr+2MdlGQIs8wRtgi+C81rIxSE8mfg17Uc9Re6RudoMVUGw2
         uJYjrywxetBFkW7oGaq4MZ36tVU36eDkqk2iWqatJVfH6U8f47A8+yDLglk73AWjJWyw
         D1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652189; x=1780256989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=;
        b=FOmhLlUuxgsjtdlR8fdTB5TcVUMRffOENhoz11mZCWGhvxdpsUD1RBzngSQHbrhRuq
         58T3rO5f53MmED8bEzO6wIEIazRleuYc4zfBn/lMyVL+zy9cp4vhIUKZHBexxxN7Hh5t
         tYFWCqdE4FbxVsQRrbq4Sj6pYATmXNuXrSugEGOhW+jD32mIpb2c5BPzZIBqOvyqc05T
         tEyOSmWmZy0Z/i9orrQLKHwTaJVufhYTVP7LlMsmksVUM6DZ8pPNxPMeNIpTy932fNrE
         mHAaiRLPo7TO2+f6BMX+1sRIxV6BOhi2UpozLkFdT1s5WQKiuxOFsWQluYAC/BIxb9aX
         tO5w==
X-Gm-Message-State: AOJu0YzDg5FuiKp+H1xXXFjPvoflWXMzCshwCu2md2l8pJNxmvWqSRK8
	7sHznlObJ41M8s9q3mLRBCLYVb9oYp+jeg9LuBvwQ6rePY52I84AZ71UwPdLXP9ymYB5O1NEDDi
	HKPHUMB4XoSTckU4XBjrsD/tJtpDqqKn7MPjWjOJLpsWmrCjDiSbyV3KUDcQhHbo/LurP
X-Gm-Gg: Acq92OGsnYTQiOE4Jd9GKJ5iW6V2pkFVI7vK36T+NhZ3+lnbfrMglmu8oEOd2HAWrKu
	+cdJvciHiigZbhNx2rILvNuLVf9al/1vX6YJvPUIJFkeeWEGZzrZqFUPMbBq81S+nYkm6U9Au6B
	0WfJfNWg0ezw11k7PUtuvfWVTbZNDASwTdZaotYV06LJfPyASYOGOyp122fpQLJ2TQBsBzbtFAJ
	arlSxaQybAhqY6+DjrWKAhyx6rR199MzLNwlkVBWENjvVHNuQnWr2XxvPCIKP6KVozhaeZnAPTJ
	Oz5B5j+i/a6VaDSrxf52oRIp9xPL+mrDf0MDR1kBIyUF91tm8d1/VsgAa1cOpp5+8OzQ7xQ7DnM
	xZg87BbgflThUyeSNOxVVLg8Y8M6c87DcHEli
X-Received: by 2002:a17:90b:3eca:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36a473cf321mr13318577a91.3.1779652188967;
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3eca:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36a473cf321mr13318546a91.3.1779652188436;
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:08 +0530
Subject: [PATCH 04/16] arm64: dts: qcom: shikra: Add cpufreq scaling node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2418;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x7oSC/QDcnnpqyvWDCndMCwGFZzXKEB/9qcjR+Qs73g=;
 b=HxZsJ/jHJslnVtlepsro7vs9WMcGY5uPTKgq44vIO85LdheKILFcNryAySnY0r2+UCs/LiR1c
 s7sw0PW3rBOCD9AeBLh0vzGROv8XydUBSXVMDKjw8OJyiXlg2UnNVpz
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: amNekwA6zTS1inOqUpj3T9DU9NR_DX2g
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a13565d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sEM7OkBMBn96DhIRBF8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: amNekwA6zTS1inOqUpj3T9DU9NR_DX2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX8y8z00UE3qqp
 68WWFBLvep8R1zdpfi5fAzsvtGgNBQ0zWwimJb2Ek0qp2nwhznqmWXHCsOUrty5VSqZ/AuDqmEo
 RpYXIdfYcLKv5JmtPe0RYLotO5GA2+HUSFZ/9aJOPgfiY7JI4nWvt9eOsbtbgQ64yngeplADuTi
 iUcIJehS0Hjd9bEgudESJyGvfeoWXmupnj/eTwmDgyawmRvYxeM4V9ToUHRlWi3g8ITQaM50XPq
 eKAy09ordzkhisoNTKBZyHaZpFZHcr746F8uISvLt/eNf/z+NHWthXfOls0uiOwWLJGWfzQYgOX
 rRU3y8F5XtibVp0e95qqQrv3+qlPDtL3MMuhuSP7WoVii8ma/89b0BBykKp5fBlMFO5cC49kIZi
 yhJATLYIFTnBPeOSJVLuAQTbeYSiYfUfDSyNedD9cYQ0rD37wQKsdceMDNP54A/zYx2ecaMIs8o
 10rJX6N2OtFgAqKOfxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109525-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fd91000:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.200:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,f42d000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.100:email,0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC2735C3FEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Imran Shaik <imran.shaik@oss.qualcomm.com>

Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.

Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2751b4f89678..35ab7072e20a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -44,6 +44,9 @@ cpu0: cpu@0 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -54,6 +57,9 @@ cpu1: cpu@100 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -64,6 +70,9 @@ cpu2: cpu@200 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -74,6 +83,9 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -1780,6 +1792,25 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		cpufreq_hw: cpufreq@fd91000 {
+			compatible = "qcom,shikra-epss";
+			reg = <0x0 0x0fd91000 0x0 0x1000>,
+			      <0x0 0x0fd92000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1


