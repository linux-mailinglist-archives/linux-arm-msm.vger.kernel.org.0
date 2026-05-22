Return-Path: <linux-arm-msm+bounces-109414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAnRNnG1EGohcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A35B9C82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A73A930283F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5D53812C8;
	Fri, 22 May 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/4EYOlh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX1CjANI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E63822A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479701; cv=none; b=oqvKVSr+Hq3s4pQeFee+7JgW/T1o/0PfY3GQk+b28qP9Rn1//786lQsiv6j3VLo9TnhKXEI714nkkwsjOp33EA3/9xiSZNxCULw6BvwaFfDpWgpaxN8d9TjsxjW7WIXgFbOPnt0BjtRYeoxyB3rJYMrIs99ghH+/AYwjJlXN3UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479701; c=relaxed/simple;
	bh=UKjmU9ZL5XAcwn2dvwq3zYNCHuqXKTIRCrN+s9E66zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltQtf5szHoftPn4W7G85cSHcqGgEDqMCFa53OADK/0csBqoo6T7owZY43ZwjsAOYrH8Gdw8QAf3w3vR2vw88EQpc41+ds8PlvWun7PamZfBfqT/E3M21YmTYGknPdu9tRhrXg2iqJAFJdELmj/uDlxA0f5UpjvLmBQaylDnvw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/4EYOlh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX1CjANI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCxl9V778902
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MQozHojuwIg
	2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=; b=e/4EYOlhUyP4RvGkGPD6c2Yqd2L
	Chh0b/67iweNZxZIzCCJ5F16AggBZZhM3PjTjzvxTn+WP+WhYI9c/uP1m7KJSxTE
	Ht3dRdxwLajPGnO/sxq7TeNnzJgxeT/d+PIPygm8hhxktEI2ZdMthVmT9/E5X1cM
	GF/LlE/AWXrHsyMswuu051YfFq1QMZBPf+sDBu7V7l/x8m21XdQJ1HJD10EHA80T
	U/AW6aYOLx50E8BOiDH5J98SRntL7v25Ip6pw1X43yYVs3eDDQVGDiOkzoCJidL5
	Z1uNKjH9p+EnP7NA6bYgPLuQ9d2QH0Tbc89tTMgM2Hci9RZZC2oN5jl1vrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7avd8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so83243085ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479698; x=1780084498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQozHojuwIg2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=;
        b=NX1CjANI1THbXhO7aJFJYT3ILnq3mHzRighqkklgRamtn3tjYNtybZz7lomXcjozox
         iVrwloB8Q3P50vJ91ntflKLh1Ugmv7Lvyw22Fvk5M0tUAKIUsYQ+5zY+UQ1PLTy3YFh2
         ahcbFunMz/xC75bcmBwTPbalSqw7rzCU5gtguFXbC+hsn9Kw9pzMN53eIOWWBXNBzx2R
         xuQn5R7+4r2lqDIr5ZFWM4rqVnNxyFCH0rx8Uhx3QNjW9kYILczU6J/cYxHkBRXhroiI
         GRVJuVu4peWxilrxgoI0DOtB8QGrLa4S+CdP/JyVFXu2Tyjr6AIeh8Siak3YuM2lHoLN
         o5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479698; x=1780084498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQozHojuwIg2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=;
        b=M8HL5MjQf4/xs3dBbaqqCcEeqqmw932fapIh2JpkuxbW/Fd0UBhIEYKxPCgTlMNNpW
         YW7oFIPswNsDklZx5U4/JZg+4Cp1wyIbbBJv9UT9VOAwxZgcopHDYz//9FTITNgwydwx
         8mwoSk36tc9p/GHiU3R67fWVtz09TKLQoNcd+k+TAm8Al54hU2LdO8DmTJNXcbF6PFzU
         swqkLUZbLz1/slriTQXw6d2TORAdjq9nPd/Ecmp8lr4pHaIgArz26vmp7nC7IuFt4450
         pSmh1gbxk2kexyKQvS8fJcbTWf602iDta26JdLJOTBpgzAGJccND7lUwi0PcHhCzZSPa
         O5Gg==
X-Forwarded-Encrypted: i=1; AFNElJ803lvVAdjG8BqqIpAPEJIm25aDdKHz+/Fi8oaaXdQ4TSRcDyyL/KucAQmzPhoXt1woTXrSWcCYsdIoaSvS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0o9vwU252lDCRWa1IUprRSeSPUaQ4nplM7cqi39eylWqofT3
	BHp44wOMHv5CX/h7z6EIAobo1B+jaikyfZ/w8gJZ3CalAPccQMZrYu4PjFMvuHWY9QdU2cvWGGs
	fy7G1U+2mUi9QmKeBm/3e1SQ05MIzCP6zzSGrERVgnD3/k7Fwybo1E6Fmh6kw8U+fONF/
X-Gm-Gg: Acq92OH9suhI0/9kgaQuawZSdljYVr3X/oXQ7rOvfpzlVt/HdsFAbDlgaENxZhrFtXx
	R5PzpShiVxkkbgFZg3lAP4bsHeXfjYNtwWg1YFfr73MgrhZmZy0EFLCBJc+Jf5uO1UU7rl+dWLq
	BIUlsQv4cgxfdirTGhFaSlf+yzFlXAc51KU6HIYqeQOBo3JxNeahwz90e7YylKVpo4bnn86NWpU
	ZWNFmFeoulS+5aW7IMDfNjvNS1zV+JEOa/SBOeyXaDwUiimyPKhiHinWQt71BRL/e3RlpyOJKEC
	SPUbjYnSj9DMQV5mv+zOaoPpKJOBNiwctpwtTs295R2QU5XzjnpleVfjJThlUCYft+LlF4w871f
	6PDtoVZFXFOJF6Xsv64PC3nHgV63hHmqrn5m5k192GJf5DiSu
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr44427135ad.10.1779479698319;
        Fri, 22 May 2026 12:54:58 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr44426895ad.10.1779479697820;
        Fri, 22 May 2026 12:54:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 14/18] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:05 +0530
Message-ID: <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E2B6Q115reKpTn2Ju7J_9Tk1Y6z7YcP4
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10b493 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VytTfPOW3k6kkw8Luf8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: E2B6Q115reKpTn2Ju7J_9Tk1Y6z7YcP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX7lHjtW3pgWm8
 /FD43pecoRH5NtFzlLXBSjdyAGNm/yU5OocfT4rkH8E8mAp1M4bej6kKboFMUEBAIqQb+BTV7if
 cvImH61zmP0SGy/pyk1xK3tc9s1DRD36hugvlsjLjCiwMZgtuhSboj1MGzvH5USjaheiuNGr9tb
 o50Ds8iQ31dTcyBaRUMsIxCpya+j9aLm7U9RoV5a8nXzcMjpTnEHaRzhjLWUbIHrynWl/CPfdve
 a+I0hPNvWm4zQcegUmtwwhGQunVoLxkzSwLIwng7PG/+OH9hEIVBQSHzJtYPbP9IWjDt2v0BBIY
 pwsr4QlalOnmYiOjISv2B/ceTnQ0iB0PXlVSAy7sz2G4MEnwMfXHfdoR7eKn7JFULfg9f/NIBfB
 CFUpR0raP4qLQyecGsjTh2BEr+OUdJWdpbJ1D7KJHr9rethByKg286cjhpjkr6F2BW1p4NWvcVt
 T+D6AAX9HGqQWDQnDKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109414-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,1c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email,0.0.109.96:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD4A35B9C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8341a7c4a4c6..308a14339b3d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -385,6 +385,7 @@ cluster_aoss_sleep: cluster-sleep-2 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7180", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -3592,6 +3593,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0


