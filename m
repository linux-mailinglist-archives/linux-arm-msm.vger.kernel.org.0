Return-Path: <linux-arm-msm+bounces-86689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFBCDF85D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 12:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD673011ECC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EEC27A12B;
	Sat, 27 Dec 2025 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epRBDnwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL6N/+0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC822749CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766833527; cv=none; b=SiSiacKzSoD8sWLpfPoOLUKS/U5ur5qvy5u22B47fkgytR5xdz0/imJG8qMrTHsUrKXt3uSXIcxOZCWtjy9lUtnU6jb1eT+0LqsUalxol1o2cfzC2q7TxiGxU+AHrVotp1aljae3hW/QIikug2Qkksp/B0W4uIOGrAcxb2rg4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766833527; c=relaxed/simple;
	bh=l/WIpoT5rL3gAyOallcL5sMSQzwxVeXAzYzBpvRRWqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ujl3ywvzScZn5lxCB8osn6RlcjXhuoWhoL6TpuKh1WJy8CH55CsG4B5B2UmjWZ4kuW9yp6nMmwATatyAL1TYYSnK6KMVtvYG+ONyg2eiz9KRIGLauYzcquZAJpgmJ5MrvkxZsv4hyRnS7HkuToq1u1knM2QqS9+u2i+VLJwUB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epRBDnwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL6N/+0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR6Q30L3522258
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BPfv2zycZsU
	jT5oCP1yDoGfm6asCBAPyv8E/KDYudps=; b=epRBDnwfuV8FWaKvtD9/woHaByo
	3noIpu6eQTTTeJlKAKgQhjjYWKxg32xGdFc+Gsy/xw6of5BE+a8uMRNd6/Upgy4y
	LzUw/pcRuXtpqJbisl4diqf+HC+p4iLrdK6KNl9ZHyPcrq3B1zWXzDu/v3O6LLw6
	9Pwh/ajKXVAhNFAHm603xpyOKlDfDsh38QLkkZdB+lDlryexQiuhzB4CZRgn+LXv
	AK3DliOM89myCw/1VanOGlZWD6OaRCLFDmFQJU9VrBcnrIPWG4h1d+Y+3l2gH/L4
	8M+OMXKUmgWw4P7UZ3vXm0eMDeenLxkBgqTw5loEUOtGaCGD6PSvJPv+BAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87brdq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so264642711cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766833518; x=1767438318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
        b=fL6N/+0LFiP+f5FNLvusUIfC3lXQfe6qiynkV5715za+y8DNFxLQbgPfFXYnwUupnw
         Dbli/1pwGCK7nxmA0dDo1ERx2K47iULZSlzERbKulnoF9hQToMKAI7FME6MMBtYFWUuK
         H2xK0M+5V2CbR3GWYB1uAEZXVqff91sQGCBilMQ0Crda6ZY6H3q1TAaAhBs7sB+oy/pU
         ExUrNR5lqrkPUv6Oii7CO8ndcC8J+8xVKVtul7A6+4JrQ/gTR+hq2lPKn8l3MFIwGLVb
         ljrV6KTJgRxALkyY3I8obVyTYEnJxIUZc99HslQT23uyEw8mK/FuVwjSEqvZGKUP5WVJ
         pAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766833518; x=1767438318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
        b=GB/RZi17Si0VocGa7u7YD0NZQhJX75Gzv1V8eFK3jcMjbCzynPgGHdn0Yy731uiZI4
         IlvBrltk/9CEB0+izFMOypX6OaY4vRnksZLYR/m84JyotQNjYSjidehl1K1mUifBd+mW
         emcYM6t4vnRqiezZAQkqZ/NNDk2T4nQlcG96t0cd2limOeL9EckpZKufqfclOqU6iMdu
         E/5TbSOwwbyTgp1a3+S0tCb0NNJNLLBx6Ajmo9jczPtAnLf90sK1+CN/vpB+/25VwafJ
         /nGspL0+IyCD8zSATeFHAJ2/OTZ7qGj8OVamO5VlI8xp53enl5JLW8pI0xSv6WpPbjZT
         K0hA==
X-Forwarded-Encrypted: i=1; AJvYcCUr6SvbBpWzLLul6iXu7pCecvIqwRLbZyHMu9hzmwVwAbrXNGgtHQx9rCBM+sdfQsm7WcRrrH6emyNcGI8o@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3UOkeGjQ91mG3zuP1D5J9mbiMSQRuvRZf7yNOihWUsKoo818
	s0JuC1BBtPy9OK5kVyrbQ/mSuH4piy9+vQs1NHUPHJUkVd2vZcyKTDhMAEfc2/eHRZJeTKu5sNo
	DbikXTKVZnRzAlK3cdREM6gGtOCfMcTSH//1EPZ2bQmXsLe2h047U8VN6Opp9w+cnTcHZ
X-Gm-Gg: AY/fxX668BPeaOMaqLzOc7xCz45DIlOQDLyT/+KqblEV0KVkOYz72Y7yTSabJesALyP
	HurPCVHrAAfiz1hEQpUgXubiNWCvKvDjkmV1Xo/gimGcK4AUEDaW3+jXj7wKzIncfDwPQCWIVJ3
	hjZge73wEneRAkkVz+LrWaJIENzdE8F9OEqGQj0xkR6UG+wvh2uoftAFsExl5bhDpQKKdPHdCro
	C+M/cZYIlbUZFCSh3b/sIXWH6w5RDRpivljKbXNAWqsTQP8330+O3ezQrGBH73BJuZxb3dfj40g
	wbJ24xcfpYUSRDuBWDaMzl21k/GsxCJMSRw+BpzjthyCE89rMjGKSn8AMa5AW7Gfm0XyHF093ty
	N+ZTYARamauhl15a7ENRa5rqg
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id d75a77b69052e-4f4abcd865bmr383464951cf.19.1766833517934;
        Sat, 27 Dec 2025 03:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHvGvRSyzq+3qUQopeLslFpXKkNgnVyM1Jsfx28ck1r6pgHr/0bBLCofpk1Sy1bs+bbzB8hg==
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id d75a77b69052e-4f4abcd865bmr383464601cf.19.1766833517481;
        Sat, 27 Dec 2025 03:05:17 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:05:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: display/msm/gpu: Drop redundant reg-names in one if:then:
Date: Sat, 27 Dec 2025 12:05:06 +0100
Message-ID: <20251227110504.36732-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=l/WIpoT5rL3gAyOallcL5sMSQzwxVeXAzYzBpvRRWqI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71kyaiPiKFe7xEVyVYavtc+2vx3axBv3bjKc
 RVuwZd7ZreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9ZAAKCRDBN2bmhouD
 1yCfD/0RWSo7Ulp2JX5p9iSdlRdKoLypBJ1rR5PDv77wXQppqAVjt4sBgBaKPmmJML0bhqedgRP
 gDOJ1HwJDa5VyZtbIjVqvPNjKKgNIDrXi8CTak2hRiaH9mXaAeDqudNmNYV9+WmcmPjBQ4cO6+S
 7y0CjUM2d2oPf0/X6IfuTdvQNfmpzijIpHivwXvRZKNyTQQTHaaFPWJE4zv8AHSLqZI4H9jWubs
 Z4JhYPSdWaLpjrZID5w0VRVGuZ/sqN81j8MqWmE0DoAstAS6NHpG1oLaV9nF9fEaNNzKqRV7SBe
 5d7RespEW8NRsGaYvS+VNNV1qAPqnkjYSQPtySGi0XHK20Pnda6kgYm2kedru+IREXrZHR1FAyc
 tNbeB8tFXGl/UUtf2zKSwrv1LL9U9muVEkT90IiC0p4N2pIaOojPq1q3H4ngW0ZuBGPG3eNw71n
 qv/R42sYhEDsbpMoFtsb90H8Sv9yzuiVdzBMck16KlGsF8aHAi7m6RiuTldvDAh7p7N+BqzmCIz
 d3UXPg+0yy/cIs5by3rxU2C354NDgnJaRpfimkcitx85ghOhYCMe4cB8RBe26yYq+OgJrhUdHgV
 mQlyuxJIBoah8BI8qLvTcDBr7pyiTzw/hzWrLJcBH3yjTaYcvyEErdZTMwr+HxngP1CDhryiM4+ v9eor4qm4Yqlxig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FkJBeCDn52ce6uHqtg-rA_T6sORU4ndF
X-Proofpoint-GUID: FkJBeCDn52ce6uHqtg-rA_T6sORU4ndF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMiBTYWx0ZWRfXwZvlL0kvLW9k
 rWdwNAjy2Gmtv/BXNnzljQx5xv6kRq8QG52fq+niNfbe9OwyLxJwYtUWCoKmv7bFx7F4vIb1omU
 RNmKEXLV52mOIF9vGto4SaI1/tEBfQABxGvYfYbu4pouedPea/t/sQ3MWeUMyup2JGxy2wOIWrH
 XWR+x19FLAlAIDrOul4320SBYQIRSjsJSMVTNZ58v5uUwHD+GXGqJKlml7lpWvIiWGM5JsZkDrK
 VzZZD5DDv+lQM7BiH+EoGzbs/mLR2PBmpwgazBNI55ILHlIncnlo1GJkwGt/U0lX+Istz6lJixP
 2iIeMHmzei1MCKyZfIaJDg8cHxhZZgWmWeTrXOxTD5YNS3GB5gsg70b1mm3X2l5xORIFxDIfpO4
 4UEMkUcpxA4vBlQ1y7z/9m9UFbZDdESjXdr0rOkf2ndzCyXciMHfZ213Q2B5wMFoDK1Y62JX/B7
 Q/ghjLVCWGbCQAbxbTQ==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=694fbd6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MCV8vPsGP35s7PfGzH4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270102

Top-level reg-names defines already proper order for "reg-names" with
minItems: 1, so no need to repeat it again in one of "if:then:" cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 1ae5faf2c867..2e916309abce 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -402,13 +402,6 @@ allOf:
           clocks: false
           clock-names: false
 
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
-
 examples:
   - |
 
-- 
2.51.0


