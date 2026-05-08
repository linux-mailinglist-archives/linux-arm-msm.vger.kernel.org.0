Return-Path: <linux-arm-msm+bounces-106603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ9qFE+h/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:39:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F54F3D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42B1230610C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A028535CB7B;
	Fri,  8 May 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzGXmzFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuYYGfZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20379382F08
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229414; cv=none; b=RIy221aDuun197D+phpTwL5lPjfnDeJHfO1xiBf6oylgkRoeScc7bm6oOxfFMt9kS40msOQy2IT7HV+vAbd6qb4Nt8TFLly4GhjqnSlhTkB6tTyiKsOzNhI8GH9Lmw5WHq92YHFlZWFAID3XOm0oyVnd3qmM20qRHYMRYAC57h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229414; c=relaxed/simple;
	bh=wx/jnONfKO6bxVIAr9KzJFD+If/eHxWT4o8WYd5Uldk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYl9S5oiqqoAs7QDhXjWVVWebY5mGqHpSKyA2kR9J8SGZ76BsiAzXm/T+pI3fvS0Uat7wD9RFlUTCIyPg1Af+IRnLGpsYu/MV7z0nfS6Dna4DLVOmNMijvgim8sAXdVgplqyRYBNTMvOmCxvSu7Z2w158VZIougxFkwnfNqicJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzGXmzFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuYYGfZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484wbY92183070
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=; b=YzGXmzFZPE/JOhle
	NfPwyN7cK9nDtDoT2j1v6OPqAIpi1NGWaFtyRKuvxUu2RWczC4DPdNp5O9azf6n7
	5od/K8CWMTVMhMjL1OY2L4hlfB2x+6yjjwPgWYqtpRMVCNDlDeGq6iFVGZlpqIw/
	Pv+637W4Avx2zVyXPfO9hUVQbsujES7UvX4I4+8QVOFE/UUHo8Oj8NEzrcJ0K9KF
	8SPYyx0ajrLYlQ6399iVIqJRg3isdyLxP59Pjt3wgeFks2SwA1XBjaGUP9vsJSf+
	2nizERfQztOTbaXIHHXAuPLsWsScOYw1s/Q3bm1GWooKgOyItzblDIPXJNK9uIAp
	BNcrSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyagkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:36:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2222414eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229411; x=1778834211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=;
        b=EuYYGfZczeaFKnFIboeodsCFX5HzTjRgC0GLrmcEDjnipAd6gcUIq0xr6noppQO6RH
         0tllC+VfOuBfpaD94QLX8P6Q0V2lynonhoNbiPKyLncMxWAPCLF274FbE/KEbWCHJhXb
         Q9QboxHXw8VDox+FjZgRVmw7+TccsiVHivNF95LG4hw3kRe3UWaCasDQuVYphUSaZq+x
         bHzjLvUlqB8oXCJGohxf1cQMEOwe2s3Hk3+zSmfTzbs+S5tJ52wk1iA+Cn4ZsUa4XZPh
         mqr0TaTYNrChyMjzWzw293RGvKP+uRybk7Rrx4f6MNOtsivj5wmk5LRK0XKX5aVxS8Oa
         Q/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229411; x=1778834211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKaElLs92TbrRphRlbmQTzsP8ACzdFCzi6ucUcLlEoQ=;
        b=Ykp7VcDjlGtfJld1b9Q2USbSx2yoR7hrgj69k1dyqexsbhT3/B+VBzGC6OkPrywcXj
         +bjT7yP/Wa4XYxIijddSxqBdH0UVyNbOt1i/0+SmI3yrl7JRYiVPFjZtLuXHv/nk7GfU
         ebyf3gf9Jt5foeQfUCQ5yzbvuP66P1gOK9yKio1oeVGUmxVj4eCAyQ24tFNCJC2lYvAt
         heBnHeEA4ZNtklRJfuNVyRWREl+7jm0XWrHfVPwn1qFnVvAQ/ovFPBQP8qpa5SKGZx4q
         /Da/vkTSgcqPxNBxh0qGu4eMvK0JcvhbqK42ZzUdWM7RNpykSkf2azcaV2JvIU6nmTff
         9BMA==
X-Gm-Message-State: AOJu0YxRrWGMke2tJNepGPanD6+ZIFGPHPEIDvDkKjvxnNrTuu927nUo
	kERyW9KxJQaiCbzjzaxY8KxStjiraLuKpfvVRWIDYzVaFi1NVilVLaBNVNWyfOUvvCvCpItVBta
	/pfDNf94YHsv+ojjKmZSUXZGFHftFiIwPI2oUdCHCoBVP1RKF6XQr98NEwi8xpzc054+v
X-Gm-Gg: Acq92OEzb9qtcvi4HYDHuL4M6L+tv7a+DU3Dqn3Ahzd5wKDG5g8n+bibHLRwljPdkYB
	PV+XtmGPZaTNiwvXu9WuIAkGc6Ob6rH0cmez4T8bDHn8sfs70YsfBFt1xvZB8lcTqzubpCcQ+l/
	9Zqv5WlkhZTH5DqshjaLEcqW4qVTWwAYz3rzVycQXQNwQmTq1C/SwH3jRljy7Nq8O33q/lCYWtc
	Vxw72rkY9JD1qJHOBBdAGFm2H+2B9bZHjazVluQA5GF00l9eWtFfW8WKBipPUBexPoZGSICfi/v
	9OOORdDGY0pw5vux2EIGpHyTtokLizMaVn9qJcdKJAK8UY7dO4ezkk6rR7qB/OZPTCd5AeBOuCr
	Pagr/onwIWJLpYWQQ6B0mq2SCq8e9JSuhoQKkUsXZb6hl0jPI50HuNBLQa9lYvZ4CcN939M5ee/
	ot
X-Received: by 2002:a05:7301:2f8b:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-2f548895150mr5796597eec.1.1778229410966;
        Fri, 08 May 2026 01:36:50 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8b:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-2f548895150mr5796585eec.1.1778229410347;
        Fri, 08 May 2026 01:36:50 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:49 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:36:47 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fda0a4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9_aMYF_q3wMrQPXvZMcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: L2bZx6lvGNzrth88g2DEgH3UB3U_f2O1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfXxXds2Wiztlpy
 oamT0iGJOiyt7CEDQBei1k9CFfKOvV8CsIPC0pO3rFaKIjISzqJEuvHZ/AeVIxThKt9Or11DWsx
 ue6G8qUHZV9QSIHNIo14yxP3MHPf0LVS9xz2pVo0gfTvDly+lfr3zSY+sQuA3V1ZH4SvC3We91R
 WX6pl2dOPolY7PaT+IOiLnYy5+YBN6hkq3J2kPUwJMQ3JotqbypaZkgAsB9C6tOhQ77EEkNPEMp
 qDxOVOkwPDiXHUoAwlL1fC9fjWboNzeHBRYc8yHJxN8x3MMC0oSn7NMSRD0aUDFgVaox6Jk/Mra
 0L6qUBlkes62m1YQ/+G9PgTWkDNqN/V8b1paSF1f+v+IrbLHv9pKXfHf3to9j0I1jsxAZHj7/MZ
 cGLLUj45IR7gnXeed9WQ2Yky0UOxLL5+dyhCjtshRtgqt2OJXtG4sYosB5AMA2LXJRkGdxuvts+
 hDCRgjomRIFsbf8LIKg==
X-Proofpoint-ORIG-GUID: L2bZx6lvGNzrth88g2DEgH3UB3U_f2O1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080087
X-Rspamd-Queue-Id: B64F54F3D24
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f100000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on Kaanapali.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ed7b7af6c43f..1b0ce1d29390 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3903,6 +3903,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio109";

-- 
2.34.1


