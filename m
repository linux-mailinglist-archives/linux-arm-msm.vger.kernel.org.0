Return-Path: <linux-arm-msm+bounces-63572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC75AF8186
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF295827A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 19:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504921E0DD8;
	Thu,  3 Jul 2025 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUQiy/Az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D26A8D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571937; cv=none; b=RORegP4JRW8jarX+MYZ1eZYwR+RXsvib5IL7Kxae/tY0zgsn+a3J16cHjbUGgsLE0COuEo1wkOKcN8a+WuV70WxR8HHZFtPAXl6LEoyl/NpWK3T+ePHFPo1ngRjW+HLdIzx+rQLmEkrg8d5ripT49q6jt5NErXvcbQB2Ka2Aons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571937; c=relaxed/simple;
	bh=kSqEzppJv1vT8MFMr9lyH8GgwoqoAgSmPlT5BjUdQDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ts3xuE+DM3rmoyK+0QnrLkausR4/c/WSo3CHToEaVC/uAOcqnBUeu4yyMmeeYEa8rHbRJhWfRNzD8yMCpQsJhEtt3LpvobaWOSCgDYeaKTjeagOWiioUbiShCUUoFrG2zGOfOBHa/6wWdBoUBLETM5lWo0/wT9aKtu7CrP6c/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUQiy/Az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563FVnpc007050
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 19:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vpm/8/blPnVQJ2JqTB/4vup7
	1un8wdZkh1pHtFspQj0=; b=bUQiy/AziUvgWs8sAbndrYWYtYVCEgWeL+0ZUkr7
	dLIGP5bap2LG4Cqt8xdCLSq0Fbhsw9bYTklm0GbYRIEPD1IJ7hnREy891O7XxP1+
	4ksnuQ53VpixxZVF3e4jqOO0IxL5X92SGdGcW6iio3cZDqq7HNNBzsg6njj5EPOq
	AlY8SUvDv+OLNJMxH5KYVd4qSyqrDHDv7ZlKLI52g4krg5pYPzUZCypsuan9/1dC
	oBMWWkwHq1e6oh5OSTxy4gMYcUTj7XyeIqYluQftnhsChMGZUfQAcbcKyIVVyWxb
	e0hXXYrs0YYRDp+1Bw9e+MOBueohhjFU4sW1mANnUhKXlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jp2d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 19:45:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so209909485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571933; x=1752176733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpm/8/blPnVQJ2JqTB/4vup71un8wdZkh1pHtFspQj0=;
        b=ieWeY4ELmL1a83CEK+ObuLhXktfdQ3Cpn/OGEWud4RfJ8+t0f4pGk/aZqtTGBCI97B
         agbq58PQp+kWArEuoYnRjX6z6qPreruB5jOM9lHzY3fqJ+6kSi4XAbJdeOJL7P26H5nV
         Ur6uBiX2n79zDotDTnVPBYPyrpDFr/jvjryYXKJvVUlMEFk1/EjXt01dmxk2FnJ2vSg6
         oewOz42x9j4lf5Rqbr/VJ9Zm/IU7Aa4Z8gEgmg0OcV8I9de8nKnDPNBIu8lP6dgz11z0
         jYGgFQjBo36JRMW7kZsmd2LnblTP5lnehR85ryogQZWQH8+W9NmysfWS3qPV5guAS5DM
         V8zA==
X-Forwarded-Encrypted: i=1; AJvYcCX1wXHB41oYoRIgevz2wUaCKrbfvb7Megt9WsDGj2O+ZiAZo4xitMGe0vJa+YlybX0vWxbh2Sy9ExMY953h@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKxwx2XTB/HhWP+7ln79Wx9+PK4F9SG4aW8NvnQ8Ry45Nu1Hy
	yXECx3rfLRnZL3IUSG9msEBXn/aYDDJKsjP7f/dnitTruM4Rc6V/LDVkiltVB5+IagAe1xBt58B
	SNcpO/xQnbafccUomjsNHbnA5tCWgmsAmNZgj4i+hyxJHdHA0GpDvir4uwWT9dZw6letR
X-Gm-Gg: ASbGncs/9ev71zYyK9t8UJUGUBKImS7y/iCPeDqnHXns2i73fVN93mW6zuELakQuZSC
	cA0EA2M0MRfwd3XNz39qp1ONKA9/ZgDoTmHKFmVnvI4nQc1CYNeqqyr/ahd8VYnQUiS0GUj6oP9
	YomsSsYqtwv8yC5LBOuxNfgOgXz/Vjce28plf1xaJAyd6AVb/5NhpU1sT6jB1x8xrUqvmSE0Aoo
	2Nu3gaqU+0u494WrUIFyKtPPfpYwsdVEoX4Nz4pRkikwHGjrT/VYCDllkSudKEKiL/lj1mgmlaW
	pEcNnSuIKdddGGqq4PSU0XoiwXHA7Y3e4XEoCvDiGO+0eZOmPZo+DJuIw6mirdfN9XstAcCoi6Y
	tG1pJL2s1BvaA8fKG733KT1eSgFM7xajHur0=
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d5dc6d1439mr68784285a.21.1751571933518;
        Thu, 03 Jul 2025 12:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2Tkd8SIj2e0FW5ub/c/5lxoYYP+U2g7RlQkzD/Ph62/PI8j/lbSO1AAEZvodVq3joV8+IQ==
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d5dc6d1439mr68778785a.21.1751571932911;
        Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d57a9sm52843e87.257.2025.07.03.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-ID: <nl6qf6btlkr73ozw6psh4hyt5ke4o6hlctbgzcjukmr4dojbes@rj3zqv32nn2e>
References: <20250703183455.2074215-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183455.2074215-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6866ddde cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9sTWCGXqcYbA0vK5jiAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: f64J_CyvVz2mWXUK9QOaVXBE-Fyo0wru
X-Proofpoint-GUID: f64J_CyvVz2mWXUK9QOaVXBE-Fyo0wru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX1Ixkk1xAsgc8
 XbJ+DnWOyhQ6pTZd54tAa+2x41BYiZcM9Ri1YsAfkNmeZw3n8rSQi0z89T5tIMS+83KLCip3SX+
 kuqDDuPLw8LLjrc00AzqTBmFVpJbbSx4OrGvMzo5LsiTrUZyKH+KOZOHMXV+lEpkwMR/6VqScD7
 3e+6F4+GVvdVYHxRP/kc4bbMtDVYUk8aZFhnlutzZ2U8IBj69Wn7n4r7pRZ/tBvRHljDqCMiPSB
 QT7EQzmJj7qp1s87XzJEiqZOPXuakf/eYAlh4nVhAU6C5dfue3vS0Vgt0RmSuKgnu9Ex0gCZh0E
 IBJhBruKUEzKBU+wepvJmjxGaMCxFL/crGHpy1YVE4iV/X+sjIJbwS+cX7kWSC78/0D8/xhogqc
 ey0JLZKtxOPfb+ObahHyl9XIoe3u6AO8WilaIKxJzG5HugQ8Y1JTWhiPuuvHxrnIGrS/+fxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=568 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163

On Thu, Jul 03, 2025 at 01:34:54PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_reserved_mem_lookup() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/misc/fastrpc.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

