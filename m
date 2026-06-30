Return-Path: <linux-arm-msm+bounces-115474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j0ArGcnXQ2ryjwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:50:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C906E5934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:50:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dzd5CTwf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EHrVV4AS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 367AC3086246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A02243900E;
	Tue, 30 Jun 2026 14:47:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85F8410D09
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:47:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830874; cv=none; b=ujgTE0IOqjq+Q/91iuwnBpJ3aEHV3L7pz1rplWnF6ta5IqzPEkJ8rfyddR5cPcQLDAb/ZCUykVZEAxjhJUMNjVNgIltcME8xBBbAIWkwxcuxwEmfsS4mxRN4kqgPRwPlU9wMIanWSmgU/x3TAjBHeM+V2QX1awf31fdFZAWdoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830874; c=relaxed/simple;
	bh=a67mJeNZX5KrGqn1ekXxXkpjh2tMKqBaoHlEee8u8ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgsSKyb1x9iXsIwgo7z0xgcsYFOjnpVKiCVhDghv8HMXyVQWMvPCz/FIca+RE/eIA1vd78N3dSBs7wOJ+l/4rRwzlr23eFl4HN0NJSXRFbCkc5FObqicciw1uMcq1p+7wXUxFnYCtt50MnZNHiUjUGIq/L2XhdoaBwjJvBFO6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dzd5CTwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHrVV4AS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDK1H2128904
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=; b=Dzd5CTwfdNllBZOg
	wiydvEVqE0o4mIcuAZDuSzXpHMQhngLUtu9Ia0EMoz+d71o4uVHilfDFTmNJYaXf
	tkujPdME9brquKY0IH+lzl8yTBu6uSz+yMqd7b9/gLnRVcvd9dlNhSh2DIkzlABm
	XvISyWTFDV6jJNTRnZ4aOJkLUaIrZU5c3+mYqH04NMQQDuQc7RakwOgsIsHPu0xA
	cmTfH97Pvw+mrJXK+VU7pZP/oP1r3Oty7N25dK5lEb5YGQpDAlBr1FQnp/CoVOdO
	Q8oN4ugNYU9kZwte/lPwXfeEEaj6mrhcP6Q2mkkWFdqjNOwCMkqhMIFcGAWHOAH3
	+d1KUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93xhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:47:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5a63e1f2so26421785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830871; x=1783435671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=;
        b=EHrVV4ASbn1dkw9BncJKV293dvWQ1DSqtfEo8dvBQCek33UHbtHH7P4peUjpw4LnEC
         1yn3t9wEsQhs0jPLoQbhehRlCNJXZJ4obrljrUiCh8iwePDi7qrG69AJb/YodR+HToQ9
         E7I0vTykuivTf5jbzA4ZzXcgqRhSRAebXl4658z8IaR0fvu+6qSUFCL6U85zAdzidRgV
         jG3zxrX7aFoptLddbc+K5cszW//1Qw97BSEPYlyQN5L0wusLHIdaHYkY167wvO/BMCgv
         w1DUT5JVkk6SpajE0iknkaRlhz/Acm1/W+4Dby8bb96EPptR+9LXMib9PRz9mJYn5Jas
         TOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830871; x=1783435671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=;
        b=pMt+8y4bbq/Yz0bg2zbQvk9/5dD4tCsWF0eCDweZaza//62VybNI8OfRYpuvy/oKUe
         n17a+ej4W9MjHtsK/LhJaNPpuabHhxtbyNVeFxPmB6O2/yucXWa12TcZMk3iTTHgtc3C
         XpGwWj2rkEF8y2IXNLkTYIujgmPeRJMvWeqOUHgagImP7Nvjnexp03t9v7Sw1n6KQ/c2
         5NlkQJaqAZvtFZH7lQHInApZI9wocwitPvE2+upyXH2/BrfIOd1ilT0CXWxbnDcDAimU
         mWMBzrVVXZF7XslODennypfW+FZahQ0NEiDxZWaItIoMLI35Euo6ZLRXo20rL6OFsy8H
         3L4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9liU7ZIyRwLfRZFgwbeArzDO2SFFHUxEHCXZk7fdYZxGf2UWM6M1tI+VWdioep88ac2Xn4aufShvuaRcvJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsv9u8rPweG/CuH5exK+Lf0mPfPy+0SvC4y4Dyh2c+3EYsHrMm
	jlH6h7MNiCWJ7u5PlJYZS5MwFbpQzqPVFBls0xTjldc8MNgsKD1SM1e9zeXU6TbT98KHgfuzzoj
	VA+KnFKpf9dNys1TlfXp7w6nS2fUWrVMadqxVA4b4kE5NpL7uD9Ywgx4iAVDGeNVH0KLg
X-Gm-Gg: AfdE7clQ7yMgT6xyJ7k1fkKnaAJ1BiNHeKr36z8mBk/0F0TFIP+0KVTadhNYdOGyjvZ
	YwaYMjuWUAm1OkanDy5v7gVGopIOcxP1s44c86ccNWiLh6kNnh9fu6Wyws0AX1BysfM2Is8RpdU
	9JeAkk5VigTSnqrTtLMUOyD+SY+8YQD5Y/5KJqj8AStTvgkYGL4KK+fyzfwY8GN6TlvmwvAIjls
	2GgM7OD7khsBy1lCAs7T22tOTjce0e2o9oDABkRgZcoOTLL6hsT1aU5N25FPqXVCPyr2R+pijoJ
	S730M8VHz9YI6MPedU3fyhEjmzF4jNk65qvQgMHMEa2OGNpzx1xV/PrfiSgHfeweqvWWBp8HWTQ
	H5BWHZDh3rwEK6hzKRbfRSB8eXgnMLQgH3Lw=
X-Received: by 2002:a05:620a:178a:b0:92e:5aa8:a4d0 with SMTP id af79cd13be357-92e627f639cmr370760085a.8.1782830871151;
        Tue, 30 Jun 2026 07:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:92e:5aa8:a4d0 with SMTP id af79cd13be357-92e627f639cmr370754985a.8.1782830870603;
        Tue, 30 Jun 2026 07:47:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c3aesm144203566b.47.2026.06.30.07.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:47:49 -0700 (PDT)
Message-ID: <746aa10f-65e4-46d0-8db4-bc6314343f9d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
 <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
 <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
 <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
 <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
 <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX1eQuZgApJzfY
 ArCiujS5HBukoIcsjNdhe1z4WoETCx2hX6ijz82oInlxYIXzVDem4d3Ft5O27ct5Rc7U48yFuY8
 0VEZlEONums2TuRC/FtHUTt7zVHpStM=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43d717 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=lKQ-AihTAAAA:8 a=EUspDBNiAAAA:8 a=ynoDEsPQ24qRF2YoZ5AA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-GUID: p9BBNd7Gvk73RdWl-1NUyRA1AAFrVHXq
X-Proofpoint-ORIG-GUID: p9BBNd7Gvk73RdWl-1NUyRA1AAFrVHXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX6OTFZO3Y3n6B
 vfrZIWZdBvMHSnGvm5PYXzjSqYfYZylxWsJZMgcxGDDGYG+hnZtQFlpKmUiJFEiSDuPo8NRoJtQ
 f6hpAsFBmoIjpHC2YuIDouOMpGsIDVUvuyNBnunnb1L7iVDzUPVrAux6RBPoY+glkcswnX7tqHC
 1ojfwa1ejzKZjwNsheY7hY0fIOTF+PzhfkZJCmpdEE/bJmDPo0vwSbqvsrUZkjWE6F2GEsb52W7
 te7Lt+PDAkyTrsq5t8HbFRG43X6hoKN3iXZS6dbg9ayeK4frus0P+MLdmp3iZ7T63JBbV4fRJDF
 IhqYMr4nRgUaAW153azvjOpwHpfO96LBd56e2dU39DHzRHezcBwmvDRC0SXbtBZk42RUfq85kw7
 6psrJlpXBvy6/IzQFcOeWOamnl0ZYQ08AUKMYWD9e4gEQwEMRtI0dkSBGiqtEq7LHo95cx4w1sd
 QcfB8bwPDs8FXXMuM5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115474-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:me@samcday.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samcday.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C906E5934

On 6/30/26 12:51 AM, Sam Day wrote:
> Hi Konrad,
> 
> On Tuesday, 30 June 2026 at 8:39 AM, Sam Day <me@samcday.com> wrote:
> 
>> Hey Konrad,
>>
>> On Tuesday, 30 June 2026 at 12:24 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>> On 6/20/26 1:15 AM, Sam Day wrote:
>>>> Hello Konrad,
>>>>
>>>> On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>>> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
>>>>>> From: Sam Day <me@samcday.com>
>>>>>>
>>>>>> These regulators are marked regulator-boot-on, but that doesn't
>>>>>> guarantee they'll stay alive as long as the simplefb does. Adding the
>>>>>> explicit supplies ensures that booting with MDSS disabled doesn't
>>>>>> switch the panel off 30 seconds after boot.
>>>>>
>>>>> Why would you boot without MDSS if you want the panel to function?
>>>>
>>>> For my particular use-case [1] I'm trying to avoid taking over the display
>>>> hardware entirely, and use simplefb until kexecing into the real kernel. In
>>>> this case the user might halt in a pre-boot menu UI for a while.
>>>>
>>>> I can also imagine this being similarly useful for "recovery kernel" use-cases
>>>> where again, it may not be desirable to assume control of MDSS/MDP/DSI blocks.
>>>>
>>>> [1]: https://github.com/samcday/pocketboot
>>>
>>> Can you handle this by adding a panel = <&display_panel> property
>>> under simplefb, pointing to the display panel defined in the same
>>> file?
>>
>> No, that won't work because display_panel is a child of mdss_dsi0, which is
>> a child of mdss. So if those nodes are disabled (which is what I'm trying to
>> achieve), fw_devlink will defer probing simplefb.
> 
> I apologize for spamming you with false assertions! I just realized that
> fw_devlink won't step in and enforce such probe deferral unless the property
> explicitly ends with -supply.
> 
> However, I tried your suggestion and confirm that the LCD_VCI_3V + VDDI_POC
> regulators are still turned off by regulator_init_complete_work(). Since I've
> already embarrassed myself once today I'm not going to attempt to speculate as
> to why :)

That's the way we all learn!

Looks like the answer is 'because nothing grabs these regulators'..
At a glance, grabbing a regulator reference is strictly tied to a
struct device (and its fwnode), so it's probably not so easy to make it..

Konrad

