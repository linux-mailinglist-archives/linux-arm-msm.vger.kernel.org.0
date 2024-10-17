Return-Path: <linux-arm-msm+bounces-34819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF79A2F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 23:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5CF1F2126B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 21:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2143229115;
	Thu, 17 Oct 2024 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFn3uX1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFAB22910C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199618; cv=none; b=BkOZqjhoDMVnTo6G6Nj3N4fySYbYAnluge/yPDJb+VUPHozHa77gfjjUKP94uf4PHxr4QEtbSHeZ1Z0wEG6UfD1K2/NswAG/edrYertwVgfp576BzkaJ4G/c6whNW4Tw1zza6OJxcy2RIH1rfEpGp3i9udTzfheYgALoytjo7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199618; c=relaxed/simple;
	bh=ZfvkFH9jV35VlKOgM4EXntbnja5w5qV2rebJLPSdmP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaQBR7wdVTVC2/MWLZYisyrvFRkcedKvVC184MdPozhOmp3AZwFM2a/cdBf7EZYeaB6qjugoxXNbjW+FqpNvQjhrTE0bg7mcKl0+yItaxmtw4AlBtr2PHXztYqR+L8kT1g79Z5JIDZBKIPnoZWRFOzKpuPfSZdT2a2+f0/FOkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFn3uX1I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HGObGv025858
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 21:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXcbI+plXij5YfyxG65DwyQwbOBxDqIV37QUd8K33vY=; b=dFn3uX1IpskRrvVt
	rogtNRvqpmi5//d+dEj2/xoGkY6afk3Fp9nwuYmHj4F/NKsO+73yKO3Cx0456Mie
	/vSeReDs2Ax9w0a3iog8R64Zoi4TG8ufIr6gw7NISqLLMRee7UC3W5isCuf8gMCA
	EuhQU1lKHw8UmYXA8+VT62qHy2Pq3cu2zGLEhQuTXZ8X/3NfVuy3aVQ329HcCKYt
	0lKF3kJHepsh0Ie8zxLChKcBJQFFb6Cc7I92g/K45V2YPpYv60isBLm0QEUqGXy3
	vIKNgRQ/3a9eEvid52fpR5363DnJa8hQe4dXsOLZdIvUrbsrrK7nOE8gTU3wpdms
	HGxtow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6p35a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 21:13:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460958ceccdso2035341cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729199615; x=1729804415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXcbI+plXij5YfyxG65DwyQwbOBxDqIV37QUd8K33vY=;
        b=pwZUY/vOhKraeOCTPO1xiAGTa7srJW3+38gzJujSdMcv4iDDraN8r/ep+Q8GPJbKqt
         ZYPre65PS4Q4904292Ru3MN56PEoW/A/o5IecvMZqxjwJQa5pQPf1D2t7FJtfknCMW/h
         sIiWbOqcKLH2jiCMrLJzfg9AlBNI+87qBVzAYQ3Q8CBP1LZg9oS/RDWSjQLaC4gwYzCy
         0Cw+xrLgAmOruUskncYkPDY+RxG/lhn3WGz80lxw7s400rKUXvv0RN3hdw+E1Wc/WI+6
         CAcq5Ex29MuAtuCBA7Od52OQUetou6MW0A/GrczhnfeTZfxyozE4anaKod2TcVV3vDYo
         Ce2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4lIeB4kXDZPjlT3arfoVkT5xy+pHHjPkY/K3Z/CNekiYCkm9ONoHlNI+joJ6sQ/4kKMVZs4vkTEsZlKV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kHI/luiMJ5qa9FZMNeG6zLYDUgMKSGsvKOtXGnPZ8euBFGlw
	uBTHMUeJIJDZczdrLk9E9ARS3Cv8MV9LEO/Ss8CxrRCHbfgdj8Jg3FYDHVDobgPLn1CuRF4VkbF
	uEZV5ugboQzu9qmGkWwuToHmgcZWH9O/Uv0zuYYwh9Yftb33ygXO3heWhw62FRbIg
X-Received: by 2002:a05:622a:1992:b0:45c:9927:2457 with SMTP id d75a77b69052e-460aeb9d975mr1172121cf.0.1729199614836;
        Thu, 17 Oct 2024 14:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKkItxXxSRtEORFpbWmVq4g7SMem/Mmo8REpBQKn9/UFs+kHMeIC5qfBCbRbBvVK2ZJYNvtg==
X-Received: by 2002:a05:622a:1992:b0:45c:9927:2457 with SMTP id d75a77b69052e-460aeb9d975mr1171901cf.0.1729199614514;
        Thu, 17 Oct 2024 14:13:34 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27893sm13243666b.195.2024.10.17.14.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:13:34 -0700 (PDT)
Message-ID: <83902d2b-089d-4507-8698-f9f48d4aca16@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 23:13:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
 <grvdxaiakv62nfom5r5m7zv43xpxfwhxnp7x5byfubbvecfers@pqydhpu7a2vm>
 <32cf828b-91c8-4710-8943-f2d174ada53b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <32cf828b-91c8-4710-8943-f2d174ada53b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mKD3EplLXMt13wDK_gx4efhkDTQcYYYO
X-Proofpoint-ORIG-GUID: mKD3EplLXMt13wDK_gx4efhkDTQcYYYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=914
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170143

On 17.10.2024 1:51 PM, Shivnandan Kumar wrote:
> 
> 
> On 10/6/2024 8:05 AM, Bjorn Andersson wrote:
>> On Tue, Sep 24, 2024 at 10:39:41AM GMT, Shivnandan Kumar wrote:
>>> Add the CPUCP mailbox node required for communication with CPUCP.
>>
>> I'd like to see a description of why that's useful...
>>
> 
> I will add in next patch set.
> 
>> But perhaps more importantly, why are there no user(s) of this?
>>
> 
> We will later add features such as BUS DCVS (memlat algorithm in CPUCP) and CPUCP logging based on this series.

I think Bjorn's question here is also "what kind of boards is this going
to be useful on", especially given 7280 was more or less released in
basically all firmware flavors that we make..

Konrad

