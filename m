Return-Path: <linux-arm-msm+bounces-106842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPgWKCp0AWr9ZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:16:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E605086FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57DA300F7B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1816F2C11EF;
	Mon, 11 May 2026 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK9LmJ38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIhrbZg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34D22541C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480146; cv=none; b=KnKN4KIAaVdyOwudf4+KHRk6AIU9UbbDERu5HYQewDpVEAlAkaPdtT7i3wqPS+SbJhC8tiixnql4frf2QIqjcuZ5/t5BJC9AiWNzpqdYMmRs0OjDyLbaZiTflypAUE8AnHH0rr+i50Xety5mPSVbLgbuFTvb08XPKMCeR8v3xxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480146; c=relaxed/simple;
	bh=nMNNMgNt0qQdYKCR7rqoHv/euvrL2jsocSLSsD4h6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW9W1uyyC2kfBYSkVs/VaxUvljz0M0OTOUCj5yw6cFYlJ6dJJPtpkWivPXUdlyUrOiDUmO6oG9qJQ2PG7DdSgrmwph+5/PTZA81vUT9W9ZrvimeLBKHOmRPIMdd+2ERdgiAqhbU7MwlDRkUpVCq/ie4jovQlIq4kgyBKOOz7IDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK9LmJ38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIhrbZg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B60gVR3163614
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tiqxzGqdJED19gib91pm/fKKRdfR7tXGS5FzfvQm0To=; b=EK9LmJ38kWQuZnuL
	/1pZnSBwVKgBb5Ut8kv96k2d9rMiok4HSQqvPM5D5rP6weIiBypL3N4lxCzW+pnT
	B2KlJLsJnIVv/jVz0ZEWbkvfHHxFMvgJaWGaxwY618q/TGKvoSh9zI/kr6sjz1o0
	xOCfyLe/7BQd0jQx9Z8ZB0jZQlJCuTYIcztHD0ZJtaqUdP19wHU12aHQa4r8nLAk
	mvIL83mc33R/mLWCDR15ALqtEJTy/58D8th7cHrPCBaXRg0/ckhiObCmNptITvAW
	WT/9nfQP+bEA+y3ReybGgPcpZWRPYrFBsUqSX7pi5QAdTGuTydw5gMvJ28lnxFb+
	i/K6eQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksjwcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba054e0304so36221235ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480143; x=1779084943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiqxzGqdJED19gib91pm/fKKRdfR7tXGS5FzfvQm0To=;
        b=hIhrbZg+xm0yaYtJ6qjACXTDOyExSR8uJkUhfXtg5ZpjhCzzsKumhnEeZblPvA7PoN
         IBoMfv4yGsXtoSbiz5gShsbCX7z/pmiWrDH0/recVSnTYUUco54oJbqJpooPXaSxM142
         y6fHhkLrFC6CQh2cLGv0DAgfO3/j/+luwiAbY6v5pQcSFqODdnXeODhpD+mB9hg7U6oP
         ll6kojK8ds+pUnlyUSsQnWEfZ4cB65qrcvk35U4x7mwXKiMh1ixZkL/ftGf+S5ZeuX8k
         3R83WhCxPwBbNPzOkWMqdmLWF4xUH0os8rvPvTKCtUHXDIJsDd1ufFhkT0De5Eqg88E2
         7OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480143; x=1779084943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiqxzGqdJED19gib91pm/fKKRdfR7tXGS5FzfvQm0To=;
        b=gylys0yOgQKwzMZDP1zmCCe+jXuizxYmyFf2bynjj+CXPd4fkJrrsPQK2lZsiW3B4j
         CQLV9zWUYnAm213WYdNsWCwfzFqaMmrzPAWvbC+YX+ZWjZlLYnfLSKUrfWfsGNJ+xy3t
         j5xJwGvoSpYPPMkxmYLElenDji5zH96gwp1KsvKRVOjzdzeSZ5tikWWWTPzKyzNDiGgm
         Cn8qUHdOF+iAd9t0cy/dEIzDIch+5Ubtc3vreBZFkV6dz0VDOquUUZ7XvN8GF/NsPdY2
         ljSxTKRF1oYSyWR6elKbZeUaW5+W164XbEcUpDS7fhYRS0OoHvNIhbsgQ2bG50lhDfxZ
         4aEg==
X-Forwarded-Encrypted: i=1; AFNElJ/Y77sawQFnaU9TZnbV/MI0sJo/dkMTCwj5j2vhOaaEJW+vzdTB/FY0WLF2iw9u3tCgbtBWK3+MFDttcMF9@vger.kernel.org
X-Gm-Message-State: AOJu0YySnSZjGymaLb3FfzoJzqKGTA/4+BEmu2iCu74Cq3CjEjDLVh0Q
	+QJxqsG3Vtmcrtf0fmzQXLEpPQxluwItooiZxIF6v2ncH0SnYfVaLfkAVZJBrKZ0OpbG/2SZ8Or
	Ecch9WL2ZGHzoq4svsTd4fwHfZsdETpa/ebEjBZX6T5noTVG75D4SWmnQeKYOUHFoCQDo
X-Gm-Gg: Acq92OHcfBWX6MkWwiggQ4u+4KQD4VHYmTvILMUff8GG7buC6aK0ZxEgLfQFSd57CPW
	hATBWvh8zkssEylpEYmqIAk5+4OCf2D0Ca6F3j25ac1opePf57ZI2kT0I0RHRQW2/tdz3l3S1BH
	pzITiemNCfB1JO7lbXY58dh23zjzq1L16Sk93yAk/vTY1gM+mjfZzgwMX9LFnXZzg41bRXQLui6
	gXlw6w325ZN/GxnPyFsvqEdUn77h2YuGUa1e6ufmkg78Oz40vgLD+n+gUQzZNMBD4qE9K428+cM
	51+w5hC3VD7ptFPj6WgK0GRG+BzLp/Ip2EbZlR4GWZZBgzYMn0Fe99zTUY3uxp/Fjs8X5twsDW5
	g9fSG9allSSXeIVpG7FmD3WcsW8qiGUPbEUp9Y+GtvlgxtMotNvo=
X-Received: by 2002:a17:903:1a86:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2babd4cd7fdmr142843475ad.20.1778480143247;
        Sun, 10 May 2026 23:15:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2babd4cd7fdmr142842995ad.20.1778480142633;
        Sun, 10 May 2026 23:15:42 -0700 (PDT)
Received: from [10.218.50.10] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm92563845ad.40.2026.05.10.23.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:15:42 -0700 (PDT)
Message-ID: <6e0081a3-a28b-49e5-825d-405cc157254f@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:45:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
 <20260508100700.772985-2-priyansh.jain@oss.qualcomm.com>
 <000ababe-5f9d-400c-b7b0-380ff25e9fad@oss.qualcomm.com>
Content-Language: en-US
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
In-Reply-To: <000ababe-5f9d-400c-b7b0-380ff25e9fad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NyBTYWx0ZWRfXy8zJv523+5k4
 M7Fg3wnMOjR0jv1aD65XYO75YnKRrv7zAyKRqk8/kW6ITGPSe5A/phu3LRgxRruHieRXhYNstyh
 +5M1Fx2R3B+oPOXAANtzXBWSh5SovKq0s9LUELtuOJCOnV9BLTDCEz/kg4dGdO47dLopShwDVxr
 OykeaFEtooU0GYUmB1dgpGt37Qr8jZl1A8bN0ifAQbP4U46md0PSuljA84H8GUmvQZHyVeiqgJ5
 3wwYDxQPBU6PwlJwcJ4vqky89gqKHsu60mXA7yOdGJlm5UGBWrps/MQ2SvbZs7IXWZCmD4fjN9l
 LOntNGMMeCASiM8itu1YYpE28kMSkxJGZyHK0GsNycBl+Nm3OagUd1beuzARGrV9lyucB8aFE12
 sqHm8OgVSLPO6iIN4sxtNbqGDmcMOnn7qZDMMbEXdty/Qq43p2TMfIzmlrDyBynI7iQQQjLBux0
 3y75TDb65CpfzJiiunA==
X-Proofpoint-ORIG-GUID: HzONRFeJ6VzjoGqtmgUQrqDLZggYZZ8u
X-Proofpoint-GUID: HzONRFeJ6VzjoGqtmgUQrqDLZggYZZ8u
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a017410 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=c8u1hPl0b-36Wx5Zf68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110067
X-Rspamd-Queue-Id: 59E605086FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106842-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 08-05-2026 05:39 pm, Konrad Dybcio wrote:
> On 5/8/26 12:06 PM, Priyansh Jain wrote:
>> The existing TSENS temperature read logic polls the valid bit and then
>> reads the temperature register. When temperature reads are triggered
>> at very short intervals, this can race with hardware updates and allow
>> the temperature field to be read while it is still being updated.
>>
>> In this case, the valid bit may already be asserted even though the
>> temperature value is transitioning, resulting in an incorrect reading.
>>
>> Hardware programming guidelines require the temperature value and the
>> valid bit to be sampled atomically in the same read transaction. A
>> reading is considered valid only if the valid bit is observed set in
>> that same sample.
>>
>> The guidelines further specify that software should attempt the
>> temperature read up to three times to account for transient update
>> windows. If none of the attempts observe a valid sample, a stable
>> fallback value must be returned: if the first and second samples match,
>> the second value is returned; otherwise, if the second and third
>> samples match, the third value is returned.
>>
>> Update the TSENS sensor read logic to implement atomic sampling along
>> with the recommended retry-and-compare fallback behavior. This removes
>> the race window and ensures deterministic temperature values in
>> accordance with hardware requirements.
>>
>> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   struct tsens_features {
>>   	unsigned int ver_major;
>> @@ -522,6 +526,9 @@ struct tsens_features {
>>   	unsigned int max_sensors;
>>   	int trip_min_temp;
>>   	int trip_max_temp;
>> +	int valid_bit;
>> +	int last_temp_mask;
>> +	u32 last_temp_resolution;
> 
> You don't need this now that you aren't altering the regfield
> definitions
> 
Yes, that's correct. Thanks for pointing this out — I will update the 
code accordingly in the next patch version.

Thanks,
Priyansh

> Konrad


