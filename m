Return-Path: <linux-arm-msm+bounces-61914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EFAE2423
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 23:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCA11C21705
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6602AD16;
	Fri, 20 Jun 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLGe40Wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03F238143
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455576; cv=none; b=m8jly0e9Xj6NsyqVicRk+7PU/wpcr0a8hkKlswEg0ZDcgD6z/jvcl6gUZWFkL8/ctwPTz8CSXhfyUvwj0VGSUmo/yajstBU4vxp0NzhozuVIIhcRMcwsmMTlB7BqUWxpWpWVGW96PJfHUYp7xXhf+M6xtf1Rh8ddvogdoVEVEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455576; c=relaxed/simple;
	bh=5+lx+rMee4hQc5Zw2lVmW76xMzRd3mGxUhdEqPcGNy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUScxpxK3tA8FvBtZ0lVO4A2CkvaoM3VhgPs1Dwgn9cBWLQqrBjXcH7mYSghfZuZhOLWZsFPBVkPVxxLFwhemDpPnsrKV0uDRSuYYCFChO/aNnTeCcuDLCgXtJ6Hu66Hz2Zhclj4YnCvSKP3HZ+rhuOyVN3XSB8h1n1f5XvfUJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLGe40Wd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRVs2024309
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwzOEPTIZ8giiov4gJJQXrK5
	i9pYwzAJlNAgg+7xW8E=; b=MLGe40WdgIMvckP/3a1ou3SbPhUB1RzQVkbnEBCZ
	zRut/wQKtGDIFGH7JWPbHMbFP3HNgCWKpYGUEpLOA1YcoPyF29AYy2ZY83/kVt1H
	HMJk7UwTFs1OtCCebDrybyFRxBbAs7+BI1gAEt/saioYMP6FnSYvL0Z3srDbOjbB
	NLJegi+Yb7msXKHaE87HdqhN6j5dy9PW96nNb5QxF1oyXEFjWCe160istWB2fOZm
	Tk0BbIoxgeUr1B9ts1OdRBpjdUUbArzniZjuXygU+TO90m0LPgD0ovjs5EdBCsqM
	9aRjHdK7DuZKO44+a1X5rfG43mNwv+5py4nDPpOABKhMxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4rsuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:39:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so313618085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455573; x=1751060373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwzOEPTIZ8giiov4gJJQXrK5i9pYwzAJlNAgg+7xW8E=;
        b=BuggQZVpxnfmzvVvlCsqUARoDSj9wgUJAgS8FeMj7K3TaL2Zx2MMlCLurE1BPzjgdg
         W9JnlhacYWo/5jun/47BEuXtrNBz/Sfs6F/9JKjiRat/PsC1smZGshtzpE1SWyvKjCG0
         csfvNLvKUJOCG9QNR2jdsSPLHIW4aTMt0t+ppFNXkpnNT60H1x2iTKWtG9cv6DQmAvPM
         7ikxZtZjInlEfLHanXyguIRgz/RpPttbCUcaIJCCUQElbvlc9R1lCp4IcD3i0pMFnV8/
         A8cawmnYMQ64pnzGvRINJg/5spDRurFG8osLCc1lA/D9otyQw1jyC3iAWGiwUUpzLGbo
         61rg==
X-Forwarded-Encrypted: i=1; AJvYcCWqnwbiSqdyp2XRtVfX3aPKyT859vVScIg6WIr3h348VhyCLlYWhBQQWOt4oOfktYU8CrrRo0ow0aYDJ5z/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mMu14JgnI4aIuR7+hAUp9sWxMDKMn3TiTioNwQqxQbUNKCBo
	tWPekvKRtL/t/GeDmHLbZMGMNGkRxmlmEw9xNCpyCzzfbB8A659OofetzvjN2AdKKRYCSX4epN9
	PsTvHtQoCx1IM3gENGHjVnS9CwKvNDU2/UgrCzk1i0M7O/jyWuE9DpygeXQlJYWsbWj5Y
X-Gm-Gg: ASbGncuWzE0etxxSA8tX3rfysHn40EnKhrIEOH5JvppTMxyptZUQBKb+XbI0LfcClb7
	Ui7R5zOa7cde7TY2pIGCkwQIkeJTxbwFYUMb4NGRr5JImbeUKumM3VxyYe7Lwh/SPNLVNBzrFV2
	69wpXepcg6dZ3IfTAlczsTKP11lq6baYxrNh6VdDN06ViCNHhLJOe3KRVgwcVs6kOeY84wA7W57
	OO4Ix+wSxgSsJ2lgNAwK9B9hymJtJsLepFCsVM5dxGDhqXpeD3LxRvNfP9kyElJF33McikrJEFd
	eOHzXSTcZEMjQasOTNjYQa3yXCJiFbJEXop3EBoQ3UYb4Tx+BAHLXRqrKlocgd3fH5jDsRzg+mJ
	0QKvRtw6R+8JzpB6Pu0xZL5aiV6D6qdoSpyE=
X-Received: by 2002:a05:620a:410e:b0:7d3:8864:d1a8 with SMTP id af79cd13be357-7d3f98c96a6mr686276585a.18.1750455572825;
        Fri, 20 Jun 2025 14:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX3zLYCHnzxLiD2hjxRNc4k1DRXHEdxgbDojWLk6u3q4pVIZ+GEEi5/4EOpDydiye/y5YWwg==
X-Received: by 2002:a05:620a:410e:b0:7d3:8864:d1a8 with SMTP id af79cd13be357-7d3f98c96a6mr686272185a.18.1750455572373;
        Fri, 20 Jun 2025 14:39:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cbfe6sm414644e87.204.2025.06.20.14.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:39:29 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:39:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
Message-ID: <x7xskkv6nviz3j7sr5qgs7yt7z6txqwdemfammufwdf6ji3sla@gi2a4aadt6wc>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
X-Proofpoint-GUID: -WAf8lg7trGx-xZqgHkWjY_r7eVNLgmc
X-Proofpoint-ORIG-GUID: -WAf8lg7trGx-xZqgHkWjY_r7eVNLgmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDE0OSBTYWx0ZWRfX4YtGzaEcErjj
 OWkjqDq/C2wRAM3zu5rXPTFzV7UdTs1Qtmj3KPt9dUvyZfvbzaRCluXH/XSkLmCX0Gt2vXqE0Pe
 IdHdj6huBtMBB1Hnyl9MxxRPUrdTiH2DQ2KuHDJdUCKSt0x78il6abQabAkq6C4GtWWjcHNgCRy
 CiaC6DG0paww6+zcSabxFD1bamGltfqftyhZunQfwwoPBx9f7IBhtZwkYIUjSy6YxkM2Dvw+CuH
 nmrYfK0blmeS/cZJ+zG5EIzkOLcBc73WSmRealNbkxDXvaFO7OaUEn5Bd+FPiUpizBn9JOVEzU3
 z7JnjsuWzgfendnBzkx7e45aWpflrzandvgmBUEU2K3y1db+34gM39BVm17b20Gmuya1mWoYR30
 FwHCWlokF/MnhqX8H3Pmm/NvGi1w4EvA4aOUVOFFdJP9H9gAKoUPXfWFHODO7Lbu6pf9zeny
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=6855d515 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=cX-zLpqguaV5l60ydZgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200149

On Fri, Jun 20, 2025 at 11:50:51AM +0530, Vikash Garodia wrote:
> Existing definition limits the IOVA to an addressable range of 4GiB, and
> even within that range, some of the space is used by IO registers,
> thereby limiting the available IOVA to even lesser. Video hardware is
> designed to emit different stream-ID for pixel and non_pixel buffers,
> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
> 
> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
> individually. Certain video usecases like higher video concurrency needs
> IOVA higher than 4GiB.
> 
> Add the "resv_region" property, which defines reserved IOVA regions that
> are *excluded* from addressable range. Video hardware generates
> different stream IDs based on the range of IOVA addresses. Thereby IOVA
> addresses for firmware and data buffers need to be non overlapping. For
> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
> while non_pixel (bitstream ) stream-ID can be generated by hardware only
> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -65,10 +65,45 @@ properties:
>        - const: core
>  
>    iommus:
> +    minItems: 1
>      maxItems: 2
>  
>    dma-coherent: true
>  
> +  resv_region:

Ugh. Underscores...

> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      Reserve region specifies regions which should be excluded from IOVA.
> +
> +    properties:
> +      iommu-addresses:

Missing type / ref. Also they are only described for reserved memory
regions.

> +        minItems: 1
> +        maxItems: 4
> +
> +    required:
> +      - iommu-addresses
> +
> +  non_pixel:
> +    type: object
> +    additionalProperties: false


I still think that these usecases should be described with iommu-maps
rather than subnodes. You have a limited set of usecases: "non-pixel",
secure buffers, etc. Define an ID for each of those and then allocate a
subdevice internally, mapping it to a corresponding set of IOMMUs.

> +
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus
> +      for non pixel buffers.

What does non-pixel mean? Compressed data?

> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +      memory-region:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +      - memory-region
> +
>    operating-points-v2: true
>  
>    opp-table:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

