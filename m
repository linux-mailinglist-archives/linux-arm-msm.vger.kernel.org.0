Return-Path: <linux-arm-msm+bounces-118289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbCeBCLvUGrl8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:09:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F873B18A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:09:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="O7rCEYM/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P0cxy5lA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A17543040C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C3942DA32;
	Fri, 10 Jul 2026 13:06:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3B42B742
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688781; cv=none; b=fLfEqSAM2HmLlQrW+Mg9qiVh+n8eHVuSxl0kxaWCw3ilDreC9X7bAMmhnmcYWAlK6kHiyD71sqcdNKuxKryyCfRhJ5lOYwHWWso5LvzGcwuyt5a6JZ0ZyzMd6tdmBQW1+MaH0d1VJ3KOFPKj097C6eyA9lR/WynhGEdAdY7ediA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688781; c=relaxed/simple;
	bh=em54vEJ9PrEPpDnl0vnmxMcxJEw8fCkYyJApLvA7sh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNZM1l3NeS24wh9X0yq1b/lqrDORlPJp629hiBGyAJhsTlk+yURAftVQfbMW2t0k1+GvdOFd6YZJx1UlD4gA0jVJXH9t85i5gq1HmzPrhrG2gkijK+KnNsNrAYmqwqZ79UxIfCwugVeI3P3jt7RcUZanstupFR8ccEQMTuTww9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7rCEYM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0cxy5lA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnXk1571220
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=; b=O7rCEYM/iJpQzbAc
	qv/kJFREIvyk0+PUUNJk0WvbI0GNr2tuWLy3DaV0AcQhgMfmPlv4olRQ0lcPEPLi
	xAlK1h0I1Y0ynxWTVIzJrmB/XCPkZrw5SgNqxl9I4i0qLyhZy2LpQC7R6Sp0Xmo9
	rbCNTZcGm+5ER/0juePB/N+JlHrcjRhZORhFtDKKWCPqBGrPseg35UO0GJdacgXy
	93LkZfUAd0eatLKJZgIbv5aoF3rLfdfVRlMsKkOVlpTDKtLfaTXcPKlLHvTgFaxW
	XJn0+CXUJkUdga3uckIKouTqOJKEAF6wTml99MKPs8htBIqCrojhFZfjri8W4Gim
	2fA6jw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8hgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:06:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so1624192a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688777; x=1784293577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=;
        b=P0cxy5lAfirJ9WixyzcBOXphQdVltYW1zGI/vUtaQU9atCoLgVA5AfnYhl05yNukrs
         WXL5Sp0yKiMnEmK2fiPybWn79OqQd/WTXMZ4ZB/RUWF2lpprEZLkwl71Q9aBgoSN3Ad7
         9Q6Gn9GrAkMmSkv0kveOPNv05X+qM0pQyDWVKRuJ/3exgSS3frmHe9pW8GCSzEIxQK35
         UxIDfGUh2MWpkFc+BTzxRfxnLEe0q2RrydOW8sjIGuxhV5LYvznWlgRb4fPytEbzXPqR
         BwEpJJuFl/oyvRw0VKoNxqtkzj0d9sgLA0eURHdj2tztbikb8KnCUDRQNMknoDvRswy4
         w8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688777; x=1784293577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=;
        b=QQvBiOKOO1FOFc7nySuAhDNEfB0cLgiLxrV8HUq0vDnfFHRz+smAXknHmelHAAn40N
         wjcgOxzaz/l4xl9f1Xm3lJj/HvrdPLg+nVDoeHSezJ0jUqTfKn55vlu4i1wOSbLbOtJC
         E8V2+AJnfhmIZwbkjGU5FOw7AnLDVQBd31CFFVXbg+8EFRbzvWEG93wQjpXlLzBSH2gI
         PBarmLDBSy1QC8eO8CfPbdC8y3dvIOJ3RJZrYZozB/ZB5FGty8XmLUmbHYNhctaFbijN
         u2efHfkecbVmyHgPauW2JKTQ5U/MJLwrF1gwK4UUIaA0ty3716utqfjkHrQ7S9V1WRwd
         AKyA==
X-Forwarded-Encrypted: i=1; AHgh+RrORSojBqMSOWljZPizW30Zg/QJ0ZWk5V+bZozqnMtipNc+2wE0jXP0/XogocBT8uiJCpvS4lA/wFIppi9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlxUH79InNiUGe2CdSNAA884wFonXC4BI734a3Lz1vWf7igKT
	Vqvk6PaqIm/nlizBNiVswTpeKBbRpBAYy4Rt5wbWCF+/2b0nO+TIAuUxxZeIPsPZvjUFzAsZvEi
	eS6uhx0S3d42ziGny71Qm2dfPQrdDRKgaN26ff4gi3LLs2pOcK+t/2vWtZjyPmgsV4Xmc
X-Gm-Gg: AfdE7clRKvBV0LtfvqX1ysXpB2NvhxYON8cRtxRQxEYECKHBUXgiWJz+Jnl2y6TSJ8Q
	nRpqihZCNySmg3O7ZMYtRRKlacyxyO8Vj0LPX9dH7Hm2RuLvSA1IdZZjpuHP+uw4/+43Irxtcxh
	ThhFUuGVnc9DOuZnbZnYeUYBhBQ+EwJLh4Vi4isDyJ8Bf4I6GI7NFTDC9vVleV47/1AWyINC5+W
	phXdKhh6emIXiRlCOuaepN3VQMzBGBTQTRZns2A6xRPgAm0eAf/YNE4dmPjM8+sneQpxxEfTACh
	3rTNL/WiUEXy50rabDHtyyHb9+9B82g6rjA6qvDbUvu+bH6pMwMwJzCzlVeV+YbhS5GHB0AscVz
	ar5TzHNVPWm0FV/awwEVct//SP0+YeAvCtO4GCu2v
X-Received: by 2002:a05:6a20:b78a:b0:3c0:9c19:65bc with SMTP id adf61e73a8af0-3c0bccde08bmr14615434637.68.1783688776990;
        Fri, 10 Jul 2026 06:06:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:b78a:b0:3c0:9c19:65bc with SMTP id adf61e73a8af0-3c0bccde08bmr14615390637.68.1783688776542;
        Fri, 10 Jul 2026 06:06:16 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm45048813c88.1.2026.07.10.06.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:06:16 -0700 (PDT)
Message-ID: <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 18:36:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LzfOukiOKIQxuZVvlehpcwUVA_9p4-jv
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50ee4b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D08nViSs8J4lS6wn26kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX2OUF8rmZ2Ht2
 CaBV8izgHL4zckSQRZcnCNsbl7h/YMPvXRJiZkW2Y/I9ZxYDh5V84MXIMM5c9l5Xgd3Ptf79pHw
 V6gt5sjdcj8pkkOLQ8LT548E7WJ4qUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX+eP4EfeE/EGL
 rFMpMD6V09YPLa+5MKVBYBOtEnZzjnoX5IxqTfo+wF5C/6T5KcLBc2Nlb3H6VYPMT/aqbIUfoh5
 S47XHkBWaW7Q/yH+8GJp7FCrdu6jzrzM8aX0oqfhZpw85sQyhHQ28g6zCxQSWGQDadpAamboECp
 q26G4lyQcE6mNB6Tg/xPxQ98FAFwF61nhvkKynpnckz1JSwcXxjxuvUMqYT8/81JyUiXshDC1FQ
 AvMsPlJ4EcKLXT3VKbjOi8hEv4GXqjAGzcng36gcFI7WKOHyPKVUMeIPyYpwts0NbqH+AIxmY04
 cv+v7VnjIHpD9UWTobK+RejxljChZgnvlsy8aZU53j3fv4rZXiMeRyYVsm0+Io1+mAOp65wpBqJ
 wc9ussZNI2xvzWJ0n9vGh4ACR2jlvVSnP/gjxIC0LXNN4uo4yZ1UWj1k5GxE2DJegQj6j4h3b4h
 uQi8cUvfLUi3kn5u/Jg==
X-Proofpoint-GUID: LzfOukiOKIQxuZVvlehpcwUVA_9p4-jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A59F873B18A

Hi Dmitry,

On 7/10/2026 6:19 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> Is it an actual GPIO going to the panel or is it a regulator on one of
> the daughter / whatever cards?

This GPIO is part of the daughter card, it is not going to the panel.

>

