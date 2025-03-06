Return-Path: <linux-arm-msm+bounces-50522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77921A54BF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9AC188273A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A6320E010;
	Thu,  6 Mar 2025 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS1e4M4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4CE20D510
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267396; cv=none; b=IBwgwtlhN8fHOCrsWlth+/i+Ox0mmWctaSoFVlpvExrwBlQpjgS8BmJ+2+yFQ47TJ6PPL+CFcIQ2KyX8721wBTacJz27VgNp/XxJyzQbHvUfH1mNUHlduilNjMZjtQUIhWyQaZ4gtGJRtnjZQzyItk1fMNEl0MhoigaRGKc9v6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267396; c=relaxed/simple;
	bh=fULtRJnDI196ccxDyjA7d7FxqIAyuix7c/OGxmTYtNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Muv58nc0UispgBPVyXybMRzHlZa+3ekVhNMSP6Id1prmhynGkJFRZF2XAtIgmpdLRipH9dg4E2k3kXuqmW1X5KK0ZxUS20y5/34Vcy/EZL3/bNhcB88o44nJxQB9LCpmdE+gUjp8gK5SZyoPTRrTYEw5TmMguoY+XA9bcGIEryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS1e4M4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5268XM7K029024
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 13:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DZEXLtvckg77OKbPWSinx9ePyO3OTpVuNl/L9SQffo=; b=FS1e4M4eG7fceDlI
	M2ep1aDG6hXEqT93mvFWc/hMR4EkpJRCo8haa8A3OG63B5rUgFPikHGKWLuLWGjT
	3EE+kElQAgVQwLI3NesIqga+K3oPwhhdHvCLDt5ei7TFsksSkNksMTzFr41IVI0m
	T5/6oeGGRL+i5qPYVPjBd4sOVf3xUVvjibYcdMCNTkkMwCvdwKH6Rojk2tNNP0lF
	aw0FafPaWBBNy+A8LW2cn6v3j9neWEcBjikxywcr+7Ydi4K8RCjsae9KHBJvd1Cf
	uLAhSK3CgPVvgz2RmU3Jjj7eetvWV/Yh1xSu4lyz6rTOEpJE+X0oLFNJ1cbMBasF
	4gDYVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6ts53x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 13:23:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223a2770b75so12754255ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 05:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267393; x=1741872193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DZEXLtvckg77OKbPWSinx9ePyO3OTpVuNl/L9SQffo=;
        b=EP5TYSkt0e9mFofbbYfXNk3cdUjGr3MrFpzgTffXhoOL1aZik9bHTaDji4vJHv64s9
         fe/bKVctlsI3HzaHvGT6FUUII8JTHjJzKWxdNEGD/2d7wjCpZptIuqeWh18SRMw0epgY
         Cr5Xx+ln63qO/F/kOkbqv587kWP+E6mgwAjUW3V0W5t1qa1kajBJQS/wYuYYCbuNK3j3
         i+ki1pTYMH+KWv2V4CrW6j1GZgfqHrAj1LTD3AUFP7gVtsRMQKBCsDEmq0lIgKK632c9
         suQcPDtO4Sd+zWTQpIRnFE/7R4qA4z8PevG+9foiYsJnofH5t4uqf8tWurDxtwJ2yDjq
         OxRA==
X-Forwarded-Encrypted: i=1; AJvYcCXBWl6JxMoSP48CDRtl+ksiO1o1yQ2W0Fs7c10aSE6EPjZK6+n0A/JWkGH4bhQUhU9+KT19mnij5YIfTPS9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sBFTN1g+mMJTOU0FNzf/WYTTfV+UoQc7bkWilp4YlzLymca9
	dkmFxvmFKYqj1NUvKpqAii1TtMUDE0THek6sVdKnIXctJ31V8hAQGN3Aklo14ecWthllYPG0QpX
	LF/0IMgyG1GA6jl111gvO+y0+nwotLGvDBgXLK2YnHF4gVdbpGpQy+lCD4Xiugfih
X-Gm-Gg: ASbGncstC7k45HRr0jXAzG/LBJYka4IYDsYcNPZo1CCMfA3T69kZQN59dDYaufSVAhB
	nPZbHgkxX1YTRHrUMQ5DOtZ39uJFXMPFTrHMRLk0BAz/rlhEjDhk7U1rjn3LrDwpk7QNf+kCj92
	Y/U0Vg8koz0wJbw1OQE4OYTsfzCbWHt5lVq/oeKCq9RfGN4kbZETLPK9cWNNjZcB403q0zZtmpQ
	vk3ln/+qihnHpwHm0p8CYIW4hYP3mCY/s3R3fy8vtkCofGtu2hpoidUQwLgn7J3IwXnkAsZKaVS
	/x4/Q+Zq3Qg4bisWTFx+7NQbFsrWpbjvGRP8I9WjZ/a/cRNV0w==
X-Received: by 2002:a17:902:fc4b:b0:224:3c6:7865 with SMTP id d9443c01a7336-22403c67a23mr67829985ad.3.1741267392856;
        Thu, 06 Mar 2025 05:23:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbYidSvuynVuK36jDbOsSSNftXONqK2eAyUE5lvUJs2SLMWYNYB1pVzMJ9GgmFNxu1gv7dAg==
X-Received: by 2002:a17:902:fc4b:b0:224:3c6:7865 with SMTP id d9443c01a7336-22403c67a23mr67829575ad.3.1741267392487;
        Thu, 06 Mar 2025 05:23:12 -0800 (PST)
Received: from [192.168.100.7] ([175.101.107.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5f8sm11798665ad.52.2025.03.06.05.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:23:12 -0800 (PST)
Message-ID: <163cab94-3271-44ed-a211-300087f4bd83@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 18:53:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
To: Vinod Koul <vkoul@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
 <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
 <Z2sOl9ltv0ug4d82@vaman>
 <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
 <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
 <CAA8EJpr48k_tHKk-uVpAH7TMcp0-V97x6ztdFrbv0Go0a6kD2g@mail.gmail.com>
 <Z683g5yuSu1Pi0pM@vaman>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <Z683g5yuSu1Pi0pM@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c9a1c1 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=x49Km1ku1+q3EoAjmEejnQ==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=W_DWO0qsI84jIeYb1FMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xosSpkzaSF8OmFTPujpEI6fpOK9cJhNU
X-Proofpoint-GUID: xosSpkzaSF8OmFTPujpEI6fpOK9cJhNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=775
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060101



On 2/14/2025 6:00 PM, Vinod Koul wrote:
> On 23-01-25, 09:23, Dmitry Baryshkov wrote:
>> On Thu, 23 Jan 2025 at 09:00, Krishna Kurapati
>> <krishna.kurapati@oss.qualcomm.com> wrote:
> 
>>>> As mentioned in the cover letter, the bindings of phy have been merged
>>>> from v1.
>>>
>>> Hi Vinod,
>>>
>>>    Can you help in taking in the patch-3. As mentioned in previous mail,
>>> the bindings are merged and present in linux-next.
> 
> Can you pls post it after rebasing
> 

Hi Vinod,

  I see the patch-3 is applying cleanly on top of latest linux next. Do 
you suggest sending a rebase or v3 is fine ?

Regards,
Krishna,

