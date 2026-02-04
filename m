Return-Path: <linux-arm-msm+bounces-91822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADm8KPN1g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:38:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F3EA5AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20C6300F5F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761512F12BF;
	Wed,  4 Feb 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0ee8ae5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLSFdkcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140A1EB5B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222709; cv=none; b=BeZ9t3TwlYLLnekOn9OcYcC5VBfny68ecnPCF2ojFFR5UwRU5m3DnnFEkMUhzSb+fYS5E0d6GPzgwMwFzlb9j2Q5FJnEmOfcYSvVeXMdRYWoPecKP5wQVZW7Wt75Q9p6KCJdpvsI5K+lOOxfzb+EgKz3GyinWGV06ULJRFrcn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222709; c=relaxed/simple;
	bh=Z8BUtmy4vYqnP2Sl5b6PxGQmlvFe0zk8gqNCmj62HYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Avj1EkaHMJBaggUp/8L/Xb5vUDlgktnb9DuNM03Qr/Ii5+jZlFqV4is7nYi+06Ds1vU44sDn905ixRjiUT7qOSUEY5ivQQ5t4KhIFYYum3S6ghdpAPW5kVuMt3GR+YbCW+Mge/fzsw96EOi+1R2BAnx/d4Dq7Ct8Sy40KqjVWH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0ee8ae5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLSFdkcp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CJ00e796084
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjYc5v8giEANpBvp2Y4mcpR13v9pfhNpJMCgPZbtUk0=; b=Q0ee8ae50UtoqGGa
	R2v6W1rJPrLg3l4sWL1wctkXamo5+He8/EYxl73ihR4oqW8GS8cuwanl2J3cLHrH
	N52+KD/StqvyYs21ddSYnOKXxxkmOB2dYAXZR/vfChOj9FNqBRh8x6ByxxSpB7r+
	m0OMNXS1XRgQsICz5IrUrfS1fG8UDBdR7WKQKVaXcBSjieDpSKMQYyXvqi+aKOLa
	toTy/PeH1RfwmacIMWa4lyNbKZAvQCNOXtqa1MwtnZ8pUnf8VfOzJmf48DAxOjpY
	3vwF09WGDY6MzIbRNkBXkeL9bt0PzkeNFmN3T9Inff+MHcpqMvvVZzqBEGPxBtQW
	fN0Gew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxh8cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:31:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so5345115a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222708; x=1770827508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjYc5v8giEANpBvp2Y4mcpR13v9pfhNpJMCgPZbtUk0=;
        b=JLSFdkcpMIxSafbZ9ccKuJeL1FP29F4s9XHWVoK1Svq9ZXr7a2NWN49nYVD/ASHXH9
         L3Htf38MwBR59BEVssB9NEZ3lRIpl8J/9+GwYWqPiwK9VXrfeKlw27HZCsf1feiJhy+O
         87W9ZmR0qHBBcwi8jFMN3OVQcPcttq1X3qYmyejhljavzhnuPNNlHOmr/phdURyAuWBC
         eAJHma6eqMa/wtDnEGlHSVcD3VONcfLucuByB0uuLnRMZCg6mMUeZxkogSfjTGLo+iJ2
         JlX/r1zrWvFyndXKS4BHjVNdpHfvN4G96DJqmXgzUp4TaMwOeUvrPBUv78XKbslE1tlB
         9axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222708; x=1770827508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjYc5v8giEANpBvp2Y4mcpR13v9pfhNpJMCgPZbtUk0=;
        b=T6ylK6PM9mVYpr5EXKuM1BKITAEZtFyr2ZEZTvUARIdusLBCSfKUg7YCOqXHBJswCb
         KXc3GFas0NIKzSrxYaBuv38cgbvdHGM0gD3RFCZnwicnHvebYqTHWMCpIbbP/Pfl2ZX/
         IehUoeCbN6KUiXXUU14NCwwmvSAhI82l+DaYI74FbNNnXVlRb8iu0+qYixCp9lHCtHvB
         0Mvg2uETkbRW+LuZ5HZqjb6Vx64KADfynI/tf39SFYCu2QAv2VN7vmpr44S/GR3gnEb8
         4Qand6mO3nhV0vDnatLuV04EZJ/3ZqiBT4lypuz39+qQ3QobTsiSYVdOjY8j8tEX8KyS
         S/cA==
X-Forwarded-Encrypted: i=1; AJvYcCVKNQCdmEicygVZEgzmGnUVlPI1UB5GGVsTPxJ3UGltzyQctiYh+CG542IeNyW8w+wF+1t2TnR5ob7+ujif@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PHIAlSNDmwxhKDyHhHCSDAFNgORltxAHU0BGLoEbVfAep1RV
	BFpGGeXpvUpXwDKHM5Riwtd0bSsW15yoS8aC0w6M+oA86nJyk1COJ3/o7mIxqQGlK0sb0lYsC+e
	4pGNducmAuSTpMviu1mF9HqL2hofPamO03xOKYiO+XmgEGxo67JctQOsKNpcSTnGfRyfh
X-Gm-Gg: AZuq6aL/WFBancqMfFzgiEtaf5MIUx8AO8HheXRq0yJunz4m2SxXQSfS5qWL+HlI4Om
	UmkQSn0QvY9BZV+sEPnaO5nv5+0Tq48ytAUrTkR798qN7d/R5Xf0QqSFDw5po75G7TRy11tqGtN
	wm50qUzlw/avcHqhcLsQoGKgCTVaKfszxUsmUt0gYRqbqx9pZyNAn1YRzsap+Vcz+BxxxLZuY5a
	xq9VveK2ta9dYPsA3b6uB2e81ZuNoiACo5BaLQOMAzr7E+GC5zapV4MfWRuiTWAGgP423RqhrsS
	ryMwG4ZPCjZdWgN5bPOSq2RSr/9CGZlE0Xs3eDkjW0f8GfnipRk015msLNNMPsyZtRrFLWuHVgA
	57C4yRkw1imy4I+rGMM78wUVXYoRjKenArr6KzXw8
X-Received: by 2002:a17:90b:534e:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-3548722b3cfmr2875485a91.34.1770222707812;
        Wed, 04 Feb 2026 08:31:47 -0800 (PST)
X-Received: by 2002:a17:90b:534e:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-3548722b3cfmr2875456a91.34.1770222707189;
        Wed, 04 Feb 2026 08:31:47 -0800 (PST)
Received: from [192.168.1.4] ([49.204.107.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354860bef61sm3266726a91.3.2026.02.04.08.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:31:46 -0800 (PST)
Message-ID: <b52729a3-4d14-40cc-b426-7bdec5dbfde8@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 22:01:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-12-praveen.talari@oss.qualcomm.com>
 <7733eac7-8158-40f8-8887-44e458d33e9b@oss.qualcomm.com>
 <3466212b-802c-4ea3-8661-794da34c6c3e@oss.qualcomm.com>
 <34ecaa11-0d2c-4981-ba5d-4d3d46e41dbc@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <34ecaa11-0d2c-4981-ba5d-4d3d46e41dbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=69837474 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JMgISmeAsz0pT9/O8qDBbw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SbYDc_ivveej1R-7gkAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Im8eX-PoM6NDFN9lv44dYWlpD6w9PneY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfX8Xk5wnBzHt7u
 NeFdBdITkbOvndPOVJeT7e3aut1LFbV+aa6qkUJk85QcqALvF/0ZHqgdiMXHYUS/CYt5UWchxFY
 lvxFvB6XNXMR2Dn04OlBsbMl5fqw3SH7AKur9TZzwsn7aOZci2T1NwkFWAgWc46D4IVlvH7bBR3
 X3IZlYQiIDfmHtBlmcLdF1v0c63coSCYgOpGsBftSRBN7sgvTIlv2xkFvURR49GrAGGzzuVq0l5
 ip1RgglWb/FGtDOxfEn8DhlKyCCzTH8/z6pSFkmEnIauuUJqee9ME9xnQCr4jEbLpaD130qEoTm
 dgWckzWTwxFAf2BOAaJBK1zRXOecqX5ZEvR7N0QmwP1LuKluomoSMTSOsaOFUw6oHfIRBbbviAk
 M+U4MsYpv6weHETdLQFij9U4Xs+4Ff+/fwueLcZiQfkZzN2W77onV1hhLPQm5US2UxwxvIYc7/R
 lA6EHCm/+bs4sMkhe1A==
X-Proofpoint-ORIG-GUID: Im8eX-PoM6NDFN9lv44dYWlpD6w9PneY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91822-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 508F3EA5AD
X-Rspamd-Action: no action

Hi Konrad,

On 2/4/2026 7:14 PM, Konrad Dybcio wrote:
> On 2/4/26 6:06 AM, Praveen Talari wrote:
>> Hi Konrad,
>>
>> On 2/3/2026 6:18 PM, Konrad Dybcio wrote:
>>> On 2/2/26 7:09 PM, Praveen Talari wrote:
>>>> To manage GENI serial engine resources during runtime power management,
>>>> drivers currently need to call functions for ICC, clock, and
>>>> SE resource operations in both suspend and resume paths, resulting in
>>>> code duplication across drivers.
>>>>
>>>> The new geni_se_resources_activate() and geni_se_resources_deactivate()
>>>> helper APIs addresses this issue by providing a streamlined method to
>>>> enable or disable all resources based, thereby eliminating redundancy
>>>> across drivers.
>>>>
>>>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>>        disable_irq(gi2c->irq);
>>>> -    ret = geni_se_resources_off(&gi2c->se);
>>>> +
>>>> +    ret = geni_se_resources_deactivate(&gi2c->se);
>>>>        if (ret) {
>>>>            enable_irq(gi2c->irq);
>>>>            return ret;
>>>> -
>>>> -    } else {
>>>> -        gi2c->suspended = 1;
>>>>        }
>>>>    -    clk_disable_unprepare(gi2c->core_clk);
>>>
>>> I believe you can give gi2c->core_clk and desc->has_core_clk the boot
>>> with this patch since they're no longer referenced anywhere
>>
>> Sorry i didn't get you. Please share more on this.
> 
> I think you can remove these fields from i2c-qcom-geni.c as they seem
> unused now
Got it. will update in next version.

Thanks,
Praveen Talari
> 
> Konrad


