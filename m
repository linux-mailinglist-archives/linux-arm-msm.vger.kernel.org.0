Return-Path: <linux-arm-msm+bounces-113903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Qr7JprnN2rOVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:31:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E16AAE85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:31:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GdHrPjjl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CzGL8Ryf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB4533004C24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA2F364EAB;
	Sun, 21 Jun 2026 13:31:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15210242910
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048662; cv=none; b=HPqCnBqJoHanc1LH0kqQujgH6lR+znb+jdy51XMeOfzpgaE6iW8qy0Bjex6DvNrQ2DzqBfgUK8AfMLZRsVhoKpQNYo+dLtNV5GM+MvuMTq9iqpR94iZDFGlAP76ROFN7VxdP3xJtIAQOJL7McdB/UDrBH4G54wYhaf769cTrDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048662; c=relaxed/simple;
	bh=N2uIoOfZZ0ySePD8q6EsZbcf1vvpAdfb+cBUcJki7gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWj9bAesBglnQ3AzmECjn3f+a+mG6dwz4ad9bWX1OK4AdjxQudlEi8suNDqMFopvYW4l29PDVW5jUcbsXE3llN6a3C51sKt2UX7yfjQM7ewn8DepDjBUIJ+w4kzP25yaH7c31fDuDaCzbsJhbM5h/le08CufcsMn3UEvhmLJdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdHrPjjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGL8Ryf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LAwBxe3249385
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=; b=GdHrPjjlEym2VB6W
	8tqAhEU3KW5oXDhJH/ufQnpyNhRt2YLaMpr5UrU49tYqq/bMzI/67eSK1NyB07A7
	1qFX7unv55e7h9pPFij6HsGO8tJIL01u+4iSrSy7WuPF/wYuyNO8zOWizTcwwsQv
	MR22V2Ll0YeVVQehalLxtfkxo3ppAhwHJqoKYAztfyOcVv25akEhlez1HH4oNeYC
	In32SPyKv2CCiTKnzN1iDLp6ZYygt+zYcTvGIN+IirCXWRTPNsnxfSFRvkWtCBi5
	rcA5dXL3qvL6tDJZmCdmLhr0H5VjjsJXF0R/cGklP+9ADtG84j+QRDlMZW0eBOhQ
	M90qLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32u2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bc237b5aso57951605ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048660; x=1782653460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=CzGL8Ryfd6vdmubXqEZOkU28kUJjF/raVnPkDiKSfHYh5NwaYK9d14qteZV8BB/aKz
         ymGcZjwXNKwtd81m8RD2gv/LRNDEYMeuXPOGBjn246hFsUg6TFZasdx4tq5v5jvy+cFm
         NP1UEl4OPtrf6/kCo12BQ+rxcL640L71atdlw7qgxkZP9mP+BBJv9dWzFQOhGf21r9MO
         ZwRVlAumhLLy7OYM7SaP2Hpwdko/u4EcIQX9YbX8qlM2KBliFy6wNefpSW932BD6o+xE
         d8loV6pDqqkdJrHFQ7vySa3ZpWhpXPP5r9rzw4MwXb0t5eS5zesSeC91johjJUusHCVQ
         b2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048660; x=1782653460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=mGAvJLuzyJSJsPQq5Ir6PtQHOoyJowxRVfLcXkR12D4h4XhPucguFgbdhWKfQo+Okx
         khBbR6OU6H8fZYTQcAppaKDMFbe8uNU3gBFP4b7BRgOtLVQrqe8CgfnIEZCSrnkEG9pU
         HB3tJvqBknT3lUb5chOxZrGTqtngIr/8VeXVbUjdRZi/MW3XFp4FbgnqZXtLOPm41sMA
         XgXy3xCePaz4ePLz+dKPDS/TVbPlicFunQXFZDelPQNqLK5tBDi6msqaz2GOnVxcDedH
         JybrdUFkEERujV2gDeBkp2afe7SeSmyAS+ZR6SbrOrF9d9IWARlcj99P5j144a+vBYkP
         r/NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6+SbOxdsqijHrtAplp3kor33aOmVCU5wKM83iV/846LAVgIX9uR5ZNBcRRbH9HPQt+vN1HXWpNow/xgw5@vger.kernel.org
X-Gm-Message-State: AOJu0YyA9zHwiYAPChygypkfmV1c7K+3YfuEYAMuuDy794MetekAHMFl
	kUu8QLShKdyQ3VPoYeAR+K0fZSFccrHxwGSI7aIhd9WG2Kejbb06HsXeTyL92nXbF4fu3vXb4OX
	ZK0s+bBYRyogArwKgwtBzAYg/a84vB3Nj0rKZzDYyaq0pgqSrnmbNiEw7dz9oncLDVWOK
X-Gm-Gg: AfdE7cmIryo63Waf7ql0GOLFU3VB/cQoY2vHnGLqEPV8lWcD2SZuis+v0oy8Qp5rOUW
	iRhvG6CkK+oUq0H29dnOMius58y4TKbt+9S3MsuGbIDbiG4jsixZtCa1dUpFneIprblRkt+Ak1h
	kZxJC5ox8aIB+Wx30i3Jl3Xugm0mtZjQ/BGBakzQgP1EqF9adKkSwnr1s5dMMRnfGgXNjAisKm3
	m4f62vbzIgCpdh6sZ4IZGpqAQPD8oa7hnmP7wUL1qjZLFrqXainnlJ5bixYacbnFav94zlqeyMK
	HkdrLjzmXNW+KEqHZIX39E9KVjHxQICD/smDJaTzsMmx3ErKm2hXTPfyf3DBgQ4EkWUK3sAO/BT
	wpusBtf8ZpGldHBnOe+2M1tDmSQ1GrNmAg4tmNfs8
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472865ad.28.1782048659580;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472395ad.28.1782048659143;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f9026sm48007125ad.53.2026.06.21.06.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:30:56 -0700 (PDT)
Message-ID: <9f89a2d4-e29e-4dea-832e-622bed566bc3@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:00:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
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
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
 <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Sr-UkiMAY9Ksw6HAnq9bum8IcCevK2L
X-Proofpoint-ORIG-GUID: 1Sr-UkiMAY9Ksw6HAnq9bum8IcCevK2L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX5Br4R+zMpUt4
 ppASmN/oR1+J++mNiTtJ+nERpkmf2JNSSoiOasPl8AJkQGl8eKetjlvcR7z84aAZraRkoOJxpLT
 EFBTuItvGMosHurNOyWHhLedY05XpgE=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a37e794 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-FpPnIJ-wZmyQQF_TeYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX284Qrs3gy8dW
 V13UKXhmTqUj8NXJvLE3uk/eIPwPz7jT+tMBrZIQ7WBzqkxvrsPlzbMl+FWSsnXbSaWNPWNYT/P
 w7WFcwmdjPGdmgleeQiP9tFoUJvOTfR6HafhTE5Eqp1gH5RYVqCYQJGFsUXfnp57Nb7eG6mvzt3
 xVogeMaPbhPNiYP3BjyT6RSPHBCgt/jw1APVLcMS8QnUS895UWSq4hX28zvLGLJQiMB+KvSp7uy
 ldqzVLv7DK64SsKgV01bGeQXiv2DOrpGEKJzzyI9by3G3uzieWgUXS2UiRnRUUrJzNvZD13DiYP
 Lu0neJVi3wS42nUarPgSikkBP9Yxie11j5w3nthSlBsfxaehlUcmc63qgdY4x3V59Qzow1z1cTp
 cYwOS4TaCpUL6Lcs9oQdcg/zYHiYSxOQp9O/Jkjvt+oF67exZPB+ARuv66z5fwoEBVl4NIBCQu/
 PNZDQ9c48mgFf0EPeEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 087E16AAE85



On 06-06-2026 04:57 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:13AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
>> default values. Incorrect settings can cause the GDSC FSM to stuck,
>> leading to power on/off failures. And update GDSC flags to retain the
>> registers, and poll for the CFG GDSCR, and switch between HW/SW mode
>> dynamically as per the latest convention.
> 
> Too many ands for one patch. Zero explanation (other than 'latest
> convention'. Which convention? The flags describe hardware behaviour,
> not conventions).
> 

Sure, I will split the patches and update the commit text with the 
justification details.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x3000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>>
>> -- 
>> 2.34.1
>>
> 


