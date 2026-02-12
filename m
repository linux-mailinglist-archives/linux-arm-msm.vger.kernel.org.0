Return-Path: <linux-arm-msm+bounces-92655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NhPIbCejWmD5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:34:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9512BE53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDDA8303588E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0402C0F9C;
	Thu, 12 Feb 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJSK29ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDm82Z5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB993EBF36
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770888876; cv=none; b=UmVZx55mUvUg4dNsrytxk7mTDcFR2kitzfGRd2rf1YmbW6iSxj8uy9qffJA9XIUlh9MG07hC9OojK/oMlXg7YwrQw3wDTCxVYKI7q7OuwkTWFPB/+0Hm0fs3fB6WGj7pG3SqGZr7j6piS/XahK9fci0BfGZ+sLL2GmJSWAbP63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770888876; c=relaxed/simple;
	bh=JKzQsqvvn/QrxTtsk0soO0/RO9MrT9U+hDkfsocgx6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCN+AFmtUT+YcPltQfn2mc19BGhJgPhy+/v91PGkwQ4boTMgyKmDs+DY/ZBWBBbejWLobvvpzHxkEEtmwC8OwY6jrxWcRQENmY7fKOjcWPpERw29T6bm5SBqkZZxOT6hWvZXeNr962exATpcRdcLKRqeybxa535P8K49D/wfu5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJSK29ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDm82Z5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RfxI3143675
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=; b=ZJSK29juPjNW791o
	/gPZ8OUT2BeUeR5+UEGWQkRnGXjqRuvKuBo5HfMykS8+AolbXBcV8XTWyTclI1rF
	/d5mBO8IcpKrEbMhs/XNV+GjWeztj0J8wLDnp2CmxBIw0f+leCV/DZxws2SavqnP
	VgMGa+yX93KERvxFpDhilzqQg1az61wpPv3EA3hJPNnec3mcz+q6MRprGfs9DUmh
	ypw6gDf9PZAn+b4XYB1weesfgpKPB3iPavAGw9tjCQyO17HHyjZnjoYOxesZnzCY
	8Lbfdo1Jy9YeC+YGaIRhVT1jAlXWhWTvdlfEuuBX2lGsGtQdvr4AMOCHmilc46ao
	D/rEVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snhjgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:34:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so3692385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770888874; x=1771493674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=;
        b=aDm82Z5KdWcqfdpvD9NSId/Gq0d+UUUt8nR4Ut/4rj7sKpGcOa4myBWMUsRJlEKDdX
         vqrGvdTS1/gaqkSvTq1jLlWk+eJStYjl6xAirZ/+QHDD2XSOLY4dB9aj/gnsWlK5gjHo
         +YwJUPeB2btFBkqHljGrzmSdZqfmATmO6bvbixoVTUjf3N2KQr24dsT2kc1NgmTIZvGB
         7SnSMHyZwzubOeYcJ7D5ZSMRAi5PUl/nePqIlToPO+jdyVgiyWPGuJwZU/W5dtu2V5qH
         TLAK+NfudjyBfkSyC5+RUuczt99/U4qPRB98KWhhhb4OhSFAW0b02PG2cLGdvLvXoZQj
         D/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888874; x=1771493674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=;
        b=lEE8aB0Qb6znJU8XCnRFI8i+7wS2tqQ7lWl/CA8Tq4xGmNsl5E2aZkIrQzQgNSvrl4
         gkioiYQtLE3u89959s9uI+bBzD/ixMWZgSY440ari5i+hSDLHPTSyCYyuNxcrorlYtGe
         hx1YiXvEsAhdM4DA1wWMdOG/JgxwmWbhl5VxDIFafWk+BwaHhKn55GSD9epjd68alVTJ
         o0qM7wNrOXOuk6TClhdhJx9+px2uKG6+Zm6igDb2ga0YBGQCbKBYgWPuV1kJmOF3zxBM
         cpGmr+1QwuxvvqUjdCjoPYUJuj7+EO4rKfTw3dLYXBLtJUHi878kvZGJ+fWxJt/BjgUC
         tSkA==
X-Forwarded-Encrypted: i=1; AJvYcCX9mDuRl3PmQFXsCLJpNHFnSkJnN+8Pn4B46O5gT6uGz34wCS7SIIw9qVDitWWMoZFD8qnX67tcrBEMLRKe@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSvfvIxg7JjrgqOrJqLkA0LGVNGpSWbhBNshgwxzreRFWea5o
	6VvUmtIZ+HHrTwp/ib29LzQ5ESVpnDZHiKVD1uAdX6njXarKmssFhk7+b6C/pkEqta2sGKTNHVL
	T3amfjTnYTcSut12eGDhOAT7TEdeN8gMw15xhmZqKzAn4UJ+/qHLe1dF+HRxIsyZKRR58
X-Gm-Gg: AZuq6aJ3wUkEAXPZdDCnA5JXPs6ZG4G8es04f50V4PtgP5mUTYserwWy9bsTzd4syH9
	BGiWt9h2HTsS1dCAExeohelj7HddVh2Sl4IvcNfX6z6+Kl0LkbWbcagJqTKjRFPyL3PiQh7k+uZ
	LQyPMQIEGSTBU0iSKwR+s+7ypHr4k3Ard+ncmq6MXKCX9TXve5nBnor7yp4mDiwzcIkKvsdJX+7
	CAKZ5CbePDLwUpJWkOjNHWb47rfzG31QVVjkHka1Qltn+sFClJw3m4NQi7xJKIJWEjLfuQU85DK
	tMEYSyR4mVwFSCuLBwhdfbOSFznDq0k7FRmFLIPdDTJImi2yCTQyyiF6LljYjHL3m4IafDeKiqs
	MCZmKxctYrSQ7xU1dX/uLoH0OLlxByhsBKYLSh+GrpGJG3UVNLgxcEebUjn1rNzElOzhlfApTgz
	sno/Y=
X-Received: by 2002:a05:620a:1998:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cb33051c2cmr238190085a.1.1770888873833;
        Thu, 12 Feb 2026 01:34:33 -0800 (PST)
X-Received: by 2002:a05:620a:1998:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cb33051c2cmr238187085a.1.1770888873388;
        Thu, 12 Feb 2026 01:34:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38caasm1504713a12.17.2026.02.12.01.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:34:30 -0800 (PST)
Message-ID: <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2OSBTYWx0ZWRfXxXZRm/u7upNy
 1HwNUS1I69OIce496wcR6gRxKHRjkc07UqNo5BjB45jSg9RcRZ5xhsHiiMwz6wYtSriQllzjSx5
 3ncki1phn4CiD1Ds/DD5ByQIJYTM9fiNikVcaX+x+h8pgjBZtJ5N+ZajeuKDVRsSZRlbIUxeNX4
 OCjDjZx11IqCG3CRvW6pH4kBqxRmiVVbS8iFyoOpzX47HClxnDitemDAWs9L136+RWlVkTAo9It
 bIx5MtDjxkthS+BpghNDtK8jd4z0C8u5XlJaL5wkoynXhuqnZhAW0qM8LBf91iJfQhVDig5BcVH
 r2yGqNyY/NYIQD/hX3TEIMQo0aSh6/FcD0kXZqldAeqNVZIxxYb+irDG0loR74pEyKZ9TlSYv8l
 HpuP78ciGouo9bcfnll0ddPP151HQjGsiaBA5uA4ZxDWsYDcIXQTrPfpgqzQhrH3P8kLHer8qoN
 Qj/kQMEDDgpn9USVocg==
X-Proofpoint-ORIG-GUID: _VCseayF6R71ZHy3KZ6FWbk0kxPX7xJD
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698d9eaa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8 a=rzGM_l7p_Wc7VUtEW-UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: _VCseayF6R71ZHy3KZ6FWbk0kxPX7xJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-92655-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,mainlining.org:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDE9512BE53
X-Rspamd-Action: no action

On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> 
> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>
>>>> Add compatibles for sdm660-internal based soundcards.
>>> Why is it called "internal"?
>> Yeah... I am pretty sure there is no such sound card. You cannot have
>> sound card internal to the soc, because you need the external components
>> like codecs.
> 
> It comes mainly from downstream driver name [1].
> 
> Downstream also mentions it as int_codec [2].
> 
> There's also an sdm660-external sndcard [3].

It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
optionally WSA881x".

I also notice some details about a WCN slimbus channel (bt and FM radio?)
in the internal one.

Konrad

> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-internal.c
> 
> [2]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/arch/arm/boot/dts/qcom/msm-audio.dtsi#L835
> 
> [3]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-external.c
>> Best regards,
>> Krzysztof
> 

