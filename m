Return-Path: <linux-arm-msm+bounces-117376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IKRnHjE8TWrUxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF171E69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:49:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KshfqSeQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GvzeKAkO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 528A3307A293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 17:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED92443C7CD;
	Tue,  7 Jul 2026 17:46:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25243C7B2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 17:46:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446381; cv=none; b=K8JYcM//ads8Cf11JNERKywV17j0lRC/f+uwHRbFnP0a531RKPvvWvapAwZcw7ijI7FVwfBNXvMbOusH3ecgSX4mai0qVfiC+Fozlz67MVE1FHut5svHA71hop1hKRxScf7MgiaZmxsZNQgX18ScyE/SGvIYH/Yr8tPPBBSAJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446381; c=relaxed/simple;
	bh=UJHy+4fNGIppWeJZqbXwBUa9YncdTApJbIpjCz18jrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EauOy+gMfxvACE0XMtomOFe/l0XTo3QGfqd++EsSpiWBpz7CQ0fgY/fSJI4hRUMQIadUCWpnK58TapFwUjYrbMip/qivJuJ2Gli/09/0vmC8oa7UeGh1OF2JUO/7Dj1B+ef9luldZ83550x1mSoU4d6IHwvwcr6BTMqv6hc2aKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KshfqSeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvzeKAkO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT8vC002269
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 17:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=; b=KshfqSeQT5t06b4u
	tRJfl9ugoF/wayAl611H2E9RzC74isPR2tlslDgyDSJFI5uOtZ9logHHQtcWo7Ef
	g/cdv7DDMln63b06YUHcYaIqPWuD2A1lXln6PTjL4ixBjCGWFEqYtYY61cTw5VT3
	47A2RGTRcBQzEdiVA4d73mnTGQF1hyT0y9viSRj0PdKnt7i6f+ZMh+QwmPf/BG5Z
	uqYaJSDC1ooRbZ7bTVUUTJDYI0DUhWvkKrUheywJl7HLNKcH7+23IKUEOn2Ojdtx
	/yo7jdSEFHOtlu239e3o/1lGLLFK2x1d1Ra1vMOInIHU8E+eCAZhvDUuuKmpS2lH
	Y74JsA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0hy68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:46:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso3721168a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783446379; x=1784051179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=GvzeKAkO1+QqGyCfwsJiDtOBjc9CSFbqBlXOo7G1Sq4Obg2dFC13SO4Zzu6rD+gwKI
         khWaApus0SsBYv8nyqwe1ltmSeJQ440j2xwEY6PXTScYRdI6qV22nr/VbhN490dSP0nB
         f4awLOdAUsz+FRiXlWdA+UpnSOYgtbvKvoCisaCcwP0zlyJPTiWgUlZOr16Mxo8ExWv+
         3Q4TE8/CwwP2LNHIbs/8A25SUHiXC2VzwRg5XWdY3wA00PCe1liSrmxlOMWWRd7WwpVV
         +cB8eqi000re5rJrJXSahDAfP/u/nbezidOwcVTUnYHcoGA+nV+xNIVXoOxbC6OnbC1K
         t+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446379; x=1784051179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=HIRRxZiG2A6Lql/naPv3aPUDxACqy9QNzh2ngf3dYpUKCWkWm8Jnyzzid3r2dYVIFt
         AvtUe52l5zesd1Ak9oRmuytGn75OFcPqMzOLzWuCghOY1m2wOeBWybopQlJ5PdpVAkBA
         zy5MYp+W3+xfr+qJR7eriwc4dQRHG9mNHVn+IF+qZzCowVCQ2OgLjhHQRq0tnUxHxDuw
         7L0uXzxEa35Q2bxbFcYSNPh6tmfxp6xv54ZBFWeVTcpiws98AIZKFud9jKiPl12QQhTg
         7FOK2kHw7EfCqyhw13hmde9PanCBsKStI8hVGdRqi7SuHtGSrcOsgFk3ddvPIyMY35pv
         3MOw==
X-Forwarded-Encrypted: i=1; AHgh+RooIfS4ZE840j1F1rlZ9edB3xXSGV/KU5ZO7NngRq57xMj74AYpWc8+bBZmWfinHcz/djB3yPufBeXxcMEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqFhp3MjTpWzQLGNdLWrkIVxF2+cCMrHjg2FMz9ZaVd/IgDm6
	afr1vgbwMdN1xoZs0GzBL25So9fL83/QEa2xDcwnX07vZExuPypw9BSIcn4aQm38CpsNyLFi2/O
	47fG+6HMoqGfyIRV6689wOSFSPDL/YTyEpGhmgETz3RQ0Lx6ZTJ+tyVmnGrXugGQLYfe7
X-Gm-Gg: AfdE7ckVZ2qtjWk0j6UWMoc9uUCNh+llV58ua+uSMCGsLw2TFD6Vh0P11l0IAuvMlvu
	p9zBZ6+y3StYqh1Yua52bht/tvYT/eqrMOoulCU3LkgXHdKaaOALzfUUgEn/ZkEicj8+eJOstNG
	j6Hg+aulV7NGrm0wdu7eS/2PzGHs5Q0c0/LHSeKXKwYO/AKUFurfuoRdhp9bUfi1jt4vGWchbba
	TaR6dULZzKvXeiW1Z632ao1ivbbzzvInHhkch60yntYjyTq/+rwJPPZS4Si48JfEdi+DZrbvlhv
	So872c/RqaMES7mg34Cxuj8QVmKn/Ihc3PtnodzMy+pYB3WCdyKvcxhXEtDr+sneGLvF3f+e2rQ
	5kKVH1bf8YPEoq9JHJWsURTexDhRhYx7/BbrYY8pQOO7TRg==
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6971997637.20.1783446379005;
        Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6971968637.20.1783446378509;
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm16062585c88.14.2026.07.07.10.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Message-ID: <921ef440-ff39-4c0f-a258-f9fa95876226@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:16:12 +0530
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
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2-qEbMVZBMX_zWwDaHtuZsnzVdFmn9w3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfX6tu/8jVHu87K
 iO5JksDa+AsA8DPeYYEZlrm7oXBEqAooG5h3dbklfeHNTpqdyTl6e3G3Geu8dY8PspzTpewkLgq
 94sGUEJSzaRa+zXVEELDPhwSTPbVUKc=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d3b6b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=364ozoyseeM246Uf7v8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 2-qEbMVZBMX_zWwDaHtuZsnzVdFmn9w3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfXymA0sot0iSa9
 4n/MdSc3Mtj2IHWMOTg8lxzcYXrg2ZMsaVx+YKha8W5KZLoS4F4R9pPpajMzVVkvFrxKfakhG0/
 bkILivZHD9JRXPxkuiqUOjlHhjlCoXJLnZZ5yW3+rbz6i/2dAt+JpAk4iegGlnQtIzBdp7kepGC
 GT94J6BhQCweAE6nMAF9RK+PED8wFPvHVrM/jCg35Sewfcs60Ke+h5sOP6PqSMy1eDFNv/Bt8T9
 7YZlMd2GqQIiAW1Hf5GnBCPhayjCTlLfu3zNR+1iQgcD6ubQb7iJo+8aspvQHTRGSyYrEd5TtmH
 REm1a6KY/odzrJ0Bms94bD1k75DTNPRMAQOuqCClcK/CBiKeOuSKFqSIILkcfNr30kK3Hx4NAFk
 7/xD2f5qfMf8Pzt+chTykH5aUkbUEKE4VjHI5P6BM+4Sd7HSSFhhniFsmZ1FsrqN5MZclC3X5Ui
 geGx/rV0GmavCkFXa2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117376-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D4CF171E69C


On 7/7/2026 6:43 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:59, Prasad Kumpatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
>> +  audio interface, an I2C control interface, and a Class-H amplifier path for
>> +  high efficiency, low output noise, and low idle power consumption.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa8855
> This will need exception and I am in process of rewriting qcom-soc file.
> I can include this one there.
Sure.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
> So the pin will never be shared? Are you sure? This is discouraged and
> it looks like you upstream old code.

Right now, we have only one WSA8855 attached to Hawi and Shikra. A 
shared pin code would be a nice addition.

I’ll include it in the next version.

Thanks,
Prasad

>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof

