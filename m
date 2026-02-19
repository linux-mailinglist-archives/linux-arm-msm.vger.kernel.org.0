Return-Path: <linux-arm-msm+bounces-93408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGvDMzkcl2ktuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:20:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB315F6B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5071D30073FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3EA33E34E;
	Thu, 19 Feb 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myhzW81f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frtjub29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56D1DE3A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510839; cv=none; b=k08MTgfOtZXnHI+CpMxTk2CUlR7tuvp0Bp/odC7eE8FEKMtZl+oww3jsrFfkkeMlLmV+qYpNkAA7uS3vyp8HlpFlH9ZTjYKuD7LOtLcKDci1nncPDkV4BPQ7LHoq3hVe4KRqLGGsLYkjCPFh8uPQEYo5R/CCJ3rZSrBgsxToal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510839; c=relaxed/simple;
	bh=EoTRB37SeccKHBtVBHrYRty94wgbxpHZAwwtK3YUt1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohCyVhor9hlY6WRZXZzVX3XU3+qkxTpaM0qUW7FYFcbq6REVzv0qG+S4ggrg1yA8S3ETxJ8xSE1z/6iWYbsX21KvLRcx1QpiQ62CSGBaisQebbWViSTDk/hAX0Pumdfpt8iNjEFUUVOGmWCEb8rwQTtSRt47nPo1wR6m7GYDN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myhzW81f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frtjub29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDLg8S4071892
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AY6SzcgnN1ygLs6NoU90S60oq4F1AC43RaLiXbNMb7k=; b=myhzW81fJU9IimI0
	N0kmSTdqXiTLyaj9ehFU8/Y+CBje0zMUUVH0Dn9tAHEIxiOdn1aLBAyask+DHIbG
	YQKcwl79BFSGG4Pu/YbVs74vwQfwIoU++NROHLJUoVdXQpUWpI7q2rjAnanrl2r7
	aJ0WJzuhTKpkBfrG+Y1Dl1Sd7orJgArMjzn0ptVktb6ILOC0oNJAVZnK0cyFXEGk
	vNuBx//ZWqApdEN2u8L1GtNcC7imubi8NdRBBY/SwMjAVahSMaloej5O+uS5I5Es
	5aLlud4ZBAF4v0/zTf4bll3Np5hcx8bzHXvoB4Mir0aN93WvPNolfv4ZjeXXbESa
	cWyKbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy1h1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:20:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so82501585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771510837; x=1772115637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AY6SzcgnN1ygLs6NoU90S60oq4F1AC43RaLiXbNMb7k=;
        b=frtjub29bpGWI9jaL5/HfGCXWDFcravH3rJscz0lSsJZhU2i2OgIukDRuAGkQu0gc+
         UBwZEAWoyywveSJR8uQjYfXRmCyEUYRg7QZknLmGlOasdzYzxdwLihn/IPHhrutW+ZYb
         iME46pqaDnZKNA6yyjqMlan5pxac+OzfSr+Tx5av9EdY3Am4dTAbpfkjsmuBqO1dIf+Z
         ytFPm9py7bogyryWBVhJ6Gm05YPUDvl8PYBGOn24wBHLF6rjv8eSGs6yT3tNExL8TVpS
         L1RoH9d+bWH2wDQpM8rY7UJRBfnYY12UbYUrcsn6xgP3XH1J2ICnzYpm1/Dxqp/Jn4ty
         zEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510837; x=1772115637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY6SzcgnN1ygLs6NoU90S60oq4F1AC43RaLiXbNMb7k=;
        b=qJS3NgkPd6UEHzpnoEoGSiHXRH/PTj3OdIbWxG1vRSIZw21lEDf3/CHjUn+AQaaIYm
         58kZsRgodARoyQdhnIsGG2xvGr+XVU3CkCLQqQS6n94FLghR3v6PPf/Vz+h6vDXEOzKW
         5CUho0BxChaRemZjiID3CF1hLk3TMX1RegHKhV6pEiHtBA0MITzXqs1dHqho/z0E1NCP
         8tynoIA70VaBE6tSjSjljHrvah4VAI7Xr/uXs7lF4A3oSWBJ0jE+O6QIazMEezCXhSH4
         kWRBtvpHlYhBAY4fgDEMdOVZALnk2mIWIXM3bG/OYbL658ajJ0g9FlZ+tvvLlmz2KPm6
         aOHA==
X-Forwarded-Encrypted: i=1; AJvYcCWAtIglPFsh1PPsLtyz4F0Z6Dc2D2njWMSx6/OXdckzuPTAWrxc2qm2bqVyjvKyhHdWSPI2cET3DPDRAg7c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywods2y3/DtnM55/SQQNmgLkwFcMv1F+f/amVlax/EnY9qVJWkb
	SUWFaBUWn931Cj8cyAnwA7KShRMre+13ch7PAtdDwUyWKOZ6u8vJAe4HTNzlJKUrtUDvUZVwuTy
	1/afUJ7q6i3qGHoz/Uj025TnQeREkIatNvZdDXgDIw49kGW38xaASb8rzkpqPVZ7Bh1ax
X-Gm-Gg: AZuq6aKffxH7nI7a4tgKaOZf+k0wJT+kPSAeWVSzzMvgRmjIhKe4YdNPPhmB2vPqo38
	fGmvETx9bGObx+h5BEM0kjd7lhsm+uIG22VwkiZBMSDSF8UKofZQKDuTfZ9nVjMX7scpiT9w11i
	UrFhwi8EtGadMH8bHQCG7CaGJMI8FIXF/WARDWMXqCYsW5fpzpgt2Gy++V9xxyXcNfRZQ7n5GaI
	T8FQV2oDN0DyVGA042ySlaRljNoVCWkxu1UVuNS9whyNR9Kd/qPIvdLko+yoO+UqwRJa9IY4ZzV
	2IqmITx0dBP9a5HX2IX8GCQk87NlwEUgMzU5I2IDa5N6ZkdRyzJlqHVXS0sCxhNIdJoqXKgT0BY
	rV6Cx4m6OUNh0O/sxE01Ge6qBv107z2OxwxZp23GqnYmesCHJzGq7HISyqy0Kt3UgYjOjs+TW82
	r0xN4=
X-Received: by 2002:a05:620a:318b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cb40850a4bmr2122381085a.5.1771510836610;
        Thu, 19 Feb 2026 06:20:36 -0800 (PST)
X-Received: by 2002:a05:620a:318b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cb40850a4bmr2122375785a.5.1771510835889;
        Thu, 19 Feb 2026 06:20:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9048d96bb0sm116689366b.18.2026.02.19.06.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:20:35 -0800 (PST)
Message-ID: <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:20:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
 <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzMCBTYWx0ZWRfXxbeZ/H82ZDMA
 YjJUW6G0wMRrvJivjT91oNvIRGar1AjEy2qn3CO4MwBGe+pS1ik2XgwsKYUwV7Ra2qHCkJN6/K6
 WFrLmML0u1ONgMwYla8QJomLfijmVWYnfjVcxvxB6Br+YYEp7f4H2KnoDpxeZdlIW6cwGRfU8Iz
 ZCgQMxxEkIA8+dcc2OH59Q/sCCG60iP9c/weCRCGj24Y248Yg1pIYtKDiDf4CCCJBGXrZieTkzp
 ctSTKkgHECidOK4aaaKmU0xQNZzc3ezTE/cFGanbgU38UbgSU7QPd7vOLPKU3yJi8/XN+/dFbxu
 nkFUp9IEIGj+bUHSdsRRWPbFewgM9N8XB94ayXXK9JgMIVizFGUiNj3aYSwMtbIK5ybJQe3c/nr
 +Rdpq2Ili8k4Xbhuyocg231qh3yLXNYvnRgVK9dSHoOpbjjwBWW+yF1FSuKhD2nYOgFSMPTMiaQ
 qj8shc3mOlX4RY4NQjg==
X-Proofpoint-GUID: EBHMniMeETC43gUKsV1Ms4S7iXgrKqoe
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=69971c35 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VczSQE6j7Ae0sFSu3OgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EBHMniMeETC43gUKsV1Ms4S7iXgrKqoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93408-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49DB315F6B2
X-Rspamd-Action: no action

On 2/18/26 8:02 PM, Abhinaba Rakshit wrote:
> On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
>> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
>>> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
>>>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
>>>>> Register optional operation-points-v2 table for ICE device
>>>>> and aquire its minimum and maximum frequency during ICE
>>>>> device probe.

[...]

>>> However, my main concern was for the corner cases, where:
>>> (target_freq > max && ROUND_CEIL)
>>> and
>>> (target_freq < min && ROUND_FLOOR)
>>> In both the cases, the OPP APIs will fail and the clock remains unchanged.
>>
>> I would argue that's expected behavior, if the requested rate can not
>> be achieved, the "set_rate"-like function should fail
>>
>>> Hence, I added the checks to make the API as generic/robust as possible.
>>
>> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
>> play, but the latter never goes above the FMAX of the former
>>
>> For the second case, I'm not sure it's valid. For "find lowest rate" I would
>> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
>> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
>> so I'm not sure _floor() is useful
> 
> Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
> and ice-clk >= storage-clk in case of scale_down.

I don't quite understand the first case (ice <= storage for scale_up), could you
please elaborate?

Konrad

