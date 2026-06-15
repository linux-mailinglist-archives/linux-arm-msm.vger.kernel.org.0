Return-Path: <linux-arm-msm+bounces-113179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W8k3Jgz2L2qcKAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:54:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07C6866ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:54:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m1Ak06fV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QBG1dTJK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113179-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113179-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142D83021722
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E098A3E450B;
	Mon, 15 Jun 2026 12:44:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992223E832A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:44:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527482; cv=none; b=l343/2S2LTR2F3O4rXhb6rrscf4fOmrmgqesaJhb/tQOUBApG0fSBJOzOZij2WALWGX7EZW2R9zdhVbYHlJfvFvMPmVeTJ4PLwqwPt+gFmjnU4VMj0o64Y+4CYjUDkQ9pTjH7tGX9bwCQudYs1WT9QDARhXogHqqNNCt+IfbxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527482; c=relaxed/simple;
	bh=yDGdisoGHqhD2uNAQsftXw6XhtevjF9h7iWT1/+N3UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROGV/mdTLiZjHGWMjYdfwrFSblH3CwjeYrxHK2/EabwbcrUX7/cKEnRs6gMAzEBJdwGUL1Kc/rBaE+cp13nzd1R5fqwR5PlZrxY6E2pJru0lbx+Ty8OPrT8QjjqwoVXsBrKAen1AcRpWpcmmTHV8DjJw6H29KIB3aOU5WB15+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1Ak06fV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBG1dTJK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCbG15503166
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=; b=m1Ak06fViKIwFILv
	Co/xwH7fiS9HD9OYETBUVU2iXiUojNj6MpfAkTLzWAGahzdWglPtnjrKb78TUyXv
	ig29UFBH9D+tZTMDIamJ3BNG+I0sxxoPZRvFpWN5XRaCPxUADByKmszVXNkAbXga
	jZaqW/1tVlfjcCIQkfV/YhyJptLmgfIWZYQ1pnlbgNULaugrcQ/+pCUimJGz/6vJ
	Li/XTuVW/rJPQEH1+qKclKGgCWrbFjqjeyCZYJf32sYXk7msuPS//0egV8UxxjOO
	ZljI26+U8EtDJi0LqmCKL4oty/6ms3tAllk4J5aFlsaCmdHUrXqfVkZY4yp5vIRi
	xmbTNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegursky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:44:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5533624a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527479; x=1782132279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=QBG1dTJK+FgLRIGwhF0H8SPUjsrY8Ub8bq88IwEz5Fx+5PJSaV1Om9xd9rzEYnw9VE
         uOSgQwQR7Z5pjrnoU64dm6E1BjVZubE9d3MY97JkR85gy1z80c+Rm1ySQvMK6VLaW5wi
         JIYjLOkL9OcRTrwtyVSZhglDyDgEyRtaiq8/6EedzP974JT4vFJUA5hBWdhdZ43S2at5
         yoMvdT20fUH+50rYAJvfwGoscaB68ygAWW0cA7h1wbf/43xKXldEN/sxS3/sMuMGH38s
         FRqMotsv1MaBYNTiSpfiDOrdhrCC0eCUy9JVbqdpRjmZ1xKErhiwzBquEGnhWdwrw89T
         HlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527479; x=1782132279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=nzFqKAuV+K/Y+SUwaMURrBxVK6wheoe5WxzzHATssGM2xP5CylT1Cfn9756l6/3Bij
         1Efn+Fx1YSTyj+mSOQNtINq8CecbxjUvdgyqjag8QmQoSDOMGod/69X7VpSmg5HE+t5H
         h8b5qlBvoZ8oMhG9bEgwDhIysxI+rBiiPsKxzJBCDFsG6XCzhWLj+3hHiG6ANI8ejL5x
         6UcDbKVSlPR49ACyu+SHYLszT9a6gsK8QsIdfgCqxRWkLdaYshufXjMlxltrEFYkcLFu
         zfh32JtthEqrbc4JBzSkaoXywJLx/TAoV2Q8v7qrRDIXwSBvQZQAyodST4WDgHAQ6c6g
         BCkA==
X-Forwarded-Encrypted: i=1; AFNElJ8oSueEApPrfkcnbP8jiGgyknUUh2EHVPSs2bJTXquG4CYQY4Ip7AVqhV2MsDUqgjX+i14/T1xfe2j1oK1w@vger.kernel.org
X-Gm-Message-State: AOJu0YziWDdV+bqDVzJPhu/A7LlX6ZsmHtHHKrJwGkYezoGh87oPuq0/
	17Yr4poDnbh3f414Qa95lWs7dEosXQFtNZd6qPdwSxelEmmHBkc9vKsFv4bkmVsGBXnxEccDPVs
	t5TRrvsI/3eCg8bdBxzbJEsSsfhrTzDFcQBK97/A3we5wWANAto8iBiW8rpkNvYABiSxu
X-Gm-Gg: Acq92OFGv2xAuLjE4eWw607dbcP2rkAr4Da6lGDsfgAFRJLbm2clgAN1q6HxNQQbI1G
	lM21+yAuxhaQwAYuY0pYRQFXKeghHMkBBA44WTGL+DPtOJnKDOUEaHFSrOJR86fiv8OurktslBj
	lN+Ieh2ywMvFp601nrgfT00Tgz8ylWB3t/6f6ittXp/+I6WQcYe0SK1oIDBkkNt1CA6c2Au7WMR
	xxRNEzejO9GqMDkHiG7lXwE13xjOFhdMHjRxvnWiBDhwN+9jbtTFZgDH2Ef6tfaTglk0SBEKyd9
	pYk9qXnduVc7Ymelghk6+GYwFSnI0VJgBxRMOeU8IctopA8qO+hvV6/I5/Z48Af6wK/k+mEoAgD
	yZH7gfYdMUvEiidb1N2vjA5G3F4BednfJ+bXSOIyRN2qkkpg+Q385UqVlFYFA
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256785a91.16.1781527479563;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256759a91.16.1781527479070;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm10350807a91.0.2026.06.15.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:44:38 -0700 (PDT)
Message-ID: <40d9d0d9-978d-426c-b463-c05faae1fad5@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfX2Vb66gnblIs7
 pf8ltVMks7T4M4PwHKEUtbL7WzD7QRfJi+JnNRfKLH05KoTN2uxx6h7V2L1AO33wc4phl67VuwX
 3IZDzsjK9NsuF6oL2kksn5nzskJ9wvO4DyyByTHMIYLjk5UfLLyTwD5IVSpURZASNY8yQipLGdk
 hVnxupqpODy/nrL+f2FD8S/tmR/jsvA5TVpQ8uKUU5STvwcNHta2U7T/usuvIhVI3MeVfhsBGEl
 qUCvyFh9HrDyzxJWEC7fSIjnZi+9BXD06hi5vJw0XkYMiheg/GZzL6MHylYQmntrq1y7vOq4GKK
 ejsyZTjlyC7WPB43gzv6UC9+F2NO7OKJM2Z9JZr7eh3dkODtQWE4rYPPvfAz0yt/iB2i/2pXu13
 ZFQ6ckFcXkgV01mm0/Pnrb1De7yjZijJUCQVuja79ktePzhXoP2Xk+zHHVgkxBzKBnfF14Q6SFV
 6bUtF9yMZ35SrQyy0eQ==
X-Proofpoint-ORIG-GUID: Oqrf70741gC9iyrVVkST7b0qyvYoXFGp
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2ff3b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sVLjvJnARbnZsx0J9w4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfX2VPlNt6kmK1J
 tjc6ShvU7Z1jI/SZJUuh8NZB+xLWgZFPr1mbAC6Y6kGOo/frPQO5H6Ugw46NBhDm056eSgz1/QM
 TCOdiOx5JdubXQOXjDh2EWv/ykr2dHo=
X-Proofpoint-GUID: Oqrf70741gC9iyrVVkST7b0qyvYoXFGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C07C6866ED



On 6/9/2026 1:47 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
>> Add documentation for the qcom,swr-master-ee-val Device Tree property
>> used by Qualcomm SoundWire masters to describe the execution-environment
>> value for interrupt routing.
>>
>> This property allows platform DTs to specify the EE value used to direct
> 
> this sounds wrong, this should never be platform specific, this is SoC
> specific.
> 

Agreed, this is SoC-specific and should not be described as 
platform-specific. I will update the description accordingly.

>> SoundWire master interrupts to the appropriate CPU target.
> 
> Why should this come from DT, driver should be able to make a choice
> based on SoC compatible string.
> 

Currently, the driver uses a version-specific compatible string rather 
than a SoC-specific one, so it cannot reliably infer this information. 
That is why the configuration is being provided through DT.

This is a hardware requirement specific to the Shikra SoC. The DT entry 
was added to retrieve the EE value required for this configuration.

Thanks & Regards,
Rafi.

> 
> 
> --srini
> 
> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f37..5b06cc1a5 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -215,6 +215,12 @@ properties:
>>             maximum: 4
>>           - const: 0xff
>>   
>> +  qcom,swr-master-ee-val:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      Execution-environment value used to route SoundWire master
>> +      interrupts to CPU0 or CPU1.
>> +
>>     label:
>>       maxItems: 1
>>   
> 


