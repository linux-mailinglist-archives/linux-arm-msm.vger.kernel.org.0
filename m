Return-Path: <linux-arm-msm+bounces-117126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SpqoJ/6PTGrumAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:34:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD163717796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:34:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=goKEBfAs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BIHnlfEq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 990FC301BF4F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F85C3859EB;
	Tue,  7 Jul 2026 05:34:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328D318EE1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:34:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402485; cv=none; b=thFxdgFWVk4eRrGG9eRA/mP6LsMvFMiecG5D0kTUZbemxD09+UMy3pWFXsahY4jASfkraj/movHIT+FexZh1jtlHGUBZeM0Ny3kdvkrWi/FI2Ya0p/i8LGxJBF8kh+WGILaMwgo7qA4aL1LULv8l2munWT6lMe+H/t7dunjyiWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402485; c=relaxed/simple;
	bh=6gUJmEQ7gh2OVod4PlGCDo2UYQU2TxUMTLZmwW4INZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUFH8l5WEHACGXe+mc6lvzlDeLO5+CK/USSQi8PP6KGIciy4fLw40Oa2TdkxMDtqiuOfq9ez9FwUmiq/ojYVAHLRZv51ZbW9a5098Q5mSF5ZAJb0bWa2vjlgP8RApsxLYCVxkNBKs6aiwP8WTBl5XHXxGnyn+kkqeDttqDFLm4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goKEBfAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIHnlfEq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749JYo2658352
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=; b=goKEBfAsewj0Z2Cy
	UGR1y5P3xcYq7gCpS0Owxr6dGO+uI1+0NmVs2aQ4qQ1azCJn79x28aNGe9xUAtVS
	ot+dTVw55poQ0RfvHkvhyV5Xoa2pxqcbZF6+gBKN/nB+WMqDfG9HLLzFmPMbsiyH
	OfJ2EBdrE7HVwD8ttZzsw2VcYR7UhBmcTNVSDV4tnTkBsa0/I6pKqCEKKxJmpnIs
	b5KLFUHwqI6Wv8dVn7+y5L4eTJN76rUlkd2HOqmjVu3HS+Kfy5dM+MgQHb/bzMCD
	JfHIeirUnsTXwPE0tzD5EKp516daVqJiz2BGvz/xc+2XKMCRneSXIMQk5aFSKYYV
	wlNdtg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r47sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:34:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so5961504a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402481; x=1784007281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=;
        b=BIHnlfEqDSAfhCTzHDFfekQXEkoHNzZm0pGt+DCZae3xC65P+3zrdFiNSjJwDrzeaY
         qjqlFKRkPKHGCdfylhoQJ7R5nIFdz/6xQ2huhpNKzUD/apN0tmOKE9BBAKBMQ0fhdl8C
         TM325qzAbFRPgbAgOYdo1Z51oBZpIEuR4BbmF5SaCROTh4qxbqjaugKvp3EMXjqcQdAa
         BIwwLO4BRHggpLPFapOReFUsY/BgP9ZSRF2QaxwR553I0NJyTw7f6EU/cb/yCV3fInbk
         cQG1DXaRxjcf1Bukmau9GWjm5psGAblB4Td/sqcKC8Rlz1N3QIwEXIoKxhKuzkxzBGpv
         p03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402481; x=1784007281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=;
        b=qdk5oqzjH9eaLjt4vl/Vq4v2Q0pQTMkF/HFcTt8JWN2kX4ddXGRBan3/zKb3X+a/qP
         mDxPFXuon9AEwePc9PzSuwe+Fhb+EDKWd/3AsDtmIkW+Jt3RxtGnThhaGOZlRAl4e0yC
         7zhvJXpuqjHdk/heBv7f99RoB6hr2PkT0vqYrcmOudPj4zG1tPJeF2zGtMOSbKPWh62X
         LLOK4FkysguQDjbC+ZK4aQj5e6IW2KSWEXO0wIIlDAk1W+FFFpyTCRw0uNxgh/C2Mfex
         4++M/CzqITpfsPaKC1FVMWh91FZfahuUrjy42M0tbZWzCupaWU1oLP5U0dKybI1e8860
         TDIw==
X-Forwarded-Encrypted: i=1; AHgh+RpTu8em/45gATEHnDP/4sCslTc/dG0aOl7SR2d6vxZA2A1fmAr3+Px8HqTWbY8O2ellrrXNP4yOVidpJxLr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrc9CqbxN2WZjS/SitnnvE6xtYtrkUKJGj1OA/SDi8UidJ9C3m
	f20zw9Fr10CdcG+FODB20kU0Mk1FakXyHRnwsUyJ+v/NWb6ks8uq5SUx1P8hlxuksju5QmPK4W9
	RGET5L4NFwgdamVLF1vAR5m+G4aE1k7WM/vk09n7+Q7PceRfQ/TY5J/2SrvsT4T9zbqvvD++fhH
	m1
X-Gm-Gg: AfdE7ck3V4ZRO/o9ubG8xfUJfjEyIf4A5kJoqckZzilecZZeyaNu7wdjzuGJsPyhtgO
	tuI9Ba1GbRC/ymsARawaYshbJThaKtVEuECPIuPOg5D9zZKWEsJAdUPIsInWNjW6880wqL4yxku
	q1UsseJL00HkKWh7pazU6tkx9Zf9FOt3UV1RlYj8BHYfDOeIwvpBWnnCt3kyGXARUd94V/DjdD3
	LrEbaP1kqXQJ+RKXB1w1LqdSpOk4dHEhWZ+I8YYgUuT5u6nQH4ODckKEmuql01QT7QGTwVv7rre
	q360ZQkZ2vEqSRiVY/SflD1j0DPQggR5+3w2iMZAeSEU1HiKQVDZhGFT15uia1IcdY+B52AL3hA
	1bl6H3feJIncmzpbPvh0mm6ED9/BwlxOvFbsOB5WW
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr4691644637.54.1783402481077;
        Mon, 06 Jul 2026 22:34:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr4691604637.54.1783402480647;
        Mon, 06 Jul 2026 22:34:40 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm398917a12.14.2026.07.06.22.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:34:40 -0700 (PDT)
Message-ID: <cb8f0ebf-8afa-45dd-b2fe-724af7e0b73f@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:04:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
 <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
 <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MCBTYWx0ZWRfXw+7ny+60mn/Q
 3I81z47raPVuj/FjIwcWrZVF0nKtw33zppSLiRd0ULJgjV6Y72LiQznNubf2TVlYEdw5PcDuTFV
 C5G+oJMJBi3Lg1g5kb9u7ZdEtX1j3AyJpcmN4Q4CQIjzw9N7JafI+qm2laOq4vJfCUPDd9dr96z
 USbPRGI/iVBIRTtEHWSSKqwWUjnkCHV/2H6iqBkYWK20iwq+7p53B/oL85dTq4Odh95OrOxltaE
 Y3kuJMNkJnZkCLf3+LDTwCqW1BTMvHLdgJUjmZnqkRotlqQI4oYL48JZ+bay26JAAi4/M7Z1lxx
 QclC7U/UHmEae5kYgzcUu5ww20kZJMDEep/BNXswh7Hl2q5oiMkZrj5XXIftsvpwY+H9pNCAa+Z
 jobIhFqglKOYdsBEgNvRl0vL+AY6HizTr3bjszMXxxqI12nCth2d//NIuhyBNcFEllUK4Pnimxz
 jBhybO/KmR5ktJ8N8Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MCBTYWx0ZWRfXwKaSaJXUUqfv
 UY2ooe97lJA4vp0rQp284sDigAThSTDMP7RK5bxbiSGC1hbIn5TaLbKW37FpqA1PIPOq8+247iW
 fXDPD0U2ZS1Po3yuwxsDRXgAPu4T6z4=
X-Proofpoint-GUID: PP-QVdBpG5a5Vls6UOCctW-VcUkJ0Ogu
X-Proofpoint-ORIG-GUID: PP-QVdBpG5a5Vls6UOCctW-VcUkJ0Ogu
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c8ff2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FNHKQYERf4qwuPYjk0kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD163717796

Hi Konrad, Bjorn

On 6/18/2026 5:50 PM, Konrad Dybcio wrote:
> On 6/18/26 1:58 PM, Harshal Dev wrote:
>> Hi Bjorn,
>>
>> On 6/9/2026 12:06 PM, Harshal Dev wrote:
>>> Hello Bjorn,
>>>
>>> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>>>> Hi Bjorn,
>>>>
>>>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>>>> Glymur has a True Random Number Generator, add the node with the correct
>>>>> compatible set.
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> index f23cf81ddb77..64bbd5691229 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>>>  			status = "disabled";
>>>>>  		};
>>>>>  
>>>>> +		rng: rng@10c3000 {
>>>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>>> +		};
>>>>> +
>>>>>  		tcsr_mutex: hwlock@1f40000 {
>>>>>  			compatible = "qcom,tcsr-mutex";
>>>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>>
>>>>
>>>> A gentle reminder to pick this patch for the 7.2 merge window.
>>>>
>>>
>>> Another reminder to pick this patch up in-case you've missed it.
>>>
>>
>> Gentle reminder.
> 
> Bjorn and I were both out at the time, after we returned it was too
> late to accept new patches.
> 
> Currently we're halfway through the merge window (where Torvalds
> receives pull requests to create 7.2-rc1 out of), during which
> contributions are not accepted. They will resume in ~1.5wk after
> 7.2-rc1 is tagged, targetting 7.3
>

I believe we can pick this up for 7.3 merge window now.
A gentle reminder to pick this up.

Thanks a lot!
Harshal 
> Konrad


