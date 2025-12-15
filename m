Return-Path: <linux-arm-msm+bounces-85284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3ACBFD8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9947130206B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3C248F47;
	Mon, 15 Dec 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXx9Z1Z9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTKLTcd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6D327BE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831925; cv=none; b=jystx2otdIeiCoHP5dYjps+GPVrPzcoI99b0ntGdX8257sdJgx648ZkJRmaSTD7YH6PcTX2JeWo5mNElHxjHfLvfQ9gjZnpsC3bfyuFTOI/PbmyhFQ12Vu6vN2JCwmZfmPlTyT/Erb/kZkCGGMjKs2XXb5Hl01zz385TxSJJt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831925; c=relaxed/simple;
	bh=F0HGmFeCvFDFdqLUT++/PbLDqxh0/4hWuFjrP0Mv2mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5G4nf3IxOXU1Q4w/Ti/LtogYv87o4ltGBbszB2+zAZ6HzdMb/1ww7hmb0sgmI0vwWiNC9+OhhMBEa1lkZmvNpbuyqfbf5EF1mF1EXNJ9lQj8Z/twlNN2omMCQlfJAjxVYsPPyZG2RYy8hG0QBAC1MhS503+WxzXSr9wYQFAlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXx9Z1Z9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTKLTcd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGivRB1823910
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=URoUYaduLCn0x2dUSjsAdtUx
	WNq54PTEwO8tMWNDZfA=; b=VXx9Z1Z9nQZ1nUvyKg2nGckO65BfhyEE3tOLU+Gr
	VQkwcfnFOS/TXOFOGdKalUia4yDl1Z7U0lHeFY3Jp77ZwmSVEx78J0XVbcR+gmSz
	ED3TQ5mXRRBONZ3R3FVKLbCW1mQ+OSl1zUuf3tre35jv2v67W9GpbKlrmjnyDypc
	stxCn16Cja669a8eacwYQgsQaHtVSGYoSNdxWV0wZXAMqcsb3sAmwHGIAO7gNYns
	ddHMYC3CoIM2/Lj63sryv8yG5fYyXiffHD5Xesft0XEQLpYF8pu0FhurvQisGHo3
	23ypjEhmaWzf0Qnm6hI8wlunJMwXCG0f2GiloEaHLmaXcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p4f0m3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so85505671cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765831920; x=1766436720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URoUYaduLCn0x2dUSjsAdtUxWNq54PTEwO8tMWNDZfA=;
        b=GTKLTcd0gnpvnj0y3VGhuCQPEBiVfm6Z1UO7IAQxVfE86FyRClquM6+NouuwZN5/ma
         5fO3I2pOPwQJHJUvRra51hv1NtYcIO1WLsGJgjAMLCYDp+66Ba/JrudIL8d77BCLHnQI
         YpaDKgagVCWIoVOhKUdTGhqXvd52EIeQQSaCYZjUJjuRESI6lnmneS1vaog2utOMZYNB
         1dWMJyL/Igf+Do7ZrduHGEt5Nk8kyk8miH7bkD6SUTPW0p50bYzD6xw8bPS8dVLIoP35
         5kxr+DYfMKc7wK+DD2/2Alx4reQ3th+0ibDeYwr3m3US6yu+R04e4DsRrevXOwdRZZhT
         6mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831920; x=1766436720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URoUYaduLCn0x2dUSjsAdtUxWNq54PTEwO8tMWNDZfA=;
        b=b6fWu0ro56ZHJsIZyw8rep/IIRXSnKHt7HI/yfRlK+mGsKWBsimhDoJXMVnIX+8QZR
         67GR+THHtxehUzURb+w7ime4O6sIwfdAWQ5iq9lCBDbFh+1C9zT5yYLMomsP/PbzkKja
         QzoG5Ej7FBBpPjv5pnugRd3SoOiM3b5hcvgZbXdiH8HlpezdL0dKuwnd7H8oL+vozb34
         8KhuDWfIb0ni2pmShpYSyt8oCt8MCvWxPBBm+UL5W+JbUSIiKW1bgO73goJHgQfxWUA0
         F+40D4gJJDjD9ogLiMEUh9S4WH4Un5lUgknCH1v+9URqtiBIjwz8SnHEudXSb2u9uU6Q
         3saA==
X-Forwarded-Encrypted: i=1; AJvYcCWiVgn8QVfIU3L+SGJ1mZqR+CVvXWuuoqQfeBQbaW8RdEg7Rb69b/oiHw1aeJGDP30u+59NlpLt6/mnLX4s@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMSi6BS3MtzpgzNuPfZQ+Rt7AA28Di1IKN3z2Da0J59Tc1NIa
	Wx6y4DxsVAd7kNBZg5iSFQDXqKAmhpjYkGmAkOooc/tG/3by5PErU3HiPLUd0OOrxpWbxPwMUXp
	CrEGksdwDtKFYEhyjrwzzk7wZj8NhFbRSCXLRGygXB5dEOf73YHn9KmHOKhWmiTYGpufQ
X-Gm-Gg: AY/fxX5NSpvhZC9vpwHHaHgdgrshbq69Ejjz65CN1wAAURigRCg4cqLDWhBC/AB6CPz
	ZIhFmXHMU7Br/ya25HnleSRhX9oGWO78wRQrfAQnCwinsLXT0MK/H8xYlzDM8LYNwuQuGIKZHQO
	qIC7FKkmEkq8LnCyThHhu5k7jP50Iz/CGnJFRrKhMqDkjE6rAuJcmTP2NoesGw+qW190tFlUnbx
	qZo6SiEVoK5Ru5akMruJwYNSF2aA9liU/h7wD3fpgIwOgjHOwcvg3KcWLetvjaWWQllvr9fBcbG
	MXdlrARQjVJPUwOBQqOvfj7oJe375wlKLxeV3+mGsD/nxYn3N1mxaUVJF6zeMkvOLFBd7LbjXHd
	oAkoiTHaYn0hL07yyiGwqPayEdPu+1U+uM3PSiAnUXn0JeP0USVA8DA/yLt9kEHARiTyRCz3+fH
	CCsfcmkWa28q8SgZZOTCpXZrQ=
X-Received: by 2002:a05:622a:190a:b0:4f1:ba52:2529 with SMTP id d75a77b69052e-4f1d0466016mr155151431cf.2.1765831920245;
        Mon, 15 Dec 2025 12:52:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrmVCDKx1di47/aS55/yKher3TMRdYD0wsyKcUHHUgfew4Jd4JKdsKJWoXfLO8d/syZI/kGA==
X-Received: by 2002:a05:622a:190a:b0:4f1:ba52:2529 with SMTP id d75a77b69052e-4f1d0466016mr155151181cf.2.1765831919847;
        Mon, 15 Dec 2025 12:51:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4acsm144527e87.32.2025.12.15.12.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:51:57 -0800 (PST)
Date: Mon, 15 Dec 2025 22:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/8] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Message-ID: <76a7iti26g5kskevykgd4bs7bcqa6uowc56ixdhltt4g3z6xij@dcmtsa35dvrh>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <20251215-ipq5018-wifi-v7-6-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-6-ec4adba941b5@outlook.com>
X-Proofpoint-GUID: hWBtDLCbTCei1nfhBg-KkfqnGMTQws85
X-Authority-Analysis: v=2.4 cv=OK8qHCaB c=1 sm=1 tr=0 ts=694074f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=r_DgABtPT30GZMRUrt4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hWBtDLCbTCei1nfhBg-KkfqnGMTQws85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfX4AtuIQFFiz2/
 DqD5oFXGQ1HZUY+FLuL1Zbkfxvi0uftIot3Tl2Srq0CRW6VVa2Dtzh2BL3yTODCTy7yMpLEIr7+
 z1YGnrEDWjAqZ12/JYQCeU5dy7TzISJW3DinqofJCik3SALP1kS++5vF0RkLo7xLuy65SJ0s2A+
 J7ZrmClVH4FFclKPAXS3vizwDFZnjp0sp7CG0Gnw/xAH4oyTEuFr+JEdsduw/qm0vfu5Dee2+Yc
 YwW3YD5paI5ckAV/gad8VGWLtMIhdeHjG8tv2vfDFHrgO9XtMr4AiW/LGIAswNtpldP6Ql4zOBe
 GjJt7z6w/iYr7aBSxGZJ3irvtB+BLzxpIg+vBvNz5mpB/VrEQQ2i9hQE6fFgBw1HuGJM85hQZED
 ImTd9BGS4I3IVKmE4QTkSopT+kILJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150180

On Mon, Dec 15, 2025 at 10:35:11AM +0400, George Moussalem via B4 Relay wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

