Return-Path: <linux-arm-msm+bounces-105059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIhSL7j58GlpbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF948A8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BEEB3085929
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC68137BE9F;
	Tue, 28 Apr 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvUGwNub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLpzcB2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E333D4EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396950; cv=none; b=fUy1+0/tH0qmgYvwvE9jzvwcKddW5VCBnGVIh6Yy9Axyp4fFJoYHKuiDwQ0qoFskWPC3RdU8+wECjfqfVzsKgtOFirCngNocYwzh+sCEVdcJnXad2vCV5PASScahbNXrSznZLERn4arx0+n9l3OMGqwPmRLWk6WJPDuGEK4eZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396950; c=relaxed/simple;
	bh=gxty2T44URBFGSC3HEkf6O4F5zpV1qMH4dDFQOtLaTE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sloi4vAZ432naOU2xRGsFPD9d3XvPiDt+ZyyMrRp8oiXPheSXaN0W4GMwBnkQWPWxgQUQ1SxcxEo/QApR2mMLvhtZYIQqlHvKFF/mm9wVd0O9K3IU4yKdlpuqz6CiRQJg/vj08bqlNYedJQE6AzhwNDUCbPplOLSX+J04H/gqYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvUGwNub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLpzcB2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZsg4070724
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsXWUx57GnV+M9xTWTPOtrochOaoh9/pmfV4LuvWTYY=; b=MvUGwNub+W2s3+gI
	SFSpZvg1pC/VKCZ/eHTXIVPpUU4eKunZsjcwguaHfLamxmn5WnXzkswR/GYZJ5Ax
	t/XoYprPoqznXOJfPVNhwsrAzSOfqirsYDMnVmgvS90hqGcBf35HywfrCyrgmxwl
	fJ2WToeCYjn0jbZTjE1gtHsHvwpUdgcDehtmTrSkYNFvFTIbre2nEQQwrsnY7ZA0
	1PgdGlHaRb63aEVRC5weQY1VJ4cHxatF7p9cZBbodli5g46uZ6OREdz05M5xJMs3
	bU2e4ehxJypQakgFT7d2Yjxf2ZkUZntVNPYN6I46m+/T5DsCLAcL2UAdYCfBNQ0A
	SY2GpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhqex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6929605b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396947; x=1778001747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JsXWUx57GnV+M9xTWTPOtrochOaoh9/pmfV4LuvWTYY=;
        b=bLpzcB2x/iob11d1hh4j8h06XjYbqZNiazGKr+cSe90I0aYWQrttVtabZpygXOYDTz
         8RcQRxk7pNnZGfXDp/2TPo06Eh9aFs3ohgKR8nS5I4kEMz/xcSJaS3Sz7yUgjvb8Clbd
         UCYNYNtD79pb6lE5aQEI4lzIWpDoyTSePZbiV83t6+Zp720CtHyc8A75dX4l6XRwPJbp
         FR+q2DdU/aWKce0cZf5g8EDy4FPsYh7W0svp+c1VrAVXtuloh6NKq4MAsQWNhInavNA8
         +j+1BX7WNNYEzKSkKrW4rd6LEvnYKMsbOwMBwtHjt0H3i7wXeCoiRNtWAXpCXYps8y6F
         JOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396947; x=1778001747;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsXWUx57GnV+M9xTWTPOtrochOaoh9/pmfV4LuvWTYY=;
        b=ezA+vnuzI+NltVC1un8/2t+Z3CQluPGd6elyRx5JoUZ8v0kPbTWXxk4vtetTJYbQt2
         r6zf15xpcfYY1oKNB/nF+Dvk4bdIM8XC82gSUcRqGooacPSJ3BOIdeULEatp0MAPhjEd
         Gpx+MYGrwXZ9Hj9MrJjvS74/qYbketTQv4DlWgCVr1sxOx7MMJjDlreQwtwrrQJDg0Fj
         pjT57k0BheNcgVugFkyZl6lF9Eve/AgzH4dcQCKZ+4ai901PaD6m4DY0AcsWW4tcVXtI
         0ERPMF8S+nj4HssQBXXb780SDxlY7tQIwSCVTU+HvurjkbTe06f0db58V3ZApQGCIl5y
         FLEA==
X-Forwarded-Encrypted: i=1; AFNElJ+eTZz1poQT80GxHpeFYcan2V0WV8xdvsa6zOB4pKOK76g6JKgJuY+Zea3f3N36tId9Ja55TmIxgl46+o+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9uiTfefh2+uQTCDKy+MqpdWt0Fthtnvn62bBDoHNUu/WcGnYC
	AUxixagZUj91pDNCpir7ffikoQLs9XNoT01F2AHkNe5k8O3vuBapnFZZnkQznd1mBpqz70BaLvE
	lUxyUgshuCnQzgKYcENzyPNHuUDa0PMhOicalzRkdSQ824sGUIPeezRoKOH0n2USfQ8FW
X-Gm-Gg: AeBDieuIYMpbomf2bWVSCGRTQKnvCupkSkp9MZy8i05Edp/yPdKLWwZIjTq+3Oe8Xc2
	WA229zGff892z4wRixPBLk8xjy148IFYMY1mGbnB1K/udfCzWok8DrZiPlQv5qgQwzRNHdKMxou
	TzMdPMiN+pdglF1mOSIYMj0oFJgBRiNObxqdk1m8ZxIDF1mj3DspFbUiUXOwWpl74lVUrGFpEpm
	G+5iI6yUTNY54i0sAp3IS2KlMa2Ta1eGTviDHG9s0dBhhzW6i7Ir0p+1cKJUWWHWdxNVkyxz8rX
	x1SYO9nJr7Ay2ClmGEksPdmGvrdpTcFc6O0X5uUrHL3xlAQqFIcSL34PdaBmyUxIp5ckJPr67cn
	iYV0rWedF2H/gJSU1IgL8u8iZsa/+XSJezln5YghI/XRMwxh/FA00cQyxnZ0P+jlb
X-Received: by 2002:a05:6a00:2e82:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-834dda630bcmr4374571b3a.8.1777396947004;
        Tue, 28 Apr 2026 10:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e82:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-834dda630bcmr4374538b3a.8.1777396946487;
        Tue, 28 Apr 2026 10:22:26 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae0091asm3473988b3a.10.2026.04.28.10.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:22:26 -0700 (PDT)
Message-ID: <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:52:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
 <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
 <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfXxZKfkKB9rntJ
 cZ/TG8bJfvpeTCQ9vM2xAlq5KPTwTDbyqbJEF14J/ZmT7uOV0vqMnNfeI4hkS46b2XQbmtmgacM
 TV3g+0mBn2sucz3sjrVuflXeHlvM1ppGXHLm3PcY4beqOifbmhnJmtnNtZegZYW7ULedbozVZX/
 PhoptEeNBjgmxjaV+K3Bm92nOlURDJRYof6H+Ba/lVjCsKNcMsM0fEnfmHoWMcOLzz6Cds1qn5N
 k0idNlVZAGMhRS/hxsEh+UndsRZwnQH1UnilhWxur+lmBEOA4oNvByiiVmejMCkWVxJjDIKk2FC
 Ko+1PgP5+8FRAQZkUID4VsLUWO9CCw9lQrWyiFTdCZ3G/rmjJEJjwR09m6/doohfxDpxa7D/7wq
 tJglWnL6XuoyaiMo4FYpWs3En9AeCi3XXaysxmrBL9afT/LNJK1ca2hOdw0tYkAnG3oMfLmM0YZ
 RYMUA5GJovX4aC9lxeA==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0ecd4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uU37CDhMaAXootqMB7UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: n68TlR6tm5yxOrRsscZ0m-F9Jou5tZ92
X-Proofpoint-ORIG-GUID: n68TlR6tm5yxOrRsscZ0m-F9Jou5tZ92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280167
X-Rspamd-Queue-Id: B9DF948A8E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105059-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 4:43 PM, Konrad Dybcio wrote:
> On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
>> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>>> Some PLLs are already configured as part of CRM(CESTA Resource
>>> manager) initialization. Add support to skip PLL reconfiguration
>>> for such PLLs that are already configured.
>>>
>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>  				 const struct alpha_pll_config *config)
>>>  {
>>> -	u32 lval = config->l;
>>> +	u32 lval = config->l, regval;
>>>  
>>>  	/*
>>>  	 * If the bootloader left the PLL enabled it's likely that there are
>>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>>  		return;
>>>  	}
>>>  
>>> +	/* Return early if PLL is already configured */
>>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>>> +	if (regval)
>>> +		return;
>>> +
>>
>> Why is it being applied only to Lucid EVO PLLs?
> 

Thanks Dmitry and Konrad for your reviews.

This is the function used to configure all Taycan PLLs, currently all the PLLs
configured during CESTA initialization belong to Taycan type only. I will recheck
if similar logic is required for any additional PLL types also.


> These clocks already have a an .is_enabled() callback, could that be
> treated as equivalent?
> 

We already have is_enabled check to avoid configuring PLL's that are already enabled.
There can be case where PLL is configured from bootloader but not enabled during bootup.
This check avoids re-configuring such PLLs that are already configured by bootloader but
not enabled.

Thanks,
Jagadeesh


