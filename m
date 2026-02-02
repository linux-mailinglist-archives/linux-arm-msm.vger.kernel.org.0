Return-Path: <linux-arm-msm+bounces-91545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHooCnXpgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:14:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BCCFFF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17967300E5F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57038BF80;
	Mon,  2 Feb 2026 18:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPjz6/ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkh1hJLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190702BD5BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055846; cv=none; b=mt+WOtgy0wNCuk/xmFi9c2FUFk6vAusRxP2QRSVjoqpu3J7BCeJ+qOWc0vmGP5iG4DXdaJkouWt988+CJmd7b3/xOksS9ypi/ZrAL9nuOLp100OACvkm47KAifCsgtYmF22XR8rSFl6lUA7XoGVRcwZba1iuMmWROqFwVoBffFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055846; c=relaxed/simple;
	bh=L5bLTQa7zwHJTh1VWiuGpTOvZWKavJhytKPxRE0/sfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZLUI5AAt2WwiH6k4n7zSp46hNhPKgt1Bzh9D/06vxakSkVE1RkKqbl3WSqXl3OFzNgKtUidc3mZm/fo3mD7WkV/0V7AK9MPZpfb/8E/Do9ZyWLb4QVP4Q6KIL2KLosIhh5HGdJ05vzV/hRaVzatF4mE/CUmPBn3477FTUITzNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPjz6/ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkh1hJLB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CoX2J1033417
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qfXRkiX70F7
	J+5IZZ9fYqWyzFFOmyuc1s3yJyTWwBI0=; b=cPjz6/lyQo6XcVKdg5PQSNYDnW6
	naUaoWe4uMaUVLntsOzP4kW0XEzWdqJWbLNibqecm4dAAJelUV2+3UGhobHrph4s
	UR3PiPG43r7QNh1H0K5Auk6qW3sgpUJJsV66pvkxQFeXue+azRmqGv6AldMuW7GO
	7+jd+2I4uP/nXaclc1iXLwUX7F5qDWRm12wFD4grt5fqgiV84uq8v6dUIxmgEVgm
	Evdzn2p3XAv7QasLmo+aqbdFNVZn4RAAnbT/QXLLOPx//MjWNY4JalA8bOppjmmg
	MyANJ/tvKVCsbR4VH8OjevNpfCIypysWD/2S/yhzONaU4p2cELNoYO+zafA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1m755-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so3930088b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055844; x=1770660644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfXRkiX70F7J+5IZZ9fYqWyzFFOmyuc1s3yJyTWwBI0=;
        b=dkh1hJLBVno0YTtYtmWv40Fgz7vrsPwKJhb2GNpvw+aZMgdXajYmN00M+2NZSiSLlX
         l3vqMQlPkv9fUXqPhDRQDfWjRww8VfzMglbIxO0GuhQdtDRHw4Mj2EDbV/gWWy8QdX18
         uKTFYqVo7VjD8kmgLlhCPjV5XLuV4/U66uGigrd0gx+LVEFdInWefPHyWQMbw/OCbvxq
         OFeVgC4Rv7EwRO+SYbCLgMJX6C9UDHyWYNiFambw4uTtA8OocVFc+X5PvPmvw9qtBDoG
         H1JzMTZz+dqAJ+DpGQ36hLfZ0buV5Y2dfk+NQED6U3z1E5RufvNODlV0dI/eBNBM8Ead
         CUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055844; x=1770660644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfXRkiX70F7J+5IZZ9fYqWyzFFOmyuc1s3yJyTWwBI0=;
        b=uNXArXbkkZZzEYs5XH0vUbPRUdmvSwPXhduIJ4/VfoeClPTaP/IYp23LZdVaP6CvlD
         qh1nNq3W19cbNZ+M4cISoEHvoHXk8Br3qKORP77Epluc6WDOeBpi6cR34V+lL8UZ/Kom
         QuXqvQyzFp+J3ubYJ600A5+c/ohTjXUY4PkDP+WDEHs2FR2WHYvdWeymdnun5TAsu7ob
         PWdOTXYqJ0YoPzToJY28M425EpTCgN8QSRMXLPTVnDseuZOlpkAxbUarnUtUItEqzoAU
         ESCb6H9bq6z/ah+wc0H8OQVYrrg3O4AsI5MCYcqmnSVk3JsjvGeTDbnZazOlfafJlCHv
         a5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF1AT4mddiZYfth+IsMfmku5EmrdwGROcTp4bjhBVRn3PlTQL7E1RalRCdX1e9zN5h+aPhhNRbrKhMGHZb@vger.kernel.org
X-Gm-Message-State: AOJu0YzBySqNGGoPUnpUwCR2YiZueiymiQ9CUfTiUBllvrOxpJnKYNrC
	rGGNNdCvIkC7ebM8zp5U3tntfZfW85C/q9z4mIVHq6Tf6RcxUzGGvkfYTWQqo3WaPgIQQqapISC
	kCcS9bN7YTIhHd/n0NYACNbZQzi27xH6yGkQsd4S9PAc3XW5dp5BHRLx/Tdbc7H4/njNS
X-Gm-Gg: AZuq6aLAbXt7GJazGCWUU0BZIIyT5qSbdcP+V1lgQ75O//ZYOXrB+1KSml4PYCUMDBL
	VB39/3xPghwSIVCDPyJ+5Z4NR7nDfHw46X36yUOQFN8OAP7DZ8UF7l0aiAAP+WU5JSbHXscSndA
	vRmLuB0MTo/LOwdDmq63W6Ny+FuHHJ5wWqLrFsOlCHfHCnddgVwOp7D+PkzDKVmJnHp35BfeJws
	HD/ho0ehr0dDCrL11xCb0mW9WWI+0WhD7waGP82TmR0v6Q2+B2SH/OvyLT8/5o3/NfsQ7KpHDBb
	t97RnphfS/MA+frxRTjRP+KRGIuSm++E773rF8lZd+Ymq2d10r7j0BjevHmtzJ6VDJRRR46on5y
	XliRykaEttDDJ4+l0/cs2BgS9NGf0t4+MsMFBO8tz0ws=
X-Received: by 2002:a05:6a00:12d4:b0:823:16e2:66db with SMTP id d2e1a72fcca58-823ab425e00mr13012364b3a.0.1770055843656;
        Mon, 02 Feb 2026 10:10:43 -0800 (PST)
X-Received: by 2002:a05:6a00:12d4:b0:823:16e2:66db with SMTP id d2e1a72fcca58-823ab425e00mr13012330b3a.0.1770055843031;
        Mon, 02 Feb 2026 10:10:43 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:42 -0800 (PST)
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
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 09/13] i2c: qcom-geni: Isolate serial engine setup
Date: Mon,  2 Feb 2026 23:39:18 +0530
Message-Id: <20260202180922.1692428-10-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 394MOw6sLSk3wjbfc3V2aY3ndn31KdXv
X-Proofpoint-ORIG-GUID: 394MOw6sLSk3wjbfc3V2aY3ndn31KdXv
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980e8a4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6GPvvr__t7aM35KwLhsA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfXyoJJ7qI4IRPD
 t5BKWYJ7Hi1GILNkRKyTAq2jI/D6+JNI/gh9IToFY37wjuDlBhNljbT6XxlPUdIYiUbzQqRMLet
 +J1x+aPsZS0Ix1IBNATGZIHKaTN+hrCECK6SgJPnqy5VRCabfvbN5hwuAnQNnQw9m0n4XESGLKj
 lRYBKFyOmVDn7cSjwJ447thRXOLRwijqhyNBdX5KFhLfbD8UlVyRLEvbCm3jExvZk1byxjKF3ha
 i4ugvH15MtlZsvvocKh8RCeAeBIHZYKp3SC4ktrH/KHNFH5aP4S6xWXoh+TzTjecr6miUkpG5R4
 SP7G1ZH3zSm6ibDUc3srTdRO3aQV7BveQvUy7I+haUrDq7GZZ6eRS0Thec6bOr8II8XIkl7kpWE
 WnqNp2jgjcnSae3ZZDf4ci0jIeApZZXs/OUkImb3CdSA2Kt1NHm8Mr5tH6tlpEfKCqE/H1iM+tU
 5JgfWw0yNV8IlfusAZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020142
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
	TAGGED_FROM(0.00)[bounces-91545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 5A7BCCFFF9
X-Rspamd-Action: no action

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
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


