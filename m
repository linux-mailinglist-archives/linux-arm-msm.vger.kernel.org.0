Return-Path: <linux-arm-msm+bounces-97645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF7DFGKotGlvrgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:14:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3928ADDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64BE3301CC53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 00:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287841FBEA8;
	Sat, 14 Mar 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="f7Twkly7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89317BA6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 00:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447253; cv=none; b=D4ctJI3OZ7Z0Sghn7oNWoJNuAibN9qNsp/MeKI67hsG/V3SdbRrLLEBzayi7gdT/Qb3/hLB1naURSXNxJjQvRf1vgNou8GuANQQmqdHo2qjgrHpVBK1WX1Pa4tblkYhLjMyhp3JLonb79T1gfYASsBSngyWafZ1NEGXwdDu+T2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447253; c=relaxed/simple;
	bh=SWQfqoxAVSVc3MG4BIFFiad+Ar7y2VBJ2CgV3JDrNWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDgAgV4/rm8itT/k7LhVYsX3FIDdQH3ARkba6ZlJacowjrUGAwAIKuTeH0IXcCd96COjml4o495QcrkAW8Chfexv4RXDL904tAGg4Ilf6zF+DcMhwEO7wpCgx+szO0A0gkJ0trq8KKd0DF++y/KINkOXYVmJXB7h5roXRnD476g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=f7Twkly7; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <31c68360-97a6-4e23-9d5f-f141abf0790c@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773447248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryMQNhmD2GmNjWhcynx8JjeJbIW9dzR8WFdHL4mMvTE=;
	b=f7Twkly7NxETunS7DTleTLCIiq4Iy6wXgQT+rHSZwqD0EcxyjrfJ4uW6glQaUU6ujjMCxd
	/Ug3qSVkPFmA+avY8DQkbeDNdW4HMhxXXuJnLNvgxrhjNuMqCYXgsdGAlvHOzH834chVfg
	juDQiGPIU+ipLxWSmujt1Kyq7kih5vIhlgJdl6ok8lul4FpkqVugpRl0D5HmanQz8yGAP6
	dyoEqw4ZQ2FPYW7mZRetLQpWFxDfv06qnIpwyRyU7lfUV54GAcZSnmpYYr3bV/I9QGmGL7
	XU+gSubhpnuXwI6250/jbuSgazFaRqot1JkuuYCvK2w8PvqJIFQLqU45E9fJ7A==
Date: Fri, 13 Mar 2026 21:13:53 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL
 GDSC flag
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov
 <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-11-val@packett.cool>
 <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97645-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:email,packett.cool:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55E3928ADDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/26 7:53 AM, Konrad Dybcio wrote:
> On 3/12/26 12:12 PM, Val Packett wrote:
>> In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
>> HW_CTRL flag, but it was missing on SC8180X.
>>
>> Fix by setting it on all applicable GDSC entries.
>>
>> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
>> index cd4c40a81c28..67b2055bd212 100644
>> --- a/drivers/clk/qcom/camcc-sc8180x.c
>> +++ b/drivers/clk/qcom/camcc-sc8180x.c
>> @@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   	.parent = &titan_top_gdsc.pd,
>> -	.flags = POLL_CFG_GDSCR,
>> +	.flags = HW_CTRL | POLL_CFG_GDSCR,
> FWIW downstream seems to use HW_MODE at runtime and SW_MODE+collapse on
> suspend for both BPS and IPE, so perhaps HW_CTRL_TRIGGER (and a patch to
> the driver) would be better suited

Hmm what exactly would that "patch to the driver" be? Not sure I 
understood that part…

~val


