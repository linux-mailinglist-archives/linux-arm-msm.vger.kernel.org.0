Return-Path: <linux-arm-msm+bounces-84999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B865CB50E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C06F4302D5D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F592D5C68;
	Thu, 11 Dec 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyMnuQ7I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCTzXgmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87D2D1907
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440487; cv=none; b=J2gUAUnnbHWoTncdlDYMd2nZcsW2vEQ1hT4chbHJiVS/aG4ysNFpFdbilaM9R+9T95LPhtXgaKaH8EudpCM9yupUmZF5DeJCLrRic3p/KL9GG+OXqj6pCUG/opy6BqI5lip4a7pbNkW1quVw0fcbCmC0OyY4qiovlscgTwe4Kfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440487; c=relaxed/simple;
	bh=EUy5+o9ctuwHtsvHKuRoH4GAI5s52zWgfYjcIQa0QvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nq6d8Mm6JsIekirNIss56wtSjXXsg9KOHfADZQuLx4bAEW9pztipXJMVIDhslTWDR7XNJwlV/BVRESaudaNIg+IdvONUzm1mU+dByUAWlZevfajSoIxrZcjrOB3zWQNCx0OzhkyxLWynOvc7hRvH51p7dBCqy6PilMgnE+iRThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyMnuQ7I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCTzXgmw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALROFX3701203
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=; b=iyMnuQ7IaK7yrFoS
	UbXvhk+dPRc5NfEhgX3mUS1dG3ptXbolnF2p1Z7muDVNLREwLNGzMEy2K7Pu5/Pg
	9GZxz3wc1Xqdryp9RHMpghyFqdYBNfx3L4324//p2kOlpRlV2uNI1vUGYWH8jxSM
	nQUA1q3UqxzzJ4an5X9VdGxJrlAwSkFm96VKED09HDiecgrF+2kS7FIXpWKq6j2e
	Ikjpv+1PO3wM4fT9lR7ID8CGU5pGBGtQS0FXdRSaDXx0XSa/TexzHAsgdCnboEhJ
	TlDwbFyUpezy1aPJ3tZ9REUGybFWUYDbapNF12V4LyTB1c16mNC1bJnvVq5RAx39
	msoqvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1j30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b895b520a2so899954b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440484; x=1766045284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=;
        b=WCTzXgmwngZ0JWkt8M6c75mRn9Dn14zo8xeJvSspUvpDtJnqQVNTQ0QOSGAUJ8hjz8
         Z7FEVwHMoFl3kXW763fayHbfNg5RSBsdjRW//RxNWcx4fHrEexZ/pNNHV/qwBrXevGR0
         qyULwWBuncT237XuuvdPujrM7gLL/74skgJ/8EKKFT3koLxF8ya6RZy/8mim2pXwkl3n
         A5B4XOIErwEf60TVK9qDVq7NxIygPZsyagoCXJvhn5M2DuNQvEVF1XR/z6GDj7d5whPd
         8FA/EOCK9kgN75FFDE/l9b/B37IRZFw4wP4sgKFsPgOjwvUwWKf4UaJABCRWclVZFbCC
         1KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440484; x=1766045284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=;
        b=gXeY2uxa9sIVH98RwLtuZgmfO0/gg6FgVPlOefEf3Vd6naJ+P7XEZoH+qEcDyyZYtz
         sq8yAWPZf0n/7nMVojFTcmNJcKmdhV8O6l0fB35z9nORcKN3GG2IPC5mQTiUKCwVXkFG
         SdfVQR/NHw0SQovX1GnPYQWJODFu2usnrt2i2h6JHj+CXQjBYgb2VV1qpSPc3yg2I5wM
         +3OxocqKVE2k6BNKyE/jdntnOOlO8YCp5sEZEF+DYewSO29DNn6OTqvgdrdzTJY1e0eB
         eNCaK8d0H5QPgWZYaS3Fk3f+trmM+bQS0DV1PNfqYV++I/k9SmTcpAkYseFXHIXgNpI2
         Tqww==
X-Forwarded-Encrypted: i=1; AJvYcCU96xFQl1VNU1oK8cZzqfimqVIZeGdtx42U7Ca7GiSn8wEbMKdjYtN2NvuBxYbcjcdl4v3iXandymlBqfgE@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSBZe8Glg0w4u7mJR4B78A3aJtYrWV5PZ22aIKRUDy0kBfgwu
	l2A2xcSJdok/4d1bQ7R9XULd3DmdzUF0tC3uRzN12rt0R+CN8g/ZJPAvLiWOMO6YPg1m9KMm9yr
	v4yolmMxQB0vMF7gyWp8K1LvtM8DJ1swgvR0zse/Na8tRd3/vuqekpoylMdcI6TCrB8Iq
X-Gm-Gg: AY/fxX7pRDo/5gsG37Nh7lAxbwLtvA1fX9mQjqVKBHiawixwij+iYUuObVUe6dSOmkw
	jhc4HLnrJRriDm9XJEDWP2rVEOwmG+JQPM4PyUOokr5dMdT4TKCWvxg4bAPLXZAh5i+vvF+MY7j
	sO42xyCxL14SLxDfoSvI7U1jZGcW31IHtYaAfe5E2R3dvZIU/26Kn9sujcCINSWtRFgw0SLNKL8
	sOEEc49luUbLKDNej3vFVK+1ESEgC5/FN0j2Jyl3Gl/rBAqPvaM4r1NSJT4GHoTrg7eKSloWXPG
	Xe/U3MPA5+drVo4J18+f6pr0x96aN/pGjXnKWSsG8vFJ0twl0Fx/MI1rhuldPXNsKl+i/lxPYG1
	U2Vx7HrNFxvZR94tzInfzxBKL5bkH0mFCbw==
X-Received: by 2002:a05:6a00:3a0b:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7f22ed5e757mr4987704b3a.50.1765440483916;
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUs0/qZCjwhM7lX53s2z5+FW36UFQs4JEXJJA+T+nSHigm9/IZWx2EY6j4guwOqOJKLlyfcA==
X-Received: by 2002:a05:6a00:3a0b:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7f22ed5e757mr4987671b3a.50.1765440483433;
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:38 +0530
Subject: [PATCH 06/11] bus: mhi: host: pci: Add overflow disable flag for
 QDU100 H/W channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-6-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-GUID: ZZcj-D5OyRs-1QJoQWSc2V5Z5dciivtY
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a7be4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX39ZJ2y+2dXJS
 gBgBDjS5x51mkmmlNPOk7lahkSCBGM4kwmGfpPMQimgM8YDJTCH2aijjm/BO7j6p8kwDNM64jyX
 KNPQXilSElSdPNg4TXq5GVaZYZoFR55QY93g6kKnv82x2OQ5fU3MPhNHEAxN4Ll1Y4LrOpY6y5K
 cug+ZpSmPQp3zMqtVGzStqa5tvuo/5luufjisv2vaaadM3Vilo9U9yJkdxzoNpUS+vjyUgxAiy4
 3XClzoMXnZu2EFP2EBaakl+hbL2j1UtHZbNHgs+jvs8GWNUFN43iSgLEubbFRHNjznHpKniRxOb
 UJ5MPjMmMDfDVxeVW5pCZF3gPXDjz7emv/XC2EdTM3hA+ErwsFt1uwFkGzBYZksMUE3dwy9o6pR
 Y0Jao2mtThOS9qDthXplWm90beCuTA==
X-Proofpoint-ORIG-GUID: ZZcj-D5OyRs-1QJoQWSc2V5Z5dciivtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add overflow disable flag for QDU100 H/W channels.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index bb3c5350a462..814f8fdae378 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -94,6 +94,22 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.ovf_disable = true,			\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
 #define MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(ch_num, ch_name, el_count, ev_ring) \
 	{						\
 		.num = ch_num,				\
@@ -295,9 +311,9 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 static const struct mhi_channel_config mhi_qcom_qdu100_vf_channels[] = {
 	/* HW channels */
 	MHI_CHANNEL_CONFIG_UL(104, "IP_HW1", 2048, 1),
-	MHI_CHANNEL_CONFIG_DL(105, "IP_HW1", 2048, 2),
+	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(105, "IP_HW1", 2048, 2),
 	MHI_CHANNEL_CONFIG_UL(106, "IP_HW2", 2048, 3),
-	MHI_CHANNEL_CONFIG_DL(107, "IP_HW2", 2048, 4),
+	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(107, "IP_HW2", 2048, 4),
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {

-- 
2.34.1


