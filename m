Return-Path: <linux-arm-msm+bounces-67416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEE6B186D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B6E188E135
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571A1182D3;
	Fri,  1 Aug 2025 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfM0ZBEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D888B19C556
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754070084; cv=none; b=sAwxnlKqr+SYj2ZTy2M0+1eu6XwlmNPn0N8c+IRS0jMQ+gAMzCjka4oe+G3Dhu/rJg6xfowp5WwxW9PoIGM+z37WmrpROLUeU5JSmM6MTKfiDmhklejDd7aW/JI/Oa0wM6dQ8VES2izkMeQxesMYcfB19FrOq3REpAflzgmpQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754070084; c=relaxed/simple;
	bh=qX4/Gta/0qJljFewqm7g2+SbhR0hTNDOH4e1NugN41U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WonDR2p0VUQwyd2F/YVvLhBhQkj0HAyLxKmxuFsCXrkUnHyjqa4DuAPE81/+rqrKiOytd9dMIEfu3/y8l9L5C4VpqgLrkq19Umg7YLJT17PDDRaYOzNBxE4b+DZLVbEUpEnsCOW9gxubeFAll2tHmkBVKYK4xDCHw9UZ64lI67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfM0ZBEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfLMc030585
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 17:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TAjqsWG+09WgcEob8VLyeHOX
	BEVCAsO//HB0wzN0Dsg=; b=LfM0ZBEY5sfySZKfIylbPz+OU21VVVPRZEKyqQlf
	c23LIfgNs2B3XFaRQybRDSFl3TDy9hceOqdA93nToXnbyL7gu1C+TIoXcnAZleLD
	iNJiQNnywFXMCuUOHGolIA/PYQPzHwp9hnWOJagCQtqCvoHXYf0Y7YGlMJsC200F
	bK7HB1bzVP8W1G6EcoS2S4vOuZirCLFT7pxbra2GauWaE8EScPhbUCV4wqWLGPpU
	kN0/EYcsp0KQT4cIcLwJtKFjKmgwpSMM0rBzw41pkPImjdhrXI2fyZVrCtwF+Ggq
	nMt8GWPs8/J6ZVGHI/LSO7krYgbJSLVVTF2bBnEkVDMYwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyudeaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 17:41:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4aeb486c46eso37336251cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754070065; x=1754674865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAjqsWG+09WgcEob8VLyeHOXBEVCAsO//HB0wzN0Dsg=;
        b=X5XLysZBMIyXpyRV3w+ziLt98HqIRB4dl4aO2z1VUA7cHnzgtmGeKNr6XWjk7hAARW
         vNYIbNmbMocXqI2r3hNkVGLdOF4+UIxzYTgPC67TT66BjXETgB9I3HuFWeOxtHNWMsdW
         TGfdsFd3Eh2arMxQEVfUjrRk0BEZpYTaTc1+PTG5iehDi7lMLI27f2MiPCTxaJBljKwR
         vSpa7JjlLeZObrp2jwgz50YW6vVOg89wpKkViiY1O5fqeELxjZau1EYPKS5ZDIJ7RHJq
         2a8Ez6cXzlTAmjnyBo3jazW08j+PiFtVJkIsOltvbYjooqmHK/VGMLemt2SI/20VhmJU
         55fQ==
X-Gm-Message-State: AOJu0YywCiyUO/NfZxKcoqm7YrHBjtncZ3nV83GfDjS73J1RUY5cP1c1
	z6m/jWCi8rkglYH70oggy+bR/7Df7Y6SnUo7DbabU/7qI3c8F3IyD0XMwsP6Nr7FPtc+dcOnJB+
	EdC7UvfK4/qNXAf6iktevp6HFhMJIorbkBFtY1SCSmr7UKBhivBYQoqHGyI4T7cXF9B5q
X-Gm-Gg: ASbGncuOnq0cEzARJn01mvEyknsTPfvdFpQdp1PdQb9xOuVzDErrRxQJWGDrKUodBCs
	8H0EKU/xcSG/MpwBq8EHNtePPOtz8kaadpa6aMU3UaYKfunFAPOWZ7rG8KvyZzRWK1QKPzx+KwZ
	MU5e2ko5uD6p2Xi2o4bmUrAoeG4rf3pURjTCxPYyEe/+xKOLioCk/VcuQGgIbYtT53pCwgXv3cy
	cE5uDYxBpURPEdE+MMRpNbisnfOlc9was8GO7bbZh/nrYdlXUOkKekb8DkpUCk+RfvveCLPVlh1
	GW2+6g72mcgXkgSDorcmnE2jZy0KuLNH8Kjznk0nnkBGd3+2lcPk8Ah88VpgGP+9YlZ3C5UiND+
	GLc2rBByzjyOHmheJEUqqpCY95HHdFsuPl0eGg9bLjl6BTUJzKSVb
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id d75a77b69052e-4af10d11dbemr9816701cf.47.1754070064567;
        Fri, 01 Aug 2025 10:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Ab4B6jqYhlQ+NXunglR7CtdqDQ1rwdXyehj8v1lg2vJ1+icL9dUzr7rCyfChKa3r6LzegQ==
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id d75a77b69052e-4af10d11dbemr9816281cf.47.1754070063932;
        Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm6639461fa.20.2025.08.01.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:41:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI
 registers
Message-ID: <e6bg2nin5zqoemjxevqhzhshgeit24t6wxb3pnfazrk6hkxajq@773bvnmqs5id>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: rfCjuzfKFjeZ8U6r5o6ksYsZbzjBLLCQ
X-Proofpoint-ORIG-GUID: rfCjuzfKFjeZ8U6r5o6ksYsZbzjBLLCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNCBTYWx0ZWRfX7zSgtnfPccG/
 FOgH4uNswnnEnsi1g4lWpoVuW5/zQO4QD9CjhIro/kXqsdokTSM56zwTVTBn5wpBaFgZ+wcP0Wt
 ngubsoiSTD+vh7CtYCsrJ7N7I15V5cjjhf+RR/Ecb/JanWPwlKlp0d8rl7NDCn20QPeloXsYk53
 l75Oxb7FjtVw6NtaZC/H6yTFqt5tW68remo7w+xcW114FkjJOWjqqr6dpe+qilus7f4ZQ8ro2BG
 vu2zGDS7q/PgODx1v6DjjCOAVyGrop1MfnDxurT8weHDGDvhmh59zo0LeNb82XBnzJQT/bAoUuM
 0mj9nChz66oAGB7HHix3UR+8QS28vlFDgHnE+2P52wTPl69ETEe3OuBGNvBPFblCFzhceW/07tK
 nMhtDmBT9gbuloRG7WGGT/gKIU1YqDhB9tOKdREN3b6MXNNrgR6fHhohFLnPdD6IgXua9R9f
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cfc41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=CjfMZ6mt8HIBDwBlgy4A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=693 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010134

On Wed, Jul 30, 2025 at 06:09:38PM +0530, Ayushi Makhija wrote:
> Currently, the high bitfield of certain DSI registers
> do not align with the configuration of the SWI registers
> description. This can lead to wrong programming these DSI
> registers, for example for 4k resloution where H_TOTAL is
> taking 13 bits but software is programming only 12 bits
> because of the incorrect bitmask for H_TOTAL bitfeild,
> this is causing DSI FIFO errors. To resolve this issue,
> increase the high bitfield of the DSI registers from 12 bits
> to 16 bits in dsi.xml to match the SWI register configuration.
> 

Fixes: 4f52f5e63b62 ("drm/msm: import XML display registers database")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

-- 
With best wishes
Dmitry

