Return-Path: <linux-arm-msm+bounces-71851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D89B41EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199263A74CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC272BE65B;
	Wed,  3 Sep 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy5pIQk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1A284662
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901797; cv=none; b=XhUpKrCLSuNKZeLEdIBqrOyG6w733GKuH7ypXzn7/z90igora95W2xmTiMzw8irWlQ4zLNGIi/qgrl2PUCE1l1i+DLqvVcnxf4F3jgVg8z/0HLJfMabe4nMng86h9LMiMkP6IAfWSs2A2yWJ1k0WQ6aM9OtcLjHRktU88XFL+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901797; c=relaxed/simple;
	bh=cC0aiuuE0E+2DpdlvkGHD3ARHOLa7nVcin05l3IEh7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twkXGDbnIeU8FkIGz00iw4itmGXdlbSMBElH81THmar+uUrLiRnDwYS0CHqyZAv28lUb6FCV/FuUZWSJr/YoqlaC2JJQDpp3IBR9X5zKiukJsXVqksdHNrrWKqA4fa7pXItIaa8ftUYNn7p7tfOGMAvBGgbdkRVLh8Pv+zalzs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy5pIQk0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Ba9fF025178
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vn4mwhUMj9kw47ypZhCXah1sPzLur+fBXwYhZMjbZk=; b=jy5pIQk0rhPvXaY+
	cCha0zTkTY+5Qr19y0ccl/29FzoPuVV2vfq0FxWpzPg1KNH2fP728pAB5ctzTq02
	Vd2QqOSZw+OyxcGv9oXyvBuqS5jEBMx7mPQFRT6WfgECu2n/Gr/LQ3l2XJCO8APB
	lPxljbQDVVnLf1c/6VBvlZFk9fEdXJ3qGKGsGXvaKSFeMCPgZguN3UDaWih7EdT7
	ndTQqdUgquq43MAd/dErWh4lxVji4a9Xeu6iazj1z/QLEvBJIyeWms1enFwFmjpl
	bUR8jspl2hiz0wxIyLTfnVjgvmcp1ujUpxAQTORNakBhdZHnChVZ+Ey7379aYUXk
	vxKe+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0478-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:16:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70fa3a30f41so6567426d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901793; x=1757506593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vn4mwhUMj9kw47ypZhCXah1sPzLur+fBXwYhZMjbZk=;
        b=PzRHsOKiboShTqraWBCG9fcrlTTddu5+N2kSQdei7YWdZSkc3ymw0WGlVe6d8xWqJj
         LCWNQSIffqfpuQk130U+4wjDtmb2NvDFi1y5yQ6wBZZTGa6UxB+2ozcekrqSfCe/NX1j
         G7LDUcksx8JnswuAGqKafdk2xBTaAZRAnHWsHQa3m6Ni1yfQ59WB4rh55MQ2e4JjKfk/
         fYr9ruGmSQlYsH3Lkp2hJlp0mD5BVOtSsePPP4FuCzvdVLPZC3Dm0mCZ85PZxHK5pCXc
         WtjWcmIHsbyFRgRgArV1Cyr4zsKwCiBvsR8gIA7fThcHAuQCxyVUbFh5X+o460xWaQ6D
         lhig==
X-Forwarded-Encrypted: i=1; AJvYcCUhtpxoMpMVwMVYeEaqp8AOnnkrcr4bG4VVQuQxbTZ9SZqJPIg32nc1hTQxrmOItB3cPh/OEPfP+ttfGm4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzYtU37mYkx1Q+qskWo0emYVClkQPVagFAglIqEWjYSmX7U7uT+
	qOxETCiuJRTnClqTx5ulNkC7c+ywg/7nlpBjYkbtpYKo4AL7QaK0yTmOPdWWoQiutR2HUVZi+dP
	nPhpqeYVVVxV/NGrg3+e0tU1AR5Iy9kUH1zsVmbqVgESMVWdKf3OqRAKpGUFv+osa64yZ4KhgnN
	Eu
X-Gm-Gg: ASbGncvNdieHoumhFxl51hrOEbfzVSiiGaz+AQkxp2RZCQQoZV3nqvFiOo59LdsS/3s
	T1wz1R9Tpu0n2olg015XhRBqvkKoXgbPmtDeTG2UjVlO3hdyWuvIbYFNjny/7axFB0LvdcZMWuH
	9XVLMQ8z8xKySzuy7R+/t7Mq6mr+NtZMas41IzLrNbXRa/mpxc1F9sN2BjMbG/1XJpVw+4Bkw2p
	LHGoicjR6Si23fIHIkWH/qizyRAPufH8sk0sMVzBTtZxuaQSZF3RwUlsawWCLl26TVpppeHZQoq
	kB/El+PSUQvdMEJ491SVYqBTVV06tjtKxNxezTij4Dv2vFN5zK9RD0ej9FLP0HnJQIT6dttP2CG
	oeKQtlBFp4nabQUocvJ6cpg==
X-Received: by 2002:a05:6214:509c:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-70fa1dada4emr132004936d6.3.1756901793450;
        Wed, 03 Sep 2025 05:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsHxz+3HO2KA7aO0WYCcwzAJIdCm+RcRd6sRVZbTR8qPcb7vM9trhlNh+9aPhNhIf6qPjJxQ==
X-Received: by 2002:a05:6214:509c:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-70fa1dada4emr132004686d6.3.1756901792919;
        Wed, 03 Sep 2025 05:16:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7ed1sm12115926a12.1.2025.09.03.05.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:16:32 -0700 (PDT)
Message-ID: <d40c5ab2-2195-462f-9fd4-8c519a43f032@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
 <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX20vRaOVw+Ldd
 nrY0IHr4SsjazrxvFLo8duoNmEegrNBzfZQud7Ag1rDQ5Ztr/JDAtYUyt89HXYcM2P+dUZ8yofp
 QJoyhW3iWH9fouuqhwsjBuplkee76VnTfCXkoBWzcEhlbtswNgDHO9WRcMMixQ+ydlnFiuJTUsZ
 QPWkfwvvczewBGHIfHuRWcAIXyD8EYsqxwTOsXEZm/hUvX/bBrYpgYrCqATZTLbLXqp2b8tLuz3
 jjqOTF6lyaXslD61k5WCS9vhZETbvh4NDQWFYSawbC8Ih6N7PiuFSNq3oi46zH5SDxCrW7zK3kV
 YSW2cE2285H7g0Qjshmcc00ZGKULj1IBiOmccZ1m/jLaDmLg/VUs9DuN0EZhmGZA/cBBjrLdNbg
 qjPzuK2Z
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b831a3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=McB9vphyiCVPsmp0I2cA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KgL-giQkEos2jImg9OUXQSa_6vb-D-UZ
X-Proofpoint-ORIG-GUID: KgL-giQkEos2jImg9OUXQSa_6vb-D-UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 8/22/25 2:09 PM, Wenmeng Liu wrote:
> Add support for TPG found on SA8775P and QCS8300.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +#define TPG_HW_VERSION		0x0
> +#define		HW_VERSION_STEPPING		0
> +#define		HW_VERSION_REVISION		16
> +#define		HW_VERSION_GENERATION		28

Please use GENMASK for defining bitfields, avoid tabs (just a space
is fine, perhaps add one in front of #define to denote bitfields) and
use FIELD_PREP/FIELD_GET accessors

Konrad

