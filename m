Return-Path: <linux-arm-msm+bounces-99586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKstAO1awmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:35:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51883305AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B64593225CC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EB63DC4AF;
	Tue, 24 Mar 2026 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqbevtOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KF0ocvtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE03DCDA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344344; cv=none; b=Ap2UUydoFZ4/wIGzur+8nBKsVckAFDhul5jzvXqd3Q28E3sP0Iujw6Bquj6LhF/Y1dFgj0+x/nYzeOaPSZnffBfTj0IpG5jgkDW0IY/URhYuZoKUiNXhEfiKnX41Eejj3XmKXzdi6qAdkWn3PQAH9/ll/DlCZ9N8Z5eU5wrdbv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344344; c=relaxed/simple;
	bh=izJj1l/o063vlBI+JI2AFwCtCQWHbI7j2rXuDXQoTCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/cwU3wCu2E5jW4EA+olTfA2k+OWtkJrKM2tWAbJt3OCdPn1EG3lOHU+APGMioXLVDWU2lPfi9zH1nkQpiCiFpgimWTX4lnLnqHlK+CdvNLkFpiErLvq6xH13RbS97XtFOstxDHjC05Nz1T/Zy+x0ZDhQaOP6gHaXpxYzNocnTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqbevtOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KF0ocvtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3Viv54059466
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=; b=PqbevtOtnvdxSY6m
	Ej3SMVubIRras7FnhjnaMvzPPHMBld0+t2tjSt+keT8E+nX3pcsOjZ0VF1OOOUvq
	aXjMHzn+GH5NivhK9jx3zcc94MSFeTP92nvHgs00qsw0Va5GjFU31vMe8gTyCpFg
	W0ndGX2I5AQGS8rH+uHIiXldq/lTd60Ctwys4enp/jx6oiTCCY8fPufnOT+5s02x
	Vy0f7dgtJG0+8Gd7D0S14BtdZ8sK+Tg1DcHkQxueDdlbRGdU5Zv6kd6Ph77NdfZ/
	HMnUyVstgA0uAo0GaqZL7ndnDqHTFLnaHMzXj4E3hs6UDZHGtwvlPb3YXlmi1K7L
	y9sEiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsks6gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:25:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso46073966d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344335; x=1774949135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=;
        b=KF0ocvtmwT3ZVKLk00MpKrsxFuXjOKKA3g4/sCHQbvH3KLAYffRaRcztIUjtwBA+Zx
         pqPzQIr2NAvS6xOJZkz6yHLY1cIR3QGYuNQ3O2UBZrnofoCTdbvUtFwz1w14j0Ycdgk2
         qvjYsKUn338fTJT+q94wX+JcSX3QTZ0QtdD+bCoqnzxigMqz3toEOsAqhXW+nhBEhd+O
         a4bwIy0rqdkx59HmAFdywTYKvvhvSgoQSaBfvzupTjV6iqndEzk5yMDDwLwN1gfyiEHI
         vim4F/nKXhWNpfVnKGLQhoT5Sss1QnHupPrkJaqa/H1lBXArlEyvUN9fOL1HXQscOVF4
         Y2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344335; x=1774949135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evOdHivffAtn9SWqkwOMnHChQNd/edxUNcG3hAURPt4=;
        b=ehgq+3BGU8lZA4X7QI50bfMpwDPYueqKcfXAl/4gzyADhW8XY2wf61chGptQWnudg8
         bOzLqa/ENXoJ+4BkL0mYaT4rRXfYZ5OS7erdNv1crNYKLa2Kkfox/Ou2+z9+t3O0LD1T
         /kDyQAEiXFOiHKIy4IamEnrZ2kdx3TANXZcup65v+5fC7/YyI80mzEpkS03TsEamk/7W
         mUzWefDpy6phDG2JrObTfbJX0727YPEMF6ovAIb/Yddm/E/f3R6pPba+Oq/85UA1pAnk
         B37E48hZBU1wE2twkumj3KnyhoBiMkUEcE0+sMetk8k2UStzxK2zGP5OFs4isH0tgnHi
         CdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk89jvEYZhyEcfVlwg1Dqk/jVe0N12wMIGeTZNcgd0kBWh3/Q3n05jE6ig3bzTDXjXLxckebXAEE3MmoEr@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdLLSndfQXK7fMeyA4fjnTbRirz59u3nYZ+5JjgiVF5sz5rF9
	TgZGaDwoW9RtmHAstrwvXMsrE2GEnGJVnJ/UJFeg+IZEjPxNzcywYIdjg94V7W7fGuxiq4DZHDr
	CMuRmb2rnQY8ORcllehfzpItt0jf2e64aYiGIbflSc0hKDIOHFWw+cQ2GhDp0YUeyTw4N09CLM5
	v+
X-Gm-Gg: ATEYQzxPJ28LPkkuzs+WaGJZ9V3Aj2OXpwi/CMgKPFlercNBn56luacf/CqPXm6bdn+
	g6Jnr1RczItdHUMfcM4Jggwm3AQKZGvMDktaRrLbhW63QxkbH7aDBUtEhSb+H2Y8u3Y7CzIIfRB
	pu82tCJZ/wNXNM9VSBMyf9pE9Gi3Aoj+l5Qv7nRMkmmrHn9RkiQKImIUnjbZx07kXafji4ke5qa
	n0/3tsr8VIy7rjwlcyG+SpNPUsxDZZbi/Hl47OjieS87NLCund2vwJBXkYoZrXpdj1mUTvNthiS
	RQXI4VDHAol5fNpyN2YzTt+wL/4uJjPuKOPhAvOGIcZhDTgUVsgovaoXHLTr3YC/JNkuCpXTzP2
	EgpSWUbLD8/MzMqx5KP+68Sw5YmTbyhYHVD2p48M4DV2NimRb3DmiOyFv85Li+8Nh+dFpX0XyKU
	aDr/Y=
X-Received: by 2002:a05:6214:e46:b0:89a:4b00:bf42 with SMTP id 6a1803df08f44-89c85a591ebmr170600886d6.4.1774344335137;
        Tue, 24 Mar 2026 02:25:35 -0700 (PDT)
X-Received: by 2002:a05:6214:e46:b0:89a:4b00:bf42 with SMTP id 6a1803df08f44-89c85a591ebmr170600666d6.4.1774344334662;
        Tue, 24 Mar 2026 02:25:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm612495366b.14.2026.03.24.02.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:25:32 -0700 (PDT)
Message-ID: <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors with
 Hamoa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
 <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NSBTYWx0ZWRfXwa97utHOnVlu
 nxRjrlKxauYnRxP6ogAbRfaUtYn48iHFPfkRT1kpL1X4Dno1Lo32zl7IPRznhwHXMxdsFQ+5cQ2
 l74jBE06BY2VfdMnZNNoL3mCn2TgzkuofOdtynOjmH/C28kCNWhFI7Q6ZI1W0V/JzVSkKe/isJd
 t3ZkkQxdq03W050iYlRXHTy92Nmk5kHD9EhEG8gxdq6YZKAuWeV2wtGi/R0atdTXA6AGFqInYu9
 LL8i8Rua1NK/WIVxOlgl3rDCulh17CE+w8TKE2crrAl9YIn4lzDJJVqRcDD6RJprGgvep7/5AAr
 1nvINfCbAIWadsls2UtVTEiHffC+C7do9EzB1mGK9uCr2D4jSHtVxSh291E+UtXCQnQYduv+jI2
 rrJm31lg1FgGpKU/9uChKbiVrxFTadH9Fn0bkL+i0wJxlE5Nivc6+tfPg3JGP45XnU/AcYvkCbA
 ndG4uFNWhBHt4efom/w==
X-Proofpoint-GUID: c5WegPGPFUTLNch1y4xFfbE25pEeonIC
X-Proofpoint-ORIG-GUID: c5WegPGPFUTLNch1y4xFfbE25pEeonIC
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c25890 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oq399LLL9rgHG-W9LOwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99586-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51883305AAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:49 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
>> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
>>> Hamoa and Purwa have pretty close thermal zones definitions. The major
>>> difference is that several zones are absent (because of the lack of the
>>> CPU cluster) and several zones use tsens2 instead of tsens3.
>>>
>>> Instead of completely duplicating thermal zones for Purwa, reuse themal
>>> zones from Hamoa, patching them where required.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> Slightly reluctantly:
> 
> Why? I'd really interested here.

I suppose my reluctance comes from the decreased readability, but then
I suppose the silicon is not going to change if we get it right once, so
it's not a real concern..

Konrad

