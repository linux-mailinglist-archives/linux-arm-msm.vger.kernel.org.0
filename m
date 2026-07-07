Return-Path: <linux-arm-msm+bounces-117377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eHIXJcI8TWrjxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:52:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEE71E6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:52:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f6LrBzlh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A3y9WaSb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117377-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117377-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4444304AA0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 17:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE8243C7C3;
	Tue,  7 Jul 2026 17:47:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1F43B6D1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 17:47:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446471; cv=none; b=sQ7BoWgKOFryZaLyRRxz5NMr8a2VylH7iLuOqqjtqhnRabNpqivx2j0Xpz6SKLh+GwiSS9PfYYNuizsbgyid2JRAERTgI4puKLQCM+53s0Ry6z3uwQ6PZHhkvj9evthhAAnm7T5xmiXX4bK1F9m6xLQk4aVthbpk4LtvBgY3hgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446471; c=relaxed/simple;
	bh=Yn0LLie4tUhwqThdy02nhPDX9BncA9qg0j5VJlJG7oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7OzDoy6I8qbZjLZziml8ZpR2qHg6XxRllzlDzKzdfyzLJ3zU+5dNO9deh4fHkrBtbOWWCAIV2Jlpuvv9JQKRYSnmTJ3mUJjbD04Mza7Gh/dnpty/gJedqJRIRfubjki2j5g7LjmKmn981TReTNF/kEKdDFkZef9Ei8jxKlv91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6LrBzlh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3y9WaSb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTMoI011774
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=; b=f6LrBzlhge0U9Key
	bm5U5cGElrl7/Mi068JDzDjCSAYDyo6DyvPaiW9t+lb3CowHkre22e2I3z241R+0
	Zax++R9kfzawGPcQGDxlpkVA6gzXwZ73WrTfKMxyZNgH8SRZb9VmkdPD+rWpKSxg
	OabRqNkyxK+TAbeqgLWOgiAojtn5JAxdhT6Xl0DndQ+AKyHIbsdaUdkTC32up9Sz
	eKLGxG4umnvApJ8+yIMtUXq3P1l9309JObRWHE98cD7xYkVAhtvcj308X6b2++0f
	4g10zVX7NFek+MIBXoVWhItk1yum92Dm9VQ+xsI2CGsOwiTvwOmNEiYmQBes36D8
	oAby5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjarxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:47:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so11167783a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783446467; x=1784051267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=;
        b=A3y9WaSbf2ntnkAmx7J7NaHPdayD6IkXsKuc5vC1FuaTLHKXTS5GG5PPHmfBd6ptwF
         AmjB8/laqfeKt9tvNVQiplzxEV6BCmjJTG1TqhnMmkQ+ITlPK59QqLmJ6YGAnheQ1uCb
         1mIBBI7mOelzhewtqPmIh3ke52YXPKsOvvat9Uz7BV+Q0/QiMrG+Z0YpEpkr2gZk8iD4
         Wo6Tgz129FKEFkN3noPG4T+bxV4ExWa32Y3vmmfTjxWN0M56z6CUBA8I+z1yDswJf1YC
         nyA//EAqfci7sD5+AxgoDHUIX/CoD+rnVZXLCIQDbyW1kkBVHfiRLi7MJNX64VWm3sCx
         DPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446467; x=1784051267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=;
        b=YygQ12rtZcjXJ4DTgeW4O2FszQF0+ySsqUMh0l7AAthDGGzO7vdpnUxfYDfgvAZ345
         eEChHHh4ugZHAoKIYu1eSat3UlVEk4lHr7XddFL24BHRvVFRVaZ4xAkMTcI8E/aQFDHy
         G/gSVLmA21uH9+zJ/pjb3Qcwam2uUnJBNu/BwmOQdY/eucPpkGbazkcFkXNnMOZ457Oq
         lsD2ufuVgYG8QescEJAZRHo32xaCtFe9VkFI6ehjoSezqAk17IBU5TgzngSdM5mfwDvL
         JhZZ1PKE4a70eYBX+LsMs4j8YcvZm7ulwW2b++lRmRm1+mZ0FkXyxNv2ffYSO5+6bUkq
         r7xQ==
X-Forwarded-Encrypted: i=1; AHgh+RogK/J9lqhygdvsp3WWipv8RE9RoZDKA3rr++ZZS7paur/S/XGoKpTYrE1F3sKgooRctXpFmTfLVOzq9zer@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXRPvhF4hs5uA/VmL5whNk/3S9WtAyNlhZ3dpH+f0SewKNVED
	0q0o7lM2EfeflBQNlmL/j0Zia56g0Ep3oeDlffjyrDC9Oww+N3iKNL/5qq8YrskTBts/vPJoOem
	tvvs5e20m3mBDkQym7j+nEUTZhgvmSrVmDrZlhu/jJ/ktlQ6hLPRUf9xvH4zmXTWXVNKP
X-Gm-Gg: AfdE7cnCc7iYNgqCCcMk374LkSwGry3c+mm3qQeQf24JFda1VHs1D7seK0PKyR/g3k2
	pcdJZtNb75XDBf3D3eUADVztADQF9DzBu5VC140TiIKE7Oe1ZD7//C8g/5J5NTAvd7gMQB+iUon
	oxSs8wkK6pWF11J8fBAl0WCYJKshSg4RjJIKdVUjOon7+0bedh+d6FO+/nPXKshBanu2H1P1oSF
	PqXsKk1qkzI7o/1w3d4ziY+Vs7QwzhcPrINcIWBsff3pO+0xIvQbSYDSfc9iz7CCuS64GexgdrY
	IYsMRPyFqC5HrfI35tV0lhRImI07Cc3/B9eBDswSL7A7M9OR/f8+YcT5r1tw7I+cKj9BwbKRzPQ
	PCmbDwcYzhnLrwIePgxyhC4VsPDgo7TPaYLaiO3TmT4R0zA==
X-Received: by 2002:a05:6a20:4311:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c08ece2de6mr6680694637.20.1783446467417;
        Tue, 07 Jul 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:4311:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c08ece2de6mr6680669637.20.1783446467012;
        Tue, 07 Jul 2026 10:47:47 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8bc08sm13979467eec.24.2026.07.07.10.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:47:46 -0700 (PDT)
Message-ID: <156c3c6e-72ac-4ad7-b489-6bbc9e99b279@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:17:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
 <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
 <9b45a805-79b4-4b9c-b5fc-d9b08a736a42@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <9b45a805-79b4-4b9c-b5fc-d9b08a736a42@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d3bc4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=FCd5T-TvBLVYlDZUGUwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: dRN3F5haHXA1zQug_m4bai92jpkluBvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3NSBTYWx0ZWRfX91klBp0+UHPO
 0N7UY8v4BWfXNSCGsG1ckGGBaFfdXFdiuCbSkaqoShfZox+O28yCq/WIfay3LcGJCpaAB13/Duf
 rCB3o5N6+0YYSoTjTEx/5iv5mdmh86cqPMLy0Ep9+FTvWEvbb1Xel/jBc+61ghUJUyOQaw4fH6B
 US8lHh8Z8Daea/U9SsEgvHbC5pVyqtbifpwmZg3JU0Ety0EzjEjiL43qfEmRNfHswkV3I3ezP2Z
 3iEFEcfZMUovTpq6szC3y6lYhHpcc9kVZMD82Jn7wE9CeXwwZze65Mr/CEcrGMDL9udFaJoe/Lc
 M+CmFJy94GV+iHVfher4eJfxjjLHx0dNpm7RzHgIQs/DLhiI9+q1FjhIwANjzfUrz7/lt8wM7PQ
 U1XJLtViyqwqbKd2MysvUb87NLk12/UpIgDU8ifrS4v60rcstg+4JfHHjV4WaGK752PHFnoIycE
 aBYAgeHMjzEqj7sjU+Q==
X-Proofpoint-ORIG-GUID: dRN3F5haHXA1zQug_m4bai92jpkluBvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3NSBTYWx0ZWRfXw7zvJBlSSSny
 0IRAMR6xX5jo3+qnCJ7ZWSsqcsCmrJjC2MlETdrPhXFwJMnMtpsOwaZ+cbeoAqw482/Xrd8Vva2
 Aqxc6/Ost0nEZFyENb4A+5f/7kV1k7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117377-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: EDEEE71E6BB


On 7/7/2026 7:10 PM, Krzysztof Kozlowski wrote:
> On 07/07/2026 15:13, Krzysztof Kozlowski wrote:
>> On 01/07/2026 15:59, Prasad Kumpatla wrote:
>>> +maintainers:
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
>>> +  audio interface, an I2C control interface, and a Class-H amplifier path for
>>> +  high efficiency, low output noise, and low idle power consumption.
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,wsa8855
>> This will need exception and I am in process of rewriting qcom-soc file.
>> I can include this one there.
> Sent here:
> 20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com
>
>
> BTW, one more note:
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Ack, will update in next patch.

Thanks,
Prasad

>
>
> Best regards,
> Krzysztof

