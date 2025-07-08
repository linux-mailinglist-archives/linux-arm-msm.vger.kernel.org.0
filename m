Return-Path: <linux-arm-msm+bounces-64020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3FDAFC933
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E520956198F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 11:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E21E2D9787;
	Tue,  8 Jul 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kvsk5ygc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43EE219A6B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973072; cv=none; b=J7iosYKebi5I4KLOGfyylCGSBaRaOUXG0hXcUHb1EjfSQGjH8eAwtBu8cQo6yzsv8P3lfXWBPlKgz6ZuJlnAqeipS5nz2KbDJvWmtKOSkiFx+SRPUZjuaAr8GaUjlGsj9C788hBxp5uRJhHDg/edG+vKpaAyo4j6Ut9O/FLiHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973072; c=relaxed/simple;
	bh=uBITef0LLUWU1/Zarh1ggIbbNfjwqfPSV4C8QCz3YwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jB3vBYvYagXbOqjZEWIzuYFOqYHyTf2Kxf9UYmFt5ETwgQsfyOHY81lXgUC+eCp6LNX8OpuVY+ZUXbfy0TMGNjXqKFKhnm//8iItVmEkSBNFPK9GhLMVMoqVka5Mc6Oj8/VSzcRKqbU4anTCSJPIuSihyRkU4qEGUM48dTacfkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kvsk5ygc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAONG003435
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lROYxN8HV9QfliUbHs8x/x9pgDZeMnRqOSq4a3lsV4=; b=Kvsk5ygcnt9/akyu
	FMofRbZVBpsZkckiqXO+c5N+mDYmwMDXAUXXppIRld+q9cuk+Y78ZnQQ1ifUzFfB
	nx5m2n0Jw/nSFah1+9GEP5nbJGwSOLA6BQ+DTgySr89IYmde81sxZKPilGVsbCGF
	VYXT8xraDsASOfmasSqJQnva3bHCnU71rSbQ/LCUU8X/CGr7C1kPDoqAj4Y6QjrU
	uWom8eFBD+CJTJZyOi0NQ43paTQs/kJgwciafNjwCbEAYfxhzudXpbrFHtt6Q6YH
	fzMiUcjuRZ9TxCKRY78uPYdu1MiJzXmyj5U9cPM60cfMKF0F5DdGA0MBIIUqZHb1
	vlGdyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefcwej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 11:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso36611485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 04:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973067; x=1752577867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lROYxN8HV9QfliUbHs8x/x9pgDZeMnRqOSq4a3lsV4=;
        b=l1W5o0VPylsbQBlmbO7YP5A9Ds899q4/8bbmpPaQ1lN8RXcyhGDAXLodmGAEuFIu5o
         ZeOjpS6rnHiOE+5UyOC+FlESLB9om0aaFfBZNbyWNiG2wjZ8ogbJ/k26btHfJTpJ/Xho
         3gURDkowc+8hHcM/ie1TfP6JCRK6o0XRk4tfZOLe90CE5UK5c3CTfslSsC9S05Yq8CoI
         /BhhQ6/uGMgQ5ONLlKL3gWDjls+aPP4ihmny4QO/CZM9ogx5U2o4bzNaI7dIEL31o0Iu
         pmAcH1LKq2rbIYqRXobwtk9LbTSePw1YCU2RXZFw71kII/lX2Et2GV95d3mUg0lkQFH1
         oC9w==
X-Forwarded-Encrypted: i=1; AJvYcCUBdelvZVM10jRzxKqiDMxgqtPIdGqSroLjxA/3fTaU1xDC2kY95i12LNAAHmjNoRAXwtMYUrQ2+AwZK3dL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBCGee+x76GATWlbGsMJPgifrmWESb8GgyVWGNbccVVfYdKvSS
	X942ephzVc2HLNFP7oubXFZ3fEDQ8vddeNCCR8vDjwQhHqNLcMQEeCwQ4QKcrF1cR7b8capoSLr
	sHbTfHcxkqP7ybaGxVrsRNpt8xyPN9sqSDqailPfOZPnVgmHgWgJk0NqxfLY8I/P+ds/1
X-Gm-Gg: ASbGncvl9aEdDN/AzQlJSm4x9uI6B5gvlv41oUVcPtzd79tBsxe0K3yh8CTKKl4Vyj2
	WCzK+fGExQtmt45lSO91JR6jXK0gOjGNxHEDLryXKhmWzrYCsgBwSeU5Y/5JPpHhrdvieGrcsNS
	DRNkU5We4TMojsMhPcdq9isJEPcklaznZKkJffIQfdBpig2MGJs5NntHQW535kgkLq9G9x9igkf
	HA9rvfqzRxiDbZ8OLD/LvM4E64qVCQxx+qU9sqJ0v5cEXqaw0NIBx5XxOMBkBnOTKwzimSidPyP
	GRuPdmYJbePWot7d8FB8xI/f4UzFZMItqLV423rf+VMhisZI+lo2HXYB1fhkSsrIpwtn6v6DLVB
	+38s=
X-Received: by 2002:a05:620a:2901:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d5ddb60e8dmr794914985a.3.1751973067337;
        Tue, 08 Jul 2025 04:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuD4l7AycjpL00d8RxKHZehgSiLvdJXlcj5pe/WMgV1DkSD/H3bFiAzsi8MVn+uWHE7oP1KQ==
X-Received: by 2002:a05:620a:2901:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d5ddb60e8dmr794913385a.3.1751973066933;
        Tue, 08 Jul 2025 04:11:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fa9b8sm6943484a12.54.2025.07.08.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:11:06 -0700 (PDT)
Message-ID: <c0694c1f-570e-4cf3-adee-86bddf684f53@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 13:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix OF node leak
To: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250708085717.15922-1-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708085717.15922-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA5MiBTYWx0ZWRfX4GuOcgHubN7k
 ArJFyUzzqBtrUBbgcQmmBptcnxpaiBD8nPL/xNG7MLRruIUt1XYB3BSXdPrmFshZWcau3vnqaDC
 W6+qWhkE6pETa/vaUamWQMwTU16J9dfkKgZ00DKxTTM0INVhzQhdeYhX0Igt9dmNt2odG/V1dGv
 /XMmLTKNI+r7Jb7ha6FY1favggx/nkJceD1ghSi9a+6wkdDXbYRh4OJx2n320RhUzrDZeaT+k8H
 tE3f4tX78mFT8RmvAOdhFCTrCLq2yjJd7bQYY+usrvnAKvs3NSLuk6VpNtSSAvo4bZRszDjbQ/d
 rP6OeqQqXJ44f8ugPcbdwIZJTqdmzw4yM+htIGgO0yn9GgQ1sw7MPEQF/BKDzpos7rZ3ytk0mOj
 T0tQST3YHIxMwaBDg1zPhH+GUN3Hd0v//0/RODwUPvhBz3PjtZEdodDuNDIwaOhz8OrT4qV8
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686cfccc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KS6flrhD15DKHPIahM0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wLG9RKvTXimAQVGbf-mhQpCYnZ9ltSr1
X-Proofpoint-ORIG-GUID: wLG9RKvTXimAQVGbf-mhQpCYnZ9ltSr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080092

On 7/8/25 10:57 AM, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when registering the
> auxiliary devices when the devices are later released.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Hmm.. maybe the auxdev APIs could one day do this internally

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

