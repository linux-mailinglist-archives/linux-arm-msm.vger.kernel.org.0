Return-Path: <linux-arm-msm+bounces-75067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88BB9ED73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D98637A3B80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6062F3C28;
	Thu, 25 Sep 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G24+X3dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D225F98A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797967; cv=none; b=GPYdZfCCkJaRDmihut3QyOwRZMGE8VJsNGpaMVgyyXuNaiz+JwWbRiDRCZy0woj63OmxiLtTHyKXGjCHXiNVI7BsWXdP9NcK28SViOLnC3zdPO8r8fqCCYUsNGVyhjLmx5+tssIrLunXxLlo7FZMnn1oRYMJ4yU7zablpmqQ8F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797967; c=relaxed/simple;
	bh=R5x3h0495DdIrVSN5lvm9yHguCQJl5KmFHn9n/Zq1YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+gLB2RZbLknUuz+fL5FyhJ7uRPOoekysh/U3YIDfYB0e0XJink31yU/7SMApwrlZXZYHfQYHR4eam4Do6lvfdxaxygH6hY1kG0pGI1AG51U4J68Q+F9WpUrwbRnqEBU0XssYCAz1VEftZgZMWytk4bFMN5s36mpihAJLEIZnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G24+X3dk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9ZIMX019945
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thyQ4gLxv6irxf9BVNUnhB21i9mNFbZtzkVAtGKuDN8=; b=G24+X3dkpPLPETW3
	lNXQi06gBKqb7BM9awdovx+GQh5ttHiUwf0Q5RmLjs7RdkAQec7sLVMpU7zCQrfw
	n9SuNrgWJGDuQgawngH0ZXEbjKzYIMebjYJZt/E4sYlYRxj4IKIhOa3EEAAHa0LW
	oID29d8dMKPy32hZTgELHaDa62iw7KpHSqBpXuzt3ixPc/b/Ge9Y7shG9bh5WaZz
	xIKmbHjEIIbxYk5yfJR9Yg+cKY/DCArKPNSzzMb+zTUZmXlSYHhG/LAc54zBX9k0
	PTIg+zaEKDE0sqooUpIfz7DPFnVxm9qhk4vmTLd9ZZaW1KyYGtcOrcKKa1Tw8fn1
	4TB8kA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe123e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:59:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d88b669938so1759211cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797964; x=1759402764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thyQ4gLxv6irxf9BVNUnhB21i9mNFbZtzkVAtGKuDN8=;
        b=wIMOv1rRLvhqOKKJuIbObuI/uJJQDFAZNqTtGSAMDZAp7xOUGQ8LSGySnxTHTEKcfc
         c0QyMWMDlWvx3HEvOEg1+rZwkN1GMrQXuEyxO+HcnEXltt4ryvmzDbsiokrw6T+9IbOY
         9VZ0O8truY9DRWWCUvzmpUkUSf4vNOcCAF+H6T3pQpi2USz97rKKue34ZxK9q9k6mtOP
         ydmMvwU642mNG1GHojnbM6Y54+pAQdle8p+syuJlRUcWmWkneJw/G+v7RkAMjbSi5GEN
         PBZQF75rLOUYA9hd+rEHhbxwoM4/2yfC8aY3qaXJ4ehJSPKKWnJdtqdqXObChKs7rsv+
         jCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUTdzjwCcuVDq03nHU1mwZNw+xssF3HoS6Te0l6V+/2Xgy33ZF+TGIHWo8epcQHCPwKpxElDlAq8o2pyc9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3AtVKaHhVM3wbwHb++FlB/pdZEciGYyvOsPEtDPmnDsa1OQ8
	jkG9qIDZvuMjNVg2gMIrH3xi6GSD5Su3kdQLMbpf01bvibYI+As+zEK2cwqXmWkVYC4LU5xmHLG
	vANzcPGLAOLFOtihJzIWvsAKD5/xjWCrYmgNy7g5bIjrrStYOaSgzU87XAofgMoI3y3yy
X-Gm-Gg: ASbGnctysSxM+9Zfmn624VCuuu85dN9FuvoP+cdlr/QnQn6w+n4oYS8q8rMuM81IEDC
	khDmyC0hVFg36hA8/EBeZgKDGJn+v+ohSylRdhPm80p/20wbf+JeJi8l2salgulrupmaPzzOyP4
	hgThvJ1XDQkmYcjKGnaVBpOkDzxZ7pJzfPi9byhKDhnpvhWGuYiheMwNFY4HJbYBZIh4gsuYLrU
	E3h504W9XdCj7C/XX5gauRfztICVtvolrKjzTG0gI/Wsny5w+cfBrmZPLaH+ny1ImOUOmUCUQ3f
	FBdfcy3kVgj0zgawToGF3uC4xAu4uPM4P45ZUggFlh58gVrv5wmueuQnEDQSIGcsn0M4WxVEBRE
	WTN2Ky2HlqufFxvWgZXPcFA==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr22146871cf.2.1758797964378;
        Thu, 25 Sep 2025 03:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUVWdEjYs2bkzwUN/xuc5Wz72tF6RLq4Ho16B1AXq/HlO2v38RaPGkkTGGDSOB2UYbs7/jDQ==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr22146681cf.2.1758797963760;
        Thu, 25 Sep 2025 03:59:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7806sm146672166b.70.2025.09.25.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:59:23 -0700 (PDT)
Message-ID: <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:59:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
To: Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
 <dzjj344c6zlkg4rvi455xoedhd4d2kjvodi6yftv7svhvvmxbz@kwq7rkq45tms>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dzjj344c6zlkg4rvi455xoedhd4d2kjvodi6yftv7svhvvmxbz@kwq7rkq45tms>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QCAceDmntHXzt1huHVjKN7m4YhTBZkqK
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d5208d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ekqebYJK4Q4syn5Z_ywA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QCAceDmntHXzt1huHVjKN7m4YhTBZkqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX45+o35RTkEGD
 xZOth+djExiy32FpUlVkk5lpPPUF8mhRxNzWf9Bvtxs1Sd2GZuoclLmmapaeVayiK8oc3NYgLJU
 Ffm1BvbUzxByl7o5hfOXCWOZauIfH553197b4i1Fu7NwKm+lE6/jUBg+IohiuoDn1YGYMWCvyT2
 IGTdFync8/+nDd5OeQsQqjTFrurxBkEGPuABag2Urma9i8Upfl6vv/K/mEXt37DxAFjxeZrrAQ6
 zV0U4ejCMwbFTLhMnt0zGqDpUp4AmUY22ouLytfTCkyu2tThvUu8//LWDmCkjFPfRhVOUtNavQ8
 B/PU5qiDLM8OmDce172KIStunJCzqSLv6WDEgAVvcksh8JoWqPaUebFNAlzMzEjKDJdG5H4HD+e
 fGTh0oNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/25/25 12:54 PM, Abel Vesa wrote:
> On 25-09-25 11:58:29, Pankaj Patil wrote:
>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>
>> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
>> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
>> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
>> flattened DWC3 QCOM design.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---

[...]

>> +
>> +		usb_1_ss0: usb@a600000 {
> 
> This is usb_1_ss0, but then you have usb1_ss1 ? 

I'm in favor of just calling it USB0/1/2/MP/HS because that's what it is..

[...]

>> +			dr_mode = "peripheral";
>> +
>> +			status = "disabled";
> 
> So you have the glue defined above, but not the actual controller (compatible snps,dwc3) ?
> 
> I don't see how this would work.
> 
> Same for all other controllers.

good morning!

6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")

Konrad

