Return-Path: <linux-arm-msm+bounces-91315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKVtCjKwfGmbOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:20:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B8BAEE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5182D300F145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0CD2DAFD2;
	Fri, 30 Jan 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYeZBNDG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8zpEcG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F4296BCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779246; cv=none; b=Ol7NZpqO12FYQbNz2HC60H+uYQNXSZ2/w680kTRKgOJ8mWo3J9ttYGDaV8Jf2EOj36mY7bQcP4Ptfafp3Bjl4D70KC/5tKN/A9cfm/+AFSO/SQzi/oI0fpkpc1nutv/Jq3xPIvPX2cjUGoKOXyCR82UPgX87SuTV8liVMsnzYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779246; c=relaxed/simple;
	bh=EaqD6SfOKolG+MO1MDcVF1TeavU1LSwcT9JiQiI5Jdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NS3rVtG1Ni0RIa9rftyQY8SR29MdzQRzU5iWYcXtHx5bCicAaKIAWFZBFdMY45+oYMvISLfzWTkxkB9bUxtmVI8h6RbN9Zt+xs1jnstwiepRCxHV17cbw4t8KVw6u75uuRo8jCVTqi4aN2wXzF30h3+HOY7HKWpFpTQKuZ/DhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYeZBNDG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8zpEcG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UB9Ji7555424
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=; b=BYeZBNDGlvZVo0GI
	27Laaf8mUI5deFPPV+ossT0Mxt6PlcRvzYO7VxrgyFyCpjHLIWOFnm6ro2Icd52/
	PemwURBFR7Jfi9Xka0aU2VBpNHhx8EsTtEpNoS2cXaYgt2lYuQFBfdKC6ZknlL3A
	4oGE6p9aglAne0/Mp2fWpvLLANl8hNgq1hfWedpOND2wvj1BVNpdePwnc47EWTGi
	gcWIW4LfUhqVl0Qtk3nUDWYe0Ea5HbGlX1Xr8FuKh/a/aX+aZdIaObU0vZAoqx+A
	zA1FcGrPcujh+reiOOV2xWfcX6NPObYWS3mB14tOoEX3k/qyc+v1t6w8HYf/EnO1
	VGh+IA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59hd0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:20:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so4871343b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 05:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769779243; x=1770384043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=;
        b=C8zpEcG0xPQI8BKBlIiuN4xAsJJZX99bdu8eBFq/dsx8IChenbfuH/4ONlq+oKaNJh
         AbC269I2ticy/s0QPby4B1N8RqngS+52K+OsBYpCNeqkokmqw4Ld2ajiW1RVOW3blKsB
         AzBLZdMhrxFZxvQd9pU8b03jWb/eqy66//7ULppp66+CneAD1uguKFHZndLzs39AYJXh
         xPpBqlLRsPBPgDY47NlEkQpn6MV5aMfQy9YzhbEDnOSvrG2snqsJFoGrsYU5HXqS0Cvb
         sD5ClfmYt2IJXCaBUzYs7hhT5zU3tvxlZSSzj/nbHzdFy2iA7Ub6o7jjCvrksUf9ZMxc
         aPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779243; x=1770384043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=;
        b=I0YCczc+fXEdVAl9Hxs9zVGw2f6znP0p5ECu02ThKUK9aEoyJmhq/nG6yJG6NDklRQ
         vvqfi3C+JORkU18VK3t159hGLWh3i5Q3W3v/kgj7l7Jagy6nqrJJ6oqUPTeRcU4+G8xf
         iYV3MOYe+xGXbp0brcDDHNJQD0g4iBRmHTe2uEpuim27FSq4sg9/XehCBKdXGhR6DMbN
         MXbxT5adunM98NPFpH13XV3aXdmrG2XbVy3l0tnS1BhLrZwRjSrZnsSdsDkTS0/v+v/4
         Gk17ta3rqtkn+Ci7H0Jmo+1tkFjShe7EgOaqby0VjwQkeR/xreYI0zNbtEXd8pI8QTUL
         Ku6w==
X-Forwarded-Encrypted: i=1; AJvYcCXb2xv9nR9Ps8VhGUOVslEnw1yWPIkL0AqeEYsnIrRTOhiD6lkj8gYvhuw0EmWei/9H1KOfZze7HlKeWAs2@vger.kernel.org
X-Gm-Message-State: AOJu0YwVeAwKOMZQcE+rfdBYs9/TZiqPMlTbxcX08rlInccR92tpESL3
	9Jf+9ND/bEtLQrsHGUGk59WRBPrmhsdaOcdW8bxp6MwKcOSNk6SBkChcR/4ixCY2sFGkr+Urwo2
	rZiq/fnmyXISFcyBGTw/QG7w77sVGD4dGYRO7rDp/EHamKAmI4KKJRbKwKh0Rd55fAdwA
X-Gm-Gg: AZuq6aKmygiznqZmvkW/BexrTGRosh5boCsfRYFBa6qqtxqkYT9epZW+l2C1DUjs41/
	1rl4AEJh63RNDrhgy62KG9+vRhYv+Wk+AQjkbho7vqYdrjwqU9QVa3ejv9wUQcWnHSGkEytRVIi
	VzuJ7r/TZgaHkmovZD9ef0bsFZWiJXNmlTxXU68/vYG3tJ9c/zYHcKWtmgbEzN5qIGowVpCm0/p
	1Cnw+7ePGPB3fUPbDOilIchEHpQrnDpEcRzfKPtH2Twh0+leXRRnJJvTZ+qG+y6rerw/WXynUjo
	mDNhCjlZzfTxe+f11HvYgBifGQJGbCH70gmJmL4m7T76TDKa9JAqeIrIla7j4cTRxgHKURRZO2c
	Tb2wQ5+TYxzofSJkhx/N6tvrB+KHHbLLHMHjXBJA=
X-Received: by 2002:a05:6a00:3e02:b0:81f:57a1:68f with SMTP id d2e1a72fcca58-823ab72de5emr3410084b3a.47.1769779243247;
        Fri, 30 Jan 2026 05:20:43 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:57a1:68f with SMTP id d2e1a72fcca58-823ab72de5emr3410052b3a.47.1769779242631;
        Fri, 30 Jan 2026 05:20:42 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm8127449b3a.54.2026.01.30.05.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:20:42 -0800 (PST)
Message-ID: <1204a2a4-18bb-f43b-6974-a19d238ff74b@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
 <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OYsDB7CqfxhpNIogWiwvTbIqPt6THsr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwOSBTYWx0ZWRfX70kxzX76RcfU
 a7gunFxms/pb2YNDmgsdHUPsIsO5cZizfxBK+TSryaYACJuXCJ1UIIoG2wkis1C7HINw25+G558
 HVBfpZDAEtiZHcGrfku8VDmA4RoTqtSTj0HjT9AvvTgsp3oVyfB/px13a3HRfxXE2MYMXL0pzRf
 pLcItuKnYlEaKhdYijVTGe2T9uWzF6i1X3AR+3mLKIJve/dQNNXKYLKm7NQAtUWw5Aa6mhOeEy0
 2NeIoRsQjN7pgfoMvVm8agvw2Qezz7G4hPBKUIKXqqiBacnD/WVytVRB9pOw8aiKoRSqjB/+mfj
 UHT3Zwg8c2SZ/OO8qAGHJ41TLy0mjJ6fuSWPQpnbBaP7Sb22iKh/wrVWySRKv7wKnuR++vjiGR6
 JqzdJvXPsAiAk5LxGc9g3H/zpBZSSqnrw5mid+rs1CglgYy+rq/cRnYQi2tGU3n9LHdgoxcTHH7
 3fomGaiX0K67pswMqHw==
X-Proofpoint-GUID: OYsDB7CqfxhpNIogWiwvTbIqPt6THsr7
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697cb02c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i3vytz1KKoUbyb35L_EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300109
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91315-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E9B8BAEE1
X-Rspamd-Action: no action



On 1/26/2026 4:25 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 10:50:56AM +0100, Konrad Dybcio wrote:
>> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
>>> SM8350 and SC8280XP have an updated version of the Iris2 core also
>>> present on the SM8250 and SC7280 platforms. Add necessary platform data
>>> to utilize the core on those two platforms.
>>>
>>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
>>> driver is enabled, but SM8250 and SC7280 are still disabled in
>>> iris_dt_match.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
>>> +{
>>> +	u32 val;
>>> +
>>> +	val = readl(core->reg_base + 0xb0088);
>>> +	val &= ~0x11;
>>> +	writel(val, core->reg_base + 0xb0088);
>>
>> Can we "open-source" what this write does?
> 
> I'd leave this question to Vikash. Hopefully he can comment if I can
> open these bits or not.

This register controls the clock halt states for several IRIS sub‑cores.
A bit value of 1 halts the clock, and 0 enables it.
During power‑on, we clear bits 0 and 4 to unhalt/enable the corresponding
core clocks.

Thanks,
Dikshita
> 

