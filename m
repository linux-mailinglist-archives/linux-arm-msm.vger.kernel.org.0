Return-Path: <linux-arm-msm+bounces-77114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B01BD837A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34AED3B7DF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C959630FC17;
	Tue, 14 Oct 2025 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bakM4bGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31923305E00
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431160; cv=none; b=DWF/1PonSDzujwbobwvD5cusOYlBT4pj8+9PBRE2TA7rdpjbQTqoTKJhSuc62n0x9ODvufzG1MpEcxs2vZTklmpi1jksrFv+tBjPnBzvFMrCo5g8IRwmlP9G8bvT5RyLWhPgTyknOkpitbUnt8NjITDEt1j8kyrTxH8aw2pbTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431160; c=relaxed/simple;
	bh=XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReZgEdaiFFts2UGU6ODVzJvzf/48oXolQ5tYBdl1zRmHwXW/vEtCsXyTP9/NDfjetVmX2f0+WVH+BUdYcCSXH4h1llKDk783e7Z4Nm4Ox93Cc6ONwxRQFuTrzlQfDmhr/oe90aL1sGHp9qhtMEIOkd9j7KrTs/fuavLwoLv2zOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bakM4bGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87HYl008997
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=; b=bakM4bGwnhqE56ni
	FeuOlkgxdcpvxOGbaFe63Y5/ik2ItK/rsC/iZ9asTZGV2WxDhaG7a7b2VfrA5091
	bagqKQRFOLGW3+IOFPsaL+OTO+rE50qtGFjCcB6cgsv+EMyOWhvuczuWZtjO15lM
	l+3sy6oZm/TdpcOrKqn+XQlS3iZ17VK2jb21pGb1L8SJgAdDLzYsCfYwwKYFAL1S
	ur14r8oGo5y+S+8j4r2W3myl0h3YHM/bj65Sx7d9Phj8vhRoQVrIfyJ0eRUh//5p
	L0b+7NkRbjCkLvrpsxOBnt3v7pM7TXti6TdvfM1gIL+6jop+15On8LVheq9W5USh
	PWI9PA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5fstb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:39:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8572f379832so237248785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431157; x=1761035957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=;
        b=i4uXnHUv6H/U0OItnL3swgloTTXd0ax11LEEl6tvBQGTL6vmvGMEOwj3ECivNEfnv/
         rfaCfNI1Uc/cdxYH6W/i1fu93BAbFd3feRmTU7btuo/P6a36EbTfQYx587jTa3Y4IOCa
         u2JG4eXciwO8rbnRzDAKvkgh7tJKlmCF+0hbUCS9CLuA2nfJ11JUGeM0dNGC2boxuPWq
         qEc9ChIWEmYkKjjLWq0sKznH+3GFDb0Kppl4hX5PM88dcUFIkLtVmmGMyflwFyCVyBBV
         63onFAWd4qwFalCYlp5qwfZhKMAJcSYA5H2P+zR5rICr9udxyL33YiJtaNLY0SCpfYs0
         emuw==
X-Forwarded-Encrypted: i=1; AJvYcCWeQxLpHGRghEUdT5FAW7jEap+YcucEr6dcmi19JHTXEF10posBIMYKMjMuS/JGEi6Oqro+stj0MsN4tbTO@vger.kernel.org
X-Gm-Message-State: AOJu0YxMeXo3/txm4layT4CEclshlDalnaRJSyjmDmYbNjmFCFr0WHU3
	9F6qc9Ul2AG/axiSsvoKLS94+qoF8jEL+ZLtLbqO3MvwVdMEYqG0C2ZUEqSah2QOks/DUlJyG94
	6LlfFbYXZfaJMlUEJkMwlAOAlQp53cS+1vSQcZVULZ8zr/2HDhwrA18z+N8VKpAAmENEc
X-Gm-Gg: ASbGncu0L63rOw2hIC0FY8PhsfW1szTjxLa8mi0FZ62S3WH7eTRLes+E/VPu5XLpANm
	WaJW1pmfifa/+ijpp1qIrUgCJpKvF7YW3zHVUm7l4rxtAlaaqi2C7xrOJ/E7s4jwrL6ljt/VH7m
	HndjC/0shWiU8vMBLUU0HTNYZZMpK45SArxtB5JDvIL2chSIqjOMQzRzLYIMR+LL9GT3F8Twg+l
	CuQXuhs3pcRJV3znohHi8yxiEbCaGTjhXfdcUZC6htmdTbnk3QOWi6yTLePin3F4dBRd3c32s9O
	QfK/pOLWAxY+wBSGvb27cCpmcUTVTc+PzHuyhujd4Ww3oVudoQQ4XeJUYAh8cuQk+Gwa9yvNIRo
	VioIYzp/rYiRVVYr/wHAPGw==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr2150252585a.8.1760431157071;
        Tue, 14 Oct 2025 01:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs03gxOTucfJD318MQusKqI0i9M8ELYP0sgEDzUnWm+A3z95z7XK1SLROs1Q3XvpkX0P8Z4g==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr2150250785a.8.1760431156638;
        Tue, 14 Oct 2025 01:39:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacbeesm1065879766b.15.2025.10.14.01.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:39:16 -0700 (PDT)
Message-ID: <78b438ca-93b0-4213-8e42-60d13fbb310f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u4X_tIYYcdP7M-M87J_BMWiOiXGAty3D
X-Proofpoint-ORIG-GUID: u4X_tIYYcdP7M-M87J_BMWiOiXGAty3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX9ON2OIOgaGlh
 unqEAojirjsvZ9hR+TbnO5i3rrzKAtGXdBNzFP7dqjiwZsXVYpaj3asfYOCxKf2nZBJCA+VYeRD
 2r5xvMxVu1Z5N0v/VDdjVR+tADcmIlipXVfLS/IczQP4gfyqtDXke3/tiJSevNYHAigzP07Ed43
 o/nTlFmoeYuGuDOHKv6UKTrubNdqbvYdIIMb67nUrzJqGsKRp/V6tygBMxuWMA6/x0WAvb6+l9e
 uQgbRV3CvadI4lA0qThvbu4kcpwWvzABFY+sKITNWryRi5FSe3DZ4nyPYEeI+dKg5mHCr+Bk72R
 XhVX8QIR9MJVarjcstJZ+trx97bRhyZdNfjgojkasSozJC7h0YZjl+RDKJL1uKtDsZtZQ/+RM2k
 LvDhPnGqBcdvCb5wCJSwQZStYXDrTg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee0c36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/13/25 4:09 AM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.

The last part is a little sneaky.. But I think it looks good overall
now

Konrad

