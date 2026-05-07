Return-Path: <linux-arm-msm+bounces-106281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OymMKU6/GmUMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:09:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8F4E3E41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAB5C304338D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 07:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D702352C5C;
	Thu,  7 May 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3iwJ48V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8Or6Xzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FC434E761
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137714; cv=none; b=LoQyliGnx71yzl4O1Z+pNDR0k+ibC3lQHsfpNeCJd0Vt1UqjL9IoQgWY3Pne0WFx/Xc3ZcLrAu1QCwDyvf4JVgMOweR+RXcB3qvQC/CB7arrJYnX2lszktBjfCK/fLykXFa0YnBDlUHo1+AlJuvXrWtbF1doKSH+/SjCVeKPaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137714; c=relaxed/simple;
	bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM0KR1GaCUtQxtYsG2GzFUytUlEBegfEVojDBMwyEPzw5l/voc5uwBVnGspaWNMOurlC10vYmwmJD7pnrcjtlYrPcSIM0UUbDpr3at6g+DGKke95dYcdhG4vChN8Z8gdfMOm4zCzfgAvpCzUDife5FrEHY3TIXXsDsU1Cjz4phI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3iwJ48V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8Or6Xzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475BeF43924344
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 07:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=; b=g3iwJ48VBAjO20P1
	9C1LYNgb7hraiGps8ufi7jWbThIYsvA+4vtkS4w3vODdEE9vEakJaAM2OrmnPIRM
	4Voljq1+YyT0F0UISIspuODlLc9D2etxZib4SI/a2jkOUC7ACy2sCmp4IpGmGGRv
	LskksV8Jhi2mEBddFLRgLxcJpf9VmiwrA+tvoZ5wy3zwhXx1eyeKy2hWOsQr/avV
	6UNVXomWEWBvmEF8cmY7c/AB9spf4UYRqmKg/jpKmXFXdxWDsidvHQBpBik8Nz9v
	Cus2GWuxQe4TIdUeTCEEx4gIfRqWf6NBQjNGebUKKFGC05j3U+fZrn8agmZv9ZrZ
	emK5IQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889wcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:08:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e2592ea3bso4841611cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 00:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137710; x=1778742510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=d8Or6XziTA3Dc6jfGcQfOPUjY+KFjKXvqII8fABQlDIWfoyhb1RaDfXtjBnkQ+37GN
         Cn+6lM08wVICcVgGoJwJGHPamlimrLgOOSAB2+up0ZFB1WkKLg6LVZ7/jPAwtiY5VlDb
         eMZO2S5RNcLaIZ4fQJIHCXMa1cUDO/PYdZ7F+k4c9FIoEqMPyX7GCjS2gFTHVLic7v19
         GaeZZ89HGBfqMNsY7SbLTy2ab51EWxfUzUjpO/A8GTpciDNhlm6kEikVfi4twKIUR+Rd
         OmJZUqAjPTzhbtGd8VB79cBnyHvw/ZNZ5L42+87DOuTG/4YLmVeA7TVUnX/98G/5fZTJ
         XKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137710; x=1778742510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=KsdupANxYBr8SLpfK9AJdszYdxklslcN2+Alhx/N4i2lO5OEZB+XI91cH7Z8OiR7Fk
         yyXklg1b4jte1HLcrrPn3UowokSA1KFAxWNImCbk7TmkELfyiLIeM01FtiAge+sxRxfJ
         VWL/VO3JadgljMsmkk/pKqH+jaPKcF+bDQpwcJkPmaFPAMU6RfdJKSlBuYdh4eM9vp+M
         ysFbhMYcLbDX+j9jGkEbfwKq2YCdiInvSR3+VqP0G+9z5LrC6Dd6nvPxOkv7iuenKwdO
         Kfqx6ilOhU4sWDcrMcbguX1fphxfX+Ix2HqizH3cFUl7bBS1xdM4MBLR9E1Xa3mV+czA
         KupA==
X-Gm-Message-State: AOJu0Yy7o6Jac+3PCxlfY+poEjImlLIpOIMQPG37ev8e4R/NmihKwjDy
	vSCp5o4iYJU/WcVsOOu0xuKZVRm9w8LEKEemupbFKS8jmeArOqSWsUd4LxA+7mY+WbB75IW0lUs
	uA/7T4fMITtmljJzkWJHAgSBpqxb1wfaoJeWXc7D9BWMJi1WVN9OZyyYLpyRYZXMhGTLF
X-Gm-Gg: AeBDiesLueGI88GzQphryie8Jcgtufd6h7yBZmvWEkptWu1xWAQ57aXrO9Au6kj5ZQ0
	Nl1PIS7tCuZh/tkM1kFYvpBwBCKI5q4DsWhfrOzOOyGWi5lkd54mwpLzTAV661RFmuTw4p7sPA0
	lmdK2ANL7PU8ZAjOeG1Mmdtlcvvnd9bkQWznUDgeEiLysrEieahziT0cSBKVflhHq9tk9U+4+Ex
	TjXtDE7TjtmZ6ytJu605iOW5sxFkXqzoIYe9+A/GpDqochVAPUWffFpHWSeAvRfhW8ySh8oPCaS
	nui26efAWGEggXFFNHHdmidUVAmoibSdTe/OzmKxzgaZJ+WwdE0yM+gR+VWsw2LTYUo7r0q5G4i
	ulC1njq5agHddsLGe6jeYR8gI+h+eiN7Sq9nz2F/X8bpPFCgZ1ZYVF2MxpdS9ijyaTZHgeSdBRS
	Svc1hkIDgHZvWvF7m+3Jg+baI9bqsma/dBGrx088+QfQS8Wm3AoO9HPmzQ
X-Received: by 2002:a05:622a:4d95:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-51461e2c38amr95626831cf.24.1778137710301;
        Thu, 07 May 2026 00:08:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4d95:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-51461e2c38amr95626401cf.24.1778137709847;
        Thu, 07 May 2026 00:08:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:12 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DphvICl+UHYA4csk9IecGwgiW5iWmHpgITwi
 afK8jO3IhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YQAKCRCLPIo+Aiko
 1YIcCACLZPXUq9YSq0jE+y8NVrsRtUrs4D3Eq893UYCq3bp8L6I+NtMmdXO5oJbyLCDUcbIdzHO
 aSdPukj3S7Y24lUP7X1tRDTBjdOgUM2lZznVaIKJMs/BbS7IZCLf9tfoaueopkhO1Aw66xe7zNA
 rpB4sn0s3W9x0XfoDSq5RZipvMhhz/PP8qBHhyLFNPmuYBU1ZYiNeWlb4vioMYjmbr1lDIs5MoK
 LUOwOkm2jc7xyYxe/zsafh5DHtiPUZWKY7wspj7oTG95l7AQMOGx4xVhSvvY2kecnX2XouIa+K/
 T3DmxK91OG2+TF9y9vtmb5v3ixCiTHFVOHU7hERX74c3R3nw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: k0iHx4fkiwNQUDXXmVj_e3kc6GnqPr-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX3hWOa7vA3LsD
 v0NBmmiaN71VKQmKltiFxY7yyDSltFMfup/hjdL2FYa/DjnsOGmhcFkvxlz+XzovW2bzME8rR+x
 +PxJagh/CddTPS6PKkYTcEMKRjChszh0P27/r2v3fTTk4aEP5uL/AEJXlz/gqbMMZunkSEHhrqL
 RVYGmYQhl9FhXGoUePrOtX8skIHuzFEIuUkUYwqXoe6xq2HytjNxwm/huvI+uoAy60wF88LeGJq
 8DgIc/kCaJPQmuX7Vfe3tFBJqfssH0ANqxa+KCZxcT1hYczhhGFSmDe53BYyD9qK5bRUE2M2aob
 P+QUDQ8B1cZsnb2jDTRrWlHHUh974yn2CB7cVZneSisHt1+Fsh1q21bDql/dlZBL2mwKW7KyWps
 7BUUUSKvOS153qysVj0Gho1XhPbymLr9bFgqnwInAnIFm7nJr+cBPcz+lo+MrJ2ANEBwk+SXSEw
 TGmVHJnUDk/WklvFKpA==
X-Proofpoint-GUID: k0iHx4fkiwNQUDXXmVj_e3kc6GnqPr-M
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc3a6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gWtj1UajujENYCbeQTwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: 5FB8F4E3E41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106281-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
firmware in the DT for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..a6236b09cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -739,6 +739,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/venus-6.0/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

-- 
2.47.3


