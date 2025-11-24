Return-Path: <linux-arm-msm+bounces-83055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDFC805F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 13:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68643ACE9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7AC3002BB;
	Mon, 24 Nov 2025 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqy3WxtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WN1sX2Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B63002A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763985809; cv=none; b=G0mWsWY83kB1lZCG8X8360FBupr4muycjGAHrWO3qh0WRrGaYjE+5J36kmvDMYQDei5+ruvm4w64/jyGqIrvCH/2vb9MErJtHaltXUp80vm4frBxg2/EAUok4jAkKhg6LZyqbfvvw6+2FnZhPVyaKrJtW6m+F5wlfs6mjZVLgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763985809; c=relaxed/simple;
	bh=76hJUUy0K1yjL52vxLYjWT5lsN7JRH8r434BFbgCIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS4DXC/2OcZPi1sBLggvU8Kn3HHBeB+3w/Ni0h2A9XZX+a7WDCN7e5zz1/vGJ1fxrjv7Hws7QVn7Cr1OMcEHRTEhouKybUQuVoz+GJnKPWGKQc0wMw9S/r69WgQ0JvtBEoj0Wg9Ts6HhM4LIsTFTVEbcXFg9Hj5rFrWngKY/kqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqy3WxtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WN1sX2Du; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8TuZ01808600
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 12:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lCxYYbntHaew7kzKWJpeOCLy
	2pMCM1/DvLWkvLyGul0=; b=pqy3WxtIvEjM0PXKHl97g9jNImBkEKiugqX5KlYP
	VRah7lPayzJG0WWZU/nrW3i7rUv1aVbAUGOH/3hSxiUw+IlO2r+/3v0wY7QZANTw
	slFkeOHibYuVLQ4gP9cH0YkB928k+XXCWs4kwkzaK9UtgHXm1sRWHTCPg1mC3en9
	ATtzm9C9FRv2daywltQTuHu8ZzbUExOmR9NXY26u3/EPAavBwQKjngDxPCjyoR4T
	G6u+8mnEoGbXBbqn4ESEoZa+4cIwSeHxnAJfHUykevtJNWaAM8vSOwpoF7YlY1+7
	ivrcv1WER8Yja8UHBuSszALcoaUeOLCb8oqPXpa+cw2cHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama099vw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 12:03:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so4223065b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763985806; x=1764590606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCxYYbntHaew7kzKWJpeOCLy2pMCM1/DvLWkvLyGul0=;
        b=WN1sX2Du+xUmCqAIolB5d2Hcwp84B1Ptgcf3z086c62XO88xr+Wm+mQnw3S3NZIrJd
         oxQo+a/pY6MVaNWDSy/IBb+txy6irvrIoAsvJZwyW+VgUI1SeJaiAZGUaX+hFA0SbaXA
         u5miECoq/RfUPMcX8O94fUrwvNdRf0VDGFhuW2I6HUYpyrrZdZEWWk10OA0Vjv+nHAc2
         SWyNUP0LYCgrLf+9uQVl/xj1/vPZ0tGqN3j9OFHCpQGaxgb+nZVY7tt1KFWqLGQ7eGg5
         ZgH1hx+FGtPgJJCd9hrIkOLshy5gAJl/bge5t7CXiWoQGjVG7Y8KiXByWdStsfcQlCR4
         tayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985806; x=1764590606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCxYYbntHaew7kzKWJpeOCLy2pMCM1/DvLWkvLyGul0=;
        b=GFZqGQghbdiuULMQibqY3DJT6P4ZcZ29xE1Q923PXEPcCT3/I/GTUVr2U7TmyCScyL
         A2utzyA9p5POIo55RRfx6RC1s8GxZymZWLH1VtfLiKvS0dNfP+UQ7HaCL2CfYcE1vhk/
         85YnDOc6ddLs3bbTJgmhVuozfIGY92ZhuhmwDpSR6q5I+37JnAK7BLlbtzn6mxwZPeFD
         EyeAGYmG2sZMctW9gHq0ruNie3YRZxbO+leO2ZIhCpbr6sM8JKPcdW3TahoVgzVCJz72
         LQ61pIrUKeIbER5Sltgzkw3fq1FuK0ynJHDv/WVAdzlk8ZquwUKcGYmb7TQUcjgg0XOy
         kRmw==
X-Forwarded-Encrypted: i=1; AJvYcCXuY5j5hCtshIHQt+gxb30w4p40O8TbQTco3QOZMZqvlw2QS4UCEMcZtzEt0tn9HpRbOY4nGz5sdmLi+fU+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh6zDs17XOKHSgwVdeoivyHiNWj9PWEq2SB6Li38Ol5oWyFyJs
	HJQx6dTip6m49HSPqXVX3E0CVVloYIcgfezB/f2kCFlFCjBQDmvqAA0k9JC/rOBdzCHhH7OidJT
	t3vInWvtrdfC6mOvVzEGwnMnUIQv5yCoXGv9jYIATmR+JHTtCEF549AO7hIbwEGwbaA3/
X-Gm-Gg: ASbGncvWdNg9iuLJmyOLQnnT5LJMWNNjtAN+L5ZuZDe3j7/uxoScsv11jqPTVs/+ofl
	NlFtuKYhykWQrxNNkupuvLcVMYilCJHE1ckk7Mt0CfS09n8nENEiQbd91n98mCuoaoioi7r0+d1
	54jIddaGlKRt2xDunJY4IxJV+pWyoAuh9Q85vlL8RP3jLoqdrNAxDZY2KRC3v9WC/ThhcsK1y06
	GVe607G63LKB/ibuvlfXU3oTzJdFNHgS/5mlDqAYEwPp6GDflRbOTRUbEAKBOwjZVh/f78gYLNl
	FR2bwSXIxzK9WmHkhr+Al/sZEmWSz50hSXa6kU4B6zweJatOgFvPANUGpjAvFQ5Qq7dDiOTTO7N
	wWUpeeW4V5IQ4k49DJNz9zo1Mn5IcB6I2pTWI
X-Received: by 2002:a05:6a00:8c2:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-7c58c89cb99mr11900458b3a.12.1763985806019;
        Mon, 24 Nov 2025 04:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuQfzaoxScfymFBGrncwvScWZP0fNKesBuYUeV45JaoQH7ZQbYPZStwT8at9iK88G6yQW1nQ==
X-Received: by 2002:a05:6a00:8c2:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-7c58c89cb99mr11900392b3a.12.1763985805114;
        Mon, 24 Nov 2025 04:03:25 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm14332746b3a.64.2025.11.24.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:03:24 -0800 (PST)
Date: Mon, 24 Nov 2025 17:33:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251124120318.oqq42ndefnxyihfb@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
 <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lpPHGqoU6QdUIuYzIT4DGYPx_Q9zlzSc
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=6924498f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8Kf6xdw5An9448K5vG0A:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwNiBTYWx0ZWRfX76KBe3ehSvh1
 4sZTrKqKDJP/N71DJrIeAt3JsCryyGtdBtkrT+P8DAjkUuMCyCUf11BEVlH18hAYQFOpjCdjwny
 CO3Mp8ZVBTiqwPMr9CCChLxqnTBplBrKgEe0NWnqvvvmOSm1YYOl4CuIZQzwRB249ydhAh/UUR1
 6e7doJ0F36+ah5uFfutZUCrmOQN4hnHsIoC62fuB2MmA4eUUnvwpxCtzdMZBltqxFI6UqKCL807
 crHIoXFC2KS1MBDCLLnuXDTGwIqax0mSbawMJOrlPb1KUCfSykRLHnPE9qMXqpss+2pAraE392K
 xodGDSte5prmWLVdoWzeCQ8tF0gsWaEllwrk1DyE2vYoh4mj0e6zQij06YYrOUwr64MGJJS9j7/
 vvt8pD4GJ1J1t8RpcXaaGgXs+1/7XQ==
X-Proofpoint-GUID: lpPHGqoU6QdUIuYzIT4DGYPx_Q9zlzSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240106

On Mon, Nov 24, 2025 at 12:31:47PM +0100, Konrad Dybcio wrote:
> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles IOMMU configuration. This includes mapping memory regions and
> > device memory resources for remote processors by intercepting
> > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > during teardown. Additionally, SHM bridge setup is required to enable
> > memory protection for both remoteproc metadata and its memory regions.
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which indicates default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	pas->pas_ctx->has_iommu = rproc->has_iommu;
> > +	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
> 
> Sorry if we've been there before, but I see that IOMMU-mapping happens
> before ctx initialization.. can we drop this parameter and just use
> device_iommu_mapped(ctx->dev) in qcom_scm_pas_prepare_and_auth_reset()?

You are right and I am not against it, rproc already has variable `has_iommu`
which we use in framework and vendor driver too, but what I thought,
since this thing we have to do even for Iris or other drivers who are
effected, they already have device which are behind IOMMU and if wrong
device is passed in device_iommu_mapped() instead of firmware device which
could have returned true even when Gunyah is present.

If you feel, has_iommu is not correct name, I could rename it to fw_iommu ?

-- 
-Mukesh Ojha

