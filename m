Return-Path: <linux-arm-msm+bounces-59138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9750AC14E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955FCA2162A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EC72BE7BD;
	Thu, 22 May 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl7DB/jz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEE1E51F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942706; cv=none; b=I+j1dsTTMMs6TgAo+DcQyYZTlJUWckumKxiQy1mIUgLxjlzAD79BvpS4XMZ0JnPjpNIi3bI7oo4mB2x018WLsFgD/aPz3iyZ1j3ZxCo8t7ivd7NFnAZQ0/x9fvH3XD82GrJz1QKSUzNoK70zg5yXsOSmEu2xXGXCTzdksNJ7cI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942706; c=relaxed/simple;
	bh=q7mqLfjENNgNP706ckkvIptpsi1F/7KGa9dgbFNqNAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vta3V/8TqZLSlLKwZG/T+GRx7frskwjThzFpZYf+78MEPnV9/m3Zd+QDiAMf1OPHZCBlIHmLSudEa6f1PF0grDQ17qdU82OqI+EYp8zcNyFRgbhjfByG6n0Bn1eSGxM8cDjMykUG5fVGERvsb6nKdBvXxX3cGFpbM7H52aIquus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl7DB/jz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGVaB2029164
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=; b=Yl7DB/jz0EzwSBp1
	LqD9BO8Gf8Oe41PkxdLkvnWz71ywYoNrRJByZVuwQCZpbI0SCe+QXfnte0oFdzCy
	LQ6Rv71FcJuZwHVsdCkcBCOwnM6JXUUWn2sInzckyHhlm7Cx5LB4ZiXhwBkDX+Bx
	30dEFEjYktbBvPTDDAQSD/RJLmgR6LMgb0pT5SbEj5H41jadXGLJPl7FwAxwSPKj
	dnV1tAoYU/R3iL9/bSzpLBQ9DuzkzgnzOT6ihjsklgxWs/xv6Vd12vygPyRu35Rn
	0kVz7H2QAUGTs/NQJ3e3G3Ra52P1czVLB5TI4WO1tBqWaGdchtxoT3NxYGMWl/o9
	6JF+9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47npb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:38:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54734292aso225988385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747942702; x=1748547502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=;
        b=Bg+sRFhwde2xjIoZFfGYeayU/fhi+sBk2PcVud/A9QzAfG+1ZDNzOj/pIvwggJnBNp
         F7khs8m3yLCUhGqrkaem8U14gomR/C1fDWJGT7ygIv3bOKSqmS7fkpYYFAndkCGN8xJE
         sQpyDzOSAur8D01mVM7l4OdD9Yzj8ybPMRIktrGsAR0XSo0x0pLoXFv0ZywEp7aB9PII
         Cj7PO6y0xGpaR2XnZhcJJQZ/X3VE1h3xUTSvEyaunnCESAZKV7POAmGsV2UYszoMqb4N
         +FIY0QaQa+yonI2hrfRQKOOduX1B524eYDB+PqiUG+hyUZ8tNXNeQ/oznlo4rpxaKl+q
         jKjA==
X-Forwarded-Encrypted: i=1; AJvYcCVZmuZ7Hdc8Yba+5YSCiBYjz571GlS4o1NhIvNzkNm3e02xuaZoun7JCYfA440TAYf1gQZS0rjzA87Xpzjd@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXEsX8tZQovjLf3mxYQgvxzDXsNO/4s5AM6mm3i7SDr5XCGgR
	b/Sv5kBpwOcF2HzEzVBhiyYL+sUFKyaDbCBljUFdl+KhDEhaOVYPnvBA640JeYRCDO6Acvu//5k
	TzAxNcjx0kWwYUK4CdGC3y5/KHm91UKQpPXc3k26JVkz7n2jLDeB2Gk1/RrzpIE+zDIcM
X-Gm-Gg: ASbGncuukiGiofJPfITRJH5bZL8udQ3xGxdaLTvAgE0np7nq9I3VB69b9/ixVn05Jmu
	+xJKOROdZT6gaZbh5QWO/OhhI7cOeRGTIkds0xLKdcvrY6MFvuM7MrM9/XlT9OrOdnQSiIe3rRs
	zvlqyIRh4REe2GPL1wAl1JFDUE8vzba6ZAQJB3jUc7M+/z0I8E3Iwr8W1rvfhLNXjYYs6hbpwhW
	cvp1prDk6NPazzLNUr+BkH9r68H+gf9bUs9bSqx7InDtxDItZgPMD+6Ikrucksc+452eHCwStdL
	Ro9GV0Cy2odQQYZhbOvpl0LPKwu+SeHenxAky6qjPyRvXxDsRMEsamDrLOPrbIlUMw==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659322085a.14.1747942702219;
        Thu, 22 May 2025 12:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1KQbgFQvKgKzZOxfQl4P+o0nz/PMO7DCB/IkhNmAwt/2Mx+vUW+hul4ymo+fK/nT3VCXeEQ==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659320485a.14.1747942701886;
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278290sm1112380366b.78.2025.05.22.12.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Message-ID: <be9a5e0a-1314-44ba-a8d0-f1071138c86b@oss.qualcomm.com>
Date: Thu, 22 May 2025 21:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Fix SM8250 IFE0/1 max clock rate
To: Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>, Jonathan Marek <jonathan@marek.ca>,
        Julian Grahsl <jgrahsl@snap.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>
References: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5NyBTYWx0ZWRfX+VS2O1nGYS2P
 G1bsHL1ZuEF4Z0uIlz2RcG5ENNYoGMYZ5IVWj5dBAQMhW5PLhDunMMk/xOCO7/DR5+VT01GGWYe
 Cqrh5Zgzv1z/T6h7d/d6YUcyGUY04uEwYvsGX+Tjnf+21hzno9x5Uh5Y6bW747UQ0RBGkSvJ4c2
 2f7BsUvk8N6QDQKW+lPLe8Yuw3x//pG7ADuvymFeBvY3k3aeMxvgILx/eFT3AvqPXSVjzj4uwyE
 3yrweky5+7NnxA/85T1xn0OHhw7LrDs/mKwSTYDn4zFlZCk18hRgAKHtqg0dzx678e725iHcqPv
 GVgUW6BRT8sl4iYWQpDPO0vJEw79tCXH91PLxWvRfUSEGF0TVgDyo5czs4+ZKrsg/PcIhZf19w1
 ABArhGbTtWc4czPi4LnWQlDwF/zJHIOr4wWL4rR3rwCjtkBjNNsUeQr04Wg6wpdQkgp1ouBI
X-Proofpoint-GUID: bkdC-SOknwJj5TvktMA_jP66oiG0Fn2r
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f7d2f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MmXTpdYTAAAA:8
 a=TH8GZ54sAHZQbr7yu8oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=7hoCnnChfAR1N-e-f1W3:22
X-Proofpoint-ORIG-GUID: bkdC-SOknwJj5TvktMA_jP66oiG0Fn2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220197

On 5/22/25 9:37 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 720 MHz was used on the prototype revision (v1), use the 680 MHz that
> our clock driver expects.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Jordan Crouse <jordan@cosmicpenguin.net>

I meant to Cc him (re: irc discussion on #linux-msm).. oops!

Konrad

