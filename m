Return-Path: <linux-arm-msm+bounces-106466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK5HHTiv/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:26:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC44EB001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A6B9301D7C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30314657CD;
	Thu,  7 May 2026 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQGKmWwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoiEoIEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8453EDABB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167506; cv=none; b=l8x/R28Ajtd3kE+7JBpEITVO9uyXPGzzY9wgBewhw4hNnlZee3KHiYtDKhGBQD4SKpzmgpFPhmlblcv5lrzK1+tpGwkpMVC/VvvKnurA3QJjnVQALREkqB/wVstzg1Dyxy0gPQxKyVnGadhJZu0ri3HvSu/JUYJnVkp1qGmtF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167506; c=relaxed/simple;
	bh=PTkmvq/Q7QJ06WLt1N+U7YrHr9PbicR5yuKr0MktND8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaPR7To4Fh0bPcbsIb8FiMtTbwty8jGdRbsJcwUvybE/3CaDUTP54Td9o9OGq64il2M4t+pJ1UAXwadnJS6jSl0sTxzCb+DPunOvZzY50/vxdJ5rDgiPZzzWt2o6a2D+m9OyZJL/cnKWRtX8OEbbXpacXRre0BNUtrRjUrtF8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQGKmWwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoiEoIEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479TXsP258775
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=; b=GQGKmWwPpcYT7z52
	bh2TBhD3xN2aVw+NnsWrysEnuoLLqDCOscuj7MW+9REwKMoW7mY5/4nq9ouPjv/g
	thwhVWE3ViIlDkCt1ycf1AQFZ1cGZ6NmEpXCVrtcQnVpGRxU3RQxdHtKryWF6KTx
	K+xYI7lTzBNnoOWbnW+5KGwx1fJchODrvLFvjUD14mh/H0p4TxPqRr84WwFrh27f
	8N9KTX/ztpP9EOfYjCzV1eoVEbr61V9zen0za/2MVIw/iZ5PXTf+/ZK+7484+EIw
	Cm7l3M9dBPTFL56gluoApthPugAaLSFg/qxw+RHO+JWjyxvQoRxJcadQFKuQf+xk
	3Wj1hw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8ttyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:24:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d5e66646aso1363218241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167499; x=1778772299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=BoiEoIEGSFg2nLyqYhoAS3ipSziX+Bf0RWodsXs3iufy/Qa5PRuz7MUHqznU+dHm0/
         CqCfhVboEOvao6bgt8qedh76exBuQnXexVSN5oyVY0J4XngL5MWXWqxuvqrvcovefsDi
         38NyygRbYNg08ggM+KVxvhyMY5loN1lk8prlnui30qmnvBnG6GaXU/Pbd1pGWh68BpnP
         NtLiMrx8YmEkEXBoTRuvWGd9nYVoXNbJreQ6RAP6DvEk7RJMf6wb40CF1bFe2tUeiOvK
         Vd2epm1UVYz5f9qY8KAc/0Qxe0AHlFmHw6+TE4xzWYAUVsZjhDAlx7bHp74J0vDwYHOm
         Wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167499; x=1778772299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=SQD6D82MTcUKCOJPiYCvL8GZijkGzrMVpRYMHmsEmpVeIJf25KkmItrZe4E5spwIvr
         naxb8Xs8Ujz9KF+zoEzTDwN2Mp02lvQ/vCajrGqqa1A0nSAPx3CajDr9o0nNgMv5hoUp
         bkuw06ryL2ptyaBCMs+j5ZsaUERzK1H03UZSKfhwQ/CLfTEdDxr5q++L8aZRyo2SD0TZ
         dHuPGS5eGxoiEQQGOUCighN2g5IP2AUFOD81pS/JT1hoeAt2ApPkT6k9UmPdgdzpuul1
         +MI7MxVm+rdLJbJKLUoFszq0X1GuAQqHVWlalrLheiGfZsXZt6vrLdHHZIlQvK6au8lr
         FF+g==
X-Forwarded-Encrypted: i=1; AFNElJ8og6YaLOUXoFGaXOC1lkJKLYOnjB+Q5YYHdBiiKo2LrS9AXqTRCDVOYuw1E9L+WT6D3AzPIuP/nsLkM2P/@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxdf/YwQ9MFeBSFD1nLlSNJ37NND41ncgxyclv1IHnHPrB4yv
	7BAs3JfUhmJdCpS853AmDJd5LVRRnyTsS6hohPmb+Eanax9zgV3ysk0ee93hlPPpZuadeQw2PsH
	mAiVIUiEP64UJ+SAfNPmdxXBB2GzYmXKNh74EmLZl5T17mzr0E98GLWrjpVCdUbAN282p
X-Gm-Gg: AeBDieulUKuifkrtTaMK6DeVX6GvSaQe4PZnRdG2SjFz6zSPPC021m7w2U9EeZVZSiy
	7RmWYK2EAWIufxJGJJlO07IB/3Rh1Kln2qcN9AGBA3SWQs9HpXE59JWXiHPXnam0TpGFEaXd/U0
	xXcGqoxZbtyy6JG2MdqihXw/wHEiZSVtfPda7TZ8qEtUXcps4dD+SaTUngQYnqS3jWllYlvOopD
	P+Kwrr8UAxJaQCuVhIhDXsjpu3TiRGpyPt8eehJG72Man9fFZjML3BRShhIUMDDFspKu7RE6CkJ
	tjuRG4dLfn1ufYx0QibvXUX0TP2Lx7gY+H/3Yb3HwHsSN6kQHzWU0MnfhiZ0S0yC2gIN7v2KXWP
	kOqWVK0dK+QtwVJ2LBF7xCha1XwDkUQUkRT28CxvlzUNXnSjiPPlYfxVc2p2pLyBLNu0Ecft7Po
	bO5NPzNZrRTfmdUCg1kfAomn8vbIw=
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335415e0c.1.1778167498688;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335377e0c.1.1778167498276;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:40 +0200
Subject: [PATCH v2 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 53UsCEPeTjHmPQJfZ9gUjH8_ZvaKwK_P
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fcaecb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=C98JESGoZJZpJ7w8-ywA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 53UsCEPeTjHmPQJfZ9gUjH8_ZvaKwK_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX3ZAK5BChUaTU
 4/wfA0u2/6vZmLuwjHVpMAEHwToBL0jodMU4qWO9BMmKAcRDqMT7POEIXK2G7rgv3FtBczwJhJf
 yqR2HtY7xLt2qmtGWYBGXXToDoSziniSgsZWyvn24KwwxjcDRriN7AcvRgy2fgh0eOmw3bQNB6E
 ibVgGhrj3QzhItikoPT1NQZI+oodfQZO/EQ9y3BhQC36v+0AIHFEEhzBQNOByQdXIVovdPFfhwP
 tOyhGXP7yZeC60/rNhvQucXJac6F4zkzLk9w9EXatU5S1aV4Y/Hw9bErmZoUv/5KNOzLEQFYMqb
 zviX4lthj9mzB9b7TB8pYe1tkQgc5l66KpwNBMTG4HRIcZlkVoYP8QxXDaLrB6OBpgkyE8IoF5h
 EDG+98G4/BzoKvrIeonCHkp9QQN+geiPbf/10DMUMnpMhM86TRjf7DDboIxHeJO9vqf3b+BOEji
 Kf3vSAoUKwKn2LpC/Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: 18FC44EB001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106466-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 47 +++++++++++++++++++++++++++++++++++------------
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index d88715a0b3a52f87af23d47791bea3baf5be5200..7854ba555d9a55f3d020a37fe00a27ae52e0e5dc 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -15,6 +15,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np, phy_interface_t *interface);
 extern int of_get_mac_address(struct device_node *np, u8 *mac);
 extern int of_get_mac_address_nvmem(struct device_node *np, u8 *mac);
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr);
 int of_get_ethdev_address(struct device_node *np, struct net_device *dev);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
 #else
@@ -34,6 +35,12 @@ static inline int of_get_mac_address_nvmem(struct device_node *np, u8 *mac)
 	return -ENODEV;
 }
 
+static inline int of_get_nvmem_eui48(struct device_node *np,
+				      const char *cell_name, u8 *addr)
+{
+	return -ENODEV;
+}
+
 static inline int of_get_ethdev_address(struct device_node *np, struct net_device *dev)
 {
 	return -ENODEV;
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..79b289de0f16aa5f8724e84d6f2300648c25b6c4 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,6 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +72,53 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", addr);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(addr))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(of_get_mac_address_nvmem);
+
+/**
+ * of_get_nvmem_eui48 - Read a 6-byte EUI-48 address from a named NVMEM cell.
+ * @np:		Device node to look up the NVMEM cell from.
+ * @cell_name:	Name of the NVMEM cell (e.g. "mac-address", "local-bd-address").
+ * @addr:	Output buffer for the 6-byte address.
+ *
+ * Reads the named NVMEM cell and validates that it contains a non-zero 6-byte
+ * address. Returns 0 on success, negative errno on failure.
+ */
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr)
+{
+	struct nvmem_cell *cell;
+	const void *eui48;
+	size_t len;
+
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
-	mac = nvmem_cell_read(cell, &len);
+	eui48 = nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(mac))
-		return PTR_ERR(mac);
+	if (IS_ERR(eui48))
+		return PTR_ERR(eui48);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
-		kfree(mac);
+	if (len != ETH_ALEN || !memchr_inv(eui48, 0, ETH_ALEN)) {
+		kfree(eui48);
 		return -EINVAL;
 	}
 
-	memcpy(addr, mac, ETH_ALEN);
-	kfree(mac);
+	memcpy(addr, eui48, ETH_ALEN);
+	kfree(eui48);
 
 	return 0;
 }
-EXPORT_SYMBOL(of_get_mac_address_nvmem);
+EXPORT_SYMBOL_GPL(of_get_nvmem_eui48);
 
 /**
  * of_get_mac_address()

-- 
2.34.1


