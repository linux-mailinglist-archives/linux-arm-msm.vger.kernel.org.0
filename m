Return-Path: <linux-arm-msm+bounces-119161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mP4bJSkwV2qQHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:00:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65D75B457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zh2XcmcS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dabs0OpS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFFD13029757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9709C322C88;
	Wed, 15 Jul 2026 06:58:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11736323417
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098734; cv=none; b=Y7d3c+219PZxMrZz29saYIq+XW0Aw80XPi3jQsi8UPHxAy72xj2dOfpSUQ5kzmplOpCMRNrF/3XbBxGhyk61jy3iW8AE3VU4RmGmwkmiNdKo/sek15vYSyEoKLmpFSaRIDglNMV4rHYIF/vU4Pxw0ggzFCKNGkwDeaU52HLLuMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098734; c=relaxed/simple;
	bh=2F33bP0CzluWiHtV3rOJhAl9WdVxVvWgw0557LH7+2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqn3xybaOP9/TqxvQd8A4JbIbesuObrN+IT1Fawro6zMqAAXEhzankvZOxPDtXWUpZkJOPjxinB/tf9wS7jXrOXmquC2hMh5HXIsRZBJnZ98Z95znCoStamRaYxn3p78k/YqMyOXddPn+KWPPVfhIazZcyr5GcK/E5zv1qAcVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh2XcmcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dabs0OpS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3kx3p2588266
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=; b=Zh2XcmcSe/bVKFC4
	evZ53wuZJ5ujyAm1LDk1V0py4eGQ1QtQ0+WmLgSXEcnVxywgI8isRvpYoVLNCZhu
	36tgD26HQFRoASvUlmUHivsz8e7tFwi8xCOHbfneAfCVrWI0g1ZhtPh9dYIdd2za
	4K+FTn3Pd+joJHdTyt48O2AoDt/CzD29NHvGzXQVQL6h68Kq6eIT5YG/chfssL12
	M8oJUkC5tBhdNYDCJWBSw++1+DuETCuBEvQsXlfkHfsJjFuEE/4MJA4nd4RKnc6q
	j7NfbZ/HRRJ8KIsdDQycdvj7YubuLHD+SzkHLw1pSb6OtqIeNmg9MQzqIaoOYd/R
	G08Dyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9htc2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848452dd146so4705248b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784098731; x=1784703531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=dabs0OpSD9xZe9so97AfbU7G1+nPMOIFSh+4xim2vfhcZauFULq9AHP70RM4MstL1F
         nuwnwjkVDH9zRFgNwMIwq6I0Tp4v9Q0a2PU1vUSZpwJv3slESbHR4geoA1M2c9kjFBxy
         2lDIL7l50xWvJXQq3F85OitBL0B4n4Oj5l7vrad82qz3K2IH4q2EC/494B1/dJUZ3ivl
         3PShb59AMIJ2CvsafZpT8uQXNYjJRYSVtw9FC063sLCnZwMRCH5Ddb0PCjjcBpNbd6Q7
         NVKd5gAZfc9y7z6T75ARndnsvKgXsN6Qd/Jjzbn7BAkp3lgmXOMhBYDCYRIjnLzh4Prq
         Z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098731; x=1784703531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=m72K7SQhfxYz+DFqe8JRc7l1M8HHm6joeU0m0CFN5B7DcYLfd9U/D1BdzqLot4kl08
         Ny4UI3B9AjFf08o88/JZGGP07Q2Oab4KbjLdnzYjSTYqg5TW5Yj2VR3EmoshM4uwsiVK
         W0H4Zh52J/5wHHvsMA/p05k60F6t2jpdWCE09EwxMf43MVgTmMbiDsInkmXDbjbq4cN9
         yC8w7Xy5UKvMyxAPMJkY7RPpqJLoKrD2ThMBq3ZzOp9eSmAYhRuU4A3z3ycCP6XuaPcV
         ISb8jMqzAe/oFrmxng5ZhF8D81FgnHMIOyzEevIdQI72XowR/wO03gAMQCZ00ncAuVif
         3MqA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4mY9BRHQWc9PowT9xdKBWyu+UWYi6fffXQqc710fgXZiaX8bonQjZr2usuSxTTQghb1YfpOr9msk3Ix3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2mf1DkdMItpUvUrthPo68dfTSmNdYKRbjfSB0M5dgGhxLbE4
	wKnykqRFvnJTRCSkLwaaNN9wg6NctwrKAHQa/A4/UfxJ3KzlcNrvEiPCHLXBtNU840tiv0jXlL4
	qVHj5OyFVKCtiUrHoBlTTG/c95MwYssHRCIGSu9V9azOBuXDXQ/E3wM1XW71QWJdG/7l+
X-Gm-Gg: AfdE7ckAypIe0Fkvm1FhNzWfTC09ZVs391qYkQqNL0ouDES7v1H8iIA9zHCp+w+ibfE
	tRadTUQ+0IfUbFr3PksAa5zHw8KLSmsQgN7Ra2anxBF0JaRKWrem3GQDj7Y30n3TzM1nHJ1cFkw
	z2j1/NxcY7gRi+3qW4svu3+Vuu+u+l0YWSxlCsP18VHFpJUOeW/OAN61KjN5wG439BH/3bQ/+xQ
	Psuw91xEVGCnq5PbKS3v3s9m8xmB0dO/Frc3VSboH0LdM/2XSvZRowkib7EPMyg1N+1Xeqd1ysn
	sYWtVDNPOouz8NMWsU1exsusasFqy5IkrPgPDDoBq3MivILyQd0xkmWwwltoVSkh8QOsP4vGzLu
	0CuT0Gigm3Sk0XucYbL1AbhiG0Bank5SJFCRo+IRmrRmlYtLHBA==
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113944b3a.56.1784098731306;
        Tue, 14 Jul 2026 23:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113930b3a.56.1784098730880;
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6c158bsm2585765b3a.38.2026.07.14.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Message-ID: <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:28:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a572fac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LJDSKmyOq5XDa4FDNxEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: u0qhJSpG13CulMabrnqHGyv7drDyNrBP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NSBTYWx0ZWRfX3Pf4rKfFdAFg
 QqFyqdWngdiaw9YeS5vANH17TVa+GvGyvBOrD4Gj5Ixq8BpIzPsJWL91v6/qg5b6Z55eRdzl6WT
 NdRKP+/TGQfYrfuJqVFHxWfSj8Zxnas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NSBTYWx0ZWRfXxz/XaWWVURXy
 t1cY1gnrp64HDaK2BWAPPW5y2RUgO4XhkFYeJ/ga2UFiYWDR9WtqaUr3xUKIPzfVhFEnvsEsdfl
 iJdkL+Htbj1sYR3cRy2P4GZjB3DH0MNtoTbGVPCtvT8HX9mK7ys0h1eL+QLzlW5dZAgXH2eudmE
 VZ2q4BrpIyc8qOopn4TuoXr2sKiO7VIhA+AdEPWsnrbWZFCFcqYavbJY5NPvbk3epEZzWjd6u6C
 aotBjtX4bosOs4Fq/babJWOLb4sFBwPJTYrb9KCVjM4EhHsHpq/cDJ0eazFOlxPw0o/BE4nDgN4
 LxbJK/HPpRusd42t85ZcWxbgMX/GVA8zTPTKQZv73zbeTSn+yDhJdXGk+2Odq4eGR2nJrWyrXDW
 4fOxRN5mij2sdTRMRZBCuF24DuCODyeVgUiz8nOYJVGlHofO11J7R3omBzwwgWCrmPi0ooCBEnU
 YBkrH841Unj15mq9Igw==
X-Proofpoint-GUID: u0qhJSpG13CulMabrnqHGyv7drDyNrBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-119161-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B65D75B457



On 7/15/2026 11:35 AM, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 08:22:48PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>> wired to the SoC and do not always have an in-tree codec driver to manage
>> their clocks. For these designs, clock line enablement must be driven
>> from the platform side, and this series provides the necessary support
>> for that.
>>
>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>> introduces the required device tree binding support to represent and
>> vote for these clocks from the kernel.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..b37c62ccd 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,82 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9a-f]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        maxItems: 2
>> +        description: MI2S clocks (mclk, bclk and/or eclk).
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +    allOf:
>> +      - oneOf:
>> +          - properties:
> 
> Please don't do such stuff. Did you find it somewhere? If yes, then
> where - so we can remove it?
> 

It was not copied from another binding.

It was my attempt to model the valid clock combinations.

> I gave you the close-to-exact syntax I expect. It was nothing like this.

clocks:
   minItems: 1
   maxItems: 3


clock-names:
   minItems: 1
   maxItems: 3
   items:
     enum:
       - mclk
       - bclk
       - eclk

The enum version does not enforce the positional relationship between 
clocks and clock-names,

which is why I tried the oneOf approach.

My concern with the suggested syntax is that mclk is not mandatory for 
all platforms.

For example, HAWI only requires bclk and does not use mclk, so requiring 
mclk as the first clock-name would reject valid DTs.

Is there a preferred binding pattern for expressing optional mclk while 
still preserving the positional mapping between clocks and clock-names?

can you please suggest better approach to fix this if any.

Thanks & regards,
Rafi

> 
> Best regards,
> Krzysztof
> 


