Return-Path: <linux-arm-msm+bounces-80467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001DC36CFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A0344E070F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB63333431;
	Wed,  5 Nov 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VixT6fi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W06uXBIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400926CE3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361170; cv=none; b=fdwsk61/IRLIxfX5dnXRIs7vHCTGFl1XLnZFpP6/9rtgFBuciWcir16Pbm4VzVnLf07BAoFtCWeSOAv66LEn+fErA+eB5oWyv+AE3OIKOCpUGNx34dl3sHH4YQ+/o8Ws5qxunxMtBplujOCNztPObG7SaBIbNFnc2uRGK9x4fhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361170; c=relaxed/simple;
	bh=PcDDIBcEIGtNyT7znZSa4/D1SLEv+wO02puHeHxpSrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etKdp5kl6XYJKhpPzsS4fandOshc48lsoJu+ZVLrBTmwshxKCNShqSy2XwKaqumbrkAf6e4fvhtIGX7E7HAhVzGc3WVH5OUCqvUHARH8S5+cAAWXZKul4scJLfg87OLxeXcf+D7E6x+Y3q38Xnj89KiQyPPyOWfqSOYuRUQ8B/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VixT6fi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W06uXBIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5EnwM8994679
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 16:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/39PKwKFPjq6vqHlDBh03E
	gjb7S4PRc4fvYafgd61Yw=; b=VixT6fi8nRXeC0k+VrY2iTrZlvx1i5UG5Xncnm
	od/PfZETODOe6PkYnJUfoMKDg91TU2P60ML6wj6Ff+4vbo/PEAIK/L965gcwYnCO
	hmRgS87aJgRx5IGkAdQCzzqJhT+YXYn9+huiQZfhl+FlaB367K/7LJdF7mKEmy0g
	e7ckavKOSFHX/isu7bxAVQ5nyu9ayGaMDAs07bnHn3JSAceiR7RAqeQnV57PqcsF
	ZEQwqQ2j+pB7NaLjAKKIqDKdx7H+MtKsg1sNnq2WwkVqeh1F+szu1tt23a4LVq9N
	/wQ1FxPkvdNcX59yfOrtWQsteCnChHP6pGIzJ4j727eD946w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pj8cvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 16:46:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso67917a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762361168; x=1762965968; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/39PKwKFPjq6vqHlDBh03Egjb7S4PRc4fvYafgd61Yw=;
        b=W06uXBIF8FDIU6Wfc/gXQSZtScKYADSb2hL5CWDiFBFb/OpUNbV4OFPn9IKsnGxaGW
         lQsPKrYDmoQowOpmpMhMDoNhdOc7F68WYJRg9JJGTQqrijTCbLcw+2VN3IM5d4hSZNP1
         zjCt8qkkDEVe+2DRtfJ333hk64O+R5FApNF4ghN1bc5UHjxq/kNp0ZCyHtjh8LKrZHBx
         Adjmgn5/xskc56SAZqPbtt6ep42aBKeJy+prWB5eE+R74nQ1Q3Te5Zf7u1Swjo8XJxX0
         xnZ/JnqeBulwEX3baQcUCwwo8LaxR+vsnJaktqjgLjPCCqXGx5Rz6uvu8Zx3xO3yx6nH
         Zo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361168; x=1762965968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/39PKwKFPjq6vqHlDBh03Egjb7S4PRc4fvYafgd61Yw=;
        b=Joacyiq52L1NrGXsAnVQ3hhNZbEoJ0tm8I56CkvkATp+AWCnH4Ak5w6psLVhx0GSfv
         mrIdMCoVn6uGhZYVEddxRVgt89CbDtCwFqhrN58WbJyFw3NSvALvm6uVpj7taJ0eGELD
         nqYH13hLjpkzhkiHl/kg4OlOf37KMlkDxsKrbdCBEA5oclvLkIaO/LGQokSU3mclcRQf
         ExWQqkNJ+cTHth5ocvQw80oLzg0YbtHmL4QQHhqH00G7n+BvQvQ1NTsJnTCjCM+kPH6Z
         fwVO5QcDy9TWGpt8tRE4CuNkAYPyia9Xxw0FoASyxDU6FoVWCxZQDuFofwwNIvxpsDtJ
         GEsw==
X-Forwarded-Encrypted: i=1; AJvYcCWiPUNLWB2x4Bjh031VL2MjMqmK+NDvhhx9/qdDT26m+d5AXQGclKFocW37FuynULGQ2Ak1xB6bHzRO3QVl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uWNHqalE4k0SbJJ3sExjyUsiY8ruR4Z3dylBVkJR2bv3qJkN
	4HArHU1zRUFNhtoeC/ZUMfyllug38oCahF2WAZN9mT+hpOHPN5Qfd+9TZCZ7W08uW/uYjS+lVkM
	kQu/47zSvOvsDH/n0KzUSyrGo9qFbksaEYulzjnHvpHKtyNEDDSmyn9z4Ky07ezpeD5JR
X-Gm-Gg: ASbGncuETNYNQpAIo2lZ8Ff4+z62BwmjNrccKE/h36F3EV7ZcwCXJwtb3fDF7UxCEjU
	8L2S9jwAcLp4haS/hgf+wWcWDDg+mmX7EqQchjk7xHvHaCDMU55BUx26/PQSy2psUMUaJBsvqQn
	rwWVVDiAeUPPjMtZeBNFXCSacvFrO1x0rxLKNP2pM/dHU4X+XxxJUlv6b7ZHhqQxQVkK6uaz0iK
	WDvexpPgMvijEMK3hb8r5I0PfnZoBhEuTjTFlukvBzx7OWTVhSY77kgTUxPX9wAvywS7k33HMhH
	m3d4NsTcLxT0NYD6UG33Zr1+yZwUldIa59bYfaZHNj3NsKx7wGyUV5zUBawTsaOicFCWLaSYk6H
	4UZlm8BTN/1UPBxUsNvQmDZQ=
X-Received: by 2002:a17:90b:4a49:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-341a6dd9c48mr5286908a91.17.1762361167402;
        Wed, 05 Nov 2025 08:46:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgcT+6/XLEEYHAFLkWWkahGQ+87zU0D5ZMUZde6qTS8n4Sil+15JEtBQZqISHAL207X+eFuA==
X-Received: by 2002:a17:90b:4a49:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-341a6dd9c48mr5286861a91.17.1762361166876;
        Wed, 05 Nov 2025 08:46:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:46:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v7 0/5] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 05 Nov 2025 22:15:44 +0530
Message-Id: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADh/C2kC/3XRzW7CMAwH8FdBOS8odr458R7TDkmTQqTRlqatm
 BDvvhTEQGp3/Fvxz7F8JTn2KWay21xJH6eUU9uUoD82pDq65hBpCiUTZCiYBU2dUpweupHmsev
 afqAehJaVQaOYIqWt62OdLnfy86vkY8pD2//cJ0wwV5+YWWITUEZR1tHxmgclwv48pio11bZqT
 2TmJvwjgCGuEFgIboLjBrlQVi8J/kZwtkLwQvhQQ7BVVAxhSYgnIZlZ/YUohNUBlfcIQsR9m/P
 2PLrvQpxejnw5ltkVRxZHK6gdc0YrX//jqDcH1lZSxZHBgTSoPQq74twe1+tj2Tan4XFC4l2Od
 H6Uht2miZeBzlMAmCwdt1+HLkdsQQIAAA==
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=4315;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PcDDIBcEIGtNyT7znZSa4/D1SLEv+wO02puHeHxpSrA=;
 b=DuupHbe7N+zgImOfEL0Mmxrj/O9yI0sSVA4F4Hd7ZxpYqyp/SqnhHNYP7OhmBvWfjsvx6O2Ag
 /PY4o4zW5ygBu1PjX/PO8U9J13aJYEbw5dXUwP9djL4KnHY+3hSS4pC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: E0IE1di5rAO7jmdFxCzt2qX9NPD-D86n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX7AUNDfK2eXgs
 1DXuis+e8W48jPFv23oAgPBZ3Ea6Bv6IH7ro5VV/DXltzxwPuULPNoqW2zGzc0Evdd1BiC/gqUT
 XK3RNPQiK+dP6wR8gVr5TR0T+dlPvROGmi/s3nPnwm4vOS9bnwAT3+wQ80BDWvCNGQfsLMXHarO
 hgKOupnh0ZeI1n2ETLOfmIStcoYMGH/QaarDGLd70Uu29qpPQJdybxjANvjGYAmqyu11hWz1iZ2
 AfQiXsd8IzHPFDIFAh6mx0EjklpFKFJYQQ07pa0lOsYXHy63hKjiGdr2Th4pSpNitceum005Rr/
 qHPtgHIWFbUJAiakZprZQa2tD48Ri7NClyF02Tp1Aytr47aTESNcHFwu5SAXojBeDuRKccjlApW
 ZM60xa4iKcqelvgYGcRCPI6NHbRLSg==
X-Proofpoint-ORIG-GUID: E0IE1di5rAO7jmdFxCzt2qX9NPD-D86n
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690b7f50 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=jTv6lf4Jh5MpNzVl0_IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2. This series is rebased on top of
v6.17-rc1.

Due to the SKU detection support in this series, the device tree series
technically has a runtime dependency on the driver change in patch#1.
But I think that is okay since we never had GPU support in this
platform and  the gpu support is enabled here. 

Apologies for the back to back rev bump. I am hoping to get this picked
up for v6.18.

Patch#1 is for Rob Clark, Patch#2 for Srinivas and the rest are for Bjorn to pick up.

[1] https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v7:
- Rebased on next-20251105
- Dropped drm-msm speedbin patch which is already picked up
- Picked up trailers
- Link to v6: https://lore.kernel.org/r/20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com

Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (3):
      dt-bindings: nvmem: qfprom: Add sa8775p compatible
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   8 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   8 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 174 ++++++++++++++++++++-
 4 files changed, 185 insertions(+), 6 deletions(-)
---
base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


