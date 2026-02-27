Return-Path: <linux-arm-msm+bounces-94399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF8KFIE3oWk1rQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:19:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471E1B32A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26F8F30221D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71143E9F80;
	Fri, 27 Feb 2026 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHTaXLAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUvvTGhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1C3ECBD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173042; cv=none; b=kUGCSk1hN8nDuCY+tiNllc/mf1J6tBd5AWzHZ7+UFuELmGtgIqUv+BW6XefUdgzlYaSeO1MWJw5XIG2KKht2KN7osxcmw0x3K7Zvp/GNZr3mQbWR9D8xCtqMMQ237P8YgWlPRKtVoANU8GMZCgeantKIiXC+Pa8BxFpdKswXZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173042; c=relaxed/simple;
	bh=eY2I5uRUIiwUluElxUUOpi5fOiYU296aE/AH3jfENzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dBIhZivZpfBGPyGjmI4UPKnhzGA6rSTloJRhQf1VtmSjGj6QVlRNb2Z5c3LUphj1Ip+lRl9JfUcMhvS8J3CEH1unI9se36tKKaSUxCph3etQJW2kiHk0GRxdqqi6b87QXzOCsZ4lglqjQKiIlHrD5Qc4FPcQYblRn/nLy6OzL/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHTaXLAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUvvTGhB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jxcd3747010
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6YJVRJhruA
	6Q8Cy2OP0sNlAp+tW66kxMwSkhyUa0XA=; b=OHTaXLAYGCw4TlT9JNPjCwTZUmS
	0Se1rvqUyRGyZXIejWcarn7hUF45jXoXS9ZArc86V2pxXc/fEFTQTT9hXXi/2CRA
	2+2kp8Ve5CiEzxmgj6ea1lxBSy7PcTG6yz0AKmPJVV/uBIJHdkEjivrm6OBpmn9a
	pcZkJIYe19Z6BHEOohsjaJYIAJeMOpouK40SxDP/e+pCRdHVE3u55h3sKYDDYYOz
	ON/fOV6ws19TIYnR7HwUxdw0f8kHhulXrpFx2zyuoEK5K7LdFV6Xu4h+hLMjVbJS
	ulUJmkGS0ZMEQrlC4BiWlpPpXLWK029g0IVSkZQ4B3FBtl95R4C/IMuRRUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur1ttn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaeafeadbcso18024815ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772173039; x=1772777839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6YJVRJhruA6Q8Cy2OP0sNlAp+tW66kxMwSkhyUa0XA=;
        b=BUvvTGhBrB5ycz3CbI3M3ZiSDGNl7lxUc9cJIw8zR1Zc5t2WFsWm2h1D3EdV3Fz7O8
         E6j9Lkvvo7Z/G0szbN/WKGhxi90eygxa9DoJIev+THowtkTvbCb5EXgSIMjDYgYp7+9k
         cU5LKkMICLCgOz8TsFnuL01pMHYGLj1hipnhCWY02wcCZnl9iuE5QtAmniHIAXR+Ib6k
         GzuMX1tGQwseqsyHmprx83EXczDE4bZSawGPMCil3gbsn5i0fnmtyNYGT+wlZArtylXs
         lS043eeCauQRYXED0DCHvkgJFUjUdq50W8x3OZh5lg4/Y8EjRRCbO9umNJY341q03fGj
         9j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173039; x=1772777839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6YJVRJhruA6Q8Cy2OP0sNlAp+tW66kxMwSkhyUa0XA=;
        b=FG4hdthHPUFFJbbKRwmCRJ5CKcHJsvL+2Vywbi4ZSbzuTvI3u5HAtklw+gsjcuxcQK
         LbHsaqlJXiI18CPVyE1rO20thjGWLKuN987r1obk5dXebUj38WIHiLtCzazstWm+K/cY
         ODwR9kBp0Hcs9E1zp8HQ9SxA8/TmroZ7Odv77V83A+hVoGIbqX+vTtH3qKUUs2FDwz0y
         srdrgyDXGBOAjJOgPrcOQ9Sex9//anRcLhLHw1K5hzM/Tfqh4k7sE4b2bZOcfQwtr2gJ
         nwsuOW/bFz18Ju2gEmUHZmKXxthrl0eSotVhrr1Xh7a8/tB5EmDNTDheKWIqRYRd0viA
         MX9A==
X-Forwarded-Encrypted: i=1; AJvYcCXUOFZ6/6nlaBU/OOcZ9nl8THuBwRoRjiSRiPVravFXqHBQpguQNmi1ciH8mqY3MeM/xhLsN6zRofxYr383@vger.kernel.org
X-Gm-Message-State: AOJu0YxeMuXLzgS8Mb3GM0tbXsfLY5HABgyliNCQ49g7X6sd/91YfNfn
	dCKC/gogT+uspwAEco5/pxbPyEljqxHbmSQjE3tbV6iNwNJuGAVvsNj76vO1xMl8LNJqb2HyZUU
	Evfzbd6c4TtkiZfH6SQ6GPCsSQdrtm3yTsse9HJvs6gR1hiuJhTqmYslzUzHN+ZJeexTh
X-Gm-Gg: ATEYQzwVs5aCndwZ1fwNrZAgGQ0AO4lLmZSq9PTDDm16YKLEJYAie6pnzpwsecvX3zf
	8viXLI9VU2exZxd0AXUMBBJQsFYbLdbyru+AN5yAaoCwf6c6hOr5yYyEjaPaRD/4TOjWjHHiRWy
	mSZpW9amcWXHnLA2aczLBmFV4hpt7o2uIV61GvBPSWDWmBSFWJn+vsbmWPP8EsXbGg9lq2PDFc/
	EGKMka4DAgUSRbAsmqISC0slpeipsW7/CvDPn4DTgFl8qB81RRXZvi95spK7zSg+MnDPVhNc9kI
	NJT/JLOkX/83SRYFHBXrz81AV+vFTP4ZjJQCiedKI7bgZZwe4Jz+kLQ2vDc+jIWX+AiMDHNN3K8
	pYg7YbxuSHc3YJlBwJ/94jJfB+AWfZPrOYtdZSZ7vPGomvOLoVeeCqbA=
X-Received: by 2002:a17:902:d484:b0:2ad:ba04:40cd with SMTP id d9443c01a7336-2ae2e40faccmr14904725ad.22.1772173038795;
        Thu, 26 Feb 2026 22:17:18 -0800 (PST)
X-Received: by 2002:a17:902:d484:b0:2ad:ba04:40cd with SMTP id d9443c01a7336-2ae2e40faccmr14904245ad.22.1772173038179;
        Thu, 26 Feb 2026 22:17:18 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:17:17 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 12/13] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Fri, 27 Feb 2026 11:45:43 +0530
Message-Id: <20260227061544.1785978-13-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zZTKkOCtJhWyU4lN0jHXiscdVdj61WGu
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a136f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=L-JS82rCYefCJmJZhRoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfXwStcUfM1UbKk
 aoLNgyUaihNVopDsjMRBAso63EumZy1N/wrYV7VSauAto01DLg2OGxw3qmsro4kOTeaDEre0wp8
 68vasP74RKadyDkS7Pv7CTc+HT4z+of+Zbbrt8H2iKvsMauG19Xoew7AiiItPphBcHcMhg647UH
 IF08vhlNJWvQe28dCW0TXkZQLu/tj2bz1wF26d5TsHuEcyeXzseasT2RLv/ieaXwgmuxjsB6eQP
 SOVK58bkxX4nTPbdkCpkyq16ipPV1M52faoMYml/Rle4zbiXDfq6PJ9af4A7j/PoL03W1ZU9vUK
 Mvyo41DOEEnZhpnBMfNbUPaPGoNX2g7lsj9VmVaKm9rz4IHj42DitELKVLXSQZQZjlFCMYVm82Q
 rYXgk2WjN7GGlae3OF/ezAY8UQWhNyxB/JaNudpr3y4Wxo8ieX8veM/TMydtPW51dSNoxFL93DR
 m7nd/h+6cyRucO6RC4Q==
X-Proofpoint-ORIG-GUID: zZTKkOCtJhWyU4lN0jHXiscdVdj61WGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94399-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7471E1B32A4
X-Rspamd-Action: no action

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v5->v6
Konrad
- Updated in geni_i2c_acpi_match() as suggested
- Moved geni_i2c_acpi_match below to avoid errors of geni-i2c

v4->v5
Konrad
- Added a null check after platform data struct.

v3->v4
- Added Acked-by tag.

Konrad
- Removed icc_ddr from platfrom data struct
---
 drivers/i2c/busses/i2c-qcom-geni.c | 46 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0ea4abbcd170..f2508038c64c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,11 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -121,11 +126,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -928,15 +929,6 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality = geni_i2c_func,
 };
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id geni_i2c_acpi_match[] = {
-	{ "QCOM0220"},
-	{ "QCOM0411" },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
-#endif
-
 static void release_gpi_dma(struct geni_i2c_dev *gi2c)
 {
 	if (gi2c->rx_c)
@@ -976,7 +968,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -999,8 +990,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support) {
+	if (gi2c->dev_data->no_dma_support) {
 		fifo_disable = false;
 		gi2c->no_dma = true;
 	} else {
@@ -1020,8 +1010,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->se.core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1064,7 +1054,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1076,7 +1065,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
+	if (!gi2c->dev_data)
+		return -EINVAL;
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1215,13 +1206,24 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220", (kernel_ulong_t)&geni_i2c},
+	{ "QCOM0411", (kernel_ulong_t)&geni_i2c},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+#endif
+
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


