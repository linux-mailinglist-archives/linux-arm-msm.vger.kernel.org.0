Return-Path: <linux-arm-msm+bounces-74586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1101B99D97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969663AAAE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6752FD7D9;
	Wed, 24 Sep 2025 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OitGnSsI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE33E2FB63B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717086; cv=none; b=IOdEL1OsL+U8iRW3+5ZtUZ1oytOh/JB6RV3hAyspUs65J2vRWOf/faqt2+5/I/dsCC0q55zzssF2B5GrD70mqifPj4rm3Kl7FeXxoJKiX5Ur7nUf/qzK0qZQ0dzfxgb+6EA2BIRgjI7gm1lz92mOQWEFpoQiqdEfBXIaCkf76qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717086; c=relaxed/simple;
	bh=0L/pyEOeeXnqGabBRycCutBdvJHrzGjVKXIsFsl+r8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IguqbF/3ARy8iDZjCMaEBA2lpzVBF8/nD+4Zr92fqmG6mQHX1XfEd21q5iqTBKT+k0pMR5r8Gk+0BT77v05zcmUzkgA5d8e8SGVs9E6dw67Emac6HjZRWnx8UlpsbJ5z/hPCK1oBjq3+u03ePz5BsxVV6XkGkPNqFKlN+3nzu5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OitGnSsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCQedC022115
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwfhLJM7vZetMpbxoYtWCEkWA/CPi3SZrs0IlYQ22wQ=; b=OitGnSsIYjF6hVaZ
	jnUPG6EEOq+VncD3lpxk11iS+Qt2WV04erAX3M2gisJcU93whrHAejcyEUECWlGd
	wYYMFjwXCiNL8W9lradRegTKgElm6yujuphFxKm8rGGu+tCs09kHgzMss5nBzR47
	MTS10cZ0KwUlvtIs1JqwIKyxBuiiL59mX/xki+DSrjw2L4ZtByo88HETNo4abTZ4
	IFdQaFB41o4DAhQHWC4cA+qRhsTDKTkd89EBMLdrMeiMRrdUlxSL0Yl5tpJly/n9
	xyJMEhaA8GEh4NtZwgPFpDHe5SIWRYaKACLz0NPX8gXCLP2iFH7wnlH7SjAu2+ts
	kZJjhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budabuu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:31:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4cd5464cb0bso7468441cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717083; x=1759321883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwfhLJM7vZetMpbxoYtWCEkWA/CPi3SZrs0IlYQ22wQ=;
        b=Nvkiy1ZhpLWcudId7DQD/dSHIsM8dK8UZ3saIyJlLLAFridTT4Pkc8jq/OC9Q9uYdY
         9wKRZCYjprIfEd7HY1ULdjGt2CM1DqJMvyuaO1RhnTlbW/DOOOxPn3aZMBA5T4HVtkql
         XgoIirMFWg4NupL2sDUGRSEZc/U48w1ad9XCGbQk9Sw9UDEQZ5CJ+9HTV/DsJRvrVQ6f
         Qg2SXH8nWL7lgBdOfNO/ZLk6cIRqIuOahht0dV+XVpAt/y038o6EMXMrRksYAGtuxr0z
         yLhUOogeDDnZR2lpTCE3ekRozdAqGhl8AxZTMif8LwO/jlOzHSY+5gJLiq44SL/UVJ31
         NUkg==
X-Forwarded-Encrypted: i=1; AJvYcCUexQ9LIrR8wTdADAMFVTXFnnwb8hL0iAv7L2XAPktpeQ7oY26Pae0PKWqR/xt+MCF00w3feImtnMUGxpdx@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsqLGKE6ZJdobykvV8sVnUHRlz62RzwlsT31MdyYBJd+gBLTR
	q9aXwG0FWMd4OABCoy3NvRyf32WIB7zkVQKMl2yzTZmeQA182btlSP8BETaoJkCNJwVnf/gJBhq
	OJqqcg8hbG8QNnm4KtG0fb2/NDRm2URoQykh/W4DjvTxqJe1f+tgir64CwuWls9QqE8uw
X-Gm-Gg: ASbGncu2SDCe3lB4r6jY7leNqUVvG6JOUy3D7E5P4Lde8T7XDc5Y+7F/I/5GHWGn2Vv
	AD8EYYcgGiMgjhovXWFpy5m8b2w40ZnmqirZisVqhVR4xHUWrxv8TscLGhJiGTM3vSsUhPrxTHr
	hrgRPlYPD2inZ4AzF95wYER7Xr/glAy3yngFkIlM07aqzFWDMggRTC88auDSRWYaJZFe/p5ciqV
	rSbxqAwsUzt0PY2H01hBEXNC1iEw1K8OCeesZfuwvqBqZz+0yw4wNOdQ8T8HqueUXVrbNtmc6Tb
	h4DOuckbraeEN9GBwqMmNFEQ4rNon+idmg6XVJgoXhO3NhTD+q8WU3CLkA9nLvZU3gBJoZKk47y
	l8PQswePTgLZaglaChVAI0Q==
X-Received: by 2002:a05:622a:13cd:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4d367a28b78mr46510031cf.2.1758717082885;
        Wed, 24 Sep 2025 05:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcfTvLtcu62bSP3Lg9uI9ifGA9q/bvAbF7bvmO2hQr8+QMmrVx//4OqCgPZmOlocZwoo7VQ==
X-Received: by 2002:a05:622a:13cd:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4d367a28b78mr46509681cf.2.1758717082238;
        Wed, 24 Sep 2025 05:31:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fadb1ee79sm12382698a12.33.2025.09.24.05.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:31:21 -0700 (PDT)
Message-ID: <483e0f79-1725-435b-830c-9c1dba886186@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 14:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Glymur compatible
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-2-wesley.cheng@oss.qualcomm.com>
 <nkkimxkdp3q3iiyv4ic6rxnwwedq5tnnn2zismqf4pdocvmono@xltxaqz6rb5q>
 <588fd98b-ed22-2940-a749-d4601f77b0b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <588fd98b-ed22-2940-a749-d4601f77b0b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9vF-adxEvIxaaa2sQWpPrE3A6XUaRgy5
X-Proofpoint-ORIG-GUID: 9vF-adxEvIxaaa2sQWpPrE3A6XUaRgy5
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d3e49b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=DIBu_eTfnsobS-0nAiIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX2fnD4MckvQgF
 ijT/EWRHt1QmC2wri9pGVjDtJLkm1C1wqHo9f3BzCY8wtUQ9TyvDjtSHIcRvgrk+QJqtISVnfGB
 id1KUD4OdGs4w/WiSBQ8gxIqOIQF1XJ2g2zkwjE440ZCPM+J7Oq6itqQOlb0AnnmZtUzTpZvcOr
 S6S3YmjEcEgGZBwLCRHoupEYyX8cxLnNC+gbNF8k0brSMUicRlbK17Y3bNzx/eD0nkI7491bqfY
 n8+xqb7uTXoZNJJPbe6VtF4G9M0K8iWYAB01IKEapE/c6CA4oVwVDA24PHJgGtVptgb2ESPI8YW
 5DPhfI+zvSHMyETk2PoopztuluXVhyKOpyXWzQilYqT5ijFFxpQJaCXFHSkPF7dvIGeDseNpEa4
 Ubs2Da7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/22/25 10:52 PM, Wesley Cheng wrote:
> 
> 
> On 9/20/2025 8:18 AM, Dmitry Baryshkov wrote:
>> On Fri, Sep 19, 2025 at 08:21:00PM -0700, Wesley Cheng wrote:
>>> Define a Glymur compatible string for the QMP PHY combo driver, along with
>>> resource requirements.  Add a different identifier for the primary QMP PHY
>>> instance as it does not require a clkref entry.
>>
>> Are register programming the same for both of them or not? If it's the
>> same, it might be not necessary to have different compatibles.
>>
> 
> Hi Dmitry,
> 
> Yes, the register programming sequences are the same, but the number of clocks are different between the primary and the other controllers. Specifically, on the primary USB controller, we don't have a clkref in the TCSR.  Was just adding a separate compatible ID to define the max clock items.  However, I do see that even if I only need 4 clks (for the primary) it technically doesn't break the DT bindings definition, as minItems = 4 and maxItems = 5 for the clock and clock-names fields.

We can just stick &xo_board in there and avoid the mess

XO physically supplies the PHY even if it's not programmatically
configurable like other gate/branch clocks

Konrad

