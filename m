Return-Path: <linux-arm-msm+bounces-82024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C453C6259C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1358E361132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C68831770B;
	Mon, 17 Nov 2025 04:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgg01wdP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEUe1ls1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E48318142
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355110; cv=none; b=coi9e2YWw5ysMbndS4IIdroSUJyhhzTNkibW3bAXdQyVVZdXKfgELroRAtmMBHjo0hK9kstgeqnUl1qR3raFum3Vdp6Z2unDUonBz3zxDquifxFbADx+kTFMgP/sh/GbSQsDdiq2SSYA09kAI1eYGi7doQLIAlRA6MUdEBDYktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355110; c=relaxed/simple;
	bh=GgbL3N3iqXWzcurISdl1Kpq0m0w31AO5Ex+Zqz2cLZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCYnS470kEq3I98RdALh+5rZboqSYalzetj7Frvmru5k1rB3YHDfUaTIQ6AIwMSU9R86bzryWh44T0QoD79JmfCoB4vn58nQ7h3GXgCCNKDA0NxRE+q6+UfSCm7qaQN5geY/jT4iW4vA8k+/9R10CriWCcrf2pQfBBDoS8ZAH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgg01wdP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEUe1ls1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oBc72583927
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmLzUoaqY9lRDrlljybz1XFrFITgB3QYCRC3Lt2yv2E=; b=jgg01wdPcAK2/Fad
	pdYoudTCBuq+RTUXVarkZZCWMLH3Niz1uHpBtDDnW8oc0a4Y9b5pYUMJXAYqX4wb
	cm1pyFkazjZAR7ifQB88V0gOflo3xcGwMSChgrBs5gIPVmqRBfku3TAKt+VMZT+9
	mL3gkJXVKqmTs2WKLItb1fV/VxP31Zm/6K+epSYUM2cBfaLx+1VgIymnKlbK+XX4
	Gp65XXJjTWHJg0FNzeJbHjteemGCm/UNIrgp/H74ED62KTmd84JbnZ0LR7ULu11P
	bLpoQQ8Vaqtq6Wkglow+CIHl1Wcslh2ajIs4ZkC4wLTJHDsQ/WWQ6uer16TFjr05
	728nuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssf8dub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956cdcdc17so44639535ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355107; x=1763959907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmLzUoaqY9lRDrlljybz1XFrFITgB3QYCRC3Lt2yv2E=;
        b=GEUe1ls1a7X90moS2lFl4IdSojHo9iOV/vxPaIPo98RfAAfg7upO4HUlDiQrHzXMRS
         i3GQL3wUtuYxhO+l7NZk5B9hfq6lI/0+KiAOwAl58ZoNiVtHnm5ZacozoWAVAC1yVZ9a
         CMDav65USiqg/8s1b/vQLKeYgYH/cEckkjtTXHY9kgG3zmUqTtuQjl4p4tGIx7rKHHVv
         N5SAqRySwppuAFQY9Xxxg6sGGsQudhv/koF52tT9SzlFSWg4Doko9+4jOePJ3QfgS7jC
         aqxrKTq+4dH/a7YmkSPxDTX8TckxiCq5+IhWmjUUut76hE2bY3bakUJNzLYZl3VTBvxm
         1wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355107; x=1763959907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmLzUoaqY9lRDrlljybz1XFrFITgB3QYCRC3Lt2yv2E=;
        b=RDJNQmtUWxPAkCj4IqPFEE4LRvLlWaIbF7YTtBOG+2lsuw5nGEvNLFHjJRnivtDxY9
         wI2vLU2mxrX1bsL44y+6RHVAX6pltoe3UHsTUgOPUN3ZQdkNy/tS+SQNInPPwR5vv7PV
         ybk1mD29hsS7Urv01yfYHRw+fccYGNr2AqpFCXoYk4FPCjwcLM2K7cxFQB48SauIcay0
         JwJhvpiWmaZgKIEIPVGleHNbyczNMX7gnWafHEjAXSxZrZxE5y6PhPLs/x8CYiQsqO6C
         n1Z3/h7UGHaXK+vestDFixXiYU3p2d5oC0jpvFvIzGFvyWoDv50XWp8yC+wQu3sqmfSn
         9j1A==
X-Gm-Message-State: AOJu0YzSwkU0x0Jyar7c98O3ZEKFaGWfX0tP2/BcawVLemh2YjZTSSHD
	WuzT3kijAsbYU+/a7qZlLoVqp1EDZX8iW0ouyat4M3AF5exXWkAfNVOLesZpSrC+q5S+hb9iS5T
	UWA/5Pyz15I/BT4cgS+35+K57r8SRRfRcD/t+1EhicfOIVtPWIjHbqxQJgcQmfPIDnmW4
X-Gm-Gg: ASbGncsUV8NdyW/k1keHDxDA6BGo3YFIWXcpQjUtIIQARBVz15bmMnu2qKX+Kqo3Uqj
	dsScGokud895Er7NxcPZgGxBJORAGE80Z4+C85bnX7BBg+ja+ELP2tBh2O1uH38U4uOre+dqqMB
	kKcqivVlXPrtoGHU883f+bns6xjCyAfUqJ7ihPwGAFlPZQPNzaTdYSepOClh2UHaObQ64ufh9ig
	j2oBjg0S3d5erEb76ZAP+DPPzg+mAmPdvIx2YbTQNIx7Oc7KOv+UEFe6b+o7SZexuzGv+DmuQMf
	Eu27GYLydyQ0E9Q31I7qK58YRXm73mjx+r/G1Exl88zSkuVBMb23Gkro1x/9yTIRXgtlAh5oF6J
	GkjMIr82hPDadbTQIYqpPjgFMx+T5BhXE0suzz1DCruMp0UClc7EswgXziM3hMumIYOno0uRXpg
	2KFrpd9wl8OPF0D8wzWbyK+4NrAN2McR8nwCL7uNp7NuKB
X-Received: by 2002:a17:903:2f88:b0:298:60d5:d272 with SMTP id d9443c01a7336-2986a6d0e55mr108573525ad.17.1763355106673;
        Sun, 16 Nov 2025 20:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj8Z2L474BN9+1eJuuNl+xgQyvkAFoffSutCUa24jDCLXKgWZ8QVd+nGE3qFg5k0//U9s9qQ==
X-Received: by 2002:a17:903:2f88:b0:298:60d5:d272 with SMTP id d9443c01a7336-2986a6d0e55mr108573335ad.17.1763355106107;
        Sun, 16 Nov 2025 20:51:46 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:45 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:29 +0530
Subject: [PATCH 10/10] soc: qcom: ubwc: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-10-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1142;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=GgbL3N3iqXWzcurISdl1Kpq0m0w31AO5Ex+Zqz2cLZc=;
 b=MyDqNkIv5qOlCz0mAoaifAufhM5DhIxa/2JElhzyEggPcDYCQR3fELst4FXcdy2AKYIyWyuzQ
 wM0LAFI7g/RABQExjJhn+eCgz7pA42Svyn5i4fa7vHaisZPfce0a+TD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: Hpoe-Ncm9NoawQQDpAgRqaElQiYfSCju
X-Proofpoint-GUID: Hpoe-Ncm9NoawQQDpAgRqaElQiYfSCju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX7s7oBlZKbOzD
 ThtMDMl0SyNv1s6Y19ScD5y1/MtkLJr1zfaR7oNucHbTAER1nEogUFBswLzgO8n+yxXcCn0aUiH
 VlvgC3iAgPJ0OqPS697LGLopn89pBoF/r+MJz6PT8QjFlsbFcVOvcLFuQkb9mFtPBXFIHS8YPQ2
 nTNNudvl13nPFjBxspDw+9x7nK2DSF3zlzGMvOztsuK3L1AZqNqozZflcVMdG7rJOrp2e0k9cS9
 Bz4yzCp//sDXz5NF2g8gsn6oMbgKb/4zc1p8CohKnphzaR3DuPF2640V/5DUyHaR/PMBLTa9wLC
 kFMP+bL+rOB2DXIlQZPq7nPs6R2IecrPxI02pqCj52ZqIK0rXJk/SlnLC8uYwbPnRDXYnkEfyp9
 9aupbOBtt+i6Qo678GeyfOxiQf066g==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691aa9e3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_smvvQv66ppQ9i0oH1EA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c09796163b09a19e387c18886966514cc19b209..1e7717aba5236050d8e736fb0891534b02203aae 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -301,15 +301,14 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
+	struct device_node *root __free(device_node) = NULL;
 	const struct of_device_id *match;
-	struct device_node *root;
 
 	root = of_find_node_by_path("/");
 	if (!root)
 		return ERR_PTR(-ENODEV);
 
 	match = of_match_node(qcom_ubwc_configs, root);
-	of_node_put(root);
 	if (!match) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);

-- 
2.34.1


