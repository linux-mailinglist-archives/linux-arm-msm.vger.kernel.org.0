Return-Path: <linux-arm-msm+bounces-59241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A298FAC28BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 966D57BBD0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D06297B97;
	Fri, 23 May 2025 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+b0J6tX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158729713D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021660; cv=none; b=elH6tsVA8sxDv9pllewu22RmRbHfzbfos6tyMd2Qfpv6oMk07CvWswbAjKooGuzGg8f2pwOBR9FGyl6OjJjDfGb+qpOXhMKIQqCMGpfBzNBRsZFyl2o+OLLFBhaYnOZkC+NX03hBLWJDc46/cZVw+aSnvl+9phVP+LqR44XsCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021660; c=relaxed/simple;
	bh=R5hPgr8g6KF4vV9/MNI6Uvrws8BZ2MQ56xJgfpRQ1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAETn2G64xm6gqOIog7D3QyyECIx+vPKzImAnNdyBWSf/8Q+rdiavSXykoYAQkRJMc/Y8rrr884pRo9+jdF2qr2nX34ysHdytn2wXp2mOOUtNA0kAqP3RUnEu7EAArlKxD1SFD2/JAKi4p+hmWyoF+hvroHs5Yojhk1Z0dyUIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+b0J6tX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAkvXw020640
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gMc8tnNtub36PEixyB/6BFjb
	qupY8X/snLnvo/lsW5M=; b=m+b0J6tXM0t+5Y31/71h1MUu94AI4yg9aVWwXaPV
	x2zAHhN8TEob9doriadqXHYq06+6KFKHOA4HQK+OcSBydLEomFIt21SD+7wt2yEf
	LdTgdV9ATSux5ILgeBaQz+wkS8jhEo6ZXQywoxgRbBpo0LGWCcL9qitahdqmwvsx
	jBcnS8Zu4Czh5p0fdLrgqC62xAprqVlG7N9EnnEVmPHGI0ZAsVU63YteejNhGTnZ
	8dSDM+EWPj1sf5nkRhKER/Oj+mPaLf2qx5bgroUBFbLGpTOe6A9i80Kw5XD77y1p
	sgmjjmZO1kb1TWwkmQo6ahssu/H5egq3HM6+yt07/GkMVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb95bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e114ef64so1404906d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021656; x=1748626456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMc8tnNtub36PEixyB/6BFjbqupY8X/snLnvo/lsW5M=;
        b=AM8FC4vh6OXVaige+NRP9KxoQ8KXcDlMdUWt1JSL3POWCCeguOah2ahmBLvyfqTfMZ
         9jjLqmOpYOf9Cp+D6HcsDm5guXAPRYa7F0L5gvNYzfAGWlpmeu9IFA5n5hpmAzHKCRcR
         nOLF57O46tWTFT/kAU/S1tvCAenphvFxeqPSfx7azNOt6UFdO3wAr47By8bQehZpQ/Hi
         aSPbTBhLsJKAxtKeuwZiJHJAmx/B/GUCVx0XjUFRvvPhaTwhwNiGybhkxIyC7yIh4P63
         arMDHc+wUHG+sICTJrHtRmMvkIuERY8MO6WfrpigFZ3YstnjLz79LA08+Rm52DBqB3cq
         xa3g==
X-Forwarded-Encrypted: i=1; AJvYcCXUowbWCCpCUa00+i9fy6WqNzxlX0DDhzgjvU26uZ0XzAodE1VNJ2y/fzTv12R26O5HPJpsTGsgU7B4TSoV@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTuZyPQ0/O+TpkHnQADjVf3E2PgSieqwWJBCFtJLgjOhW2Ike
	8t/rp+v1novcX863f1mT6n20TU0kxStfqU8fAS9TOWPLbUAdAGhv//fXYlaew8fVGse+UyBsOnL
	V4RgcGZtpO0lmAc5ebqYfgc8b29J4mL5XcUbk3GPomLi2eipn7m2X5sbJjcSE21vkDObg
X-Gm-Gg: ASbGncuqTJmMcfWpnOBOWr27MqBz/enGO86PQIUaCNn2AurwiPnr7q3rCQ9QO9ycpII
	SwHZh6WoQLNr615gdrnSPuEVbhTixQW2rRvxEEkvhJxYAZWDLQzRQYhKEF7GnMjABLIB2AW/exJ
	oPXiP7h3UlsEBnRILscSqqKCtDZEOSvzhA191R9FRGqoz+0opz0HqL6m5SH4jLmfITy7gz05CAK
	5uFRDXJwxEM028CMAZpKso0pCH/4+sffjyKbXE1c13nrTOllmIuzZwUdYhg8du7lzCpvIC9Va4W
	WKhoTgCAxaSx4cHhqNGTVBz4Ki0We52z5jiu7IBqZ+TxBkCZaNElxvIukoDUqKtv3ho6xqMQzqA
	=
X-Received: by 2002:a05:6214:2586:b0:6f8:f1a5:e694 with SMTP id 6a1803df08f44-6fa9d34c88bmr4703936d6.42.1748021656353;
        Fri, 23 May 2025 10:34:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcfxuoSftseURZRDsLe+y4Vv11HBXw7kl1X8xprRtc28GdvrSX2JxAnsHDAi3vNm+Nwvs1Xg==
X-Received: by 2002:a05:6214:2586:b0:6f8:f1a5:e694 with SMTP id 6a1803df08f44-6fa9d34c88bmr4703596d6.42.1748021655973;
        Fri, 23 May 2025 10:34:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f23sm3941283e87.118.2025.05.23.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:34:15 -0700 (PDT)
Date: Fri, 23 May 2025 20:34:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 06/10] arm64: dts: qcom: sdm845: Explicitly describe the
 IPA IMEM slice
Message-ID: <achy4wt6dqamghzwydwvogisljmfe3bgt3ku663mengoxf5ers@nyti7qnrkyam>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-6-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-6-f7aa94fac1ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=6830b199 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BMQiLzMcCAhL0mC9dAoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: scwmeQ7J3a4qmvC2DP476vjLu7EgdEC2
X-Proofpoint-GUID: scwmeQ7J3a4qmvC2DP476vjLu7EgdEC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXwE7RhJMrv8N6
 5Ij5DjPZ/YyY4fqbaF8BIxc66fJqaLs9geM6LB4xNVKfr8Bzp2mOu+Tz85XeYHgg06YXtjtyAUO
 6jPoDGqjVFpO2f7bxSvISkGrx3XA9lxLqTm4/05uE/Kh2rsEX+5GAW6mRzBdumtUrkbXnJgZHK0
 PsYud9uIRCxd7IgWsGHjRqLVmgG15pAFWmjOBszSbOf3hbIVknhf6Ux79892L4/DyVvL7w6Fx94
 tLMSEU5TQ/GOMRl9gAgRqmeLv3VSoPndy5ijqIxRcszmMvsAHIFaG6fLhk/DGtib7JKPyqNZkWD
 R94kv+VACPs02pwLqB+zsj483c99tH++XBREj3lVTK/SPwJBIJd7hlLD+4GNKMcegJ+DKqBsh9H
 uNAMZmZCaQU++skpC21USvMYdZFXOZebh/RgdZsrWrc6RYHTmBWBWJCXpEyUdWGJRyBz9n3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=733 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:21AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

It seems yesterday I was blind...

-- 
With best wishes
Dmitry

