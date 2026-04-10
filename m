Return-Path: <linux-arm-msm+bounces-102672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NgfN97O2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFF3D594D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D73530233E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F18637CD2E;
	Fri, 10 Apr 2026 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndPdVVLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4AFAO13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD71C37B01E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816401; cv=none; b=V7rYojjn79S7LTxrAz54e/nCfEzLOf0npzZSY9CdFxT0M2oPSpnLPB9T6X0r6dFmbIXwHLrkutDO/rN2ZhqQpX7k0jMKoWhN4FavcmB2Z6dcpYJ6y/NhYQh/WdUZC/9LYpirNLO2wD9hVe2e1x3OTi2tEHZPeZTtafajt0fAthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816401; c=relaxed/simple;
	bh=U9lnarrase4jaY5q287H+b4eiN/j85K2bs3ZiGD/sKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E9Jlwkg/Pochaz4otH2xAFRyPy7z/IkL5hqz8MSREuMphGRfMFBNcfY7TeE9esTHFtJsVo3soi2Tkrx2LbuI+Hi23wnGqz7qSquMgsgYukr24EFRQFMk66nFspQhEkrkLUrrYvglmQ72HK46Dn8ryT3o1sq7WPmhbf987fCIe2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndPdVVLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4AFAO13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA9a1m2047038
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6jAgrIXul/6oRSYYubPw70Q0si68WXVn+fa
	kGuy+ODE=; b=ndPdVVLnGPt32e2MEzl7sTuz9/zVb7Sk84BklOIbc/rtOnMHJEL
	6J+fQmw38SM2WVmQRhoUZxq1JPCnytnNgArI2MVnT+7H+9+tsq0JMpTHzF/xgKAd
	a6IH4gcMXW9TISx4eJ1JpoF5ESDjtT6gjEquabdsRmduxNHxtVD2uEzbJ34suXz+
	WqwbGrj4lFSE8uqFuyLx/qQcmXTS266MnkSJSXqfy9tCcrS367sBehXCLdq20vlc
	pGC7/r0GVnkNCxZoLcI5VUv4xZkN/l7EaEOGEsMf8cdLCmtyafGpMMA7qSNJr7Va
	QApP0LKWRTcmc5d/DwrpEJSBJgRAMzDg6jA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey7781n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:19:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b57e192bso12691185ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816398; x=1776421198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jAgrIXul/6oRSYYubPw70Q0si68WXVn+fakGuy+ODE=;
        b=S4AFAO13j9CjWAb90zPY+HckegWhCoh41NLZb1ULgjpWV/8MXkr/PAyYbyV69bcmJ8
         nyHuZK1vULNQbpG+xNRqhA0g/xIXdS3vW5LlPNMSp3y8ChN5zrzX0ELSkaEMER8/ZR15
         8rwRZ79PhJyjmz8pD55Wjl+EhJEoKw22eLXF+1qxKgo22J26iZRXOWBD1qGJ9XO7lhdU
         UfSsq+tYM6aXr3dLx3V3uQf3a1YW2X0yNIgCnhJyqfGFtuAqnMsIhwhK08RPjBc3ydhn
         Nqc9M0gjnquVaZww9g+XZiUwg/dG702u9OtidmUPLlgKuPTqiLfDEepyJHaqj1rqkvZB
         QMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816398; x=1776421198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jAgrIXul/6oRSYYubPw70Q0si68WXVn+fakGuy+ODE=;
        b=tA5hgrhUhmRK2qgBsAgLZ6UydFlll7RURfzSPkjl80jZu56UsI6uxvJvjL+Ri3oNmf
         fzZrcPNqIY7dM9p2Lw/QfP4idsZ+lhc0U8Dbpa4G71nEJEHsLhjXtkNQQTZL6H7Wurnj
         a3oHrHmeWkiSDr1LHkNnzhs+EEuiuWcIi3CT1poQiYoyzmJZXBYXUm+XRp77bYeGntu+
         8bktvAdPLYBDeY9Ai4iKPmIoWCU462akm9kef2DO7tRTIHP/FO9JmVLeVEjyB+4ofo7f
         QWsJRUFX821X/qi4NYz3pMsw6m47LU+F19qTt30Iv4C/O6nY7tc/yQVgq2fZXuBGm3+p
         KJOw==
X-Forwarded-Encrypted: i=1; AJvYcCXGyeQSzSVtKXFs8oOONaw4cwWKm9vsGKMYf/fqgRa6K1hNwONlRXRuCpfLjlOoDBRTx2U5jP0SDHmz/i39@vger.kernel.org
X-Gm-Message-State: AOJu0YxYX8CdMDlQMgXgyowwUDgfyOZri9FkGBXmmq2HdKJKOJqmVhQu
	ZDMIQix0I3SU1X5aBqLV5R2Yoc4LMXXymH0mvMJdU3LFpXLUG6ynXC0XF6nJt+2GuGM/dED8hh8
	SzoA7C10rK7ZD3raUpmP0oX0hAVqoCID4XcYKf/TbcTtRKsQ0S8+DdyswkTbfVsFFY5vV
X-Gm-Gg: AeBDievJRNxoPYDqXowKQhxul9Z1E+CvHUQYa22xe9I6oLHT9yQRwVb9IpcWQ7EmvVe
	mjWrMGZUsZfmdFf8O3ihEj4GM7TufITGz288U3w5IpG8l6vbyITIhK8i5/v/0wcZ4fF+dApMd8z
	MM9yNsPHJtw5mFJTviEnG17xkOLG20unH68dLB22Dos7jgkiJneVBS7+oklXG5Y2kF/G8kuDjDe
	/zMOo0NLYC0w004fUvqEBST4XtKAs7y/eZtL6LEbjzhd1ACXxIN4283GxPMhfyGWOIgxrHpvpZP
	RNM3ZAb4KintzqxktKZYvNHJ8aFKc1Bz2eBxhwzTj+58wXWYqfrQvUp8XQhmdbtc8TtmHL1cQLh
	ZrTEIBYEaXefGCm4/U+fUBS/y0ygElmTiLWSfXuqqv+rwBx91Ws1fhqX8
X-Received: by 2002:a05:6a20:9389:b0:398:7855:1596 with SMTP id adf61e73a8af0-39fe3c64b7amr3091117637.10.1775816397570;
        Fri, 10 Apr 2026 03:19:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:398:7855:1596 with SMTP id adf61e73a8af0-39fe3c64b7amr3091085637.10.1775816397075;
        Fri, 10 Apr 2026 03:19:57 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219c618asm2024362a12.18.2026.04.10.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:19:56 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V4] i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode
Date: Fri, 10 Apr 2026 15:49:49 +0530
Message-Id: <20260410101949.2315058-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nlvdrD1sercBKG4u6-euYgnm0WmxqeuT
X-Proofpoint-GUID: nlvdrD1sercBKG4u6-euYgnm0WmxqeuT
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d8cece cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=g-2Moo4YgOi5Nr3pVm0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX9viFnEA6XFhD
 GNIvxM0hVqiOncDj+lod53dnSnbUqNuI2V/FctRGAHgw9XowQdpEpX6mgRuuIHzdPpveyBg0RRU
 atRDaIoqjgk+8QNkCwILR5FtLmcY5DY/uOZu5HfsWXTdkDlVHgkplgRwJZq4C8N5ilFLHFXak0n
 IZuUzQ20L68/HsSNym2gJ6ysGRCkDXG+hMW+z7k3eTDkM11C9pF5YNhJ4jMHuHObc7znHFK4Lv9
 zv62xHjVEhgoxT5HNiEt5a1NoZFgIouRiH9lJoSA3qXoJB7OnumWcj/0Fy6EnaOLTV1BdxS5v1Q
 hDS+cRdRWJCr4GkalnGqOksIFRHdk0ZTOQHtmHde2iYC2mvNGELvPXZhnaS651aHWmW6BZH4YMW
 yuAhxLERMZYPE+4P0k+JfEsdOBCQ99vOBcGLJUbETRVsdVh9AdliCOPGcXiifk8F3foWP6TB6Ie
 siL4sZ2B7VyPEb9V5lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100095
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102672-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60FFF3D594D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
descriptor (TRE) on the TX channel when handling a single read message.
This results in an unintended write phase being issued on the I2C bus,
even though a read transaction does not require any TX data.

For a single-byte read, the correct hardware sequence consists of the
CONFIG and GO commands followed by a single RX DMA TRE. Programming an
additional TX DMA TRE is redundant, causes unnecessary DMA buffer
mapping on the TX channel, and may lead to incorrect bus behavior.

Update the transfer logic to avoid programming a TX DMA TRE for single
read messages in GPI mode.

Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v4:
  - Added some more description in comment and changed the label name.
Changes in v3:
  - Added comment in the driver for better readability and changed the
    position of 'skip_dma' label to allow dma engine configuration.
Changes in v2:
  - Updated the commit message.

 drivers/i2c/busses/i2c-qcom-geni.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..a482a4c60744 100644
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
@@ -639,6 +639,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
 	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
 
+	/*
+	 * Skip TX DMA mapping for a read message (I2C_M_RD) to avoid
+	 * programming an extra TX DMA TRE that would cause an unintended
+	 * write cycle on the I2C bus before the actual read operation.
+	 */
+	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+		peripheral->multi_msg = true;
+		goto skip_tx_dma_map;
+	}
+
 	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
 	if (!dma_buf) {
 		ret = -ENOMEM;
@@ -658,6 +668,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		goto out;
 	}
 
+skip_tx_dma_map:
 	if (gi2c->is_tx_multi_desc_xfer) {
 		flags = DMA_CTRL_ACK;
 
@@ -740,9 +751,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c->se.dev->parent, addr,
-			 msgs[msg_idx].len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	/* Avoid DMA unmap as the write operation skipped DMA mapping */
+	if (dma_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, addr,
+				 msgs[msg_idx].len, map_dirn);
+		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	}
 
 out:
 	gi2c->err = ret;
-- 
2.34.1


