Return-Path: <linux-arm-msm+bounces-68107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13556B1E579
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 247835600FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4BB26CE3E;
	Fri,  8 Aug 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrvHbZqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7425A353
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644541; cv=none; b=rRF7vZk0wUdRs9hCFwO7bfCb7jQ+PlUjGNVQZyWBchD8i4IiCTLs9wj8PWZJBqG/hjLhoJaxPLGAzZbdvrlT+c9c0V7PJPHcAuWFO61mKWCZY3oww4UrYtIYyzaGo68Sv1vuy8XALfiKvIc1pCG5LFtTToi5yrjc28XdRI54d4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644541; c=relaxed/simple;
	bh=bcB9tpsziJnAd8Z5RsgzutbjTzohLRjuG9QBGduuU9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpyy+g2MFCGMixher11aG+vL4NBijqr8VL4xucPNmWNDsEtC3CCDymrLOQIjzGq/LdeysRVMqSPzklqgUuaZFNdHL7e3g0pUiKbgDrH3vGlXLwDXQDmoHZjlqccQHeEbG4AgbDr/owkGzrruuneeYd8ymHCLQOJJ5/iXAKOi9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrvHbZqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5788I4rA006539
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMDS7aD4EfSvU8EK/J3yiOfJ4VZYy3Dm1qZFyL4wKEg=; b=DrvHbZqd928p+NQm
	Gpad0WKzkCjVMPa+12yXfJqLnHhPp3KFFac69VrvBnrstDVayPbP2nLE9F3Y5t3a
	+3dPBpXmqKEs/Mnf7Ib6I+oHQWhLqRYQLtLJyuTYbHGvZPEGIqUt9u2GnbSa6Wmf
	cbtX+pxH2Ktsuoeay22EYX6zN5vA5L1SU/cxHyN+Db2ofkIb597rp8plyLMe/qBM
	31W/z7fdpDymqmitqhydc/R2+8kN0zVyd3/bTvO2iVZXUPyJ1AztR24oQ1YWCN47
	K9U0D2GLJYOmBVteNIXjimjHWKc8ICrLGQImhwviR2oXfspvIQyVJg5kAb5jBpk0
	dJqPbw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkr664-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 09:15:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso1497851a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644537; x=1755249337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMDS7aD4EfSvU8EK/J3yiOfJ4VZYy3Dm1qZFyL4wKEg=;
        b=sNPJhiDPPWfQWwng2m1o7WAeuTRo+3JbfzRdN76HDu7g7/JsRqK52j2Yf5mRygVf02
         E9h+fnwVn8kCprs7K7vBY0RIOQdq50xhmHcUPT1Slruq0x94K95UiWacJMW5qf6tx906
         1m9sts8RDwCiP/ZNb+ZXBLJhX3nxaH8pUoQIcR6qsObPp70w00JQg+yDLwwkQEHtJOD3
         ygnHPI28y9KDp0MZqBjvzAybk3oPmAJjPUhFTDBVjK0O3gtwvN6RowBC4Wr0b43B2eDr
         qNnfS71BLWMWskLd5s4MKBfYG2m33ooIgzvlO0hhD0H8L8NstKiodd/C0pF+3mNAx/Tl
         Lkrw==
X-Forwarded-Encrypted: i=1; AJvYcCXjt8A7pjpp+ShOh6UN04j5Leh/dK7VKdvb5pV+1Ol8s3ntq9Bu6YdzR/0S1+6w4TZJH33Fzu0EQrPf58NM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zD6dqm+rgUDvPoqUUZVlphYyXeKpJWhRXdvJL54z+ffckw0S
	Dxq2loCRnWpEi87eDT1EdFYNsdny59mk8Cch1sICtgXzjfHtuQZkUyRNBKiejl/WXCXZMAlITl8
	td5Ozd43nt2gUGwUuSZ3zyMrKLz/KJBR7TQgJqJkbxrmNM1rdePamPxvqtLBYq2mhAMpFuh4Fqf
	J5
X-Gm-Gg: ASbGncu6sRlsIBNdLDdsgcGQCaqw83FFfFKmv8B4+rzQn9ResrjmFW/bdK547gS52ng
	akrCxMj2DszaNBcnQxK+3wFZdBsnk/NtS8OTZQOwa0BtmrfopwsSE2irlMZAu2qyJYQPnN7weUB
	YvEIBcZgGiX+V6Cg7ZvzGQrNVPSgBO3HyQg7ymzhKvrhh/3QF7rqLn4acSJIur4HFJWnMSt3VHZ
	vOqpCHVra7ocG+CE3l9g6l+MTk3LxlgTfOPS/+1YAi8OFotI4Jx3HeWj9msPLGETReV0xyq1NXQ
	q/vy6pP4RG25n4H4mPKut0zLhAFd7Vkh86nlk/NGdV3nEq29VKe82v66huN76RTaOKaMDFH1huJ
	bsA==
X-Received: by 2002:a05:6a20:9147:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-240551a4ea0mr3443754637.32.1754644537202;
        Fri, 08 Aug 2025 02:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpKEjpx5US9jFpxWamPfNIopdhgz+RisNsrMCz6kl2jFUJBupKqUB+LZ0BiPnNSOjPs6qdzA==
X-Received: by 2002:a05:6a20:9147:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-240551a4ea0mr3443711637.32.1754644536740;
        Fri, 08 Aug 2025 02:15:36 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c3f85c720sm2630514b3a.27.2025.08.08.02.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:15:36 -0700 (PDT)
Message-ID: <c2ff39b3-b7dc-4fc5-83e9-381b8f55fd60@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 14:45:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and
 monaco-evk sound card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250808052939.1130505-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <14019ad9-0dd3-49f5-948e-5d0330b764c2@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <14019ad9-0dd3-49f5-948e-5d0330b764c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX1TvGEir+CreK
 DxVqRe+DXGdTGF7L0bBJwUDw6h0BWGy4L1hMvtY9ETSWYmltYY/uP59koGqsTaAtARIv3OnhEiL
 K3LqVBaAeJVzXynWWrzbkzDq8JqDN/T+oBagdWaxeXhQa35HiEq8PqZSQ62BeILnmruOLZOd7zQ
 LxEVpxc5AytGuA4Vhpq7rrZrhenhCYCzkirUHAZ1vgESlt2oC0m/8oXmMUfPq9xIxGUzCwDWFdP
 QD79MPY8cEz3R5phOEO5I8hqd5Sc6d1ipy9WhmLqOj2k6VuI5cCFT9WJ4HHy9mB40HWg0SICiVO
 NdzVi/sflTT+LNNu9Wvn1XFMufplm6uE9ICuonyUlQCIAJKdnp+dj4ffGkHPaV7M5auLDkYxRfG
 caafDB4I
X-Proofpoint-GUID: 0R5F3fhnJkCrS1Mlcb_XChjzM0EX6wpp
X-Proofpoint-ORIG-GUID: 0R5F3fhnJkCrS1Mlcb_XChjzM0EX6wpp
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=6895c03a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=63-x6vtTAcyCGrGXyLsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066



On 8/8/2025 11:44 AM, Krzysztof Kozlowski wrote:
> On 08/08/2025 07:29, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm LEMANS-EVK and MONACO-EVK
>> board specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP sound cards,
>> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
>> is separate.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 5d3dbb6cb1ae..c63bfe031b57 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -31,6 +31,8 @@ properties:
>>             - fairphone,fp4-sndcard
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>> +          - qcom,lemans-evk-sndcard
> 
> 
> Lemans is already there under one of the QCS cards. I was told it is the
> same, so you do not get a new compatible.
> 
> Monaco maybe as well.
> 
> We also name standard cards per SoC, not per board, so evk should be
> dropped or commit msg should explain why this is different.
> 

Ack,

will remove the EVK and keep the soc compatible.

For Lemans will re-use the qcs9100-sndcard compatible and

for monaco will add the new soc compatible (qcs8300-sndcard) in the same 
series with updated cover-letter and drop the Lemans related change.

Thanks & regards,
Rafi.

> 
> Best regards,
> Krzysztof


