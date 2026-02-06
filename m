Return-Path: <linux-arm-msm+bounces-92089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJXVFXQphmmuKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:48:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E72CF101663
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E529030ABAF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FD541C2F9;
	Fri,  6 Feb 2026 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XROZyVqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+upqyRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C0421A11
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399752; cv=none; b=ftTsBRFEwesQEVfQHEBCr/tnvh8tIcIh/pM0iGt9E0BgDclEn+5QiGNaKZskMrLW8N1daGKE6rZDKzUPZ0fquwVZU1QxPUTmmqEyCTGF+rnp7/KCWIU0qaCAhYEq4STWT+fTOB7FFsQDEZ1c5JFy13nmlfNOjgXe1UjI1oyp2D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399752; c=relaxed/simple;
	bh=sDUm9Xydq3403YULfrfZBE49cHQPZ/UiIqAzox6BoBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/xImzrBtIpkknLvxgWvtagbJCD9uv25cR8RdazCWUE+CNQz4jr6efmzpWUc+MTS8G7mb2aYufQQHxbuc94ncfBcg1XeE3CsW+/47H1stKn5gzeionb+gG1eayaxGoglF4thPe2SQV2MKwItfp7h6n7gWKDgJqG9u2FWJRqAfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XROZyVqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+upqyRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616B4P3x3764219
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tZXS0ryzuuo
	eAsGptKjaEuILlyf9UBevXtHQPKJSvt0=; b=XROZyVqL1eptJRLEbnARPhaaDnf
	K/v1rAvMmyLNf3aqjL6bw52BgkXPuZN7hGUslnUDC48+gOlj6pyJz9yZ2csjrwFd
	ksbJk7KZJCGulaakadajhvxXTiJDUhD84404hacNA1XjCdJVAn8pF4+xGu841V1L
	8YjUsV1FGHSHrRVb01Blqc3kAU1JfwQAJIcPbn1BnImSSGdk4pLpBluNMLFrIyiU
	7ZJB6GvcwH48lLH3vm3BsfGY4UaVfjeOcLwomri4yAuZ0ivQVZlAVRPnAvFJigRM
	RDraEyTfw1mt0yFGeTcDS4bebMDgpj/zMmsFjado+2xODIN7ha5vavwuq9A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5f3wh4ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:42:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5291b89733so1381846a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399750; x=1771004550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZXS0ryzuuoeAsGptKjaEuILlyf9UBevXtHQPKJSvt0=;
        b=K+upqyRkNPcg2qi41BO825IBZiVmSnLHfooi5/Y0Joxjz2pV2+gSPylmXy1P4TE5zc
         ro6gTDPsgnYrZ+o1P7ZL+wn4y84Y90cQhdvhebpQy+/UI1eFy8nDk9g718N8hPT60DAC
         4IRl4RFzStmwcSeju1AK4pxm4Ob6YdJ0i4e9YVRoXPzvwWBrNTrC+sK/WlfCc53wD/JJ
         CcPsKPlzLTtnSFVDXpNSFBxZjKpz6y4EMb9Emr4bEdeDo9H+8mXILm8C5pY2Hb7WqJ2J
         0O9VwM4DwotOaiiobsaSsJz7kzMjisH4BvRXgLkDA/6BZmrnoI8mhm6fYHRDsUJd5jxe
         RUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399750; x=1771004550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZXS0ryzuuoeAsGptKjaEuILlyf9UBevXtHQPKJSvt0=;
        b=o7KYqagNsqdtszbR5Ry00RPvvinc1rOXtzgO59Q0MGRtiQGmRmpuB48wLe8qpbj5lg
         rRafRHmU+5/B0islsQZ35R2q12vdzhISWOvaeWO17RFp5g7DRwF9GTvIxXzbgS6bqiy6
         b2N0sdoEVw+qk+7blL2QP0KkJiP3KWWy15gQVw9qgaPOhshf6IUDf3Dg6vbzZdBiIH5s
         15OXvOm1xYEdX//U7aHSTKPqbUpNX1S99AqArO5CKXU8/Gu7cgklFYyW0PvdN5dqL+eg
         aoW+JnT+sCJD7tYKxpi7nXvDfk/Nsf5SAccMrhhSMVLP2KkSpf3V6OyVo4x6Lv2/127H
         a+2g==
X-Forwarded-Encrypted: i=1; AJvYcCUh2x9xtGVtIe6z7Dq9xvywJomwd5xiO3wrvTREF3j/YTDn3P00MbyhRt3tV9WigK/CFOUp1By1pRziXfLv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKO4LX0+48h9/F5/+ACyVtciSRJVgdcBydjAircgCttcviRf27
	bFhZax/FxScfw1nLPLJXNJV4MMWY9Mh7bLjIHEg2nurs0t7iZbBgnUGJRPpgyKggvi+u/W9OD4f
	XW/kQprSZbTYXk40wl8GmXe445abzPmzjLgRArmQWZpTZRlLPBj2kJJg/liH8amT46t53
X-Gm-Gg: AZuq6aJQavjpRF6ALnbZskl7GzMlqbmzJWsDJs3ojCfMHDRxQgEWU1HvjP0J7zB1GL2
	mPTNHoHFw6Ey3jPAC4cPPa46rawZ8aQ3qPaTOsX/YAOAiriTm3MzaLZH7mILDaUTO7XZbBxL2gz
	pIXu/7LqcZXLpu1zJUmhXXn5jRJx+oJq5kw3GH0s0kN1/LKZHnOEeru13SXFvM+/pI84O0TZMza
	clZuaE3Dsnw2Cz0SCU8SIiSqpSYAi6KrGqRlaS2qGQj6KotFzpisTl6lBkrZtC8/y39QNU2cr10
	IE8CZ7+xbMHnOsP7woZPgYvawved8fKTsbOSGWnDJL5nDJ6qOtDswcnGUKxb0hDKJ59mCEhbDd0
	B2PoRov7SCOizhPWuxrt72useA5Acea0H23ztcUkgpZg=
X-Received: by 2002:a05:6a20:d12f:b0:393:c4d:be50 with SMTP id adf61e73a8af0-393acfb104fmr3213273637.16.1770399749516;
        Fri, 06 Feb 2026 09:42:29 -0800 (PST)
X-Received: by 2002:a05:6a20:d12f:b0:393:c4d:be50 with SMTP id adf61e73a8af0-393acfb104fmr3213243637.16.1770399748923;
        Fri, 06 Feb 2026 09:42:28 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:42:28 -0800 (PST)
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
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 09/13] i2c: qcom-geni: Isolate serial engine setup
Date: Fri,  6 Feb 2026 23:11:08 +0530
Message-Id: <20260206174112.4149893-10-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfXx2QHP3vmWD0a
 y/mU99muwDweS28fcDZl2YL6PKaQEm9gEUDxIDOLAfFxr/04UM/Tx7Vb62V3uJnU7xH6nJJgClP
 pv2aJYmR8wDEA1SCbN1T05d3iqTjUIb4ISK+aFAB7YbivQ7fVpDTv2CN53YWtbuSJiQLfDdFdV9
 eJbYrOfx9XPfqz+li5MyS6bF6p8bJ28wldwlBEn8TDsx29sNU7XSFkVCL93GWZdd+kCSfLMIjXR
 lSBMtl7Sz7Y6LXKaZmVCFelgDiXeSIbY1/6lGsuTbK9vzkiM4+SAWHQF8FSg1QrYZIPZZZfUh0M
 AswZdjT0KxrLTRU8lqesgRSK++XGRoFvHgO3Ce2n+6m0eUQC2L/q3qMcj/Jfxq33mIBKh90OfFW
 LZidSBdQ5sg3ZT/Qced0P0j3Yl/Dd0TscPGlkOmMmQmVnV73UB4kT4D1mVibFvEmlIlhFub0FBE
 NahvxSoa8kzIcWTt0Mg==
X-Proofpoint-ORIG-GUID: Uc8Q2Wb22QovrcLlLhJamrwkBwA2JEQO
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=69862806 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=6GPvvr__t7aM35KwLhsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Uc8Q2Wb22QovrcLlLhJamrwkBwA2JEQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-92089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E72CF101663
X-Rspamd-Action: no action

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5:
- Added Reviewed-by tag.

v3->v4:
viken:
- Added Acked-by tag
- Removed extra space before invoke of geni_i2c_init().

v1->v2:
Bjorn:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 158 ++++++++++++++---------------
 1 file changed, 75 insertions(+), 83 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ae609bdd2ec4..81ed1596ac9f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -977,10 +977,77 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support) {
+		fifo_disable = false;
+		gi2c->no_dma = true;
+	} else {
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	}
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1060,102 +1127,27 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support) {
-		fifo_disable = false;
-		gi2c->no_dma = true;
-	} else {
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-	}
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret = geni_i2c_init(gi2c);
+	if (ret < 0) {
+		pm_runtime_disable(gi2c->se.dev);
+		return ret;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
-		goto err_dma;
+		return ret;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
-
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
-err_dma:
-	release_gpi_dma(gi2c);
-
 	return ret;
 }
 
-- 
2.34.1


