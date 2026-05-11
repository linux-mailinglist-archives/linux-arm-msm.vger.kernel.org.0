Return-Path: <linux-arm-msm+bounces-107009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOroDIpXAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:26:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05A516DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91C29302552A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D3C383314;
	Mon, 11 May 2026 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n672HzHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9eP3YR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99738330B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538233; cv=none; b=lJyDoKa3zZeMJrThEmJ0oMbnAHEJQgCL1IBXYK99uLdAlgWbaNdCT431OZr1IkW1GBPi80Ey27pf0lYk6slOhy8oAQSvH5yhoDEvM6FFZm/rCyeUcQFy+v5i8MbTTTpyTj/MsWo7aWyWUZvru68JQ8Z6k5zWfrzw32V7eUHQ/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538233; c=relaxed/simple;
	bh=j1uKoavk7LSXVTFpinQJ3L50+niGwfT5j/plxH9VxBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO67/k2POjKkVoTcQDZi40rH3dC0LNZgc6MWBlS/Ou3rDkAUjb/QqY6n/sgocITmGSTKCh6aDJ5tf9+VZJumrzagpQyaFYZs+JFbDQ1oEBuTDNIUmNIkOcU0JZowBIVgCPSNVuDMnLoNzcYnL00aZiPbfEEfk0pzlTKfrL3lPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n672HzHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9eP3YR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6oJ92186602
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=; b=n672HzHxzEtRcoDf
	ir6x/ZJRlEfhbIJOMVkv4eyYqXy8MLDomiRPg2BnI9MdSgbrwtPlxGXcbQrE8ZMH
	Tm79PL/RiDti8cr5SSPqlKYIQPihvq+KgcpIznMhmQ3+VCQyPXo8icYNTV7yNUGw
	h+h/WaJFcROAZG4lMM10n7i6ntRQkn6Qa15zvkAvqPsJr0IFcJWkuhWOv4VUd9mO
	mHCMDbRSS2ZYZRzjxwjrs4HEctl0JYhJKxLP+Bv+3E0GTQiQrfhPpQicVPthpkXk
	WIoWEkPypH5zD1BNsC+BCVVeFbLjkTpgRepjdbQLjiZGJgp1Rarb11OFp2zFmNDq
	IJM12w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28fsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365bba50e82so4611551a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538230; x=1779143030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=i9eP3YR2gteLt1WUjwmFfpEYpF+lOEhu3GX2/ht/UpmIlMN7xe4cXT9l4XsqDAeEaD
         Hd5VIhC6mMYqDewioknjokHiNjRkQSjH1Tq9Y1p+LMHDQJKuSfwl3MNypsfUQE6HmKou
         ipazXYcBuJBD2ArZ8s3Z0ujpDVnCL2u1ljfk87yhjqLwDv4JrwnTQ1C0aFwf1Qyvim5m
         ktjF0sRsau/JsCRNKcsRY8CH4xOlgqsVF5bRd4s1iTafGRox6s4fV5PZOwH+Lx7YTxbb
         FT5W/Nzwz4botZ6VZe5cowkrTfKdtKat1/v4BvSWETPL7O+8twkkXxm7cbC3o6rqDlVY
         Ycdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538230; x=1779143030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=MLPH9G9ioj9J2GNQIa2K8oSZcsQbaxtiG1Z27NTZ2DSIXntx8R5hHtFFAJf57z0C5n
         GkcE7dFGaqSYmwXsfnO2Joj49yBElIUkgHLVTwsf+mtMwCvaCvDhfHRg9pg9CZJak5do
         dQJf1C/mUSbuXAffyr1qPihc1XUXQkbulovD4MnXZT5IDXMlgMwvTJKHZ6V4ml5Bl5eU
         XypWnZqKAY31veniC8BAsVCQtmo7t9zJ4XpKi4uzEyGqVODEMyweH91L+HEC9S6Qp+Yq
         tjq9EJW8iStr+Jz4w3pXdZLWa6L9CB7svuNafGCC2ufaoh8sBlAgphLbI1eCBHXMrl/G
         LhkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u/guwIhtHMQ1i4DSLaRH0oCNBbjZYCv7qV8O4ouX4Q5X1ufjbOWy1dm4s2kDtqwXHK8J/UXm6m//WeGZw@vger.kernel.org
X-Gm-Message-State: AOJu0YyArJ4C84h0f0A0BIrnexB7BCl/GqQl4bVjpj8kHZ65Dm8jZTRp
	198VS7cA/hQyOqyIMX3AL/gyUR5M2Yhd+xj3E5i9deq2ZKpEzD5axrW7LpkDthrk5ty0YMofQzM
	JxutJoopCy+KwBImXprZOMtsxhJCEKr8pWw0VC/OnfIfZ1itu8Y6/aQdM8Z2SEK1xAnlZ
X-Gm-Gg: Acq92OHTw1cbyyuToJEHt+WFz/ZY04DboTo2f0PPf6W3DdEzhjmacf2brin/CggCM0m
	VFh9R4Jznf0O+ViLpqfqr2VSyoZEBwz8gC4zIpxqSNLanUXEu0kOep85MtR0OSl/AsYUL2sJ5am
	kPzsb/XEMJso+QM4SUygv8s06KW30aPiXxp1XYRznilArFeE1nh9jZRU1r5HCUMel9N2gqFIfF+
	6NivXHMQmfoUX7EJSEAwQgrarHa9xk9hCKcms5koj4tTaznIkENQ8uzLjjVuF7KPldk3UeX/jJ4
	vkdx4q+KPVtVS7O+fPD+JTrm4bch3mOkEtm+WUhvgYJLzG6WUdYbSTwMK7Tb3zS4UJx8RikhU9v
	Co17YC0B22gttmPTL64Cwx8lEsB8jtqdAEG+G4CwrU9Nwcw==
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095253637.46.1778538230345;
        Mon, 11 May 2026 15:23:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095222637.46.1778538229874;
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:16 +0530
Subject: [PATCH 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-2-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1371;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=j1uKoavk7LSXVTFpinQJ3L50+niGwfT5j/plxH9VxBI=;
 b=dkSBw1s8Hl7c34xGexPilCuQxVMR0sBENGS+SZhwEMiavLDKfYoCy5dsAY7UhE8iKS0QVuwSG
 2dA6b55CTO7AU/2fkPlZlCpIFE/Ms/Ak81W1hhKN6X0xKKbaFWz5JnE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: J88oCtSLlAURzkm2M58nAyyJpxiaOn7h
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a0256f7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=I2s05RQVLi5l9ras6fkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXwKYOZhCpFt58
 MnG4xYYu3Z6kNWzwXP6rhTEZGaZLDRNeoZKgMK1gXQk0COZhqheE57weE1LkUdKE463Wxl0Lv0I
 e/cRPl+p/cjdhdCt0zTNwUE08/RMBRMnRZa/kx9+rxmpvZcQ2dkmm4K1VHteIG23+3GAUCfpffK
 scrFVHiEEiZ4HXSZsA1DW2Vaxv59iHYrPFBuYZYTLlf/ZVs+2nI/6TGO6nUoxszvvijW8ANuNkt
 C+PaRwfVFZEnWBVo6Ur8Q9RppTLviZxkrxAzBi/44L8Esx/+Z45qWsb+SFuhIoq74Y5PbMB/QQL
 Df34ENcPofeK/0KjMMGJbjzkaAIHqQhz1Wducw3zpqv5YwKULaxVOuAHCuvjctB+/dhd1qvFi11
 gjaS/4hEesveFxuE1kMh+5Qcy4xlqKTQhM18uMJmBVG8egaS9CvV0X4rtzTifuQEe1OHXrKGBxQ
 MGvqr0XQzFNt/6VIebQ==
X-Proofpoint-GUID: J88oCtSLlAURzkm2M58nAyyJpxiaOn7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-Rspamd-Queue-Id: 0E05A516DAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107009-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e67cd708dda2..35c6d38dc379 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44050a01
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -450,6 +452,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.51.0


