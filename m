Return-Path: <linux-arm-msm+bounces-93188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICXOBXhvlGk0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:39:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58A14CAE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82EB2302A2C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA4835893;
	Tue, 17 Feb 2026 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPmkr1wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+iKc4al"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A503375A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335491; cv=none; b=dyjwAL0XVej3uO6fyV7ufJaqZLTZEa4Pp1nMUye8/dK1ROCJmmdyLp37IKAeyKrFZIKCGUN5JtgUtc5CiHxF04fgICpLkLSt5I9EqiaObpNpn0GaSiWPpMzxnFO0oXcnjvP8mCM1Y5KnRmircIUNJUPBWnJKSk2gnwd4uKgcvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335491; c=relaxed/simple;
	bh=pL0z8At2fvGXF4SEBRPzAsN60o1FcVP7IXyb/NnNloY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUuL2h0ZhNZjWrO2/BU+y9yD3xpK+qfazb0juAaGxLtPEHDcrHAq6Q+GBKN6KDB5G1IvvCVOnDD29F8eaquARCPiX/Qb3QSCoqLlRTNjI7kqCiBudryfSAmMQbD8jPoltZkHm8kJ89vmG0g5c11ZSbAwvrX0nzbvzvouoFAI9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPmkr1wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+iKc4al; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HC7VTt1223109
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGmZq2r68gpNyjeEJxqI6uHZIn9YGmwnHk52q6fF78M=; b=cPmkr1wpcpKrhlZ6
	MqlBWVcSj9yw79C64gGxyK6C1dIy/JuXcYsooC8ydH2lupSJd15tjJ1buj5JkrM2
	LoktVbxURpWv8orVEqPU5fWoAKr8Zn+gT/7Wr9OnBhejlIJ489OlVkd2F0otBaP+
	Kx70CJr801bz3t+j1Upff+V0oE1nf/z/hwS213abRYQHdEL1uSfNOOmVYm8OAm3E
	X44NcIPhvtog5qUPlfuKpwt33f3kQEK/nWUD3JFpLz/dBps4efWrJuhTa+gP4DuY
	b74fufZu3ZceUBdzFKzQEkoyj//BJtZxIKmtG/2Y6zBwmC+H1eto5CV+DpdfRtco
	dmtvnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrtg76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:38:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso7575475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335487; x=1771940287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGmZq2r68gpNyjeEJxqI6uHZIn9YGmwnHk52q6fF78M=;
        b=a+iKc4alCjL9Pro8SLHx+smCmfiRAi44h197JXcS9h7D40ICd/EqGfGqmFiTEwu7AD
         Pr9YcxqCsbNXTZVTnVQufsWt9x4VWxHP2an1UiB0Mm0b/6TGuWKrRxzcnP0fNt6u6ROR
         wxk9wF49YMYL20Ke7rJGBZqrtf+3Q4heE9b7G62vaI9iYnWg4gocNyWaGl3O0kvigK8a
         zheqGEbUPjQcs0OoTNQud1x+yDX45RN9Ykxnw/l+L9fyttty5LMbqW9VlnDRHelvipoh
         hOYP1yL2KsuW6xqXsp+nZ2BgEqcBWNtTm3ARY95LOOCObDTUe8xyX0n2GvbjHPJ/dP3J
         AXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335487; x=1771940287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGmZq2r68gpNyjeEJxqI6uHZIn9YGmwnHk52q6fF78M=;
        b=t6uNeN11h026G2O4qYuS3E8rA7Td9JT5mmhEcCirIKqZ9Bc3wGGzA2hj95IegW7W+G
         QukpltkSLztJ0rwl5xDceMLQ6aXcZJKGNiR22VLIWjRVgsRTBcBuR6jgQB+tN2/4vQSa
         CZH7ZwGapetpuqdAQ+24vtp+3E3k9SNmMOuYvXtCsNWCO4EXrZw/BxQHGYhFAITL4bOM
         rJthvAeRqhhHErdihVxDYaVl3RYC8uF/o5/yvpoPxvBxlRcpWUFDoaPBKLyJjphxOHT3
         ep5jFNrdbxOGGkbDbnIQqJGDR7I57y7E7/j8w+qiE6xAhTwVsq7MjdAMsNWAzb7M1uz7
         K7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKCSgx5WA9mwT+6e6GknMaDeP2vFinqo+r8WgyOJh9N8UqfE64ffcSBPRARPvllANEODUcHuDCtl113N+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyrG9UiXEdUNwcjjRVVYeUjN/uFRoNHLrY9BNFViEZrvdUi3PmW
	1q9n8hfIpnMfe4/wl5t8VS+DfHtUsSJNELBUuPr+pPi7+bELNpRSJJ5F7ChGIlxG3r7bhM2r69S
	HEf24ypsDWMoOSBjF4tzR1R2mkMca2PZteRcGXLruy13eYF53EpjzHrTw18BgcMPiMLV5
X-Gm-Gg: AZuq6aLT52FrADvJl2WNgRu5uec6NixkZyNLqnD2LHpc99cdPuKsFMN0+Q2IBtVbytS
	LizLFwEBcHg/o34Jurd21pEMaF2aNt+hMUi4uwkeDr/y2FMO6qbrWa8aBXZK+vzAfzpVdqDRWPc
	78ui1iKlzyTnrn1Ny+15yehLQpm4hCSoVYG8fy519IizHBelsbIkNsZtnS5i1Gi0alfGV1B2MhV
	BPC3VqQen9zfI17F4hu2D+QSnb9E5WQTnfANK6kOWzXfot1DB8j5x4l/W/tf6CFVH3ofp9uRgnu
	j7+fG1dlqLWAeio7Y0nwcgIMoX5OYIgxFhXTx0wXYu23xLW22/6usfkbXVv2vmA8lHvv0nswhEW
	al0jdyl0dbHgOaFEfoirMgKY0VkEIwJiErqWDLr+QaiKX9/7MXSPaSLLWtd9tPEH/G99sNn9bTR
	KUxTM=
X-Received: by 2002:a17:903:1a84:b0:2a9:63f4:120 with SMTP id d9443c01a7336-2ab4cf78267mr105936315ad.3.1771335487435;
        Tue, 17 Feb 2026 05:38:07 -0800 (PST)
X-Received: by 2002:a17:903:1a84:b0:2a9:63f4:120 with SMTP id d9443c01a7336-2ab4cf78267mr105936125ad.3.1771335487000;
        Tue, 17 Feb 2026 05:38:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e5a6sm358288666b.1.2026.02.17.05.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:38:05 -0800 (PST)
Message-ID: <bcbe3634-a5d0-47a2-9252-15810bf7bda3@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:38:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Adjust tsens thermal
 zone configuration
To: Bjorn Andersson <andersson@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251215105934.2428987-1-manaf.pallikunhi@oss.qualcomm.com>
 <zf5ztvnzaf6tplpjpytwbhktrebdnst2doybuubp6rjfj2fjs7@t2ma4ylx67gx>
 <46cc0587-8eb6-4638-ad04-c05dcd56718c@oss.qualcomm.com>
 <oekmcxiltaiynuwt2p4g2grae4gyud7vn5usw3v2cp4vwyfr5c@gg2x4lqvtd4n>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oekmcxiltaiynuwt2p4g2grae4gyud7vn5usw3v2cp4vwyfr5c@gg2x4lqvtd4n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69946f40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8uoaHlvUY12WB6v6n28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfX2xp1cGzIw6pD
 RlYnHtJ2mudlhpNb95mF6mVG3idqWyzV2jlxRyddLA2/5NZ1TC7acTHvq//LB5rT7wXvSxrYL8v
 erP5MOizqeWYkyjnTt86xEPoiClTt52K7a8cduABhp3hL5p50HvaxMBwMkphdIPbu8xcSOnretx
 EhqfHWs91frl4xQzL4sRQf1Porld90buL5bO+x73pJfwVNEq3pt+VpM2fOR+WCQ/f0j2yaNyT3H
 Cg0lgPwo1leHBZcSNEiWDlS9XXNSMawkXYZhSQew7ll1+rktGC4XsR7nDrdAqkvoYWAyxuA8CNn
 UDwlaeu5PLH9jyEONR+hPfM37x6TakBrEbsYTJ8eZ7opYMUNLfM1PL4LUtZZ4mxJAAjutZy4syH
 i+/liAfVSAuMbIddQFsXSf7kauhMlpJYEll3AltHlSIOUE2o4mJy6SpkoOYCPFFuoL+LpiP5mlA
 3dyRXDh4cwJkmNxBO6w==
X-Proofpoint-ORIG-GUID: --2FfClfCjPfE0zAQcrc0pn3OIbZJjCo
X-Proofpoint-GUID: --2FfClfCjPfE0zAQcrc0pn3OIbZJjCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93188-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B58A14CAE9
X-Rspamd-Action: no action

On 1/3/26 7:05 PM, Bjorn Andersson wrote:
> On Tue, Dec 16, 2025 at 01:01:01PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Dmitry,
>>
>>
>> On 12/16/2025 1:21 AM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 15, 2025 at 04:29:34PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>> The QCS6490 rb3gen2 board uses the same Qualcomm QCM6490 platform
>>> Is there a difference between QCS6490 and QCM6490 or between QC[SM]6490
>>> and SC7280?
>> Difference is only for qcs6490-rb3gen2 (IOT ).
>>>
>>>> but has a different thermal junction temperature specification
>>>> due to package-level differences.
>>>>
>>>> Update passive/hot trip thresholds to 105°C and critical trip
>>>> thresholds to 115°C for various subsystem TSENS sensors.
>>>>
>>>> Disable CPU cooling maps for CPU TSENS since CPU thermal mitigation
>>>> is handled automatically in hardware on this board.
>>> Is it a peculiarity of the RB3 Gen2 or is it that Chrome devices didn't
>>> do it? What about QCM6490 IDP or FairPhone FP5?
>>
>> Chrome devices do not perform automatic thermal mitigation, whereas all
>> other boards handle it automatically. I will push another patch to disable
>> cpu mitigation for all other boards other than chrome.
>>
> 
> This matches what we're doing everywhere else (i.e. rely on LMh/OSM/EPSS
> to do the fast throttling of cores), so I'd expect that this should
> apply to all non-Chrome boards...
> 
> Instead of doing this for every board, can we push the cpu/cooling-maps
> into e.g. sc7280-chrome-common.dtsi?

I think this is the way to go

> If I understand you correctly, we'd still have the desire to adjust the
> temperature values, but that's a smaller per-board change.

With the cooling out of the picture, the remaining delta is moving the
critical trip point from 110 to 115 degC, which sure, is useful if we
can use all that headroom, but it's also not a huge jump with a huge
amount of noise in the DT..

Could we get a confirmation about the non-IoT kodiak accepted
temperature ranges? Maybe those happen to be too high?

Konrad

