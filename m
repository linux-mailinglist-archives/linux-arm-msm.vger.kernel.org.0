Return-Path: <linux-arm-msm+bounces-51714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20861A673AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC453B8020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02D520C026;
	Tue, 18 Mar 2025 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQW8Mgan"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AA7464
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300278; cv=none; b=P8dg40mBRBfDGdHUjxaPUtWayQc4DSR0KlokjrOIa6OauLJUinhXMU453Ari5ESPBr7n7ltsZR+knqapN6TP3zcb7aKgwEFxXIesSkB+Sq4UnOGUxD3NGj0WIaheZ9iSYRG/kBcmxH7tmQvuqegdtLTRFaXpKaNaJ82WETXr8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300278; c=relaxed/simple;
	bh=mNRjA/pQf0vSzY+gbkMftRS4J/HTfpU0Q/49/04Xnsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEUa7mz1AH+nYN6gM+frcsFr13cZQ/4CSqsaOQ3MgvgIM+e8OdSnoWH+pKsXwyCA/eucPARknflJH73cydFQAYBWbFCJQXlO6GAiaWLrsHpI4B3uAo3elIAZq54db2LNd8jcbH2edtXIo/xuzf+wjOuNSM/DY5/7qcVHG31Pq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQW8Mgan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I95UUc030742
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FaaCN1q/n3kjQfPqICNHxVDL
	1mCCzIPacgi5zEqisuI=; b=LQW8MganX/bSqJMTX80JL/g4gJtfrPh1JKfpjZ19
	q64aUn3bocVCCL0XROtkvcwFD2VAfY8AisoTQNcvodZh2bQOQ5RG7VQogsS45D8q
	OobdY3EFwWYqZAPv5ZD2k9IOmddEYWdsVt1EVLd2EEJHKEewEXyYNdxacuFQMH7q
	Ivq7XeWZvcAEoCxNnC5WztUEEsVrLa3lDVZ6V9FrtPdJkXKisYjTT/7F1G8PWy2v
	EXNZY6wTqohJU9Jk1UcQkRb/7aay3c30yrD3YGPlriTZwapbO+9cEvJiDevm4HoN
	IFcmG0etoCmLESBMAF475MfL2gAI1S/hBiKHdYnyEKPErg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdr5tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:17:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768488f4d7so98919471cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300272; x=1742905072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaaCN1q/n3kjQfPqICNHxVDL1mCCzIPacgi5zEqisuI=;
        b=Grfm3QbU9Q/VN0oIxsQ44SwuGnlxGzehg7u9rB0PAXdgXRMrjc5rWQUSoQtA8nSmXS
         7J+yfXvXxPJ1mngmQLM+AwhV+x5uzZFk/WZcO+Du2rzTiz91LnYbN4DB9IXPHMForInd
         HnvgmTfB30JrIGxEAU25XDrmVzIN3b9y7UTLc7GDzf4uWENnyCdqsVs3uMhro9XqGf14
         /hCmm602S94r9WLfRt8DEzQwGrrWj8Eu5gWBkI4OtdTjv/pmdXv8UYIvcY2/8q7OSufg
         WUhR7BFKWZYZu9zHj6NCwaCxLSl4gxo7ovH6gTiSwC9PFMrpFLHRwASZRNCqAHq8dFZ8
         dpqg==
X-Forwarded-Encrypted: i=1; AJvYcCXRotq0ZDgspsV5SV4xOe/MbfBfBj5XdH5Hkiqeruh5k65r+Mfjz9jYsRDIBpa3MYRK5IKLbRfX3iBWbF4C@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSsxV9LZJGndTf39XNj4TtQ59iA3DNYda7DPcC4yuYmIsR9yA
	EmwPo5VNP/V6gpbKqK2KkhOKnVs/anmgtPTKPtKOaZh7ujn5ueLSN6Hjpj/OPQD8b3MVM/Tbg9W
	kOd/+r0qjC5tBTPj1QrN8JH1Ay5lL+3eJ4w2AZckk3rxFNHRBAb8lCq5iIjaCYVHZ
X-Gm-Gg: ASbGncsXjC2NeULfnP0OGomeSiZ0CE/ub8sqaUiHoOPZp0jKmFj5RQkhMNSjCn/vua9
	R4BKmVpGut6bhkStBmaCdGxoLJOdD2r4wBLPNIIQP/v2BKErd7CSCd0cN0Y5UZ4Q9tC7jKEVJG1
	nKJ7TJG94BXG4j8eWfoRNTyYTW9HSxFQNExhICT4vLQ9gpgK1FnDV6QXKXY677E/8F8O7n232rT
	ItB72ONvoOsvUNnEedbRbK+/gQVM39UAlY4hBK0CSibdKMt5ZlNrPiQcXSplOHsaahrWlmv7NAF
	eMz0gGuSdEOPC5cXhyjKFXZ+wMR9oj+0UR5cNmFWEMBiEB8p3GQxAOWHCt8NyqgWjiUncSiGbo1
	W+Rg=
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id d75a77b69052e-476c81dfaf8mr248672581cf.47.1742300271842;
        Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpyCMBm/+FHacTciTYh4rtRvXfyv+VeST5ueZfSRLIXQQ10PAbp2U7DCjEI40J7DQsicDmQ==
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id d75a77b69052e-476c81dfaf8mr248672001cf.47.1742300271483;
        Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a9525sm1640499e87.238.2025.03.18.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:17:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <fr2s2ndjzyd2z7m6bsztudyb74a7rdvunehb6qfu6ar3s3i7hf@x7fap3clhlbe>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
 <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d96471 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=eq-DVYtN1lDvlgNQnWEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 4n_gApqeZK48a_Glsf_7lfveuDGVcWGJ
X-Proofpoint-GUID: 4n_gApqeZK48a_Glsf_7lfveuDGVcWGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=504 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180091

On Tue, Mar 18, 2025 at 08:56:46AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Smart Peripheral System Interrupt Controller
> 
> Interrupt controller should have interrupt-cells. Or this is not
> interrupt controller...

Well, it is an interrupt controller, per the name of the block.

> 
> Anyway same comments as for previous patch.

Ack


-- 
With best wishes
Dmitry

