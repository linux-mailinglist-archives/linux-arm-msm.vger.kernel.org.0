Return-Path: <linux-arm-msm+bounces-117590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0km3HoI1TmqnIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E697259BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:33:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ggxFf/Bh";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="O4F/xYT0";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117590-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117590-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E9EA306FFF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279DB46AF25;
	Wed,  8 Jul 2026 11:20:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278A434E3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:20:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509617; cv=none; b=b8W3LZC/4h1Fd5ERPHRN0FaqGaR1y+98mM2hZC/KbOgGKcD6SFqTq3WfkddbsORz/tZVQnx0Yobzv+eXnh+aGcrRIL03cBFVkP/XcJoYd7KBjvPmlok8DLtIpiL0lav4/SGn4sPooG6fJWcEA/uZL5yJJRuD9ovloU7Sj0AQ7vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509617; c=relaxed/simple;
	bh=RPdmKLekRxNdh9LfxzY8Qsg5bzPJ6v1a9Z6UXOIW+c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekFP843Ar9W0f56I4ZD7bH3WYWBs71CpO7YBP8UngAC3pjl47+VmwAnnpgZyoq8M7TC2tbTDxDN87+2gspVE2rKLX9zu8vT3NuXCXhmO/oqmtzgHJ2+kp8YtHpD0Qp27T3RU8Dya9VN/HrhRxWm9R3bfRs5V6LMMYEVGselMrIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggxFf/Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4F/xYT0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889JLB2205860
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=; b=ggxFf/BhJiz6e+0R
	CyrRq0Wu76Xd5ubTtqtwz0kpr1+e7nwze8aes8Cqupt8xc6ANnJwicF8PdJLahoE
	3AOkFM2Uv3BIQOdKKoXDQ6VdVP3KQHgEfiNQz/fX75d8wZx0fyEf8QGayp3TbUkS
	Flam3lsVZoJsr4GgzcquuXm3a/t6uL8GaUyBQ65ZmDorNCA4eal79DKpbabGDWgm
	/QOeVv9IpjBRFNMDs3T9Y6gAgZ8Xobw5q1UrdoZWk7NGCxzBzn87zCZd1fQowlfj
	htWIDh7jLjwciCtZndLmrurCVa/8CmJYPkhsHegra1j3R4akTyWdytsUwOFHCg9p
	j4M+pA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv11a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:20:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so799059b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509614; x=1784114414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=O4F/xYT0SYD/TbR/3t5Uz1ylBXvvq0OlPgB0xH8s8nVah9meRgk/gz39gle7sVgR75
         aMFgEa4gC3qZYpzQspcJLmkWmswhIpZUxyGRYxIv84a94Y2cPt/e90+lHxP5XSBwtMCp
         dYJofJnPbQmTesKauIXG50Y6JP2czTtOPYZ85GBP7u8Ye9C0iayqsGKOuJGdixGXiXxh
         gVAHCJk8RgREVVtNPurqb2FpVIPCPsvNBao7ZDHlvkxwW6pQ9EbPVF9rPn0xtMBVAB3a
         lZS4UncmLDRDTRF/MPFQWxsSFC62JiglM3TL8e5nEbywjmz4gl+pLwLSt/OkUtJqgzjW
         HlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509614; x=1784114414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=oy2tF7GtkispYVQGM/EVj0anyYKFYryDLQz6V6kNesSO1MxyP91Dv2H+30iA1XQqn7
         RIFYBc+HnFa8af9kw0L6lodaDcxoxTjL9x8ZnwVtfLaW4RnqrqATPaSUehOzXddhONIe
         t+t6ueMeEqkmc+X4yKg+r7brRMzxMqndZ1//KSJ04G479iEMgYO5iSSO8movRq0eCiaB
         QYGef9SadsAZ0JMaZgzlejBiixDx77/zYQdbkCivGRaH7xNy8rUq0PloGQB1pYylUxoA
         ccUQ3gYhpH8s/nUtwY7Tga504G6MkSp08pp6XqjdF6RdnRTWGG+IBsLlz6o2ldkZeLUf
         4oJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT0eXUbw5Vqo+aNPuXSPVh/j1XjV+7PIoKdZjXcdJz8QWxoLKwL+l32N4WnKvTZHn9R2a1WJ9aSuVBVofl@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPzKfIJafJtbXj/ztgcXpZ6Nbc1/OkrVLFMqMmXPsioMRSMRU
	QRcHhecWzNGeINZV8E2SoI5uVR6s/iDoR71oUHbxheJmZ9wa0t7+zhySizl3GdgxqJJ79+3pAiy
	TM2oOwdZU80SoYoYIK8uVm/yLNfmyoch3SSONQ6lrPBVBF1wDUMMXLRjSi4ElkD+8sr2j
X-Gm-Gg: AfdE7clDpdbsTkr0g+nSST6lDnc57LjhMS+Gq46PN73y+30U9pc3LDRet+5iZyipGko
	fDe1W4QQ9W2BJW6nAU+8L64pjtIJoItdpP5x2vUWp7qT2m9sWLB/lCabvoZxkY4lOCpuDnnivgD
	O1Ov0d5Z5sqhmdk79KGFNEsSxJMpajGjpwhGtuCA3C6UCuqbswEWzb+7JDDunBq18+rz8s9xIwA
	0Y2heFUcuJQPey147/YnyqhcbHc5jPgo3sf7corwgjgokM0DF59GyNgflTvC4otAG7yXPtn84bO
	qjOm5ZhjAI8pJVngHwVboBTityfISg0yoHokwL1PiezolWl16PJRtq1dJWC6nGFfFCqTqKONOUy
	kwp2YkdStL0qU554cDBSYKRlIhz1JRhuNFqZI3uE=
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399876b3a.75.1783509614458;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399838b3a.75.1783509614026;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm6918923b3a.3.2026.07.08.04.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:20:13 -0700 (PDT)
Message-ID: <899a5964-bde6-4cf0-a3e4-f6d0036dd3ab@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:50:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
 <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e326f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KQFNWlLbjmTlgseXzdQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX4pefdeuLCG6A
 Q19txtYWpKo50Hog+0BticKIGG7huBfwJo9HiHrCAzW+SxrA8UZwIhXY01TDzkhT2IVFT7IN1Qo
 7gHJl2heQwPlo0bhlQ1X+4RzMASK9c0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwuxaLNI/Ihb6
 x7MnM3XDjJmQtrqfi3jN8ZMqvuoVJsGPoKoJ1SdTGFvAFuGj/gbYeyp8uCpZ3BQEZaEMzIIeppc
 DhDYnb5bjhF68jPKFQ5kOjdqjwUysyDz9WltI/57ZQhDH1l2/CjfBTRmo8UIPWaH6qid+GHg+o9
 NsbOCNEvK/FLRtxoawmYTHrngBScQWjXSOix5FRezEWKJOawzuSxaoBc84uov/RGpVQ9e0VfBCf
 msGfCY6Gc2Ad80FQXZqJp9qbEqp6dIwGeNLkDmct1jgiXPPfNekgJjcmUPXSGCYjtQxO9JbGGp7
 6Aao3TnDTV/Rv+tDWVufy54nD4yh3hv6mr6T61II9H9ZjzwnuNiriUL4qOH0g8Z0cwwvLkjGfMU
 gm5ph/5nGCrrX/2h6DAOU6seO9rpXZDntoPDGvjKCRFN5azSuQ5CRJdn1PxJPCkhMSm3gUj1d/E
 Gq67ckrhPPQf/bvxXbQ==
X-Proofpoint-ORIG-GUID: sVJJ3FrKIHVR-SAX08dGBIeTeFgxZPCh
X-Proofpoint-GUID: sVJJ3FrKIHVR-SAX08dGBIeTeFgxZPCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7E697259BD



On 04-07-2026 05:49 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:32AM +0530, Imran Shaik wrote:
>> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
>> the register context across GDSC power collapse.
> 
> Fixes? cc:stable?
> 
> Also, while we are at it, move all fixes to the top of the series.
> 

Sure, will add Fixes tag in this patch, and move all the fixes to top of 
the series in the next revision.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
> 


