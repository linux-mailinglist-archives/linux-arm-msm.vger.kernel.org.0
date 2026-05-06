Return-Path: <linux-arm-msm+bounces-106083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA5gJFMF+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861D4D85C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D31D30300CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C383E122C;
	Wed,  6 May 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQHh5D8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ot+t9cJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0DB212566
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058558; cv=none; b=I2KE7+n2NgbNl6/N3CypSb1inGmv46dj9SHUAq6uf8GR8/xsoZYkqIGA+Jzg7UNAsgWLXzd9aG91NTdeoOlNYhiANNlWBXjVvCDDKvjfDtQV1i/GkLubIK5D3hZEEhv+kGffoAsI9JCx8y+3yxFSJnKQyaxKD/hoNSzX1JLwKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058558; c=relaxed/simple;
	bh=M7QugAnyBIj+pMsgaMpxiuwM8+h/OjfhY50NRM/u2V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqCAza+Ift18RZqtxeBoYuE2Rp0xolHZxaHixSRel5yXvj+g7l5Ryvps7uCvtiXbb5WN6/F3PuspCGZ43atXWJ+Tka6Aqrb36pOzRadZ5QenHZWaQReRvHYSsYfLRslU2nS3L6yc1J3rXZZOAJ6w5dgywBk7PVU6YoRiMux2kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQHh5D8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ot+t9cJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468ZwXT443144
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=; b=iQHh5D8i1Htl5v1K
	zc8EC/rwj4IW5rWna26tmQoUV/n8on5fTRnTGnu8UDoVSgE6QiyDmH2BdoZGksRR
	DgAvdQzvARnD2IQRpH4T4AaO/YqjNLjYpOlN08dBq+JUP1t1OxicC6tCjIDDHQnk
	ILVqCJUzXSuplRS/EbGOTpdFT51W9ysr3YWiI49CN1tNTSZ2Onyh6h4Ahqc/l1t4
	kVGqZ6svjpDUl/nEevvLYEywW6BCVr/GINOJ4hqJcQkcYSuMy5q+JFl8z9hRf970
	YkxEoN/X5uPy+gCOY7etj3uhuIq1Qq9xfQDVes++WBaSI79fghK/JXWTKJN/gnLj
	CkxTDw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g4nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:09:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9511f903b16so393982241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058553; x=1778663353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=;
        b=Ot+t9cJirXDDa8g7EeZCfERzbUP4W4aYoIqmfe7mHIFnN4NnqLejFCt3XmEBRub08z
         MOOcjkDYdqwxOGbuzWmgtvkJtxi454SdoWSCTrG6i/m3/V1wzA7MJ7ov8gJBwQvYF41V
         OebkB7WxvNmBRpz1AtNygfrn5fMvA4mk42WVGfAzjfSZrW1dqtWqqKDq530wNdB7Zd7K
         +8HAldpg6wQ/ZPz0wSX8DJKHG2b34dFV8EjMrFQe4xISfWbUQTil8BsXyEIQN2ryO9+N
         XoRL9k7OmcJ3WB18Jy7p3KsmdgHjx0ZCI2W/VYTRM9udFrGKAQoFo6RWdvPqCnfIe8Gb
         eXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058553; x=1778663353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=;
        b=p525uHoy3lq9ai2KyRGGsPugFB3YsYRTH0pJMGwpcVybcs0Bo+CJt8XazmKnNUD8TL
         jZVUtixrTef1a9bpz5L3iDgsbOafTifhu1NDu/Hdl+oZjhQ6klPkBNe+ek1iy69inr61
         klChe+mFlH0vJLPZLLjH0gmX4Cu3i0ilJ8RmeOk4+T4piryWg4xSWgTE2YjJ74zB44vO
         Os04DT7upp53Wq/8KCy+XUP63ctHdBQ4ImjvOjXROwHXhpYWQKv4scZwDkrzkvzc2Ncu
         4OA6vI9YnrfD0Qb6tfwLSsCYnBDo0fuGf8mXauabg9kmeal77p58i1TOHq9H02Xo6YEZ
         dj5A==
X-Forwarded-Encrypted: i=1; AFNElJ+vvjXr4MQWylI2lbsP4qpItBRdfDYEpWIMbgyCwcOPwEwbJIRsRocZZRrFk5yfnWmbJk85hdLR0s1+mG89@vger.kernel.org
X-Gm-Message-State: AOJu0YwE01NrTmInHqbftbFg0vtyXwr3LN7Ccckx97tCSPGcw43LTh9O
	1eg2/dx9Wzz7RXCl4ZgRqaT6BpToCPBkfI2eTyOtYNRrpiFK9eYFp4ie58bIEWO98Ab7XdjpkDo
	yRs2YicQxuk/OVGRWNDOJztIa/fAag3pb5tKOcbqXNXByl1zG9x8nJOMpexRdxleq7LAr
X-Gm-Gg: AeBDies4H6A2EdnVafb/W3DHG3EuTjO2/WN663cfv9EofvgMyg1cqFB511exKtLLSW+
	/IBmrnz+98Wxpiv586AIq//9I68/2GGx19NeCqq1slj7wiwZ1dNjlo/Oe7FPlcFdYh7/AOBhgIJ
	tb8stlII75WEOaB2XvJk+nUllTMZKfO4aIcFDbMNMqU8i04q9NXIX1J/2QO2Ylpd3zljyfKBMGs
	Pmf/lzMQ/m9I8I+QJtayc/Ml2dtRAoPJA/MiU1+2Bg795ATIgJGUYUti28uIBYyZsfP/J8G9qlI
	vTExfZDIs9kTo6wTKhNLBr1x/aPZWye/9Gfnv6J604kMZ5eVUm+YMfnmiENzzkTK3I+wg1xrzYT
	8GeVQ+yD+xJb/db59Q/IlTNUAhJDsU6wrmltx6vjFb4/NPCbRMEOPJ7C47v1Yz1PdkYbunsX0L1
	iwCIBJNckYTuPLLg==
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr224745e0c.1.1778058552544;
        Wed, 06 May 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr224738e0c.1.1778058552073;
        Wed, 06 May 2026 02:09:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17c5e0sm59970666b.11.2026.05.06.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:09:11 -0700 (PDT)
Message-ID: <bc1a2a58-de3d-41b2-ae1c-ac72f89dd77b@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:09:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping
 regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Daniel J Blueman <daniel@quora.org>
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb0539 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=5gz2zhOb4yTQFyCjkmAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: Z3QXnGIf8HYOGxHGi530qld9BQHMdTJC
X-Proofpoint-GUID: Z3QXnGIf8HYOGxHGi530qld9BQHMdTJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX5Ap6jlxVyvts
 I0MkW/K+6xwjM00ELmNkX/SI7wQh4fUj2Cbk1EMiKp4FCddHtGMKZ2WuRZYhpFmBJwwo4LEI3MO
 sdT/8UnDHUVb0K2v8auYpleIUWO344+hWTKn1z3zKDtTCc4jfkI1yopTic1Z1gxkdu6gq4wpPFT
 UpxkFMK4e0ZmDwkypA3kl5SLbNutJ/ui9kWEFLQEUsjlXFQ2/fxxHZx3CzYvtCeMh0bTF/YcgKu
 mIVNEZPwrKjkUZd8VvHUnJVhepxmlus5r2Dx7QQx6SLK1ROME13htcmTrrVpBu7pEyhmm3JxP+G
 pSbqU5kXmXC6c7y0zt9DZZ31UFjSPetlfvKT/wPYAymmD6g/fJYdiXcpxIUUVl5fo0enS1CEDcI
 terhrMpZMjIhEYSerSW1SusrN+UuUYf4x9P5ZkW8WWo4ce4vNtTRQwm2/jYwbu2Yu6JHapUyXkL
 LAOjQHeChOY5DC4XVpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060088
X-Rspamd-Queue-Id: 0861D4D85C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quora.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106083-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 5:29 PM, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
> 
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> 
> Not really tested, just idea based on sm8750 and datasheet/manual.

Not a great explanation for a completely different SoC :P 

> 
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..575ba90d2070 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
>  	.val_bits = 32,
> -	.max_register = 0x11008,
> +	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */

There's some trailing registers for debugcc but we normally access those
via devmem anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

