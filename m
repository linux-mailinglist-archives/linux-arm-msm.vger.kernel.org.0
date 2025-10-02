Return-Path: <linux-arm-msm+bounces-75763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB8BB2568
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015D51742B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DBB14D29B;
	Thu,  2 Oct 2025 02:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvRi8Txb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96214A09C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370779; cv=none; b=mBagQ4Ex/pQGlkf7EdHLxt7VHlZworTxZi2mP8AYLJXH9w8jvyAAkLCkaITOHguLxRbkgXm2zfIW/n5tmdB7o4pc9qRSCQyb3DCTb/+d9yB6QXs1bhlkxjjpFB2XlInunX5K+09cSWstTioX32+LPbZL8M9tNhe6SQPANoocg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370779; c=relaxed/simple;
	bh=xhmmYS8ldwgF9fQ7gsr60vedDHtDIGYmWzukO0O0yUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AY6KReQpctvpclaic4JIC8Av25ESFkH4oTaHJvAmV3fmKcRfoQNwwpqYU0Vcw9axZjeTPWdGkeMIFlqdYHwrLLJrlPKIVV9/AiohxLqLzIJ3Lq9w3CUIxYHi1VO7fGXJ4b77KaIzDIVmoeJS2HyP5871PsrwxLMIXF2hAOL+EbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvRi8Txb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcHAY022897
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 02:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NlrjA10uPReWQuwGTVDaUugX
	z53bpDjEyE/kchavb4E=; b=TvRi8TxbgWvgUo1WWy2/Rvo+DOvuAqmh5Vbudg+n
	vwQueuWQM0xHvxK3pIciNagT63m1Ela/+i5u3YBwLtZPijpF8DFXgqgZUrKBFfVu
	CCdu9K8spiW2Tt4gj+y8jzNzGr4WUHA9wPhHPXIYvLAvCmLgELAc9yzS9FWtfThd
	9FMCSRLIAepxmYa7svw+AJpEs/u8y12Y8vz2+spJ1KnjZIxjeA7bXZ0idK8mJ5oq
	nLI56sCsrE5h+CDlO23shFhJzBE947oYglpWgmxV/QHqd7M0u1/ZOz81KKnQmBpn
	2JO4Ov6V+k5ZFEU2AvWP+G16JjMgT1vI+YacIFhVodSRDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6syj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:06:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d7f90350f3so9898541cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759370776; x=1759975576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlrjA10uPReWQuwGTVDaUugXz53bpDjEyE/kchavb4E=;
        b=rNxbeTCGnS++CjShzbJp1NGQch7j7RNMVeDmDa8xeGm9Wkstp3HXYZPITq/k/uqxl/
         BRaW/PCaOlSpFySelQWDq5zpnTTRsFVig19usPS9uFyDcwnpsR4lfnIH/b8mlXAF6CzT
         aSLqZsQanN14ncVlKsutUepyOy5nA3oQB0fNegQlHVwG5on4x2oxtGWneizhhY5lt2ig
         yNFiW97yNdaVnc45MvcVe1mAGl4lPjBvtHSyD0iH5EAPxy1+dHxYUY3FhEYVOWhI7aqD
         0X9Ruhg/DlN+lE1pl4W4i81YR3hULqmWgWAh6fX8/V+UVOXIJ7TUWEqOZ9bvRjE7Ptuh
         Wj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa9+YAyvAstzEM9TU5rfK05nQ3/zRvnZDAyV9iJn39rvGoNwhWYOE/ubvAb09Os7lfIBoeBUAzfkCvYGvE@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZu4qgh39gYJucsTQXUovguSC532ds5J5OzRFh/phu9wVf8za
	Vs3IRxA9b3u1TF2DaXDEPSQHlZkuJtmdta4LisO11/CHzeYXAz7sNoHnZDOhXAMKy2+L0H9jNzr
	HznSgqpLClYHKbr7Pp721kxNZ/uCm3A+cxlrFuz+FEf0rmhOsH9bYk8PeKQkGY/mSmpeg
X-Gm-Gg: ASbGnct07T73ncUJshuZWAEcYN3wx2VOg2Y3d9lPprdfjumJrnT9DsMGKSiDGzLoJ/o
	QHv7i+ti2jKehlPwpwWQpDlgMnr2HSwzlzOfaIw+m5/EbBfy9EAyXal26inbs9I9vAWFcgKOO8y
	yD5XzQm6Z0eABinjmfEQ//R/zsHRiVf1/MxEY70Skvy5hRO7oiZqsbvfhna629g+/y5M4v6FP0s
	HnZBtNT9coglnTyAipjMnfwaAWMxmIwkP9ifg5O7imbeXf1OjCYZ8XuO6vvtHmVG+NrFwqtXrOJ
	Hzga/9SBYJwrEhK8Wbh9YU7uL+aLmWhzgkkOzANcSrq9xEio5XmqoaEdT7W4QdNM0Z+z3MXXvag
	1MvUeOd+ZC7rn1xdCC91+N9CU8BJ1rwK1wl8lH3gQ6KR8JnyW1d1tSYhCaQ==
X-Received: by 2002:a05:622a:288:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e56385cc7fmr27596611cf.33.1759370775655;
        Wed, 01 Oct 2025 19:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmEEod2O1/0uzDDtH9aXoT0ph1E9BnSq1tEA93bbQlG57iNx6XpWIS3N1TkSkZ765Y5FXUQ==
X-Received: by 2002:a05:622a:288:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e56385cc7fmr27596291cf.33.1759370775171;
        Wed, 01 Oct 2025 19:06:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d3e6sm364500e87.63.2025.10.01.19.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 19:06:13 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:06:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 7/9] arm64: dts: qcom: ipq5018: add pwm node
Message-ID: <ya7h4l2cf3mx2to5pyw6ap642xvqjbhwv3ugcqqp55gaq736tx@ksnzcbeb7bvv>
References: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
 <20251001-ipq-pwm-v16-7-300f237e0e68@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-ipq-pwm-v16-7-300f237e0e68@outlook.com>
X-Proofpoint-GUID: iYhbTSUVcifahKB8n3EWsSFjE8nl3Ye9
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68ddde18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=pgNS_SGoCABwbyoThYAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iYhbTSUVcifahKB8n3EWsSFjE8nl3Ye9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXyS9dDBD6ZXnF
 A2RE0wV5qEng0s9VBIrBiid3OesdhGPgAXI2+Km0kLlmx1NxgBO5iEnFFQI/o578ywFwA2+VKAP
 hgEfbJnOX3SYK6KchAvjRCZil6azPEj3ZkUnQm3NYkvVKzxchA5eErdp5Vl3fbtmTxOPkBTreH6
 SbeML6zVbZ/TFI+hS373IABWMOgFZo1je6R31LLsX6ezsfn/oOd+10qOd57XCCPYBd9sd1CxTgR
 VBzmbQ3Gk2C19RvOm4HpokiFtBaVRU1S+XS4j27nESnJvuv+SUJkgr2TDTbMRR4hpVAobI9g6u5
 G+FdD8hqwcTGO3lPmSM8qBPYSoIF3GVbeRjqIlP4gPvWnSRWaRzDzzPYEQBOKwK4ShSWvKFa5s6
 Q04BnCEHqPH13Jt5EDyN7xWw1WuVsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Wed, Oct 01, 2025 at 06:04:23PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Describe the PWM block on IPQ5018.
> 
> Although PWM is in the TCSR area, make pwm its own node as simple-mfd
> has been removed from the bindings and as such hardware components
> should have its own node.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

