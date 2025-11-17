Return-Path: <linux-arm-msm+bounces-82052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91299C62B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A42B4E6B84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EABB1B4257;
	Mon, 17 Nov 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmsuOSKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV+0OOsK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F394C2309BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363840; cv=none; b=Nh93lHS0cXhQVt0FjK14fcjOUVYWm/ZU0Oytj3W1x9TFE3CdiZr3NgnJ2r6uoSZm8pckEQ28of81XKUgSAp5eSl80Kxap7l69Gh3z+Vi30cvoBeFbNOqvYWGuque4Xpe2jt7LKboBK8bAHuBYqGB0hsdZQ1XzXI5m1Ib4wLbIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363840; c=relaxed/simple;
	bh=vgHGRi/wZN3TkzSGHrP+yDtbwE7tLYktBiXXyddNW+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8gIMnFX6/BlcYzTZj1ICFuoNcA3bV9DhfE8u0OaYr4wYKeVGsz2EqqHmykOnXNzw+dwQZll686G4xPytqpXojsgm4P71PwrVXz28MuNo8s9paxxNoJYrN85jJAlJ4cZwdfwlVKBcxt6JE9ylT3MwhkMhJfXuwOj7rWvZ0PdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmsuOSKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV+0OOsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nvUg3106682
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=; b=CmsuOSKBf7huko8O
	Iqp2RGfL5ES/CYKBPIuVeLQWFRq+Zc9Yux7uihmQbLh2rumPLFE/Sj64YFQpfTMy
	hxeG/KwvEOBC7e6LVWA7hZWtKVlre8qxgRFMcphdZmC393rq6fNLjLpvo8O+qyS7
	TlK5/9iMBMrCEcSXwXRFO/BEQKSV8/+hjou6QzXNNE1y7OQ/hcRP7YimqjeVbWc1
	9avJtM+3eMkeBx+1BvqZJeMGvKAShSUrkZ5BSyG+u0/5ia69+ZM66SL/84DWPpi2
	S5EKqR/iy2aNnUetboTOFKJL+O/WIr9b8WjCCvEJNGiqyFktf0Z6epForf8QT5zX
	C7jlXQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1kq36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:17:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29846a9efa5so110698535ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763363837; x=1763968637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=;
        b=GV+0OOsKSVaSi9xBiXKURi6gbgpZktWI1hO3LIlyytfXRTXZu2UI9HGud79kPYDJeF
         RUBqO2m84VeQ8peUDTnzRdPcEqGeYY1PS9boTMeSjBx9iUAw7a+locYvdMtqFYk9v4RU
         mH0WkXgzhFSqXSM6a91EyM9Xl4BMUshcfzP6pRRpCLXiqyWtrO32bJS/ksyDH0nbBEgY
         lVtvxpXadA2B969BUVjN3M4KQ8MnUH3sU7x6CqolUuIYPfx3LgPPWRTDQKCXUo5Uwhf6
         /j17P3Byg7q9h0h37bV8zEa64C6vWa+8AL6R3oiaP0id68NiyhJuvdRKMoqeeHk9UESr
         CdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363837; x=1763968637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=;
        b=OFQ0hIlP7Tygk15H3dmdBo877JqPdG4XjpE/rrZkRwpeD7UzfljJ2GrSR8krNlRP8f
         J9czaDL48Rm07/cy8xzFNGhpCe4EQP+yTWPZ2uLqQUZPj0Oefwo/AAmYUKAWw/u0nCNo
         hlrkbt6FBGo4/UEve76x2bTfEwptXPqJVkDqLH6Qq1V3k9MOs6BpFygofQYH+HL6n2V2
         67HONmqV0OlHHZr40kwDUQdo9yfFe4/q9xbUhx4pZziVJlIqxs20mQCc9vl2YQWW4gjv
         VqGgC6KR3rq4Pmnd4X8iiVZLbzPBVHochsJ2JGk9mguSJiQ9exwT1pFze920vryD4BEa
         JD8w==
X-Forwarded-Encrypted: i=1; AJvYcCXRj+HBm+1UcAU5ombHuYAEtXBgm37IQ5TpfxfPjWuuO8PxfM0wTyUF8DJqmwWHR4FIoOq77CH6xmWtfdI7@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtCdfab/173CBwB4T4jF+RPA6QC+27y5copwP2QOdp3JUTfpE
	/toXf7GQI9Ka5gySapcBfCIXtcq9/ZhthcMhRG7nlMVa0tKWFBzH6L8f105pT6ChQEDLFml2QMA
	iDCWgaamhlPwZ9BeNEyzharwhdbULHNUyGz68PHhOKTgOiCPoReoT3uiWJVniIJIHWEcd
X-Gm-Gg: ASbGncupehVrl7zm6RvkJ4KWsjeiAhMI3T/8cRXSwTAY2jNvh5i5z7xuDtQS1DYZosV
	XhEaw9Dy/MyUa2fJH5ZenQ58pHa4ND6ZFaAdK2srsKeVAHTpj0ToUqhnJOyrygEtSX132MufZhS
	uXbQ/cfISzx8NcTWAa8x+M5rzA39FLXKjOEEJQFEEYdxJV1gYdmBBiUzjTA28NdsrsNzILHZsHw
	bi8T8RUzqU9gSP6ZeaZBAVIEIkuiLKPSfrPf2pD79DVk5ifXQLf/13HMq8I5GQPbAc5L4fGLzNg
	ggyyrI+tkpmPY3h//I7zfbIQ8k8/mxcQJYVJLkGGKF0lXno6dmrPg+K66kC6UNePXBJe+PQ3zV0
	K6qkluemwB1KD9Wr2lIxA15YkMyhBKt8=
X-Received: by 2002:a17:903:1a88:b0:298:485d:556b with SMTP id d9443c01a7336-2986a6ad7fbmr135124975ad.5.1763363836857;
        Sun, 16 Nov 2025 23:17:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9p7epjZsFFRyJhM3O74+beaP9CAALNA4xPtajAEIE8PuxecaBt3WowzT0DC6b0h7oHBn/Jg==
X-Received: by 2002:a17:903:1a88:b0:298:485d:556b with SMTP id d9443c01a7336-2986a6ad7fbmr135124785ad.5.1763363836402;
        Sun, 16 Nov 2025 23:17:16 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm128849485ad.3.2025.11.16.23.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:17:15 -0800 (PST)
Message-ID: <73e6b7b9-7ecc-4137-aaa7-43a7fd950168@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:47:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>, kpallavi@qti.qualcomm.com,
        srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-2-kumari.pallavi@oss.qualcomm.com>
 <e387957d-b27b-47e7-adb0-3cc8c656ee8d@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <e387957d-b27b-47e7-adb0-3cc8c656ee8d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kVZj-moy4ooEbnpHA-IFrH0qiN3nEQXs
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=691acbfd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=QcTeDzwGlpf7cV9H6nQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2MCBTYWx0ZWRfX/YdI5hItvhhx
 XUmmFw2admhTpKGvJVb2lz3Y99UYwTYaL//nCHKGmCN0g0EbJfpBf+2/5C0bGOuvhQKhmIQdMz6
 ML2sXH/NXjAoPZ4VXpscCMt2MTiUPv46758p1bTlVISmb7294Di2vf6CZuAjy786bT1NYMRT+KN
 Uci/YA4bH580UPpm+JZ45XFsx2M3kssmuoB5cBfj+ozDoi3y8G+uAo2fFXFL400RRm8mhXalt36
 sE5RXDR632Nn9Zb1HaJZWw6/4ve0EMaloazUtah+kSjikBQ0R2UXTmJ6bjBdTvdc/UxyCyIx3e9
 G5CVxXya0adY1tkaSqPVuASy/T2HFE+Ixc3z/hGpLvzkIea3UNCIt6zmzdkQmyy7Dw374LOinW9
 kAJYj0zSuQY9O0vjXk7m4G2LwJMFqw==
X-Proofpoint-ORIG-GUID: kVZj-moy4ooEbnpHA-IFrH0qiN3nEQXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170060



On 11/14/2025 9:17 PM, Krzysztof Kozlowski wrote:
> On 14/11/2025 09:41, Kumari Pallavi wrote:
>> Add a new compatible string "qcom,kaanapali-fastrpc" to support
>> for Kaanapali SoC.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
> 
> You not only did not bother to test it - there are obvious bugs here -
> but you also did not send it to mailing lists for actual testing by
> Rob's bot.
> 
> NAK
> 
> Best regards,
> Krzysztof

Thank you for the feedback. I did run the schema validation locally using:
make dt_binding_check
(as per 
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/), 
and the build completed successfully without any errors.
Ack that I missed adding the mailing lists in the initial submission due 
to an issue with the script I used for retrieving mailing addresses 
locally.
I’ll make sure to include the correct mailing lists in the next revision.

Thanks,
Pallavi


