Return-Path: <linux-arm-msm+bounces-114980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QlE5K0VLQmrs4AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:39:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD16D8FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ChuY1yxS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HQGqoUrk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B68EE30056FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487F53B993A;
	Mon, 29 Jun 2026 10:38:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAC38F930
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729539; cv=none; b=jtqS5fzwFazq/vAWtEaKpiFdUgidG3Hth2Xc9bwqZy+9CDXd/AlkpEt3nJCEZAZggKrcN4JiVgwws0RCqMJKqirlW4TQbgp6RoPjqfMO1jOd+ShMXJqXWrA2XwvLjm+1ZgMKxQI18KcgfuVhNcWMlhNpTle8o5Rr1GqQ0BccKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729539; c=relaxed/simple;
	bh=LrE7fbEwnME9lt1owyrkD/f+XIylRcuGgyJYKdiDMvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWvLDFFlBYVv74b0ZYZVFjUPWqvD+SJhVPwL46Pfo3lIwlnTRmngsx5fNfY9Sem8DBhD2nmj6HfBRCkI+WExw9fI/6/MiMPu3ja7EMy/16hRV1IU76PR9g3GEe6ru5D2qJcrMOKJYXgGenlyn8nGTkzWG4JbWHH9WCr/wTpCk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChuY1yxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQGqoUrk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCXc2647685
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=; b=ChuY1yxSUOvRuk29
	FEuoaA9QVruZzXPLjk6d1n/rE4QwSQQblX3J6wmDzRU9ZiKwakBmBSeIms0fUNCa
	8tSGQTIJGmJqfzSFkLkS+MxQn4HLPJYNFtCQdSo+aUkeY9gk5iwmz1gkP/jNT+3C
	Hp5P86epwvPhybfAVA6rdwsi3yGJuoABsp9Pf+UXce5B4ebEx7x5wu2DMMZ+N8cg
	6rkkaN87uDxGntGx/szi3NHsoCjJLIVi8vFEp+VfHBW04OJyTuZ+EokW1LBy7t1A
	wVKsVSUuD4eR3qJBHr13n9BrZ8HrxxP0denUU1rD5HFV3p1F59FDkb+G51G0+6v5
	IU+wsg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgv9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:38:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96920484543so79509241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729536; x=1783334336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=HQGqoUrkaxNTzGJ/V95q5AsO0uvCzyeZYPldYZl+RrzT3F2bSjtcNcuAcdyOhrIYR7
         D3meodJmFt1BCKoU/ym8olaXxUXLCZKwTcD8L0edTNKhD1XztkvrlSADmKYx9/H5Nliq
         GH47LOhXRUcN9Mkw/yraRdPjMo6fruIPQ3iBGkuNyYjB1lCrkRl/HV7XMFoF8bSH7HrZ
         bvsknIQ9biuJDD+EPNPTysvqjcUV9NQwPETR9XSmKPuk4RXftxBrs+ddsFVfohphzGy5
         pXnL4c4wPq5XG144Bxtwc/ZcSdyZYu8GycH+HdT1HXVs6ehAYz2XcYU0xCBgwe62XwSP
         TanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729536; x=1783334336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=dStVFusMwuuBRx3gqCrXa1YD5jx6Q8oC8SI0S7ms0UTv/pn7/o30LEDGpCH9lAz9nS
         HQ4oDd31gIiXL67PMaFluBFwaaSERxjEJCWs+wxsKMgQ2CTE/LsOquLEB5Eq9SFuWWVJ
         adF6jvazdDvwBW0068ISSjZ3nof8/WnPcDQWqSPmIq5dRIFTYI4gbsHLV/9FursB+f3Q
         nS/AoXWpv956UonFScA2a2zj9hW60HnaiP0ftbnktWmSE2bOHyzN43m+iBoxXawbJIfO
         +uk42snkOE0n6fWviXDGENDuoN83V1ONIhoQ4d9/L41WUSatPV4SmgFqMd5lRKFihB0p
         ek0w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3qrz/5pfTy25/yZ4OHdt7aA0/LNa/BKJ2qtsQDaCzrjPIDSlSqHRzc6jSXph0TITaT6Rn9tS7BZ2rFTNV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyro4LcBe1mYvONUGlW7QcQMnqDUjQ9jVxbQgtLRNr60FGebKCo
	JE+QLzLq361bf/9NvKN34Esajvx7xyEdEbM9cFIhKx0m6O/t3FqoTt84lnt1TktCM8zXT26AGo8
	bLztz+Ov/aH3IoDNVlAyjyTviTYj/otJC/BO7MSAQUY5ZqL7nt3Z8wr8X/X+6i61P2Efs
X-Gm-Gg: AfdE7cmgqvaE/62Kr3SQdM5zziR171p7mGoYSHAXeCl66rFprl3U6c2ZuOIbkvXHB+J
	g0jOhj6LOdMs5j0zr2BNwrGkduAmcSYLQl6//A6DRYT71V0TJ+mCsdaRoJpjrXfd1xLPN12O3Pu
	WnUowC0C7p3fOqrl7F5vomwntU7+yYoRB8/h/cILorMwIwGq/YvPIcevuhDtSB1LuzfvmH4h/eO
	C0X7W3J8k83eLDHAcOrZDcS4S+fX3TwKCCmhdYqYktWovBDCrazYH4phn7ezE6BtyJoNjbIL7WM
	tKwsPt5ZyNBuQfJNSRfSo6eXih1lk+Ba4WIvKM92hHRvpuGUuMowtwyEvNEyxtF36d4tw2plheN
	ycTYDrhzbmEUCC80SbQuWs58BsXFy+oyncX4=
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557580137.5.1782729536378;
        Mon, 29 Jun 2026 03:38:56 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557574137.5.1782729535994;
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69870eac1f5sm621852a12.2.2026.06.29.03.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Message-ID: <b8e0711b-1e02-4860-b80c-bc99757181cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:38:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
 <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GwzK25RqHoUEIKKM51g8E3BaIMfcrP1B
X-Proofpoint-ORIG-GUID: GwzK25RqHoUEIKKM51g8E3BaIMfcrP1B
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424b40 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kbzcBev-Ug5g7ovxFVgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfXyI/raxOvjtF3
 WowcM0VVIu6ZhKAC+SrBOIxBAS2vy4ne58/2EAz6zrcbKz1J6gkFKaCIiNh4eoATkryn7rmSZOJ
 UgUiu/IuU6jA4QE/zOnu+xXvqR6GKbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX+4d10mnK+Z3i
 PbsQx5zCSn+sRp+8uvouebExK249Ri5HSJfHiX9eOH2E75WCLAjEortARKoEeNjCH3RhyCSPuum
 7v5TPypwvnSyBdbRWvYCXnX3r+Md0XMNefgEC/sdgPQZcMXqwhNI1Mrc6/N0C89ZvSqOMHmHkS4
 uFgb+UgJP/hdUwCjMRgzOwtppIQv7sMxm8/kMoQTCb6H3tWmrEu6phvzlPAwLvE43r5ShlVagVm
 FM0BNUkKkWZScg8l6LlzF7VXiyKnVUqcfXzcDWAJNtgCejkwwEMZdH8cm6YQ59NTTLlWzu2Zj+C
 5KYWDvKMN6VViEXFTN+OphHysqP7SzJJPB/4i2hy9QGQQjvX8biR0nTRdZSwaDQst3iX2UvMSlp
 bmKAN2jYL3kyiARs/6RIonk1VKOyMO5pINTO2nTzWbv175gv7KEzjq3T2RmxRqAoG+jTUcxMQLo
 hkljpg4f6t3GiSNo8Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03DD16D8FC6

On 6/22/26 3:24 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> The TCSR clkref_en clocks gate the QREF block which provides reference
>>> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
>>> and refgen blocks on the CRD board.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index c98dfb3941fa..92b929ee3448 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>>>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>>>  };
>>>  
>>> +&tcsr {
>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>
>> l2c_e0
> 
> For COB, it is l2h_e0. L2c_e0 is used in SIP.

Right, ipcat fails to make a distinction, but schematics agree..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

