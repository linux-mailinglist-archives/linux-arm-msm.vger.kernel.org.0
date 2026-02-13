Return-Path: <linux-arm-msm+bounces-92768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBuGGKMFj2ltHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:06:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38C1356E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8A7F30101CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C630FF30;
	Fri, 13 Feb 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYzSLLed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwPhZ9PC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65C285058
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980768; cv=none; b=TB4WqlEdzAz1Z0YRNDysyc0vjCnhVe++2XmHii516x70UcfQDoH/Atf+OaimivLnT4oe2DcKkmZXq7qifChUa76bKaWneDqo6wWR7aL0673+dwMWUg60ICNO2XghA70uB47amTEQAgRcupF15AgwKhRNKwm1+8dcxXS9CqR6JG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980768; c=relaxed/simple;
	bh=7x6XQaAfF02Qd1k8bYCbvmXtDMDBQP5usu4yhWiJpfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzbXx+63IuYcoAGcvKJbPInQwY6jN1FBJl3phqQhvlEKYj8fJB7EicGllF/sfevVq63UgbL5pnXboyZ0QaqXhk1fdHWqkwnah9Q9GmMwCsxjRa7N+olHBxMdPfVbbS3m3UJoN3RVA+ykwLzVQA+2HuqS9ZIOeqnR2whOh7d7tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYzSLLed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwPhZ9PC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7m00d3424226
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b01twX+VKhpkqJ7l6msvGVJzLekPKelwCmdqFjzI4dA=; b=BYzSLLedjFAWlrkj
	F7M/k2dK4KesFxKiDQ2x659ptGGzTXMNA+8hgJLzPxcTh8LY1NLXknrKOy06/Ik6
	bAKqlDE68a3KnhYg/c9M9oMhDSWLKxDe4/sfbJrldGezRCFL72Iiyi9fsVRnGvUo
	bA75GSjnw00Y+ek6DbezPJbwW3zo5j3G1nGn6rgEbRG9EKVpnEDGz7I4+e6HaIkS
	RVNNp1vMNtaJvI3OjF2TsgioJAZ9hpM3F8LLNPZfeSgrV2EnrZPCwxS9AUVXYW44
	EcbOx3FeTz4YMdbe+bvsSzF5d65IC+1W3Er19hzwNJYIaB+60vl4VvcfxUl98Bfv
	3uMErA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9yvrrpn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:06:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4025302aso34402185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980766; x=1771585566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b01twX+VKhpkqJ7l6msvGVJzLekPKelwCmdqFjzI4dA=;
        b=BwPhZ9PCqUArD3GhPtI2KWOmZrlq4GbHbgf/U7eAAIX8syEsxQ31hOxlpJuoQFGtjo
         xicwGEj7pQJIHkKUyrhq6xh5Lr5KF8qtsoOWo6wgZDMPIkvFK0jqmEzog9kxvtfTedkB
         f/ntZVWuZOcIYzEI7eEdKTGmlzc3NRA6JdCZt3UuRXuH7/0iDjZbt50NXW7r/Vh96TKC
         syTrh25PVi7L3hS0R3yah09LUeyOv2N7+oXRe/cLuovKQvTKU3ha8fLo4AAdh5AMinAd
         /y4gml9i3MeZG6As2tJLOG2i2Tf1a+iEyFzucOW42lcRuXPqvcFU/QgBbJ7hwarVgguS
         8fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980766; x=1771585566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b01twX+VKhpkqJ7l6msvGVJzLekPKelwCmdqFjzI4dA=;
        b=D549ibViApZs3s4hEHXCoTeNxA5mM1ZGh5YFD579QLmWcxmmjCVKFVRGE3iruWMvlK
         yZcHd/i2kD9m0z/cVvwE1tJmxgmeULF1TrSHY2CczLv4jYHn0xuH7BLOvdXQKCHVtGNi
         OiPDyWcckLYU09JRiLjaRErpE/StMgskjwUuNlqmz4bzZnfkHb/eRC1oAd6/M+rhH8gP
         /803oZirJr6NDnrFEgrVME0ads5XPa5sXoNYnN2Cy363+AFD+viaAb6/lT4mT0zAs9jv
         AJO6R1aGaU6r0+xG1X5CTVXeSzq5Kc6KHpqJOkkvxclzhMVUCa3valq3qfOevY5rD+8b
         8o2Q==
X-Gm-Message-State: AOJu0Ywy3Req6wURxrx1epK4SOZ0LGMSIhZJabiLbJXIG1lGo5+MuWXT
	BID0r9Pf9u3DH0HsPy6j5JEEJE1b85NQXkmna2utfq0JbP9bV+K9rXThOW9iwdCFqeMVCzljxV+
	gb8dRa3F+pMT5pJSEqf8jqgpRxUe2XDGoACbD6Z0M6lit+G/LB1hkyrRIt3d+poDq8hYX
X-Gm-Gg: AZuq6aK7e7CyIqrJlrpfVRs45N6rcoOg+ZIFiIIs5BgLh74k30XOyPBNt1sA+HPaD6N
	IryDicatjuWlmejZ75e+DEs+2Z8+H61BcgwhjjkvpByYh1OM8HsLcSxHgAMf5V286qk/5ebRJm8
	niJEw0R3hmigsDgvKi1ugd+WzroCjoVLlo/Q01p+p1d5oLtARVK02JYhj38u1he3iuOAjg69x52
	5ZyrZXThIaMa3DxiG6hZXDcImt9WsKDIY+rA+Wb8LgMI+y01acjZ7qHXB0z6eQgZ33ARUit42ZP
	aQhlk2M+/X/OXiqs0LPkQOmu00Tl0j/aUqUTRhPUxEQcSQU7p+YO5iZl+dlh1bPq2vgy+XRUNLN
	ORPp2O1jDsPSGyvtbBu9bBgHwWX12L7bRqwfojlUSknW4ybh2kBT+FENeZHGaDtgltZJBQuF+xJ
	ze6lM=
X-Received: by 2002:a05:620a:7014:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8cb40902c06mr168290385a.9.1770980765583;
        Fri, 13 Feb 2026 03:06:05 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8cb40902c06mr168287585a.9.1770980765028;
        Fri, 13 Feb 2026 03:06:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec35688sm246007366b.51.2026.02.13.03.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:06:04 -0800 (PST)
Message-ID: <f7fed0cc-0c59-4a75-b045-a83df924113d@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 12:06:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
 <af15838f-6a31-4017-ae5d-7b5e30f24aa4@oss.qualcomm.com>
 <845165e6-4595-41de-8cff-d065e8f6b6be@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <845165e6-4595-41de-8cff-d065e8f6b6be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M3ZiJn6Qb02KBm20EO4Ef17fOV42n7jq
X-Proofpoint-ORIG-GUID: M3ZiJn6Qb02KBm20EO4Ef17fOV42n7jq
X-Authority-Analysis: v=2.4 cv=LNZrgZW9 c=1 sm=1 tr=0 ts=698f059e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=HLvL9enDxULGCeejQg4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4NSBTYWx0ZWRfX1kYJ4Mi2iaZl
 rJ5e9igyThiZ9/pvHR9Y1D4iPzn9PpUWSOWKvyrqe+TpJG3j+9DwPYGrFtVnmnMQItvaPUxn58w
 z2tOujsg9RgNfew7DIQMsXyhFOJXNda0/qSp7h4D4sQRDi7D7mJDVOLsTjGHFEVY3XwuVO16V6Z
 2bwUAIfLac8XkTZFITcSCWY28e/NdVsAkk34BNfC2XeHpvyhqSOhaxmIahyAH2mATCs+cANaZUx
 FWmgfxS1obKZ5rToPstN/sulhysFO3JmpHD6I6fq9YUBLCqEU/o+a3nla3nKMXuD2aw+mK4zcvh
 rwbkVKMFXCQLEBZPYCEGUcjvSXKimT90SVgHJcV1D9NUYnB2I7l4OEJON3dPsiMy8Ka5u0Nz+/f
 R1kxa1c4++1VZhikvszUecuGZUVFPZ+KeNAiYRsPmV6aqaUC/av8VPITEucGxpiooQgjAdydhpD
 xBJEUMKZH7SBgvmNzgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92768-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED38C1356E1
X-Rspamd-Action: no action

On 2/10/26 11:29 AM, Yongxing Mou wrote:
> 
> 
> On 2/6/2026 7:02 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>> Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
>>> into separate DP and eDP configurations. This allows the driver to select
>>> the correct table based on the is_edp flag.
>>>
>>> Add a dedicated table for the SC7280/glymur platforms, as they are not
>>> compatible with the others.
>>>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>>> +    { 0x0b, 0x11, 0x16, 0x1b },
>>> +    { 0x0b, 0x19, 0x1f, 0xff },
>>> +    { 0x18, 0x1f, 0xff, 0xff },
>>> +    { 0x1f, 0xff, 0xff, 0xff }
>>> +};
>>> +
>>> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>>> +    { 0x0c, 0x15, 0x19, 0x1e },
>>> +    { 0x09, 0x14, 0x19, 0xff },
>>> +    { 0x0f, 0x14, 0xff, 0xff },
>>> +    { 0x0d, 0xff, 0xff, 0xff }
>>> +};
>>
>> This is not quite in line with docs for kodiak. Now, if you have
>> better/newer sequences than the HPG, I'm not objecting, but please
>> cross-check
>>
>> the rest of this patch I think looks fine
>>
>> Konrad
> Thanks for point that..
>>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>>> +    { 0x0b, 0x11, 0x16, 0x1b },
> here should be { 0x06, 0x11, 0x16, 0x1b }, arr[0][1]: 0x0b->0x06
> does this looks fine? will check tables again..

For kodiak I see:

eDP HBR23 / low vdiff:

swing
0x0b, 0x11, 0x17, 0x1c
0x10, 0x19, 0x1f
0x19, 0x1f
0x1f

preemp
0x0c, 0x15, 0x19, 0x1e
0x08, 0x15, 0x19
0x0e, 0x14
0x0d

(notice how that mostly differs by the lowest bit being (not)set vs
your proposal)

eDP HBR23 / high vdiff:

swing
0x0a, 0x11, 0x17, 0x1f
0x0c, 0x14, 0x1d
0x15, 0x1f
0x17

preemp

0x08, 0x11, 0x17, 0x1b
0x00, 0x0c, 0x13
0x05, 0x10,
0x00

Konrad

