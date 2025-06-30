Return-Path: <linux-arm-msm+bounces-63071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A37AEDD51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D8D3B646F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A5427F4D4;
	Mon, 30 Jun 2025 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzqN+Au0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E025A655
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287413; cv=none; b=Zx+2ByklYxhcx816aZZFAAk+eEFvlR2LkBahmfBJxJo2Oyp0W6gAQ2p6EmJGTE85yiHG4gSNWh48r12zjaarhJZTuXxorEqydBDajqovZITpkvv8A+ATkVqmh8iF+eISz3qfuAsOQpRiu4bWhWO4mCg/J8nAKYQxJyCOio2C7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287413; c=relaxed/simple;
	bh=jX/AmnyTXmXRMW43Ube/tbKSQWPvBUKcTNDIPOnQyXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRrTo6E2Qv1y6umSCsJEJFPKjkyO92nwq9HpNtFxu6cBkz+rHhX3Awa2fM9APhZyV9QPewHFaCW5aAj0kJNRox+sT9qBGP4h82RLtBo4UnO1mbnTm+i9ASryQPlmXnfJtrewwlXn7MVHXH5SgK9IkwJdAe4SBo02eljNSdbHo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzqN+Au0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DM1j024738
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LyQZIyqrPdU8CUNwsF+Y17dwiZfR3VxulP5rdlb6Wow=; b=BzqN+Au0hKWVG9em
	usSFXiVvbdiCi+1KDPehzYpnia7drrQxCDGs3gBj3v6+q2xkECWVWGF8FVIe3n4f
	n93W2WT3HlXHmBdoAwF13mIifMlWCK7wsW8gQeTVsiwIV9qlaTdj7bKdJQPqZVmL
	1toiD4+zsFPP/HCq8GvCR58dmp7+6gwSpXKF+66HnxiGeTx06/BZEQTWzeOqyUMg
	Drly0wz5/euWl8ECdw2sO6D38G+aV8roLH4zM/IixjfbzF5gVgPKok/4enM93FLa
	caoEef+McTo4qmfDDLo17LpD8DBqbYLhYS3KocIqrhq6gcuQVDmYKUZ2i+/Erla3
	uknEbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9cr94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:43:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cfb7ee97c5so14147485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 05:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287410; x=1751892210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyQZIyqrPdU8CUNwsF+Y17dwiZfR3VxulP5rdlb6Wow=;
        b=JAuztBqKFSvsQGqAXuX6JZpqMk9w8nqWN01xarbTv9wcjrtLp39bMkfnmUDpPD4amI
         jHFXYuJS3gerWxhibHTj8kapi7TF4zYZRp+U2Coc70VVbPbAvaoEvWWKcbDAOVIZ4T7B
         khWxYZpLEdP2tOaEB6ktz6DVJX5ZPqnQpuCmaBiPLAzGnmxMrTTCledjGlt/N7OzyEGe
         o68c2SpClxai7lOvMxgROdr1djxkW4RQcWmoRYzGSZ8sdHfOZCWDfB0ywZtUHr94OhqQ
         LpFPUe+vpgJZ5cfXuOiv+2uptTkw0VhxLQXUss5S8Fqi6tJ3yiqjk9foY7MsnSXNVscH
         PC0g==
X-Gm-Message-State: AOJu0YwPJIe2RLSB6PzqkY0o30z0E5cYeEadgzEMRBty55PMfGJRT2OG
	4iMhr2hyhqNRtmCYO7vEFi3Ptkz8qD11PCTLHMhEt9u60DrshCtrcgGoNPwOye2Emu1GDEniKXT
	e9+o3YbNJErUom1uyJ+1sStGztU7HXS6NyF+Q0lOBc/hNn1edTP7DDFel330CR6eQOEpF
X-Gm-Gg: ASbGncu8hhJIC0eAsZa+t532hakqdfeNhsUCop9t/m4RFUCJb2wnPeOHZbzYIQQr+0S
	2oQtIqxbKTHH4cIyTursXWZb2mUiIeU0GsSbqoSZ5AiTa7HCnVJXqRjkUJ+AtFu/wOdqoDMBaxu
	kP1GZxIalUqgAP0IzonhQRbUd4gszD6PLpDZXWmo5SHmT5n94T2VUQcLUo6HcgdB1Kns6+uognn
	b/6iMwGVo8gi6L6PNASd7RcToXFWi1hGSggEfehtgfqLuQf5MefD2Nya3UxV1hilP1VtSyX5I0q
	Almg5M5KVllrr9nNuxmNa/AvZw4FHFC6yy17d/06VE97akI1DHeIGBrSqlrhembWs1YBzOkWlWg
	9yH4g1Sim
X-Received: by 2002:a05:620a:1911:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d44c214b76mr509667985a.5.1751287410072;
        Mon, 30 Jun 2025 05:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+9H7GyJO1Tgn7URrH450skC1FcVFfpRh/HH2LooElNcKzAnTRx0fRWDZsl0nEZJM09hrdNA==
X-Received: by 2002:a05:620a:1911:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d44c214b76mr509665985a.5.1751287409624;
        Mon, 30 Jun 2025 05:43:29 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36ffe2981sm457103366b.120.2025.06.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:43:29 -0700 (PDT)
Message-ID: <1309f269-9b52-4f0c-a463-c4e5ae48cdd3@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 14:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: scm: take struct device as
 argument in SHM bridge enable
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
 <20250630-qcom-scm-race-v2-2-fa3851c98611@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630-qcom-scm-race-v2-2-fa3851c98611@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68628673 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RNNxD7A6MxM0MKzNLocA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dmvPX9H68McnkwBoIyQfIIuzITGMCerD
X-Proofpoint-GUID: dmvPX9H68McnkwBoIyQfIIuzITGMCerD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwNCBTYWx0ZWRfX+JzO33Ua15Jn
 UuN8ugEQuQLTnXGQwuXn/fOJ3uFfbSssspYBHC1egE1FGbReLmbpkJy01KnpQzQr26Rfu5ZtFxd
 ty8+5tj+iQ7d3KKZvvxGsWJeQTPn/UAppqZretCko/kOUi+ssEoXtGjBEhmswMWdxa213dMwPPP
 RcbHAt9UL6bWmuE7/dAqdCL76SLpP5zZ0276KP3Ua0ELTIDwXtsmTJCWukDYAXCPxIrWeoqcJ6Q
 M+YmXnpIg7Mq0XYqmFMrfMqQMBKShBqXm5aog3MzuDWcTZ+Cm/OpMn9DOYzag+XofRmrFo9TBH8
 SIguDhYpLbI9Mip/MlB+2eV/2w924+SUvtH0W/lIhFPN5yjHfSR9nrnJob4PItsS2NpWLQ7OypZ
 77QMQRsdiwPxMUZ8bU98g6VSFLHiOG32Gvfib/0scK0dySzsVj+lN9+0xWX9TIW2T/vyvnn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=824
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300104



On 30-Jun-25 14:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_enable() is used early in the SCM initialization
> routine. It makes an SCM call and so expects the internal __scm pointer
> in the SCM driver to be assigned. For this reason the tzmem memory pool
> is allocated *after* this pointer is assigned. However, this can lead to
> a crash if another consumer of the SCM API makes a call using the memory
> pool between the assignment of the __scm pointer and the initialization
> of the tzmem memory pool.
> 
> As qcom_scm_shm_bridge_enable() is a special case, not meant to be
> called by ordinary users, pull it into the local SCM header. Make it
> take struct device as argument. This is the device that will be used to
> make the SCM call as opposed to the global __scm pointer. This will
> allow us to move the tzmem initialization *before* the __scm assignment
> in the core SCM driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

