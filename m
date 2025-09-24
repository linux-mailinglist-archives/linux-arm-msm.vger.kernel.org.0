Return-Path: <linux-arm-msm+bounces-74785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B31B9CB53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FBC31B239F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A907288537;
	Wed, 24 Sep 2025 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg0f5uth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6725A34F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757608; cv=none; b=NHiQ637emn5165wO+nzu6n5vHPGX1T2VV+fILmu6XuyXLyZbXxhmfjvsV0XRgGucsSRFn2MyJZmI+6Du+6kpeXYWmjGk1l9zl6QKgJxO76zO2guP0gf69KVjOW4+ZtR7g3GpMSBAqmjzQry+SQYbxtbhjx1HfBGCUtS0o35/YZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757608; c=relaxed/simple;
	bh=g2/3CXxFWBOUXC2gO/bz9GIepGtcpyazIhkgkbnJiO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtlrYKESeZQhncTslE0Je0f5LJlaeFNgCfZirudT7lZ8VZiJJ2OIL9yrmS40qR5/LihIl4t7Sf5gdr5O0OrQW94oZ2SSL+FRjJHVSR1YzYtxKj7Sq7DsykiOXC2LtoTUK/y8k+U0zSHgozPZIQASsuIrZ8UOFSsChZBg13RuKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg0f5uth; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD1BAT002114
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qV9ItHEjUJjFkqDNpm9AeYOsqDGDG7ItIfgn6ExfwT4=; b=Yg0f5uthwx6AaL/P
	P7cs8rJ5XpNB5ycMU3Tp7LmY20kT0I6puAV9yO0T6NaO1O2+4/tT4Uu+vRfjh7Ql
	305dn67StXGN26L4R/eEQbckvVR2EDueWByB7aDDxlYiyNOvSjVzcxwaCWoA85h5
	8y1tP+FYqahZCajiPZ4WO34mVEkcS7/3PXxAE/P13h5qxy8OqsI4QiDkwf2DG+1G
	zi4Z0Vy1Q281nR9iPJ3m3g0PTv4F/G8JknKwgQkzvV3XbYm/QsT43hNZ93e8tklO
	P8+ZwzjnSVzL/QjRlsestfTTb7wdF1FHchMg8s1eQ3WxHlfXF+4xN4jdXPHZdb2K
	AuGTHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p3bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268141f759aso2867735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757604; x=1759362404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV9ItHEjUJjFkqDNpm9AeYOsqDGDG7ItIfgn6ExfwT4=;
        b=QZoDdMO+dv8RFKxb+qiKkvWUZ7awjuatX9u9T1QvY3l9TxirV8twSdf4NJqbQrwg8e
         07mlhT6JBVVbmN6JmZ2GM49RIbe1j0jaVIts3/DHX2BA2zTPytYPFlQgHkqs4rm373YE
         AJamHW6qGtsm36f3EUGbtWDSa77Lbr2FfgwmTA+rh+hLJJ3IKxj1CfNBX5fM5DryASbA
         F6yQBAixJ3pHM4NTXszCJfbh3Aq5qzQ8n0iTmRbUnsNOomX8jA2UeyzCDKKXvIE7gWFt
         BBetDrVGExQf3+YexE1NPyR9cJzByaEIJUCV5qhbE2LeER3f8/jfIlzcHSKNcFxmyb2/
         ljMg==
X-Forwarded-Encrypted: i=1; AJvYcCUDdLAbAkA8touTQgj7fCqjb9mN+Gl/3NiY2UUsZevV1ylruhTyx261w2IqFojnL/HK2tdgSN5gTVtZg3gb@vger.kernel.org
X-Gm-Message-State: AOJu0YyvFbTJJt5XiZHqMLVpsMQ6BUarPrVubameF6FYC5DuZzmYKQgk
	U95l73Ibp/XrMsi/43Dz0F+jLg4KV9EFlcGoPY7NfcIdkQEP+SysDdpj9o0a1O0sjEUIdKjWTPF
	MHZiWQ6bjtYd9Y99PeGvYSfsYZXxDvKMNOYPQPJWGOYoaZsa3LnZ8JqUD+fX+oaBP+Qv9
X-Gm-Gg: ASbGncsbnTEV5640MSwUD+vwRnp6CNsrmjMTPb9lyxaIU9GDJu87mQrK3suUiVVA9Ec
	88M6z0AFAK8okatFKl7Ruk+WfQL2SftXBl0dJuLyoCupWgHN56HYU//6ZGlvdUHmBzb/rhC8/c0
	AJ0C+km/iEy6sgNWqgBkDZx2dk1XzDGs1VK37iiS5ltCv+bvn+yspqZ01Dn7UUnzzed/Bb/RrNe
	SCQO/5a7csHapToYE7uBJDr19G3oA1axiAeBNxeoWhA2hF2KnFw79dp9VOeViIqe1DKKbIrtv7Q
	46lAqB9bdYbVxZaMDYEcOZcIy6BQbVF4iKqBOuFyLglC3DGv6mQu6Owv0ldP/NLp8RtyeVhnhrB
	F92+No70GNbw8k/o=
X-Received: by 2002:a17:902:f549:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-27ed49d5b3cmr14796525ad.19.1758757604045;
        Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOMv8i7DNIHjAdTVSla7dHPR+o+BJeTxoyB6uM935XGng2Q0Dmiyk/mferG3jgoimXPzgtug==
X-Received: by 2002:a17:902:f549:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-27ed49d5b3cmr14796295ad.19.1758757603597;
        Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:46:36 -0700
Subject: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
In-Reply-To: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=6515;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=S19jilbj7iYbywe2b8F10V99zSDUKUvU/DzMK/hBxow=;
 b=DNgEpFTgVe2sbcpunAFV7X15WOVL8mlV92KXOkA9sPgNknw1oVLYtjduNcqerSSD9T2lZUNFL
 djxGIULhiihDKYeMkFhhf9WjhZUOH0Ygh/l/vrUOYmsJWO8A+K2Bspn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: hcyfwTIG8svAHEmQcluxinl8w4UqIgvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX5Ijcyk6dFTZr
 +2qvSBBLZIHTCPRkTHigw7M3LfmJNKUMkF5FgyoSLbBn6YYH9wGgjipuVZLrpjfr4GAbQ0cN501
 8svp11enPWVJaQcIZfB6f0Xwddrzk1S1+VSmoMTn8Tow+5Q+bckftbO94GuKVWnol8ff8S7FsVZ
 73rX9uUWdJwAP5B26b1nefh0kkfktME4ABqIv2P0daQZ0nJe++Epvpl7IPpGevDXW1SRTJ451AQ
 5voJRfHW/8IXnrznLx8kxLmX1r1Hy7hx/OkDC+y7oGqpdeuaY2xLLD9elYOROM8L+QcwURl1WJw
 7bNp5oC5ZSEQKcuTCJnZOtwUPz2aO0dWwj3Ni/U++MLEyjnyE8rZKEScICVNTY4enWHG8SmkRcx
 WI+bu7CV
X-Proofpoint-ORIG-GUID: hcyfwTIG8svAHEmQcluxinl8w4UqIgvK
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d482e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SMfjFN7pHoWw_NirdsAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>

Implement the new IOVA formatting required by the DSP architecture change
on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
physical address. This placement is necessary for the DSPs to correctly
identify streams and operate as intended.
To address this, add an iova-format flag which determines the SID position
within the physical address. Set SID position to bit 56 when iova_format
is enabled; otherwise, default to legacy 32-bit placement.
Initialize the flag to 0 and update to 1 based on SoC-specific compatible
string from the root node.
This change ensures consistent SID placement across DSPs.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8e1d97873423..db396241b8ce 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -33,7 +33,6 @@
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
 #define FASTRPC_MAX_CRCLIST	64
-#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
@@ -105,6 +104,26 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/*
+ * By default, the sid will be prepended adjacent to smmu pa before sending
+ * to DSP. But if the compatible Soc found at root node specifies the new
+ * addressing format to handle pa's of longer widths, then the sid will be
+ * prepended at the position specified in this macro.
+ */
+#define SID_POS_IN_IOVA 56
+
+/* Default width of pa bus from dsp */
+#define DSP_DEFAULT_BUS_WIDTH 32
+
+/* Extract smmu pa from consolidated iova */
+#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
+
+/*
+ * Prepare the consolidated iova to send to dsp by prepending the sid
+ * to smmu pa at the appropriate position
+ */
+#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	u32 sid_pos;
 };
 
 struct fastrpc_channel_ctx {
@@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
+	u32 iova_format;
 };
 
 struct fastrpc_device {
@@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
+					    DSP_DEFAULT_BUS_WIDTH);
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->phys));
+			  IOVA_TO_PHYS(buf->phys, sid_pos));
 	kfree(buf);
 }
 
@@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->phys += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
 
 	return 0;
 }
@@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->phys), buffer->size);
+			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
+			      buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->phys), size);
+				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		map->phys = sg_phys(map->table->sgl);
 	} else {
 		map->phys = sg_dma_address(map->table->sgl);
-		map->phys += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
+				 fl->sctx->sid_pos);
 	}
 	map->size = len;
 	map->va = sg_virt(map->table->sgl);
@@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
-	dev_set_drvdata(dev, sess);
+	/* Configure where sid will be prepended to pa */
+	sess->sid_pos =
+		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
 
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
+	dev_set_drvdata(dev, sess);
 	if (sessions > 0) {
 		struct fastrpc_session_ctx *dup_sess;
 
@@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
 	return -EINVAL;
 }
 
+struct fastrpc_soc_data {
+	u32 dsp_iova_format;
+};
+
+static const struct fastrpc_soc_data kaanapali_soc_data = {
+	.dsp_iova_format = 1,
+};
+
+static const struct of_device_id qcom_soc_match_table[] = {
+	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
+	{},
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const char *domain;
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
+	struct device_node *root;
+	const struct of_device_id *match;
+	const struct fastrpc_soc_data *soc_data = NULL;
+	u32 iova_format = 0;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -ENODEV;
+
+	match = of_match_node(qcom_soc_match_table, root);
+	of_node_put(root);
+	if (!match || !match->data) {
+		dev_dbg(rdev, "no compatible SoC found at root node\n");
+	} else {
+		soc_data = match->data;
+		iova_format = soc_data->dsp_iova_format;
+	}
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
@@ -2343,7 +2402,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		err = -EINVAL;
 		goto err_free_data;
 	}
-
+	/* determine where sid needs to be prepended to pa based on iova_format */
+	data->iova_format = iova_format;
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);

-- 
2.25.1


