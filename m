Return-Path: <linux-arm-msm+bounces-105212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLq5HH8J8mnhmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:37:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5DB494F36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AC9E3061A42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC86F3FE37C;
	Wed, 29 Apr 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMqhbqkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PH9GN3Sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37D3FE365
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469206; cv=none; b=IYyUMSHkmXYSTXSn/bIs9mOxEEGMwtkxkk7thgeJ6+IH1DRKBQHpmY3Ym9mNHVgEcnuq1BPZ1DN+C/4XfT8yzlFNxOjzzjom3dQK+DBjMuzuoeIuAb7EWsGZW7iO4Pp6xjnX9zQLKSY4WelosRmd9CAiUFop1fGooWRCR1xKC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469206; c=relaxed/simple;
	bh=HgnxSG6CQESGRtfziVGUP2mLcl5BYUgeTsVkHqtk3kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSd/YmwPi0/IZ6wHX3nTdKrDSeRbhqrf5DVWTLvxErK3HyCiMsHKjT1hVaQRz5EpH0/CY1WpVIE+khFm7lRSiF6UB7zZo9naBTXs95nhLPtLzv/hA0BWnqvJTiEn9rIp8rnJDKdTjQHygJqRJueH3WqKlEHYCONZNMpAWpd7PHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMqhbqkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PH9GN3Sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxv0963223
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=; b=TMqhbqkjKE9DQ6qW
	zCd3VYcEnE3HuCwa8jPZfze6uBPagMm+cKXvydxRmYTSohKHjAD5mo9j4jy+1iG+
	NpD7oC05pyjN0F1Pj9XqMHAm6X5I0Z5Kq83X/SqDROA4KHJTAxcmWfdTnm/Uw70C
	1+zwQQs/KH2NPu523XR23Tm9/39q9HLS0TIk3iKqQ/vF0xOx+HjibWtWxKU0/6xW
	bdrL6atcxAssLRUqCfqCFENrIaQgXMieMdkgrmB23aux0cpd4+me0oW82rxKfMzl
	UfrHNxSBehtR1mwTypWfEoY1mGVSw2+WCEUou2UF0pcszrWHcEmQGxFg06DayCjd
	pvdSTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uhug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so11065944a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469203; x=1778074003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=;
        b=PH9GN3Sv4Uegdea7dpc1tFh2Jk/N06pcvWB20WW2REMmmcL2PzIFihKmhngbm3WkVg
         zJjbRVQyN0wrYAKN+qlZgAvsyqfbCPJ6rLHPGepjXapflCKGNX63CTzC+EStt9ROmDS6
         ko/mhvPyCV2cA8XmjalMBZ+/vgsH1Rj03uoI4PzFolc1u/tXeRn++eYYB05WDyM4bnRp
         lwLSHwT/nP6qOVw+yo8Lp6v/qAzD4X/QpZD/Qk9i52dOPID8FjccxVG7LV31Bf1s+q94
         flbXijsAOliXNRWEQPf3SDkA46kn+883Uu3hJaOcHdXBiiRXvlFOfw56vwOLpIXH/1K5
         /Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469203; x=1778074003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=;
        b=gelU/DXEfXxXU+Fm7lRuiFqioeX9mkj60PH6d5k69C7HyLZzUFGqbxcOqJow3ayyFV
         ifvwmRRtfAM3JmXLl1BBBFA2ycIkjbq1kAO1nY+8ny77h1Hvu9SpG+f0AK8tjXdm6nyc
         xBST3++jq69lApx10e50VDTdYOhzy2yFCGjXlEsBzHGA8sPfbjUEJfRbCibyEZZmQEnL
         MgrVfx+2Eo5sncaTESVXQ7bT9NBoCCZlrQqe0sTjocjOksarlOpwjmgBQ5BwM9LK6uya
         NeTtP0Xakk/EnTd1nOJF1TAzkF74+bQU57aOGCdruPlvgxNu7Nl8aDEkd509TI1mWV/l
         +L2A==
X-Gm-Message-State: AOJu0YwObKzDCshefmvlYXW2IhPPjo8nclQEGh3DUCHvBF5WWAsQJLFz
	XzvrErkZAjjYb0/U+2kLhWd8eg9IRIX9d16NyQx6kYZV9PyI6vx1a98uFcD2RVEzEgr6axIFJyn
	KMm1fpzRUnNvqZgNRdWdxuf2tEYoESSVjvL09VS1DCmBLPgjxj2h0MT2WtzNEOIbjRck=
X-Gm-Gg: AeBDieuZifr1LIa8Io7r/dazeAKj9QZQmOQNGc+fRLdIo90rvxQqgeVNY/A0SI/krR9
	CANsCcyP32G5cC4woCFaA6O4IwrYXW7Z7vH8Ib3uEYY1QFoJO4QwwUuIkBMOh0oE5Sxq6luOchD
	GBTJ+vYYast+vQUMWdlC0y5uZUu1s86pjArAmiy2gQXdadghLn83Sj8fJb//zZ9n/Px5etz6Y5m
	K6UO/mS62jHwPgNj4ZaFknwDEBDD77h7ulERBceT+ucw5w+dPCLiQ9nUmeY9VpxcuyK+HZzr5jf
	4nuxnItV7g8Lyu/v95WQ6LDYl+ZNYsZKM1XQBRihqsNa7L8AV+xshTXl1Sd8rHE3LkZwjL2JR0j
	17THWgDKuPlWR/atZri+T9yXXtGYbAP1Ux6tmX5B8675N6oGXxyxcC4C4pC2jew==
X-Received: by 2002:a17:90b:35c4:b0:361:423d:2026 with SMTP id 98e67ed59e1d1-36491fce3b5mr9442457a91.12.1777469203230;
        Wed, 29 Apr 2026 06:26:43 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:361:423d:2026 with SMTP id 98e67ed59e1d1-36491fce3b5mr9442408a91.12.1777469202774;
        Wed, 29 Apr 2026 06:26:42 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:42 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:56:19 +0530
Subject: [PATCH 2/2] regulator: qcom_smd: Add PM8150 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=3511;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=HgnxSG6CQESGRtfziVGUP2mLcl5BYUgeTsVkHqtk3kw=;
 b=WaEaerb6eU4hwB+3YZ3qWHolFNL+6Yh3eA2gTP6MZHRvCIwNrpawht2nnrTegO0iwvqXXTm2Y
 NrFmh/7YulIBAVhiLsY0l5VBurNzm25Qp+x/ih6tNIXZTD9Oy6W66Xc
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfX9ljM5YyFGkCZ
 NfEw91I6eHN+a3/vogejLSo0y4sWs8lMJ04gHBYCksVMi7M+5PNjzafuKW2uYE+TGWMJ/wdgSmd
 CCHVDn3S8JuCPYE3rJrXuOk17Lo8JwZG42dtEHVQ1CLttuvR1Z6x913zcnDbunbQCP1/xIW+cwB
 g341R09/33qBl6QFA+of1YCKVq2XOLnM9DGF8t1lWudlLlslQbmzaf6HpzXr07zFc6D8mbpss0D
 1wT+QhvRnq2JuVjagaDZJlCOoFZMB8Dl1P5xx+6pS7VzbLxcfDCHzU68yl4/WmtdGho293kukjF
 N+21zIs0jhdRH6BfwtoIGeZHai9Y+4CpxBG5ofgjTVHG44gpKxFutbqDLugqLGUzBwFzh9MKptm
 ltd4dZOoPSYwM/AHo9FW1a90s04DiO8BBaJ8NJQOL+NtfsQMQ+K2qAw0IMA5LsvHrJu71c5+dfi
 xt+Q4ceRvogWhZjgZUw==
X-Proofpoint-GUID: 8gCMKLTqgnWf6Dm5oc7BTufpoCmKYSCq
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f20714 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8gSCahTmEWBAQWhSExUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 8gCMKLTqgnWf6Dm5oc7BTufpoCmKYSCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136
X-Rspamd-Queue-Id: 8E5DB494F36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105212-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The PM8150 is found on boards with shikra SoCs and It
provides 10 SMPS and 18 LDO regulators.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_smd-regulator.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 25ed9f713974ba25058c9dbf38d36e88f70a940b..3ee7f5d0c694dba74b4e7e0e2e88db275d9ac3db 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -913,6 +913,38 @@ static const struct rpm_regulator_data rpm_pm660l_regulators[] = {
 	{ }
 };
 
+static const struct rpm_regulator_data rpm_pm8150_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pmic5_ftsmps520, "vdd-s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pmic5_ftsmps520, "vdd-s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pmic5_ftsmps520, "vdd-s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8998_hfsmps, "vdd-s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8998_hfsmps, "vdd-s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pmic5_ftsmps520, "vdd-s6" },
+	{ "s7", QCOM_SMD_RPM_SMPA, 7, &pmic5_ftsmps520, "vdd-s7" },
+	{ "s8", QCOM_SMD_RPM_SMPA, 8, &pmic5_ftsmps520, "vdd-s8" },
+	{ "s9", QCOM_SMD_RPM_SMPA, 9, &pmic5_ftsmps520, "vdd-s9" },
+	{ "s10", QCOM_SMD_RPM_SMPA, 10, &pmic5_ftsmps520, "vdd-s10" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_pldo660, "vdd-l2-l10" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd-l6-l9" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_pldo660, "vdd-l7-l12-l14-l15" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, "vdd-l6-l9" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_pldo660, "vdd-l2-l10" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ }
+};
+
 static const struct rpm_regulator_data rpm_pm8226_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8226_hfsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8226_ftsmps, "vdd_s2" },
@@ -1358,6 +1390,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm6125-regulators", .data = &rpm_pm6125_regulators },
 	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
 	{ .compatible = "qcom,rpm-pm660l-regulators", .data = &rpm_pm660l_regulators },
+	{ .compatible = "qcom,rpm-pm8150-regulators", .data = &rpm_pm8150_regulators },
 	{ .compatible = "qcom,rpm-pm8226-regulators", .data = &rpm_pm8226_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8909-regulators", .data = &rpm_pm8909_regulators },

-- 
2.34.1


