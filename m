Return-Path: <linux-arm-msm+bounces-91262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DwWMBwCBfGlnNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:59:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63187B91BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A89BB3008D2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B2E34F498;
	Fri, 30 Jan 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kg10Vuxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEVptrwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED63451CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769767164; cv=none; b=n6UM1uJBqDWj8Q3+xdXbjmXx0Ug39t1sar/hlTqLkHxo78dJVYh0OgDbBslVyRvNufRnGMCUnG1A8/KOfIyVCW+FjzRSesQQLTh8v1pgLAtYHuPpZNZPL33Fk1yVcsYbpRVJgZaUKqSuoOZhFvm8RfIAFXh3PWMhxMplKajXy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769767164; c=relaxed/simple;
	bh=y+ld/lU540REhCwUO2kGbqIBRB63NO2FgB2v6hUzuQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtzZ8IIYpWVUkaswpKdFy+AL1R0/gZd0KllctJThsN7BC+ewYqBzpC2vHK3TxOe4Swta/7/osOxyj1qp//rUW7FB4gEMaYF34X1QzyJzbZ/TZR/OPV6n/1JTF82AMOJqY5SV2RbtrNbbRSGGkkCyMhfRQTwI0p6068gZ3NxbVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kg10Vuxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEVptrwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VZ7Y995900
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eC8XP++LfeEAqnsmOumYbjOL/tAKd5tjfsWvrjLtYtk=; b=Kg10VuxqFJWyfPU9
	rcCfABCZr4Nd7QdhQJbZc0hFZ+rnVV9NmEH3h+P5zzUqeUTw1URxncnn+k73fCBA
	7l4nCQ7+o775DZi41jzXthas/ZsMN5l8yyQMLAc9wyZdySRjVqkw9D7Y5jWLMpH8
	dBUMEgXJ/+1FgGHFYOf1OtiQYWPPMTplZhCNsVs7URigPZDXYxm7jbYw+Iv027RP
	JK1AQqHbJD01/BTPL7xW2jgVp/L+ChPKFI5H+oQP+8mbDJnhUneE+UxTBSV/uE4b
	60/kmAhp4DjCHmPJNxxXe3N7ByMKyBdeK2xPeko0EJCEUj+rbU7lusA7058jRuRU
	S5yyOA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjngw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:59:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888ae5976aso1883546d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769767162; x=1770371962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eC8XP++LfeEAqnsmOumYbjOL/tAKd5tjfsWvrjLtYtk=;
        b=WEVptrwiL1nhhz3RMuzycLEzrLmqMibMP5MDlTklg0W1J62PhTD5az1c/UL89kXEZJ
         R0QE9Y+fLFzYX362/JC5YrSPEyxM8e/fkRJ4UQ/hSSCiS2FtRkn1+Gv1Uh8fkRUUBPGy
         +Ozz/OHe0Judpd5u65TGthvZJ5hQOl9hxsf4z1I6oRX9oaVHXF9/y5NSeu5WsLsyAUlU
         uehjdnUqYJPHohRot17emLl0XmQDuckE5O/lZsh2c61xG04267AnNqd7HHfzFmGRsRMx
         eZd8S80BOXrnrUsoSi5W5Nb6/GAOlLAKyulIyA/xjTdfRcNu7DTl4M4sbq7jPBRyfABX
         JHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769767162; x=1770371962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eC8XP++LfeEAqnsmOumYbjOL/tAKd5tjfsWvrjLtYtk=;
        b=QH3WdcWug2l2IV3c2kAeSEV73U0sXnonRPOXeZbd9KadH+4OLg3ycVFnto7QTeAXJW
         IgWEUHm/cSuFeRXFdNAEZicE8LZDqOk2JDhGH3uY6CcSUGyiF+FWUb6cq1JbMH9qR80S
         95NoCJQ6FQrQ9hv6FfdA71jDPeTwxTYj5AhAlbOAWpsTRIjyZdx+NYxjfIevyUTGqkoQ
         W+yT3oocyXF7pJqdkChcEm56HxEHDw8Titk7W5W4Ks3FvYbn3Q21wUs7c5OvqhQAV0Ku
         lH1NbpLBxxia7/WN+Io62zl8QnB0S96PHkfz22bumX4OEqVun4jzek0FgTLrZPMqVjy4
         DoGA==
X-Gm-Message-State: AOJu0Yz/VOH1ULzlNzU87omUtStHjCMDjkRMkHJCckLgrtdpxfo3GxB9
	r6Qhgwi62Mqcbf+cgBYW/E7nvXUZtLkH2XHH2VOTb2zHN7QfFy9VI6PxQm75tWfYi5PGA7lMM0/
	AWr/u0gqYfnroegNtFG6hH4st8JDXQ8tVVenHd6Z+QB/HRtSSbbzC5ZiRq2WY5WuLS0E+
X-Gm-Gg: AZuq6aIhZr1Tm65owCaABs8YeqV+4KkAp9zXTAOlp50AHKhXFkuT3cxFRX18DLwhHut
	MukQ8de53tTcFOe9Bl96hsQ7OYxiN1p5CYROBB2/QBrcU0vdFP9o+2MjEEcUYuoJeqkmk25IvD+
	FnTE9rq6oRAI6DbXADhGvBTcc5QUyYPL3HhiBoNUkIHKue0APemPIeZKjWlhBUxzsMsrBXxGtru
	+tZNfwd7qPSZtOEQ7iEVdW3LCY2Pn51S2k6fpfzkoZrRcVW63k7cJSt6YpiPy9SM80L8KG3qUXs
	ddjChi1fyS9uzlLplLQpPG6BBs9R455Cbp0xcmG9a5T+5Jrw/CXLhfab41Mn/MJPRfck8JKAyv5
	LysMomHyCaximyWo7Wbrl8fuOUtDIhpnfOA3qx/7FIoUemHehC0mg0B79JCS9M5lj+Ss=
X-Received: by 2002:a05:620a:25d2:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c9eb2eb845mr211649085a.7.1769767161622;
        Fri, 30 Jan 2026 01:59:21 -0800 (PST)
X-Received: by 2002:a05:620a:25d2:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c9eb2eb845mr211647885a.7.1769767161186;
        Fri, 30 Jan 2026 01:59:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e0a5a3b1asm61732766b.57.2026.01.30.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:59:20 -0800 (PST)
Message-ID: <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
To: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, mani@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXx_UDTkdYHY04FR@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c80fa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=T2EDkwNYl7ncRtK5NtwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: pjdz0XJ1HBSDS93ja30NWLDs6Pil2YVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MCBTYWx0ZWRfX3kk4VXrClDU1
 eiNDX+YzqmUdJd1d20g5FLee5c1CLhWt2HheoOKO1MLIFTl/FEQ4ZWr15qW3J2vhOl6x2cOVahV
 ueCADkUBXpyEOA2Y4VBHOElg/CaEGye3DywRipvhCCSGsiHKdiL2F4AD2cYgp+D66yhij+FhJQB
 loQZzL7zhnLIkEFU70G4zQwXmS4nfE57fpXtmKQnMpOVOFpw8XsArjZtwe0EdNth09aLVgNcuph
 +iq9kRwZdTcrFR0cqt1OZ6cvG++BACmUXuUK9nW5dr35ClCXUKjR925c0GFF7CmGY1KQxh9GY5o
 c40eOMZwEXra5kD+EpDEMmq5c/yJAlbWPm/xTtUpmgRiwMXa2H+vlYb27SSwtZqz+JYpJt5LJ2w
 tY5mScU02W5WE/hGFvKKC9tpayhXQZuLATy6VKAaamphsJmKmAWkKbZqBXFR3RbXsPdHhPe/QpJ
 SrYgDAqxxo/53YqNGzg==
X-Proofpoint-ORIG-GUID: pjdz0XJ1HBSDS93ja30NWLDs6Pil2YVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91262-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63187B91BE
X-Rspamd-Action: no action

On 1/30/26 10:52 AM, Sumit Garg wrote:
> On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
>> On 1/30/26 10:11 AM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> ICE related SCM calls may not be supported in every TZ environment like
>>> OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
>>> when it's known that ICE feature isn't supported.
>>>
>>> This problem only came to notice after the inline encryption drivers were
>>> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
>>> Enable SCSI UFS Crypto and Block Inline encryption drivers").
>>>
>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/soc/qcom/ice.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>> index b203bc685cad..ab9586b8caf5 100644
>>> --- a/drivers/soc/qcom/ice.c
>>> +++ b/drivers/soc/qcom/ice.c
>>> @@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>  		dev_err(dev, "Cannot get ice instance from %s\n",
>>>  			dev_name(&pdev->dev));
>>>  		platform_device_put(pdev);
>>> -		return ERR_PTR(-EPROBE_DEFER);
>>> +		return NULL;
>>
>> Wouldn't this wreck the "actually need to defer" case, i.e.
>>
>>
>> qcom,ufs probes first
>>   calls devm_of_qcom_ice_get()
>>     "ice" reg is missing, non-legacy case
>>       qcom,ice is absent (not yet probed)
>>         return NULL
>>
>> ...
>>
>> qcom,ice probes
>>
>> ?
> 
> Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
> orderering automatically taken care off? Or that isn't the case here?

No, that's guaranteed by devlink only with certain properties.

In this case though, I think it could make sense to add it to the
"suppliers" list in drivers/of/property.c.

I don't know if vendors adding their custom properties there is a
pattern that +Rob will be happy about though..

Konrad

