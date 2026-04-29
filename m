Return-Path: <linux-arm-msm+bounces-105227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH1CI5wS8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:15:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA84957BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453FE30DE935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B06B3FE657;
	Wed, 29 Apr 2026 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaXepd6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eergk2Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778693FE35C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471821; cv=none; b=Rl2xvwqNN1ngVt01dvIXPDfByH/7lviSGFf2eZTckROwatk3gVT0grVXExnAp5n+CotODLPYXEx52robAvLsgQP5MxpORFm7OU+SN0+DCSiM8SRe+POJ11GfrI62OUyPySdPvaKSpvm8/rcxX9p2RnCZjl82qy3Yi0TqfR6HqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471821; c=relaxed/simple;
	bh=XtDgh9EmFEUZTFmmIEWobw9+f5N/wS8Pmul7XFNhQBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4Ksyh2XxJSxVfQ33qzsneJVLBZoOURFcfsHY/rXTs6XwJHXiYvoV2Lr5AD6VcRd2qe7kh3+4w1Nz1stXICkdjjyZBzlomGp3oMxc9S9sUDk5byntqZ8mLtxM6XWO/BCol8HkMLM5INOMDPE/fbVFOaiKIzBGLMCZx4nxMcUYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaXepd6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eergk2Ga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q6V21641981
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=; b=TaXepd6QlNhhrcak
	L8xgyWvNk9Jh+FeNoy0q+/CHcX1U2NvqwsoTz57sEZfKOcKmjQxhS0avu6+MnGoI
	AKTYTHlBrKUzoMuTfsVfIw1svIf3Yg+uUfcC0LX60SH1deMZWNijQYyjubECmh9S
	Gg0cca2vtpb22diJZMDzgTVje3jGQAW3ZkQRG9A5JkY7loEVIh41QZcwKOHVH+q9
	Zn6r6479IipXLKvAM61lDgAPnEuBuZCgWAqeywmbmpyb5zChAnOnLFLlqjanlowM
	LrxL3nvtce709vj9LorimgudFqVL2FExMIxpKsc1dg54V/nUX9uTfJomQ+0m8lko
	AeoOpQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81uv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:18 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651bd07888eso25479910d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471818; x=1778076618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=;
        b=eergk2GatJwddK0m5aDHk7mW1Vqve4NKgrLTD/xMf1cdoaN61l3rFXLmoD56XLwVT1
         1OgGjY+fDt3+itf2xR3zzsUFSsJfJPQW42Ztdx/8mqYMx5+Y5zE994sF4QnLZEZP/+MU
         qAX2UR8t3b6hhsXpasbHFy85w0abSoVXWQr5BRECFjoO+JPSURH8GaAhTJalT8IFmppo
         8publ8BpcrGXZa0QFQ2t6owe/4ry5mEUWjbt64DiAYUtz5Pi4NnNTDzo4LVLodkuP7Re
         vMO+00HXqz+fNrysjD03Vuhryr3F2iVqUaXl9dVG9yUutLGCaCLP38SpiA+Svv8abqpf
         xVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471818; x=1778076618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=;
        b=Jl1NPHhBKJvGtckuH2qqDnflnsPuOKkQW32bZ6GiAeqm2aUaYgey0AkJb3jTmqW2e/
         U3a29thaoxAO62FHF+RINjdfQo8LjMuM4qJOAKx+2O9TA1yCB2iPiV+0fyU4QJPvQNkt
         K51lWOGOmBkwUSsc6Y7eRPEm8SGdwNECRB9R60feXMxsFQij7Aq+y3R+bLVgeeLediFO
         xfBvuDzeSpRIM1jmTs6V0pZyEG63llJ75V2/8x+GYyLXNQRyG+S7T/S6BFFRS16Swpp9
         blM9DAXWMambRJuNNTRiLLwB4jgFKoGURw6M6HVS6BKCFW5B6t+iTHtEu8SsvTKBaojf
         tfvA==
X-Gm-Message-State: AOJu0YzUTzotguaSrz1NtSDtHGlDgqj8UchDTrLi+1709YFvCvJq5jpZ
	G29r76XoOAJzHeEcn5fGN3BF052GhTEckhlLy9wE8o4b0LUFjQZHvn1ZoBt+77aNpgvZrKVk64t
	K3JIyGgRzInMnGcndrq9HTUS0d6xHNbiEgXJXbfHVt9fClRg8vYL/LlcTtQhIuKa27f8=
X-Gm-Gg: AeBDiesTuxkFT5BnAWjzcUco5O9Q7IqLN45c/AYTbDORLGJ+OrmLq9IDYuGStFgtsUV
	3z/jnAl4EVx+nUgvrc9Hr7rVrmTKl04gU+7sxR7sg4srV3Praa8wjqJo/LqsfSltGczBBZ2GOpk
	Umno00JWm6+Jdm3ivm6g8dFtX2RrA1OH4Dhc4NGyBEMIYU9eGdfhDr1GGmgCBHvHADQpGyr4e5D
	oimK5FMo+CHUJzfY1wEJZrgqm3JZL6rhx8O5iBFhT0HNo4tg0USER7ZrWDCE1pzWw35CdBYNwpp
	kliaZMTPOatxHdYgSmqkVmMe9udMVNFIkNrvW2c+5VfPgcQ1eVzjTJKLzuKHy1t2aAVLdpQQEVD
	sdZIgHMaEJ92YgLBD8+ZJxZ3t5C07XwV9B0NaEJhlTreLBoQ/L+4p2v99mUV/fQ==
X-Received: by 2002:a53:5a05:0:b0:650:3952:3d3d with SMTP id 956f58d0204a3-65beee8dad9mr5103178d50.44.1777471817852;
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
X-Received: by 2002:a53:5a05:0:b0:650:3952:3d3d with SMTP id 956f58d0204a3-65beee8dad9mr5103131d50.44.1777471817363;
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:39:57 +0530
Subject: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
In-Reply-To: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=1679;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=XtDgh9EmFEUZTFmmIEWobw9+f5N/wS8Pmul7XFNhQBs=;
 b=YdF4LQ5P7/s+dPEDIb1S7XAm19xZRPt1lXvu9pK2Z5oPFhc2qt2eFhU8lYegQ8hVoQOAkbYlU
 VYvbR/zoIeNBGBUjlr9yUuqVnN/eZidzlZnM47xzb2E4wuq4dJrh6JK
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: z3dN3vT7I3ApN1B5zivaXueMfmz17hKe
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f2114a cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Q_XHpadt4R70q37f1CAA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: z3dN3vT7I3ApN1B5zivaXueMfmz17hKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX0i5ayQfQlvB6
 s5CvatHOG1OiD2WPmjkJeF+39VOoMiJVx5tXzP8/O5Os73SHXNEFyQ20yEnxl+iemm3UPlTqaHd
 wpucjF8Z32jzTxY8X3N2v/hOTzJnWd9fl/TNfE6ZRGItVHMvEy8GIc4egvgT9xTLh9P6sM3zdhP
 p/Jm055jTX7hdrrb2lfaiHoKo5M7b0ervME+A6bytDXSNi6BqXtV/4PdpZEeaBI8q4iiL8GTS6t
 4A4h8DrCuvZVV4y+wsedaAdnwk3kEkWw4EJBTuJPjVmkN4pPO9HPauxp/n35fZMHXgIq+QQdoS9
 2QCOvyZJLb3H/H/KNTaP38vIcUO8PbvXrJgXWlTz6JnIO+4KqibdfbFGysiWtZmjijk3Z1YW4hB
 /CDczEJ8+DRC1V53sj8ldezxSWfk1GexVy8NLVrKZ31SoHCunP2pPs8efPqGwzExAdfzz/7hcQW
 g0AMsO7sUtT83gHcvsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290142
X-Rspamd-Queue-Id: 0CCA84957BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add RPM Power Domains support for the Shikra platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO,
 };
 
+static struct rpmpd *shikra_rpmpds[] = {
+	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
+	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
+};
+
+static const struct rpmpd_desc shikra_desc = {
+	.rpmpds = shikra_rpmpds,
+	.num_pds = ARRAY_SIZE(shikra_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static struct rpmpd *sm6115_rpmpds[] = {
 	[SM6115_VDDCX] =	&cx_rwcx0_lvl,
 	[SM6115_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
@@ -949,6 +964,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,shikra-rpmpd", .data = &shikra_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ .compatible = "qcom,sm6125-rpmpd", .data = &sm6125_desc },
 	{ .compatible = "qcom,sm6375-rpmpd", .data = &sm6375_desc },

-- 
2.34.1


