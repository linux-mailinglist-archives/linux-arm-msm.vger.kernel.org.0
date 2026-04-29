Return-Path: <linux-arm-msm+bounces-105158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EXxCWTO8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:24:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B085491D54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0781E3056EFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A7E3BED37;
	Wed, 29 Apr 2026 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTWCpHbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4qc+lnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B63BE644
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454306; cv=none; b=e2AIAtnLi5GpyoBEMkHQJLzfHzfbvCQJ8TQxQ5k2LYW5h19PVfIrK6pFbOlliBVub3sYMbwwowqVhZlFZLpS/kkxHn3C/3LxfIBbNJdOqNFFHemn9hajfd9VQEHDLajjVg2Oi8nj7zQlaSt3YQVYdDeuYQwklUapHA1QtMTwT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454306; c=relaxed/simple;
	bh=EZUtQyn7RAjCFiclJIFM3vCOLYgR7e24GC6BguHNsNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jglvsi8eBRiTO1BUXhacSfDvZB1iwThQ42kDxkRjaWhNhIf3VDwrI7le2ZLReSHhsajHwN+hqPEiQg4roG5O89Tr5JnjnRwYnkNVDngpc4fRNrQ6wQvhMBLkEQb8M56WGF/0Mw3W2IWkdZoj5o5lVCfwxqOlhg83lUPNtg05quc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTWCpHbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4qc+lnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q3Mf2095332
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=; b=nTWCpHbk/e0vTViw
	vkQekcZNZI2UwzG28yVQwRStdEMyKLIXhN0vveD2bXRI3EwS85jgNJrWHUoptNki
	YxGiA7H8nCbXIknac1VC1Tht14S6PhmB7f2WZJBj9Vm50D8QIvFqrl+QpjPWC3UW
	OhWE+n2+Dtku63td0GVPAWV4vYE8i3A23yPDEBHMhwe70XdFTWmhROJoEJY3twwR
	VfV/llY1DI+mQZ/KNbYs9bCHBQkw1UhD2ylIXP20206TViNppWwSc8Oa5s/DPHvL
	Ql6GeH1uJcUdtYmMUPpa6+fi0svbGOKqEpU4lthtmMMyzNk8kMq0OzdfPHDemZca
	SGQiEg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rj5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:18:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9539afdaed4so499737241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454303; x=1778059103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=L4qc+lnnw2xUAdwY6LNA5K1ylkCvqYs1TesNDK+Vd9LGaKZ2rCuXmg5hDWVKwHbZi+
         jh1llut8ET5k6lgI7v1T8Q7azmDFZYIX38UVB4ucQrRjUBAwODOPZ/7ei/xuMfLVNJLA
         NEdAdyZysjoCq2zBVsKwvR0LUoBI14TTalUyARfAnEviD8iciX/npIocTcac45RNnaPo
         d3uehGGDjEnJUc4jLCPYIPiVl+D1A4aMVeBkmBetZPeU7iKMYEePjQy+nvdpZXhKTWRH
         H5lYSzzOboz0XV7L0awvjAyo8U9AZwrarLAEz+6jCFAg/iG89OUuHvXZkZ8tuu/1jDmR
         ZzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454303; x=1778059103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=hvOX7cS26gZ9TtTnkxqa4vxm6k/tgfr3RFpEDW4Bqqm431eG/meNYjfHXD5ttjW9yb
         8RPBK3n2aw4fEPywyoIGwGok+NK2pD0Hx9kz56NZxAhFLoAOGiLvYJ7jA1fSWOOoQWjv
         YW1nY5jVuOUQuM6osmSjMWRMFpQoELNr3IusQV+kgnere0m59c0CwI6M9e1CTvXSynJM
         a8Rts3v+p7FIVBoBQL/QVtZb7qY8e3fLJly6dxDKcWT/J95K7bU/Y7+SBbEhdggs3J2i
         BSBv6rPRDk4BgJTl4EpPlWw+HOCHkIShjvw8JZdpWTIfFlHqs48bxTXdJvmkCfg/mLz3
         UU5A==
X-Forwarded-Encrypted: i=1; AFNElJ/N/aFUFj3qb65SGv5mz/aVDWXewmHHEXPvbtXRlUxx+gorxdcqT2Yz2VNUABeCbOI0eVHTA12pjlG0co/G@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIv2k6lr/QvUJAvQJrtoJsa6pJGTp0yPNF0YnMYIc8X//MEsU
	/XTr7h59+lqVx8ybf2TnKh6zwWYdFmFSvFnpkjR8Ii+Gwtmly/210Ras7pWSCbBuDYtqIkAQNdC
	L4y1vgaBkU/1b/hqBzOkCmwrpns0TBfD7j8hZdUqtZ9t99Rz7zXMiw3aQwTBXOvMSmzJv
X-Gm-Gg: AeBDiesJn3DCZ4X+U9FjZlwBMzbJVCg3X29TsNTRiZMAsQc9uGfsfCHZLFRkxHmEUSJ
	qk+HhBbLlOxKqi1GSDg1ejs4tDj4r9/CVDfDLY+Gl7MdrnkbMiUzAmYkNpyde0Iu2ccvaTArgE0
	CIONF+Isn04Sbal4KDc/ALClI4F1a/lC9gP0A0Wk/g52fGjC/WNc8Aah0Vlwh/lyt7a6xr7DN8B
	e7UPYDj+etOJR2u/Ogc6B9jDZtffs1BKSPa3QWAX+vmWRcmhXCgl6UTe5cqIatRrwpSn4JMHGuU
	0i592dnsA5LfnkH2UNekZ/cJVdBGdCFefFvijvwlLRUPE2APYyrCd3CShQk0mgwzpIjSCl9dJhn
	6LXHTb0hJgLG+5KoYcIdjumz/YTtWF1+fiRpMaL8l48H1OxA6k3vKDWet3YQ0oonlk7puGL9FZm
	ZtjLBmlEFaxUr3Aw==
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315612e0c.1.1777454302974;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315607e0c.1.1777454302543;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb986113ee2sm63917166b.55.2026.04.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:18:21 -0700 (PDT)
Message-ID: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:18:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uf6sc3kpwS13oC7w5zofwnOPtI6R6TPc
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1ccdf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=2ZlRtKr-XBrgk40BSoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: uf6sc3kpwS13oC7w5zofwnOPtI6R6TPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfX94XT0ykjfs0x
 Rd9i68Y0oIXUNWi5EvGA5zZYhtO1syWeCuWbtNNBE+4pJIuaidduNh8SbIPWXslOKZdE/v1ghFf
 cIGDqryPuWhTVWsTq5dYiqzZ1t+1VRS+aYClMvNrTnFNTSPo4Hji4ATCCukjiAZyskYQtIUf636
 87Gc0r4Lb8IzG+3enLfECIq77uDzqoed0K7hPdz1XMuiLjnaHSTBuLWI1yH+RZKAv0JJ6bmnjJF
 7up19gnNOdbbv4R07xsXnK0Ck5XCZQ93Ax5UIB3dHvLhC6Jfpkf7+sPsgSXKcz1JlhMxCmsmOi+
 OoUV5Or7xRgk/XwcohqNF+w6bHkrOyadtMtAGgeRt1moXyxbOgZTNLRFuEIJPsmxt0zVSvp+3rJ
 c4vK6wKFZFFrcbAu7AqKNQ37eeLT0vD4aB8h3+ppdQtkgazKEo5wOXCz/vw1dbSBFgAtVj7nMic
 OAYLp3Zdz6bHJEMaNWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092
X-Rspamd-Queue-Id: 8B085491D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105158-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>> to these GDSCs to indicate that they are hardware controlled.
>>
>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>> But since they are hardware controlled, they can be switched off at
>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>> get turned on.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>> index 45193b3d714b..420997b00ae0 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
> 
> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.

i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER

Konrad

