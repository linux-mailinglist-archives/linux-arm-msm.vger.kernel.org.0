Return-Path: <linux-arm-msm+bounces-103414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD3yA/3l4GlhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:37:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCA40EECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C389D301FDD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ADD42048;
	Thu, 16 Apr 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwS/ZaMf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdSQCvP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2663BF686
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346353; cv=none; b=NRoc5HZl4EuKN47nupCdWPiuHaeAeTHWfvOYw4Xi8Jf7AIa2eXaObSPKfBWPEkNzh8/qKw/WzG60WKy1Wqh6icNUSghRPlUxc7OdC1YWNr07Fjq6getxhPf2bau2a8NyxoxAyEIhkioekPVJdMj8AeW80oVQiVdAyJQ/4p4yBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346353; c=relaxed/simple;
	bh=ykQtwldpahujIM1r6rCPoMYUWz+ENJXFV+25TcjTMkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jR+xKJHO+ztU1/KAFZwnC5O5Sa6+hizFDT2Z7TLrgSZ30FKq/CD/B1qG2ThsWMQJQGH5pW7BD9MK0ywGBkuhzYx0Q71rACEnnY+oDuvJgZRO9gc174Bpu7qmAgvLwn8Rm1NX2b+rIrf6Hv9GJGfog/a/s3vLsL5c713q1EMwGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwS/ZaMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdSQCvP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GD5NZo218920
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=; b=WwS/ZaMfw8WY9u/2
	EstjN+0VRmjmnDK/3eAFbgMYrmm6u1aO/OZUnqKTD5aYACajFnlyPnn6MjHtJ7I8
	xAc20P/aJuJcxIkI0UIrp5v3P39PeQNGMbyw/guFeHtZwsG4f0UN8UTrSRjSKs0+
	FxYoDPH79ASNTfN6jp9G5ukHDubwXzglH4i+3pu7xS8NUKB9qbwjJESoZsVz0vKF
	aG15wzxppoNxwzq/s6cVxbnMRghpMr8l8mDVHUifhgdB9OMSbNDVo2StCLCfEFvj
	wHRCvYwiIlpwalnLTmtU7xh4pFSR0dxIgEeEqFbYseYy0SSWtdBXIMhVvO8LTAWc
	sYmcAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyhcjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:32:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso200432985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346351; x=1776951151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=;
        b=SdSQCvP2IBJph8THQUoLo+9YV+w1SninywXZ2k/rV432p8DPOzlaZympTzUUdPz8xC
         gUoQ1LdocjIXvooOjHXaebPrynQVtKyV2Prj5yrkLsjTO4OZe8gc20Lm19QVpCp2xNJP
         J66bTagnILR6KIT7SggK+Tw9dFCfG49FSI6b3pyMTO4jFMk6qpIqBKNV8gHhgFE6Nnyq
         zzJzRZVW5BzX1yV/kK9+yMtibeAOUOujjM94t21LWWgQ8zUJWDVuMKjc9D6qcgPT/Q7p
         4AsbimV/P53XkdFt4ZhR7dsGAK3cBJC61n/dmHJzbCfuJ34ZE39hCHypT0nB5QmOM2W/
         r/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346351; x=1776951151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=;
        b=Ih7z747w7bh1bip55EG0sNcaHIeG6k+AuA8q3YDPkVTVTlQ5TP/EdUco+LVBHwUI+y
         wWDDDG6hsv1Fk9H+Gvqzt+WIJRfy1CE4zSjEQCBg6nAQkS05VtuOrbvXv64s2c6BqCPt
         evq7Urq622uYckMOne5gatUxozTAgXRnowL7gHVR0NV0mMMlXj6UQRW1Qad7yUuSa6Ix
         2WiXHoSxeQWL2440PggkxcqhuPm2Xjb4k6siT5GL9+POjSckb7JR8C4ln9KOAB2MYmRV
         sMxaiMyEliv8xLDWsePZMhOss0xP5Wsccz69LNKdUDdZDRlguteKJX/UNfFwweGOGm3m
         5z6Q==
X-Gm-Message-State: AOJu0Yy5p6tAI7lDAIBVAIY1f1mZwndYzl8p9XJrwMNEgI+oSWTiAZsc
	KrUw3UBlEmq8D5CIIqrpQcVF4OQ6nbRMmTYNUokNa7MFyr1nfuxwqHHbAFKMUCkWWYB5gcl1W8e
	r1Tt5+tiWygAAS69prggaaaCBLPGPZcEOlj0w7/MIVFkMPLHdLWCvcMrBeIYUvop06KnT
X-Gm-Gg: AeBDiev4eZ2PZ3eSSB/OdX6mw5X6VUrVxddqKsxDx3IKi01Bjj2edBMfUS0/TMTCIeL
	KziVXY5Sym91n1kd6aUf7bhyP5uQfdEom2QU1LAWMmNlE7nacrv9+eI71KqRIwPBf16IcpvSt6O
	qYbeD6dlbpQX6A8yMvANTM/SIxo4vAuMfNDfe1sLTmo1JkieXjimvb1GPUVEHL02SbL4X+svBC/
	hDgxfatAXa7LCoMzUf+3P3gKVa5i0NTC63yRq6YAs8CBJIzHuDK4afdL0LmgPdhwUy1/o7P0Iqy
	Mrwy07ukT4nzim6FrIOyL9wwndAH2qhd4Xn7MNcKMJNZyPuVS7TzpAR5OyVXzu/Hrl+m3uawhaN
	NhlMqUvZOC/JJ9AyJ9zt/uQiEYWzE6Xmxvnychclyv3/9Z/gLKLhWt6FdIkBkVQv1A/fXNow7Q7
	yHQTxEefwCDD+o6g==
X-Received: by 2002:a05:620a:448b:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8e6353855damr250662485a.6.1776346350911;
        Thu, 16 Apr 2026 06:32:30 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8e6353855damr250659385a.6.1776346350447;
        Thu, 16 Apr 2026 06:32:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d7899esm1201511a12.1.2026.04.16.06.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:32:28 -0700 (PDT)
Message-ID: <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX3px0rZLmoyle
 OrtwdAdnmJT3ayPbqOkeZugjRBlPZDlU2lhlNXOpXv422+O/+KeZ1TS6HZ8X7Y75Hcjrd3ipvh/
 wobvQM5huV39tCnmp1EDC0m68fPorbg/lrzp/0VHVZBkydkIH2bqAwzKGEuZd9hOV8S0chcB/tx
 MRUHfv3+R1Rw4awFjDO/X1uxOp6+w2C0mEBnbDJyOKZ+hEZSu00XyFPGDefUu1LpWhE7AyV7An3
 /NZbUoVGwrrUk75LU+msL8rZkhV0IXawPNGgMQByPbf4qKVdheR1hvKOXQlLaM2O5n0Uz+b3fvg
 xdOLCADmbcSSuxy+u35rdbjstygowXIKAZAXayGN1YUfw9x8RWuNUJa+RX4WRfJ+/NRO5boiTaK
 CwTblv53We1T1g/5sVnIdV0qiGX/OkeOz6Qci9JUUA0C/YEI29rWnt2jyZ9fkG2sFm9xKUd5ABn
 t7Dw96E2BbyYoYJOkkw==
X-Proofpoint-ORIG-GUID: 0kqgPDvvNJiEKBCmgnebzNq1Df1redIN
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0e4ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=_svnvpbr5Yy232N8lfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 0kqgPDvvNJiEKBCmgnebzNq1Df1redIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103414-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,mainlining.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ABCA40EECF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 4e9eb5bd11fa..86edd826ede8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  		},
>  		{}
>  	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,

I don't know if it's a typo, but msm8953-regulator.dtsi on msm-3.18
suggests one more zero

Konrad

