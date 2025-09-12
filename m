Return-Path: <linux-arm-msm+bounces-73267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FABB5467E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79BB3AA58E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3976C26E16C;
	Fri, 12 Sep 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oo25e5AD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14702B9BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668033; cv=none; b=ESa4GG0gporKkA9rwqZqbM0UFkBbqjePyqGmuJGE6+L1x4x8Lht05IBwkKaXL8CsLdUaR/b2QvujW52R1LLSZvHiq/oTX9ulRLtONeMMgjVc3ATsFPCzENxCZA4JpC3e9nKfIA9rxGFWSQWkBGVINyi/nLOXmYw7Ejlfnt6NbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668033; c=relaxed/simple;
	bh=85yDsO8PhF20FmLqZR24JT8g+CrSKrf8uqrfaiGpSvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWd9X2aKuZC3u7ZQY11mBSsCRlst8rU4R6POXftTVW5N1BdLj18bLFoye+4yzjA3WkljIK4Of5mBNmMbr311wDvOLN/HPgVlAAqCAC/OPdTZgKWBuTyf6YJABzQFiUXJXikbBttXyTCHRilQEN9iXOe5GAl1Q5n4Eo+pAXTGyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oo25e5AD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BNx8Wf002133
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSIJ/GXsYbLk4enedNLeg4cq/kc6q5Jb3qPzapXhYfw=; b=oo25e5ADt1MTZrNZ
	Ulp4yctIfu3d8hesMpKqHrq4uBX/JihDQu8a+eDlFKzluC9NVuvCiy0Yd4Q2misi
	cT6lMuQKqN5Q6RtVzpdDPgdpSGmJVx8lDDWlWJIaNDIZqQ4DEztIz318qkmhdq1w
	fg01S3bJR8gkTeRVHNFCkrszgEYzOdcsEH89yvdU31tFd2hHJLlEYaLjNUaQxoA5
	SSrbx5D8ubFAht5RyQJk3xgT5pa4D+tiaBpNVVs+SKZmIR7vZfPxCM848R1GPJ4m
	G8t90H/CQ3BwbPLqOyYxbYxe0TyFAShJw8Q9N/XZ9a4W1ONclvEjxPhiySGSYip/
	iIZJrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv33w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:07:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-80d884c99e2so36583585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668030; x=1758272830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSIJ/GXsYbLk4enedNLeg4cq/kc6q5Jb3qPzapXhYfw=;
        b=vpvEW9xJeqYGnHvYogNGfnIraVFAhMO/vpgHi8GHqMdu0+pWOTsINRZZ81urCQBHYx
         3qpBnXKjRxPgn9GDBw3r/fCvCi95VFHAUG3dVsXkLNVplg0/kyCGswlRs0UjR5awTkGe
         zjTJNcZnN+eZ9VrlmyxwpwHPBnQe4q85Yh3CbNJM+di/5Iw+293IbX3AFNjEQElKZ3AC
         cDXc5N3wHPzqNRTeRKlB8w9DqjWdLcCVfL1v6M0rI8aniuBo0+Xrpmzh6LnpgCrucTJ7
         MW1lE3OncSDxFkJDuNj+aKPfZBSDzmuyPMi9WkKnh19MbFZfLXph9AYI1LAOiuMVUYEa
         GlTg==
X-Gm-Message-State: AOJu0Yx1KnCUyXesEFQAvwn12Rat+6kPAZhouSsa6q4m8VOigR0cf2uQ
	tRzkJSMd9lTd2IT3EEUYBH/069KAWUM8Q6bosrFgaT3d3/B8BTNttYfAdaKRQaY/Wvwd/C9m4ll
	YlKNc5mHDkN2apfLskcpAaQb+wkTDx3rfNwdmuOuss+cP/FsWDwSf5TUIDgaPXJYSDqNc
X-Gm-Gg: ASbGncv0uwni/vNjC5hJK1RodfPtWo09Ek+dtG8Jg1SV/SL/Hcj56z6/s7W8M/sIs01
	fgL6G981E8UfByF8uEsQrPn3x19dk8loBiEsEEhfcw20Zp1HcXCif7zyfvNn1as0mDAZg9XjQjA
	KV/UA9F9l71oefQq/g8EZP+0/HBXgquWaDxMznI3DUicRNpQdDCMDUMkuCBaSR9GuKYbEO+aoKq
	BWPeitc+t4YPHwe9id4GSZCQBTOxtRGGtLwDVdBPy1o0Vznb9fl8RSmlamxyUuqikXv5oweJKI6
	VFuoBVGejVc16E2itTI03elgQLD7gVNRZx/jXZPwpoJ/PKj4g4AX/IBSRCQQwU83prU9TIjiyL8
	5bxj0wji738panakntW+lHg==
X-Received: by 2002:a05:622a:64c:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b77ce6a03cmr18051671cf.0.1757668029701;
        Fri, 12 Sep 2025 02:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUlEyLOQxs7qQFthKUmU6uZH1I619WfXQPTiZx9iYgqYQClCzdepqH2oOylA6OLbhb4mLEBA==
X-Received: by 2002:a05:622a:64c:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b77ce6a03cmr18051351cf.0.1757668029200;
        Fri, 12 Sep 2025 02:07:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da310sm324952366b.20.2025.09.12.02.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:07:08 -0700 (PDT)
Message-ID: <51131b61-99cf-467f-b7dd-ea04c0028006@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:07:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Krzysztof Kozlowski <krzk@kernel.org>, Xilin Wu <sophon@radxa.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <20250912-radxa-dragon-q6a-v1-2-8ccdbf9cd19b@radxa.com>
 <156176d8-9b5c-49e4-9c17-c201255f50d4@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <156176d8-9b5c-49e4-9c17-c201255f50d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX+C0+ThBsDM8+
 LmFJIc5dYdmFG83CGM6CjpUOa/AEsPelBJr8F/K2yYrnowdJvGqP691pEirwldTbY/8b1KGEu+m
 ayZpwKWZZICvgmmmURdjB/xFzQAI2GRqdbDGlM9Iewkm40bW5oXaB8IkkfS9wAssgtsk1OVq3sU
 2nBNTf4uVLhnZWnRlsbncYe+k8U5cryOVkMVlzbSEpRuMvaVhJ0bvhazJ4ql3i7DE1K9BHKwGT6
 Xh8mz+MTV/PdTzBL+++H2wENT4/HFuWfr4lRHrCHq1+sPxTvk2S2uGVuRnwQ5fJdpDBmheTrCGk
 05Ya+jqIubyHuy1z3EUh2xjaYbe4Tf6D3vpLrGQLUOcyaMMWjGpJsTmB3nH2ekHnVBxXpImsBP2
 UNLCHLS0
X-Proofpoint-GUID: OLqkKQ53AxIT0SipXmt0PK_jXVqmacz_
X-Proofpoint-ORIG-GUID: OLqkKQ53AxIT0SipXmt0PK_jXVqmacz_
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c3e2be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KkcfRuYvw7IKyLBQNsQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120

On 9/12/25 10:15 AM, Krzysztof Kozlowski wrote:
> On 12/09/2025 10:03, Xilin Wu wrote:
>> Radxa Dragon Q6A is a single board computer, based on the Qualcomm
>> QCS6490 platform.
>>
>> This is currently posted as RFC. More details are in the cover letter.
> 
> Please drop this sentence. If this is applied, then commit would be just
> misleading.

(you can include this kinds of comments under the --- line, so that
they won't be part of git log)

Konrad


