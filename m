Return-Path: <linux-arm-msm+bounces-75078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FCB9EFA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E047938611E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AA72F39C9;
	Thu, 25 Sep 2025 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwL9nOEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C60196C7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800790; cv=none; b=lxBY8HrzYBa/ES8r0KbF7MU7EkjEtyHCtZh2Nf3LzMSmydMUlXmqBTcjQytQl6GqR0lLwdqxZWcGklPjVFRzcSJE/yq4r+5sQh6DN3IxMkSfqPakz9fVRtHWIlzMQBiQ7Y/2QryzllgXQzpcMISK1jl+ONl8KYrJSIhVf/+kRJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800790; c=relaxed/simple;
	bh=7DUJfiYTs8+x3mc2MkZUdIPuwcqgS8adOyhUYXmp83s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPYKL4NJP4rM1KwUkglxwp9V/RtW96W3PE+jiqmyyBGzNgEblHm0voqbaSfgcZjodzzex/wRQLO9MbaUmhPIErnbAogUDz/TF3qum9sv0PANMXn/5fA5AuGRtrWQ7KcO6ZkM/c6QcmvVnSDBJGteBY+XsGgkjTL3sri90zHNvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwL9nOEp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9Po7R018025
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuXsHHwcpiqJfT9yqqeUFDXI9jlqCp7KFuFE7uhFDrQ=; b=BwL9nOEpWXZOCVxS
	MSwnEg3+NGGJz/QjUi2JEUTIE2M/TeLzYM/bHQl+tRcJpy1YANBJAy19WT41iACs
	a3KqOxg/1/Qr1qksLVLtSLsteL73hBt49YNZhf3/5rjdFIlRZUr3gziNSiloXwmS
	hyWqE7Je8p1gl7fML9fJ2HoBcCl+YU+OMcGMcglx50q9I0G8YzqcUm4n7qupjl+x
	i1qk9jj9UlXosc9RjhV65PtVzR1GSc1Ys1nwNA8q4IlSCDrhYpTx8V76klzSwr0L
	n9YmaQ8t5zJiAwMdaKebboJI8dIfKaBdTDslK1YGQ4r6qr5ZVcJXn3aRU1Q3RSgO
	UBmRlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbwa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:46:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d88b669938so1862481cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758800787; x=1759405587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuXsHHwcpiqJfT9yqqeUFDXI9jlqCp7KFuFE7uhFDrQ=;
        b=Yaes/ZZGSNab7dPuYZACxQ6WT1lDaHzyuIvXFg7DjHvoIerECS63OA3Lk4y0+kCHa7
         89OhQhPdESIUPOr+HLNcrQE8hUtq2EGj796PXe+2Hy/niiW+B8kSdPK02p3y0hjkPEZx
         /tYQHfi3a1JlcU7m7bZWBh5UEjl5tXHocPiNX9NK1SpI4gqu0wSYMHnN47G75kAy34dZ
         +lta9gsAxLnkGS6YTZoBlqxGy8qtQxoxF48eAo4cztbNkFaGRWoGl3DQx3l5eQbyk9MN
         KOM1/UlQ8gI2hNudz2cEpKQ3vBFq8KcEQe5vlFDFps9oFRX7e6r6ImMbPf6sZ1fbS0AP
         KydA==
X-Forwarded-Encrypted: i=1; AJvYcCUKfEU2qqFB/abSXvuPdptFA3R2TSfRvYyxdWa4jsnnMJSZEuAWilmez29KjotMQZ5fCJIUOczmXKiJOReB@vger.kernel.org
X-Gm-Message-State: AOJu0YxKK2brq7Gc3H8/gzpcnfH2XtlV+wbnbRVY5oz2IafecvhqL78T
	Cm3XTC89iWZnQZHidHYso6GhbgpmP77LMvm/HGW+6PZWdSqzwSNd1mFK/j1eCocxsOXIeytfxOL
	RwELbtJ+SK3ZTOrEkTJkERmhxJs2G3h0iUUWsBaYnzpVwz+v5Suf1AHwrGeAxbvDNd1oC
X-Gm-Gg: ASbGncsSz8DZtpUCaOPneyfAqrSkSvX5y40bPoySrGOW2NxDl9AmNSzqu1k/hvhRGDB
	RAaLo7v9oWvetHvgzg4JSVHK0GXdcCI0qh0EeOn4CtxS62jhkXJ5u+lw33T5Hpv30stzTSxnaX8
	LXoxskuJh03+Qc7mKwK+VtDpePbgFcGUUZ8eXjzGEyGEbI/0wxyrhxsmPKyoAmyBnR2oHXDD7yy
	jGc0fnYDFCqc1Iwh2fjKwclBeU3p1WpiAuZEYZMJ3yH9HfA/L5N2dTvxgD75b4jfiS2Ma3igcJX
	Lh5+iDg7WA7EmfdSb94kh2FfVc1lZAQBxcTKjeYC7eCm0WmWaODdO6cy39VHSSYlr5OGRDKstjg
	jZPK2Tf9G9MvdYXmvjHNrhw==
X-Received: by 2002:a05:622a:1905:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4da47c0cf8emr30175791cf.3.1758800787395;
        Thu, 25 Sep 2025 04:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/ijx0jrPWvk4fdd8rSVeDWSkOXP0j+0q+c0/jbMYaJrmCFmJzEa0Qx+2CaDRqh27fdMYWQ==
X-Received: by 2002:a05:622a:1905:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4da47c0cf8emr30175551cf.3.1758800786949;
        Thu, 25 Sep 2025 04:46:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b370257a5c3sm4126666b.110.2025.09.25.04.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:46:26 -0700 (PDT)
Message-ID: <6f3e528b-0989-4d06-8b28-7d98d9de9548@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:46:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add RPMh power domain support
 for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
 <20250924-knp-pd-v1-3-b78444125c91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pd-v1-3-b78444125c91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bc3sOlYokfiHya9FQnweHeFVh9GSopwF
X-Proofpoint-ORIG-GUID: bc3sOlYokfiHya9FQnweHeFVh9GSopwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9lgpQOxmiEmh
 dSVjCjiZf4SHHH/M2GU8j41l3vmLZbQ8DJVOWS1/zV5D6ydDx5lq5gCBxRvOiuWMvlVEEWCd2kx
 M8gAOw87CZeWXDW8pW5W0jhORqvG+YYKofaysrFDxfKpbPKBzE0zZqDGirMnjmRcPmc0u2BnL4E
 xEp5zRMoit3v3u4D9uaQpAiB73gWHgx+kgKSYbTD9FTCr38eK+6P9TvMvn9uvoOXjQLi8hyPAqc
 q+yqhquHLBmQaSAOkIw+xdfR/KCNq7EfV7VvUBgxWoxATcIypTPA623Zs4ZDdFSxYpdjxbPQ4/6
 FZIuF6GU7Z1PscZtsZfh6Fjt9mr3aBOVqsQ4fNu10RFRp9yK69Zi/BdWJPF8hB9UN779xpeKEVa
 fh7JkBNj
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d52b94 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hka-zFMH_fk-WL56CYAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 1:17 AM, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add the RPMh power domains present in Kaanapali SoCs. Also increase the
> maximum allowed number of levels for ARC resources from 16 to 32, as
> needed starting on the Kaanapali SoC where the ARC vote registers have been
> expanded from 4 to 5 bits.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

