Return-Path: <linux-arm-msm+bounces-91973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAnGMPR0hWm8BwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 05:58:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1612FA2DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 05:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 394523003809
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 04:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05794337BBB;
	Fri,  6 Feb 2026 04:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKX3nUco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd/EIeq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63582E62C3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770353902; cv=none; b=FOQ1zZHL93sgoJpxNC/gem6BynsmVzyglK/mFgm9cTnEoWXZLvEN6JDh0sJ75hQHePZJ/3l4KJgKXOiP+9CIJViPv4wGHnZfhf5Wz0kxmAimNAj8xmfISVb2JzkB8ZwsO9azlNMaJ4nODoU/65EIkWvoC6Pranifegv07WvoXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770353902; c=relaxed/simple;
	bh=HFJ/fLFk9ug2zxsp/V3WRDnuv1yuuXkFKvWaiCEVpk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8N1HfbA843JcHmSGNVCnez3TLsqvh5fyirN/aFut8NgIC6iKUiCkKtxkR24kDm3q9QNpClk9mDHN6EW1xL3KFmbiuNNoj3+cCcKzqLiVbEAkfMRxUHplLKfsqIdjGSneFLZi07onIxa64HOs6hgxOJ+dtPkJoLpL8MipikFtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKX3nUco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd/EIeq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xcxC996532
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 04:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruDTlQHiM+r23KHxF7Bht7uZ/m0fwp9jaMKcAYm4l8Q=; b=NKX3nUcoBlxzsrTF
	q+5Vcxt0jlECefXpNx+dRlno8Slo4wbVmOaGIuXd6gXOOQGY13SnpgSD5f4XH1X7
	zdgrrYlEcfo+4RApVkN21KIQbE05khdMEOyTWjLQsFzjrahY3WGzHlg1zz377weg
	xDjzmPNUjFwJjZ8ehadeGEgDMNKqF1/g13yU9Duj0/t+oU5bP9t2CSFmSSVHoMMx
	DLZi1gdaj3QXtDTV8EZDAzMVkHZiec6f6h1iHa1m5sU73nLlb9Hyea7RMALxUHcw
	H+2KekFicdvCNu1a9/FnZfuzzI/PMswo8q0DXXwlxB0CUQMy2M+XFypxx/gNvrYU
	+NK6TA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55uwmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:58:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8c54bbe46so39296355ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 20:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770353901; x=1770958701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruDTlQHiM+r23KHxF7Bht7uZ/m0fwp9jaMKcAYm4l8Q=;
        b=Jd/EIeq6LPcvSBj3xB5NMe+f1IyZcp7tZ3NehQKxu8oR1gO4NZrkZ4i7cXXzGgUJfu
         0JIZnJfHw0n3KDllxHN5gAimKegPqu7zfI2cZHKmrHjkFEw6+0M6zPkz89fKQBzwR7p2
         1IE7WeAOaXFRUtSa0qxP5gSZBHac+IeyhtFBEFObMVpEcI4595r7HvyU39cSNpQ769p9
         QhwMN81Bp5jpdbhnWgpD4B7VIg2oXp/Nh2MzHR3PiNeWNepYnvEoqLsbb+Wf2qxyTQPU
         VYC/sntI/KH9ZWrNivyDGvi3c7FNOSZDr6BRQVyQGJWhuFBhAn14UbS1I/+oW5I1vysC
         YneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770353901; x=1770958701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruDTlQHiM+r23KHxF7Bht7uZ/m0fwp9jaMKcAYm4l8Q=;
        b=WnUvfkQsoATY5O12OiNfNYa5JCuOaIsy9JrSoyz0I9HGuJQXTlZUephnRdCdCI+96K
         9TM1r6Rpms2T8srlV9KTqtsPSWLKPSIgQayos/1RH0Qd95yqihAcV2TqLo+TOSBvcqOL
         fpNqbdgvdXH85TZCfpTxw/spi5w+EYhJI3XmYMx1gg591qhXh7ISUDLjpC/9IY4GJsGU
         Avxzlqd4+DA79hWlO31OYcJDcnVDRkq13Wo8kf5vdemMK1wjaa2AP8AhWGetbVJYdufk
         wGLxaZlCBtE0MTk+JfhZWJF04D90i//UsWZes40g+H2B73X3byOhjYKdasa+1zg5e9O5
         jmOw==
X-Forwarded-Encrypted: i=1; AJvYcCX2zYamFJNscaM52Zh7I8vwjITLPVk3zq0PlMsotjUTehZYOhzpzdDeS8LWNejMGmeghBEkRGcSXpPowgo3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg00JAU+g+H4lK3jIsaok/nClziglxk9ZWUXAd8jOVTp7jU0cZ
	RwH22qZZ9tELc/J1CAERKLFhbp68pjVxUGJxWzaN3kE/h/k3E06BXU6MPe1PhEfnD5UVItyr2Aw
	ueAxZqMAuiL1+42FsNSsbxLEC8zUtGezm/aa14VmoOciaspF4WJj2F5O369mXH2atvyMY
X-Gm-Gg: AZuq6aLqhd27j3t3r/ZS0T5SuX/Gyam2RFJI6YulbiMkRRKx3A2qywUNwj95Eg4t6CN
	RSBjSDM7GntRMa8yK2Sl2ZxLuNYq/PiKkW1fJSJ7sLgvkaxb4wEWgj9sEF3GYjXIl3nggHYw3kU
	a7UcyO8/k6F0/w7tGHU69Qz9KsiJzK5CnEzpQCqy/AfqUPMrhKsGVSknsKAEGX+OGtkDG7StouH
	asqSEGH5hBV3DuFtyPmNhH/p/JqlebvuU0ueWnTajn4aiT8R+vGTGIhXHiqMGiBJGRnLdODdwHr
	z0nqiQ/14XvAfP4WRpVvwPNjSTXMEdWNXrWj6o3IZ3cJhsmqrZlS6UwCgH182DuLKTOA7bwJBf9
	OgTdYrS1jDjmW8CC2NhtouXM7otr65KWVU4NK53zzWQ==
X-Received: by 2002:a17:902:e54a:b0:2a9:320a:eca with SMTP id d9443c01a7336-2a951636d79mr15637795ad.22.1770353901289;
        Thu, 05 Feb 2026 20:58:21 -0800 (PST)
X-Received: by 2002:a17:902:e54a:b0:2a9:320a:eca with SMTP id d9443c01a7336-2a951636d79mr15637595ad.22.1770353900783;
        Thu, 05 Feb 2026 20:58:20 -0800 (PST)
Received: from [10.217.216.195] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c71edasm10164305ad.22.2026.02.05.20.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 20:58:20 -0800 (PST)
Message-ID: <f694b267-ec02-4867-86a3-b63ff2d908ec@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:28:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add
 clocks property to enable QoS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
 <b37e6569-61e9-4998-8fc0-603b83edfa2a@oss.qualcomm.com>
 <95d42fb7-2365-46a0-a995-c9cc51b17424@oss.qualcomm.com>
 <ac26d960-5c05-4681-aefe-4827b74ef29e@oss.qualcomm.com>
 <a9c2f6e2-0185-4a1e-bed6-fd1f542b2367@oss.qualcomm.com>
 <luahjv66e2h6gvxygmy2syzvt4rmdzqlfig6um74ysfhidyztc@eu4whsehmm5q>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <luahjv66e2h6gvxygmy2syzvt4rmdzqlfig6um74ysfhidyztc@eu4whsehmm5q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAyOSBTYWx0ZWRfX327HYOK9KzbX
 vLhi+YDUu2YKT/7WH3suGhurhzfNxf8u+nKBf/6uXoLKG2wCNM3saLEsFagPvcdmkzTAYFVx3Aa
 HCiUw2BUkCofYpLLgB97SClxsjbN7vaP6DZ9QbJjLnRkubJkYZ/0IlpMfij+HA3oorGgqXoDtA+
 eCFlKsGtXlGsWpZYsej/7SUVLDCwBW39E98vZbTgMcbO1EDjQrr5Kd1Zrv3MTHWJ4Ggs28ehq8Z
 JaE531pH+3/oRrrpbOYUl3J2cUH2ABn0n3VYacqIlEBMxofC3nLB7mfGaTA8Sruq8oRTqwO81uQ
 OEyAjHYWhBNZzG2F62nkiYT701YpEh1Ft18fGgzv7BCill25q5XwJ5jdtOQ/3HPPcoAbBZDtpRo
 Dr0NVssihcScYxe61ueD5REoAt225u8vChVmWe/GoM2/gCBYsaPHqM8Qn3tDVaur5CRQ/VWLLNm
 NlmvHFlsiaOnT54i1cw==
X-Proofpoint-ORIG-GUID: 4OPAE5pijOKeorWL8fY9cDM5uW_HgJnt
X-Proofpoint-GUID: 4OPAE5pijOKeorWL8fY9cDM5uW_HgJnt
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=698574ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8fnAZSNZBFF80Bt1M-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91973-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1612FA2DC
X-Rspamd-Action: no action



On 2/5/2026 3:59 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 03:10:31PM +0530, Odelu Kukatla wrote:
>>
>>
>> On 2/5/2026 2:31 PM, Konrad Dybcio wrote:
>>> On 2/5/26 7:06 AM, Odelu Kukatla wrote:
>>>>
>>>>
>>>> On 2/2/2026 4:33 PM, Konrad Dybcio wrote:
>>>>> On 2/2/26 8:05 AM, Odelu Kukatla wrote:
>>>>>> Aggre1-noc interconnect node on QCS615 has QoS registers located
>>>>>> inside a block whose interface is clock-gated. For that node,
>>>>>> driver must enable the corresponding clock(s) before accessing
>>>>>> the registers. Add the 'clocks' property so the driver can obtain
>>>>>> and enable the required clock(s).
>>>>>>
>>>>>> Only interconnects that have clock‑gated QoS register interface
>>>>>> use this property; it is not applicable to all interconnect nodes.
>>>>>>
>>>>>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            enum:
>>>>>> +              - qcom,qcs615-aggre1-noc
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        clocks:
>>>>>> +          items:
>>>>>> +            - description: aggre UFS PHY AXI clock
>>>>>> +            - description: aggre USB2 SEC AXI clock
>>>>>> +            - description: aggre USB3 PRIM AXI clock
>>>>>
>>>>> Should we also include the IPA clock here?
>>>>>
>>>>
>>>> Thanks for the review!
>>>>
>>>> For QCS615, the IPA clock is already enabled by the bootloader (xBL) and
>>>> kept on during the boot‑up stage. Because of this, we do not need to
>>>> explicitly enable the IPA clock in the interconnect driver when
>>>> accessing the QoS registers.
>>>
>>> Would we need to re-enable it to re-program the hardware if say the
>>> icc module is loaded after unused clk cleanup or after a cx collapse?
>>>
>>
>> IPA clock is not managed by GCC clock controller driver, so
>> clk_disable_unused does not disable it.
> 
> The clk_disable_unused is not limited to the GCC. The clock is managed
> by the clk-rpmh, so clk_disable_unused applies to it too. 
> 

clk_disable_unused()/clk_disable_unused_subtree() does not disable RPMh
managed clocks, so it does not apply to IPA clock.

>> As a result, the icc provider
>> does not need to re enable an IPA clock for QoS access after unused clk
>> cleanup. And QCS615 does *not* support Cx collapse.
> 
> Does lack of CX collapse apply to SM6150?
> 

SM6150, QCS615, and Talos are all names referring to the same underlying
SoC family.

Thanks,
Odelu


