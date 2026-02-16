Return-Path: <linux-arm-msm+bounces-92979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHJpB9Mok2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:25:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C021449C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 874F4303502E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACD631194C;
	Mon, 16 Feb 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEdUSkxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAQkrUK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B991310777
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251831; cv=none; b=jlmIxPBh0D0Y1kxsQXLQYqo3f7at0QO316e2T5hpPOUvC0kk0CJv87+EcmmkFmU4NiTxkVf44O5I2mAHXCCG49MRM1tmSSCYrdUukHb0uP1x2frNGOCW81r1PSywJzsdMspccGG2uex03Fr2Gthbh1grnz4c/QE21Nr1nsAvjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251831; c=relaxed/simple;
	bh=dJ9zEXSgOA3sFYwLORlvoqIiO2XH0IV4KbW06wxvxcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bx0rCiODgxNR4nuPZ+hWd9xMgyvtwzABlL6p47M8XzNprTuZtdheJCEbAvdSVDTAmo2QdsFUHRFPtaXPxekQdYKLtie3LU+2CiAMmjDNgzdWsEe1ohyIhumrztqOVayLIfO0DBzJ7XTPM8JUx+g5fw0P43IOXI6FooOoItL6E1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEdUSkxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAQkrUK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBHcES2952076
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS495JnD5tucSzzH4FqqrVnwgOupbQrQpgwew2E4Q08=; b=nEdUSkxsoEOmVqvp
	lm7rdIxDeiaIcRzDeEVSmrnbjsV4GXwBk96Crloi3Y/LDPq9yAlEYl7ElxjKN1nc
	l7ajkRXun9dGpkSjHNMK3YBTdsCimUi7N4M60xdmg/Z5Ff9fkCeUaA+DegDgeJUQ
	fJkWWmDqje69C/VrDYYqP33ZwQRC12JBVTgE+GPeB1xltUlQcIy8jdq01wbQypXp
	ZR6nBLKnx01wpNlHNEXDot8spSDUV+c4lPW6dD7GkVieCLl7j6WZU9KcEFp3O5p4
	rWdWrq6p0+vI9UHiNAV1iTTukRYj5OeSXIGAErjblxOrxfjuNtd29Zi4Le6N5Fa8
	/PCASg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcmq6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so340480685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771251822; x=1771856622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS495JnD5tucSzzH4FqqrVnwgOupbQrQpgwew2E4Q08=;
        b=XAQkrUK2P78MB1+KsEhDatSt6W/vbW31udkOP7ujnUc0YqlF3MVzfFJTiRSBd/rHKe
         cc4/6hU3YICgUmbdGsJvUHgKgcUd61p6ttz88HCxb4HyZwu5FmRXPDFvzN+N9nf4A5q4
         dJXwAm8D/GeQ0UwDqPPSt/zgTp7nBp0mEUoo8k8EgeYehLVZXZ641kgoSI1SJgaYtDri
         Gnld2+09MyfEpTH5fYcSJ3ETwQD5X+ypycvg+asS/QubyoX6D7uckNYKXVewiHMPoDKQ
         6S3pIi32L1kGqFUsOm0pBNid85ILPCAZJC8uz0+kRPLvqUIUhd2BaXKJmnSmCZ7A49kH
         MZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251823; x=1771856623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jS495JnD5tucSzzH4FqqrVnwgOupbQrQpgwew2E4Q08=;
        b=XYL6xUo3BWiSEPOOd7Pcpdl1TFZWK1fxYBISBwRO9nauB8MAqaJD7oqdehaEehIUJq
         L2qyrX2dsorGJQxPF3NHpf7Xf+ksxSQen9UakWcEj+jUpwM/ULWUwigXqUGHQ/oUiT0q
         N7n9aGt9YDJCQfTk6t7APuE0NiFIV02Q4UmOU/b/qnM7BrPN2tsGLfGi+Na8zDXXzKKL
         uQmc8vdL01pv/IzuHydAWFQcSxZEY5RrcZ5tpJ0EHeJUeQ8tThnv6N8/vs0/IQCW9pLx
         VWqBHJ5sOkzAItsl1lKyUsai0dF0zjWCYcsGXJ2YdKtCkGg9XeGRJK+d7793E/PJoeUD
         NvmA==
X-Gm-Message-State: AOJu0YyZ90mWUWoHfmQvNkarDJN0kS86rbgIJK+e64xdCVEql+pwQWGN
	8MFY2guDNUYY8jZgRLAT2OngUw8WIB+Bg8cISQBxNC3qFrRUoBEzuUpmgPnoqBUNMFM3Z6SB2je
	RTE7xaK0EtHtDoVmjh1Qiyo1P62a+Q98NdWqGJ2I+T2w1xRB2TmQqm8U9g5HqNmzX7RuxowuxN5
	wT
X-Gm-Gg: AZuq6aK3DEkYawpZ/2Eq1jPYkMpPJ7l5myDZyUOTdcbgCfxKAoQE/K3HwFEmp34rIG+
	iuRMzNOxmHQIyyB+83pJ/NUtVLyMgH9ebYn+MkmKYs1n7TtO2C11JMZQ2D+22UOz2CY7oyYXHCI
	E5N9Ni7uT9ntsOmCdDX+9jPZBeTAMyuivqiNmlrpN8M3KAdG8rv9HOqQexP5uBw9nY1QgO7qwB5
	7K5t6GSZB1ijOObCTXPpMl/D4PPXJF/pC7oyiD/qrguSpbTkYarHDEGKd/C7tQbOXN+mtEwrEiS
	Yu9/FNFVtjQ4n9fzfrf2qfWhyRGXSjukSrVyRxuUmJE6cHVEulB9Mf/e3MKCdF9J3gfzVIWbti5
	k1e0+zfxxX3XR8IFyhTaHNcwWId5l1g==
X-Received: by 2002:a05:620a:319f:b0:8c6:f96a:4b3f with SMTP id af79cd13be357-8cb424dba20mr1223217485a.83.1771251822460;
        Mon, 16 Feb 2026 06:23:42 -0800 (PST)
X-Received: by 2002:a05:620a:319f:b0:8c6:f96a:4b3f with SMTP id af79cd13be357-8cb424dba20mr1223213885a.83.1771251821886;
        Mon, 16 Feb 2026 06:23:41 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a34d66sm101714975e9.20.2026.02.16.06.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:23:41 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:23:19 +0200
Subject: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
References: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dJ9zEXSgOA3sFYwLORlvoqIiO2XH0IV4KbW06wxvxcQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkyhnOCpc2MHIDiBazjehR5fPvP1hBIbAC38pS
 Jtu50WbfKSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMoZwAKCRAbX0TJAJUV
 VmIzD/445JpnozT8QKE2TMDfKvJmBKfc5ZwVJTFhm7my2IPz59Cnndpm+HHoB4YlXgcuqMKY/RX
 cVtpCP8V+eDGVzJP6K1KjCLX/u2TiVIlR5chKwO8HBc+NuYzM7XarbYK3mXoblmCs7dby50EoCF
 JwRJDdmNwfOnO4QwfssWR1E8pjaIrVxmkiCd6pQbs5tTTgPr5AcSYaDzbZkM6vR8c7pSGT+CUC/
 ouCWVFkbDWHHt3Gvew2hApjFk+coad14jyshWRtay0R5pfmcfCGhXNASZ6L9QjU4oZLw7jHK/Gv
 NVhocee5EiT8OA9dur8PfoEpod80vhdEGxT752yvK2Ai+KVeD4pg8SdVbcYnTPuf0cBO2jVCkRS
 54Qqt2yUiHvKMWSZOof6jqhAp+H/7JF+qhdeHgyQpkTEdAoZ0h/i9GQlqux+6IVfB0lOt1uAqEa
 KW4soBc/CvLHh/5lItvrg83v59hBUEYmy6wdlkX5buMjmg3ZfhXoBfv77qEj29eY8vXbSXqLw08
 llhvh6aC2Pg6M7HICsyoNUuWWu0WYYYH8IlLDe7tGRGANDuRcE8E0IvDC6AMGy0ccFmKGJ7CJk/
 qhPE3BfiybGWKwPljiHWDrTWTKv2ObF6rgtt5i27QDidHm7x6pAGOn8W5zHSmNV2CvXq3/f14xH
 2aM8Fp91bntJqdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyMiBTYWx0ZWRfX9eWvv4mzlT5N
 y3aMY35riZjrUeQOKjhLZWBQVlhSdcf0TMpn94h7+3nm+/cEPH/zD8B2IAu2GXY1zttUGociJzw
 UsR7kDonu6+NOunc/NRI+Z33zFg39CRNgZFQIyqE/4Y2tL2W/lJFaM+b8cXTJA5vcspD7NRxx28
 mjsDDU75WS7RgInCNq1e7ov8kFxxQyCaz8pYlSPQcAfXw0Q7N0fkHyerGeKuASNpPP1J45haq2R
 Zw4WIpyK5kKeh+1dgqRHDoG6Eh+H8LcqItmMUOPSUM4nTHwvSd3kv65z6Hc5KiWfrUK9NJNZnN+
 P8fQsMlW2tGdIt2NlMjyPIx9taM43ZhXh/t94Lj8jye8S+gnN8wRruXBcLfbfOmI2T+I0mkMjzw
 N9BPzV/SSVSbvm6IZHCur8msS/4+q7mVp4zKDpHguRyWYxBoEh1HNVkGnQ4gKqOjBqH4FY2JhwU
 vYjpNIgV8dMGJPTityA==
X-Proofpoint-ORIG-GUID: _NzOhCecMGuoclcsiVLsUmJz07lZ_QMH
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6993286f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=dWhSLnTLbNPvjsjzFE8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _NzOhCecMGuoclcsiVLsUmJz07lZ_QMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92979-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2C021449C3
X-Rspamd-Action: no action

Add RPMh Power Domains support for the Eliza platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..0c9a3995e06e 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -217,6 +217,31 @@ static struct rpmhpd gmxc = {
 	.res_name = "gmxc.lvl",
 };
 
+/* Eliza RPMH powerdomains */
+static struct rpmhpd *eliza_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc eliza_desc = {
+	.rpmhpds = eliza_rpmhpds,
+	.num_pds = ARRAY_SIZE(eliza_rpmhpds),
+};
+
 /* Milos RPMH powerdomains */
 static struct rpmhpd *milos_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -795,6 +820,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 };
 
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmhpd", .data = &eliza_desc },
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },

-- 
2.48.1


