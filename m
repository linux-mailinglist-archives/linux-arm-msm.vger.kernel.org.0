Return-Path: <linux-arm-msm+bounces-101615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJRlBGZ9z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790E3923D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFBF5305B5F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCE037C911;
	Fri,  3 Apr 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ej4FKVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMPbFf3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28437B011
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205707; cv=none; b=tJKMh2LUo7GMPEO8GuzfqeltZ8CCCrvYccWio9xXigB6L6Kyi3u+qlOZCj+uKHRQPQmcDEYRWOF2HCJlicP7YckzBCjj/aA1wlFy4X2yZz7dzUhiIZ6pZ5OWWyDAvuL+lnZC5GEjQzsUDTeTLzpyzMXBwFy+ZyJelKm5CUyHDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205707; c=relaxed/simple;
	bh=/xJ8nlzEUwBgB9odC2pDNog1qLXHQGWB2GUPekbM6FY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MoHveTne0qsgQO0/SfAICBsWr/BZHtyxspx5HMDls6V4GxNds3X/oad1a2QQ9U67MnwSveEiaXBOsOHahu9gpTvR7qIWIhW6zN2h/I//dFFLNT1X5fnGS2fW1/MLnI00cOcLjvwSI+43kefQ1WWOpQwiFVNHnwlUB+iPaBkZ/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ej4FKVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMPbFf3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332wBZ71380432
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 08:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9v
	nAIyjv3o=; b=ej4FKVO2FH0oAp4MNdN5hb1b9k5gUhvwvlo86YCJVpzdmzRdxvR
	tVGpIhdjlHoSoeJQnQY+VGGu8Ul+8RQTGPYnGX6MaynkGvZFP2sZgBKU2uwphhzo
	s5MJt6+hP552oi9ARgCgfGY++KgDQVAKc2sgtxwtD7dK3hni3/1DQDOIcBi/+EN8
	o4uqXMR6qtpoDohrSaLpUpuJfRVVSgt2JgUrMWBNq9DQj/QABvcvWuwPi9pZ6Ju/
	hqfMW06cN+a7m2Zz8zYklHS6vFkvZypXv27+X3/vsSj9u3UDBLwD5taGuJgBncyK
	RLZsY9ex3S8ZCYn58Pvu9/UXYxA1DWpWDvA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhchb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:41:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c4664f75fso1113724b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775205704; x=1775810504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9vnAIyjv3o=;
        b=ZMPbFf3+ogIAK80b+3QVo+7FSh4eWr1JFUQW95LT2EJXYuLFaGkplNIY30wgvtcYPD
         HaLAdxI9AdzAXDdPL7udyy7uEDNFBECwVGm4t1EEgWQf6M3hInqbwbcumOOkKjugiIVw
         6yTvgC2sVGHp1jtuv1XUsZ5VHCv5PgQfGgl5MFYJYl0LhF7J9JRiaenwqJvIAZRPiZHV
         tZ1dhYOGY6wswJOoOTWzQq2iRbLcPaL/CXL9LHXKntLvZcGMj1t7DmYkDD0q+qTjI6ej
         04xvELaJlIdFVhnhYERmPWQ9rtMpD6jEw2Yeow3jbQ/ciT9eDAwg+J5EqCEwfOyW0r7X
         XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775205704; x=1775810504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9vnAIyjv3o=;
        b=msE2MgY+seaEIYKjKkBv28Qi5xqpgvEEaopH0qNdhzgyRnB3DFOJR4d8HX/5w2c1F9
         W70g0TREVZR8g8qHfFvd2sz8yIr+J0F++zvHJbbezjEqbXeKw3Scy0LsSN3IWclktoPT
         BHiQxl953C54Tcbf1VjZ1Xf/sorljsiaMh0hS1matvjEfjmWG65mJZJdSDVHKTXJQ0VG
         PqfmuEABAMaUa1h+30TZIDDlY7DzR6DXub2WhUzszWemeWq3oktNHpox0+1+0FOagfn7
         MK4LxJ38DfMhxZB14SmwIWL8NHTqszLqg5o33WqgxSRcAz85CQwlS/ZUVxMSphLy2Kf3
         PWmg==
X-Forwarded-Encrypted: i=1; AJvYcCVUaWnx/H0cd9r9oBNP1bOvgZGNDSS7bUa7W04lvtJpLKqKG37Vgu7ebPTDA68cDIx5ZttSiaVaBCx1JuhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qPo/NamNbvv5u1Vbym212y8ThEqynfxEhd2YvelVQllPzhTM
	cEvX77vnoVQAM/P0o17SJ+PVyNYLGK2VqKy1MyH609o4w/tgQD1JOGDSNLAw/rKE9xLEs8tZPE5
	2sByD7niBR010WfFyXpfYL77nkYtobp0fvQ4NZ7dk1XVGPBfN6go4ywo2LMG2BDrR7gEr
X-Gm-Gg: AeBDiesLP+bOjmr9+xZKDb6VkX+o7d6ziuFHswcNkVkZefD2fOZNPrkXPiuTcpZWmdK
	eVGI2oD2D/q/lLf6TS1452ObVCGDB4QraFbCHjXn/Qh+uOYreZopasgAd8/+t+upvStUHoPsdDh
	7AfLaOq/wMA8yyunAYN4W1zVgY96G+LtcMp0kgCstDYWNxczvrf0gOmF5RFgZtf06OzTvCBpCud
	KU/Mu/ijT+8MN1KXbE+I7ICpyYmCFaaFDG7RkyXSnUDgrvZiudl7E++N/aYb/+EKqz/ZH5lnjJZ
	6QrKWigdrmUtSd4UB2dKAENmQVDkrTqBt2Qdmnn1U/VxXA912kLLN8+rYB0RRJRzTyXcg0EXhEj
	36BkTc30T2JkBFRc0flmj1GD2gg67dOudR48wWiNrSZnRwFPYs+2eS+OZ
X-Received: by 2002:a05:6a00:2d10:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82d0da34535mr2228690b3a.2.1775205704182;
        Fri, 03 Apr 2026 01:41:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d10:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82d0da34535mr2228649b3a.2.1775205703692;
        Fri, 03 Apr 2026 01:41:43 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2714dsm6757172b3a.1.2026.04.03.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:41:43 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode
Date: Fri,  3 Apr 2026 14:11:35 +0530
Message-Id: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sXDFyTYYAe_lxngX3j-2MwwSNChDmsZk
X-Proofpoint-ORIG-GUID: sXDFyTYYAe_lxngX3j-2MwwSNChDmsZk
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf7d48 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qPv6kJ6rrmvbaMxWJaQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3NiBTYWx0ZWRfX5ESAwaiYm6jw
 +DoH7Id++AHpJjSjKJPDjIECzBnUS7KEk4l7ye/3uOVbctZwwMNPYuWFli3FsXFOAoig+/mzxA7
 YbWT4iN7RVgFZXHwgsdpXN5kEjbWPW+xzYoZup8rsg+MSumwRsgOcJClDrxMl/2KHvKW682t5Ss
 dfRi+LsjbGRGu7EAJpxcDCMpTi8eZ4cwCXUag81J6rOCP2Nav75tKBzAKae/A933DcSxXhTK7FD
 Et+03hPSPi4hwhKjil4dkUZ5esKMkPgtL+z+JDeinNCVhI6zmhTONrEA4YKoDD17hoFLBP7mXFQ
 c2BGvwi79w0ga1ZRh5zr9soNaIO/fmh6L1BCBu+FF+5pQNn+7kvpoL/Oe+/46RR6WInVA4EaaAT
 5wcFmh9FjI4PX3XKPXTadUlBwwggUtqk+nWLSjTQ84W82hgil3TNUgDhT0K3IeYr8LaoEkaANNd
 k9pCc3yvUThtu7cOSdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030076
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101615-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9790E3923D6
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
Changes in v3:
  - Added comment in the driver for better readability and changed the
    position of 'skip_dma' label to allow dma engine configuration.

Changes in v2:
  - Updated the commit message.

 drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..78b92db7c7fd 100644
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
@@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
 	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
 
+	/* Skip TX DMA map for I2C_WRITE operation to avoid unintended write cycle */
+	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+		peripheral->multi_msg = true;
+		goto skip_dma;
+	}
+
 	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
 	if (!dma_buf) {
 		ret = -ENOMEM;
@@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		goto out;
 	}
 
+skip_dma:
 	if (gi2c->is_tx_multi_desc_xfer) {
 		flags = DMA_CTRL_ACK;
 
@@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
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


