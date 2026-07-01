Return-Path: <linux-arm-msm+bounces-115706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id syESESsTRWoQ6goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:16:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B68EF6EDF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:16:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iv1Oi8vp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JEci4UhC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115706-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115706-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4AD3304A163
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5AB48167D;
	Wed,  1 Jul 2026 13:09:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2F5480DFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:09:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911379; cv=none; b=Shhx+SMfuvJR9Amg+Is7ZlcUZONGkFjpVs/bITSpZH8Uuqnl5fnuCtIEwsR0z2e3Qk/f0N70L0S5V0EqO4xviy9ZVFGEzGXZAb8HRHwzhK3bRQwRERl7GU46+KORkTP7c6WUg1eao8hpk0Uv3LDKdxwLtpfYofbQx53YShUm3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911379; c=relaxed/simple;
	bh=YEagMTZbDFzDpcyW8xwkh7BaPiHT5dfhcaP/2DOM2fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2zzjgCNxFNDb+cDxAoaR6uAtA5qxeKF9qmQyzuZjyvAJxo0XZ2D5WFe/CjNE8rKqnTQ4+fXm8ffOFVqglJOGG1wHtFioRL00CJduMplnW5YJ+uGzsoRUHZiRxsF5NpRNySdhJTzvFcMpHt8UAo2Sg4Zpxv7dwcDH8/ttq66R3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iv1Oi8vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEci4UhC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Uno672922
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=; b=iv1Oi8vpq4nli5ml
	1Q9t81EyDDy7VVZkFid0cYuNfWDu5H07OMGx9T1ewmMItFFPOpeLcxfF7529EhWC
	vpZiMh0gNo4B4w42RVDngLOOXPr5yIZpQ7orlwhYRMfEPSJWOdwQQHfeQMi7o4qY
	W7RgrHWLMok30yLU/T1LkcXLJB4gz6imgBS18O3EQthPfdBHJYjbF6iCU70Uz79b
	sr+1qsrhjET1UGe2yG0h7poaJxB2ATU/Sz6WgL/Gi9pUqJrPXIwtB4cDo1Oqbtgj
	oBSr8sVSKRcFBGcsJE+xLjepUrMSgL+Yts6WZ2R/xhVrqg4lEBshGQP86awOlSHp
	BaaLqA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502uryck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:09:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd933e15a8so14333e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782911376; x=1783516176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=JEci4UhCoQ6QJQLHw8pdIk/clEgvhZuwivrEh7o5hW+TF08fuEpgBAgo83yz+60fEA
         E2honA3wxeoSl4PLlPIZCfWxl/VtWAPg+h3P8cHdt3Laq8AmlNuuLVOO2mFPfz0Aylhv
         4hoIlZALk0gaLJyg0M3T67LiGkTbmH3j7JFKO6En3RVR5/BNdDc8NU4bW/Hyyfb9brXg
         KPZ4+b2pYgurupuRwWs0gj1ne7kaw9zt+66cFOVDqlTrGGoRhei0lLEkKcW18negAYyK
         o5fEfYCCctqPnXuZWf+OROOjQ8lT3vjXtkP1Vewp71LNVsCuUSyq8YB+CpXhg1HQ4HE2
         JZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911376; x=1783516176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=JqKGwcUF0MP02JpQHlo7L7qAKY5xzIGaLqcLeCfgZ11eGrFS5lnEcNpAjvuuq0fTbe
         OGmQ9R9WZEByGwn4M5vtswLkpvDS8AUHLGONpg8/aYH8/GZcPqbuu5pJPktLeEA9DzqA
         +qOEKB7mInG6xfgqyJOnlPvpo/12sikl4XCJxqXwRffbkGOaeCIFe+xH9rhjd1nBk+KR
         rnBdNZmDIB2DmZsi4RanzJ/Owr2y0xrRWI9unvMY/im9DXn7aW6dXFpJU2NIBP6/bxHI
         XYvqYFiggrtuE8FuHoiwaILNwtz3NNbR4Q4Uzwv/UNWdxi19UIPvNt+VcR6avD8Y1LLa
         /udQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+lGXxRKh8ao/RzQft1QSeCQszNk8w26wRMCpOX241kfRVqZgCMKaBrUODXSaibt/gFQst++sGLU7icGiQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcgmwgr5tRfrUFG1scVEpAPDEWeAruYAxq8BFNYpdHwlY7XpqC
	koDB2I4JVKynH8rakSO5j3MwirtQ8/y8ucEZTajBMZ162pnSUX3Q/GqcCfyygRq5jB0omeb6v71
	EbvpvObm4cre0jI4Unoq7O7yusKjADyjUbFiAba9dZmYpFy/c0OXj+Z57HTrUHHdDgpgH
X-Gm-Gg: AfdE7cm78LjOF2S5BJ8URQm9gSt6kq/RL/VrI79LUyEDrYGYdOo6YN+f2Hh44pttaS6
	bIODUgqgmUA2mue2rUA2gbunRUESaCQAL20HxfBkcgFWwYffeZK6UOeyOx7ibfC9UNVWnE7cmUK
	Ba6LPxgafzqY7YbYiHOfA6LfZgONsEiQOoC5WC23TC8R8ucxlIlFyOKfLKxnHb9wdryJR46Xy0u
	JUAXxxPwokj2Ut9BGrkSB8TwdQlLq5O2zp8ivJunDR5puVaFoR0z22t6qgrleguswz1dUmNzENF
	/Jc5UALrUijqO5JzDi4zJ6BKD2MaaEWlQV9rWVyIkdHwgcBfkl0m+yzEDPiz2/oTiJulZOqgce6
	Y2gsKpOdajsdfzRcG8tz+Y8O27VSOHmNRZyw=
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185653137.5.1782911376370;
        Wed, 01 Jul 2026 06:09:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185631137.5.1782911375950;
        Wed, 01 Jul 2026 06:09:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm2686116a12.30.2026.07.01.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:09:34 -0700 (PDT)
Message-ID: <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfX2vwklqADDF1q
 h8YoC4Z0WvWO5HxzldA54wDn8BuaPOjmUgZnMjpDaA+nwKNweY6AtVyGKkdcPbMOgvOd4M3+wxg
 RDhTmhpddHEAPnz0miZMahrVpVhDToI=
X-Proofpoint-GUID: aLHpl9toCQuARQNqas4S6y3rnQtKjJey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfX99QlnMsaM6VQ
 uyAy1g2MqX6vEfPHBnQbpJlNxltFb+ocOcciTfms1n/tZ3hAW6kJDt/ej4nXZzU7xRmT67imd+i
 /PK+kdYsWtW6FehShWZETMX6CfKBF19DbsYlCyNxgRmBI8Lov9HmxW3WWcaPnnlXSJl6pWwTzC4
 /HALhe5v+M74xua1hmSbth3DcDS+bVBdS8kHOVUl0VWPeBpRVP5JCOsc2L4EhPdTplpLXoVQUJe
 weREgqAoW+MUvey5aapS7BN0DcLUHtHG+4SCE+FjiRenFBgN/e99XLX6MbDJE/uGL2YaYKy7BIs
 +tF3jBcsx1QlU7JVZfxWbB4xPixCa3UrT2n9CcyG7zPePeS/UkZ9uowno/wKqsFITIl72O/SucS
 XwW4WOMTLH3GRgT+9NLUpHA+6l11Mw2V2x0T2S5WRl7PH9CN6HaINZHN6YNXNljR+zpoITznCG8
 xjQahsdD7Mx27AWKgqA==
X-Proofpoint-ORIG-GUID: aLHpl9toCQuARQNqas4S6y3rnQtKjJey
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a451191 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EXNCQnpXykppytCkcAYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115706-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: B68EF6EDF40

On 7/1/26 2:54 PM, Jie Gan wrote:
> 
> 
> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>> AMBA bus.
>>>>>>>
>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>> created on the platform bus instead of the AMBA bus.
>>
>> [...]
>>
>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>> clearly distinguish this platform-specific case from the standard
>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>
>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>> I do not see there a fake, duplicated compatible for the same device.
>>>> Can you elaborate how is that relevant?
>>>
>>> Will fix it by removing AMBA related description.
>>>
>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>
>> Why?
> 
> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
> 
> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml

Well, if you need to break the bindings already, might as well on
the grounds of choosing a saner ("clock names shouldn't include _clk")
name.. Not sure if Krzysztof will like it

Konrad

