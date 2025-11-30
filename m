Return-Path: <linux-arm-msm+bounces-83891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B67C94D39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 10:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 757A33424DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 09:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E7F27703A;
	Sun, 30 Nov 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRYrWvjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ri2eMI6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999E27146A
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764495640; cv=none; b=gh0J8XtuQ5qdnbFB680MQF3Y31YXoAc4ZmvEUiVaQVib6wtbdnVNGgBkx/gMDnGXXh73aViHAAd5k7LnxuTBp3LWk+MYLHPVBknlPa5K2lRe5vI3yga1YK3Sq/f5DV9xnIvAY6G2+gitsIVIym/sSeavJ86GG9UUPQTJ4uClkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764495640; c=relaxed/simple;
	bh=3SP29oS4WDD9fql2RqVg08mXVFrMPmzg+PDsaDzu2MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsZaUrsRGP1M5wJunmXy40R1H9/qo/b7mFS9Da7CSOQlwHKQnkEQUA/g5ULhoTca4ZawiBuKLXbnc+jh2qPwaCytiH2fmR4pEJ74h8lict69GZkfrGRMTPenEJsq7pvOegpkk8nf4qYHzwXJ0sswrrkBpg7zEuFMq1msJkvleV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRYrWvjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ri2eMI6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU7Polf1182333
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LnLy7DgaQbYcB14XlWIt8iqM2VKNEwOxt8kaomKApw=; b=VRYrWvjlTURApKWS
	HNlXf2iJ76zSGPrJ4ppwkhfAeEnZGwhFSPGXdFmxobYWO/t8xaFpNnoaRid3RFfV
	Wz78C31VrwyHxeYg6M7/obfqjjBpxV6bGCJz1zNyFPkAIGTETG9ICoQYTpfUE/L3
	qdFeLIm+6KgXIrDbG9inDjbvysdjrRtwD7SiNCm2c73DjjpSZK3mfJcrnsFd/LQw
	Zh8oEpPHvzcSQFzgFUMOVikY0gQ0UWDwTUSTaXuSbIwVIDjYyrIFtsrM+93eXpt8
	MIZIOIMNYGckSgFnlTLLskSr6cmt3NuAFt7CuPczzPbNFatDnXemFsVj28IqaR37
	5zs/6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs78t0bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso60467971cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 01:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764495637; x=1765100437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LnLy7DgaQbYcB14XlWIt8iqM2VKNEwOxt8kaomKApw=;
        b=Ri2eMI6OZt2Ylmk+LT8rCS/PP5O2bGvK17xtRkYpcCIKVzFxtoFm/VdL4lzr4QJEfN
         /irxoIXpKOi7XNmOweqKhA/TUQSOglHtfC9/8F4zAXXu/5Sqdj2YWkjd2fB4CEaVu0co
         muk11kFjCqXt4iacOYKUOa/J3jzlfRUgewwsunlT/fKjG6HZju3EYyvI4hRiF6dWt1Je
         iTjiEbL55nYk28HeUZlhn5ckvgnc6rcVtGSkkp3UMSwULJGeH2E7I26uFxq88w0xiMjA
         CsV74Hpp3GjhS6o833vxSfTJSlT4uOEoqfHvfGGtD+WJll2C6v4ghwssOFqop5OWC1bd
         DXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764495637; x=1765100437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7LnLy7DgaQbYcB14XlWIt8iqM2VKNEwOxt8kaomKApw=;
        b=PIMs4iD8uVphYl01Ie+Ri81XSCjXanKBEoe3Av2egAF6obdwy+VYDnrzIKfLoM3OxZ
         dicqn5w4sqAPGSJZfTQT4KtCD38XiwAw6e+HjlWLVuJ0z8s9TXKAjBp4LXyyMpFSsy83
         Kxsc59AvLRTYa8JeB2+XolUI+iWZXzME11I3+5IhYhjnR3X/FsvoGu/Dw+SyODAF/fhh
         1okKAh/+Zk4MFPG8G76UlFBoOr9GZoE/lJ9+yNvWtgBa2jkd7sYTJzsK8vLxYZVAoaYe
         a4qiAH53LhNM16cfSj71GzuHrPHHrQF/Ml5B8Rs1vxSXlfF8lmYa10RWFqVgeaCA3/gD
         7r+g==
X-Gm-Message-State: AOJu0YwEIMzMPuqXqC7RXDAvYfntKHOYRqKIvHBUMF2mQMFWHv2MQs8I
	xCK3zz6PBdghnN1T2hYdN0Pcr0DPhPGH1QEWcKkit4xUH6nlBu1dGEr1tEnL9v10mqVb2MBdStP
	poLAg9d5hA07CHWKvWdffRttJo0Uj5BtsRBpWCbvnOEyatMjDGYAgBsywTqWyKkWwNDuA
X-Gm-Gg: ASbGncvnvjEwyb/sZ20aYkReVFLBotkrr1eqM1+a0rzt3ALmilO7bz9vUmz0q/+KRgy
	RwFYhtA4Ka55J15tbVrnwEmUWm0uJIHS6iP+ZauWBynRgh7OgHZ1uDN0wwQouPVPTme4hM94wlw
	0qxRytXBxRDN/cU3j+yDNRh+/NWj6mGhdLlUUB0HJnWRcFdJIl2fM/hRoMkROQNePRLmueX3fqj
	O/TL7CbSNA6iyr2pA+Mnt9IWF/hAX20klzhzPUUQi14q1Y08M1+hNlFl2A8LTIboO4doY1c0Rfo
	LIgwygbHAVexLlhPFQmda7Mkne7eRRaxXF5UnsVTrl68j71Sn9tJs0yaNiC8uHYrP4gQf64l/+E
	ZmlSRKGovPNwgZhPNqKi4dyQzvuV7jcXbpg==
X-Received: by 2002:a05:622a:490:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ee5885307bmr454692161cf.26.1764495637110;
        Sun, 30 Nov 2025 01:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxyl6ul8hGLNkm5K4ji7Epc07PbFSUjOMoJrnx4mzvE8PTssTpF3yFzOwFmyhK7jQRbnRzwQ==
X-Received: by 2002:a05:622a:490:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ee5885307bmr454691931cf.26.1764495636742;
        Sun, 30 Nov 2025 01:40:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm906138566b.67.2025.11.30.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 01:40:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 10:40:24 +0100
Subject: [PATCH 2/4] soc: qcom: apr: Use typedef for GPR callback member
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-asoc-apr-const-v1-2-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3SP29oS4WDD9fql2RqVg08mXVFrMPmzg+PDsaDzu2MI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLBENFRpwTHSWqrCXitu7VBoDta9BiZfGEuSf3
 wqMzp5MaDuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSwRDQAKCRDBN2bmhouD
 16s7EACDqbcFfFMBVP/uMq12w2Cmtdt+a+7wJZKGJrR9DNYlxCgKpnRmugIcbyLDeDhq4wCfUKp
 sWfoPh3JFDRyYQfLGXWIalr4sz/dFrHYZbi06EC9M3qfyyKBEahoUxXJ+mODvjtHuQND2ukxj8J
 g52pG1YWj0JvazGah+ZmVUaFIrzK2utNqeajXwpzOwFtM7dpp61YAolDLIOAWXh0YkWzFWjAHhL
 72hQAphAoiEpd/t4MRT1mrLjiUa/Wp7dQKiL08Z7Bj3BWHE4j+J9FJBnpROvirnRqJEJoR+f/AX
 BhzXgbZbFhl/qx9i/bXpu7n82m8/weBqs2bAJ+v4M5wcJyy5tZ6DhVayYTBTEDlazvTUD1G1PWC
 wRNbYRReTGhhuFCoKezyoZ7PKXACFmFBBD6Q06bxb3EXmmOefJuYijMRF9tbfFrNoxesgs+wKXI
 JQO28v6cCoaKYoHVeE1z+0hG6Vgyw9y4s3AkcJLFkq4EzN4uSox3jZYe/Qh/rtIf1lZJoXeGV7L
 Bad1U/QFpiLxlF6yrdnwZvFxHdeCCmKy9/MbHwbQPWOCVVft9A6SfNLm45FBTHy0Wig4EUOQ3Ex
 B7sZpMPM/C0myUoGhce8P43p5R6m1RGBTWjwFUh4GEqP13mIDh8aAIIYLoj+jEZzbvUZVys2GDY
 UHw+QlpEGFtkilA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: G4HyIAfr0IyIaagKttpYz60fo_mrR4BL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA4MSBTYWx0ZWRfX4woCfSS0ukSz
 NpwFrI9T0Z23a1Mw87awmPCFaCW1UywBO6gqL3tISn7ClLk0vg9BavCYpYmeeq3Wp3fX36FB+qn
 Ly80fNfjrOXIVx+Neq9oM9XwYQdI5cRaMyFeIeOim9Nwk3Wpe7mhw0bM6KgA2iw0NtkeoFuff1Q
 YvRpRnfzUgAIGQKkm6G3yAP3WaAczWBbP3BG8kmfYBd64cXlVvYcpgCwLoqbIA9wHxqi0DHCk8Q
 XcCo9LXcg+6RW5ZXXJ3PDgDzpAefy05Qzr0TCgPmcvrrnIKrIpqcvD7fa0QJZ2N2yQ3eg8GbXu7
 D65CKR8y9JxzyybobJfOlpuroKbFllJyuUl4mxki+DQqmp4yE65H8dE8JxvAdxPYxh7/16DuT//
 3qqxzSGtXtSIohqFeCtsMbqbS5I7Xg==
X-Authority-Analysis: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=692c1115 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MtUmYHKpnGPUIE9OMiMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: G4HyIAfr0IyIaagKttpYz60fo_mrR4BL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300081

There is already a typedef for GPR callback used in 'struct
pkt_router_svc', so use it also in 'struct apr_driver', because it is
the same type - one is assigned to another in apr_device_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/linux/soc/qcom/apr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 35f44cd868cb..b16530f319ad 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -156,7 +156,7 @@ struct apr_driver {
 	void	(*remove)(struct apr_device *sl);
 	int	(*callback)(struct apr_device *a,
 			    const struct apr_resp_pkt *d);
-	int	(*gpr_callback)(struct gpr_resp_pkt *d, void *data, int op);
+	gpr_port_cb gpr_callback;
 	struct device_driver		driver;
 	const struct apr_device_id	*id_table;
 };

-- 
2.48.1


