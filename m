Return-Path: <linux-arm-msm+bounces-30388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C469683D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85A01C2270E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4171D2F52;
	Mon,  2 Sep 2024 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="garDceda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B6E1D1F44;
	Mon,  2 Sep 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270949; cv=none; b=XW5UBuiHs3Ncw5BPltctwL++hoLYYpZwSkAnaIeKa4ejaDzsUaznAZZX+5i9Rl1mhhf2RdP4d2kCCeiBISib27t/GteAmuAXnTlzgDAsF7HjuDsglCoxC1QyGEyUlwo7wudWgfzZW9+wXYwlWQN02JIrq2gFjkXIOZMq5AFNj0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270949; c=relaxed/simple;
	bh=oSbh502HY4Dm7eT1eVi4kY+Nmou7uF6mBzhrHjfaVG8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KF2ccvYtajv22GFVSGnlnTqYrV2Gfcfy7+OtpynRxq/w/A9dSbRU7af1PoRKcHDt3lr+om/BRarJtQeEsewjWt+LPsFFptVgD9mZgGPZADrcr6p0uCXLMySnh2g3zTElJfTmEUkwnee2Ju/mqJsviovrg5XnZDulFY+8P4k5/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=garDceda; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481N0WlF020660;
	Mon, 2 Sep 2024 09:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+0UtkfU8O8EqtBRippx73Z
	t/xKIk4RmzJwGe9dLxsLM=; b=garDcedaPCzJmrCWtbrUJT62pVwHdotzm5sJOr
	YUIRU9u9tpiI1oCYG8ri03pTrltvlCKxAR5auj1zrohmIHTTgNGgraMDyW5YZ/X1
	27sqpIMw0bMs8jQ5GY/69PayOf3tgmSm3oRqoTV8qJwZNYQX9MU5FFsqZogUh3WT
	ITV3pnDlfaulo59WAC6ybFTkJf990O6vIosmzbeDvzfWfqvq5MnpC0HgM9KkkLQX
	oriSGYRpPhFavrdibWdKoUBAiI+n9UvEanIYP0jjE9LRpZjFw/TCagcZcDo/yaO3
	3d5kxbnWRBpTQULYFjuYJXBGnYAb8AKANKY2iVM5/xszqeXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvf8v53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 09:55:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4829t777002818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 09:55:07 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 02:54:57 -0700
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>, Rob Herring
	<robh@kernel.org>
CC: <kernel@quicinc.com>
Subject: [PATCH net] net: stmmac: Stop using a single dma_map() for multiple descriptors
Date: Mon, 2 Sep 2024 15:24:36 +0530
Message-ID: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SowefPK2xML-I30pU6pjQmD6hjAW__dP
X-Proofpoint-ORIG-GUID: SowefPK2xML-I30pU6pjQmD6hjAW__dP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_02,2024-09-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020081

Currently same page address is shared
between multiple buffer addresses and causing smmu fault for other
descriptor if address hold by one descriptor got cleaned.
Allocate separate buffer address for each descriptor
for TSO path so that if one descriptor cleared it should not
clean other descriptor address.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
---

Changes since v2:
- Fixed function description 
- Fixed handling of return value.


 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 ++++++++++++-------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 83b654b7a9fd..5948774c403f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4136,16 +4136,18 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
 /**
  *  stmmac_tso_allocator - close entry point of the driver
  *  @priv: driver private structure
- *  @des: buffer start address
+ *  @addr: Contains either skb frag address or skb->data address
  *  @total_len: total length to fill in descriptors
  *  @last_segment: condition for the last descriptor
  *  @queue: TX queue index
+ * @is_skb_frag: condition to check whether skb data is part of fragment or not
  *  Description:
  *  This function fills descriptor and request new descriptors according to
  *  buffer length to fill
+ *  This function returns 0 on success else -ERRNO on fail
  */
-static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
-				 int total_len, bool last_segment, u32 queue)
+static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
+				int total_len, bool last_segment, u32 queue, bool is_skb_frag)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct dma_desc *desc;
@@ -4153,6 +4155,8 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 	int tmp_len;
 
 	tmp_len = total_len;
+	unsigned int offset = 0;
+	unsigned char *data = addr;
 
 	while (tmp_len > 0) {
 		dma_addr_t curr_addr;
@@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 						priv->dma_conf.dma_tx_size);
 		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
 
+		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ? TSO_MAX_BUFF_SIZE : tmp_len;
+
 		if (tx_q->tbs & STMMAC_TBS_AVAIL)
 			desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
 		else
 			desc = &tx_q->dma_tx[tx_q->cur_tx];
 
-		curr_addr = des + (total_len - tmp_len);
+		offset = total_len - tmp_len;
+		if (!is_skb_frag) {
+			curr_addr = dma_map_single(priv->device, data + offset, buff_size,
+						   DMA_TO_DEVICE);
+
+			if (dma_mapping_error(priv->device, curr_addr))
+				return -ENOMEM;
+
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+		} else {
+			curr_addr = skb_frag_dma_map(priv->device, addr, offset,
+						     buff_size,
+						     DMA_TO_DEVICE);
+
+			if (dma_mapping_error(priv->device, curr_addr))
+				return -ENOMEM;
+
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+		}
+
 		if (priv->dma_cap.addr64 <= 32)
 			desc->des0 = cpu_to_le32(curr_addr);
 		else
 			stmmac_set_desc_addr(priv, desc, curr_addr);
 
-		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
-			    TSO_MAX_BUFF_SIZE : tmp_len;
-
 		stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
 				0, 1,
 				(last_segment) && (tmp_len <= TSO_MAX_BUFF_SIZE),
@@ -4182,6 +4210,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 
 		tmp_len -= TSO_MAX_BUFF_SIZE;
 	}
+	return 0;
 }
 
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
@@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		pay_len = 0;
 	}
 
-	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
+	if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
+				 tmp_pay_len, nfrags == 0, queue, false))
+		goto dma_map_err;
 
 	/* Prepare fragments */
 	for (i = 0; i < nfrags; i++) {
-		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 
-		des = skb_frag_dma_map(priv->device, frag, 0,
-				       skb_frag_size(frag),
-				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		if (stmmac_tso_allocator(priv, frag, skb_frag_size(frag),
+					 (i == nfrags - 1), queue, true))
 			goto dma_map_err;
-
-		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
-				     (i == nfrags - 1), queue);
-
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
 	}
 
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
-- 
2.25.1


