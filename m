Return-Path: <linux-arm-msm+bounces-101453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EOOOnAWzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:10:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2AC384F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84A1A3011742
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 07:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8673195FB;
	Thu,  2 Apr 2026 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XU1maPiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUGtgp3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483CD382289
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113356; cv=none; b=GKqP/MGkp4bJ5tlG+gC4Mcnwl53WnUxXygh57OpUP3O3Bxef9OuzF+tl4AQNel3sqNS8jmhv0NG9k+fnNOqPWH1oEgQ07FhGdaWVrZLT8W++rQeeG1333W0yn2K28dFfPjPOMGO6Wqy3gqygZ26A/TXZCE+WQ6vm4SpmHZpqCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113356; c=relaxed/simple;
	bh=4rAm94zlKv4kDb9SubQDA9pMcstbhof+gbe9hGaK9J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhlwGbVkTAE7xJfpBIlQcuuq7wUDD/Ex+uA3M1m8q07F5cS2Ow2FRF1sEKqxPJ0JtwqhhtXkbCtAIsxC2FZUiZuxZ3HZc/gIQHjEN+1Lo1Cw4tSQ2o1h/ZKY/2rtpcz5iozW1gS+W86PEQo2BFrSF687AP0yKFXGXdDovCsV0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XU1maPiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUGtgp3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Qhrs1551210
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 07:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=; b=XU1maPiJpQnGKAo5
	BuCccYOSeWC61DcWtoFQJQ1OaVibb/42p+cq0oZsz0bMaV4d6vv5x6uKKDFpfoBe
	1oSS0qGg9U++NWGvg1wbLJl67H5plS8XIUImy6SzlU70GR7Zca1bpEJm9ovzjdAb
	U2UH3X5kwxQKuOYnLz3S0B9GNFq59vLYqgqVXgPogNvKCn5J8k3KYm/RDWAsf2We
	7670AdV+aMHH706ighwkAjR8oLuxF+7auLvdxZqVgVrqAYLCyEvfGmLUE0tWqC/e
	KywjHIzVkUEd9KNQqiHI3VPC6N+KczstLekxh9w3fiqhj1/j8r8IdP3P9e3Z7crn
	YDhSSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerj4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 07:02:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e425c261so561246a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775113354; x=1775718154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=;
        b=eUGtgp3zVxzESmlwLqgMwKg28QLsH5QZ5CQ8e3/Y9J0RQp2tlacsoGsDITq5gjH4Ss
         9naSJBO2czJCT2VRlpSX3Kz3BFm7Xubrb8MV+HhbDOA0bRFhnZ6s4PmJGRwynk8SJ5uO
         duF+JjFGtGw2ND0R4Eo0+N/zG1XNfoNOkq/1z2LKS7kw+ICKL/7B9sKeNHwxf9v5JOrt
         zhPpKhbNWj7tBGDQBviVxuxa5XFIrQCgcroMz5SvUyN91kTVMfaq/BFf5xtLrJbliGBv
         k0OP2Wv6kAskN5y/b5NwzMabi8zE4+rDTmCdHfCTxQv1FfWK4L2r1pCdaxK607z7gHvw
         yQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113354; x=1775718154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=;
        b=cbOekWWXII1N9aaYUOXdwyeI0t5EcIqrvps19QkzIiW4VCcbzg+XMaFaa9rjYPGOsk
         qNhR+wRR1wDocbEnaj0BmIys5obOVhcviYuBXFiWTXbbdkipFM+Wuq55kW0Q6PH+Bx+b
         eE6P7pQHkqEQS6ODIABR19OArYzC5+fERrdfbKeSfG/NSdy5MOrucIMsD55YKOuFbBAV
         O2p4d4ZI3fCxEKClPzbREUYWAy2dUjgr3bl4hsHUlFi0hLb0eJzgXoJ+Xw641Ry7rDY6
         c4FyIJW95DWbpCLeCCO7sUgJt8eAAhrItZAhO/a/s9dBAlkocxo1i4aUBA3yJvr6Bl0g
         rwow==
X-Forwarded-Encrypted: i=1; AJvYcCUEJY6jRmX5VjgfcwTLTP8B9zVcg4HbCaBiax9xgjub2A1cPwfQniDsRfQvs5P2Ukee9fCiBJ0U7CJUNbNK@vger.kernel.org
X-Gm-Message-State: AOJu0YwGF3LlUbCp48YIE5jtUPSdJVLETVUaeCjolThUCV84hLJb10Nz
	pRmWRFCeey/RzglY2zHgx82MgwXup2OEk6Nz895B/jqtzF1ulUgkzIKs/QFZl9ZBt5z3RqYSX1D
	DipVpvbCtpvsZtjjGhJ4frRM644tqWdbd2Psa2pKQIJigwbfmZXQN3vb6HwQXNU+xyYlG
X-Gm-Gg: AeBDieuffzIwYz0LARXlwf0ZSfaaq/gr1MTbLSN7WcfKUyquO4V9iJMr4lkG+zyEOkC
	UZ0h87oKBo7hYiyf0Y0hGbvRQpl/SxCm2kkIm9zPU01gqs+rG/A+5E6J7lalGVVjupGZ3qOiUxJ
	6w1Se+R1PWqXEOPLVo/VVctbnCj4s99R941VJEj5cy/DnmJFcepIn8Ib53GDKFcJf8GoOPTm18W
	miOMf5sO4LjJAw5fc3O9TNRKvKfZZaoO6kSukf9lal1r2svLlHRv2za+P0yJHisSvbEiEEwTb6O
	aMvht0KcgZQEYXFMIiOItyoE8wsEqFmF6Qa8lffU5VFEPX4YfdLPwzp4Jc0DdZmJhxzbke806Kh
	DmUr93hFQzH0QpZtVrvF/v5nEXXWCKLgmsHzkp9DCVuzkyAiniw==
X-Received: by 2002:a17:90b:57c6:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35dc6fae436mr5587917a91.19.1775113353839;
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
X-Received: by 2002:a17:90b:57c6:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35dc6fae436mr5587895a91.19.1775113353382;
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba330dd0sm3580166a91.0.2026.04.02.00.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
Message-ID: <720ba567-6763-45d3-9ad2-6acc4c1a6e73@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:32:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QoBLbH0I6CJguPSAr8FuuKj9HUbQZoL-
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce148a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ImS790WZ534UxHvqx5kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QoBLbH0I6CJguPSAr8FuuKj9HUbQZoL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MSBTYWx0ZWRfX9P5SYL3aKVHk
 5DtQHcWV0OAXr89eu2SF5+5G6tn/MvB6DwoDJsbyq03UMvPrVMhpN4jTegwWib8jJI3/QnlWBoY
 QqwTG579l2cnki/cX801bPDsYxvyvowOxRpg/hlz9Q7rIVtzf31PZoJDq6K7nhy3fTHMXf74jgD
 t3mAL51B/eaFwG82jb4WUqTO8FzFjQ7ttmzayvxPrakX/eZGND7ycQwGmgBKheLSUyPlv7ucQYC
 tNWeJU4wiJdbMZ+9cNgftZ3SX3+zX7j6TL+xQwHuWhFgzStN+8I8ywGnluQIV1y9morAOgsdOKT
 eTJEuejlQX0yhOK4K7IZ+Xz6Wfa/xJSfvvdn412GC/dpIQSwaNXfMpecOp7PDak0f2kO9/AFeYV
 +h+6M6hBBGf76YL3eseo1zeS/EtPweseR61nON6me4vy+z2pP8ukAiOxzqMVE54udjg52Jta0ML
 GY1iPtiNVWK/sdz96ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101453-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B2AC384F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 2:45 PM, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 19849703be4a..f5ae2a63765d 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -102,11 +102,21 @@ static struct rpmhpd cx_ao_w_mx_parent = {
>  	.res_name = "cx.lvl",
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


