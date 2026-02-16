Return-Path: <linux-arm-msm+bounces-92917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IT7Ak33kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:54:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2A142890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F326C30011A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E655301708;
	Mon, 16 Feb 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOo2vy07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxUaXkA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C53016E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239237; cv=none; b=tU+gBiTUP1c+wb4TMBJS7BcHu9r2jBJuspNzTffQWnAt7zjs02gsFfGBwW/HXsJjR23FyjFAkWU1LVI41YUChCRTmjCk9HUyrr4go+wSk5LwdQ4XdTTYqH37BMpdxF+GwJDM57RPzD6UlBQlIqM0t67E5cqqAFVhqLucYuZv8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239237; c=relaxed/simple;
	bh=UlEkGTGIllzJjcj1vpPZqPHwtWge5pHUmyyG9E18Cyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtfWPAMEOAWT2BZ4Nqk5DTndFxIZ2U7WfaIMXjauuyrTqbnwO37U6uXMOcYFrdaOx05faKKfJocCmNM3O/P1pDcl5exJ0pOxAl1e38yp2n5P0hptqobpmsEhoiMhOa8508q0J0CsmSnz0qOFXhBdr3ukdLD0l/XPHHp2M16xybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOo2vy07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxUaXkA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0xDZI3331335
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=; b=IOo2vy07XhtQLrRE
	aDejHiZeE5MkVyoqbqTtOcsFcOwtmJBoPI6r1hCCOBcX+Vr9VMZbmPM0vUfHZy4D
	YTLXtzpr5ZxpWG/ShRsdiYhqYMwgm/k9Tr4nBAnkTQjrtzw8cdu1+9uJQMe4Rzns
	BPDVM92CF9iBECU2G8Eq/l6FErz/Ba8w64fovridvk9FLH2UVOlli3ygHegZmkxM
	7RYZtxVxA9PlnXXeTTSYDjRsDY7JJEYl+S8mh4Kxf8HO2TUWTM1ejUdD+sps18ek
	c2Ye/3QLKBdCbesuweIMEQwPgO1B9mAa7hy2Ga1kuso3O8E8VK3lR9Y8GkHQtite
	v7mcHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sm9ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:53:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5064fbe2babso22257891cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239235; x=1771844035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=;
        b=BxUaXkA9Jx7kj1CJ9wRoefVhWON/AqdVbSf7lUNVu4bF4Nb5UAyLp1My1xJ8RmmRCv
         FDadVBNghuFg5Stp26ZoDcLzsHw+NpAeOBOy3cFYGfXGd7A7pPwY8RLf2I3k91q91itp
         Dh5b6BgHba/HiMD7QW+to0vm7xzsNXXtP9FL/14gqF9QVDnjKscq4TNJAuoP7DP4Gnm6
         /H6canaPBoZJDvTKSLagycUilsXRzY3WOS7BR9vagPK3QTnkCz8tBh26zZkzUhVqIWZd
         MX3UZyqot07UZptPqTB+GgxxXCOz34Y+jb41rYURDPqst2w4Tb8FJCW3MM0KmgxjhtFN
         1lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239235; x=1771844035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=;
        b=gi85m1deOj64GCVHVT8Cm9DqXAtCL5iRQFfvva1fElvfpqG22+C/rM6dPgzduBMDgg
         8d6Kcx5czbHLIrwnQgDfvmeimUhyMyiXdz6w+a3kQB0gk8h/5Y5ekTTuJaznkIax+QZS
         uGgDC9HI+GYF0PMcJjBQgUX5YIgwXo87HpeQTD67Zx7aJqxPrrAfZG2zzA9LBsLOr3fo
         xZLvVDILrDzySUMsNk3QaPpR7eqLiv+4dgpOvH0xPYV42zwUhYdIuWPF6i1sbbgljA5c
         Sj09H8xfGUQzZ38itq/TFNPXRLSJLGNrsz24PwyCE/3K7pnHrWoYQvOVocjxI26/Qa4i
         XApg==
X-Forwarded-Encrypted: i=1; AJvYcCXkvkNrxYkseU7ag7wYd+CypzH/rydJD2E8e6P6fhxdW39sBlV0LXKNoWR8NGglvFTXEoA5ZcL025ZjLiH/@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8b3AdrmKLB+L/mMcit1doroFEhFW3Qqn4K2VZuPkmsnMfSWU
	6I2/KYjYyMC8n/lNApBkFMNXnPP9W/B/ivltIYdLCJW2GBwFczUAcQ6kgEjdG8qOa+R13A+fQHL
	d7EvpUN12BrnLwLHfygohKDVTPWdVhA58QujDhDplnhcvAdFYhmN185yx+7Oz6i/3BzTu
X-Gm-Gg: AZuq6aJ45W8RdXM1ywxRWrqb6m/BuMBMj0z8IgNKly0EOPir27evo0kWc7NcLBylwCj
	VSWRGxI1MMskG6FrIMqhAABaqa3LyAj2wHanZL+zm6LxUF/J2RqbMwxOAuaNPidEjSH2EWR88O6
	myv0ZsN26IRfXGpZK5/UrEwgLY/v66dv9eE1oFnUS3QGoeBSOR0KgpVip/8+elcrcB2dMY37umv
	+KFWOgsssl/5QaxnmNOFAP0JVG2cP6KV5ntHZmxO739nqdaF5byFrOnd6vCFHFuaZ9amJ9DUgUK
	bb8I4XatdYzgzOcRPYZx/Z/TLauywr4JPfKDVNfb6v5gEcL9RgkQCEKgOxot4y8402M2pEavcMT
	Uz1IStLEAgWPOO9EWPgG1m53OiDB0w0tDd857GjB37pgCgCg27ltqTuDuGB+8RHaS4tjMQz1ShJ
	iRQVQ=
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr100575651cf.0.1771239235141;
        Mon, 16 Feb 2026 02:53:55 -0800 (PST)
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr100575521cf.0.1771239234684;
        Mon, 16 Feb 2026 02:53:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e390bsm1779138a12.17.2026.02.16.02.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:53:53 -0800 (PST)
Message-ID: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:53:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Richard Acayan <mailingradian@gmail.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aY_uQZxuwt8rDf6n@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX4JerO8SnCQ4v
 kEZRmrT3PQfg9s+4yRVwbFp1GLvq/KiFfBSQn84f8tmeoUu56MxZPVn4ctM+6uS366YuQJ/gJGS
 ngKOTSo8HwYOIKsgzjeg2KLRbO8YeokubymW9FOyUUxsmG7wx8Bh8JSfxuHLAN+K1JVmzUgXrxz
 bfxkd2dvimHtW06sOO8FdD+PyluE83lUzd2dMgZ4CbJdibfb3BWMIyJrt6Uv/QWj03Hd3fsLGKB
 D7tb+jdw5Qz04GL9C8tDzW8KVE2LrHdBiGQ/j56q4a4R6ZO6X2DtQ6hyeueg4CMzIaEERUg0YAE
 FXt8FRVlBuUnYpSyBOcdxquGzYot4rQZx4WJfFi2al5upLoBf6QUaGpeVzF83A6YlS8rm3egj/2
 zvDA2ZQTHfL+jQZBIRL1VmyciBKx7oatZqDzYdrW4qAus37A70tdi1jH+TPlCzX5rjdU66K/8w2
 E+b3JBJOW31l0z15Cqg==
X-Proofpoint-GUID: T91Wz6n7l4CtlkWxIVRG2Y2ayOSjsg2t
X-Proofpoint-ORIG-GUID: T91Wz6n7l4CtlkWxIVRG2Y2ayOSjsg2t
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6992f743 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=OuZLqq7tAAAA:8 a=9TPAvQA5bqdBw0Rm8CEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,kernel.org,oss.qualcomm.com,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BD2A142890
X-Rspamd-Action: no action

On 2/14/26 4:38 AM, Richard Acayan wrote:
> On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
>> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
>>>
>>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>>>
>>>>>> Add compatibles for sdm660-internal based soundcards.
>>>>> Why is it called "internal"?
>>>> Yeah... I am pretty sure there is no such sound card. You cannot have
>>>> sound card internal to the soc, because you need the external components
>>>> like codecs.
>>>
>>> It comes mainly from downstream driver name [1].
>>>
>>> Downstream also mentions it as int_codec [2].
>>>
>>> There's also an sdm660-external sndcard [3].
>>
>> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
>> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
>> optionally WSA881x".
> 
> Interesting you left out WCD9335 (codename tasha), is it never used in
> production on SDM660?

I don't know.

I think both were used with MSM8998, so I wouldn't rule that out being the
case for 660 too

Konrad

