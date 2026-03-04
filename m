Return-Path: <linux-arm-msm+bounces-95303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL4QLeIsqGk/pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:00:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109B1FFF6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11390308B432
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCBA264614;
	Wed,  4 Mar 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbODXYec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hioLQG55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF82241696
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629149; cv=none; b=lbxV/P9zhTyxDQPL5Vg2paYHs8dM9i9VEh/o/SnGrWT0f4eqEbhX0Gd9rG2Fw7SG0uEI62rMPeeB5crpmo3hRFH71AaUJRbpdKuOr/R279Xr6bdSSNYb8Ju9ZZQXEblmQ7EvZx5lNuq8YQ7zduStTjB2OgB3FEW7TcEL4j9NnKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629149; c=relaxed/simple;
	bh=GIb3p99m+Q7msRrWkixcfxO5ArsIUlG6bkPtYuRoVbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUgRVGcQ4C0hAxLR1HuEXhGa/uwYubqgW6fDM2Ir29XVdkSEn55jjFXxnWdTNKzBara/8z58DTSHS/b2PH7iYTa+NCvE59QkoaRvrWth/84IWHMtFLObb6K5m2K24qQYsaJ6VPxEv43QBeiqh7NP1j3pQFOuTL0vBXsEsLKRPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbODXYec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hioLQG55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CsCIA3110382
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=; b=HbODXYecyJYvH0ys
	qW9NfvzIINWZxe/KqNxkMtziySg2gSl4nB95oSr1LKuyUIQYnv0K62GQftJzftGC
	qHpy0ihMZHN7zwr9m0u4oTbpHTcauWCCVDYbRA/h6UO4gHEYIf4AdT12rIkR3P0U
	vcfTA8H9ZFtkGxPzIPGp2Sk6leYXvmZ5nhc+omuPzl+PZtu5sxK6Sr5YJUjbGGCO
	doBTLWiI6ooohh6jZA/90sp83Em1vqOl4fwb8le0bI4djZs+2R1oHWgoD/iraytB
	aWrLwu0SIb4il98daixJD8VtdNwjJy6IMcDMKBlxaSwW5uNH09g0F/8Pq3HzRW0E
	3nRgPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2b6vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899edf01747so295770826d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629146; x=1773233946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=;
        b=hioLQG55xmzLIKjfKVrj4PoRu2ZvmpFrdD0lh1UNnIEwyc6vHE22R9SQHaJVAlDvz5
         ebmTDfdDW6QMg8imZ5jvEIEW+xNPGEnOICjtx7wCruD5IW+NYXwNoMfPmNxC0r4uTyy9
         kgZ99gVdhVQCqXv52dPITg9fK2M06ZhpfVElLwB+Sej0W25M8R2PNfIJa1jhxkxEs1ke
         JB1t/UjYdKpbVHXhso+N4EBfPUx96u3gJwtDOvy8SCtgFLcjqjYn9v/nrKeWE9ZmuB0X
         +ZBK/f2vnmWc+5gyrhKAhMl/1V0SKYPHz+xdJEQApHvHw34KyOIQVmjz39ECuzLpVR0T
         oz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629146; x=1773233946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=;
        b=DGUdqJDyw4JNdFT3uuwl8i4ZiAFIfmUkveCEeEBYqFssO4tI9C0CF+WWMtX1zBtWYY
         flGZ+l5PP1HW2WCaP12EVIBTNDr3/t6W8WzmzI4sMfSwn+5teqNPnAe3AGDki10lmnd/
         IocDcaWwVed9flci+5Q6pjFGw6VwE/cSfY79t0Z2iC8sx32RJgfTK4WCDxkgir3QwGtz
         Uq9pG12nqauQIIBIJ9a0IXIiD+k99CKHoA34CBRVV7JFV8Ihpw/2FYImG/ZEKpKoQf35
         TuKgKQViMpBNTGjq0q72bTUlIdAZZV1lEU0iyPS87CHuuBA7f0ePJCRX+KBOTXgt13pV
         Gcqw==
X-Gm-Message-State: AOJu0Yxd3RncIeUNIea08hZXJ/9JovTfVQmtmOvVbijWQX9nwqlRhkmW
	2J/zR1CctQEqqICukoxDcDvkuh3V0C0jkH3YUZqFnvWcAoVwmDV/M1XL+u0xeHB2IBovVdMQ673
	Lb6Qdw+iy8HxoUZPb4lAAAOF0p782FTN9Y5qhgMeCRUhQ8oh6vBp+n3qSrzEfUAiNgO0y
X-Gm-Gg: ATEYQzyUgFcgRLMLU7hAvq4tdTxe/qvFGV7QyboigubPmmdhnnSEIRmB10djFrb7g3v
	sWTeYUhaQSs5GG5MGNxZhbO1CZYh4xNsSLGSf/vZCB/YRrF1iOdGU9/4YuZbydqtW5OyTWN563I
	vHr4P017KQXMLN3ox10BNnQg+jv51C4qKu5z4dD0LEwhkaSFCXl32/DPkjd5yPi74xLRJAnyOb9
	rBU4NYCQbJrhS+I68OH3M0ZltoTCUYPRdMKECPinEqyTQenGel3vhaYC5cIOXavUpq9gR+xmIAW
	ku2s7PHQ93Y9p4JbTJZs5OVS4+0srlJMM68k5T94jJQYO5DhqW4Zc//s98pofkpthvpwmJ2GXMe
	yl6gG/6H4RnUFoqljFboLS5cW0JMWSVBpQ0UvnDfL8lyX
X-Received: by 2002:a05:620a:4727:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8cd5afc7ee8mr211014085a.75.1772629145633;
        Wed, 04 Mar 2026 04:59:05 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8cd5afc7ee8mr211010385a.75.1772629145157;
        Wed, 04 Mar 2026 04:59:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:44 +0100
Subject: [PATCH v2 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-2-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GIb3p99m+Q7msRrWkixcfxO5ArsIUlG6bkPtYuRoVbA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyLT51f6ZcJSbYLBb+KNBxFIHFxCZeP4wdrX
 OnoE+hrUweJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsiwAKCRDBN2bmhouD
 183yD/46MHY1ly2P+mwcktiEIlnZdh8eGty7X518wUPU+zfVmfccIRQJoiSP3FdR8BzfrjCk2rJ
 3u0fB7vDLXHDI/iW6VXoul50fsbm4Y0mjh1s7ydz7a6XRG6wHh5txmZkgL+gJ0HehCUl9PwenRC
 50i/rIMfmIbyAAkeP7VlHY9uQS1LlOvOMtnQj/au4wP8vQXdfvXCosw+COyyGjQIRi8rjU8VNau
 wZ5Ugq6iNeIWXRHBOr5sF47b/CLrjwJqmbdR8b/Mqcero4ARP7pPGKxfqBSWNp/c1yL7QO72mcx
 Z7emJ/k0CJgpzYltzsCtahNzW1wVm70vC9JmsJEhics3bcwZbWIhZtlkQOnZIlL0mctEeL5dL+C
 EBCDmVhJpbe8c8cfTFXSep9tZqcYF2ixSh1txe9124yJDcd9ZxxKuevF1L0mAK295dlc86+GLo/
 fgtU6637lVQc6vhvb0v5kLnzkVmBlN98HDR0DWL8ExXqxmwKQq/UM1aOnIRrOxUwBjkY4Ho7sZb
 JS+Fay1aS4VdB8ll8q3jbSHtUH+LgEvQ3CfgqaFH5BxLzwFNmj2lhTbuvBXl5aO6rfG8PXHIYiO
 laMvnKhl/MB0/MrodvVieeukyNhIlCgSXNCMtHxreT7OMsqLAusz0JPFq9yeJGQHLJlhxNGmKBs
 vLCcmIT9GtTq4Qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a82c9a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: awhBZ0TREkkh4VZth_hUhmXHNR2yYYuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfXxgBAJuHY2o5y
 7KmQI9OVmL1SrqEWmg4f4rkgiwuOnL5hvLnrXrktttZvSAIJi2miqU71bNSHL8D6mM3VjsR84B9
 2nQsT1knIaQZtAs2KW1dmMNEI2mUquU6hEWU2MQw9hOKue6IIBP52cmhcZqeY03l1QiZjVncuQa
 pMLibwSoW34649OESbtN1veTuFE3LB8ebrDHqag6NrSHh7/otZpmV3MC40IggjaMR+1ur6guzBu
 EAfSHlhWPKbaKMn3+ctO0PJo5g+Kuu9z0QIYOU8y7Ey4+WQAuuvDUDhUWhToylVL1uQjXMKLYh2
 tFGldqrBuhzwwLT4JI13V7iCXzQiNSBNGFqaPp9EZwTXmUMmWZsaoaAj4bj426IaQ5RyzSzghOD
 WmcSsbXEQ1XD5DaZVGmr5WxzEhIPRVJ0nIE8xPgYzqE2gHPoBTxyrbnbHIpjO6Tc/fyTe6BuVMB
 eKK3zYNAmgByEM0e/eg==
X-Proofpoint-GUID: awhBZ0TREkkh4VZth_hUhmXHNR2yYYuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
X-Rspamd-Queue-Id: 6109B1FFF6F
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
	TAGGED_FROM(0.00)[bounces-95303-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf43..3ce8a9ff4555 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8550-dsi-phy-4nm
               - qcom,sm8650-dsi-phy-4nm
               - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,eliza-dsi-phy-4nm
+          - const: qcom,sm8650-dsi-phy-4nm
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm

-- 
2.51.0


