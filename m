Return-Path: <linux-arm-msm+bounces-62773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2ACAEB79B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2799E1777C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68460298248;
	Fri, 27 Jun 2025 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgZk89ET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CE2BEFE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027044; cv=none; b=NZIrIhV3DPRI+j3bHgO1BUwCevT3TSOFOASw/S6sM/0G83vX0WskV5VRuas/LmPxNZJATuxcnH4Rn2V7NVDsFiglzTRfM8jJx2g0OiE0o6ZzpZ9FlIfmUts/AENj23A2XmiimI8koDR9jPuRPmDuvg86X47XNxHKZuEUfyp94JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027044; c=relaxed/simple;
	bh=uXV4c38ge4kei8/Su56vzTTUphRCp87P4D4dYrJyD9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ7Se4vJp5KUGHwclVxdrXbb/J2QGNlRrInwzVoRtH7P2Af180uV165EElarsE0OsX45e39nVzhQqxXdaVNfpPsACUHnarA4JsIn2tEpUdDryMsKz6hOJiD7GpW4sHEAXLd7CuRz2rLi0IismqqX2scyZZ+6lRu4t8zQ6HzD5mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgZk89ET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBj1rH007346
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=; b=UgZk89ETclhOmh89
	bODZDvPo5Ns82vOPLtHg3lhkRjHus/APr0sgQxC8yg14k5xYDTqR1LDczuq/0ENS
	19sDAW68nWf+GZ99/I/QLTS4qQqvhJbZZesHP3uu4YcQwiS6U4SWe9dNhE6stRgz
	NlFLeSu00sPRzOzIB/l7t2XiPTMfRFMQTqRH7OHdNdx9RulQDQ2oMPQRDDeTiOPC
	xlzV2o8jL5rnGFAN2AkPKf7tkn3Sv7dL4VXwmMMaKtJR21fOvpQDITppVUoepbn6
	nt3HPl0PXASvzG/NQwhhkvxoYa4p5zR+ZddugFjHs5dPSpcDdmz3lRYIIcpKMT1F
	tLydyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5yyum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5a9791fa9so7118681cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027041; x=1751631841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=;
        b=dBVZ79RSNbdNV74DY7D16fvMi9gPnj6X5yBW1+vW2FYBDjjgqAV/jTYsmacTpuBwxQ
         eJOuL8hYoOvSLGiKZFEn5Uzg4BcL+DDyokeOSONgz6xIeKRYjdtv4oEiqLQ5D76/ZPxy
         Bu61mWXVXlBtKsxKm3gnBdJ6KX07JsVDK22EDP9VRGQK4ed2d6F3pU5WlfekeVfc7xpw
         pijuR1wZGmZ/LK5JU8Pob87p6hScUWlISUIAun68a0FL0qTC/7v+Rsd4eYIcjz9XYKfh
         VUoQFJ60fTs4QpmSOCc5nLDSXA9nLPk5CpdXCY48oBiSW1HHgef46HqIzLzMBhQag9Km
         FAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsEx0VBzB9OhWKIDjXl2EMDOe9QTG/XS2OlRjJUUszE1xuvLZNDS/7ihsLBPd1nz+AnTfE5crLv7etWoMk@vger.kernel.org
X-Gm-Message-State: AOJu0YzdlJ3rH0684OrsxqD/mVolHonZaX5wlEMEJlzgBYkGYWLs6OQM
	X3eaz6gUC+KZXFzH6RMF3LD+loTtViBe9TJhmZ0qsXKvX3eWDQZ43610PBMPRvC2itugQVWrBXK
	iamn3CLM4UfcrlJDPc8HHmvD25dIy/lgnMkf52mFluEYpnOsz8bZxmlKX337fL3mwVcuI
X-Gm-Gg: ASbGncut2W6DC2VW1GL0lOvPMwGBAo5mqa3/zNudIScOy8NFoL2qVi6PdjA5XRPL05M
	k3Is67a1KxBOrMYk9fw2TBuoE8DKxibtHZOBsqpiVNEKugh2y0X0pg3aBtaNrCv+mhvnXqZKMNL
	30VorfxZyXqKmuXgRwX950O/CntuNPLwDDpKbGpMDkpOL3E6lz8PRr1xvYfleRuWUB47d6+Q7i4
	qyJdIUwJGSV77n6Hkzbs21wY/Is2hs9vJDYOqYi7Qf9B0Av/kgB1DVfgFGNEUCNjG2RGfNf7VXq
	OpqHr4BcTQ+6EmAvsWqMAvHnokIsX9sZMHvORdOAwzLFMmoKsBktJClBRQgQj5HHmUTxd/HmHAN
	lPdo=
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a805a7b2f3mr1098381cf.15.1751027040722;
        Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCH66K+eZ7+yWjG8u2nzdrIuteoB2hoHigmzqTcWK9g8hs2x5qZkLnX1JOh7Tx1aoKb5mzqw==
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a805a7b2f3mr1098021cf.15.1751027040169;
        Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831aaa5bsm1394459a12.43.2025.06.27.05.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:23:59 -0700 (PDT)
Message-ID: <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LuTVNAOCWe57SEWgPvvImZIYkAx4X9FD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfX+5ZKiEgJpEbZ
 +8OQdxEKavFKadXaWwN8AFZTzo01UZCZ94ZCBrUzI3e5f8DHJp22+rnsQfUS2f4YetubZuaMcfo
 GFwmOU5WP7nkO4pE8T8mIbNVlY7uoi7fPxm99ZmMvZlVgZP0wrsxpBWF8epaLLVhcSEBqQL6AuT
 K2bhEQTRcpWQ/dWObImhGKC8Zv7isWxzImMRek4hNowrF0ivo01LY1AtvWXQEh7CJGCFQWrXry5
 lYnpFHTaw9jllUbSpyt0gN6yIOGD3BVilF8Pz8amCAtINMZPmxPgjxkUhWu+GSdQDkh6dD8MIsN
 Zx1NZ7vK5Kczq9P2MKhnMUsSSBJf1HjAY+LUrw0/we3DXIUEdlR4ZXHKBknslH41PoBsEpQt6Gm
 7M2Q/xZCP3Xr/5tgr2dKPE74YlCqtY7eFMd6Oc+e1CGZrxycQSCEstMFduEK4HwPrLNQKYk1
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685e8d62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KOtGWYD313IA7KdcrOcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: LuTVNAOCWe57SEWgPvvImZIYkAx4X9FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270102

On 6/27/25 12:33 PM, Ling Xu wrote:
> Currently, domain ids are added for each instance, which is not a scalable.

's/ a//g'

[...]

> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP*/

missing space before comment end

[...]

> index f33d914d8f46..b890f8042e86 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -18,6 +18,13 @@
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)

No need to include parentheses, as you're not interacting with any
variables

> +#define FASTRPC_DOMAIN_MAX    3

#define FASTRPC_DOMAIN_MAX CDSP_DOMAIN_ID?

What I meant in the previous revision is that you can not move
data inside the fastrpc_ioctl_capability struct, but you can
definitely add a comment like:

struct fastrpc_ioctl_capability {
        __u32 domain; /* Retired in v6.whatever, now ignored by the kernel */
        __u32 attribute_id;
        __u32 capability;   /* dsp capability */
        __u32 reserved[4];
};

Konrad

