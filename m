Return-Path: <linux-arm-msm+bounces-111348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76YQMz+cImqhawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:51:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A46470C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:51:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DLUofgIv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="N0ikqW/I";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D587A308ED56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 09:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E633624D3;
	Fri,  5 Jun 2026 09:31:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB43B71A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 09:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651908; cv=none; b=rXILmYinGPaOkoI2h80+QOwXTOan+Z09k0BJCGVRnvysMx+9vUu9vkCA7fAvFlIJfU+3B0iO6RXkVvh9jJVALluHwvrwDxV7Thez1hUK8lAZqclVMbXOVadiuj0YI8O92xPlJptjbgGslWhJ901/xehWrC4Fv4mHeB8xd4rRv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651908; c=relaxed/simple;
	bh=rSBT6+TAaqF35YqT/4bjC92zShTEGzrRj1LcNNhqYfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+fFOzycPJWWwAamkZLx8qoTpzSoOdW1LcNdwDnDKRih8FxyqwwnuQbROs3uk8a8IED4wNFB05f970esSpwWFDlovU2ZjjHnoyDft434vxY1O7BYi8gxVol6PkPIskC0WbQy2wKJGpDiveeD2eKX+y5j87LmhfzyqHC/P4gPLhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLUofgIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0ikqW/I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65580OL3528629
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 09:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WS/k+wgA9f1OsJg8r3jynZqlYrCdT0iV++pL/dGGg9s=; b=DLUofgIvQAQhGNfk
	/bKNuE2nUQitTF84ttk/YBylz57m1wTszZkdi1GBu2287W6yPg492ZOeNoQhbULm
	2AW9yCLCHWoIsnI7MhMZfFa3wT8SzhtPQ0S3yiWcHVF+TGcG/nRSPRlQxRcbl8dS
	9Z333gDYiRePLiSLI0zXtMiSKZQNN3SwqOSeMwuZYgkLRxptDs8g19Snp06+mnRV
	I0fOQ43Cnb4GDveSrgaxxdfJjftotQhQG5R7PmYWqQCZ2aGxN4b/rA43z8zJy2Zg
	Efw3YeeVdd5tSkdrpItZWi8o3p4tAQFfLbw0K9X6XJVvxy20tlXdYH257Kt+rMhn
	3PWF4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdvafv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 09:31:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf3636d6c0so20254385ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780651905; x=1781256705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WS/k+wgA9f1OsJg8r3jynZqlYrCdT0iV++pL/dGGg9s=;
        b=N0ikqW/I6hbzgvwrUaoJuLnyGC70cviNNDfoqHwD/kNgqrymuQBRLsIrnXhKQbJsJm
         WrO5DAUnj/0diAwtfjQJbB9mYC+Umj3sxx6zC8HxxvhFXQmEEadulUIPNZeJaJyfA2jd
         uur9pbKHKF50w6QuJzX1jdVccCOoLdi6krTcGQNRVAg7A8lcKKct+aLxbzhHozTm6RoN
         Cen8Qp+tfXaXtx625KvsuxBl7Fye2UI4sEQVL2lNFo3jlTWdxnab+N/zmQgsxhpK57CN
         pEgbTMZ0EFT7JoNfxh+LCv6phhqzE27pxkVKy217ZoyfSusx0veyRABzGebTRl8t746S
         KZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780651905; x=1781256705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS/k+wgA9f1OsJg8r3jynZqlYrCdT0iV++pL/dGGg9s=;
        b=TJ2PBQtvHGQwyTdkGz7TXOwtWQ+T0gL+iDljxkjIX8uQaNDTWXdNQDXFryXt3M/9Yh
         T+z3cDM4S6Qt+K1VLiyL+4TKcK7jaLgfb6kcgqmGlSGLAVfmRVp0aewGv2IbD/Nbt8b2
         mJ2bzkNHXYuCdN3HXVeQ6W43WJq2feCDWHQ4mS6ZGuoMOUntkT32qsxqPsdrLgvvgkhx
         ZRcEMqcD880C9y2qV1QtfSr2PV6stUAARjqg5pwtvA3RJi0JWAdMxx64d2JVERapyAME
         NXxaPR/ZXjizcvTed5F6PPUYOH+bqyb00eAIUxXxk1kyFQRkev0DjhFs/HNWKcGBglHs
         /tUg==
X-Forwarded-Encrypted: i=1; AFNElJ99prNKkpMaYwel8masGt+SdEapjRVbuD6x0vLqYwpzOvEWKfWI8T2j26GMZ+kvBoQGd7UBZWfcQiwuVfdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTfxugtAg3iFEYEZK/PiRXA1tgBk1ii+FUallSANvTC+EiXsH2
	yaNFcKnvLvMIIl0scvSaj+2ubbvr/C1exFR/m7VrmB6PjHA0t8ozx7eGdkSQKwVsvrY/kOPxefz
	c5ANHphj7pYBuwbRl41vlX7MwI/B4SFBfJxpvA7rnDYsLMlY9GWO8yHZWKJuILzPXKrLP
X-Gm-Gg: Acq92OFuWho3yi3edcKUVX4sBNzbDjWB9AaC9X2uqhXTRa+z4L3mJfEl/xrnzM0LzEm
	oNPL7h2mNPRlXEfDEMtozEXKFvi7IlTVJb1x6gCIfok1JPC5JXdyX0uQ6ApX9R2V+kUe5p7Y+U+
	J9wtPGV6siZH9uZRUgHzC32rFdwBPRH6kvmzoSS9bpiJDiqEXQuPsuo9LF+DR11BNvUn6h21+lo
	x+0+I27k9QqmTYICTQuWA4UKfyW+x3XBzvSneBlpP8f7ZAcFsD+hDfnHZYiAqyUGDRVAXpTNP1v
	rYLpyL/A54tmmdDkfQ3EIU7ypHswSTZIVirn6wc3ME40rZz720yl4L46HU91Wr0c5r8c/e4njk8
	b1UKwXwDFL3S6TCkns3p4G2XicXeXwsqiP7WBBvm/QeCN667aSw8M4ZGDHvs2Sw==
X-Received: by 2002:a17:902:ea09:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2c1e7e6eee0mr28231215ad.16.1780651904872;
        Fri, 05 Jun 2026 02:31:44 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2c1e7e6eee0mr28230645ad.16.1780651904247;
        Fri, 05 Jun 2026 02:31:44 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm91534805ad.36.2026.06.05.02.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 02:31:43 -0700 (PDT)
Message-ID: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 15:01:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
 <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ve-dJBoVidlvMvE1fHLI1Jc6u_TWpP5j
X-Proofpoint-ORIG-GUID: ve-dJBoVidlvMvE1fHLI1Jc6u_TWpP5j
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a229781 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=f6Fr6PdTwcyk7UrtzrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5MiBTYWx0ZWRfX04xWV62HVXmz
 DRMcNkzZwXrLakSm1jXvANUe73gK83pYiiphuvtBf9lP9WIpGkRlXG4AeDYKuNQwUhc6jEkWZ8b
 JkGVkfLE4/2YpKPl7JAF+rCGKaqpoQV5444xtxho4GdaYvg/uGAXYdf+WLEjg8keDjGIx2JCE7W
 BPeMrjemU3VH5ozF9HPfHyyG/U5djnLnqT7WULTew1/9blDU3dRrcEvaYka2EgTVa93LzCt+xZT
 rAEALIYvDCTcS7+xCHOMPE1IxGpn/9d2zVrZalQsz/MYKyiW0PuBtSrJTVdIEUuWeu/GbTOUMOw
 NOU1SCS3NHvQrYFSNDzLLe6Y0rPU2ghlJv0YfXPwH5uCTidgEy77vkdumTJUOtw1CFUAyMFQn1l
 nYftUvBxjognkc7wLvR3J5wiUtikVzQ05CXjrLnAJQT72es1fAfmYUuZ/E6ig6zFqBr4MnIwX0J
 t+W5kNQuC82kXKf03nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111348-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 206A46470C7



On 04-06-2026 03:44, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:37:48PM -0700, Vijay Kumar Tumati wrote:
>>
>>
>> On 6/3/2026 5:57 AM, Bryan O'Donoghue wrote:
>>> On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>>>>> Are you sure about that ?
>>>> Yes.
>>>>
>>>>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>>>>> CLK_LN of some description.
>>>> Split configurations explicitly use other lanes for clocks. E.g. check
>>>> the RB5 Navigation schematics, CAM0B connector.
>>>
>>> Can you please check:
>>>
>>> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
>>>
>>> 0 LN0_PWRDN_B Lane 0
>>> ...
>>> 7 LNCK_PWRDN_B Clock Lane
>>>
>>> ... just a badly name field
>>>
>>> CSI_2PHASE_CTRL10
>>>
>>> Bit[2] = IS_CLKLANE
>>>
>>> Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
>> I can check this with the HW team. Although the SWI has this knob, there may
>> be some limitations to use any lane as the clk lane. AFAIK, only two
>> specific lanes are clk capable in DPHY mode.>
> 
> Having clock-names property doesn't mean that all values are valid.
> 
CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
- Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
- Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
- Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable

In combo mode, only LN6 can be configurable as a clock lane.

The lane-enable computation in phy_qcom_mipi_csi2_lanes_enable() uses
BIT(data[i].pos) directly, assuming physical bit positions <0 2 4 6>,
but the DT [1] uses conventional indices <0 1 2 3>, producing 0x8F
instead of the correct 0xD5.

This goes unnoticed because the wrong value is immediately overwritten by the 
hardcoded 0xD5 in lane_regs_x1e80100, making the dynamic computation effectively dead.

Could you please fix the driver to map logical lane indices, consistent with the gen2 camss convention.

[1] https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-5-1d5a9306116a@linaro.org

Regards,
Nihal

