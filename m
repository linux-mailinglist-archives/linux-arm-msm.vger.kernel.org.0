Return-Path: <linux-arm-msm+bounces-66529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D8B10A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9C016698E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B922D3A9F;
	Thu, 24 Jul 2025 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh1WWtEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EB040856
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753361271; cv=none; b=dCMisPHjE3cxQfRQjSusRtlf90qU929A4RB4K3Fz9QJcUYbLYopvhYNXgIldqwn3xSakcruxC5xkVvQW7+7eCB3DWIsLJSNf5S8AquaovaoUIOysGi6k6P/xS3gCyFZfmFbCvCN7QSkO0OwWtFh7kkVxm+AQorG2UjNTUx9Rd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753361271; c=relaxed/simple;
	bh=j705TJQJk3x7OHyAVKzeGEgdS46JMPnBxolChxBMvjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fE7o4919DP+Q5KJBNFY/jbp4y1y/6hRic6ZKPbtMQEsbLUovnQkJJRMQkY2FMJPkv0LbmLRrolMU1UUl8R2CL9/M7z2yoKK5TXHLUH/RDhPtAckB9hiL4FsvQOoqZ30/qDHKSolTy6+ar3RV6jJMaGJ4987zsqY8dI0NMa+0qxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh1WWtEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6dHKY026719
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FM2xPuyNBnGL8vNJqSnDEcqFKlOQpC0+BnPbT25j0M=; b=nh1WWtEzJEJ0nnvL
	24zfprhbqKdrDt1dh3kTwGPd8nZ53puQpkEUefg9sPjJf0NByZeYo1XmDDBGW1LB
	ltExW/fI2wfpHJbwQgpyFzTnGvNnM17peT9qtGshqZVlQWwM6ZMUeqIhfAGNUYxO
	JfYBDZwDHEdCziHV15Wi0SMH0eRdYfw5mtTxBncc+vGCfEBh/4gWs6LWO/g/B+1p
	VMDoWiTAsw1NyAAi7Dbs92JC/N1lKpQ1VbSZ1G2/sLFWkuoAJGWfNWPybtsnGItl
	YDNGurBRuQm170vTnnQwWlBaiukNZ1y0L/mQCacJH5ZF5XD08nxHZutQrHziMofR
	IKwkkQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483frk12cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:47:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7071981e657so265456d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753361267; x=1753966067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FM2xPuyNBnGL8vNJqSnDEcqFKlOQpC0+BnPbT25j0M=;
        b=D/EpBhbQvDZuYZBPExUzEoMMZQAwn4BCoPSzjd7HDkqVwvOBzVRChfBPL0S5NDjUzu
         Fu2K52o4SXGjacOnY0GSPMlgF5vBj7YYwELgw6Wg0T5EhFUHPFI3VCvhOQk5xUvK7bHS
         FJZHo/YAT5pkMYP0HL1o1FuOmzUm3x+5KOLMhrMNlzMeXzdxCZweIa1avv7hLwb6Bi+p
         iE/ZvnEgazahGW4IbI8Wp4N4qJYaOl8zcccJ/D8KglrjAR19F34qazuZ45HdKfrDnjNu
         Fi9YvT6xVyy4o+hRbtJDzO60FwFiX6TOVRmGrGn5yC6vgli4G2eiXyzY8b8YAOC8+WPa
         E8zA==
X-Forwarded-Encrypted: i=1; AJvYcCV8wNjzw/F8fVrfnBGbZLtHjYlvBd0r7lwqGY1GYhuol0yiCrpeTOyflNTxFG0pKd231BKJSaCxX3z6ksc6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+I9j1I+QRmg7Du8U5omiAP3RSBuqoE4APDKuVsiCQo05czjK7
	J9CQSfzuHvUuKVgT1/YmgM6+NL8a7HoDIQwCt0CH1OjMzAphypdh+qWwnlVktQJMRfavMiztjt1
	beo0skIdcCbpgEBDohJsteHA8KqCV5kPzU907WAQXeVyQPC8vkch929VMmprCLcGud2bZQmENPV
	nN
X-Gm-Gg: ASbGncvDJdON0R6UGdP6cXqzVaIag9T3b5s2M4wpJ1Oatq/szGJ4Cf77lez5msvgCIS
	kdR+DV5CmBfAf2c6n2mrlhR9V6JuVeD7pYgBU7beTe6kXMD2imjXNwiD3EZwl/WFhbrTsUQ8Dej
	Q2ve6YYYk2a7mTEi2QO1Ji3gMhuzJA3SsI3eW3vj0JVL1peX5Ft6xJWPYChmLIJlqUNt8hbe0Ep
	LEwu5zR0of659CzvI/ErIoG4Pdas2rqP1W7NHviZAtLPve4Aw54mICMwZ2xsTIaC5x2t9uQQGke
	NgkI5fhFDkM1ARb4Hi7ctL4FZ3apPHveYKRpRtKywpc/8VgTMISLfPCVR74iUPyKUBER33sfeyh
	dQeP1PK69G+7deij54w==
X-Received: by 2002:a05:620a:2606:b0:7e3:4410:84a3 with SMTP id af79cd13be357-7e62a03804fmr308919485a.0.1753361267136;
        Thu, 24 Jul 2025 05:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyI2zhNTupwdsIDnxsXopNUvVOzCpZF9qWtxp5NPNExIrW5W6unnaR6wpmZfExbg7wpVtu9Q==
X-Received: by 2002:a05:620a:2606:b0:7e3:4410:84a3 with SMTP id af79cd13be357-7e62a03804fmr308917685a.0.1753361266512;
        Thu, 24 Jul 2025 05:47:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cd65089sm109986566b.56.2025.07.24.05.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:47:45 -0700 (PDT)
Message-ID: <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5NyBTYWx0ZWRfXx4oftcHfCfrU
 uAciYbNUsuiWH70gwuN+GFwajKvP1S3pfpS0khhTKwcSmoRAK3bdCKINoh7TgJusD1Yk6TKt2Sd
 Ae3CpuIZeJUPDSz+S17ZMPQOiQn2agmhqmY4rk3IU8vRyfkU/ZkzLTcqbeF5bKuwo+sgSP0UHnZ
 Rr00DPWU+l7no57d11SIct2jCY7izIX7L2/qO5XyKA2KDV+Z8zLSliGBVNn5oYxq1i8K7Z7GbNA
 uzwweXB0T8ScTs/UbmMZMI8ehUfqvSvpYIryVallfFBdqU1CZVK9fAmjcQefu5WS0pGW/O1G7/T
 qJFQwyt0yhYswvzwh/9xDcbxaGp+CuhIfCg236qmGy2bD9BTAeBAYSmljM4ubencMaKHjY/r5vp
 hH5B0/mN5eORC2y05hbVmHOoR73LjKDljFshG+azc4p3ojr52nYcCN2DIkUyM6GRurTMt1hI
X-Proofpoint-GUID: B8Cd7KIHnBx2usbQksD1blKqxSxzrEG8
X-Authority-Analysis: v=2.4 cv=WbsMa1hX c=1 sm=1 tr=0 ts=68822b74 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=yoiuoX9zeVfpJc3uYVUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: B8Cd7KIHnBx2usbQksD1blKqxSxzrEG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=895 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240097

On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
>> collectively referred to as lemans. Most notably, the last of them
>> has the SAIL (Safety Island) fused off, but remains identical
>> otherwise.
>>
>> In an effort to streamline the codebase, rename the SoC DTSI, moving
>> away from less meaningful numerical model identifiers.
>>
>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> 
> No, stop with this rename.
> 
> There is no policy of renaming existing files.

There's no policy against renaming existing files either.

> It's ridicilous. Just
> because you introduced a new naming model for NEW SOC, does not mean you
> now going to rename all boards which you already upstreamed.

This is a genuine improvement, trying to untangle the mess that you
expressed vast discontent about..

There will be new boards based on this family of SoCs submitted either
way, so I really think it makes sense to solve it once and for all,
instead of bikeshedding over it again and again each time you get a new
dt-bindings change in your inbox.

I understand you're unhappy about patch 6, but the others are
basically code janitoring.

Konrad

