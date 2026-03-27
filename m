Return-Path: <linux-arm-msm+bounces-100324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MQjG/6GxmlALQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:32:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28B34545E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2164B31A6437
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9229D3F0779;
	Fri, 27 Mar 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV6U7QGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+FvZna7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28163F0746
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617408; cv=none; b=qnygUV3hM0I6526N0WiQSSf9VJ/XH328RSGXFsSQNQ23ctTV7gKW8Rf2jHnMEtNfzlq3VE9ZjlzdIug5aShoP7Av8wqV2WnHLKfF610OylPU19EsPcpUae9CY9Yxc6VS8rPWJ3wCNdT4PLCy/2DshKyaLRRByt2/KPw+lLdapZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617408; c=relaxed/simple;
	bh=x/cmZSWCcD6wb9H0/VWP20ys4A9Qw+ipMcYqa/COYmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/VfV0wxpc4+5QXJHarnkRBnUhG3Xn3Ihy+yJhPvGlJFymb9N6NeDSdXhsBQoviVdU3HG+mhFZ+nw/Y87Xmq6vMCA/OZaZ5Y7WUWtUFnhNpXufcISU/ZDozOcah9X+pLkvzNv4U15sKQzIAUMJXC5Md46NR/MQzovBRfcVjjJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV6U7QGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+FvZna7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RD1eDw1860247
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=; b=JV6U7QGKfxN8Z0oc
	JbXrr5m43oD8HBXp27+nRKJElILyQsQQlM+eG4qTOptmumIPhniIbENNl6gNGMXI
	ULHl1JG/s0dwGeL70komvRNsEa1zezIoCCtTkIPnuDmEO2Aejn1EtYxdD3xhvXO5
	TwMYJrzr9pcNlD3vUE1/e7mUhxlGaTK1G2Tqp/WFsSgqcJ1SurJF8HPwXBVMyX42
	/kRvAuAs/aiUrJIskE8l07bAXwuDh7Hgg6zvPNNR6pw2gPXAVL90c/QFS9lygYAX
	tXPPR9HDSoxF3UmteqGmh/sQHSHYeLqxmrl2HtXpBOffmi84kX9Wa55BZUxlkAyC
	i73Q4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv3547-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c0f03b2a1so5744834a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617404; x=1775222204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=;
        b=M+FvZna7N8+kvIyZtBCwkSkDkDSkgaX44xOUdf96ddr1EWi7UDINkjcmiQjHW89lGv
         J3VMUaIMtIAKjWlpTp0HqkjgZriwFoEkF9QkuEkemHwHuOZUpViGdssjy0hp5K3rK4iM
         JxaiOl0tynWjBdUaSskwFzE/bZSKpHRLsIpXoZCwvSxbizBgDqEtc9+qAZ1fU1Csyjbe
         MAghpDJE7H/VGOJBtdXar1IWekAbZBmEj3jceTaVU0ETcbOD7ln4c0bO2JRELwpabrdT
         qdxL+s54eWBWhUs17RCDYjh7QsbqIfZQR86lOrczdXRsCzVqWOFsPxqLzm1suLBrbc8A
         ICBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617404; x=1775222204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=;
        b=ev4z0Ukbv69n95aV2rxGmBYRC77KOb8xlWaLIgtLgR7HnvIoJa3pC2PxqnPIOL9ih3
         ppe+/2O2FkF3D56LogOGINO8F+yAvBKSaZEedsIAkd3PvxeHLCzrii29OHV3xancmgsv
         5ptM/cwfKtYVp854+AIqGWVY8Jg8hZ/jph8MnPly7Kxejaij3k8pBXPzOTziYOkFqu6+
         /md0ATihoEvMStj7iC7g43Wf62nRDx7b/LAWxiikDr89XJ6pcxUsXeNW3PaC7QrhFVJ2
         Ksyc8X8URPLpbptF0p9R9jzQPHEJ/0D4I3jXk5nfO7hYoCh/Y+YsEqtqbMogdMzokEUf
         b+0g==
X-Forwarded-Encrypted: i=1; AJvYcCWuWDRrXY+/MG3nu8cjy8ne9/mY1fEQBYfYER2MPIv2pHbavfyrBacnjiEtARVcOSriJ7HV3XXb5I7V9LQH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9cmHA73Fbo2WYfR7veQJ98G6s17sMELOcwWPK4PeuWDWrlgy7
	Ue5B2StnyZq8BDQ/Fs1SOvGBEydKSLehSB4lyjHdx9t3PxHEGgp4LtlUyRzFW/JxwFnGmt/9DIq
	uRKqVpr2Acj8dxMryYLWeD7HcWEBmhoOyeknvSwkwakRZgNYrjbyOd6IS7oAI56Jzk7xM
X-Gm-Gg: ATEYQzxrQ7gBI06ZeHYmYz592s3xdNvnfpMlzQbojkyuQ8eXMCFe9TQpyFuRAOpgcIf
	XgAuV1LrorAfQ32GMQEvIa/NrjKKgKjNuah+YGgKQEvKDnuG+a/Z0rS4JBXLm1eaSFYQsDRQ7DG
	7lOy2QDF5fxjFEhY68bzuTpJL8lXNPjGUwCa1zLYfieVyuQDkaYt+a8/piJLrKecSvivlcsxO0d
	suoT2loB6tnkUWmutQBWIkfbDnHkaejJdrymwp6oPoDJxGDp/GFGf41/xrabxCLrUJS6hENZE39
	BPxrPzKyZ0Jm8QT+BqRz7b0F25pSXBOFZv7OuGRgCWNbBGFdBfDwFLDWd4RfL9mF36RDW3FG3p5
	u6wOhKUPYM1iMXiiXH7JnmA2yuNAoXKuzOHRMSvNb/3UhvIPzySfR4GZgQKc=
X-Received: by 2002:a05:6300:210c:b0:366:2447:6778 with SMTP id adf61e73a8af0-39c87b7a637mr2713695637.53.1774617404453;
        Fri, 27 Mar 2026 06:16:44 -0700 (PDT)
X-Received: by 2002:a05:6300:210c:b0:366:2447:6778 with SMTP id adf61e73a8af0-39c87b7a637mr2713635637.53.1774617403804;
        Fri, 27 Mar 2026 06:16:43 -0700 (PDT)
Received: from [192.168.1.5] ([171.61.245.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739311d1sm4796243a12.15.2026.03.27.06.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:16:43 -0700 (PDT)
Message-ID: <2e03441e-4353-4927-8630-aa7730c4033e@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:46:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260310-crazy-screeching-angelfish-297bab@quoll>
 <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
 <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
 <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
 <376ad62e-e6b5-438b-a23a-0988b6489e5c@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <376ad62e-e6b5-438b-a23a-0988b6489e5c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6833d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=uQpbphyD5Ctod2HTVTDBmw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4GqzFmwoONYO7NBBVQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: mTGs36b_4NG3x9aID4nYIRHr2qwkSotx
X-Proofpoint-GUID: mTGs36b_4NG3x9aID4nYIRHr2qwkSotx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5MSBTYWx0ZWRfXwHlsi92R8gu1
 py4fvK274zZ/kQqbNvOCc8Mhxi6nmCq4aq1rpSEELf1585NnPxSOPlw3HjlCOM6xyozUOHOt8Uc
 w7m/gd2v5wErBJBBnGLSBwuyDL0EKq4a+27YaxZVlhw+Vn1u/6QEDtV+WfNnq+h1+nK7066nfF7
 empgG9LD+EyFaHBDPXlJyH7pIpzBxUYO7P8h5KPWdaegsXPlAI/9oFrbmA18ZzVLAg+IEcA6Rha
 VlMKip50uh/8nReAxXMy9QOtBOtr/I74EtMwV/IcLjrM2GFgtahxloV293IwTJyhwLWMbyASzqM
 s1tbFlPo9uDhLd5NvP7ctki1qAsvSQfBqwRnnt6nIvugAco5QzbykWDH4EJKEECQqqgcKxtDWH7
 gGEDv5Ep47nBZnFjuLpkKGVMuyJehA8HxazRNmtKRMVKPSf9+LN1g/Sr44Ql/x5HEfhnKssL6wE
 LR5oaebERuseTQhk/nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100324-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC28B34545E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 3:40 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 10:57, Mohammad Rafi Shaik wrote:
>>
>>
>> On 3/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
>>> On 17/03/2026 06:27, Mohammad Rafi Shaik wrote:
>>>>
>>>>
>>>> On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>>>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>>>
>>>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>>>
>>>>>> Qualcomm platforms like talos integrate third-party audio codecs or use
>>>>>> different external audio paths. These designs often require additional
>>>>>> configuration such as explicit MI2S MCLK settings for audio to work.
>>>>>>
>>>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>>>>>     1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> index 2fb95544d..1d770cbcb 100644
>>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> @@ -21,6 +21,34 @@ properties:
>>>>>>       '#sound-dai-cells':
>>>>>>         const: 1
>>>>>>     
>>>>>> +  '#address-cells':
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 0
>>>>>> +
>>>>>> +# Digital Audio Interfaces
>>>>>> +patternProperties:
>>>>>> +  '^dai@[0-9]+$':
>>>>>> +    type: object
>>>>>> +    description:
>>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        description:
>>>>>> +          Digital Audio Interface ID
>>>>>> +
>>>>>> +      clocks:
>>>>>> +        minItems: 1
>>>>>> +        maxItems: 3
>>>>>> +
>>>>>> +      clock-names:
>>>>>> +        minItems: 1
>>>>>> +        maxItems: 3
>>>>>
>>>>> No, this is just way too generic. There is no such syntax in the kernel
>>>>> and this should stop you right there. You are not allowed to add your
>>>>> own style.
>>>>>
>>>>> I don't think DAI is here a separate device needing its own resources
>>>>> expressed in DT. This is still part of ADSP so you just described in DT
>>>>> internal routing between two services on ADSP.
>>>>>
>>>>
>>>> Thanks for reviewing.
>>>>
>>>> I’d like to clarify that this is not intended to model the DAI as a
>>>> separate physical device or to describe internal ADSP routing.
>>>
>>> If you do not want to represent the physical device, then I don't think
>>> it should be represented at all.
>>>
>>>>
>>>> Requirement is to allow the kernel to send clock‑voting requests to the
>>>> ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the
>>>> kernel must explicitly request the ADSP to enable the relevant LPASS
>>>> MCLKs, which is a real hardware control requirement.
>>>>
>>>> These clocks are LPASS‑owned, and driving them via a third‑party codec
>>>> is not appropriate. The intent of adding clock capabilities at the DAI
>>>> level is to allow the kernel to associate LPASS clock votes with a
>>>> specific DAI instance during stream activity.
>>>>
>>>> While the DAI itself is not a physical device, some DT representation is
>>>> required to describe per‑DAI LPASS clock requirements.
>>>
>>> DT's purpose is not to describe software constructs, thus DT is not the
>>> answer to your requirement of mapping clocks to specific DAI needs.
>>> Every person adding software properties made "some DT representation is
>>> required" claim.
>>>
>>>>
>>>> I’m open to considering alternative representations, but removing this
>>>> entirely would leave no generic way for the kernel to handle correct
>>>> LPASS MCLK voting.
>>>
>>> I imagine that, since this is software construct, the software knows
>>> which DAI needs which clock. Clocks are strictly defined, thus driver
>>> should handle all this.
>>>
>>
>> No, the MCLK connection is not fixed to a specific DAI.
>>
>> The LPASS MCLKs
>> LPASS_CLK_ID_MCLK_1 … LPASS_CLK_ID_MCLK_5
>>
>> are hard‑wired connection, each physically routed to an external codec
>> on the board.
>>
>> Because of this, the clock that must be voted depends purely on the
>> hardware wiring, not on which DAI (Primary/Secondary/Tertiary/Quaternary
>> MI2S) is used.
> 
> If they are routed to external codecs, then they are already present in
> these nodes and duplicating them here is not necessary.
> 
>>
>> In other words, DAI ↔ MCLK is not a fixed mapping.
>>
>> Examples:
>> On Talos‑EVK, the speaker is connected via Primary MI2S, but the
>> corresponding MCLK line wired to the codec is LPASS_CLK_ID_MCLK_2.
>>
>> On Kodiak, the customer connected an SGTL5000 codec via Quaternary MI2S,
>> yet the required MCLK is still LPASS_CLK_ID_MCLK_2.
>>
>> Instead, the kernel must vote for the MCLK that is physically connected
>> to the external codec on that specific board.
> 
> No, the external codec driver must vote for that MCLK.
> 

I agree that when the MCLK provider is external, it is appropriate for 
the codec driver to manage that clock. However, in this case the MCLK 
provider is the LPASS/DSP subsystem itself, and the external codec is 
only a consumer.

LPASS MCLKs configurations inside the DSP can be lost or reprogrammed 
during DSP power collapse or subsystem restart (SSR).

Without visibility into LPASS lifecycle(SSR) events, a third‑party codec 
driver cannot reliably perform clock voting or restoration, resulting in 
broken or inconsistent audio behavior.

For these reasons, MCLK voting needs to remain owned by the LPASS/HLOS 
drivers, which have awareness of DSP power state and board wiring,

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof


