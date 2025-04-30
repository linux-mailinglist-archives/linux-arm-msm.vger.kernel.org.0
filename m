Return-Path: <linux-arm-msm+bounces-56298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48232AA4E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AE95A53EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695FD25E45B;
	Wed, 30 Apr 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXaRyaM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48D25D1F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023323; cv=none; b=GyJ2mFQPSvQd1spPaZTQ6S4IShO/jWT6WMn7loc1lG5ERazYZMAJALqqPVYwLr2JxtNTBe8Usa7ej1g9D4GbAhgU4k6G7gjxkrER+r9V/WJlPtV8cNUwBlWHZs412UAPg/CNZNNBEd53K4EIwBRbN+OqhhQVGUITHyVUUCXpER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023323; c=relaxed/simple;
	bh=Ea+OL1UD4IeeXhOa1OHpuw+SoVUR57EIBkmEY9Df6qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqfmUk14q/9vWrohUH/vAJq38BTDBvLTv+B89RUOikXcCBTBgyOKQpcogPGm9Y0hTY08jRHMXtbUN/GEHvvPpSEHCtwXJA9BiSv/Y6lxJS3LzojmwF7joYyaeTy4y1xqLb5xQ6UAX6sYcn8B7CCfy0DIms/N84O4XwyUGbRUewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXaRyaM+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9nhhQ013348
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zq61iP31K/SKuaA9uKhg0WF0dBHfozX3buotk4oRXgQ=; b=mXaRyaM+svAE7Rwu
	YMlb8pyPSAADZXQqKdGRfS9/FtPH3zogrVAK2B5MI2bVCndY7UOdGE9e+dCxYOrK
	eJzeDgj5QeDQo2I0XRUHuXkdBo83EduCdNwFtPDj2hLzmqueJ+kh8toO3f0mC4lW
	n3zMQvoTzGqnEbgaiMoLV92oi2eQfLaN4pKggYQ+cNYoadx7XRMuCGNAMpkbi2o+
	7iejYNzkJtUH7If4mUexyyzzsLwBLfm1JQiGF4ehgFbBKbmxpVk6C9E/MuIWggBu
	vVc8GEfdJZxDnm5Fqbsr3gsr/hf8HloPKE3CT8zUm3d9nlXiC65rh/x91LjYjfOi
	9bepUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uateeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:28:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4775bdbcdc3so16950061cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023319; x=1746628119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq61iP31K/SKuaA9uKhg0WF0dBHfozX3buotk4oRXgQ=;
        b=M7KyYpFxH7Eh24b821hwNnwjTA0+xT2ehNa+rck2B8rJPzhiZdpW543lwon36mPT+P
         xd7PHp7G2ZaGWWHZyGH6iBQ4lgNfhnfLbw1HlUC3PWUSpIbimfT+oJsw7XpV94n05vD+
         C03a7i1yAzTMxLrhCYPgJNPZ1aQmR0NenyI0Cz/nSBBM4ui/EBrf1VrXp92MXimmuH3V
         nOdGAHNLGFjTT+E6LfdDSBW5IF82w05fjpMncsmHRrnd63LytFI6qwdao/883LNSFzG/
         3aYGPC6VUPsA8SqBTsIDo+ErREi8om3J3pWoOavfrCqgCbpX0c0vI4/dwCqnC6Xu19UP
         PdRQ==
X-Gm-Message-State: AOJu0YxE0q0DZhfZE2oyuTEhbv+TB7G9AcbqjADSxEKjZPeDTY63nwAw
	Hd/amzcpE5hBPCKreMd7a3t+D6MAlT+mLWN8NmG34AaNZEP/35DBCoTpLiWRcuywDQqRMcp1Zjx
	1iaosgsM8bCcQ+3BPw6f//RoA5kK6Av2net97oJr7PEOugz42nG+GH3/6YPpd0jKK
X-Gm-Gg: ASbGncsUmYvdmMI0hDefR4jd4Qc/3Y6GRxnmtP0kqEFXT4P3ULohatt6FfrnPitmnBo
	8A57TyWTSF7Gww0/v/k+fegmzedA+103U1k0UEOLNDoeDEzpU+Cq/AbHJ6QUiDBAw6aukpM6KY0
	1m1HQ4DT1yLG42iEHNp1uuoRJEtbbNKtEtVzOv/IsPxd3NkL6WaIYIk1NIYWkH814LUHZZt+fec
	jza3FLXZajuKOcVchjYdllsDXyLPQzesHFjyB1U8iHQ8UwHFBR1fieCKmt/rNJNAKf8vYkN7KnQ
	oKJpskW7CNpmBcm4OfFTBeDwhiyFT0JRCiEQJdwS7RHC6wWw7YckJ6MYyGKGPQMkuTU=
X-Received: by 2002:ac8:5701:0:b0:472:1ee7:d2d with SMTP id d75a77b69052e-489e44a96bbmr16571011cf.1.1746023319407;
        Wed, 30 Apr 2025 07:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1h0qZjefApXqcgKQUffginmJLtkxecKA1YyqGGhd7RCZ8G3bHMmEl1a/YhLVBZkYXb2cFxg==
X-Received: by 2002:ac8:5701:0:b0:472:1ee7:d2d with SMTP id d75a77b69052e-489e44a96bbmr16570801cf.1.1746023319068;
        Wed, 30 Apr 2025 07:28:39 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7fbcfc090sm3955469a12.20.2025.04.30.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:28:37 -0700 (PDT)
Message-ID: <f6f17489-19ec-4956-ace4-47ec93081359@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 16:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
 <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
 <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L2RSxlhAgKTcdjTem3uUA9jKlbPrs922
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68123398 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=457TODNtC_aKx0OvaTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: L2RSxlhAgKTcdjTem3uUA9jKlbPrs922
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwMiBTYWx0ZWRfXyOnvD0dkc8y4 9rdyM3oA94PZxwiLTVFuSZtYsxVeF0o5YfAbfNp944Nz5iT7UXCzmFjU8598Z6z7yFa/fyLqydy hFMUHL7y9iSB8KgjvGHbRa3NYbn+GAIbAgNdzB9tr5tHrySw3S3fYmtfRKjy+VGkP4REK1oq/7g
 eNunbdVm0AzUWLyBRyognLZA7VFcf7WoJWyVM9g1RjLSYasvNdKN6RZJgINoNdxrkJVNEl2sJfx jkVNj6DjlpZJPW8oz7Y58GlVY8/Wrxr/BDOlOlF1YVsTNx6BaK2WT3v2C+oVA6f+Z8Z3IbFgW3c BOg9RHMAODCrVh2xoJTTr6rVgD4O5OL+sIeup8g+g+Xu3mGwQ4T4ga8z4RFAGxMI8kMwyp9W8BH
 4Wh07XKzDGE090G5tU4l/QfLy/y4z6zDUz77NI11r9Z7V+po6IwV64QqF2sgxFGpIs4W5b5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300102

On 4/17/25 8:19 AM, Kathiravan Thirumoorthy wrote:
> 
> On 4/16/2025 8:21 PM, Konrad Dybcio wrote:
>>>       .max_tick_count = 0xFFFFFU,
>>>   };
>>>   +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> double space> +                    const struct qcom_wdt_match_data *data)
>>
>> Please align this
> 
> 
> Ack.
> 
> 
>>> +{
>>> +    struct regmap *imem;
>>> +    unsigned int val;
>>> +    int ret;
>>> +
>>> +    imem = syscon_regmap_lookup_by_compatible(data->compatible);
>> I still think nvmem could be better here, as it allows to plug in
>> more magic values
> 
> 
> Sure, I will be on vacation next week. I shall check on how to use nvmem here once I'm back.

We talked offline and I learned that IMEM is not in fact non-volatile, so
while good looking, the nvram APIs are probably not really fit for it.

Let's continue with the syscon approach.

Konrad

