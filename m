Return-Path: <linux-arm-msm+bounces-101024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BhlHhihy2kUJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:25:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37B367E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F13E304226C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065623A9DA4;
	Tue, 31 Mar 2026 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loXJfLsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGrQRP62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74463A9634
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952230; cv=none; b=QPH1pJli3d4yUqU4eu5Z4x6xhaluYBBW5hHeKV2bsri2/tsB5s/d/SauJjvI8RzOnFioE04sgEynb4LTvZdzolBnxzU353vGYjQvkrZEVyMB34k8D4kjbU12hyQwJBOcuIh52+hVmmAosP2Rfc2zyeKfr9iFDO97QQHhH9QqGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952230; c=relaxed/simple;
	bh=Zg4Ozx7Sg/VGDX3zwMxzagQpkXxbVKtpFM1Lw2PFmJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nvrVuJyaYZaPfqi/jd9bWqS2/lgGwxMpIFwVDVnW5OXZMkI2c0+69Vmox51CYowjIt3kAOgumq2v2Gy+FXYoE4b/vXPnTgSpYs5bANE9dsz1KqwSI308WzUbwQgNUTJc6SqfFRqrsrwj679RojN1p1fYcoUjb1RevvQBNeGta2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loXJfLsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGrQRP62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9v7Eo4053792
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=; b=loXJfLsleyyK2lYk
	uUqEUWFp00l/vt2tn+U3wXTNfpw2JRYo4gzMgTuy6J0/uG8k+4PKq8OHAvufrzaJ
	6y4BNNrQ6nmC3zp0zQXKTurNGkkcaM/r6N/Qkhed2fa1vlRN+Geqt5d6Q9YnUCyz
	G0yn1c50zJoKaXna701oSwDAnh7NOB+GySLqiO1brg+Gi2EdLRVYl+ZigbF8qRjr
	cR61pM7/rrvBRksOMRhy0QPPlxIsJBFzSI7SNSDlfQwezPlVuf+dg9BovZhsZxwD
	60pDLZEkbp77A0gHRfkVlvAYKW6ZDkLB/3Yhke1+QkAfcEDe0M45BZrQSRkTYXmt
	N/He/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b22u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:17:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89eadc12c84so15097576d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952227; x=1775557027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=PGrQRP620wRXEKp+W1/3g972RGd2pe4HIna0rwNULUqEQUOMYtuhNG4guqMV6/I4Wz
         tE7PwbIPAcvNcGqiBxIiyuk2Lw/tHgPowqf+597yTXWLqBkvCNpTflBu3tUkE+n+VKIO
         gCBGfI2ImkI9OAqTFzWVERJyyPffR+tIBXeHVPmY0L/sygZ+umfXYpF2NDXVaR+9XMNn
         hUG9uFHUkb+yYfEWRfqqP4G2t2VJw4SxB4i8rC3rUPNl/dSH0NHR8DGD6UUfOQygbLeN
         60qbXW9nhfeL4mKkaJ1R4sp0UID/BEXBQDci9+xmNHjC2hSqwAMAb58kE5aMh6Wf8h8o
         UZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952227; x=1775557027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=G0H49moQr6knmTbSWjqlH1hCIFnKaGQPrpHu1ZOWqnuYTnguaBfeJvS7ngNfQnGogg
         1AlCaE/gbJYOfCVwnHXvkw9UidsXjxxgI4a1tfRf4DxNKWJw0cGYXKC1OIsLU3jRqUI8
         aUg7nNrf6/MChsrvQcGZzUP2EiSLH6A24UGt44boSoqIUdodc7ipf4sjBfIoCCNaftNk
         7HOUxJAsXViGVOzV441uGgLXvnzrPjO5qC8wr+MPYI6GqMcELXYNBB5HkjtdkE3Fayx4
         MCA/isnBdLKjGS2gElnr1NRr82TjEla56YbS430QsWIRLadYLnEEMDyx17Zm4WIBs0Er
         NKuw==
X-Forwarded-Encrypted: i=1; AJvYcCW4WBSumW5KE6uvh0CjcP+ELMp7jnqOGtvu4/RZClFinrO7Gf06nldDjjQRpiwd+93JTIu+lp8kpgQbYMyv@vger.kernel.org
X-Gm-Message-State: AOJu0YxLqY8elzZ61Zd3dfqhN/DIndKKHuvUBNQqfef9EsnF9epuEv2A
	/SW1XOxO5b8leIsEja35vJIrQEIdIy1Ur7orwQf5fzDZDey1iOL9QYK1iupMGDQd+Qm9+zDP+jK
	JVOePGC2YkLR0q1SvZEeQSah3QS3ShxxhY36TLrxxGP4pVQJ5Wl1cl1GnjumffL4ATu3m
X-Gm-Gg: ATEYQzycLZQ49xsjMmYkFGqA5R3tJptSkOtOdmDno5corVw7M2iKr0quaMXHt1wiDiN
	XKQbXzBEHsQ1bFGkDzpDS2UA6QyhsT8+oDamlVvEQ4+BBjl/EGBdme6aefSUSDwndCVW50oK1W3
	g0zXuB2KYBOCLecgPy755w+IgLJh3kWVMU/Q78VwRbCFWN5JMkP0gibl97fJ3FOY/TwKrqQqp9N
	WSgqeUmqipEp1Yd+dfduVFxUxpvzzro6T+JIAO51OvbWzoaKznZDzp8PWUtrkCniS15ByOTa2WT
	4YPRagR50WqUfqVPanweiVg0AQTbkOyAnsdWt+46p+3RUh7GNZ0Bx9y0hXKA1o6XGSdnomD/oMU
	7HSI81mmV0iuuc3ccGSoTs8o3VZg3/MTrvXngG7P9J5KY41Mq2lneqDgp8KsYsZuAkVv2gb5s+v
	ZDfls=
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171652996d6.5.1774952226913;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171652776d6.5.1774952226451;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm377853566b.30.2026.03.31.03.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:17:05 -0700 (PDT)
Message-ID: <3e3428e2-b07e-4d65-9cb4-afad1a943bb5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb9f23 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: l8cUrG-gqZYdQ6bXnRha2odT3gk6f04H
X-Proofpoint-GUID: l8cUrG-gqZYdQ6bXnRha2odT3gk6f04H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OCBTYWx0ZWRfX35cI6cEE/Mx+
 Z8Vw9CHoD0N9OjMVOrm2Fd9uNo2py+5FPlNoLUecZwRAD2drPocXsDaBxivOEkQMltNj65YGmgi
 81BxOT8VltRpi+paaAd8pxSquX8UH02xmv6dNFEUU6eNa2dGbfI6AurprrIEomQw1CgngynaLz8
 P8gpYbn004zzNQKyJLL/aMwsU0Sj1bJX/BdzfvelkbXeDfPESfFAAJETpp7LFM5YarVkTneWmMC
 dP6dSuDGqVH48OUBgSMAjtnwAMqlBc93JgThUJHYO1a6z8WXFOh8qFpouNmB92nEjfAoAUS88Sf
 FKL3XdlFVogHajwMsdsjOAtfBx1jotRCqDsj9XvrtZFhSWVeSmFVGuGoQ+wTbGVi35w7bC/Px0S
 z4LTCRgfJtwywIqhH61fZ6g8kV71TOBdceAMLyLfjflu1HuI1WGdmL3FbXsH/Nq0zslLerZAohe
 CuGqmFavPBMTNSk5zTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101024-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF37B367E30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.

Right, I already had constifying the various struct members in mind

Konrad

