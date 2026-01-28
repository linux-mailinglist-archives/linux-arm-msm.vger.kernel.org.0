Return-Path: <linux-arm-msm+bounces-90990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFEPOPf3eWlG1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:50:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC7A0D2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6CF330FFFE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B159934C83C;
	Wed, 28 Jan 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFpt2mea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ML1Fyr5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B222FD1DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600538; cv=none; b=h2ZqQrdec+1biyQoBl2Th4XuBDvPTybZPn8yRKeAsTonLOW7lO+1t5DRSjSjC13sngtGCKH+DpyhSr5jdsmlzpyyFEMAD6t5SykcPKULCnBw2gWwwJ+VkeXK+e60Fy/y2Qs2dBMxLtxQzdow22O+pgrNEp7HsbiFDSWbcetQthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600538; c=relaxed/simple;
	bh=VfA0s8gV8RkY7oHs22Z4kLEl0M1QVhD3Ns4IJzqTX5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5Qq1U6xbIhaaN/8fT11EcX2ltbEVlnrFWIw3JbgjnlQiS0SgT4UxyJgjeRhFOdWw1hNoJdmCACt+ABb01p+d7TDdsRnTK+YC0mCI+iULkBgUlID/PWxolt3rBZSwn6QjJvX6egyz5yj3eiUL936yk3fdKOP+ScBo3OOnnY4lok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFpt2mea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ML1Fyr5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929G5320331
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtONpyERsFg5XG0LRmElfUfk0cYlaAzd3AV5icgJLF8=; b=SFpt2meavqyBewK1
	rAyrNDp8RAngA5SbbgaMaXE5/UCgd+2C6/ANY1sSxUiDTfp8/fnKtthrmCjPFMc0
	xebObg2zBzpkyGHI0bZnSMX0e7TfCI2ULLVKkkcyS5773s2ckWyM0TNUek3W9oPP
	1dno1UYqVJ87/tjFewJ4q/Yt/ABRLWTJDy9ddB4iaP0XxeTO5d1f3kXelCotsQ23
	okwsdE0BcY1o7AxKYpGcnEbaLK0HkyfhOuDiGk1AgjdLIcrd6WgQEFgfKDyv+kVs
	3R1grTScHoeOuwGHqgVQzCxjv8Q55OR4A16iuUPKBm/1QhxLzoLKiwadrZc0u0x7
	2uHseA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtj9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:42:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so54714085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600535; x=1770205335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtONpyERsFg5XG0LRmElfUfk0cYlaAzd3AV5icgJLF8=;
        b=ML1Fyr5qlRnURES8zNUiec0Qa7WDSGzgqZSW1uZ3UpECTfsTiOwhy1QIIT+/SMYSBG
         8d5wzpnDl7Bq5SxwK7SknoY+lXq9oIlRRmxkw/+GIUYZKp9X9jPD5dozrV/crKPWElPZ
         mTgLIROKp3CAZMFTaj2Rk7fFUX6L6QX0mkGgUphfgA05SAoHaeHJwPpg0N7eYFvzhmy7
         Ov4obxijPP2Im4EBzfcStvZTYAYZQ68pAXt4LAIq2QU5dw2mTAgEW78TMyk/Dh8wcMrX
         kRYHcP+dL3AXfY/Sl0EVWVcdY9qLWmkq8GSYuWnJjRWDQqoSZGkAYRvTmypY5y0TAENs
         kx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600535; x=1770205335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtONpyERsFg5XG0LRmElfUfk0cYlaAzd3AV5icgJLF8=;
        b=aws8EsRXsL7qFAjsx01dks01VIvTEmBAoH5Ho971ZD2De+JCreeMaDhkyF5hnfQGYN
         jwW2zhjzpcwTnDcDD2+YpTfIFGTKp22TbbWNz6DWboFMSq7KuiHnhf38jJmc3EJhpiS1
         uazvlOKSBP/J5tgrcwcUJZQ8GKx7sbJQ/vwGK94p4b29HqgqTJty52+zvDB3WFgHyDxp
         YcyUY8KPeLqhnx2NmOLN6rvifq4Pt95XyzL86q7O+UgWB1hU0p5JkNBm4n2aQtEpmCuy
         kkxMXaDajKDV4NIyELC6lewsy7i8vIcJEkSJR3nrleLwZtbncfkLQdVLahasw8iU4buq
         MpvA==
X-Forwarded-Encrypted: i=1; AJvYcCUfSgxUuRQTy7AT3wcDDawt+8DlawLcfo5dIqz3eOMSEf/cyVkbHI7016ErDzSEINHJU2pvxRy1wet9cEbW@vger.kernel.org
X-Gm-Message-State: AOJu0YyaY1KK7+Sujn5zO1g/InWU6LUTBApenWSpNSlb1bOtRYZXdiZN
	Fv3CrV++Ezx/kGqdOV+MSQ8MhLn7LlQRG89uHQOC4BhJ+7OTNvzuAVFPyEUly+6dtAH7+ApsacT
	8m+upaRSdtyhwO91jkfi5Yyn7ziiQn42FS//cY1vRp4mlmDy2j13scUGxBxUNpqSArWot
X-Gm-Gg: AZuq6aJra0UEpAHsYL6SJ9RB6tmX7//EbS3B9vhnQc8duCGYSi8pkjyb16y5S2rLNt8
	eX5VUQscuQJuyPRnvXrcAtgdRyQiTVxvIc7BJhY/AHLpvxY1Vo81PmVU8UOwRhI6GKQitml29NW
	bBtxdAQ1Veo9BJ67ICQlJ1zVi5x/8vnN5CGVGYIAqPCYem2vI5apru8aEnYgx/tEpVEayvvkQZg
	pewi73ZlvZh6m6QzEYM/mTf0CDH4B1gTUiSzCbPB5PVP0xOEjSOkcOzbJUbzbiRnviXfyc1M78h
	sQvZC+urJHRkTQiLJIjJhxydPbscdJ4sKi9H+KFHgm9gNt+2St0uMfrfzcWwxsAQjRatUkvL7CS
	pYGx+Lo/BnmKqDC9uGnEC2PAaLtyxzW6NbmRLcLQwrey2LK3DIQr39HTljWKfoTl7bNY=
X-Received: by 2002:a05:620a:4723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c714b4467emr135281285a.1.1769600535528;
        Wed, 28 Jan 2026 03:42:15 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c714b4467emr135279185a.1.1769600534976;
        Wed, 28 Jan 2026 03:42:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc56e8sm115534966b.15.2026.01.28.03.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:42:14 -0800 (PST)
Message-ID: <99aa1a81-e64d-4ea8-b69d-3ce08b9994a3@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:42:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
To: Saikiran B <bjsaikiran@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
        konrad.dybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127173736.82976-1-bjsaikiran@gmail.com>
 <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
 <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX0lXs5+mtUz1W
 tQPdDcOLuoBOzjGzz3qqrK74rTlvTktW4alvi728Zi9D5qark6BwQM/67C2qtMYsvmo1CsBNK1B
 6a7zZK+hJMoY/GFGmMvamK4pq0YCynHSc/gehAHYmK7B+ABg5TnpnSgw/vf2pCA+PdBIBeEgJUM
 2XtEQD++eJuFjdRTGoPW3z39a7AIAt3R1G2Edvt7ASj2+ntgd1sSH8+X9s/O/tp9/cCbTghGApB
 AOjiz0IWKfcx/AlK3Pd6L9a2p/brWRKSpxkSd8qPWDP0e6qc+MUsHJgpv+BHJmVEL27CXRkAjFZ
 qOBZmFOmObIZGgCiwxO/qUwBWy6dZOOHAIExbyFjlu3V/2cc16tMWIEcTd5L3/bd22+VufXnsVQ
 4aUacqVAccnN7hrol0SJc7mB6ePKbeV0AEHM9YRBYeQU34tKrPXBTIhlF942DH6eifEW3xq8RHA
 tAJkz+Gg9yYXcS+nuMw==
X-Proofpoint-ORIG-GUID: QTDP7aaNiY6Yfm4cqG5D51akxUl5sJy5
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979f618 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5vDLdzdhuu4WptbGUvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QTDP7aaNiY6Yfm4cqG5D51akxUl5sJy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90990-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69DC7A0D2F
X-Rspamd-Action: no action

On 1/28/26 12:34 PM, Saikiran B wrote:
> On Wed, Jan 28, 2026 at 4:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 1/27/26 6:37 PM, Saikiran wrote:
>>> The core regulator framework supports enforcing a physical off-time via
>>> standard properties, but the `qcom-rpmh-regulator` driver currently ignores
>>> them. This prevents boards with slow-discharging rails from enforcing safe
>>> power-cycling constraints.
>>>
>>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), certain camera regulators
>>> rely on passive discharge and require a significant off-time to drop below
>>> brownout thresholds. Without this driver support, we cannot enforce this
>>> constraint via Device Tree, leading to sensor initialization failures during
>>> rapid power cycling.
>>>
>>> Add support for parsing the `regulator-off-on-delay-us` property from
>>> the device tree.
>>>
>>> I have tested this on the Yoga Slim 7x. When the delay property is present
>>> in the device tree, the regulator core correctly blocks re-enable calls
>>> until the delay passes, fixing the camera brownout issues.
>>>
>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>> ---
>>>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
>>> index 6e4cb2871fca..aafba61551b3 100644
>>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>>> @@ -503,6 +503,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
>>>       vreg->always_wait_for_ack = of_property_read_bool(node,
>>>                                               "qcom,always-wait-for-ack");
>>>
>>> +     of_property_read_u32(node, "regulator-off-on-delay-us",
>>> +                          &vreg->rdesc.off_on_delay);
>>
>> Would it not be a better fit for of_regulator.c?
>>
>> Konrad
> 
> Hi Konrad,
> 
> On Tue, Jan 27, 2026 at 4:00 PM Konrad Dybcio wrote:
>> Would it not be a better fit for of_regulator.c?
> 
> That was my initial thought as well, but there is a limitation:
> 
> The `off_on_delay` field resides in `struct regulator_desc`. For most
> regulator drivers, this structure is `static const` (immutable) as it describes
> fixed silicon characteristics. Generic parsing code in `of_regulator.c`
> cannot blindly write to `desc->off_on_delay` without risking a write to
> read-only memory.
> 
> The `qcom-rpmh-regulator` driver is unique in that it allocates
> `vreg->rdesc` dynamically at runtime, which allows us to safely populate
> this field from DT.
> 
> To support this generically in `of_regulator.c`, we would likely need to
> introduce `off_on_delay` into `struct regulator_constraints` instead,
> and then update the core regulator handling to check both sources.
> 
> I opted for this driver-specific approach to minimize impact on the core
> subsystem, given that `qcom-rpmh` is already set up to handle dynamic
> descriptors.
> 
> Let me know if you would prefer I attempt the core framework change instead.

I'm a fly-by reviewer for this sort of thing (as you can see by me not
knowing this reasoning..)

Mark (the maintainer) should be able to give you a more insightful answer

Konrad

