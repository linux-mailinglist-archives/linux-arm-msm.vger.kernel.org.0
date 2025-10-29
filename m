Return-Path: <linux-arm-msm+bounces-79387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C2C1954F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B8F0581A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFFD322A27;
	Wed, 29 Oct 2025 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cadfr7vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZvEAjet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EF31D749
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727927; cv=none; b=N9Y6UTCaxjnITqza5i255WSUr43TmBVOQfyn4mSxfusdzmJvzxPRzHUDzlwe7vPXSK18T6nEFZEVo5P4+Ciwr3Knrv8ptDfIgQJkWcKv+KKqWeuPkqd7uGy+M5ToR9JCOz4eg7CCuPt5kH0C+PF+5mOKkEYyeYkztfAGZs6um2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727927; c=relaxed/simple;
	bh=32UZGh8w+Y66JdiY+deLaqFEMHtghnX7C5KIbxCtz80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBOUXWYnvZbFIk6aEihcowZDyLO38cCa4muJ2GRhCAbkjk7DkHqXYm2ZLjHhLywO5QBGZm2wTG8VmeMw+lsESUR1osGd5gKyCcTeKRccEz6ICCR3HziM4BY61BIIBpumO0b3CYarQtm0EcNbvCH1yYMSPA95D9/QNV9oWoCHzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cadfr7vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZvEAjet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v4Co3755384
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=; b=cadfr7vjOW5fuuCb
	QJGsN1KLBOvO8/dwJZc/b7Ods6U2+/E58bWPcrSemXZpLySSvufKu3yB4lWqRNad
	1EVzMgwMm9hws9mtuOKPT6A5Voz1AJa6F45Bl7Tm6Rg0KWBooTGgpJBTgfJY4is/
	+I1KUSzwSv8wPlC6Jlnz0kV6MrwCAl8DbkFLUHCHW+1aEl03ycTRXOJ/2JycECQR
	BobhRZpKTTAxxZV5dTr3fc8InOR0NJWAxz7g6caRQfY0Pptp94fxlM3eI/qK7uti
	+qnnM19hqiVqOt5K4e2eaz07YjpyGcxYek8s3hLObx16yDI8y9JkgnqqLZpcI5ht
	Vo+WBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0huxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eba120950fso124495091cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727925; x=1762332725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
        b=NZvEAjetqPj2CzgGbTzX+Zm6GA9XM4NuKwo+AQQzkw57z2fxIvmp7J6AiZr/Jdep79
         RXPtCkKnyGNfdTJiiBbjepDRUOYv3shqznja+NkQbnno2LScPvn1XpP1t9HPxjIUsVTJ
         um4pe7SzubSrE5mHzsPHXGPVuatj0eKjOezm78A348KqZAdtueYHVmnkZxdAeCEwHpYF
         AkFovBbGlpIBR7W7C49E02InnvM9qy0L9U37S6DO9vgx+S9IYp0t2sXYctWnwRTszXd/
         72VnCzY5iatKDGvgQCuI3d+jHo0ut9X5WJzTESUBrC51ds3edWS7GLUSQMad8pKlu+lW
         L1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727925; x=1762332725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
        b=Jnq6Y9y/trCqaliq+r9/rUgaJyzRWqHW7EW3zvkzulQrE3oVVyF8qXnLaWEWtkDO3Q
         wz0lU4JDj1+VnyT0CC0/N8Yqj3NP8UmhypvBAMzOGpsK2cO/iobURGzWUsi4B4yOisCV
         cJZuY2oerNnEI8WywWG82ysel7SvwfsWRDQgKvM9fMDxYHNpEUaQ2vqq7z8A3h7bjSRc
         991JFV/SuOvq/JGnp0IBZYBZlpq1ZjDsLWNehI7Ue7XovG+//6afmauNltE1T8fgpUAL
         XnBsV+J0wVwooSfK1hXPqTZy32c2VcqkSN2LgYve5DkBj6ZfsbYbmpJMwuhXtKrOZury
         gxJg==
X-Gm-Message-State: AOJu0YxIa4SrqEbf8EcbD5bLpg9Z+REhtD7twoQ27wGhPGLXJ29Ca42N
	DdDC5q3nTsZrCD4uLJIH5XkipDGV3gJblmWcJ8KhLUfjua06vZKo3DdHvsvTx4VvJgrkCs2Oi59
	NwamfwAz29YqtP5Y/ezNOGyv/kT7lKAfta/IqsjbuxEjQFbI1bsqEjgclWGMo/cYLXJip
X-Gm-Gg: ASbGncs4VNEezovgtWoSArqlgV7Zw4AI6HO5THaHUSVGPTU7ccaV7FmdrUXuaX2Z+ld
	mOTST6OiKmH0OZZU3mPSupTJH1QtMwoEn+SrLclRTn5uYpqzY0FeHA2aNySeetXBlm0L6d3ED6Z
	oXnzf047LmMFpwW60TCfzUyOdutnhgfIj77QYHfHlDqsiC77KDDYudbiHv1u7JiT1BbQkt8yRfZ
	FSB87r5At5hcT4FRdKEZAlWGwHsZRZsbBorDmxdCqUGRJUwoOC1BitNQNWlkqBXxC3YxqCGWqrH
	LKdMkZVtuEc07TlZPgt8NtMjGsLi4AQonvPXqeUe3MY9TJhU7O42qLFVpYsAEByJI7skyvsGKZb
	0hqkUtbi6y1w8r1asYs8Tc08=
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id d75a77b69052e-4ed15b553b6mr25060871cf.20.1761727924854;
        Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjiYnP8CmOdJwyrlYE0ezop3noeqHZDiwSCLu91+J7zUHKyBeTHNDIOJ1tYu7xGib4zKWcw==
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id d75a77b69052e-4ed15b553b6mr25060561cf.20.1761727924434;
        Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:35 +0800
Subject: [PATCH v13 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-2-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1102;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=32UZGh8w+Y66JdiY+deLaqFEMHtghnX7C5KIbxCtz80=;
 b=xO0ks7BMbn2ygrt5SJF56XAhsW3eyB67Lj2pj7pMykuQPA4fxNHHn1Zu2WCTJQ1crpTf/5RTK
 foM4EMKKA+gCqUaHoHL5mCeXSDFo9uRug+vtNI1P+t+UM+Jqe7/t7e0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901d5b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7hmKyP8XuOziMQ-xZMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: shjs9tX7latrvdmQsu6bdrj08D-jO889
X-Proofpoint-ORIG-GUID: shjs9tX7latrvdmQsu6bdrj08D-jO889
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX4V8OnX3doxVb
 E1EcHoYRd1LmCBE17h8dXpPd+TAFdMVGoOdQ09MCpjQ8Uncn7z4W/pAhTNnUahMkGHTNyZZJFXm
 fBcbrqUsXpuPNepLZKKtWnaVIeirQ+VJ4BfvWP6lPuMgAwH5Z4ypL1/FZ6JcGilpqfQmfW1ruNG
 AI6B9FeK+ITPURO4Za0ZPFMfznCBvfdrZdGLzaFZIZbScfWsRxE+18xA52VE5uawru84i5IaEPa
 xQJ5JeNExtPZZtcPFj+89meU6amF6HN4655LKItonrinXcnpk8vPfhL3gbbQnJ8ZO/iuZMUrS9g
 VVo1r1g3P8JdIpZhPPjY51rMlco0swTLMtcz/77jCXrdQvr4mp0NG1ek/cwx7t0b+Bo2WnoCLho
 CIs0OQ51KsVF0sO5N7C1cn/pPvjdWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams, similar to the one found on the SA8775P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..ea88e1903f26 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,11 @@ properties:
           - qcom,sm8650-dp
           - qcom,x1e80100-dp
 
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sa8775p-dp
+
       - items:
           - enum:
               - qcom,sm6350-dp

-- 
2.43.0


