Return-Path: <linux-arm-msm+bounces-61038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62167AD65CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1917A17ECA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 02:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0091DED64;
	Thu, 12 Jun 2025 02:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8l51T8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6701DA60D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695991; cv=none; b=DLUAZwrdf+NY/3lmjVW81NUK2AfPSAX7EkMaFwv8fgfepJ3X/QtU8y9zLRQCicNyixKkCRzmmOIQe7iCdiEUK66r9UWP+Q8dEz4i459amhsa0dVLIVh93AGuJaotjM0AE8K7hO3Vdg0ssusf7r9JLcQFQTTDmBr1k13cxyHzEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695991; c=relaxed/simple;
	bh=dByEkHGajdUcbKdTNOwI7Vs1IWsLJrj3edmNfpIA0Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yl/BWjpGG4/xP39VMfEzbKnkEbPpAfEJPwhCaSqgySSyIwpRt8O3Zmpgk5hgTvUXSfnNHmtVOQGFdnbTbEvjrg0mari+h3HnyOL5uwMhp9OEzyCZcKE2NqyTUmCcYJyrPxJjvPvgHhEKijjF01mPY19Ula2OW/eZ2O+fJp28Ir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8l51T8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJ6Ikc027371
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9QEMYi5BpWOFmaeRanYjIMY/vMap1wBOvtfthOtg+k=; b=e8l51T8nFVUgDwyI
	VbPY4RcdyiCYhOk3qeyg3c0GebVWhJ1IsRuXHCktqtsw9a6tJKkWR7M6mM/AgZJs
	IgiAB5HJgenJFqPYzWOQw6+IADSh+qtn/u02dI2+gZxEN4zl+FwA7Tw0xImrFN+H
	NkI4DfvV+9liMAzX1ehGukLstZ9UflIoW9s6dv9nU0e8w4sIxi8H9VjeSy5SackM
	iQu0iuyLSrYzYuKtPIBlkU228yWeUs2JzV1iEjuK9zItiZ+MQhzBubjikGbW3uop
	PIvdTDGXT4gjZtS/z7kQgdJx6knGuj4BYgi5VOzAWz0C0uMTV7Q2BkoSRM8JQ2lX
	5vcTDg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhdxw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74880a02689so320041b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 19:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695987; x=1750300787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9QEMYi5BpWOFmaeRanYjIMY/vMap1wBOvtfthOtg+k=;
        b=r+skyMwzlXrXt09Li8O/i59dEfDRrv7RGEuLdAlhPJUxVx4sy1ILirUmRVlpnvEnVn
         wAyVzKZqblxwTwcLPnbLNk9USltta5fUtaYQIv1VJWmM9ItyXVoVdCBX3AuzoszUp3Me
         +Q3HUsRgLesmETtpvTAa133ppaxm7uSPDVvelavLLS754Nha2zyRGhL1TpZFPqL3vLlf
         071lw8NjDaAwVTH8CFa7PcdIYje6SK3aV5xEB/tPZj4bGT8Gs1uZFBDMMbqqgvv9Hyiq
         NIaXSaNmrM8TiDSq8NhQCRYaVttuE3IOg/5ieCuIz3OaW33JAZxRUNEAhDsBZZrfScYs
         hUZg==
X-Forwarded-Encrypted: i=1; AJvYcCUuBvaB4PoZOQeTNnYqdFyaHs7GhPZJnhmBPiZzEWdWq+S2Yw+HJn/4YjOzu3H05MXyjN53jtfmOQHC1ntn@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWVIdt6NigXcyfHws2jEzrfqfPbI8QjGTmH0zhRmZLTeM4jm+
	2FFnSy9WJ/ffx8dH99frlZVDnS9siV4QPB6B1KjvhY1+R13PW3w01CIuxQVzvEj0DDziGaeLYE6
	+iJlfYKP9ofDjId58REdWxZE+2Ry21c7ddYkEIXmseKyu4pxpRAD0lox7MP6yXAOKW8VFeC7QBM
	TICpH2kg==
X-Gm-Gg: ASbGncvAFaQB4d4yr8A8ooYA4AdJ7B/zoC3ebmyj9MSCoD5XUmJ/yhAFQfpbApbNczn
	JQ6KS5HuWGoWfJUKujQv0yqfx/pN8I5OBqQ78XI/XZdol5GbGFxNAiVeVnOsrZ3W4CAKAd+UJDL
	XeVd+Z7XI/ZEC5MVzuHDwDe6f2FgRPIVdMwZmqz/5wWSvXvB0qJ2CONGX1rD4GBJyFtJw4sOazU
	jnV4m216jqH9fkZcwhvu/ALDX6BriWLLgtcIjml8j+fvHimZ24HrnDH7uoR/vnybs3GkgA0PxEa
	k2CoTfA4MFQ1YHZEBE+KpTKH6N4iCbGjVpz2MOEjbzq82rLC/2uDcxZjdswzYzIUNJwDPtMg+PR
	98QGidnQGoK9LYHR7
X-Received: by 2002:a05:6a00:1a89:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7486cde2e55mr7371996b3a.23.1749695986867;
        Wed, 11 Jun 2025 19:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEIORMTgQpFNyATMstarik3rAFLud2CcNi+Ex+oVPhUl83e8l/uNxKyxbUfmpT4TIbH6vbOg==
X-Received: by 2002:a05:6a00:1a89:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7486cde2e55mr7371960b3a.23.1749695986351;
        Wed, 11 Jun 2025 19:39:46 -0700 (PDT)
Received: from lijuang3-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm315835b3a.4.2025.06.11.19.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:39:46 -0700 (PDT)
From: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:39:32 +0800
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the
 interrupt number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lijuan Gao <lijuan.gao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695977; l=1325;
 i=lijuan.gao@oss.qualcomm.com; s=20240827; h=from:subject:message-id;
 bh=dByEkHGajdUcbKdTNOwI7Vs1IWsLJrj3edmNfpIA0Zw=;
 b=UK4xSyEL0fKt0hzvsLd2wFW4f3kUfFykLTqXq4KX8ugUvR8LA7Na+wiN8Ff1CC3BPjItTcfB+
 9KtzLL+aYzMDul8pifFbAhhalW6PqaT62dY8J9XNpv1AErwvXuGNdub
X-Developer-Key: i=lijuan.gao@oss.qualcomm.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684a3df4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hqTgazAR9qFGF6WK--cA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wrIU1nQVmUnSpph8RVBDekXIJtjGiX8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyMCBTYWx0ZWRfXxgp/J7RPJm9J
 /xCGYgQOpFFIE0UXWtMIdqIY48wPXzjphQho7ltESjMUd2GPXHpcQrJNZxHfmty/nRwMJz5RjFx
 YCrWiXCd4bIXeSdu/K84otMag7lYpmCXDUQWuoBRSjwN2k3fOJqpk6h0s+AZakqQlX1dq9lcnsU
 BTjorsxs2ZMJWxar3by/LAMo60jyDfJ/x8aDSHIovMtpXcFgGOGhwxb6/S844oR4FryClkNU/1w
 Kfdj7CF2AogNPxoviQ7xT6HHaPQdPQfrIYeDFMM01KgbHGmzR7ecnbSAlgaRPzyJBin+rNu/Pwr
 ubB4GUo0r1EZtq4+/y/GV8DW63BkjYRtU0FKY28WLRF4e123aWgkTo1g23q6XvhsddHS012hmVt
 9+kTK9Ukj2/JZYpEUrK+UYHjnAJmgIMxmZvQ4zEIyoBUHtiTPxFevTaHYt1uf1wkL5VQXePx
X-Proofpoint-GUID: wrIU1nQVmUnSpph8RVBDekXIJtjGiX8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=785
 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120020

Correct the interrupt number of ready and handover in the DTS example.

Fixes: af5da7b0944c ("dt-bindings: remoteproc: qcom,sa8775p-pas: Document the SA8775p ADSP, CDSP and GPDSP")
Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index a66007951d585b779a9de593851cf2317d3da79b..188a251940001b8535ee7005f1595f42f6ab9b34 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -144,8 +144,8 @@ examples:
 
         interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
                               <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
                               <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
                               <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
         interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 

-- 
2.34.1


