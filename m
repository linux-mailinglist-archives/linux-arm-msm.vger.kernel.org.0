Return-Path: <linux-arm-msm+bounces-59167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A58AC1CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 07:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6A3A27865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 05:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F0E1547F2;
	Fri, 23 May 2025 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEh1cDc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534114901B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979383; cv=none; b=g2a5SfkJZ8w0S0E0HGeqN9b3+INLZBSR4NpgTekfzUoPJE2BALDQxNmqP519kz9GEaXsYuP6XIqnYXzMkjMboSRjUnDpZ5bLf5okMgiYBcc+i1XqA4rkRaj4ipF5VhaZ3lZsA2PFRV2VO9YV2Ev2ghezzJh4K3jg0k9Nbjpx3S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979383; c=relaxed/simple;
	bh=nplSLQmz/ppJRQtW5aFIEsesjnSk93/F8zhY86zPftU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCa6Mu7YmdDMO/4tdIlYYOy5JjAfRnwqw1axIuiLvkDow8sARqc4bhLxTRvXnnOL7w57VJQaD602zbdUDhrMlVJ7imrj/zuUEHMdCQ0HX385mV0cqsrfmgX5rhVQkjV9QjAyMfxhUc2W643sHGv5Gfq8mPxKRokuc8kqnnM5dlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEh1cDc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHEGST000862
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SfGjSBw5GAu4E99myfFk4Hd
	Ng8QxEWTCMYdPfNypkY=; b=YEh1cDc5WzJiOCJ4QTIV03KG3J/qu/exi19e5nCs
	LD/U4O4Jx59Ol8+Ny2GkDLQM5qrI3o2MEyMMNQWeseHn3NdDetTMrzQIosF0N17G
	fj3j6RnyUDf45LHulkpqhOYl+M79sTfMOKUHg3xtvzkP1f/TcuEhcdNR54NMXmIl
	OvvzzWFqdH/3ViRwKH3UPYVmAQ4br+vCoXKz1yxxgBe6lGm7kpg0a/6HniGn4QLd
	oK+dx7hFtIiLLWgfMicewDmcLlc8zURPZ5HQHWAu2sDiOqjWF77RcWNPNITAD3CS
	ScQtRzuKpHJC2G/PMr0QJ5nFYxUqD2a+c421iy03efoWiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf70k7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:49:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e23d6657so83040656d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 22:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979378; x=1748584178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SfGjSBw5GAu4E99myfFk4HdNg8QxEWTCMYdPfNypkY=;
        b=w8JpBRXtiy7QfDHWqczD7EWJwrYpr337+gdhVYHOzv/lPuTAPZ4d3gnZg1cvsWBEd/
         96wpl+E6+PLRJEvxoa5PYS5ab42H2BiIUJWJYAttc5SK5S5OtvVfMr+fhv7jGvpZ8zsU
         yAt1HsHz5xGeVX8GHeMbj1sBdyjKeTWrHztU4/jpAJoJDiqaWFqZKLy4LGqS6Io6ctGz
         YjK4NQx94YH8WVe05Qy3VlgdsF8pizvbIDqmGVHBHHPWP6c0EdH15X9jMTcL8nT7pJ74
         20F2Q5RqhPhS9dyF8zMEg7k5DGyxOs7pPN3ZjHIWUgGqmW/jr/7vIXFI/VLYidhzxSQW
         hBgA==
X-Forwarded-Encrypted: i=1; AJvYcCXrwT/7ID+C3kdyTm3F9FIinovOL3I5idK66VB3ueLQmra0KqU5LVQQCEkEiEBTbnytxMQS+mNATnz003WV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx4VaRS4K+NOFaSZDa5Msl8NnzEkp5dXDSsWvfZlj0lxSYxlZn
	v+0ktjmLQGFBJ4e1mVb0LC5cdzIz1626K/DRyidj+DaS8yIoJKyl0F/MQY6HLZTTwDRyuR1jTna
	W8Ixyg/HJTu2G05T6KywexDr1IHbnF2GBjDXe8IM7uG8J+ZR+GXdrrrjPhGWVoYeU2h/F
X-Gm-Gg: ASbGncsLf9efFVprbkOW8KBEDFGe133egtwT6W9DbOvTTa5XZd3ZuC12muNSY7CVkJi
	e973F2wtd0Xb4lSXmV85eLFJv0M37w6uO4qfdFwvB+Nrq8XOnSUhAOvJts/eRlBBNBCKycPrTLD
	5IGWdxXVnpKzRYlupYfRT1yeeSK+zuYDXv9qOeb0IEjHOxlFUFfr7o00cFBu+MyZPPgzGczcWDz
	RN49hYcJ/hYfe1mBdqe6LmZddpjovFwXlT85j4Z6/HN6SXyX0z0bvKDe2nQsFJTpCgWVfwFrCH7
	2SW472Ffyw/rh5cIGJESZ1Q0NutFA/GkZxKmTU4gqa8pHTrLga/J42JLzlPunxqBUda9MazkljU
	=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr430806506d6.5.1747979378378;
        Thu, 22 May 2025 22:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFheDJVlbefAnPn31NTy3OIuOBaiLApvyN7B8S1z3Qk02zHaxCAQYIRo2JyE3+NGM5OzGYdZA==
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr430806236d6.5.1747979377959;
        Thu, 22 May 2025 22:49:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbf4sm3722164e87.70.2025.05.22.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:49:35 -0700 (PDT)
Date: Fri, 23 May 2025 08:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
Message-ID: <pkimizoecvqzzioqyd333lrchjkjo6to5fnjezbgbazjsowg5h@5mzjthmzeijb>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
X-Proofpoint-GUID: 7Ba2Tc9wl1MkLpyxhNimLVR9i8TQ9PrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1MSBTYWx0ZWRfXwere0EVWu9wR
 6wPa6iqKgCBDYMiyoKc8s9qC+eORzb6/v+gTqKRRed9k+ynbRy2iAL5HvAafs6zyo4DX77N93yA
 UsEMdifq4vOP5M7n6/uTzRwNIQGzkFKNBmc0XNVWPCu2si84Cl2FrHhRbIXEmgfzlAExEKO2IIx
 jDzYeS2CzXVDAfyUOKryn0KawXcpcEM1GQWyfy78rLwkolqlYb1CCbyyzJICD6UPXXQNFwK1y5V
 OS5v4IdLnDVKzGJNXoIYW0u1fzTxzGpZB4yZEcjL/DcB7TXtFW3erensqSCZcCUzBDgaZzrqnxc
 mAUP2Pkw4dBsEpLk52XE2zqABPySHiHef7QrUz/MIqbva8S9ax7YRLIE32FYsVoGGGGKlhVRI3r
 UW4JNgya54BmU66CCwwtVP7p5etSz4Ze61K0NM/8ZABvAASqyHjqdcCi3I8/HAflkL0ZYXov
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=68300c73 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EkgrmPCljZciWarWCYgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7Ba2Tc9wl1MkLpyxhNimLVR9i8TQ9PrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=735
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230051

On Fri, May 23, 2025 at 01:08:34AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/net/ipa/ipa_data.h |  3 +++
>  drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

