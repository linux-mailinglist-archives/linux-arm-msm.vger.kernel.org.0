Return-Path: <linux-arm-msm+bounces-114978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oO2ADp9JQmoV4AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:31:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D016D8ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:31:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AjASJJrQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MzKPjC07;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114978-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114978-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7F61300059F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F493603F6;
	Mon, 29 Jun 2026 10:30:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AF1D6195
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729046; cv=none; b=SdV3SYmx3D1IiBtwSVjXWo2l1hfgt7+WLEjPembCR9gFrffGavsP2G8N4hmVu/VxQoUjYgqPtGUKT9t9VdDmM4moFrV/YEwBRnFtbgx7EG1acHAvVLT37bWd/9E3TKQGWcZ07q4dtArCl5w8aXOUUiEqeR8wli8+S3jWxv6/gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729046; c=relaxed/simple;
	bh=yUpVDpfstUTvBShEWh452166LLBk3hB0rm6F58PzqDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmZaNznxOmkNutVYXfrWdJ3Fo5Z996z9m8POdyB/zsPZQntyIAjJQ9ynzg95ax1SzKd9Ylj97SqXsI0Mmn93qAZVEU/oCDMJ1ZvWTOL4SD/fad7LPPGrL5JInKYuxZ6EnY8xCMyRe8AjF2YIuZxle6dO47JjI/iHmVf2zGge1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjASJJrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzKPjC07; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3CR2641405
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=; b=AjASJJrQfLAXQM+f
	ZV0sXfYn2I5WKC7JQaI6TjJ9p9mcRhDROQiXBcdi//JioSOmdDaxaDAGUP9hWIIF
	zpHGwZwz1oVKkiuG6A8sGbdGA+FWkxTwEuqVT2IkgEBHHcYbTXNndYXA0nEL9afP
	W1IYQtlS9JN9W61NoVE1GzoCi2hNn2wmm6NrmjFLXL7AFYeku8kN2xc9OQNRnjRA
	qZPMfZNFgRPbVijRwbtxj6p0qKxyW3rPnTApYxEeGfwr5n0qG4UkqvFOev/kyKsC
	v/1TSnhmYRplztI1FlSmSuh0MjL4ZghnENmfarQNa68f7ZfHL3EBbwIamRoDO6u8
	YvfpyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0hjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so588461cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729043; x=1783333843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=;
        b=MzKPjC07LuWH5jXKvipr0vFTt0ytL1O8XZTt9TmzHAeZ6h3WrhL1/6jzYggK+mBIgs
         noNvqAzsJumKpAIv3ZaAtzZ4Jz/f8sJMRgKl/Ee9eM5DoZQPOfGROEo37MxcZFFezUf/
         5JeygbPPjsPvIqHzQGZOAMeZdAf5A424aIdnzXrQes2siOoCMscMRBox6bDqIXC/431+
         NCc8K0sN/wf40kUCurryYifpzT4VPQH+nLwFfrsMFJjSs6fq/7QeFy/8xg/1Pu2Wh5zX
         Zd2As5lM+v/T8sB+7Gqyxb/Q68YimYGWGGFBL58AUzoDqBJBJHVxaCDVdmk9xz6YvNzA
         UQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729043; x=1783333843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=;
        b=lQFyHIZEAhbCWkq3VL4Yn53bMYQXF5x/UEYPR6fVxLclc38PxcmG9nN8Nx+Wfv8BWw
         Dvn6iPrwGfpdZbSt30ADm2r7L8VSim4HP6bYWLY4yHv1TV+6vcxLwqnOFrhyJxjU8Wqj
         l3aJ9zWO4jmDGIO3RLfUmY/PmYVUr0VV4RMOHpzcYaxiiSUrVrmT0LkvB1utG83ED5dN
         pgXc1acRwpoAj3yx2ZXkn5dJMUXgDRbzdbvgzwyOnllALoxKwyxNkZQUJtf1fRs4J8VR
         8LRhQMMNcnCyoQm52WYItzkNEwp5dCotaSCe7s00Yi8bV1NcvvqhYPtfIxOGT463I6jh
         23tg==
X-Forwarded-Encrypted: i=1; AFNElJ9SAwEKZrOxYESqLMVyaxzB9ZvBkMCZDIbfqGK8f5WoWwuRBiKCB5HiOHhndxbvQRcNf/FD6160XsBCL4AO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaus4D4D3srVY1io1o8mJOtLbAaGF9TDDZt8RlLvydw7G02BPA
	ZEyTdz0a4SQEGpqK50OKghiYltERoR9Y4vktfowWZ1H6VuJNPYvcquEbnK21no91afTQQn52VYU
	0hHwu5oCr1k92QZUIJR03QaA3ryuEs1iZv80IDbsbA0MUzlnufR/cBUx3klNuqIvU3Jig
X-Gm-Gg: AfdE7cmy1Lv3DT5J5qT9AtONyJ8f7T+Ek8zqRCy4kJzoqA5OokdO7nKFAx1YmT5/tGN
	rPe0SPQJNNPBo5HxVpYeehcMsXBADE9l6dK+bOmv90KonCubiq1fE//x4Sj0PbLOkB1NAzJZf2Z
	Kh5EQiST9R60Ywbvn2pU3tjGVAOr4C3T+1g81fxIHNcWntlzH5yF49JXvgFwmEtMpHLErD3xiAt
	URuztFEEw9XkP+cnrMeniE7E7p/AexSKqrd73mXQw4xIK8st5S/urVQ8HjoTNo4ITnYHuwJeWWN
	cWnAJ5WrOzWGbqsCjgWD3xflSGq302lhHvJxOTTAE0ogHITdtX9iMSdHy0TOaBxw94B18SY5PGD
	y73WeK63uJiYHyD3sVdBBp/nk85prYFZs/is=
X-Received: by 2002:ac8:5f0b:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51a8fd2910fmr82101771cf.7.1782729042717;
        Mon, 29 Jun 2026 03:30:42 -0700 (PDT)
X-Received: by 2002:ac8:5f0b:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51a8fd2910fmr82101141cf.7.1782729041983;
        Mon, 29 Jun 2026 03:30:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c122db5dba3sm481538266b.22.2026.06.29.03.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:30:41 -0700 (PDT)
Message-ID: <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
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
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX3PhCqygwo1ew
 4A0AI9LybcvXWMfRAEw6u8MsYsfRCtXZ9nQ/KFKhbZ4GXm34QIh/XYla086Cwkkd5gFJ9Pr7s3S
 ARLB9JeeHe0sMMaEmymMBtGvWGbvnJY=
X-Proofpoint-ORIG-GUID: aCHcwbh3DRywA2fdQaPF_y42F0Gwus6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX8GbNNxS6MOAk
 oRUEMUUJ5x808Ao3qBTXi+qL6pKs9LhqfgxdKjOtoYSLLcrTDgI7RZL3BFnTsbkyUfppkAzpQFC
 Ih5mtc649EPDQrqXPo+LksdcmFj0mconpEaruYFYaX9vyeZmM33qzWF4sKq6mwmFCy33yTa//G+
 JlVDy4YuaXZODeUwaMnEyFkNQg/Ra0NzxxMxanoRZWssVhsPpOolGTXU+7AyZoL5au98uaC8rnq
 G3MKM/4yWuLYuYpbnMU3yf6NFNRzA6ud/R0678+TrGeBxdl6/5aZFsDuk0MOJyoRrxr/JKA118A
 JBFfk2cH6AySmHzLQYLLakvVLWUkNdGYto72+STL+1Mf3MqQN+Hdn9L9wa0/ohaGHzjfQOjjCBB
 I0NsH6/yI7sVAt5sa9N3CfelLvKaPHKycbuNNunZSvRTNuqfspQauHmgWbQrfHbrL6BItDbaqQj
 4WTKkUtqI6zBwZ3/7wg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a424953 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nIBEM5H7OJN-vwckHmUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aCHcwbh3DRywA2fdQaPF_y42F0Gwus6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 36D016D8ECC

On 6/26/26 5:53 AM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 2:49 PM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>>>> distinct regulator lists and clock descriptors for its PCIe clock
>>>>> references.
>>>>>
>>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>>>> match_data to select the correct descriptor table per compatible string at
>>>>> probe time.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
>>>
>>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
>>> require QREF. So I didn't provide its structure here.
>>
>> I don't quite get what you mean. I see that it is there in the graph
> 
> I double-checked with the HW team — QREF is not required for CXO0. In TCSR
> HPG, I think the QREF components you are seeing are in an old version
> diagram, but it says the QREF for CXO0 will be removed. In the updated
> diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
> from CXO0.
> 
> In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
> instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
> 
> I also compared the description of the TCSR_CLKREF_EN register between
> glymur and mahua on ipcatlog. Unfortunately, only
> TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
> this is because these registers are not documented well in ipcatlog.
> 
> So I think part of the regulator lists you commented for USB instances is
> not required, and their dts node also can to be changed to use CXO as
> refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
> names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
> I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
> in the diagram. Can we leave the USB regulator list as NULL or we just
> add them as it is harmless?

I believe the internal discussions we had indeed point to the TX/RPT
elements having been removed somewhere in the chip dev process, so
the regulators can go, in my understanding.

As for the refclk toggles themselves, my understanding is that they are
still meaningful. Although, we should be able to just smoketest that - set
all of these registers to 0 and see if the related IPs still work normally

Konrad

