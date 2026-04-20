Return-Path: <linux-arm-msm+bounces-103676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF0WBhLW5WnWoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:30:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FC427C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A228305A5C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB210385529;
	Mon, 20 Apr 2026 07:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCPloTS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgyVlzc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2C3845DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670036; cv=none; b=VRcj364m8XIwSD4uC2MSSVSK3q/7W4C5p04DuL6MOOg+fidNVWrCvVsBQ3u6LSxB3AGETJZlhcuzaZon8GgUbyANBu1DCx2UYF/BJqDha1qeJETo5T1+gzwnbttXsopqz7xMy/JmO67silHfH39/ANuAaj6vV2VT7ULErqBzlb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670036; c=relaxed/simple;
	bh=pgk64wORibDBfZ/mY7vvMe9mzC1BC/i4WSpJj9nKKCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLj4nIRvnOaa4sFRuhPwRdmkvliwlHg1lyM9162zKpJWDNy8Ivigb2mgfDznXVH14kKgaHwM+yi4IaQtihC7x9zUnFRD4FhLP7gX+8QwspmJsYv57oufR5MVThtezpW34sb4UgwFdHNVnP1EnSBxZAuSzafHgxerW42GWoaIh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCPloTS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgyVlzc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5UWUw4005463
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ucpDjk979lI
	3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=; b=WCPloTS9klqVh/TbJ6S718zusYY
	DDsON7pYXH3PJtTYLH9WtR4I4HGPANQ0Mv62RMxx8F9Pjj9dW5c7yB2F9pZ7L0i1
	J5LD2T5ZS4EJMyw2ekKQpVDo02U/vL4KANxyQYoC8/PAA06FU3k6qZ9vt5YuYUgE
	+AeBfIiPrzMKl19YICxBS+LQ4RLcvCTWIki7iD+NZV7kxltdb2CTgw1GdCzWnOlj
	ZYCZjvjFN4gpyG53nHNHIBiWO2uMvjeWZfhD45UJGGjaPuKRK/eDUQB4C/lVtCHy
	HlhnR7D8A1ov5ShgR0UhLSeonoNxRRpXENAxh0VEWKPPV9qWFS43uHbrCqg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hchah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c91ef7009so247490c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670034; x=1777274834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucpDjk979lI3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=;
        b=dgyVlzc+8e8NoJjnoqfmj8siVP6kzLvqqqNP/yQspr5r34wVTEHtB0xC2FL5f2gawE
         /E+a1WQpfDLUVYl0SyhXN1513vnpWjAJRmYa/auuyfZrp9B12jxtZmFtHFGKv9+K3Z2A
         pDINEwm5BO/4UiqgIjzTAFzGiUUQfj6kLwNetyPzftO0VIQuqIjLTEEuqlqWNJ+cIlB9
         ZgQ2hdNZLVk3PhXBa/mDgNdk+0WwHPMINUjyFLCGnJPIwX8LyKtByRLXGwK1zjruhcVL
         obp8LxT8fZC2pnJKASUZOML6BTkuAtCFOWS5K5lz5OwEwpdwp+E5quJpFUswU39tq9t7
         be+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670034; x=1777274834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucpDjk979lI3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=;
        b=L2S7TZlfpp5O/EVbComBev9ibzRLPblHRwtZV00PgWFarLRMAsQA/DmNDba7uOVCPo
         opu+mO8p4uKPxz/d0h/FTgNvckoCO2poYgGi/ZGssdq0fkXibQbFxWhWCXtDeY8XbLWc
         ROPQUp6zeqe/4O4wJc34BRUCtXaEMOAL9tvSNI0Ewm/+CCTdccLpyI0sRB6F1thfD3lL
         92oAV1EST/SPtXYB2p7hE9Vw91pmDtLV+BDxzwhPZqKYbxhN90cZcXYG3XRJTbK/o4c1
         Gqr57G3WFjc7ZOzm6B3jDemXwN9d6mxkqXk9zKVDF8075clFryTl8Z9aUhkPrGx5R0ML
         ieTw==
X-Forwarded-Encrypted: i=1; AFNElJ/ryXOwgn/en1aPKV632sUJRCXoltpy3oGvcE6mTNAWi9PczDx3S83hChEdy/DdarOJvi6OHvoRB706BTu5@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQe2gyYyRASaEE/MV9zlExLPtFHTWeZGQs6swk45qRyvqLp0U
	xyLiPPFpS77d2Gtk3QWOWPE+0tuCc1MNXvBym7Xqfkr0P1UuGAs0HAV/RMpKsHJrATMI5/hNGxB
	CbuFs4bUez5b7HrakJpxgEQ3GcFAOsdOamWbyPXN/xQ4Ewg/oIq7rUnoEt/UsQ50sGT66
X-Gm-Gg: AeBDieszD4mH0TzpXjPEWxLLCb55ICFot7oxhvi8SqXAwOnEzGzenv8wggHhMBouj3z
	vz83ajvOzQEn52q+4Wz24qlPhappyMCYIpEzezMMHQYhNo4OnLLBTSZLeXPNScMiUjGQU4uT2YP
	jRFC0+vkmCkCM6weD/B2M515qcMaZE3QEoUxERJXLJiE2Ub6MVri8A81JuNXkhtDAWl+j8ojjCi
	/4i7Fz9Vj8r19nZDw1pZ2ouxgiEO5TGnKns9cUzxdCPwqZfwh+DAmiLt4QF/M3WzsoBOQqgLgWU
	NvIuB+4XyA6vqzceQQwf/U58ZtctS9io1mqnvH9OS+b5ae4aKug5oCXvqPgrV00Erpe/fZelMMY
	Ok5+TCmGfdmt3/4lUBBLCCCtmadKz0KJG3vARlIcOG61xVu5h4FGzYhrhatB9EvuadKs84BQZaH
	wLalk7PurNjDn9HtuN
X-Received: by 2002:a05:7022:79e:b0:11d:fd26:234e with SMTP id a92af1059eb24-12c73f9972emr8064208c88.16.1776670032149;
        Mon, 20 Apr 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:7022:79e:b0:11d:fd26:234e with SMTP id a92af1059eb24-12c73f9972emr8064174c88.16.1776670031506;
        Mon, 20 Apr 2026 00:27:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator support for Nord
Date: Mon, 20 Apr 2026 15:26:39 +0800
Message-ID: <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5d552 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jsfX6IzCLFrmiuH_c3QA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 8n2yHGf4MXLs7V1fIkRAd6s3P6xg80X4
X-Proofpoint-ORIG-GUID: 8n2yHGf4MXLs7V1fIkRAd6s3P6xg80X4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX1DzS0Vbb11NE
 X6OofuDTPTbTvpW7Ulc+GhvZErjMzlj5D/GPtTwZEEAFDUtY07nNdoW5xU50aaiZvADxJ+Jwq60
 Su6Z/paQo/HKZH91ZmTi9bj1AuvP0fhMWxVOmWA9xf4072hjW1SYYZ7++Rgc/6VeC2aVtga/84x
 lWwHiwHji5jC1xBaSVJxGSJykZmSWTxYLdLLkrlwcHaRBxy7czbt868gJXLC9VNe7EFoYtt4DFY
 74+4eIweX23gZY6wm/rDRuLgA225sg+ZJEjjwdzrpUuErS+aFrI7KbX/kwpbxJHy8QorG56KPWB
 ZazYVVACrNxWIlP3INAmRdN+5XTuKG4fbywhNukkrL47RpfLf2jb33vL0prHOVxA6pall2BkK37
 A3nm7I3ZRT5/M/GX5JPYRaQnax1Sps3CPzpNAiPzpu/NulVPdb5Ickkj+wGSccGQIVI8DqUzuU2
 0nBqALrnrvSFpNwDtwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200072
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103676-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 761FC427C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add support for PMAU0102 PMIC voltage regulators which are present on
Nord boards.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..9545300d7b03 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmg1110_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510,  "vdd-s1"),
 	{}
@@ -1877,6 +1892,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8998-rpmh-regulators",
 		.data = pm8998_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmau0102-rpmh-regulators",
+		.data = pmau0102_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmg1110-rpmh-regulators",
 		.data = pmg1110_vreg_data,
-- 
2.43.0


