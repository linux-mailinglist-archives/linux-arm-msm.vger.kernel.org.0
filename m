Return-Path: <linux-arm-msm+bounces-84489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A9CA7D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8678C312E291
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E702F6577;
	Fri,  5 Dec 2025 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjSsiyO6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Skx+MfC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B852F83CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942740; cv=none; b=J6vSb+bZNXw8ymqn1L/V2pfCE8DC8OFdaNJXlUKPW6wqp1bMVWCspQ2nWpVxL1wZNmPH7pQ6cnekqnQW4vzcSwU1ywy7e5Ezo9rt5eK3/QxYw8rSn+8lrrZlpuo/tEpOvr29aSlOgszAf9kPBqJSugsEiKmzQAMGuCDIYn7NjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942740; c=relaxed/simple;
	bh=YjEAwB9STLTxPrbJJEkb0mOGlKP6crzQJ5my5BYKl0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcUgXA0orGDbTfjH7o27A4WCqLBAKSmwS84NUjF7U9tVtXp6fF+n4kTkcG8gFlvLWOx1Iew42nZhz0naU/pqwJ6h3ZXRctVwW4dB81ndMcT7d6Vhcl03aqT62+zTfgi0N4LTOd4Gx59hK+BsxFKBw0aPD9zRJYnTmEhKl2PHdgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjSsiyO6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Skx+MfC/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58nkpD2896793
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=; b=UjSsiyO6Kd/v6/N+
	tax2toYtJ/RVLXX//FUGyXlk95LGs8eh58dMyl5HiesmF7LntLBFOKUWrIX9DUQT
	OlIpC/FHsTk5jGCHbhnLkcn83qTduyPZ9u9lMcmQKu3wyF8KVmb8ShLbgKNu0Ktk
	HAV/wiD+SVsdGLPfKNnxLhbQgtacDS1foXORBW1vx+bfc+qEdgk25/o722iJ0O6F
	vBObym1B128TFOhdr8ZYJl2IEuK2SV69QuiJWtDcOBhdVpJwpdF0KvSSmJ686x0A
	N4vn+eG2KaznsuxGo7WLjPRwrz1XqPMyahnI4Soj7l6uv8Bu8Wi+SlmuAz6DD2qr
	z5y7Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj25j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29f90f9fdso50132485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764942736; x=1765547536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
        b=Skx+MfC/8C4/+B2vo0MIyLpPhzPdGRHdhj3YRpns55GNdGJ4jjnVKoTY/p+h+rdYFd
         V0yKbrdvgNC3qXZZIotVxJkGJl4hoCMfM+j5OlULwZQWIUUcqKRLnQVay3oAnxzaYGo3
         Y9eWFQDxfM3Jij4RciS1zjgiklr4edZ+3/hOZUgGuaTG7LeObkkDVtUYOwcV0VtByJ7z
         /7gYq3GofSR/572YcYgKad/wu5HHwY3oMJTUYwHNOuMMKzP/GRTn9Zu4UQd9LdRVtHlv
         syzmaV7Gb5TciRJ6lp3LFLTz+BMEhEFqFVtjJGQFfphij9V7Ni3FIEEynZ7tQIfzYqQH
         JZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942736; x=1765547536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
        b=nLrND1Bev17CgE0N7iXeLat9YKsOoP5vIQCfIhX/Su5wWBsKucfLjDAUeQvhdlsbT4
         0KvZCJQoqehW0dnFU0KdSClP14GP02AIHbJGvFHPC2kY7W25HUeqLIegnq/FCgmWF+Wp
         zX9zSpY+7RJtn9tsC14LFgnWGoxQodZlgAtolA+QSHgcZD9ukRrHxmfBEal6bnz2rFGl
         pUub+WJ4qxEGdZEeESJ8r1CrBY0o4eG/uzKqZAa+sxQtOsn+34xc61ttqelyeMUHy0KD
         /TzDiLChe7cjFaJr2obI/EetvZT2MA1ae8q09JeZebg9foULBzgu2xlS1o0AXSNmsGfq
         yvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZqXlqJDJZTyvjxv2x7A4ISZ6gehBmvy5pIaTUrJhCpgLUmfz0Zg0HbpTOo40pLVuvNYB5CDV2aDGaMdb/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzboVXfl4QFZa/Yn5qkeYHX86wsJFay5DjazDsqj8iSQjMbSR
	mKp3ZwgRPxoPmuGBlwXy/lV5dy8lawFq0bcRGeFv/rvmhMgfWdn6WE7SfhouP/Dngf0E9N7JjTO
	U1pZ7VHW8c2pNYcWG6Be3FZ7j3Cryug0cGCNx/3XCkfWrtrgwX+NS8/NG0maEHxhR5Itu
X-Gm-Gg: ASbGncvXaVqY8VekV4aN9daxTz+t/Jt7U1PMllz+X3vuWyE4pGH2TUs16LigpMPmeKU
	aBdNoAASdnREQeJLnTgy7WX4LKF9dbRQQzSe28el0uP75YcRT9yr8Xf+/NckW6sQQNOj7rRbZXo
	PhzvkHSZ7DYimSGzkym94u8HsiIX9kECLS9VkfB5j+d4Bfhf4pk093xk5x5DJ0mRgRSKDB8/OZ6
	VgPk/YbN72Y878mvikSyou46DBx78/533+9xXYKf40Lj44IatM1iSp8e5w2Dr3Vfu7MOGydR83U
	IpOvrHbBFcMO9rxmTBx9SrY0Mv9Gag275OBXaYuMPq1TbG3iXqCay2wTVe+iuoUXGovMSDIaOyV
	h1bWrQ2LKef8k1Cc5u37FIXwJS5Ak7e9czs2Jg2bowSIeQnV865DnlZ+59dbFq8MPKA==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8b5f95142ebmr865953385a.11.1764942735998;
        Fri, 05 Dec 2025 05:52:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQBcoM2c3cxIuFJvmEhsFRUeWlsckBDksGI+JesDNVEXzT3aBuxsfssWhwgRDIEZEb5suwDg==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8b5f95142ebmr865950385a.11.1764942735544;
        Fri, 05 Dec 2025 05:52:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm3699006a12.35.2025.12.05.05.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:52:08 -0800 (PST)
Message-ID: <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:52:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932e390 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=prxyFuKMA2RouLmu0eAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GYlFCRZyEcmik4Zo3KD_Q0MhCdRbq9Lc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX/s/QUSfGB/2O
 c5M9GMr6xqqXAhw538ZxPtAGbESeijWgoW3y2kua2Y7+kq425yT/x7RF7d2+TO8p0mXG0QjJtFT
 eHUCDDdxpE7hQapHBWddSFiB2vn8wkZMUHlUmP0IIpvdewA5QthlS2qNR4a30+yd7NNKHbpYphk
 P7qu7V7WS14VDP5Szv529TBEeNAtGDrjO4VRNT/OmkymVFQKoePEQQNDRJtDvHIvAb7hacx2o3B
 eOLYLklhCrMYz1avAK464wDjd/qdKGPsXe4IteOCtrKvG4GaZcvGcHGa7aAwULPU2FtRhpbx7rR
 sZeke0YkWIhNeLKfMVnpKjMJn18L66QlNFS6uAvB0bXx9263rUwkcXHEnGseB+YVkhFv2Vm+PWv
 RRBPdQkvyQj7eudyK0DdK4WFFZpfvg==
X-Proofpoint-GUID: GYlFCRZyEcmik4Zo3KD_Q0MhCdRbq9Lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050099

On 12/5/25 2:41 PM, Akhil P Oommen wrote:
> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>
>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>
>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			gpu_opp_table: opp-table {
>>>>>> +				compatible = "operating-points-v2";
>>>>>> +
>>>>>> +				opp-845000000 {
>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>> +				};
>>>>>
>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>> or mobile parts specifically?
>>>>
>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>> here.
>>>
>>> The IoT/Auto variants have a different frequency plan compared to the
>>> mobile variant. I reviewed the downstream code and this aligns with that
>>> except the 290Mhz corner. We can remove that one.
>>>
>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>> speedbins from the mobile variant until that is supported.
>>
>> Writing this reply took probably only slightly less time than fixing
>> the issue.. I really see no point in kicking the can down the road
> 
> We don't know the speedbin fuse register and the values applicable for
> this IoT chipset. Currently, there is only a single variant and no SKUs
> for this chipset. We can add them when those decisions are taken by the
> relevant folks from Product team.

If there's only a single variant right now, could you simply read back
the value and report it where necessary to make sure the internal teams
are aware?

There's surely *some* value fused into the cell..

Konrad

