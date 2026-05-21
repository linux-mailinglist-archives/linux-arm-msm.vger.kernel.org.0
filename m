Return-Path: <linux-arm-msm+bounces-109092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dj9G0sLD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:40:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A335A6140
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B971032E8352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C383E314D;
	Thu, 21 May 2026 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHZOZukV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RP3B57GY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0363E2771
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369496; cv=none; b=tBQdzFTqOv98RL6jGgGz97tfm6swr5RpMq49GH5ZJipZfDk0NW1ZDhbjU7CaaLwtRKvWgdAiYoRmshsEb4Nt+glBLj44igRBiIRe6FKRtvaDh+H61pARuj1oY+IdnrU3o/DSj9Y90+OYFHlDCdOTVWBhrGdqksipk3uOBusEK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369496; c=relaxed/simple;
	bh=cmb+NBPdV34mI8XyHRuMaeHAtTIUx30FJhXF5CpewcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LG5Ox/ViUa4Yeu28yo4KwX7WUaN5hla79aOHD1HDZdNsjLkHWsm8+QUeyRO+Z0vv1KErTQ3b4uaDGxIyt7MSLs77CgtI7IASyOKs/QKQVeYE5bej2yfjVsFu3MNEkTbFOeSpaqopW1APZZpNNcB8lZLLum7FI2stKOMyW2hGQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHZOZukV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RP3B57GY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99mhu517699
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=; b=RHZOZukVNQtCk+vp
	9x2qqBQ6uAoDc7kMTczNp4Rzyg5ZVAQ6jgGdY87zhdVYmQFCR6zv2ngcLd2UPWYg
	bDiAQr7KT1Ys/eNCylwCIfUwvOeD0FGVkHUZggH3Q8GLOFH8mv31coOwQi3kuOE8
	w0SHUtwPmnaci/VTcnuFN94k+V25nRhWSk1FkYyX+9BVBRFUFncpDROWqcmcci5Q
	OOlLxfktyr6mfiGTdN5P5qhAS6wBu+GPStEwM6xtLjelFnQHc0hALv4lcsIzumns
	rarjbsAPf88bVDkIbHPNEvWHff8Hhbbhr38dPDUbviBPnQunXXC4B2X5xwS6ORpW
	ABwBsg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa2cr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83544d05c5aso3014227b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369494; x=1779974294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=;
        b=RP3B57GYG6QGOGejyFjTXhPQ89H6+7uGdGHDj2j/FbKjADRAiFgV6uVd9UI+kgPNRb
         QGHcUZMsA8XEFRuCbjPU8M8nrSxEEbB+WLI4JvVa+bXJo+Rz2rI2tu8ApePWROAoQMsP
         CIiXR736ahVuK0cFMg+b2aHJt9h0yBO9QaUCBhNfPSvT4LpJHACr4CqyG+sLT6fse/ac
         G3dHzl4QvMPOuKVahbkTA/I6AByspejL1GAKr8h5/tfrpg6YLhJpaqnhDQLmf+UUws/7
         Hj2Myp3QDi0MZCX12xQap6eUUwvoWwHI+aJ+RY4cagDXzLSFvsoE/iVNDLqbhIFtL3OR
         d5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369494; x=1779974294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=;
        b=OUgaMiYcTyOAPsRmqxi0jKNTPRz4eS53kR5UTgyjAqVpGp74hl9Mb2GZ3eM+m1tgbT
         e2H5DH99QYNRDsN+4Leta+eG7/VcWvswVunqah7weN0KSkthXN/rCj/CCwD6SWL16Tti
         S15vIo0wvEE5QrH/kUKt44AmV9dKnv7fbYzmNx7CZb8TanU7D77lfYIJ8i636JBSWfN8
         TjlJVXIKcisySBnMav2ZJskZj8RELOaxfU/d/YHbuiT2k94DJBcj23wn/PiiDqVaHrE5
         9Cxladf47WoF0v9HAkf2xcWavdnm/gHlcponuFOoxxSOUBkwO/VcmU0+k7Rawm3Y8SlO
         19EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7YkD5ojWRWqWAD48wZdt5Hk6K7U7z+rIjzcywLpmCjodj5MLXE8uvJRxKCnLPEiqzy/7ljj1COF5KABU1@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWWuvX3LrItu0rm80xP4mlmstVyo7lQncL9nToBXBi/3QKsux
	0sv+ogRksWtoJXGsZcPN4+34KcVDQEq3WQ+pnSUVvubnwwfKwS2QEaSiJi214vGIIORwjiFNQKC
	x37sEqgV7/Tb72D1pWHORxFEvcikYNNA9tUAJkSSHY1YhRW2f9bPLAckgSlWWzgVfi2kM
X-Gm-Gg: Acq92OFzdhvQOzm56CzlJ7a1hYaP5Fd5LjakoNtidqmAHuTh2KivI5rJAnJLJvfe03n
	ocE4wEHD2u/+r/XX70ivLVX3Uj8v3gmbIjuAbax4xi/93GUiJ3AyKRMIF+nMgyPoVJAxBxOnnwx
	55SISp5Ai+vMENlH/snfn81+QxWeLKOW60wW9x5bB850xSaXqRRMqnkG1FzQyesn58cxbwu/lWA
	M3p4SJ+AkKc1vunQrip1pH1XT3ZL4albH2hncai1SAWWrhDrIfar1bAhDieyvO4eR8ZDfq4KuTR
	P6P9hQoiinblFntwr/gTnwRfgQN3wDHgrcimrF5hkYkKHUgH3NtF0mUwyavdRekOVlvxo0ReTkQ
	C8flWxu40XxyVYfSLahDjze6FDy2HXVR1eID651tamnifI9RnzhSNViY=
X-Received: by 2002:a05:6a00:391b:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8414ae15668mr2866653b3a.39.1779369493863;
        Thu, 21 May 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:391b:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8414ae15668mr2866449b3a.39.1779369491072;
        Thu, 21 May 2026 06:18:11 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:10 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:08 +0530
Subject: [PATCH 1/5] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-1-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfX6GWwqTNT5VRg
 DRnqarF8WwNx/ZPBT/m7D+M5U6uB/cJxNIm86JPgxIZT/1j5yEdAx9oITltZh9bYjyOmem9r8ml
 Ohglz6EpZD2nMDnWqof+MmFuhPCOUI4Dosz1y+I/wi9iE3+94KarD6SDvuXIzDNwaeGW1zhdSIB
 huDP/2lhlO1YR2PEUsYsmzd9lOiaDpqQSVW0ZEEuFIJhNkdkWXv5/dbxLaIGfAvSxymM1ULK9D7
 Ym1Xfx/oSHXaa2AKoWGcp+A0aluQAFylhdnKfhfz0EH0In/X50lsRodbzZ7uKMTLrrlr6wJ85Ef
 Rod3ODbXpw2bRWoOJzBwFHMNWo++a3+8G3rg9aDATGYAVbN1JK7v2XjjGX1WyB9ulKL/1Lr2n4s
 RCQbXtA1qbeAcQKVifxojEvPwyzQObTGJNEwI2ZDaBTFl4gMvTlA/dtKsBWg0rKlGIJ7ENRePGg
 ZPXs1ilP330Vp5hfKHg==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0f0616 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qMhC6LGQ_1aKn5J9HqIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: n7tNL-YvTPUQ5c0tFoNVjd9Zsq_xc0BF
X-Proofpoint-GUID: n7tNL-YvTPUQ5c0tFoNVjd9Zsq_xc0BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109092-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0A335A6140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c0b083da78bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1


