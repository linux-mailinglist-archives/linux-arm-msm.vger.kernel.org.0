Return-Path: <linux-arm-msm+bounces-91184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNa6MOxme2l2EQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:55:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF2B0A38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08823300E15A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E696834FF47;
	Thu, 29 Jan 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTF+Ud1y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USL9tTce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435334FF7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694947; cv=none; b=p3XzSqOQtvMOMPsBPq2I3mHz64r2DRM4FeD83sIVCa3VmXUxXlSC0XtqiJtzAmUZ3RWV7RymLS4C0DD0+Xk+GS/NEaTQT8KX/ueZ5ZrkuZdCpLjzeh2sGNKBJ5N4w1FHYmpCZHy1QeIePGfrF/hddViBcbUQDMovZUt9OFtGfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694947; c=relaxed/simple;
	bh=9rsmLNzFHZsMCjXq+TdAtlAG5K3aQ6AUx7ZH3w7++4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2tBf4T4gA+vQmmRU63hO5AawSeRtfpB2EwYifTOXc9rxbVDqfAPcOdwW25zI7bnVFST+B05tK06Pm/YkMBCNKwfU6Jbz7svBWxEwYPQaD1N620gJOjlK091PGIJWhuea2/aYceKZqAGDhWgVLhgg8vsnSOUvLWwgJPneSqCAP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTF+Ud1y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USL9tTce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TASNtN2061110
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXzI/QWcUXm4kzUtdwZo1pedyn+G8yDXu1CMr9z4bTk=; b=XTF+Ud1yFzm7I3pc
	ouhBWBevgJNasoD+ejzK+zYAIOyPl4pd7Ve4yfJ1HS84UFumyJfmEoOjMApt2vVL
	JRJQJCgR2fgN95/aiWT0Qh9/TxweWXhiNy/aCv42rwNJMMS/RYxqdiK9JpBTtv2D
	fruEy5UUkthhcZ410vcCe5k9MDaiOLFvIYHM9tTxU/pnh9x/yui9ZWRLNH85p11M
	MPYDlXAxVOJaaQov76jCVOOxCOfpINezpggJjEmG50m9bVWBmuihptdpCjbL5yo5
	mQpUHNfo8u9RWAQptk/i23FJk65Vvi1/RhVYoXPv9LQtzqdlrpgxZvqwnR0xsJIC
	sFfmpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrkkm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502aca58e75so3528611cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769694940; x=1770299740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXzI/QWcUXm4kzUtdwZo1pedyn+G8yDXu1CMr9z4bTk=;
        b=USL9tTceoxCrhU28MjjQ6XLnLoPJXcPL6m91vImfnF3PFFC+bBBUNSNqAf4CjXIql7
         wiojiam7j5B6ryY37qsupKhayVwlKvWCX4YVxm5IR5+kmPTPmlMBMWCCZKHSVjhHzrCS
         DL9ptSTc1vDsZwNzw+RZ71y8Kw8c6UntgnyGTMbeeBq+ZCoZb/QEY0AJunC8v6LnPCmk
         9i6slR5VV39ipN3NxOmUp0AUm2lH+dlvsK9zK/Y7Zw4cEwlqpa3i0zEJFeUGP3rj4jrL
         wgfMxS7QLDkcf7kOrxSCuMtkkdXt3DIDDN1JaPZNORjM/aAEyejm0XghdHvIbnwPCOef
         n81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694940; x=1770299740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXzI/QWcUXm4kzUtdwZo1pedyn+G8yDXu1CMr9z4bTk=;
        b=PcQu6TVm8w1ghTq0CwY39fG250IjWWO6OObJk3x20mjzz39DYD/Ctv7mJmD2KYp+0c
         4UCJGsutgkYGsv+cElLw/mqy50mgJoPYmTjBmjtfXBg7VdAQQLjH+EtRyh677JbzsQsf
         htKsYPNx3qvrtCMoYwX0+ucaCajf4SGfHmY4wSgE5b7wp3GZ+3XQlR1fC7ZoDzp9tVMQ
         YVAMqun6FqN7v53fhEPKyzn1scnQjc29ZHbc96dlOfY3cd8aa06jimV9XwUN3r5OmQLI
         uSoFgIA1mjIzbIiSgvK2BlQztn/zlHhgsFfpNgXofJK1ftE1PIBqEwDtp8C1s1RDb4+w
         izlA==
X-Forwarded-Encrypted: i=1; AJvYcCXTkg6dtZdHfTdI2xuCQYrboFl9Us624prSzaiJyvTmZseEwnC7sTVcu03FsZVwCADqFISyKDi5rTPz3zJE@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRKnnHH/UUNeoTWCzjS8NIeymdtpTGmZ9lh67o6UMOlCaPtEo
	FnlIYZNwzwP4oiTFTieVu0iE+rz+t0Z2Rxo94Ow+AckmnRqqIVReOa4YBJcQDnoF/fvElrWCN1Y
	KUoq3BILaqEIaMdeObCzP0aXhwgGMGW/sCa0fIjA3Hg3utW7WDeMSZlOpRIRmBhmfxhv8yK90P5
	XX
X-Gm-Gg: AZuq6aK6+HQ1iLTZQkJspCL1I1zs07AvBHkEZt4lvKjzE4lf8rLr9hKTgFxXwObkE4y
	sid8rXyMtUixaAWXxF7AsjLm6DCcCKIY44zWOtKlH5o2yY+b4Qn1b9wWx1GI0eMDV4Wcf7bXuL3
	jkjSOTca0UmsOlSmR5RAzXNK6B/VkWcc3k+2VK1xJYXCQiTfAscIOs/JoKimL09Z0bYAhjF6zBq
	KtIrZI/I0YH5o9+mrAJqyzCzA9FE5YQorz68xPmSaHT/IZ1cb/9bRMhyRCQFENqE+JrtzXonHbu
	8cpqyr1ZHyfVfvx8PIzPezk6XPQqbRIo60JeXmTZH0nGKFUyn5LjitR5wa7XOdnA4ABSHT9aRjc
	y0aLsn8TH0fv3PY4iBbr+igW2/Ij22dO9qjDw6sLDxFyBmRfj+/5D3FBQo5a7ZcpbBvw=
X-Received: by 2002:a05:620a:4721:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c714c2db75mr518419485a.10.1769694940017;
        Thu, 29 Jan 2026 05:55:40 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c714c2db75mr518417785a.10.1769694939521;
        Thu, 29 Jan 2026 05:55:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46aba2fsm2925268a12.30.2026.01.29.05.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 05:55:38 -0800 (PST)
Message-ID: <209905e5-fad7-461e-ab9f-521149b0248a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 14:55:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
 <20260116214354.256878-3-loic.poulain@oss.qualcomm.com>
 <0ca0920a-aebb-4072-a098-48c4c9938c26@oss.qualcomm.com>
 <CAFEp6-3T1=+fZ1x3ADPpu_9P5d+bx3w0XdPzip6OBiWuk32KzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3T1=+fZ1x3ADPpu_9P5d+bx3w0XdPzip6OBiWuk32KzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b66e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=124UOl5Lhhwps9Am0HIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WJNVGlN9iq9jSfjSU9ksHXHFBq-3Zbn_
X-Proofpoint-ORIG-GUID: WJNVGlN9iq9jSfjSU9ksHXHFBq-3Zbn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5NCBTYWx0ZWRfXylhVBjPqzIHi
 jy6StcFTgWMF5JZCOGLEBSOqopCMUV+TJVOiUuVFrbtWoQhviUYry5Dhdhb4N0/d7zd8r/V/FF1
 zf1wbfVrSHXiSxD3UYNEydL1fgvLm67syyeZHLgnSFcPwNVwM4HNo84dou1bKmzaG7acBrkKnKf
 Z/P60xNTjxsn5Db/Jp2lKKtq8mX7Veob8NVvuGFAfc6m0zSpts1rh5eLUMN7n99pzVtgq5rN0X/
 55xw4/+1shTC804D2Op8BWlAHjeIV3BgSaCbCe9SHP4Mgwfwxd3A+jueAEiD2I73mIKVIReZByX
 dtaiNUmcVKKpPGOKX20xvhPsRbAFqwE5dwJyLE+XX3G9/PxQhkHrillJgYIk1Wby0MM9eX+olyy
 +IvzKOVBEEZH4RL5g/FbrPFzNeq4QfKssUAagZN7eYHpeKxJZ7VT3P7gEXtRClv5OzzoDa8Kh75
 g9kX+kTd1Fs+RM2sqrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91184-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DEF2B0A38
X-Rspamd-Action: no action

On 1/29/26 2:48 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Tue, Jan 27, 2026 at 1:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 1/16/26 10:43 PM, Loic Poulain wrote:
>>> Monaco EVK has onboard eMMC, that can be used either as primary
>>> boot storage or as secondary storage when booting from UFS.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> index bb35893da73d..c272d7db80e2 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> @@ -76,6 +76,15 @@ platform {
>>>                       };
>>>               };
>>>       };
>>> +
>>> +     /* This comes from a PMIC handled within the SAIL domain */
>>> +     vreg_s2s: vreg-s2s {
>>> +             compatible = "regulator-fixed";
>>> +             regulator-name = "vreg_s2s";
>>> +
>>> +             regulator-min-microvolt = <1800000>;
>>> +             regulator-max-microvolt = <1800000>;
>>
>> Is that the case for both SAIL- and SAIL-free SKUs?
> 
> To my knowledge, there is no Monaco‑based SKU that can start without
> SAIL. Monaco depends on SAIL for proper initialization, even if it is
> not subsequently used.

Perhaps there's some nuance deep enough that we don't have to care
about it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


