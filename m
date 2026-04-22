Return-Path: <linux-arm-msm+bounces-104044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB51HmeR6GlWMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D83443CE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD52300C587
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641CC3C198C;
	Wed, 22 Apr 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj+l5AA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjDAODNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCC3C061A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849013; cv=none; b=lYRIzWgHmGT1qz57wO1KQKPhy3sx92BlMx05x1yDZIsjok9sGAFqYlMO7tFEJDrG/v2s0/3VQxPE8bhtB4olSSiI3a+zqqJshyFPGzTjy7BKd7sF1spVfMjzjULUf9KE1dpRMqvrFfYD26/F+xQMBGT87x1cY0DAt+l3t3IHYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849013; c=relaxed/simple;
	bh=Ht5XepZYeWRruFIhSU9il0UdSXEj0Q/RgKbZF358CzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rinplvLEyCzUcZ54B6Uq5Bvan0zlAtzQaYGbFmiqE9ZMRG8qVihZPU7SaRrC64e7Tsb4J6PkGGXe1PvsqEYeES6Hl7bfbI0L4k7ixDu+ca7Q/Y3LWxIFva3HM8xBxern3FBWBJWrKPiwLr7f6ey7BG+ssKd1dOiyrxusaO6cg1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj+l5AA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjDAODNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Nei7727933
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=; b=Yj+l5AA+2wthYYYx
	H8NyPInpanMAxY//LbbvDmYdeAIopIN51yaDsUFyoqeN8gkkMS4+ZKKL/q6Y6pD8
	Z56ULvAT8gctR9s7GsRcWIhkOHb0E9LlLaB7jetxIF9iRUi78ItcxQugjQCUUTWv
	DtUMTKhE9UQ7EELK3FolEVbOJvszZVUsS+KfdwpHS6PNgiv+SEVNRS6L6WsrxZjD
	8a451y7NNGwMtC4GOpaG5MT5Wy8q3lKsLiZV6eKapwj2VoLkPJfaEh6hmwbv4PAN
	YCxpytvC6vcSx6TIXom9wqpGOwDKd6et/2DkWScx+ItbRqi51T5uwKvJXfRTCUuk
	3zqzuQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhakyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:10:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so20557936d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849009; x=1777453809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=PjDAODNhJTswMSAb99LcyGNINSuDClgsTrMBvusG1DI6yUG32w0NC5jFApwNIg7zeV
         BH5jnwRPbu0Z/p4CmoVvRege4nxMRLU4fEgGz9jApb67J77sm6Nb1QV3PhaXeREe3SV0
         9RuLQJ/2ZKL+roxEyWgI4JukRGpSzUjExskNssu6cSxzSvo04XCgOTaOat+WkloL5t7T
         szhOoR6mQURqIPo0aDQYMDYDdpn5lqnhn8A3zh2M50VVYnJ7wrvDLnzEDwnCRThH7+Ek
         27Nt0KmG64s/R2envjhaROvfjw6W+oeyqt4ze9vWLDp6MOSZLaDAUHloB1FVg48/sZjo
         uYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849009; x=1777453809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=QPXW/rx343AZ3BkYzIp4V7+S+vbOHc/SHHCdYvRHLkQ1ZKGiq9X3seqYfS+lnNkOXd
         vdcH8Px6St7D2mMJI9GD0wiXeoZD7zb40AHiFBGP4eQGqqWd89KKTGY5ipllCQe1HZhD
         c1KsJSnVN/0O2oFStf1yoBQzILnkTJua0DFwbZp5ndRIacxkv8Enxii91MjCBn9ew3NP
         O1c9TcGDnY4n0t5+FtnCYgzUCtCMGoT7pNJ3b07HCC5DYc8GIy4njLHW0IWFxd0Dnbwx
         TUwk/UQgTIWVW9oL7+BRO+dYA4++tcS4XSAW2qeDKL0uMDD4j34TC63UYY94ewTcFJ+e
         4Xqw==
X-Forwarded-Encrypted: i=1; AFNElJ8RpHcssCDBcR+10h3SaYPQkilaZgF+8yOxdd1QwfNxMcYDcICPK8QbUH/KfP62sZ2zva/8Ni2wzMDE1IsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYGQfow2KY9XxfmnnBi13BiQ13r8Qok/Sb9i2IueHbVFlhZOQ
	NRwv/KlZxHAX6qTvfWdI+AwXh14hwPmt+gKzj41uZMq4yIx8emQOCdkhMQnXtEFvEAQgP9JptIl
	Uy43H4uZk2XfUUYwIA3IkM46L66HeE6G04dWobbbdBN5IwdpPi5OTXwerCJSUANnBo5Q9
X-Gm-Gg: AeBDievsNpJ4ajm5ArLNdkBMluLsxFEdNF+8MLmIl+u4iVRP3C1mE9OaSy9KqzusmWN
	6KcFnfEq890JSi4BpIShqQvObpddpbeNmFxmAG0ejLNZbanmycTobQ79ywrM38r9T9m71Izeztr
	Y+NtVQb7DCRyMj/gEym8IeREghNNJoM7Yw4HQznQzEvMao5MlhmGMJWjRYb872UqpN347N8j+IY
	PkhWynSsnKqcK2p5sGKSagInB/AMSNKOzZ37FMYiqSbk5f55vpp62hhwI5Gyvdfs5r2PDORmGCX
	yoddhFDG+eWgDKrLpX++ZrumvPBVBMmcm/0/WYU70UiONDNsDLyo2V7h/6UvNmkcvmTiejTdEYo
	KUh7QP+VCKc+uDSR+XpESdKekddKBeJrv6NIdShAZXyTsjm7n0li3BCy/exV9cEcIJB0oAF+Dz5
	cIfFjFxFOXD6rFkQ==
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257999266d6.3.1776849009608;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257998856d6.3.1776849009062;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455539817sm518715166b.56.2026.04.22.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:10:08 -0700 (PDT)
Message-ID: <9635af37-f3cd-4f82-ac87-84e51021822d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
 <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
 <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e89072 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dVDS_O1aKoMvdT6kGvYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX08MjP+C8smDa
 f5D4gGofqkljVRtwo9qz/E31FiF8N+p7wiWhHxSWLciBxARzD6iF3EAuAWRzkO9jIIbwgcK0fm8
 DbrTn71LlcaJfuj8zXj2L77QO/ZsWrfl5beNfFB1xLpJgf4MUuZMmzKJRLY6eR9ft1oYuPoCXsX
 xXIbOFwjZjRA5uaJ8seSa9hMORcihfTGOYYvUSuwiIpoNg3Ul67Sv6v2zsciBcatL7gTrmkOWmG
 esQP9dHjdgFEg0HxcONBX9JfIBtk4kSv7aDYpOwn7RcpZ2YxISHUL1KFIttnGfVmyzLktyEqhum
 K9OG/8LPXvrNLt1ItEmD6+N1DODzzLg803g1S5CDcY9Shu/D7ZOfZ6GS+kg9b1SP6oN2xyltnrM
 VLZw6Ql4XwIpaaom8r4SJfAlARRqe9vxCWfh/n/BT46HkfgsAkjrGV5ka/5KVeQhnuYpWMx6nlT
 20Tek/1n7hZiwouMnuQ==
X-Proofpoint-ORIG-GUID: 4nauWE9xLZPfBJBGvLhecmlF0bMVIOEa
X-Proofpoint-GUID: 4nauWE9xLZPfBJBGvLhecmlF0bMVIOEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104044-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03D83443CE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 6:50 PM, Alexander Koskovich wrote:
> On Tuesday, April 21st, 2026 at 9:06 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/20/26 4:28 PM, Alexander Koskovich wrote:
>>> Multiple QUPs have lanes that can be routed to one of two GPIOs and
>>> collapsing them prevents devicetrees from requesting specific routing.
>>>
>>> For example, a board that wires an I2C SCL line to one of two GPIOs
>>> cannot request that specific pin with the groups collapsed.
>>>
>>> This change splits them up so devicetrees can request the configuration
>>> they need.
>>
>> Please massage the commit message so that it highlights that the issue
>> is that there are multiple functions defined for a given pin, sharing
>> the same name
> 
> Will do in v3, also I was looking at how sm8550 handles this with qup2_se0, and
> noticed they don't split every lane in this case, they only split out the
> lanes that have two possible GPIOS:
> 
> 	msm_mux_qup2_se0_l0_mira,
> 	msm_mux_qup2_se0_l0_mirb,
> 	msm_mux_qup2_se0_l1_mira,
> 	msm_mux_qup2_se0_l1_mirb,
> 	msm_mux_qup2_se0_l2_mira,
> 	msm_mux_qup2_se0_l2_mirb,
> 	msm_mux_qup2_se0_l3_mira,
> 	msm_mux_qup2_se0_l3_mirb,
> 
> For Eliza I split them all out since I figured if I was already splitting some
> out for mira/mirb I should just also split the rest, but should I mirror this?

I'm a fan of keeping it minimal and only splitting where necessary

Konrad

