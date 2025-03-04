Return-Path: <linux-arm-msm+bounces-50223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AAA4E838
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E91D47AB2C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164162512F8;
	Tue,  4 Mar 2025 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnKSGZ6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B420A5C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107058; cv=none; b=LD9W0+N5FpOUFgduOMz+hEAHC0JwF82Yvs4Jsd+bxFssbj8ZOZOaPP8Hf6bkRsvGuboXGAkSEstAgsMbzaZPqoNwzxGVbruFyxCPuBLnH7iMiGUDgROK0SST2lcdWiPZretZTJPAGLFdJkBPOcptgEudQGfveHM08BRikV6PshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107058; c=relaxed/simple;
	bh=4RFYlaNdV3WhrdxEC9D3J9GzPcuRDBI0yIBQjLj03KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rk8gJXJskjbEdpzMHi3Io7aDDZOLyN9qVit4wnGEFf9p9uCWDp0xyVE+Ka7iFKYzzQX52V8TSiWMvXfVColCY6u2UNREIDtCf/AkdB9YH3bKksZAQLahA3FGPYEjjcB4XnuodwisQeVaLG43uq09d4q8cWlrsktiUJu/GZ/3Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnKSGZ6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A3sFO017193
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 16:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnwyaU3JlcPGpgvlX3B6lDWi5ibaBzsG39kIqRDdvi0=; b=LnKSGZ6WzA3Gdaz0
	fO5lFxEYzA4ZiHf6o6/ZX4sTjgFtKh1jtt8S2dnh3/tO9f//1y/YoUyVLhd+U1rK
	VRHX21qiPh00UCqlHaS9ll7NJFMMWHalCOmDBSwG1vvL3ZXPBYsiJNqhwcysHo17
	2LRXBgewpdzGOTPG1A5jDp+5S26lqpKs6p+oeqpG1dAEEzZ74bxSprOxV1cjqBhP
	EM2+PbrS4xWzkOfOvU2JjaMIVxK95ZmlEA/6/TpwDCz3vt/mPnxr3kP1rEwvoY3P
	5TEL7t24JgVkoafWwmIMKqlAtbbQ/oBTSGthzIzJdPx1EHozy2kfVfdrUrti2Ftd
	WHnSwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tjj1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 16:50:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e249d117b7so6381536d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107054; x=1741711854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnwyaU3JlcPGpgvlX3B6lDWi5ibaBzsG39kIqRDdvi0=;
        b=RbMlvlIJHCkdIzQsJ20YsegfW8E5QfmFRpMmkGZ4QdFPF2+xvUV9zXS7hHQtfpA71s
         BVZq/zVdTDXmWjAmuagQ2CjOVHggQjMXVLJj45mM64kC8K2dvsalBwAKq6rgCPdxg1rF
         HTj1AomMP6AJxWyLw66U2Dozy0PGRWgna0Pn3xEAstHvnZ1nWYH5t9gVlSdDrNiuIaYW
         AtzAiGt9iDz1f3t7lgRCPL97upXfiDDU/xJBRu94XwKTzxqt6Vr4yEFGkByFvI7AxxcZ
         SFrIDqvN9POZ/+btDd56ia1ZKwNLHNjgkCSlzwOTahN872sWfw+URO/oGDEwin6FQDAv
         q2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXIk4BXURCMUzvwLgs0DfwwpEllx3yM5To7okBi7+1BCQV2y1Jwg6Re7VmKPeA1Mw75u7Ekwyxl/mAn7vnU@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuUWcRG4a+4jHlfUwksa2jLHFZVjBuaPe12UNc+tYEI3l2K/z
	/rDEQc0+bkY20iJUO4YtkxlE1zGo1V2/VRWJ8Uyl40o2tV6X1OAs9JYyH2ghQPiSqiig3HFK1gR
	enfd3Eu3XiMgI9zv3NCRfDi4hyBN/uJh7Eek0YuK0oh7GKQpRO4UpgKTmTGUwj21w
X-Gm-Gg: ASbGncvBt1VYd6jJIBoeJncfb/8YbViLiCJfoAKn2T0gEVXSDi/XV7PnPZpQzPSnv7z
	A5HnzhypsZdG+OwarHN+VvRFpHifEsrtt+s+g12tidG/0WQOWfs6TkwiuL71UvsGlc8Iy9tJpZv
	K+7Da6x1iDIWc2QTAwUTeH0/d8RCE9jhmgBAk+60okIGQk23ymJ82l+sE2rpU7T20ouV0FS1ZII
	kcuFt6ncGGhLpThm2NaYBltVXueHKWrjb+ZxMnTHWs8EogX+pnPhQxIIIk3V6khfRlCGORcp4iy
	qRckMECb5eNwcpaqqGtLIRZC/CzSlFa0GEx1MVRh1hs2hA2szSJd4JEzt+obcen8hB2XEQ==
X-Received: by 2002:a05:6214:2249:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e8dc2274b3mr15831396d6.6.1741107054353;
        Tue, 04 Mar 2025 08:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf87lGftwctD13xLBr9ieIfLbY5PRnLIDpwQlrO1FKZ7RBee9kzNRBgBFxtoKck0poA3iYWQ==
X-Received: by 2002:a05:6214:2249:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e8dc2274b3mr15831146d6.6.1741107053902;
        Tue, 04 Mar 2025 08:50:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac202dff7d7sm56462966b.169.2025.03.04.08.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:50:53 -0800 (PST)
Message-ID: <04b2df01-82c6-45af-a4bd-b899b404ccce@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
 <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
 <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c72f6f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=KU1-Q2Yg5eEZC9oVEj4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q9ngd7_ArQCaaDYwEX2BOE35zGzkpVsb
X-Proofpoint-GUID: Q9ngd7_ArQCaaDYwEX2BOE35zGzkpVsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=784
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040135

On 4.03.2025 5:49 PM, Bryan O'Donoghue wrote:
> On 04/03/2025 16:41, Konrad Dybcio wrote:
>> On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
>>> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>>
>>>> Add the required nodes to enable Venus on sc8280xp.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>>
>>> SoB and From do not match.
>>
>> .mailmap breaks this
>>
>> I previously worked around this by kicking the relevant entries from the
>> file, but that in turn broke base-commit in the cover letter
>>
>> Konrad
> 
> OK with you if I switch your email to kernel.org here ?

I personally don't mind as I'm still the same person, not sure if
Linaro will be a fan of removing their name from the author field
though

Konrad

