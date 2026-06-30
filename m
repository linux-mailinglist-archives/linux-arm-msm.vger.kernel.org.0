Return-Path: <linux-arm-msm+bounces-115396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 86UOMm6wQ2q5fAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:02:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15066E3F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DO3qbbbJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dfoxEAvH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115396-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115396-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A2EC300B529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E6D3EFFDB;
	Tue, 30 Jun 2026 11:54:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431FC405C5C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820448; cv=none; b=GCEL4/BznD25CUTlV326CAhrCGl5svEvuTTkt+2z+sgV1JfsVbr+Pz2+ZTkZS2jS7/WztDAs6ckDjOH1ND0+QeChjSsRGDQwJq5gbOeqa8623qVV+nXUOdQDHQogVgVakyIGQvDoSoLUj2h6v5GdNXPaOJuV8jyYBnxdI5CPii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820448; c=relaxed/simple;
	bh=sCoOHCdwVpbOi7KCDQwm1bQrC9mGadQApM85xlrOiVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oN4y7ZalIHHsBwl+868Jio+V5765CUXqxzOSVWh6aNIWaaXsnnJd1bp/+2U+LG1Pywbw+QrOgbcjuloo3rzPaDRuhay8uMqkfqxLDJhin+058PW6WHgM4Fgazf4iVUel0bxe08KZ7QL3PzUWU4Qp8gBvxc947y04TY6h2+yvVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DO3qbbbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfoxEAvH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mn6l1602558
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=; b=DO3qbbbJwkSukCwm
	SfvW1YqLoPb3PTjY5MjCJRrkenGOqKlMUzkuYy/g952vtKnyvLQF7hoS1g73grGd
	QmGaWuekXEHBGPaLUv/03o1V65sbp3ryVKn1v4KdYZP5vHIzJvanHfTr3s8gl0Wi
	E/PDFVT15nYn7Ccc0hNS1uPw+rj+xEetE4ssogtnjHuJvk21pX/rW+4Tm2zpkfRS
	9r4FNF+I83ZgCyI3SFXjziCSiXGWA7QlOtiYzxyjhCuKUDMepazI6MFbC6hEL92o
	09fS8pgjTci9Se+m7cNXGPkza/NwnjhcJlWATAIH1oZ3dJuAkS1v3C/Aspz0aoOQ
	jLSy8g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprqqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:54:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd933e15a8so172125e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820446; x=1783425246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=;
        b=dfoxEAvHaI9lyyHjQDcrWYT8N/qO0/jS4K4wEJ0+rgcfKd+ra6c0+IhZKIRqApDQj6
         sAbyMyObCkliD4W25eYyEIJo3gQ8aoybqhAALtiFiXc/91OyMLlGECWrQ8YvLLhQ3qGJ
         WseHuYSTsrb+HgvwstcMcZlpIO3cctcwkbLFMMPz/7eoLTHxxXdj5p/ADCXBpNdH8nGw
         PzG9kz6TgN7gL7fdoQGaD63hAd/rmvOcqzuQfaH8wyUejk6FLgzEsKMiqxW0O+LixKjH
         o6LODYptVTuS6jBuzI8bLgbcpFVAi3dmnV8hM/ah/KnBzm/9FmZPyBrx6ICmZCzAeMIg
         3Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820446; x=1783425246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=;
        b=PE9X6jMjMYDB6onzuMmiGWqSD52uCVzYTnWKRC6R2brguRk5YatHDdRUdPfiGAlSkH
         wAJKCHktjTShNn11OcjIkX9sZBHz76kLQCkdB4ucpAms5cCviHloY+FvFmPKqsfaJWxw
         7fttnZv3CMM5jlO76zLwWtympauFjtI5iB2s7OIWpSDLDLwhbZdWhvHqG4zG5yT9j6pf
         YOhoI185IYueZIOSCzPB1NnZWXVSTV5t9UNlzLyDb0oMc6bxt4vxFQXclNITEiAa4Yzb
         MpwLBFK1j/herwURtiu+2OjRQpqVbk78Q5/34gbdzV3HR3r9mIw0h3fcfnovigVwTa5C
         LE8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro84t1cC7kAKqsbZUFpibDU2jibnJF74SJDEd1KBuuX2An6GdYPe/SzuKCBUn5Ekko8kUgsLg7YwMk/N/Vg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxep+YSe/326l4TEGE8gd4V8w4pO+ZGFRO+pUNrl2gKJNFu3zBo
	+vzxOxRlQuNs9ieQxfR+K/Q/UiLb2kwSC4GU3Pv9QLXz4g7TJCjXPYzHMbSR0ByklTK49slOH69
	RAUmKvhyb3tQ0K1/jfEQmw8BSDRvynYJ8la9D36NQp/S3hK7ntxGAasTu5gV1bAmCrsoH
X-Gm-Gg: AfdE7ckUGpuFHyU+TIO5HLvQ0kLDIfudQJQZMEs5LFeKIjyApyxo1dAxlKv4ObJOo+o
	ykthmsgI8m9u1hsEsp8Jlo2oDmu9Vj7Zyr8YvAYKGj406CF4s8NMgQoV1A99K30xD62PhAUob+D
	rJ0WYU2TNhL9b7Sxewn3xjkAvuGNsHM2lj2/wzoOJcz/Uq5eYcdTelgYMCM74jeSu3Ao791H2Km
	WpA3gaIGqLKMpLn15N9QXMRMqpV4bT5LajX/fCAqnBWlPCFhvmpdFGsIKOBfnTp6f6YSgo+xgvQ
	nkCWHfWjkQfQrEIsRvDrFaTgzUC4CaEAvnvzMW394/yc4OBglbQznBdfbsJEQhw+Wu2gYXNx4bF
	/+uAQXXN2fNsSYcx6V5LZyszTbumdmRUJsUg=
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr470003e0c.0.1782820445456;
        Tue, 30 Jun 2026 04:54:05 -0700 (PDT)
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr469991e0c.0.1782820445026;
        Tue, 30 Jun 2026 04:54:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c988e54sm1020131a12.29.2026.06.30.04.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:54:03 -0700 (PDT)
Message-ID: <e3d73853-c547-4db5-bf65-cdd6dbdfaa9e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:54:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
 <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
 <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c1WtPyjgMhngOQRzRTZP9jpDWyIJP-iK
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43ae5e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PltcGWh7eTJMZvgHKO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfXxwMxVsRL9kfP
 7RCN8AIDOxCFV/3mmprgk5r/9dAQNxGMVoIW0oVgrYrMUiUWLhtnBmDMAHcGaW7Vi3dmTK/H63X
 vlBQjojWP+zer4JLYnhg4MA55uL752JHFqkgUGAAKfM2WTvhUvgvrmKnoDaW4lx9kZoFYM/qvQn
 MFX0y0PwV8Bejkdcv/Bybos5WahzNsCOoeQy3pyh13Id8ZsFyeApK7cAbq05I0ZNdls0S9hBAcH
 2JQvPChay5lMS9x/ykfxIxNnFikdb84eFz498iAI0FRHPA6T6ZM6SXYEi1ouNPzXg5ChWN02BHC
 +7VPv3NukeUe3spBxbUACZY5XVdQuOfVKDmGAF/9i1mrkrETmfedODZSFZayx7mrafH0dlwksSt
 BvGkDpgfBSyGSqT6wTMtvjjeJm5SFnXGOghnVlMxQv3F0GvPBjFFVZ2XLWl4gsAux1H1gLWZPI+
 9agoYEUjDnLNYf8P7wA==
X-Proofpoint-ORIG-GUID: c1WtPyjgMhngOQRzRTZP9jpDWyIJP-iK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX/PSTeNDEodjY
 NQn8Z2mifgLHc95EIbVv58vdeNVbzJTIvxUcUjatE0nFDos4+doNXIWmXq0j0/yQcp1xVff4sKT
 ABcMppKBJ4scr2oRs0uKqt6/yfyEdvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abelvesa@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15066E3F06

On 6/12/26 11:25 AM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 02:15:55PM +0300, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:13, Konrad Dybcio wrote:
>>> On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2026 14:03, Konrad Dybcio wrote:
>>>>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>>>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>>>>> value to make C630 work in stable way.
>>>>>>>>
>>>>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> index e41200839dbe..e6c67016552a 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>>>>         status = "okay";
>>>>>>>>     };
>>>>>>>>     +&cluster_sleep_0 {
>>>>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>>>>> +};
>>>>>>>
>>>>>>> Is it better if you do hack in a
>>>>>>>
>>>>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>>>>
>>>>>> Any clarification? Then I can try hacking it in.
>>>>>
>>>>> This will send a message to AOSS to intrusct it to prevent CX from
>>>>> collapsing
>>>>
>>>> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
>>>
>>> Yes, that dirty hack is supposed to help us understand why this is an issue
>>> in the first place. Especially since it only came around at some point
>>> (although I suppose you're not really happy with spending a day bisecting
>>> when exactly)
>>
>> A similar patch has, I think, always been in any laptop tree targeting c630.
>> It could having been a disablement of sync state, a removal of cluster sleep
>> or something similar.
> 
> And gracious ping.... Can we sort this out somehow?

Just to leave a note on lkml, we tried and kept finding more and
more issues with missing votes etc. We'll follow up with some fixes.

Konrad

