Return-Path: <linux-arm-msm+bounces-118295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hQh+GQ/0UGoC9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:30:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB4073B445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JFrGLyTK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DASIEcSY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118295-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118295-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6592D3019C92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3960D42A786;
	Fri, 10 Jul 2026 13:25:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC3423A85
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689945; cv=none; b=h116fdhOiDcj5dnUZ6NNtVvIRosbSF1uSP6eEa+8vY7brEOfODbGwTTCN2+O1Flvw9BdYfBSZ5Mfm6QHv8DoPC0YyH9Nh41orZYfeoiJ0U0ZO8Jvk/8A0x/lldFcbyKLrt4P5WdFROztMjiApeuJzu+B5aVpVUMG0PIQliebmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689945; c=relaxed/simple;
	bh=kNoGRkrXSexDoLIXzxRTcUzbyek9qkP4JKL0P9V2Qzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=my4Y3JEcgf9hyqKJ8Y28BD3T86yjI+JXiixXg7rZG2486uwoIqy4i+mUFkLqSgR20yTdn4Y5BHEDPrTxElqxG/+DE2FX9J1zQnnaVqjBHPQJi7eUUgrdqoThDgT09C+rDCi2tpXkLGnrO0XxFC0JzyN3rV8npg59q9pgoWTOSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFrGLyTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DASIEcSY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7Rsi874429
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=; b=JFrGLyTKe0GzNCTV
	69/HesZMfdEvUyfl/L1J+JFJ+Ot6aqQBpLM7kHMUDKnSFj5ZpC3GnywVyIv3ul+f
	VbFWhuzvJYI/IDLM9qtD8zs2Px0nFPR8mIIUiGeKjPVp3S9WD9oq5RgZE+GAAqlR
	MuYj3xIa1Y7KojhN8sFlBajy9obeufFnb7AKcJ4GmvXqp7FQu6hUQF9LwuP52Biy
	uBqqm0GBglu0kyrUiAcY8FDRFCWbD6NaXnd1tCA88LBfaogRZBQz1wCbGUsxH/cw
	cAcuSXOj0dyHAB/VoTVBNexqmmc7fDR9upeQU0/qyjFDI4WEMeSFDYdyIld3c5A4
	CiqxOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8knx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:25:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e8e83314abso3233386d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689942; x=1784294742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=;
        b=DASIEcSYkK5s+vqZgbVcijkl2vfZOI8djTbDHzoS7paUz92wpKePmF6tALGUDImFci
         NFYEDvFGf9GqsHBX9i+5QyY7o5Ca6FAPPNMpTIoNre13AqORTO54xWWHSzXboSLk4YFG
         gIy1oKkESKrBHHec6vENeOAbQ/X5CiffBoNZuUafsY8GhlVT/wlWy/U4kcl/T7/QD4ik
         pBH5zg9yRMQpgwX942R7/QwIo9PwnC8W0x78+OPKXvST6OmFY51Osu0O/dauRY1nWeK/
         r9/KRotZ4bbQcit+i4beAfDhlzhwu1DmwLAAD9aFHV6TzXrorPPa7G7H0h4r0okau8tY
         adwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689942; x=1784294742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=;
        b=oRaPDXSyYoRi//UnEgkbLIfjTNtIfuO2lj14qy2RI2Z66Gq3yzsCocdNDL5QAGQ73s
         /XYjyHy1uBNvVANZEUBKZMGlAUFq5G8raXYIW749sxITgsljunYuHc4Im+kr3Ct/Xj9K
         ZDe89FAn3kFlqY+1+uwSbcRU7qP6w3QVNFP/3LD7UdOQ+plLs28uxDteGJB7WlfXR+iV
         fMCYD5szji2ssHvKyijnRpDHLPl8rAclspW0eUEPzLsXhVArGhP8E/8gUe2cdf9iMl+6
         ZNbfkDqTpj/wdL6qagzyUvRJtQzv/Sz4NtrfqqSmOVO6LKr6wfMKfgGHIHEq7ktW0dZg
         kH8A==
X-Forwarded-Encrypted: i=1; AHgh+RoZXjO+rTlyuis/0RKlAl1n7CnA5F1mkGuMAPWl8lWPwA6Up69AP9vzEqCGtCt2gHwE4CeRCBOWDk0DAyvo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4RtQfUyOwufG6PIKQ8zzfDjdzjMxPHuMmdC9CY0aryJgP/1ju
	gDGu4HrnEMDJ0uHu93ByOrm5mekaRk0GdDZZzqxWK80gGU2g9qRYWIRr4uBU3/WJdeb7nR/YG6e
	nPpycAuvv27GTFduYdzDC5U/BsS3hJsyEOX4TdGuoOv8Wg1yP+lUFj7HuZq0JixU+1PdTgw/eQX
	5l
X-Gm-Gg: AfdE7cnuv6UAEIjATqIdO+0N/LqJcs7g7kPc1CTrB0XZOjPFjnGI8n4c/6thzUhxnDy
	WMwa8BolRSIyy4Xt+c+ZE4AuevVKUCWKYPJsFzcn/k/+oOmqWs0Kj3fyHTYe/iU3SkrAq7zwg1A
	iZGo7Fd0z0mEh4xr5rc82ZJ5TkGWcsD8S2aItJK+8JJ4ZBtzJejx0yNYWKHxP74NQgt2Fu9LJZF
	jlJDRhFVkIBjoXPa2rMWLPy63rXh1IB/rPiiFYCyjRnzJoR4880xk1gNxtLxChDoSqn9mCN5f8n
	h+1i0oQiLH7JruYeuu4Ncpi12OdC004UFAZiP5RpVA2/0r7ia3fjzV1CEop1DlgI72efRk0JhKM
	s6F2QkEaRIa8OufUCKtERpBT892p7/a/eRJg=
X-Received: by 2002:a05:6214:440a:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fec6244c20mr100585456d6.4.1783689941867;
        Fri, 10 Jul 2026 06:25:41 -0700 (PDT)
X-Received: by 2002:a05:6214:440a:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fec6244c20mr100585036d6.4.1783689941392;
        Fri, 10 Jul 2026 06:25:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm5449418a12.0.2026.07.10.06.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:25:40 -0700 (PDT)
Message-ID: <f83556e7-dbb1-4926-a2a0-4690cdbad941@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
 <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
 <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3WgLaXp_TyowNXMIKqcDnw451OpllhNP
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f2d6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3ei8xVDPt9LJxyTjLcQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMyBTYWx0ZWRfX/uhgVvWD9FBK
 shed3crwwVnziDIz9Lc5XbMXAbVCtgzcqCDM+ao8lueMBQfYppe2w/0cL85X2FnrzGKKYyfRZVZ
 Ajo7L5rgGzHvzyt1tXy980dRwHAJ02A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMyBTYWx0ZWRfXwoKVIOPsEMBc
 lCcIFewfoIXFOlWHI3B/kFKDDgoXclIJr5RLPmIEqc4yxagunNbbKM7Clhi7/Fe2+A//fnt5gFf
 jmrRq0/yrwrzDOKR2y/aSVPhzzSXb1gu8araYFF59jZg1USVAuDurEbd/Cym1cbVb9aCC6+eb+Q
 ZEOObKKJhDk8JLQd+Rma5LS31xjb3v6jPgWnf4L9/h9CQNJ3Ibc5Roey8nK+BAhl3X+SAJfbFfx
 AB3AsxCeI5+JoxjPFbpgbLFlqqrjqrgvM7gn7Fn3YEytrN9VV1jmjgp9SCAPjqKak8Q4z/szEcG
 US5crXcUbf/WytAv+fc9+eOoYpGPKPjTA4C260fKLypZdO0FEVAnB2yAstM4a33Y76o6Y3jW+LD
 sCSvE7DCWDo1GQWAKkPmtNvnj5ChSoLi5AQpesmAoRJYGud159EHLn1ojQwwtXQA0agICdK0DyA
 s4Mj4jHWWxrAlAFtoUg==
X-Proofpoint-GUID: 3WgLaXp_TyowNXMIKqcDnw451OpllhNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118295-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 1DB4073B445

On 7/10/26 3:11 PM, Qiang Yu wrote:
> On Fri, Jul 10, 2026 at 10:44:20AM +0200, Konrad Dybcio wrote:
>> On 7/10/26 4:19 AM, Qiang Yu wrote:
>>> On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
>>>> On 6/29/26 7:05 AM, Qiang Yu wrote:
>>>>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>>>>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>>>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>>>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>>>>>> nodes.

[...]

>>>>>>> +			linux,pci-domain = <3>;
>>>>>>> +			num-lanes = <8>;
>>>>>>
>>>>>> Is it fine to keep num-lanes 8 here even for configurations with
>>>>>> bifurcated PHY?
>>>>>>
>>>>>> I would assume so, given essentially this is a x8 host, whose 4
>>>>>> lanes may simply be effectively NC 
>>>>>>
>>>>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
>>>>> never enabled at the same time. When PCIe3a is exposed, it is always in an
>>>>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
>>>>> num-lanes to 4 in the board.dts.
>>>>
>>>> My question is whether that will be necessary - if yes, sure, we
>>>> can do it, but if not, we can conclude on this early and not have
>>>> to fight over it in a couple months
>>>>
>>> I think we do need to override it in that case. If both PCIe3a and PCIe3b
>>> are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
>>> will see an 8-lane slot. If an x8-capable EP is connected to that slot,
>>> both ends will advertise x8 support, but the link is up at x4. That looks
>>> like a genuine bug from the user's point of view.
>>
>> Do we know what's advertised on x86 PCs with bifurcated lanes?
>>
> On QCB, it advertise x8. On CRD, PCIe3a is hidden.

No no, I meant to ask whether we know what the userspace gets to see on
e.g. an AMD system with a bifurcated slot. I would expect that LnkCap
may report a different value, but not necessarily. I would assume we
should probably mimic whatever that does, unless the spec takes a
stance on what should be done.

Konrad

