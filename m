Return-Path: <linux-arm-msm+bounces-61475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122DADB57A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1565A1612F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE66213E85;
	Mon, 16 Jun 2025 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy9vEqu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479823BD13
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087965; cv=none; b=lmeo6f7dvJMarGg0hmWLphLKklTYbmXq7MAS77VU+8qZ2hqkjt9Q3Ji48JvDPRhrWPAIABWZV6PCsDjzFENfnr1q6Lg/ymHqpZcX6MAGD0A3qRkDKX0OdJxqujhZVlLQ9XRdpYGUPeBVP/XIrWYWAw0BesHVKgPimfgerbXEv1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087965; c=relaxed/simple;
	bh=kr3wYg3rZXyGtV3UoD64twSnhAcaIs6q1DS0t2r5w+M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ71sXolwgqHiRVV+5ChCUyWZ2ZELlvT7+wc6Z0Llk+cJ6dOvXfikgsx0hsWI4UredDBXKcU27SJolWx6xUDKvOK9CT6Hzt6gi8ATg2+QWoPlOz7bkipFQwrg6ABD9exVOpcmQNWeO54mDft0n3itOfY2P/Nlrfquwx5W38Kj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy9vEqu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8kF0e024998
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MjWkI4SFpcOt65w9qps1mH2t
	kuW75zlaOjXPIX+Ab8g=; b=Yy9vEqu+A+7G/i/1z7equHhRho8KdNStsk62HkXQ
	fultMqHPiPlimkrWYUS4NVhmK1/Yw8Ax3Y3GcmjzROha4rRajy3LTUO/Ldqg99rX
	BNUPx1kGK/wUThCIRfpY10aLJsBkpRBc+cHGLYRSXgqB1LaXRnGXhr5unvoQaMPn
	dHlCfv4kSaUKeq/VECBi8IVS3hxA/AMzOKSmQYbsRbXo6H1aFXYRv7VPUSeLtaHj
	CkRFnJ3qZ+ui70mE3idLreIW4cFJ11nY7pPF3Bg447IWYTlQuibs66OUdRPOW6u0
	ztbd9vLCV+MrjwSFioCwaXj1Y8EEgVR9XVInwgKj0jyLyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsw0p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:32:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3654112fso84731856d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087961; x=1750692761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjWkI4SFpcOt65w9qps1mH2tkuW75zlaOjXPIX+Ab8g=;
        b=k8UhD2fuGAV3et9eN1iknYNagMN2d+V5VJpapRd+zlbN5phaMk9hIn2t8yiY6Jzjqu
         6XpWMGuhKwNCJ7JwrqJULL/G1u/pq88zHEN7zWF8ZgyEfuiRGyRcYWx9mgzZHzqh0lYN
         oht+ifdCB0kb92O55886MXrBGS99Ztf8NBiGxQTVqdSgq6ozS5OATQvcIzmlDhcZamr2
         GlMrtLTeQQ3go0Iw6NMjRH8cEP93GEVkW7ekT6kNqeZJHFr0FknHpbAPpckYlTei45FW
         984Y3Tqlk1InKs8FiPspx1lApeHguOyojoyXC3HKdvFAGJms7BNqGERGFVcyqpaun2ke
         67Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXe2valdQCcrgOf2SfmJkeQB1IvclzP0Kpzw9O32C9vLgyxjZ62iJl+EJ/N5IYrYgzOxCMVLlLOIt4xc4P/@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwhhWGfBKqpYCvTS8k+qe1rMjrfhM1toWYm5/VSz25ptjUaW/
	200T2tQlTdL/WGfXFnnR+5ROmsPhu6Ac8Q+Rk9CaFpfOH+4iBgCwchUlokpkmMHttgZp+MfEuuM
	OL+NxlRG87A4uIf4g37cYWCMw0FeDEk83rJJnC5bmVhTD5xQX9HVpDKFbBgGk4sKs6vY2
X-Gm-Gg: ASbGncuvUV8TwrdTxfEudqBo2r41aeS2/APPDVBFdUYTVyknG8nN0VS0040Nu5srxOv
	F8NkZb10RLVnIoNsCkDbX99C1jgK9FOBpPr6olmVRtd/D6XW7j7q8szEiMdykwMK4OM8B+wCx+L
	25LgvPZYOzymBXldfMXoUR4n6eI7x9wP/srtJ/zF2hkzosPA33pk30ccvpXpe03RcyNnmQQjhsw
	JPz1clSLVmyN/A9UpgIl7nZti5Jq4jlUkBo9bASIn5uScbsWHox4pwB0DesHKu4qElSZAkqwME1
	e0+9V1BcwuS0CWwUvDlTestsuT+w9vmRztK3GMi8FZuEdGDLk805tldPMg==
X-Received: by 2002:a05:622a:1389:b0:494:b377:a77b with SMTP id d75a77b69052e-4a73c588d3cmr159812941cf.27.1750087961067;
        Mon, 16 Jun 2025 08:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+R0hwCRZSDz8dr59ev73SqBlCbBIcfKtSFASTz3f8rP6S1y9RE9rYy2jqtrzZS+XPKB9+SA==
X-Received: by 2002:a05:622a:1389:b0:494:b377:a77b with SMTP id d75a77b69052e-4a73c588d3cmr159812081cf.27.1750087960386;
        Mon, 16 Jun 2025 08:32:40 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532061c49fsm126142765e9.1.2025.06.16.08.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:32:39 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 17:32:38 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFA5FpJPRmJ/ltI9@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMCBTYWx0ZWRfXx3HAo7peWFCQ
 sfxZVEmBSN/aLR6s66D5WsZPTt1UZfXcPw/GJh6Jhr7Ur95TXzGjrMD0on7RJBSvIofBTob3NdU
 sbcXBbsEv1lfRdJyoktNLYmQhAu5n68NLjXNUwYMEopENsHo+7aXAbw6aILR0SEKv/1GElE8WlF
 RVKIsKFLxRDybdLlDrph6FpMsRCu5+EI5ta0j3gp5CvliU3B7J5Yis+f89k5FjocXkz0nDiMPjJ
 oW/r7tJM7gHstERfNRDnEMo0w9PaVn7e3vV7wFCERij4NVCKo/w8ry4Bcjh8HQpReH9LdkLJT6K
 8csL4mR839xc5h+YlW5ozX5GVVMwUak5CxCu/SIiRg0QI4Qxe1zN0ebkSxEEIpxI2IwbOzbiv3K
 kTwXVuBu/iwviwLDjNid+dfn/SJgSXGfBEhJo6Se9hQ6RQCChO4v4xcdDi68/2SD7JacvAZi
X-Proofpoint-ORIG-GUID: U3dDqcv5jJ01ZTEgbjv4Tjuhm3BheF5G
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=6850391a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=5inwfkmlzAndmB7UmJYA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: U3dDqcv5jJ01ZTEgbjv4Tjuhm3BheF5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=992 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160100

On 16/06/25 20:14:36, Vikash Garodia wrote:
> Hi Jorge,
> 
> On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > On 16/06/25 17:26:24, Vikash Garodia wrote:
> >>
> >> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> >>> Ensure the IRQ is released before dismantling the ISR handler and
> >>> clearing related pointers.
> >>>
> >>> This prevents any possibility of the interrupt triggering after the
> >>> handler context has been invalidated.
> >>>
> >>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> >>> index b5f2ea879950..d9d62d965bcf 100644
> >>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> >>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >>>  	venus_interface_queues_release(hdev);
> >>>  	mutex_destroy(&hdev->lock);
> >>>  	kfree(hdev);
> >>> +	devm_free_irq(core->dev, core->irq, core);
> >> Could you please check and add the handling here [1] as well ?
> >>
> >> [1]
> >> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > 
> > hi Vikash, sorry I dont get your point - what do you mean?
> IRQ need to be freed even for error cases during venus_probe().
>

but  this is what the current patch does (venus_hfi_destroy is called at
the end of probe error handling as well).

> Regards,
> Vikash
> > 
> >>
> >> Regards,
> >> Vikash
> >>>  	core->ops = NULL;
> >>>  }
> >>>  

