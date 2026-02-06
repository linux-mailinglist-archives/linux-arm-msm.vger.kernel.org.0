Return-Path: <linux-arm-msm+bounces-92002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMRMLva8hWmpFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:05:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13203FC6DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D730304602E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37223612EC;
	Fri,  6 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azAZqXR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGjGzg+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639130F52A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372135; cv=none; b=WoWopKrIRvVmksfhjEc6KQgviOeh13+1XLiQt328+1OW/tNHfK3M7nMLzoiEdvjeBq+/Lv9VCRGijjsGG3UusKbhuc6liy2Y9v4fF9PXMq6Hk9d/OjU56RT7VVkjFg40ZcxBgWqlaaIadLi6uLF3JJ4lXi266vPFHoNdpmQrBsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372135; c=relaxed/simple;
	bh=i1sNXNPVMosYuGD8AAGDq7TJNCYr0jvjHq4JfafYQ20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax1/CAoaCi2sLxRj0oj1pn3pM0DZbdLWdAqshutgOO4pRs4urkRmx4hrswgijW37ClEcieG1Pzt6yqCxyC5adBhmJmK8ARE4om8O08JlA4rzkXWhjkSkbFh5rtBWSNnkxw0I0LKarO0i9vGQKPY7RrX0zzAGH8sR+6KmOGVtQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azAZqXR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGjGzg+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168h2d3694780
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=; b=azAZqXR98t0B5LMK
	aRJ21DVvBj6Vy8Jl0LFCV076NSyEdVASRIYW2r3qxgABmho7yI3Mk/VS7CG2BrSj
	NFgNw4aHfvJQtcmWg/ATAHHV6FNWq/fX1q9FobH+IgZ5w95ZGqXXCNO2efKTVEH9
	2gAT/+5VwGEXmVA3QmdfhIJq/VYaKeu71/9uvkG0LQPEEH2bSiaGBjSOzSGo1SgQ
	s9/3v+1qayoQAk3ctnLAofgl9ywSIQ1irgNNO0GWKINApJqCZpRealrQCb0uznui
	UiJZYEUTMJba4BBv/il58K/OSxiNjpJSSMLTYHDfxWq25zMycaoOb4xKTfm3fWO9
	qGo4uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qva2ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:02:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so680141785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770372134; x=1770976934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=;
        b=aGjGzg+zFFzko6BFVFtiwnvcDxHydfElLAJh/+8Ig3H4MN56l2yTy6hunCa4KvLna2
         U5AaKTVZshrjf3nVdkwaXWVyXz9d2AJqKFaWTpr0CkKrvu+CHGj0JGwAFKqUneasBvMg
         giJ/2jx/7ro2JPZtU/7wntLBLsUiZS9cbgRQwxZjCKA2ecmNWYP5XKhtdFgDse2vcPrJ
         0/E/uQyisghfk6A31bqjZUSKqgKKOwybiDc4eZ8vTauEYKBq4ENsbUojzw1uPhP4zmAu
         7BMQM6Gwa0OHk1Akef2wkuqrbwlNhcKtuBgniJTjjz8DteunYNRmM5sJdMJ7AHzS2bMK
         wWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372134; x=1770976934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDHuUROVLA849sayomHF4y/80YyzohWdoaGg7+6EwmQ=;
        b=YRIrWhvb+kb9O2NevRU+BVEOJLvPj70w/OwfoUEYtyV7NMD3sBH4UbyB6SWX0f3jY7
         xVx9IsEEgCSVkKIx41/U037ads+xgftOjT+TUwByP5mg5dgq7zXw8MyGtlMImbvKa3L5
         +eTJNqnsOkWxWpvalFNP41lUjB3aa++PIKlbwzIM5zyw6orTuAV2CLH7JXyMELiRQxLG
         dNdZvCEfjbv1uTJXJuOzwVdQi8Mc6WJvN3DbMLwOJ9qV0yVVuMeFvk+FbUi0Q0y4ypV4
         WlEpaYLrPZtjEOOq613W8FxP+AJr+CW90HlLyv1cvhtnoRE4d89tMPxDDfea3e1IT7Fd
         dGlg==
X-Forwarded-Encrypted: i=1; AJvYcCWK25F928hg8Rmgu6UWgMNXWrIafpm8eTfu4Q9bzjShAy5apK3BSdhSMlrI7Wu8ws61A3B4tE7YC0bM7Nce@vger.kernel.org
X-Gm-Message-State: AOJu0YyBI1ghbQAWkB+PSBO8BaTK/56u+N0ACgxkUfOAX9kELWZ1+ntA
	kgAxJaGTwvS6s0O0NxC6WRzZKW9y1hvkLGtN0a39fCg9YwnwH9opSWk8LE15lH0xq/Pq0aPXl89
	PGhEHnk6j9MsjN7To4yrjATM7dK7y5OPzgIVYZ+d1IpkUThOOvl5m7vItxNjEkOXX+57t
X-Gm-Gg: AZuq6aJSqxV/mfruuMtrW5YjQA2chdp0nhHfvkkdjfNLNfKl4415+t5VvjBo2EBdjjV
	P/+g5BiS1DwvgvH4F1lzkXsQI/iYLM1rOIOVXcKHmTOuwp48qTykutuPRtDsHbpNaGpTCAdJgla
	Ow/sZs5qdGNKIpjCEgeigSAyDtnUJu/+ZGiBEWj3JUs2TfpKae3/VvU+WX1k7MPvDywoTkZaQD8
	tewcXGJs22jcJuK5J0sNDgFvvVqRgbM8i+9mGA40YVoaYW0Ghvhj/dHyrxwiACYRq7mjXeHfzJo
	VulfjwhEoYs+r/BN0a0gXh6cWnvgCh70V/qh1NKQLfumdMCIrtLVECWpn7a6R6VhoNtkf7eWqHY
	Iys317pkucwLju9MJEi5ViXwsycE9N+gDKhaeDdZY4VfDxW1Q
X-Received: by 2002:a05:620a:190e:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8caf17e48b3mr240223485a.73.1770372133649;
        Fri, 06 Feb 2026 02:02:13 -0800 (PST)
X-Received: by 2002:a05:620a:190e:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8caf17e48b3mr240220285a.73.1770372133249;
        Fri, 06 Feb 2026 02:02:13 -0800 (PST)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483206b8ebbsm62560865e9.1.2026.02.06.02.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:02:12 -0800 (PST)
Message-ID: <8f61563d-8875-4aaa-b94f-1866454367aa@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 05:02:11 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] ASoC: qcom: q6dsp: add support for LPASS LPI MI2S
 dais
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
 <20260206-petite-tireless-iguana-addf9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260206-petite-tireless-iguana-addf9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=6985bc26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=M8LtWt04ibze1OfZ8MQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4bg-_5Brga4B4H80-YjZ5ckUabZRmsGB
X-Proofpoint-GUID: 4bg-_5Brga4B4H80-YjZ5ckUabZRmsGB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NyBTYWx0ZWRfXyfjn3B4tVkW8
 qncuEcIRLkmDMEfg3m6eV4lFDQ9pE2FHj6fIrOpm3773LLRGgygiJWmsb0wcA8Dc9SoKmOL3Gpi
 r7E8pU1lEU0LjWUF/Ha3Yvs5+Hp5TiMSbuc1eb2bgvuck117X2fQ1QUiybtogRMDu4pwCUATgOd
 05qyVYwd3sw6vSGI3AlAVsiDe9nULy/UmsLTxFEIOmPlEyAjTSU80GFOfGTenB0tUJ3Oxuv+wfj
 N+S+7ZlR2HoS3/c5VxogriJZQUmXMtLhGOxj8rbFm7nD6HBGBlo+EBXWaoPX07BOtu3Zquog4xn
 XwC/wwM5Nt+QdpH9xNeWP0WFb8l+zDTZjSNbVSWnHsfzt3UAr8hF0mWD05TVMpQfB/sku4yleQ1
 T0RXmnAAOemSMhWCQuiB3Xa3MvkDvpPQxSIMA0kVxgsI4kw/aldbD3pWHzeFixRJ+t54wmloS9U
 7njAuuIkTXwKa8ntN+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92002-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13203FC6DD
X-Rspamd-Action: no action

On 2/6/26 3:00 AM, Krzysztof Kozlowski wrote:
> On Thu, Feb 05, 2026 at 12:14:06PM -0500, Srinivas Kandagatla wrote:
>> Add new dai ids and dai driver entries ior LPASS LPI MI2S lines
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../sound/qcom,q6dsp-lpass-ports.h            | 12 ++++-
>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 47 +++++++++++++++++++
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
> 
> It's impossible to reply via korg - wrong address of Conor...
> 
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 609bc278f726..0febc641f351 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -140,7 +140,17 @@
>>  #define DISPLAY_PORT_RX_6	134
>>  #define DISPLAY_PORT_RX_7	135
>>  #define USB_RX			136
>> -#define LPASS_MAX_PORT		(USB_RX + 1)
>> +#define	LPI_MI2S_RX_0		137
> 
> Odd indentation appeared.
> 

>> +#define	LPI_MI2S_TX_0		138
>> +#define	LPI_MI2S_RX_1		139
>> +#define	LPI_MI2S_TX_1		140
>> +#define	LPI_MI2S_RX_2		141
>> +#define	LPI_MI2S_TX_2		142
>> +#define	LPI_MI2S_RX_3		143
>> +#define	LPI_MI2S_TX_3		144
>> +#define	LPI_MI2S_RX_4		145
>> +#define	LPI_MI2S_TX_4		146
>> +#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
> 
> Confusing change or actual proof that my previous comments for similar
> patch are valid:
> 1. not a binding> or
> 2. you cannot change this, because you break ABI.
> Choose only one from these options.
Is this because the max port keeps changing?, I can try to see how this
can be dealt within the drivers in next version without adding
LPASS_MAX_PORT to bindings.

--srini
> 
> Drop.
> 
> Best regards,
> Krzysztof
> 


