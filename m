Return-Path: <linux-arm-msm+bounces-52464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA57A7032B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EEBE3AA9AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AB425A2A4;
	Tue, 25 Mar 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwgfOe93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01062566DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911009; cv=none; b=KBIWKYea65bz+dXOgx9i0RLzTbqtXNYy0ZyEWl7VGEIByg09z6FydlebcNVErRqnMp3h5f5x1fGsfGhnYg6tAxBsILa0JkgXuXk5AuRDjBKD8yDIr3itp4ESGyHKLx7U2C/24xvzb2wNQGhOGh+jFzx1mNAACiJsbwKQ06IcJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911009; c=relaxed/simple;
	bh=9IaDry6fuUbenQllqTlT5gYi5cOj1Q3ja/I4EJIT8z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLCC8fA8dK7WuLEYLwe9nfvlWgZq9+sryVZ/Oe9p2HZMq0IG4dA/oKVz0kZvieJqRBxf24ip0zHDtcaaJsSxTOaxHsFoNmmV5FN0vi5uf94EhHiOmz0VuL7SKPlnZG+Dvyb5KFF2Qe5gu9bNCytSD7wDDZAfSUmRpJlGiyIFY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwgfOe93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vvqi028794
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 13:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sLDZktwhqsG1wOZKxLglmBiOdJLLONIkvu2uYKb5xE=; b=bwgfOe93NgXIrhvF
	iy2HZAAvfKWT42nzdJgEpzmXlWXWSGymuWBRuz1x71ybDi0vo6sYN2C1H1su3imx
	BuQfU1UOemDBpZ5YbLCBT3aQmaSF3yxook1e/SnKD4ek5vgiJwaSuElQ5DYyYK+f
	DFG3OnMesGr/CYRFxqTo+lKbfuteauAb6Crv+r9YP/YVZGWkf6n7W58RYVSuBqwB
	4viRSJhtD6wp7hqFBcu9QFMhIPw9j7fVRc7aVyDVHt4zR9aRz9TzJpuFuLvMq4EO
	WR+zx4HbyztXPMB6ZVYYJnM8T8tDU2d6o71QVgO+8uLlRM7OQ7zJCE8zv/1JvEu1
	c97pLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyjfwns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 13:56:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-475127bacd0so5507561cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 06:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911005; x=1743515805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sLDZktwhqsG1wOZKxLglmBiOdJLLONIkvu2uYKb5xE=;
        b=RxG34LrWdXu10BdhSJ19fz5kWAXuQ8HgMv4qGd/fKqJhOeKtoksJHfRO+tCi5JpBZe
         0Ze/qCmho+2yQnga8i5amY/Su2DsU9/cMbWatKmT0NeM66KA7l5iUa4t91kpwZUirvdM
         3p9kTZSWgi/kPHNFA8+xAIItH7NeoAWwhEwgCSwcRU1EIgCvezGdJ2DyrpvlIqfdRLKF
         6ecASybLs7HFG1DEBEE03RAorbS2q4AziEPoIK0CysmBA07JH35o4hhs7vSnJbRfw5jr
         r4iis9SEf3tj6AvBufbKMp0ka8l3yXYj+PbL+ifkLzZhQ4CboeBFMOf9PrZHlJ73bWn3
         Mu0g==
X-Forwarded-Encrypted: i=1; AJvYcCVhDBNTAlwtL4uK+n6A4JVhJSLmZqmh/PyEOp083FAO4NknwDPHjPL/bn3/a1Bm9EpqFW7unRB93RL9/jMz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/Vy3xnkc0rcn8DD7iHYf8Sp0aKLRveVff6sy0oD/4M61kG4Q
	EsUs/FyqmBLsTTns+2Jeti8weJP/xsrHi9eHSmJOeAjRdOYlrl726lvIc4qqgYJu8+qnbdhDXsr
	1si53Ao8depsZUu6fdeQ6yrxfFJi1ZX4qEwMAXyoTJX0fI/gSzFN0YL0XLBhRnfwW
X-Gm-Gg: ASbGncuoxy20MQlMsTTsG7EmeoaRyjL8hSzuf2ZDaS7+2JH0OW3D1lOpzSNCYRJh2+0
	EPlFS1GoOyPKLzRSMwq20HdzSUCIeIGPLrmzRpNcJbLNIulBzwjQUoomsu8x/eMNN+4zn5xvczS
	0DUeTn6d2RWpm/wRq72iUyluIsv6dQBCe5sX848R8r8r4Y2lQAhXFWCAlpi4vJQoPJ61ElYf9wD
	mb8xKifZ7tPqjHY8QE//v2spVr9WodzrztKNzeUkWZB83whDSrzkgD25wdGGyirfgQMrYdKsqRG
	PKA3mU2YjG4JFmPpt+KhGiIKVQyAaQGe8T3AeVqUXnY53hDpR3GEmKcIZ7W0SJegx4OpGw==
X-Received: by 2002:a05:622a:1883:b0:473:884e:dcff with SMTP id d75a77b69052e-4771de13f51mr88067321cf.13.1742911005335;
        Tue, 25 Mar 2025 06:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+bjrW3qy1jJkHXha130pv0V5DkYmNYCdBX0USZFkxoEZBO3/5NEu0ewfyB/epISxwClUwg==
X-Received: by 2002:a05:622a:1883:b0:473:884e:dcff with SMTP id d75a77b69052e-4771de13f51mr88067141cf.13.1742911004890;
        Tue, 25 Mar 2025 06:56:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf665dcsm7788319a12.13.2025.03.25.06.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 06:56:44 -0700 (PDT)
Message-ID: <8e301a7b-c475-4642-bf91-7a5176a00d1f@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 14:56:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add binding for Toshiba TC956x
 PCIe switch
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-1-e08633a7bdf8@oss.qualcomm.com>
 <20250226-eager-urchin-of-performance-b71ae4@krzk-bin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-eager-urchin-of-performance-b71ae4@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67e2b61e cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gGbnW7COpTo7U3-rSK8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wj6ov7J4yCKVdm50MDGz7oGXwDE1BfgQ
X-Proofpoint-ORIG-GUID: wj6ov7J4yCKVdm50MDGz7oGXwDE1BfgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250098

On 2/26/25 8:30 AM, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 03:03:58PM +0530, Krishna Chaitanya Chundru wrote:
>> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>
>> Add a device tree binding for the Toshiba TC956x PCIe switch, which
>> provides an Ethernet MAC integrated to the 3rd downstream port and two
>> downstream PCIe ports.
>>
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Drop, file was named entirely different. I see other changes, altough
> comparing with b4 is impossible.
> 
> Why b4 does not work for this patch?
> 
>   b4 diff '20250225-qps615_v4_1-v4-1-e08633a7bdf8@oss.qualcomm.com'
>   Checking for older revisions
>   Grabbing search results from lore.kernel.org
>   Nothing matching that query.
> 
> Looks like you use b4 but decide to not use b4 changesets/versions. Why
> making it difficult for reviewers and for yourself?
> 
> 
>> ---
>>  .../devicetree/bindings/pci/toshiba,tc956x.yaml    | 178 +++++++++++++++++++++
>>  1 file changed, 178 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml
>> new file mode 100644
>> index 000000000000..ffed23004f0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml
> 
> What is "x" here? Wildcard?

Yes, an overly broad one. Let's use the actual name going forward.

Konrad

