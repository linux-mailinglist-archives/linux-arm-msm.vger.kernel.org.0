Return-Path: <linux-arm-msm+bounces-62774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2AAEB79F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8402562F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B982C3745;
	Fri, 27 Jun 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ+fTgri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31592C08C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027080; cv=none; b=M0wjNix673fX31lY1kVAQbA5XW6pOko3DVr/4sZhNkPvbgFgd2YOjLWGLQac6s0RJ3rikTrTzNVmCeaSOr9gicFwYYf9H7raB7RY8b3K0m/Iedz1pDr3g70Afd5xmSYvxub3xcEFCh62HQlWo0KZHTZkXGZxXH2+sofoQXCxWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027080; c=relaxed/simple;
	bh=s2JsTubzkGX+c2plqsd64lsgphIlEiCTvMimy+JuzV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W531m243StbLzYkzDQw3/hJikpXIgGEl+6yJMz8TJTabfhPKI5mO4wCqLXm71v21Jk6kV75vGAOz5PsTMs+food4dDM7WGUokEsjvEg5XoGwbxMv3hT6XxlzgofTcAxPnilP96u4mD86G5z4lkv5GnrKaq2LWsIxRR0JFhdn8as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ+fTgri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMRne009550
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=; b=JJ+fTgriwz0VWkD4
	TGhjLeT5Fj0T/hdUlqKJxpqS93Kdt55rHzNGtr1voxPIiE+NS/2Jk+ucHeKGkAP0
	jJtSB/OHtE5OoGPDcmPMaE0s+htPTehJNfUutP4vX36IXg4j+fN5Sp1j55bm5ZTy
	hiRkGkaRVkst5tCRpHlTtAr2jQ9P0GlL/XePwNrMohPpxYiJ47bFUD/p19Vf472l
	kv9u5u/ZRnLl0wfeH5W7BxsWO3O/3S38jmVUWbQn0k2p36dq/50+/BXHyBj5OSOo
	Rw8+vMrIqEbYO1skNEx0pso9FKTsKWrTLvnN5EjFzllpKzBjgw4L9kJgUON//uQb
	xOTWCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46qjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso5449246d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027076; x=1751631876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=;
        b=gEHUY4s3HYGQeP8lyg56HZ5jbvL7jKaxPfIWztts6cfR11o7mbBJkD+opRfp+ABpTM
         apVb3+9xd3AIF54tVHwyJo+1BiIb4uFQXS+z1PhDu6aCLh5zAURzcd2XEfjta2iLajXU
         3cdHKYHDHApxRZKPU/roR7LmSXC2ZJZR0a7qAyL+HnJkfGxp+heP7TopNhBIJJgonp+D
         olwDITEHrZG/YTi7CfMvvozLNCoZNmnNbCZqwyg+VOM2P52VjKeQTIdaEXAxDmnePJeM
         8OfsSJW6YDGghleX5F1CXXkHUbNy68u1ZhWLKbOOgulaulaahGT50JjYwHvRZN/XRE3M
         a/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqh0W9laTBnzSJH0OdnUBffZOy3Yh7oVYxFirFSLGpruh2oWPrVQOFM6EuPHSfczxlW1UOVHXe35TYgjq1@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1ySuMlsi2+E6yV7Ilq6A/Mo8qwzM3jHuLKeMWwJFnAo8mz5N
	JhYyTXdLp15qF7r+r+qwaKtVoZRGv/cV58lFCtCKo5YWB+Gdt5J7PCHWwLJooTe4iCcp7P1DbTZ
	Sdgls+ug5k6y1uDqb9Dlf38m7+v72BpkodvCR+ixKP/3eV3amBeIzz4VWSvwhBJ3nd3Mp
X-Gm-Gg: ASbGnctN35PqsBcAR0JjT5trn+GRWTumV8VVjxnFsDYy8rwuDGoGaNQZEK9vP3fLBuo
	KXd4JU/KFdCbrsWKT0nDcX25MVRPMEFB+JZ+UlHgS24heMDUvuH3axBTNTwk6S5H3iKhVYbmNwi
	aIDIbdcvkt4MrP6B2AMz7x6dzI+cL5zCE1lXxnmFA859gUOa8uuJgegxwvINYLYry8toGjFiOv1
	G2yBNnsLfp1sjx0yAZWAbzpDf93Bn5DrExFFFUtW+3gEzemec6HUdzZNnIe+XE3OQLwPnZPCz1T
	N7mX5cvpVIoPcc0M90uoZl8ULjM4x+L0hFPxP4rXNCy+iMLQVguB7MsblJj2n85LO/PAYuma3tG
	x3UQ=
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d44390b20emr177135285a.6.1751027075605;
        Fri, 27 Jun 2025 05:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsSUCqkTzzrlWtIzSdcUw7WLmyPY4ovmdYHMj3uG1ti1i0AkcXeiJFafPFnHDPYcpyfxkN5g==
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d44390b20emr177132285a.6.1751027074979;
        Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bfa4sm114300466b.139.2025.06.27.05.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Message-ID: <b67baa5a-dab5-4fd4-b789-b1294abcf4bf@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:24:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfX/mw4s0bJnoln
 CWHqPB1lK3YR2kTqT5mnewTzWijUiu5facb0Qd8NrilEyv8wP27FBmh/npGHvOoQh2WcZt/xStE
 uR6D8ANMSqcV4ZtqIGysL+q39UUkE3l7FlHrYoymFkHvkrtFYkyOxZdSyCAZkQhmpwtFaCvGTmB
 NPFBdTeYLk/GgCtIBoeBjYgysQ9RCfevcgP1Sa5kiexjDkQlzpzigpkyen6/ZOrs2/htS8AStI2
 13lM1pyqHHt6W1p1IOSUFT/SfjeJWblJ4z/6xVTreQv/aJLZ6Q9/5CPPICa4F2fDZIhiNvW2N/8
 3HMgOQvarQ7VeXeQjUFuouuRCoKhiwf6UUuidz2FJ3rv4yqef/7cJTYOh+bXU9WW9ALl2UNjag/
 r6mVHl71QcxuSVKBra75VsXJCfo5CZCJ5urWO+CFVlsGm1+JM8k5C8RrjlQyICEBOWB3NxAp
X-Proofpoint-ORIG-GUID: OVbcj_1uH60yf8UwTrdRbLU6BUYqhLu4
X-Proofpoint-GUID: OVbcj_1uH60yf8UwTrdRbLU6BUYqhLu4
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e8d85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=z5t9ctGjsfNMbOfKQ0kA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270102

On 6/27/25 12:33 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 5 ++++-
>  include/uapi/misc/fastrpc.h | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cb9f4be286af..d3d9b9fdbf4c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2245,6 +2245,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2319,13 +2321,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP*/
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP*/

missing space ^

Konrad

