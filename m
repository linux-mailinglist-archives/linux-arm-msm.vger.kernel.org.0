Return-Path: <linux-arm-msm+bounces-72969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EDB515A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A648A176B74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF4E274B23;
	Wed, 10 Sep 2025 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxhn8LaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7B314B91
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503606; cv=none; b=VA80egFcyNRXsWwxIfadESSfKm7FHYgCklyx7mutSGbB60fw5ZTBw0vkX5avk4NOuZqRZHECafr8vSV0knXcFKIzDemx0XwShHE0xDi3N0k51SvLFaWkHnSJ+KUCcCbqa8FRTGvewM06L1iMMIFoOOAknWJUEGmkweD4Tv295AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503606; c=relaxed/simple;
	bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DivNKgnS0fP/KtCZ4ZSjZHTYM9oTMrV4N/gbroXr5FkOWx44R854FCm7/qNBsd7r4ptDMChN/IPGOPuQawpnCpGXmCm/wwJEkTs3RwBIIsElcim/aJFjhuyJS4mAa1+v5hQHutbLjZjlmHt8aKmvB8R4nWbieZVzBleEKZ1EtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxhn8LaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEr7012434
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=nxhn8LaCEa3bDh7F
	fdAiO6mG+7bKEh3PMZQrDeC5ekneoK7d47r11mgCzXfvqBkOzUfBRSODtaIoHtEo
	yBmBDoHV02+lIuySvUlCm/vuNFwoMnP1/2a2DOKEPrr1g2D7HT/vLEi+LWM2TW2d
	vxHHOXM4d+uu8Ir5h0n21omr5DvW/f/4Ty03vQFfkMDsGa52qOH7131PQ0lTvlYj
	hVVE/fkCM2U6iYK+BF19DOOO3Wnydkpc7vb43Xco8SuF4M4pec4lMs9CVzUdr0Py
	nlo3oZ8iz0jVEkt02xoufBC5EpD6gr7qliSdKBkVVF9V5Nzm2eRtIFUrukqFwI22
	lt67nQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbsng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77288e1ce43so6880665b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503603; x=1758108403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
        b=uhxMNOTM4m8pyiHT9ILYEm/NZNJPHfEQZawGSiE9/X6FgHnIdDBTGRsp9Xyii8kHPX
         GI4NkXyMUwZztQodbliEqGzZLPf4SVXB2yEw117phz/AC1poWc4LiElpGn/mxYuJyUiP
         WzLk3azOrxeNnMVqJGfncFPAKRKqdAqHI7+VKliVNqY7bbCxh27HX3SL5WnOifZKAFUf
         a6mxGVL9u8lW6OxD3bOYEEzlhYXw1NHrA1ps9jUF6+u8PPT/b1MKr22OfuFQKCNHiu6G
         Gh9qRC+9CBO5FeZ+jTY3r4zmcquqhk5568lx9VJtJvxWsOd9CRsd3KT0so7sE228RdGW
         YhpA==
X-Forwarded-Encrypted: i=1; AJvYcCW6lo2APuwyUT9eFdYprbZRDxwg1GX1JXQ2VR9JlL348Eic2KZU5mu1/uHV4kgZhz6aLLWCEhUCsfKqNPzG@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLODjDHdQMtxA6Y5p48pkKIWEH1pKv1uXAD7q7RX83IOLHvCP
	eJVVhu2U6Vom7UeOBxmkyS796t7P1CoK0ZClSOfbIlx0CGysEM0C2R2XbFlekKuxECryU0OOf8U
	HVQQNuqWc80+nJ04QtqAmF9g6ZygNyZiJSvnlY/TwDg4r0tagmrNqO/rOtIuiGJGFarNf
X-Gm-Gg: ASbGnctExvCW01r/4HFT1mkn+EFfLTaadxfWucbLDFrOOQfxjB2/vYJkelXibwc98u/
	qJe7wqYmhqzU7jeNjbZPh75YOvH3BGSav8raRBjYkIdNVGtWm3L+Vlxu+GSxLm5WInXUYk5uZ4L
	7QmxAoQGOcWXY5DD+CwZDQ7H2KVPdKqfr0PdalVW98mO3T1l87MP72AITBncR3iq5bYb6fpoYuA
	HEYpI9SBRkRrVV05YcBwrsgkYcXYho6vuT+ioXAcseRg8JxYDUlMgcVevH3wOHRe6RyC/LFtKEc
	AzNOptb3s6WJSICTV7ZNex5EIoJmb6e+yHyMmGkWb7eNBj+yMk4WkFzaMDhn4+Tq
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id d2e1a72fcca58-7742ddf13cfmr15993630b3a.20.1757503602995;
        Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfTJXsij5hahDr1ImNYphI7GxV4OZZqm++kxMfUWKVSn/3R0ZehMj0Y8qLLTvIRj+LObzBYA==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id d2e1a72fcca58-7742ddf13cfmr15993609b3a.20.1757503602566;
        Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:26 +0530
Subject: [PATCH v6 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-6-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=XpUaKnoeyZk7w/FeU47t7sSg+CjlI3AMryk4mP+ujUW3bZO9QGZth0AXHtgh0Dlc6Hh2YTBlu
 mzbgNxKo85aDvADCC/lnhgr7fWtCz/LRvs6TZLlVAMNXi2DK4XDF7hw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: tOEzppbguqA7x00w-TbY1G9jGyvJ3mDM
X-Proofpoint-GUID: tOEzppbguqA7x00w-TbY1G9jGyvJ3mDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX22bhUoFTdEy4
 foA/4Ul8yFBUDUBs8KFDNNIjgrc8kH8eFcD16qCKVZPgJRozpud18U4S67rcxAN6aTgnED7cLRJ
 rBNa386nppfaWU+N0DRxzcOHI+LW5CJdPZNNen59tgzTgMOiUsNQyLU5i/u32oWLPAEpDSQgt5u
 bLsLwtaD96oNp2bJFBtW4XDvPFPTgbtH8yrycftB3GAn7zSwy4sbflhcjU2bAro4cF6gIQPgf/D
 iFoBZnzSLxe0NKGL6K8QsbD8CbdYJRVs0fClepsWen8gJwrGigVujc8vaIyjzGMIW5uoX7n+8m5
 8R84Bpn/Ph7kk79B+IjIejJJAKHK8nSZVxtDspbFqXLe+mX+MqkdSmTXrP/zib4vYhBzm8txWN1
 SrxDOyBu
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c16073 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1


