Return-Path: <linux-arm-msm+bounces-110422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGPqNA5ZG2oBBgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 23:39:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D472613789
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 23:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F9030393AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 21:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDA0377EBA;
	Sat, 30 May 2026 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmELaZ9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ8jdbKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91632D5408
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780177156; cv=none; b=hVAHjjkMXMWhxGeOwUtHRE3J1zkB1qwGk6z63VQb0RtaIBRfkt/uQ9cA9oJk8iVq8fLHvK5N44RS2m+T/c8ENPWWqsyHKT3n7L3WczEJg1eP5mSAgt7+7LIrrK0Gs50B9OnHQ5yEFhOpDSArFxufTLQZXy7mZE0Lje6UnhZF4Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780177156; c=relaxed/simple;
	bh=U3uikipcOgai5LqTlClkAP7s6UgjjOw5uDjfQw8Moo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mxh7EusHr2zDXZ/SX1p0t9cOCULXq+LV26YlXAezIXTzcmjjly9O7uf+ungwjOLuO0cKo5o0ZmiUvnAYfVSYEmA4URdDNzahMHM965CW0oMPf94ZsjS+37slhZuBhmF4v4RRBZgrYEpRcheN4eaCjDaeOyNYigpW071aQ8ZpqGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmELaZ9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ8jdbKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEP1Y13121403
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 21:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XStPcciaXim/EyFXMMI2M+
	g9obBJcB8lr08kWm56dJM=; b=kmELaZ9WOlqWMFbWopp/SDuYY02UfYVhypAMVN
	us+seGWK830iNhYg4GIfXhiwXcRzXR38WY9jT5mY9Y7XuyM1dZ53CKKAbIo2P+Lf
	kMUgVrXvqZXxZWr15MXRdkKaE3G5WVcgQFVst07zeV1CtZhJwXZ1eeuFk5zqVpwS
	w6NiO64TjgYqxXO0/i8sUkGvD7u1HI9fvmR1Ws7CwF2W18YxlDeMVCIb82kpO3Ce
	NMddI0ZK5mnvxL8dxBvW2A7N1FA5TaIRti/0clnB3uQdv4t/CbzIs0FwV9euJ3po
	rKpxDIrBKWQQqYbg9I7lUodXVu8PPr2LNCYqIJAso50zG4dw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7s910-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 21:39:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422875c676so552991b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780177153; x=1780781953; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XStPcciaXim/EyFXMMI2M+g9obBJcB8lr08kWm56dJM=;
        b=jQ8jdbKoL+rXcpQEh8LojFehOqgd0CNH3DANYjKozmf6heBjvJJKT/CFHIFB6MNvoN
         nHmMjSHhDMGurWQp9fDZPupahffQXbAM6tRRT8cl9z93T86/l56nNWDJPDqXHf95nf+W
         RyLtPyHi+Q7bUZFXWQQrNek33LRPYNDJhlEfj4YHo1oHR99QYRT1ECensBGoRDZx7z84
         2mEZ6Lor7muTVpWBJ4kd15R9V14OdWL91bTzuaSo8nTv1m58gaehf7JsRa6GJ+ePWcY2
         y90RLaOhnYWv/Koaj7Pox22/ltpOg3ebzofDiDAD5Fs1pD4ypqdkg8vkK2WAwYJtRfQt
         KFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780177153; x=1780781953;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XStPcciaXim/EyFXMMI2M+g9obBJcB8lr08kWm56dJM=;
        b=hGuKrUrko1qROKtL4gpH2bpPK0EtRryqM8HhGYF5BzYUQDF6yOEqKtkCM3WX5yFHJi
         jOu/JYxkCOoDOgYczr6GumZiDR8Kx+jmspybrc2YMWwgOVTN6iQPLBRgKfbI2DI781SJ
         zt6ewidxzUFw24lhIrz4kpESrilfNqbTHgArWXVWUNL/pcpYywj85vG9ufcEf0yO2BTs
         2Xm9V6lT8UKjXnRWYE54SH4HsaBFUXm9A+CnLffcXJgnKFKg6i5AHNm/c/Q47Y7iC4jh
         UonZHZBtXvIL7esO8t4VDRUZ7aFOkQwjosViXYJqVi+LM1/0Wf3aLeXwbX4wguKoWOOX
         kIwQ==
X-Gm-Message-State: AOJu0YzaJVo7TpxzJuRBcG0an3t1p+cH2oaQMR3lxWV8aiS35pWJbrSU
	CiVDPtsybqCajgOUfYsskpn/plcaXXd39QRd044UzsLC2STCfx2FWcob5jYtqar2zRXQcIhFjF6
	8wnYeIVEI0q33oSVXmsPhLV6DvwilRvP7zKfWToV3ldSWoz3gue/KOph4oXXBftLdRMa6
X-Gm-Gg: Acq92OGjVzeYdGjIZsm66x2TFyJS+QAPqgc9Qnoxy1wU1UHZuW/unmnE3r5H9FrAaxI
	5pgjsmW1FX1C1PSHFJnI4W6arv8wdgKU5zqnEy+XCa+tjjvqxB9ocSA7b+3RT9ksdSv4gAp7vXt
	Q3QM7syyNLofx3zd2U7IPLdUsLhnfkAu4DRK3skEuHwUgAE+HIqBhfjuHi73NfCIMXLrvMI1cPs
	33w8TXvKfieTlgRw58uAT0FKmaDM1GBGHYkGQvvT82ETTCTtbFCBtMMU1IJb7Zf+DGjeQ/4DOrI
	fELDbfVu+qDxua5gAKO6YQ47E2I3J6oseRoYf3dklQTANpJRczyKLUzJuk3EdgN1ZRm5cv8I5Qn
	15N4mK73wQCG7mEaB70t7ewxGV6C4xYMhW/BR4+JqEJM8Pi0=
X-Received: by 2002:a05:6a00:4c0f:b0:829:7a62:6a with SMTP id d2e1a72fcca58-84225a3b5d0mr3434967b3a.22.1780177153431;
        Sat, 30 May 2026 14:39:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0f:b0:829:7a62:6a with SMTP id d2e1a72fcca58-84225a3b5d0mr3434954b3a.22.1780177152552;
        Sat, 30 May 2026 14:39:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842313512a6sm2512066b3a.58.2026.05.30.14.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 14:39:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sun, 31 May 2026 03:09:01 +0530
Subject: [PATCH] soc: qcom: llcc: Add configuration data for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPRYG2oC/x3MQQqAIBBA0avErBPS0KirRIjpWEOioRBBdPek5
 Vv8/0DBTFhgah7IeFGhFCt424DdTdyQkasG0QnVyZ6zstORjQ7BWm1T9Mzx1QsnzTAqBTU7M3q
 6/+W8vO8HQP2F72IAAAA=
X-Change-ID: 20260531-shikra_llcc_conf-d1bf2d5a7966
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780177149; l=2394;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=U3uikipcOgai5LqTlClkAP7s6UgjjOw5uDjfQw8Moo8=;
 b=i1MD0wgL95P0ortvZpo1+cHDirYCqFYkPEkpcK6RUXi2msjYSo+O3y5gtAiSQPKi6LrOfhNWG
 0J3FR3jxDXCBbwbvlrZL2dm4mIq9NnN9yHSCLyOrcZcxx1TYQjWbQ+F
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1b5902 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=29tAaoYp5FuYdP7YvlsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDIzNSBTYWx0ZWRfX2ibR7NKut5QC
 BLs5MKFNZMPRpyvTfV5CkmoNZg4v4ubhIIvyxU7pih7z6gbLAyd+vJ78SWlMK4EQHgruaJbaL93
 5bKOq3b4tU8Yk1Jf2PFA6CkPPyBNIpB50CircdPaqdx9JKH8C1JQ9nnSClD6Thdk8QdkOs0unn2
 BnBmfPwRxd36elv2lRdiV0Wc276dmYaaKYWws0STlDImdvSCIpS2fGY7nKvolOlfER18LQo3rz7
 /DwfnXd96+0PMCCJN9nz+h+GsLxJOS2zSOn6odpzqFACyuUUmAXvYrDepygGVJJH5UydxXgj/wi
 gqEYy1GseIqjW2Bk2oqTzM2WX+CGoNWGHQsfRoGuy7QdNkWhmaLAKfLLVZcG/7V2fFKoDinB/Y/
 GcfTHeocpVntEWwrf5iGywDHPCSLDdypkJp9kaA244Gow4VLSEzRQTU58VbqD6tGCAPExHqIMnF
 QcnROqBJvsgo9bA1/1Q==
X-Proofpoint-ORIG-GUID: ZTjqAn7sivxewJe4r7oU_SFRb4J5XSC6
X-Proofpoint-GUID: ZTjqAn7sivxewJe4r7oU_SFRb4J5XSC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300235
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-110422-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D472613789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Last Level Cache table and configs for the Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8948b5fd42d2..22c8099cf6bb 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2305,6 +2305,20 @@ static const struct llcc_slice_config sdm845_data[] =  {{
 	},
 };
 
+static const struct llcc_slice_config shikra_data[] = {
+	{
+		.usecase_id = LLCC_ECC,
+		.slice_id = 26,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x3,
+		.cache_mode = 0,
+		.activate_on_init = true,
+		.vict_prio = true,
+	},
+};
+
 static const struct llcc_slice_config sm6350_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4575,6 +4589,15 @@ static const struct qcom_llcc_config sdm845_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config shikra_cfg[] = {
+	{
+		.sct_data	= shikra_data,
+		.size		= ARRAY_SIZE(shikra_data),
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config sm6350_cfg[] = {
 	{
 		.sct_data	= sm6350_data,
@@ -4752,6 +4775,11 @@ static const struct qcom_sct_config sdm845_cfgs = {
 	.num_config	= ARRAY_SIZE(sdm845_cfg),
 };
 
+static const struct qcom_sct_config shikra_cfgs = {
+	.llcc_config	= shikra_cfg,
+	.num_config	= ARRAY_SIZE(shikra_cfg),
+};
+
 static const struct qcom_sct_config sm6350_cfgs = {
 	.llcc_config	= sm6350_cfg,
 	.num_config	= ARRAY_SIZE(sm6350_cfg),
@@ -5632,6 +5660,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-llcc", .data = &sc8280xp_cfgs },
 	{ .compatible = "qcom,sdm670-llcc", .data = &sdm670_cfgs },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfgs },
+	{ .compatible = "qcom,shikra-llcc", .data = &shikra_cfgs },
 	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfgs },
 	{ .compatible = "qcom,sm7150-llcc", .data = &sm7150_cfgs },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfgs },

---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-shikra_llcc_conf-d1bf2d5a7966

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


