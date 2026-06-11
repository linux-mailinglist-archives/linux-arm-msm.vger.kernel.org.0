Return-Path: <linux-arm-msm+bounces-112722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dM1IJi+YKmrYtAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:12:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE285671326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:12:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HrsgcuV+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MYEe0vyC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18158336B6DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7B3DCDB8;
	Thu, 11 Jun 2026 11:09:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B2368D79
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176165; cv=none; b=f8t9EHk1aWlK5f/c9Of6KFcWLrpAmv8MQVGXWSgv1PcqFIGgsHmgCt9fO60aTn1gxTOmpVvRa2VStOjr2f7k+vWToeJ3lw26ep+rTKs4tn15qcQHlXrGiNFzS9LPu0sERGRfK6HXxswt/fIZuYY22yUd3uC7nBerksqX6BQvil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176165; c=relaxed/simple;
	bh=4LDLD4bL2RKuEubdKyGkbcldX6+fZfzLzJAR5i9D13k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSvcHr7sbi5reut5kUGtcNOhHo0i4JYaaz5JLo7z20y7/u28ZnP5sjwU2jNvE+fQ00CpWnl2P4u/1XIg55004yzobYv571f6y3ThIL2kPyGH35MTfPmdMgS9yTCRApQoi6wYVEnxprTKmfjuQZz0wbq0FeTu4jTbrAEd7DOsLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrsgcuV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYEe0vyC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJm52890211
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=; b=HrsgcuV+xnXdPyEk
	BtYiOemFuW3XN6tCBv2B/Log0zbYDuh8Krt0kqC876AiV5bFj8ign7oDErGAhHJk
	ll7aHj/nY4x8VnyRHnz3Q3UDb5viZXdFR/zsFuOTbStKm1iOI1u+Q663P4qqaO2S
	rEZq7J+LkXcUOpa5hYFEgwjqsVGLJ/BinzlGCFKPApTIf+hEBrXPiuOXJS6BLR4N
	HAiW6FNwX8m6ixpp0kbcfNMUjtIZlpZDGOurXHBpmhNrqDdO7FJpEWlusbXCML4a
	LoVbZljZ9mJxdutpyFOP3O19LnBU9p0QBnck2ge2ig9OW2eeyDk5h4t6qJYK6ObM
	FrUMqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k1tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:09:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so16323821cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176163; x=1781780963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=;
        b=MYEe0vyCWutoLlWUjF3tcrRyXIc+UtcGtn+nN1/FmUFEuJM6cTw+EwY/6aBvuSMhGK
         8lvHDKH8F7UBZtpttvszawSDRldfO6KOPSXgfCJHX5li6KFHbPhf3fPO+Zmm/4sOndap
         vbhPfs9ouvjK2qsJeApl+ThcsQWu8YR4mX0yKuuLbIWkiLIa/VsL4E6Gr3ime1B0Jp3c
         Kh1MqffWA1q/RmdwdBNf2P5Q5XSiGry18dFZF+uaWsaFfFz56vdi3yh30k2Y7ZbYBNr5
         cuMNajcPuCl2rEK/TgHechEghMyOXYIqnCXCVf5ox/bBbdpt9oeEqupzrqHYM0WeUfmv
         HC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176163; x=1781780963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=;
        b=msszIonxOxEQs6pjTWFbJoVjogQu1H1d6gaFmG6QBulk0HVmFLK2qnUxKdpdVf6RXI
         Y3N7O4FOBadNVjY1AqkUJApNvZY4/fttMpQeqSpTC6T8WxWAT2Jkev+FapT/5rGJNEjR
         c+dexYJz8Q1wqhV5c0hlEhfRcwa8o0un2gLRIhg+tjn6G6vEolze4TtqWsEPY358aTN9
         vK6kJbNKyu7rBb5xQBfuPZSOZ26ZMgpvSBrtLyUJ2MEvl5wOiFHXezij4XIXZFvpfACr
         lcVmvvnxhl6f0RszFDh+afp+nILwpOF2VyoV7uByams4UwrhM/ZOzzLMrBrReIRgu+Mp
         69aw==
X-Forwarded-Encrypted: i=1; AFNElJ+lmyXBBT0OjPZ/78Hl0SsqNxREefsc5H0LcZeI0gKq7K8qLCpJ+TOZN8EaoGjzirHH9UnYB8yOMxOMatqx@vger.kernel.org
X-Gm-Message-State: AOJu0YwEa7YzNHsL8E7C3jDCVsuvpEyV6LIsKBmeyYjgg8fRvYO8HKcR
	z8WZ98uzhCv9uvkV7FN3k88ISeYfndO//wQuu6kpwAhFv0upf7UbXjW552pWrj79203vQEtFpov
	xLYMIGkbsIbWxlPk35JF8Fcxq2fqxOBrMz3FiPXAj+N8hovVvedGjPQI5FmW11f8rVAx6BhD2Xj
	uY
X-Gm-Gg: Acq92OHgw3vVRCovEsQq7w+6J/RYUTlGTJCsPEJ6h03Umrl5v1WuSyyDHbG/iAJwWc0
	obNxxvHWvVjE4gf/RAmDiMGB+DVU6qKR90u3agLP1Pljob8HFKMWNmOhw0VeG9iN9e09FMwsUl7
	WgdMrcElj5wcSKfmenzbSYiUplkND3niF5tlHeGqDS2EMDMYHLnUEZyIEDYRD/bySK5EFL5UMDM
	6tqdd4+ZMv1Q6dSqedtfVKshm6Y4YYVwqXnytW0i+qQcvk55V90MLWiF781AdB03iDX4CJp7guS
	6LyA4wP0X9dx4NONcMi2JI+t5WajvzBuKq01H23l331oTz3yxm+gZr0+FI5nG3JXuoHN4Pcr87q
	u2+k4SVy6E0g3OFqYxEWll0KND50buef0tOBkSRsQssiI6bviqOpGZgMV
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr20241531cf.7.1781176162800;
        Thu, 11 Jun 2026 04:09:22 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr20240991cf.7.1781176162261;
        Thu, 11 Jun 2026 04:09:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b99f0sm49789266b.55.2026.06.11.04.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:09:21 -0700 (PDT)
Message-ID: <22e69b79-6dbb-4e43-914c-7800eef49013@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
 <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
 <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c--hQCQK1ZSEwQN-9238j_QK7FzJwMQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX/MpuN33sLMke
 ef87ePMX5qeCQ7o0N5T/UjY+yNuwQDxTJnLLRBIQ3ACPLNHG/tHru6bNYexrdeQHNMRhQOYpMlK
 SE0vtz+Vdz0MqsLVKrkBszrVzEvr1SWQIcF9I7ru7f6hXjboluEBx0kFeWZevXFaahwrucaAGvS
 YhYRHRTJEWgnamZVyXuSSFG5jPO/LyMVcPBE3npaA9A2S7ucaeo0BRp+mb32C6rw9cLGgiUcbTQ
 XxKEbhqWLDJw2Lz43osr7jV2Axa0aHpyops5xCS69mh3n+Kz0KMvIvSM6z5DUPaADgpm1tqXjhJ
 ajxz3x06zzutCJHhqwINkg2pulsmXtVJzME1S+HubDo77Rozpe2n36sTGKePuO/QeufZsgpi7J0
 TEsIpmcbnWox+RqbDU1i+BOavYRcYoXU2og/Y19AGUpgjF/v5pvApDvk4eszEnd4KLZoRjYJgEL
 SkNgwzLgjljFoXhGg9w==
X-Proofpoint-GUID: c--hQCQK1ZSEwQN-9238j_QK7FzJwMQa
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9764 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7GRNE63i-pEe5CX7YLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfXxNSR5tLBNhQV
 1go/qYNAoB4ORHV+kTEKERotoyfozjYX2+4ZzZL6vtqsyRGYcv5pTDTxY1XacxTOIpeMPjzkYLd
 JKqsYjwXPlQiK6Vm3S0o90TOgDueCPA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110112
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112722-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE285671326

On 6/11/26 12:52 PM, Imran Shaik wrote:
> 
> 
> On 11-06-2026 03:10 pm, Konrad Dybcio wrote:
>> On 6/8/26 2:21 PM, Imran Shaik wrote:
>>> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
>>> SoC.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>>>   +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>>>     DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
>>> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>>>       [RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>>>       [RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>>>       [RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
>>> +    [RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
>>> +    [RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
>>
>> Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?
>>
> 
> Yes Konrad, as per the hardware connectivity, RF_CLK1 runs at 19.2 MHz, while the other RF clocks operate at 38.4 MHz.

OK thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

