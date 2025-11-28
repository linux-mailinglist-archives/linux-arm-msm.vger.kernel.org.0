Return-Path: <linux-arm-msm+bounces-83713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFBC91746
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B18B349CD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADFC1D9346;
	Fri, 28 Nov 2025 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9IZ2493";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjQMSAXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B812DAFB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322345; cv=none; b=kWYiX1XanI9/XI6WE26HS86E/bEVbs2Doesroi/3N5hWDfYEJCwsyMh3bvGQXoC+hRSow6tBHnhh/aUOI3RyxL6/QMnDh1hmJBxGcZnw9yUxfjbhn36bCzMSI6e418BfFcpWWOhVE42WETImgff99Omd5hvBuOnC1Ttrm9QHGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322345; c=relaxed/simple;
	bh=1YisnLvPH3V+SgphX3lQRh0HfSUHOjSEaFPkpZBLcG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fu4vkxWyrdiSLQZ14WB1PnHMNv6V6Ox8s1whEUOJXd9ovZnJOmMRCM//rHTEthGFxjXOsFCQkY/CKPoot8cj0yjkUpqIj+Mnaqo8kv52ytiAYU2KBuWeR/SAnib/rg50gr/wPrW+6Gx5EW7SNOnWkwlgWG6CX0coyEQIosBIgvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9IZ2493; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjQMSAXv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OaAG3531028
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+UwBi91+g18xogwSfEkCw8zZelz7CRV+nNtioOypL8=; b=W9IZ2493yN1vVX2T
	8JUWmVcoNRHPdheYh6z8+64j4B2Qo8jLNu67lGCs7JS+wrGK422DptGRyOjuAd2S
	exmp6CCZqzKgzFvVXGgiMLmaMYnZLTnwVFpg0JohiXNvlklp1r7RI0i2cdFtja9A
	Wu1oXjHqlErLYAxhAKXewolhXwp4cwyFmZYefghHJWiKrsEW7TKe2oZ65VdCPgaM
	oyILIYfr7CeYVi9rJ9qN1VpGB93vvTQsNrwR8eajfFKfC4n5hgwX/W0RJnt4oiVf
	cPc+dHnqRAaoOw1QeugnxQtLELp8KCtArVZ+7lxlFdlGfUTsYnV25Y1jtkjBG46Q
	iuxysw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2ru197-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:32:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-298535ef0ccso19395445ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764322342; x=1764927142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+UwBi91+g18xogwSfEkCw8zZelz7CRV+nNtioOypL8=;
        b=RjQMSAXv/mrbjdPrCu9f30oYmb+hN6ISu4oUit7JeEFEY9Abxs6W4NF3Ap4l17LN8l
         BHGiUbEc9t4dXIWI9iQLeamWKQqLN4YYMe1JEmpJxIJL9yYACkzvC/AW7hasqHE8APa2
         w7V5Sxl75Ix0vCDGJMyNZxfbX4Zx7LPfblCFQn/A6nS1oYH+98bBw2O0nPHluLEeFBX4
         Xy+eV/udY4sYhC8fy42gOvzsr+Pjjc/oWby4of1rW7VZJ80vW5ykkBVZ9q7m2+gEN5vg
         qMNwRe4s4iUBsLjTMsBYgdu1fecYL7o5OsiU+65KBi9trlI5JBG1+jwmPAOZVjyp1BP+
         LERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322342; x=1764927142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+UwBi91+g18xogwSfEkCw8zZelz7CRV+nNtioOypL8=;
        b=HXroBlixYBHPGVcykss7mx9k5sIRKyf/HEhoGwjNj5upRqVzcbHvQrl1YXPih/38Ad
         4cAVaLRdFSrvdBh8RbVwgsp5DuK3Jq2ijWkFbAuZtflslDSKL/NJHxMFYWWmtVAkJLVE
         XoFi4xivZp3UyUahLxn6qE7094lwtw5qSyRrDdXI9GzNPd4CiL/onAZNcy9uiuFTA1SX
         VNYu9gMas8gAbzZ1UgAek4dkEn767DviJbPhnURB6b2dKaM1hdnd9szVxbfVEDjTqwEm
         JFlRVSm8Wz7WtnBT8a9dduq09FE5jG2osyjvedHiSiWdZsXa6RWxPBwkXIt9YB8v/1gE
         SGeA==
X-Forwarded-Encrypted: i=1; AJvYcCV9NCdsxFElvwqvu+vDy0LQLTZMm/Xil8FadSi6GbzvkYWgRblHakvIl+8iI4M774GcUg37Y2/k7w6eVWqe@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYj6yJS1Jk7zjhEGRxNikYSutVtrzsGlm5JByfT5Rp65Nmw77
	JfTdffSVHYWFfKoaGn8thmj1rq36B7A7PnH5+y1YkekvVrbs+7hZ24bkLPcO8KrDTt564FzTa3S
	hcXaLZj57+l1+vHUiz3Z/NKypakzsp2MnLKpj4QyS+dd8u1Kq3M+PHE7IMmw70PHliTmR
X-Gm-Gg: ASbGncuqdcJfYc8acFIwQlILiWqsIYRifndVAsZENFJeoH/ep8WlFzYeVw4SO3278Mx
	jVXNXWY1BVN+I7cyuddmh0jFRr9QsbJtFcwb00SQLvu5sEzI6CIqoiPZj1PxeOGMx6X+hOmsm4u
	JNP0Q3pZmm1i9RGkXhVG9lQvDoCsCWsfqTzXfqhf6SQ10UG3JQtWcjBVhiWsW9SIV/Zh60PVExQ
	nDqO4bOjiXxMp+v59deeimwXlPIvQpkvtxSyBtwjROhjl17N1eW0n7z5XI3mMr9+D+/0b8J3bv0
	KVrYJSxI2CjsqpbI2J5zv8Apa9BahKiggJ0rMqDVIL+eiAGSUJtnHFjbKaeLd6NlWpVHDAT+rhX
	Fw0mZyYUf7X/yBp24uqjJ3CztuJ8UqSpgIa0VGQ==
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr158956485ad.18.1764322342180;
        Fri, 28 Nov 2025 01:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0sIEH6f7GkLuGRQRRryHTKZlmL84TS04W14+2SHrzp92FLkoxb6SawTrROIvMYUpBOnrXrQ==
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr158956155ad.18.1764322341708;
        Fri, 28 Nov 2025 01:32:21 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44270dsm40848455ad.34.2025.11.28.01.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:32:21 -0800 (PST)
Message-ID: <6f945a73-7ba0-403c-8ab5-6b84569ca2e4@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:02:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add videocc node for SM8750 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com>
 <7a69ced3-c698-4eb1-b705-58a48048e684@kernel.org>
 <9a3c2518-3a32-4165-a7e7-22171488991c@oss.qualcomm.com>
 <369271f5-8ada-4c72-a9f2-852346b07867@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <369271f5-8ada-4c72-a9f2-852346b07867@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2OSBTYWx0ZWRfX0fSl2LFuCvfF
 8ZRXqK5rTjAG24UWI4LarRoqpA0fdshK9q1wU7Jdv9YLgwN+5xLEVtkeRJjvzrgow5iQlxiCMXv
 NXKww8w1vKZh6QYPCTtYST8mUAIxF6Z7wCUmaH4/oFW3PTZZYL+ChDwoBkQZzFxf75v8Sta1SuS
 CwyQFoD6SNREzGfETB2UYnRx4rJEB8rmNrvsoLu/yfSU8DTDpm4oc8lLxvQGWRhZCHkHZI7FfhV
 chYLNwyO3N4xxuuxh5yJjnNJtVy0pxVp704YhuTIZB4WdPpeAx3oQTOD6SorA5ky8ek1c3ntCSD
 RYqXmHat3cEie7r82votfMytiTruV/fskmjloVKub0uqPa8uvKxT/yLGsXsFkUHtnua+deUy4/S
 B/zbx9DPH5AFx3JAyhedeWZVC/JgVA==
X-Proofpoint-ORIG-GUID: 4aBPOV49xOpA4X4_5iiHtAGDu_RM8QBo
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69296c26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zBCKmGx04GmgMyGxIPoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4aBPOV49xOpA4X4_5iiHtAGDu_RM8QBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280069



On 11/28/2025 2:36 PM, Krzysztof Kozlowski wrote:
> On 28/11/2025 09:41, Taniya Das wrote:
>>
>>
>> On 11/27/2025 6:00 PM, Krzysztof Kozlowski wrote:
>>> On 26/11/2025 19:09, Taniya Das wrote:
>>>> Add device node for video clock controller on Qualcomm SM8750 SoC.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..18e43c509f1f24785d55113addc5cd9f96e986f1 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> @@ -2740,6 +2740,20 @@ usb_dwc3_ss: endpoint {
>>>>  			};
>>>>  		};
>>>>  
>>>> +		videocc: clock-controller@aaf0000 {
>>>> +			compatible = "qcom,sm8750-videocc";
>>>> +			reg = <0 0x0aaf0000 0 0x10000>;
>>>
>>> ... and the code is not here matching style.
>>>
>>
>> I can fix that in the next version. Will you drop it from your patch set?
> 
> No, of course not! Because as I said - this was sent already. Please do
> not send in parallel code which is upstreamed already since long time.

Thanks Krzysztof.

-- 
Thanks,
Taniya Das


