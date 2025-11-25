Return-Path: <linux-arm-msm+bounces-83168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694CC838BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 48FC14E7F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1A52D46D0;
	Tue, 25 Nov 2025 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1D1Gbnx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jN6DKewX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D92C11E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053329; cv=none; b=mO9LLK6NXKP5ZKVVHX7cp2jxpNFXw97OUTy3Nzp4ZGdJro8AsckrIMCtLrnZyrpt8Gs4N2RPEvzuy3lzgmNT8q0P/qDjTRDMbO07fakEFiC6BzP5jERx6uTiaSjvNIIDA7GMQLDKBB4EPYx1UZHDpeb9HloV+ZWIwTfd7WcZ7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053329; c=relaxed/simple;
	bh=vTeQ5AHKkwW/UkEd9H1rXrSNU2GbMHUYNZLpJPgp8X0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPSeJINEI8xJ2+bY8yP36ZyqWWU16GElmKtuNVTvZT+Bk25pClxEWB0xB8FvNowwRNMurduvETjHyF1n2p1lXJ9XEloX8ei5RFGUgyTgqdBn1B1TF3ISx+mjy1X+Q47TI05y1YF0utK7G0b6bNi+d+Bb80TOOAGyW/JXGo6jgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1D1Gbnx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jN6DKewX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geAF2148594
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sav2JkTpiNB
	huDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=; b=A1D1GbnxrdrPX9Y0bwmMKLo4dFs
	fFcNRG5yVSj3H47kfpiA86myucLWrR3KLKMz4tT+i21R+R3Z2NK+d/LgBTI30MIS
	VkE5tCBOxj50Vg2sbjAtmLWbFGCUbNff3EO4aN8xBgCh3Svq7vaGTB4R4AG/UTHk
	qIypC24v/Z9Fkgf0t5R4YL7feMMwv5YK9PDbMfHn2VIgxHzT8kXp9oEdAOWRqhMO
	fHVsz53H90rNSAxaee4HG0jhtwtH7DYSWEC1FZqQxbCLH2RQ08Y6jDH2oEpiC5pO
	fhqCZpLJm1dcxZeKUWrV3fo0Qv2HOZACnIwbqLLWJRsUmV/6GgknLvhUVZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sanhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8846cb0b8afso207231286d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053326; x=1764658126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
        b=jN6DKewX/4CsJxlANzmF8EjebSWa+3eEyYQEJELzIvQODcUDfGKC3icscSKj1ru4uh
         7R7x9Q1S4/6kUjPGTTITAaUWC39XXMOuFkXHChpnaOMFxVbE9wSAoBKyN8Ytcp1r0bV6
         ije4D0CBqizS18NdKwaIu/V9WV3+tvEyiX/zdS7I+rMI5mkFA1cWNsGxnifu98A9Spae
         D2iF+8cGRdcidmTsC77c/09bTQdygeTwTd15GUcL1U8qFGd2Xoy/HJ4Xp/zFalgFfdg/
         3JAu/R+eJd2hMkFcuugUle3Lo5SHbKgDMGL9s8SEUXzGpVpCHJc9SoKcGTF9k7Mp1XTh
         LYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053326; x=1764658126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
        b=WqEc0FdEvLhZm2iS/sOQv15QPJUHw9qEtQkLFao1Q/xvBHrsH7lBGYuIY3u7NoDIdy
         2m9YNQIb121TjgUrRmlxtXjJGJmyddBRakgbzYLhpzFskDB9DkRfdND2HRqMa9Z5EfDi
         pes8svmd2xdxwWC9ScFodTb5Tltp/ys0JUf7dQqdAUVWZ3a8E1iI3vXJMIrABwLByiFT
         aPtl0lzUdAZLUr+4pbJnx6M75qvFoDxKO3qgJpI1oBuffXMMf/U9GZE6APzYx1nVIvQE
         o1Ve+az3OUtrYEIvEpUHwPj87JqIX6XG6jpFTtVuUotZxlsonJJWLFo24ZmYQ1kFyB0A
         VAAQ==
X-Gm-Message-State: AOJu0YzUjkXuyPuOSViMI00axrR4rPwNup3/ASWqUVgFKxELY7Oy5L6x
	hwMdfW//MHrMF7HLU6Umh4e0fPtM1yJ3B75g5DulviXGATP2MC++wiwMjgL/pD/FZRZU8VvPn2W
	ssu0/din3srKElGkSNAG+jf9x+qd4lC1jvpAqe+ZUjFb+XVamXrYs2asgTh1l4RoPYjnQ
X-Gm-Gg: ASbGncsgpBnxWqR8fTT9XZHFmqZ/3icELTjEF3hfYurClajn1MZ/r52uu61gcfBmyAm
	uDv8E6g3txThne4JJeC37prfcs9qMD6pNJQz+QEp1Y+8f+Xi4Rq96xZq4CGjBYdXc6096JKxO7k
	2gia4nI8QfnkTxjWD/K7Mn0UQokYr2ewXIGLkE8NmPAWGvVJovZxl/9cKni6iiaKPHdo+mHlKzz
	phP2Qi3qYBTOUoGWscHmntNVN7wbNgFubDA73qDOlHKu7rohn7XIuXDNtoDoTb4jqVkThCwIyQz
	tTwmROpP5H6511Ud0HDfTrnYdCJeRTCGs0QxCzKtYlJXozAe5co4iLc/qa/ikxR39TY65oyHeWx
	RjllCjSwhbKS8Lg2MYQSt+01y2osPQdA3vHssDQ0Hhi2FDrZEtBdbc8BiV8QoJnwR/+SnVoE=
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id d75a77b69052e-4ee58b0644bmr207487241cf.79.1764053326283;
        Mon, 24 Nov 2025 22:48:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH71783JNIvrMRVHdGNlmiZuEs7Iy0PRRr9PWxHrAh8mFu1oAwTLpeENpq76fFhnnNwxFIx6g==
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id d75a77b69052e-4ee58b0644bmr207486891cf.79.1764053325783;
        Mon, 24 Nov 2025 22:48:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:48:45 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 02/10] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
Date: Tue, 25 Nov 2025 14:47:50 +0800
Message-Id: <20251125064758.7207-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P2wY3KoLRT_dcCoSbhgt9IR91JoqEbkY
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=6925514e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX7Ye35sB8XoIW
 YBIJzghdvm50WrLX5d7oSMkr4/LvZK4serulIXSjMLPPk5bKPztSnyuZRRAD30WhBV7bFuclZUn
 6nxVY5KcG+wJCT/skUNtEZeUBnp0VClFyxkCpisAY7wQvPZZaaBHWrhTejfsHChyBKIhlDiS509
 gkpnF9L3KV7Gse8bbXDqHu5kJS5anuI55tVR+DbyNL/E/s4nOEw9odw+RyXPO1rWCxnG0z8kJyC
 Atg1aLImVqyCWefPlXNpR9NN9EltUwgJt6ubw3+qm14g3xSdqsEAT3JjajXu0XO+xDWXNa6WGGh
 gqXSoSGrffkVIhF0BKnu1zOt+b5qkyq/EPegIXcxnBdZBwb37NI8lMEk34O5bc4mR/RnNh7Xk7C
 c/f8qOPL1QfbzTuZmqmM+7GH/gP1tA==
X-Proofpoint-GUID: P2wY3KoLRT_dcCoSbhgt9IR91JoqEbkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1


