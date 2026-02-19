Return-Path: <linux-arm-msm+bounces-93362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OZkBvfelml8qAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:59:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4115D97D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E52301DE1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E97E30FC0A;
	Thu, 19 Feb 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWHA1eWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJWXqFYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49A2741B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771495134; cv=none; b=j8dxI3bMEFURqAjOVy2AaccoFc5cDf8kXYIwF4sQ3snGE2IPuvSNo6QCGe860A0x5JlriDmLEchWGpK0S9EZ6oormwFBSU7gtVuEm1V7V+wDdwF56ubEep/q0UNZFcB6NdkRjN1z+8HQgTsU+nL2Pjk07gLIOJVd6ZqckCzUOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771495134; c=relaxed/simple;
	bh=pdfpoC3jVEsg2mTi9NV5+lcx/3u5nMQepBsWbZrdRTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHhJ4VBuH26RgVZZOkZtV9nbMkV0Rfi55siAD9y1ez5FR1Atki9umOBssHNk6ZJ+k45gwNu1T/E+RzriTF9/SB8yJlb9/RQq2Xz4MZiG0mQFepMvkUvsF71S/Te2UsLWm2N3lZubBo4MtL3mgqZEC+ghnGU2dngzRAc7/gfYMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWHA1eWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJWXqFYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J56kFR3319689
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dp6lkKnOQAqyAsl7Ok59pbcSrf7YRsjhfIHiueCYf98=; b=cWHA1eWyOwzvfz6q
	lh3Fe1jp1wHjvxgNo4thGOeHAb7SY+jtYGMjmOhlojzUxWiTs0dJiBEvsBVAD4RG
	LKwZHoV7/fY/GnuuZsNzcl7SlPpPHgRzoeJauve8p7572GDz0jif9kpSds8NQ1hd
	zJcUmzRgeyuQV1eBSMdDBvfl5KsOJv9aE/w8oSvDeNn7wn7EdfOwgn7XjUMojSdX
	kRH4h+TNLkhPFSGUkmwO3kn6d/rahn2V8qpZTyAbI6VI/bm4M4j6F3jOx1BBYmC4
	z2ElB5xops+fmzVP6D0tknKHNFLt2rfMddWQ/52QkAuwYXWXRq3forJN6Rdgvks4
	KNdgAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv388ndg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:58:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8960257db65so6990166d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771495132; x=1772099932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dp6lkKnOQAqyAsl7Ok59pbcSrf7YRsjhfIHiueCYf98=;
        b=YJWXqFYFvFtISTp4qvlQA+D85ILrsV5oiomtun4wulRt1OqVzAr2uC2+jnTk0yueWg
         4h8dq4smJA9nah0A/wwLuGjh5tcTJqEs/rcI5C9h/09dFzLWd6Qj7WcM1LzyTlYwtwVH
         Ji2nnq7O8tENSvg1AYxDZPq538XHYkwZB3SeAtmQ2VwU8d8IVNqGxR2/AgXwYIOz17PG
         OyztStTfL/XFYWsCcpYaRDeswI+GcSa69pQRBevcbuNjBj51CX3w1d88PPELH2EjemW/
         z9etfuFOjbRlVCekoj1FD5tszAzwkBX6JKyD3eVp39c5NYPd2V59F13V9LrA4CCrfL8C
         cYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495132; x=1772099932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp6lkKnOQAqyAsl7Ok59pbcSrf7YRsjhfIHiueCYf98=;
        b=r0An6T+MgArufzztYdpATG70okYGZOWAsdSoh+5GKTezWc4PJKRlR7D0xn4U2thZ9N
         1DhuI9m8+SFuhl2ZiZsw63wTcXQFfn2SJEYOnRxDePA4YNL74RgxNFuW8Pw1Xjz67hOe
         x8nibcBCxm22Pasck63qIPOzwxRKiF4bjMXVUxK5Ss0ydbGgB0Y9SY7YlSWw//fp2Hlv
         MyI+asPusiSdQHt6z1iUCFKT2nkmIFmiEpZXSlZKhWyb9YkuRqbUVpOki8Yz9jObhRAy
         hxeE5KUp+IxQBuJ/ouy5W18I5ULsgZv4hgIOAhOUPdIOpb6rprc0Ztvh1ujxC4vWzzlk
         8AQw==
X-Gm-Message-State: AOJu0YwW4NagsBKxQp3mLhPX5gFdqJzBzttwWTm6/wdTPJqQkgY7Wcy+
	BUesdddYRXDg1ucGw3zKuW1j21g/JqdzyIQIRHbQA9gvVAbeIq2PJafLE+37MKtrMT/uFeoTbQL
	DONCu/aKn09Lt2mHEAYYgju52ZD2XpcEBTTnqKrymdfVNVTlyR6XWiJCZUXdgYQeSHbcg
X-Gm-Gg: AZuq6aLccr83Wn38wmh3ZcPSJuIPddq1XQJ/ynarxN5EtL5SKDG9HeM5CIzBL3wzk6+
	BAdyIo7or9Ybz+Jwi0oGThDbKWYunnnI+a61zJo7r2+z/zkMEaYIMEEG2hNTMdqPBhiB/ziDeXH
	PCHnu5d1z3ib3K2+B+xlcJSdFoW3LZAXwLK6V5MP9WxDLeiLiTNLUbMyVGZDR3yhuPKmriyaECd
	74MaSsnNGkZJdb2KsYPUS/6evg1AbDWyanpLzXBfwU2krNd2MLfMOrNeJhsilEKgk68eIWaH0Jo
	hzP6OMGafhUsQVw3jTeUq9kxi3wbsvt0CA9XOJND/j/lgr/+2qSl5wQWb9jiiPk462BNlcORnWk
	GTe/JiJXDpa+ykTRIEN4KrGrs8N7gwH4tZT36N6/Yqv/mG8QZJg3wr8UCl63ZPPY/TUZNmcjsWD
	Cw7HM=
X-Received: by 2002:a05:6214:8095:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-8994ac78794mr89723366d6.7.1771495131486;
        Thu, 19 Feb 2026 01:58:51 -0800 (PST)
X-Received: by 2002:a05:6214:8095:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-8994ac78794mr89723176d6.7.1771495131050;
        Thu, 19 Feb 2026 01:58:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm562549666b.38.2026.02.19.01.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:58:50 -0800 (PST)
Message-ID: <1c43591f-ffc3-433e-94b2-8cc7bdb3ec62@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:58:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260218-sm8550-ddr-bw-scaling-v2-0-43a2b6d47e70@gmail.com>
 <20260218-sm8550-ddr-bw-scaling-v2-3-43a2b6d47e70@gmail.com>
 <f8c2fe29-9e38-487c-b32e-7ce151403a7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8c2fe29-9e38-487c-b32e-7ce151403a7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=6996dedc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XEhIh8xtOs_--jVvVqkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: X8MgVLW9auS4WUAEProeL_w8a2tqI8Gg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA5MSBTYWx0ZWRfX9F5/AsxuKCKw
 cOuCw0o7ZIlns3QFbV0Sy78f+h+pctg3aaFD1bnWzl/oa+MY6mqxDPJWraz/WlbZ16EDpvx7fZi
 MUbMxzIqpVPodXklkM7V+N2pyCIkjIj7cVyz7tk/fjGe88+KC6NnSOfBFwID08IiuasJwzy4WdT
 iMpVRtTSgGXqwbDyHgdXCTlcDRnJACswolGKSVaQJR88aJE+4Eubs6dgRhWZJIyFKEp71Fn18O1
 BBewnhS1V+W9YZcwQ1eVY6mmGG4G7g29sR3hJlJn/dxscwxxZURZg0U6OLXWDcxmYfo4K7P9vyY
 pxE55PB1PwG3RHxxdHbmyt5qe1qhQZzCvV7o7r13dmZktcsZ9w2nREeeCaTnRWUTq3+g88TnCd2
 5po2N/p2L+Tsi4eCeOdmSEOGqVAm7bzMSDZxIfowBJK3Nl3vPBKN1BXaOYLT8PcZVgPJC8Btato
 nXRJWPRz/Yu99sJomWA==
X-Proofpoint-ORIG-GUID: X8MgVLW9auS4WUAEProeL_w8a2tqI8Gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93362-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AA4115D97D
X-Rspamd-Action: no action

On 2/19/26 10:57 AM, Konrad Dybcio wrote:
> On 2/18/26 7:16 PM, Aaron Kling via B4 Relay wrote:
>> From: Aaron Kling <webgeek1234@gmail.com>
>>
>> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
>> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
>> frequency by aggregating bandwidth requests of all CPU core with referenc
>> to the current OPP they are configured in by the LMH/EPSS hardware.
>>
>> The effect is a proper caches & DDR frequency scaling when CPU cores
>> changes frequency.
>>
>> The OPP tables were built using the downstream memlat ddr, llcc & l3
>> tables for each cluster types with the actual EPSS cpufreq LUT tables
>> from running a QCS8550 device.
>>
>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>> ---
> 
> Once squashed:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

FYI I did notice a couple of "trip points" in the downstream DT that
refer to higher than described (i.e. >3 GHz) OPPs, but I can't find data
about them internally. Anyway, this is good and if someone has a "very
fast 8550", we can always extend that

Konrad

