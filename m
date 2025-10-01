Return-Path: <linux-arm-msm+bounces-75660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC02BAFCE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C75C189EA36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DD12D9EC8;
	Wed,  1 Oct 2025 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAegxa6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449742D94AF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309874; cv=none; b=dwaLPcoaBpnGmZ5jMmw5dKLyfLr+0lLLRxc34IxercMKtdCPpOyUhbROxCk7nCwg+mj0S5Y1rbSoNBbB0DHE7PsYtdC7X309UJxKGLA8DWvaw/GGPCuH3ZGLOGSDUwPcqPjWXdaWVFxyXOYfVYLSXdKEUmvSSVUGGvdX8gSEiHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309874; c=relaxed/simple;
	bh=e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvUFWg6ju5apAL4blCJyWOPItZK6fxy80QRvCVCjHkAmRypEpUyIxRaMwEoMWcrFWKxcQvp53D6h7+J0xoQbo7EpdVVAPlaFS8Se8ayE9I/yqroJI4LWnXnisgFcTCBELkF41g1e0bGICxtfcK5ng8bCIga1mZ/VEOW/HqvuU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAegxa6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMDIHA001106
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=; b=CAegxa6qKqqGDQ0r
	Ilfb7tNf9QzTIO8VmKfcoZglS9o8aJ9EzKim6VP+rjNZP2iYuIOjSFGEOV7lHQAR
	W4r42MC0nNcWyRCDXR8XkKCf96Y1OdFSnBIKBucPipY2pQmOERBr0luDeFdjAN4q
	2/h5qjmYy+Qrhj+sUlngYtPjsOKLt4SanvwhE2LIJr5KDta/OhY+lE4PPt6qaYUM
	IkZhzdYCV5PhaYVpr5fGgtoqgEWWZqzCRBc4kqI3lPD24Tj4RCnZtDnvIs5mVtpL
	lyK9uI30jGDj4rx6QzxUGKblhSXh/1AoF+ajYgTKW8W/gtFaGDpIVG5LJJaHZo3t
	7ZCLBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7ete-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:11:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8572f379832so185941685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309871; x=1759914671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=;
        b=EAfT7WeUBpw0JluoiEZIS0P0BFhAq0UNkTxYlScZgpeiIIKAIwoDxqAiYviSDwAcfJ
         BZXOIG/d7dwzzuSM+HEoKd0EmLFjCnnCQ3WRFW1RjHwuNrTr7ZoqtRGODQg7621J22Q7
         RbEunJiIbyZLI4aUoTzhll5sDQEs4nNyJT5CY6DeX0NdsfgVQd2quq8wtlHqUNlgoR+W
         Im4BtCuehC2eYxoaMnA3GtG2rz/Q9gCR5Ry2gL808t2qRz8BquI2vW7BWjffDreBv+eH
         yUMLSio16qfuaSB7kklomBqL0cuk9jHFFA4vXoPCrpVOoFuC48lRkp1YrHZcgawoE7/T
         KA0Q==
X-Gm-Message-State: AOJu0YxQl8GPjWjvdXIbhLxGVsNN0QhuNlG7q5NxNwsL5VP/tbNsP2k7
	dC2oDV9juKquExyb6VJ3qn8QO7eJT1EKq7Nt2C+HPfYVEamAuXF3Uhec+ArtMj1OqY5MWgWvuA1
	zQt7pQGqMBly6X50SIFUym2FXN4/Mt1zx2PcuPvkBkon+fJQPdNq0kUCoKcFyZLWr3+78
X-Gm-Gg: ASbGncv/1ma+FBy2yGrm9n8n1PDDVD/U2xxjRi9p9GDu89V45uWVCp4t3bryBaIyJUZ
	99mq37q7EtOgitHKaaJurE7czcr/SvzZL5U2zvuoufjJdnLUnL7DrmAVlEV5b0/8LizVMzlmUnR
	TohJnoIeeML6nbxHzhLb4w/y6qooL9U/mbJKFi1l+7A+ZT1PWPccK5KQJuo7mi7HsiOxKzVeVMQ
	0+V6/6RRsHejS4ivdf7gaJOyLqnOE7Fl5OvAeS6aJavNL8b9kqmE0WYfM2zjFDIP9PziEAv9ous
	9XwzD772H/omD1WWQZ6Os+DHXizpVjyvQM+BC11X/PCIEDreCz9MMcEFwfsSp0gGFnazFA6hMbp
	rKfltUu51OpxY61qJcBItVrjb6vM=
X-Received: by 2002:a05:620a:4556:b0:864:a09a:e860 with SMTP id af79cd13be357-87375480bdamr242432085a.10.1759309871103;
        Wed, 01 Oct 2025 02:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUmzUAc+cjv9+y3E3KgF6l5ePibQGjbOfi9JLtWe811uw6jRYJrLcGhg95ESiVfppfFFkd2A==
X-Received: by 2002:a05:620a:4556:b0:864:a09a:e860 with SMTP id af79cd13be357-87375480bdamr242428985a.10.1759309870577;
        Wed, 01 Oct 2025 02:11:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde4asm1337283166b.76.2025.10.01.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:11:09 -0700 (PDT)
Message-ID: <68a07e54-9f0e-4938-803b-64d6f0c31e5e@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfXwgV5SplDRjqx
 VFam4kGxwxjvUANVrVbqDU/vQKJ12ZsuyV1/zv+iNEiwoKImk4ASMp8JT9wqRwtulRl6/dcYSNW
 H+EYMYGQbyzG30pyd9kNp4dwBj7tG9MvyYLV1L/8sGANg+k7WiJACcHib2sEF68mh7oNZAAD7VC
 MQDOkvfDAVleiESapdd7BKHMMWYvupX/GqGJCKo855sFLsBjsAh9M7n4oPtMVg58DBm5G/pXP6X
 8bP9KfTVSVUyU9OXhgOiRVnYHUJxqB33bIGjehtjLwD2+r2lJCEfEgoPui44AO3Ekx7u2qFjSm5
 cjruRhNnaKqhzirdtZJujSM9ucfee7RO9WgMCbGwrJaczsjpp6Cs6XsR9od1V1jzzdnwd/jsqtv
 P5CVhply56x29bH+gH5eCnTK/1gr1A==
X-Proofpoint-ORIG-GUID: ABreH55C-nINp88NDV63GEiveyf4v8eF
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcf030 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=j6DUTAs5CoFpl0bgMQ4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ABreH55C-nINp88NDV63GEiveyf4v8eF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On 9/29/25 7:05 AM, Paul Sajna wrote:
> This lets modem get a bit closer to working

What prevents it from working? Does it crash? Has rmtfs started?
Does `rmtfs -vP` print any warnings?

Konrad

