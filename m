Return-Path: <linux-arm-msm+bounces-100019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CJwDsS2xGlH2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:32:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3632F0BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C193025A60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3457B26A0B9;
	Thu, 26 Mar 2026 04:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKKR2OBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRKyNcVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7E191F94
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499521; cv=none; b=oRGZy1vcE07A2t8+uAtA6i7Hcw5OJ103s0DLPP4cTjJjKeA5JHTFrs8uOJP0CwgPrpv1HY05zoOqdkI3pyuiIv0eRcTDGMICzDUYCwynY9Xj93GIAPqLxUjVzFmqc5LOw8iAKG1Crs9EmpNRldnyb4XaLC0bK69Xk3Hty09ysJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499521; c=relaxed/simple;
	bh=NpFXvrYh3Fb7+pGlr/Z61Pb78xmA51Vjq3Rxx3qOVtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=czQsI23Djp1qdYlXzmojcZSoHzdXz+YQazUm3ZLDWbgdjh/S3VIq2BHP5pGKCWbiwhPa1CzXi9mfh8CA5Opc/rqdZwgURy4JJIQI47vle2DtoNvOlmcux4fKeJS+gqPW7G3yKcoVy3NUu1Cps2PKl/0QYrVkaxF7IYrsNy3iHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKKR2OBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRKyNcVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q1Il271432727
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jJRKMt5STVkyb1Y7d1ZgMO
	1sueYs1DgBavRo6QS64AI=; b=hKKR2OBdmKOqiTdbZ33hIuMhZ7JhUlOiO93CcH
	DiZtkKn4ZzwolbcR/CwQhTILnreUv0fRddHGSqh7q0cmXbE/A7mxKhFV+R1ogc80
	lhHH8vDCGt17uqM3QSpcv6tfZtbD+MICx7s++bLr/jcSBgS1AnRDFwtNXLG+6ayz
	hRWyuph9K6ZJv/lP6CNm2H2/ExRSupTSt7/cu0Tzu76LkaQFFCyPBepQ2M3/WvIc
	J9xuBcB+qkvEhxejPXgEff/oU7iMB3As+oCu9W/mvN0R5oXzMczXpQY23wX84u+o
	IHBEI8tJUF7r/+BXEfR4A/GWj8EKWFS9KP2gol5WElMqucsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc52bbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:31:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso1893142a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499518; x=1775104318; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJRKMt5STVkyb1Y7d1ZgMO1sueYs1DgBavRo6QS64AI=;
        b=jRKyNcVafX97FOVAMt+S3IOON6nCEo9Jleezk5AV390i/NVCtz+W7/H2QNtl1mvtk4
         BCA9NIThhWn11oIW6A8xIXcrGfk+cXNOFRdoMC+h3eJ1vGPfbDKPafQUYqzUsLL+Hl96
         1n182en5lJcOtuJN6QKpYpRhjNXUc3Yg4x+G3SMDloWi7ZzO2bLRyD0nPmysgEA0QtkO
         s+4JjVOkN51Hm3pvtpF+JkxSbd+YHiKg9GlmG05EzPy/820ZP2B/o8SEit44inozA2n3
         sVu62DslbD4onrjmUO21sO9AXoiuXbxoleaJzUXLBeKrW020rxS+8FuJvzxKVVOGkR/q
         4bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499518; x=1775104318;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJRKMt5STVkyb1Y7d1ZgMO1sueYs1DgBavRo6QS64AI=;
        b=k6+wmzcKDugxbZGEGyCsmr4+aT4UIBbnDFHiw3esCm37noA1oOL1u9qj1dwgVarsLv
         4T5lGEgoPQ+sn+XoYprY4V7A10x4ZA0gHJgCeE4Dog9JlqFGUt8y/52oP0rh/6jTysuD
         tUOFLAlDt4YBsbYcXE1sz136Gym2A47x6dnmjJpkLXaWjkwBatawvcEGMVzhjrjiRm6Q
         FDGaGXHz1B3oXiLDHiAXY8rtBgsG7p0JMoZiGW9tJyug4R6+KrpfyBavCn1HtEDkxsMX
         nYtyOAQqysLp3BJUs4roIG71BUMPq6tMS/hZc5b6fO29y2owub4igw4DvHNDIX/DaHe4
         I8Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU59UWJTtqArEajs8XFiZiDWmyWcMEA+TxjqAxhqSzcua8euuMooZOrxNX+/jKVGC+uixqpXxoO35cfQQlb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VLjlbvmhu9UeeOzhN7Dwb2aYey2QUiJ1KDW9Gt7LI4Lwc7W8
	BMZCx0+ShT8loy2Wxxt63wfCB2Cg9scGPq+VZbu3DnOicUSV/UGLYrueyGqa+wlSmxZn7tEeYQD
	i8LBD6FxUTrs1QcxtZXbKc0Pf4cbSu1nJoZVh9fgpqfciPBb7UQMqPEh+ciK+LnKT6pYz
X-Gm-Gg: ATEYQzwEKSicoV6hqILknIRfUmDn90RqDincIHkH3nu7SF8ZuJhRJ5TEFVKWZxOFGXr
	fIEEMVN36cqm7NlsP4sIRKXzqqkFl5qKlcFRtkwPzK625WmFTKhwwAK74HWYb/KZA2KBXITM9rG
	drHEmWusakqvQeCI73uILePq1XYr/6MgmDKicCn22dyYjTHk7tnAl4tBV+0BfU/vdsUWEJxTKkm
	84ukYg3fdWiJE96LogUlNaMTdHBxgRgcKCUcMxy6KGIngwD/bPH+FFSQp6p0o9u515dwymFue1+
	b+NMnPgr5NFxJelkf+Uq/v9rsRVmW81HwErnMY0TUNWCH1/QcMLU5JitENh1663zhtj/YA412lA
	9m08DubIj7EVixuL6YqKBHftrWjDu72z8JdMxPd3qpe9+p2Dew4APUPxJ
X-Received: by 2002:a05:6a00:4b0a:b0:829:809e:8981 with SMTP id d2e1a72fcca58-82c6e0e616dmr6256923b3a.31.1774499517598;
        Wed, 25 Mar 2026 21:31:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0a:b0:829:809e:8981 with SMTP id d2e1a72fcca58-82c6e0e616dmr6256897b3a.31.1774499517105;
        Wed, 25 Mar 2026 21:31:57 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d22c8e8sm1177396b3a.24.2026.03.25.21.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:31:56 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:01:48 +0530
Subject: [PATCH v1] i2c: qcom-geni: Skip extra TX DMA TRE for single read
 message in GPI mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-skip_extra_dma_tre-v1-1-deef018895dc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALO2xGkC/yWM0QqDMAwAf0XyvIKNOLb9yhiltqnLxpwkVQTx3
 +3m4x3craAkTAq3agWhmZW/QwF7qiA8/dCT4VgYsMZz3WBr9M2joyWLd/HjXRYyvgkJMV1svHZ
 QwlEo8fKf3mG28DicTt2LQv7dYNt26Um64XoAAAA=
X-Change-ID: 20260325-skip_extra_dma_tre-a3cf22f81d9b
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774499512; l=2657;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=NpFXvrYh3Fb7+pGlr/Z61Pb78xmA51Vjq3Rxx3qOVtg=;
 b=F4oCSfY3o5eliC5a/9PowUrf5FxpGtSwz/W4vzzQWSTjf14iwuzX8WrayFTCnK9XM9yo9kEL2
 Iw5BwmRKNyMAZKpj1OK+i5GLjGWoi4vXfVo03bhtCg3FGxQGx7hFxXK
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: 89St4JdnPbwsR66xoOCKNjA-wLwi6b0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX/y6VAJsO/4Lj
 oppIoqqg6Qg7XxW4yJeTslUfg8c6TbMRCamqYjYY9YTLPyRDA9jtt/apPg5FGltRr14j1RvF1ma
 FUZj/8j5VVEh9CsLFjIU0da3ZBzYZP4tIK6Zyp/+J3ctzg25lRQ+Dbj4+gycjHD48D+NUPNwzrU
 GUgZlhZcRBBaTaAYHN5OkdZgutIjdjWGGySE5RxdaAn+CXe+yXg2sCwr5SQtNewYqXy1ET8p8h6
 cCilmj9I5Gp5OSDIdZWXhLYCCYKM80HGS59t3pIMf7/+zFwBBx8h2vHQr1JiNJgmaSiI3ggwKkB
 5q9z/qTHmBBfpm2EvSLi3RncgLsLxUDZR5UHtIPBqCG52k4U7FeOCnbDp/gEn40eEz2JJV4qDTh
 NfGVrwq1alg3LyS8gOpkm866AbD+9zUyUihv1Lxizf0GB6p7VO2g0WAHfTrpcwszmcP7D+1+gM7
 iJW1KISs7a/Xh68V7Aw==
X-Proofpoint-ORIG-GUID: 89St4JdnPbwsR66xoOCKNjA-wLwi6b0u
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c4b6be cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QTaY6CSZEmO6sGPGzGoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260032
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-100019-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5D3632F0BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In GPI mode, the I2C GENI driver incorrectly generates an extra TX DMA
TRE on the TX channel during single read message transfer. This results
in an unnecessary write operation on the I2C bus, which is not required.

Update the logic to avoid generating the extra TX DMA TRE for single
read message, ensuring correct behavior and preventing redundant
transfers.

Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..2706309bbebb 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 {
 	struct gpi_i2c_config *peripheral;
 	unsigned int flags;
-	void *dma_buf;
-	dma_addr_t addr;
+	void *dma_buf = NULL;
+	dma_addr_t addr = 0;
 	enum dma_data_direction map_dirn;
 	enum dma_transfer_direction dma_dirn;
 	struct dma_async_tx_descriptor *desc;
@@ -639,6 +639,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
 	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
 
+	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+		peripheral->multi_msg = true;
+		goto skip_dma;
+	}
+
 	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
 	if (!dma_buf) {
 		ret = -ENOMEM;
@@ -668,6 +673,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
 	}
 
+skip_dma:
 	/* set the length as message for rx txn */
 	peripheral->rx_len = msgs[msg_idx].len;
 	peripheral->op = op;
@@ -740,9 +746,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c->se.dev->parent, addr,
-			 msgs[msg_idx].len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	if (op == I2C_WRITE && (msgs[msg_idx].flags & I2C_M_RD)) {
+		dma_unmap_single(gi2c->se.dev->parent, addr,
+				 msgs[msg_idx].len, map_dirn);
+		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	}
 
 out:
 	gi2c->err = ret;

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-skip_extra_dma_tre-a3cf22f81d9b

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>


