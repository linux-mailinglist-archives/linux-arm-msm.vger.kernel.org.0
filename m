Return-Path: <linux-arm-msm+bounces-62902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408EAEC540
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 07:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AC9B7AEB66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 05:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B353FC2;
	Sat, 28 Jun 2025 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTbdW4Lo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0E1FBEA2
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751089884; cv=none; b=R8TCQbXFBVyGcYoYUnveRkIYJAGjp4/Yh0GGwxcp9wlPzG7PFcOCou4QUuJLVaRnqKfFkP7chnuG9iAl9yFKKfW20/4DzC0ZpH+Wg12hvTv/rir1MFPeX1a9XU4gxgt6dt1tJ4bvLG2V26QvZVY2Xxx36fyd9RdbJZ8YzXbftqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751089884; c=relaxed/simple;
	bh=RNhJKBVlAnROc7YSSE3iH1MaSIGPa6O5wdBUZKA3RYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJJs1yi1AwhsshbxwfeBmXOYyrqanzl3ktdhIfph6SVGLAoBcV85PGLLG6TM8tX463ZrNnnVNc6z1/90hCjplZjNZ2WesXixJenOqoA8oHLHlQnGwnLa9fFabEzReuCz3z5nnWRHHfJOzUH/SGSUa/232IYKkuakvMk1LYPPPUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTbdW4Lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4p2Q3002970
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=; b=XTbdW4LoxUKKcDaU
	26Wb5l2fUjqIpBg+fZ/yA0XeZnqUj7U/PdGjOzHd/auCtAfe4TW9wdWMuTwIAFbs
	jAlfHcRxZu52HrSXBbkp0x5GnVk8FAlDkpAbx5v8+2EIEHl3Qa9vJIPI5NxcHHep
	WWKBU3+THygDYkf/6kMEr8FH24VH1GjAiKzh5UIG0YjH5b13Oc9VwtrAGReVpekS
	P3Q3nUEcZGY/1//W5ICr7i2ZAiY7g7cHRYLN8JoWAX7mUomUG19CWGgw8rYpP9Os
	9HygZAesQmAeF6Uewnlmcfk0lo8wEi6QGuOHoZKCOWX7NUBkns6pWzTDhIl55zmJ
	1CcpJA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k0ax4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 05:51:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso42604036d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751089881; x=1751694681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=;
        b=Jjr7QqhZGEj9pMNRoyN39CbEC4EP8gq6oEmmWhk7t+JcpaIyYQ0vLyNRNF88nvNZHC
         d1pdVrpEckRxnAQFhEO11zZP3Zd7s7QG6A+CuIWddd+Btm08TOPX0jhrBOaTV89hgr77
         lUGSwtAZbIc4x9gn1MP6VNMjcWJbmMmPhCi4ujOQGu6kJdZs0R3Z66npJ2MC0giv7rJS
         VgP0Q+UGP2x04Evj7+EFzRWZNP5uVvYM3W+Zmn2KLlUlXbIzIFneSOQdlPWmkxq5kxP9
         Bx847gFGd4SRvrD69M6PtY97DlJqeSxPQw93FmlH5aEl8lOLUfURkXiW5ohQPnOhQqUP
         vLbg==
X-Forwarded-Encrypted: i=1; AJvYcCW7sh58cKawZiZ/4rGCck+xYJ4nhTY8Cy4biwdr+FZMtFJo19Qz6Ok6pHXoMO75NDxFqjO65xY7IXOIPMnv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0a2JxvDBiHHtk3K8IRydSL6W0Yzmww7nYzBxuXJ/eSeJa8cyo
	VX+G2l7FfoXF4c9bPJuIxwHrNZeMSQ8iGOQmpgk3JfoJoHQjjHq8usUtR1vfUoiXDNzkBcKy5ZG
	3oGpNZ0o++ue+mwmUKicRPcoqrybMHjzfvDY+vh+uira6AFckK7Pab5HkogkbnIMsLNVR
X-Gm-Gg: ASbGncsBzYbU3MNmPIZN9v4UKI4dv4FTniNTRXRPZAwoW3JxHZ9bKF/zYLm2En7y4u8
	GTFsaB/NevCAgbP8noLVcZw8uD/H5zoMBDomQeMyIHBVifu6vaE9N5cesBGkzQGpq4Ke0IVAITG
	gVMIXdu05Y1j+90FR9YGlZBWjj64jg/ndcM3zjkj9OpA2DI9LUPDm+SfmKNZ2RglVNgxHXCiiJl
	7CSo2n4Chq7oONQE/48DmRqQeU6v1fVHnhWMRUYkgG8E1pCcc0ubw7FtNtYttD5xeaCW2cCw320
	ux+eQj6caViJdCiCOY5nba/9nVJuI5fUE5VOxvMwHsqlNLm/Mt0whEqzX0Bbs4k0BmpJF8YYm8E
	A699xbtc7277YpUvvoJaJenWGCfF2shj+rfw=
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d4439179bcmr808812485a.16.1751089880565;
        Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9AFefwJW2wB1sxHCz4/FNU0tIQt/Hnx2l8Xmrunk9knE/K7hKL3txF/JewtO3UUcwRL43Pw==
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d4439179bcmr808810685a.16.1751089880182;
        Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee7365sm7060231fa.77.2025.06.27.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:51:19 -0700 (PDT)
Date: Sat, 28 Jun 2025 08:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <iwultq2bufhlj4tbtzs34ubb43jagw2anwei7yjjqmw5hlg7in@mur3oixqejlh>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
 <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
 <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=685f82da cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=nvhyJCiy9YraiqoQAlcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA0NSBTYWx0ZWRfX01BZhuK9PLEK
 mNgXB7axVaD3uAqXGu1vTIfx4dHaCDQYV8xI6V8UGie8XJAuUMnXHLYDoAVVwRsvcZwERf7o7A6
 VEsFdSYIu9Fsm09fuDLE6yND6ftG8+ir247M8GH7aDT6E75EUf4T8fn1AJ4C2BpfeL9PQkJOrZg
 3hc6g9/wwoL0GjjQU/EAELKi3Nfn86MKL9n2EF/6aMqwjYEVcxLs8StAnvCQ78KByJsE4Odvh6u
 Pdx/4EYg3ONwZQmFf5pqZnWZ196ckSxtJYSqGc4kQpMXDXuCdUS2tZUeOfAZH1L30xN1LlJSKcj
 n7nIwrvE+OCtkkwTyQ2MVp4XBQWnIpiQm4Nq/DFWy4cR+zby247O3kwtj6gyY54jAT7ZrdgGe/p
 B7y+lu+GqiklS5ABVT+wcAS/RHcpP5xHc2XuB7mFb8mlf9BUly7jUVKKoY4BYZM9aMXte+rp
X-Proofpoint-ORIG-GUID: Rr1_ZLcz00lAZ84p_1mb2UhuhfC6z_mo
X-Proofpoint-GUID: Rr1_ZLcz00lAZ84p_1mb2UhuhfC6z_mo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280045

On Tue, Jun 24, 2025 at 01:58:47PM +0800, Ling Xu wrote:
> 在 6/23/2025 6:28 PM, Konrad Dybcio 写道:
> > On 6/22/25 3:38 PM, Ling Xu wrote:
> >> The fastrpc driver has support for 5 types of remoteprocs. There are
> >> some products which support GDSP remoteprocs. Add changes to support
> >> GDSP remoteprocs.
> > 
> > Commit messages saying "add changes to support xyz" often indicate
> > the problem or the non-obvious solution is not properly described
> > (which is the case here as well)
> > 
> > [...]
> > 
> 
> Okay, I will change to
> "Add related domain IDS to support GDSP remoteprocs."
> 
> >> +static int fastrpc_get_domain_id(const char *domain)
> >> +{
> >> +	if (strncmp(domain, "adsp", 4) == 0)
> > 
> > if (!strncmp(...)) is the common syntax, although it's obviously
> > not functionally different
> > 
> >> +		return ADSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "cdsp", 4) == 0)
> >> +		return CDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "mdsp", 4) == 0)
> >> +		return MDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "sdsp", 4) == 0)
> >> +		return SDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "gdsp", 4) == 0)
> >> +		return GDSP_DOMAIN_ID;
> > 
> > FWIW, other places call it G*P*DSP
> > 
> In fastrpc, we call it GDSP to match dsp side.
> because in device,the related path for gdsp images are gdsp and gdsp0.
> > [...]
> > 
> >> --- a/include/uapi/misc/fastrpc.h
> >> +++ b/include/uapi/misc/fastrpc.h
> >> @@ -18,6 +18,14 @@
> >>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> >>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
> >>  
> >> +#define ADSP_DOMAIN_ID (0)
> >> +#define MDSP_DOMAIN_ID (1)
> >> +#define SDSP_DOMAIN_ID (2)
> >> +#define CDSP_DOMAIN_ID (3)
> >> +#define GDSP_DOMAIN_ID (4)
> >> +
> >> +#define FASTRPC_DOMAIN_MAX    4
> > 
> > What are these used for now?
> > 
> To get proper domain IDs for fastrpc_rpmsg_probe etc.

These seem to be driver-internal, so they don't need to be exposed to
userspace.

> >>  /**
> >>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
> >>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
> >> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
> >>  };
> >>  
> >>  struct fastrpc_ioctl_capability {
> >> -	__u32 domain;
> >>  	__u32 attribute_id;
> >>  	__u32 capability;   /* dsp capability */
> >> -	__u32 reserved[4];
> >> +	__u32 reserved[5];
> > 
> > This is an ABI break, as the data within structs is well, structured
> 
> this is suggested by Dmitry, I will have a discussion internally.

No, I didn't suggest to break the ABI. I suggested making the domain
field reserved.

> > 
> > Konrad
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry

