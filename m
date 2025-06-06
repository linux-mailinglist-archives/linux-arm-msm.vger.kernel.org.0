Return-Path: <linux-arm-msm+bounces-60428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743DACFA5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 02:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3CED1893B56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBCD7FD;
	Fri,  6 Jun 2025 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGFFdSHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259D8C0E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 00:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168835; cv=none; b=Feo63mwlDzbYyppORPyc5V16jZs8qg4GoINmLCKLIFS7/VsCMKf/3elveJYEWHmvS8jIG4JPU5BlI9gWOxpfSSuB75LAfqVsI8vzFZAaN2SYvrETAcP38xcepYST4e0kVBwVj7Smxnb5rhG0e3fS0CWtOeiCEgA6mQU814m/NJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168835; c=relaxed/simple;
	bh=1ci5R2NzDGs9Zy3z5xqfBnWX5eSyKx4GjoIMRSFtd0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWz0I6ZM4OUgGwNcsCeNrUgaThHtHPm3GDH/pmp0vD3LdPov1jZFzL969Ms2DXID1/bkWMDFGrztzTtuI8/g10psVCArpm9NhkjjZSWHSFU6wiJWgMuNiyQ+GfKVkBo7CVv6vHiGqPmO3PJuij4RTEK6FO0MjUPCQB/huC4ifkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGFFdSHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555L2GVN012740
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 00:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=; b=fGFFdSHEGNUdEOoH
	IvVwuSZolYy+p0nCQqjaGvQ29U3C77J8ZYRiBr73E7OWIlsmtOdaOM03xc1CDz4X
	Dj5xwJlmhAvoXrSoFjR47aKQOYJNOcjcqBCG75XhFQCC8FzP5NSvBjyObMtFDvfg
	1AvIJ7Dr2najsGkQF0HBB5qzkubdibAwpfGnOvyy07PSTGAicr/P2LasovSernuR
	gAsC8HKH03jtMamcbfVm2AaiAW3c5UHBEEmveMZ+rqhl0Hcs3UDwKTXG/MSKVw+x
	VDei3E1AW/2wFOkTOcITQE+CqE+R7+SyqveIfinEQwiGAxTjpxtTN/TGDChilDAx
	fNGhIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be86p5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 00:13:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-49a4f4021ccso2575611cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 17:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749168823; x=1749773623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=;
        b=qo7fRf2TqcVPT65wR1TZ/PUqay+agXkh6RU/2mF54BpuxObGmk25Dabii3SxlzWWYH
         XdWzEDWCZToWw6hhLJ3UpqvWfN11LvIqTA2MF9huP1jQgjfIygm7wfqCa4d56hN2NAbU
         9bDaPrBTgKJMpw2I5cFesI5uqiGsU+TQcXddH6UfxDHmlZsErfj+rBtK5d7BOnNez7yH
         WubXPVvOH7Q9fGPbhs6cUupVW/cWNl42bLMHYzPGecffLM477P2IMMUpg7TSWO+Dc9Es
         n5ezHdXk9TGE54C+/A+MjQgm7BgmpvxBF13Xl6UyFTOfKrNZDoQ8PDSoIxTtfzcuxuXV
         9Qrg==
X-Forwarded-Encrypted: i=1; AJvYcCUzwRnEJBusOjTbcKVdgk4scd5T3NrYV8GSQI/1y0nDo4OMf3a1cL0zaposilB2Iu84NGPUkwwM/amqZu5M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UV04G/0EYH+01G0fnrUncWgBQuwo92lW9CtWugLtbV65HPpB
	muG6cJnX6aVrHqdqeApFJ3JcjE0X07vu2l8ZFuv70JndMUZsEg1BhNtAXvzbNqucSH2b1rDLGbg
	/DDwTzxXG3Zjq4F8RP5nQDRi8MB0jfNppyEX8Ge68w4Z5fOso6L93+zkTBAw3Mw9WN8ErUK1QY5
	NY
X-Gm-Gg: ASbGncuqJJRsjr2+mR5fkKNQKSxxXLmv0NTWyl3hWxg/nMuXO1RT9A1eIeLMzK502+N
	YbhzpDF1j9W+ldTLM3KKVgPg8vMZb5EzYAuUawRWiH+vRGV7QVied2VU3sgDFKi0Wzu2U8LDJKh
	+wschMDYrnEwhEYvOjOXdckOx0PgFWTLxzxHLss31EYoRLgws/qhtum1KH68aXjUWQ90J2sRt6M
	ERQAoRRWKwjuXL1km+9fi808s6I+1Hq676FjMX2WiatG/fdP95mFl8SHpRRnWGQnsNuIKszEK+t
	qUvnezVb8tCQITaKAsgp4KuJDfYPrblUSSKxkn/ewFxp6RvL7rCSt2e8lcEYEqaZ//IBOzVMs0z
	T
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14444285a.4.1749168823034;
        Thu, 05 Jun 2025 17:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1I88zELlFQymDFktqh3nqMKdf4ODb086uhCaONDMfm1wNpqDjMf6iaqOMJPu/FfdCdrxBuA==
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14442985a.4.1749168822649;
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc383aasm30038966b.122.2025.06.05.17.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Message-ID: <c6256bd9-1316-4de8-a31c-cec782220b0a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 02:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
To: bjorn.andersson@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=684232c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=laPIkmKxayIJum0PPccA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LLgr0lzg1cvSBq7l7IzcSlxR5NtyradW
X-Proofpoint-ORIG-GUID: LLgr0lzg1cvSBq7l7IzcSlxR5NtyradW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwMSBTYWx0ZWRfX8YNPbssJZnzz
 cVXafZvO4CvrRY89zfpWJRnmUHZ+9rNfNZOuMb5wlnWQsZrCglKxW9xT8P+FmAc8Q7wMJvNXY5z
 Ea7vUur047esa4We7raEtTSr/s2Jz9nIVktu2DJfy+H6NDSwxXVb5Tpws2a3ZWNiqIyAY9ITtDd
 7e9+lREB5u6V4g+6pTwdWps8D+jYp4mVAFMT2DOI2gurcZT/PE/ia6AmtpDjVl/p5dD48+yJscA
 Cm8lZzHVGo/SCr3gnU3sCmyZa9NSAifV/kv/HJb45btBstslk8+7AGcCwb9Qm+DDnlBYhjMjSww
 z5grzUMv3PG1omsoQ8gHO/k3fwVJlOND9xThxVC/TYEhCR2pcwiamUDr6EsGgTcD6JbBHeEojJ9
 nOQvBPO9S9rmk+KFL4AQ+lNLMRXuYR3ImC/IHjX6rvV6HlMghKFFjH5dMg9BsJhU9Kgcwcz+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=952 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060001

On 6/6/25 2:06 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
> scaling to work on the X Elite platform, so enable this driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

