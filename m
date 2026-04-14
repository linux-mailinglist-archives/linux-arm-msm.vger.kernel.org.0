Return-Path: <linux-arm-msm+bounces-103044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAQZArTT3Wm9jwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:42:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4983F5C83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 430E7300D571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235A318ED6;
	Tue, 14 Apr 2026 05:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCKYoKIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Am7feVcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61D318BA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776145322; cv=none; b=db94hc5/8nVqHldWYokf0YUMdpF2C2lD8Um93tzdABwgf+V3K67zTTggX6zDoKKtBxNkqvSHDpmRk/sxJSujipgIPiFQctT13vXyxMLiQRn2U9SZMFBq6p/xIrvldDZHshJdOLj8NsRSVAq9f5k7Bwst01oyP3N60fYGYGVCRtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776145322; c=relaxed/simple;
	bh=LtdnZ8FR0aviWXKs9GJN1OQYxTDYfEOtXeZLhXjDzxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsSDTVS3mP6g1W4V7F/dQPbSD0HYudl4ollGmg9/aSbfdDx9xLlG8xmRCf1c+XFuV7Zdyhf/2A2x6RqK/asvtVlQuvisZ5gsKJaYD9+cCm0YttdwxHuaJPJnoajAJdxffKfqvcRJxhhaY9xv0FDb6tHMYGaAQdeLgIgcgCw3tmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCKYoKIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Am7feVcZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLD9G8395301
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=; b=bCKYoKIe1ArQqOZa
	4RWDrxP7aQl7CvzwV+gHKVKXpBgJZOsVvrV0RjuH33YiI9sgaWI7GuPK3rXZ1YlR
	/Z6Y1/1Hvbb9gSgdMrdfKa9KUagiW+K6IcZdhmzEd/myo1xDpHMWo2fo0HBZ84Wo
	YvDfp5t4o4jIXZPEYJp/aRLJKcMb5IM2M7OGskyNH0YHxnrKri+UVLt0U4ZsF11t
	Yd6vzn/5D1gtBG6hRblw6VsvMOKX2YUNMICegoRVUuiVuOia9GsW9VBiquwvlymm
	FLKqjOPdHnWGiZ1lC/j5/1YRkrnVCQol6lI6qsOLNrDKadhqvUdgdqYLKFh8dyNA
	FnB1qA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870s73j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:41:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so5531477a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776145315; x=1776750115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=;
        b=Am7feVcZ7dC2PB5Cy+fiOzft5zVHii84//tpUpLrqa6hqLR+wxDo8g0AzEhWeQmTTu
         h7GFdsLxceLD6MRGlhq5R7SsJ+u933hfgYD7C8NkDwuXtZb4IOg+BKJui8Z9WDjHb1or
         opX3PnE7IhFpgGfzWNwbb1MNT0LTzPfyTgw6fuTN8qwFmjTq64HkA6vAYK+dTBehjNAk
         U3Le3BnqIro+piSfJD/U5kX4RrpVLtQ/UaJq2EuLGxll+yUzekrl8lR+rd572r9WvC4e
         tPSxNt1XfiFfLDeUpBAqUXIvP4xERPvDPseuUOZJO+wQcyaZ5OOvjMAHFxcwQk0lXOEK
         fnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776145315; x=1776750115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=;
        b=U0+JnkvQusAYQLkxckPuzjML4Y3fMBZL5oNeD4ZZLZIA2X2I4W+B5dDcwZ4mOAmzcb
         lcp97Ajl60xyKE1eyncIYLOm1k1dpKy3dOgdpyDw+rBSFhFq2ozZHUnJY1Hp02ALK60e
         TNwFLBFaEWYQ5YDFVuEggmUtYnz854v03lpmcPhaqhhTPn9zE7iHBdwDhAtJQvJ+nAPG
         Iq07TGDYrTqKsIWR6c4zxe7Nsyw1y7tF+bMU4Iz9LAq18CgMdtCVEJVXRcy4NyIF9jpL
         oFR7taQ1oz2z3TphOqdxgIEGZdc7pDlDCkkV0I9GBMM1prOtBFIpaqVcK2VIuwBhEuAG
         6ufg==
X-Gm-Message-State: AOJu0Yyp3z2+/1Ssn4TWEjBQwLWs/45+idXuwlikCYGkvYrVf/uo8cGM
	IeSPQyaJl/zdH1jx0Z8DRf95U50yp+OBa4/STnU2Vv1WJ1r0y+pIijywDMKEi7COsenTnq+Yehz
	J0GHonB/4irD7bTHhdSSXESFlp6l1nj4nfHRVQndP1RtTeCDOwIiXtlhib49GF3Nd8+CB
X-Gm-Gg: AeBDieuldExw+Q/E8QBLU4NI4Y1zP7pwrjuqj9agaPxaFQUWfar8vRelELdH2AoxdeY
	Pi0nMdThTi9UKeWAtmwS+3B2J1bBweDCBlVqCBFsPp3kX9PC9sLoEsXe/SVpA8CZgnotYEnVOM6
	uBc60QjF98h4ORsTpB1Zb2bErQ9A26HWFNVokp6Gnkmi1rvEmYr8r4hb/o7qpWgD1wWwQzEzE05
	s+jxEkwboOlaW09wUHpBl1I9TOXwWzl+r/N35PIoRrEJ9b07Jfjex53f3sfTfkmuCcAIe63j0SK
	3yLdezwv/ci3Ps9lTKN0VzUeoI95gMK66sqpXNandpPwjIoJvnYFhX2QrBkIE/fxuQJSyha7L4X
	2sXVoIjhlcnPz3ov9jB7/kmgEuCBZE6vlxm4/IlnJ8wnLueYJ
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr15762145a91.22.1776145315232;
        Mon, 13 Apr 2026 22:41:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr15762114a91.22.1776145314740;
        Mon, 13 Apr 2026 22:41:54 -0700 (PDT)
Received: from [10.218.34.14] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41bca6e9sm6367684a91.0.2026.04.13.22.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:41:54 -0700 (PDT)
Message-ID: <ce8ca265-24df-41e5-a763-f9475de2fa9b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:11:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Enable DISPLAY-PORT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
 <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Content-Language: en-US
From: Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
In-Reply-To: <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zmXLJrDobL2IFFHb7-kIOoav9nsrwB3O
X-Proofpoint-GUID: zmXLJrDobL2IFFHb7-kIOoav9nsrwB3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1MSBTYWx0ZWRfX86XfrNm0JIB+
 EaecpGDy6rp+we8++NBWgrPOHyIBQ/V5Eeu1ELBmXNHAiwOumfJ8BuIvEJN+wv0P8oWXhdysRcs
 RU/2A8zwNf2uAKDS261RWgN5nys6EvmjkeDUUijrq9WZpC5XxbvWCdPN+T1wN6qs9KY3SkIEibi
 eAm4yNIyK5IPE+cpThfD9L/cVhtM0oBaitF3puNwn6kBtwwnJR2CH0K92xpbR6cbcwn7tePblnq
 gBN8NOw2jkCgQQBeFZqXtepd4sGTQpfLP+SVv2d+rSaKhYpB74nK1yxdHplIl8QPInewLOw1c8j
 c1X2vAOKv3DW9Vbn9w6Q8O41dKQ+87xBFxtpwB/gVY79r8FmPz6nPuOXmHi7Wp03eugPfZHpluT
 7TWs09n2lZceOHLMNDRbbVsc2F1D6QfEynthYb2OxREi8d6/ss5kxZuvpuHQp4dSMXWBiFABZvU
 4F+O5d2Od4aFp4P38iw==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69ddd3a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=781UgJWHOTtPPHFJrDQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103044-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A4983F5C83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/2026 2:14 PM, Konrad Dybcio wrote:
> On 4/13/26 6:37 AM, Kumar Anurag wrote:
>> Add dailinks for DISPLAY-PORT to enable audio functionality
>> on edp0.
> "DisplayPort"
> 
> The commit title is misleading.
> 
We will change the commit title :
From: arm64: dts: qcom: lemans: Enable DISPLAY-PORT
to : arm64: dts: qcom: lemans: Enable audio playback over DisplayPort
> [...]
> 
>> +		dp0-dai-link {
>> +			link-name = "DisplayPort0 Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&mdss0_dp0>;
>> +			};
> 'co'dec < 'cp'u, please re-sort
> 
> Konrad

In the other Dai links the cpu is before codec and hence we maintain the 
same order in dp0 dai link too.

Same pattern is observed in DTS of all qcom platforms.

Thanks & Regards
Anurag

