Return-Path: <linux-arm-msm+bounces-107002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIKPKgw4AmrmpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF095158EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFB2A30A3E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 20:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1376937F756;
	Mon, 11 May 2026 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0sNjVXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf9ScqxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55CC37EFFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530068; cv=none; b=N245oPpcBYjNoWF4qbjhj5taib+dcNa5G+VbKwasgGjSyOjK5U8BRWTVprmmpVRr3XBaeYIjg9RsfekIxoya10hrTyIfq6JHIq9Gb1Lm2nWw9PT3FOoUQrxoNdncaWFaCuWrg2Lq7wFFltmxHPDDwYd68DZDai9WMSJih7xsdeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530068; c=relaxed/simple;
	bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXI3CeT0xe54hQwHPiwxAgBG20AjX955YdXvD+DnVlSivqZTi3AlkPyuahRKGfvONOMeu3s+oYUdl8TRLTa9x6ZdgFjCoK33rktuB8gOGF7ve/U1LMy28BH5WC2y8YOt98xaOoiju7C7ntIMnpyDAfcDVToiochYXV2dlzmATns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0sNjVXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf9ScqxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6hUi2803759
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=; b=d0sNjVXZ00zjAlIZ
	CTI3mnYjq7UvHuLR10YTbJX6asgq7wSFuh6rLkXDFd0BDc6Uay/w9VONomeNe1ju
	Xl5yO/BDTaxKhX+1Fo7yMCz2YQ6WS0MQGBG4nng9HUgyXNUBtYSq+MAlMt0HHXwB
	GF+jPPIGEpgGRV/tAWUzs0+4XhinRkB+USOQ3o8zfEi39QhstLjUfkVGbvQu9CPo
	jQ43yWSwcTxxvTyCfCU+OJ2mbY3Yupn1aTYQT6bXJFKb7MkpmFJm/9GszbX5+cP/
	uOj3DsOcMANKEq/eHvAJsCtWRNiBq1GfvHVt008tluahGNewFxp+7JUCu4xZQK+l
	fHJcfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv3805u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so6072132a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530065; x=1779134865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=gf9ScqxHYn6bn7/UKeO1DmDbg96AYQv+xVUKVczU0qlT0wyIXzzeJh4rtFr9wnDbhU
         mboMdRAqS56n1JWCI+l+4hPbbKP16P2NXLRxjbrnENx05A8SQCarbwsxTHdDn1wCU9yW
         J23Ns9ghMm8/qhKuz4yDvHr2dM10d0LHjDAZVcY11zhtthQOJ1JczKeAkXfncNmhIniH
         ckVVPK64s3AC67iQKEOYRwUqi2hXbEcgWZryIDS3w4eu4ri309SIauH84AD1KilvokDt
         1geq+q0smSguhBU7pL3x9YyW4tcGZNsbGLTdnE1VWRXktYthi6LnFVsSlAS9QS5/J3iU
         M0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530065; x=1779134865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=nAsQvorQdCdJy/mNFOPhSotGLKHjXD45iegIH7jRwpDmbuRR+zg7HAP5y6b722YO98
         rq4EcO+co4zSpIZv3gMvtJHylykFp2v91wQBjl4Z9BvvUI4JP3Kp+CeeMhMfY9D/zMg0
         tmlE9OmvkqLJDau2/+ankACj9BmfSZ9oRk4aOrcd7zk7Lb1uuZ1sL/GV0I6C0LiMG+nL
         4i9IPa0hRUr4u/ZfL74FVOatg08EEHosgZ2dP3JPB7ySBivo3hMxcJeUibfZ7Sy2p5NC
         to+DKaxoRK1FEZySpaZ3ORJaW3+T9y2tIRIQnul6kSTZbotgOcv4ctg+hLaJ+nZXibVt
         XHTw==
X-Gm-Message-State: AOJu0Yw/dwP0IaLFLAAoxuKQMh3/YSr8U3DjGBY9TPhFfB3VrvzAC5cu
	jnnOabVhInMEvnRdjGLXVz5k9/62MFTiiGugCjzXqTAERm9NKyn+tcUjzDJq7AggzlL6thYJpoC
	8fnDTRYZAsArEZb8mSsHQC76xCBby1Cj/SRAvubksjdQnofPagtWfswa8RV4M8wP2TdNx
X-Gm-Gg: Acq92OEQiMdzsRuzRkajWfKcadDmtpmZ/CKA5H4q3qAB5H8pFhXik/a6RKqClY+4pn0
	NPZgNs0KSdwrLCc8kdgPd0TWAPbXFoE+ueapXLlt2/mRbj3V4HGkddR7UVystOCRcW239euwCxv
	aQZ4KhDpmkvwzt/OWDkzjt6BpTNuK8V9l7+qBbZp6BNrodQv9Ifa8zTOQk1+6ALq0SSpBBxk2CP
	/lIw1eUi2AdX6MynN+hFIkzWSHpGAGxobI9fTsz6yCIUa2lKUv7LNzXbcC9SxK7AGMasmO43Jvn
	ShTLPlvrLRi/AV1xmOmgtJROBwnWEZ0Mn1iPkFlsEQle/tTFYB1cg5sXcH31io9f7nJaLX/KLmc
	73amyn9KJtc64brXWeAytl+tR9/FJbWvvYAeFJ6+meVdHBA==
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr16833861a91.8.1778530064924;
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr16833821a91.8.1778530064377;
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:37:01 +0530
Subject: [PATCH v3 3/5] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-3-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=1014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
 b=jpDwm4lo12mTRBBvFYCZVHEtYZLK8NDrYV9uMGhiHEVL+Az57pN8vnvippGmyAb6k9Dwuf16N
 YUJoaxT0HNWD50FrKsL783ODVVGT63eaKXS5O2cosQz1DA71HvFyD4z
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX/87xjXkYmkKe
 VBhKZqMh42SRGyFFAZNkCS0bq0qf5yhYHkTDUC4TAXOjq5MfD51wAOktzJ6OcKDZq2wT2lLSlEr
 fVcgpp2P1/UhwH72vdc6dzY2m8wheCJwHhBYqi0i9FBzaDkBaXzA3XI5PffU0xA+T/V9KbVl0LB
 ci70KsBNRfSQgR2fc7VqONaF6gauBB9Vkf8FQA5wOsbaQ1EA49Si8P7iWtzsWkw/70t7TjL7rIy
 VFWGm5i82qEwxdzOTudXtw4PigT5KithBt5+vLXDBfeoKSyUr5zD2aUn62GBhczwIbrHZg2ZPjn
 mJEJtlq+fg8sP9C7/CMzaWEVSETrD+gCC5AEAFy0G3sao4O+RYT4b8IAf5uwnEejSupU02PD4nL
 x7D919867Vlw2JaIbICHd11SiKRsAA==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a023711 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: aWr-_55X9YNkNEVVCfOADCEHuYKWPZ7p
X-Proofpoint-GUID: aWr-_55X9YNkNEVVCfOADCEHuYKWPZ7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605110213
X-Rspamd-Queue-Id: 2CF095158EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107002-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..b811ece722c9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0


