Return-Path: <linux-arm-msm+bounces-105058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J93Kyzu8GkvbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EF489F32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE516306E5B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8D93DA7EC;
	Tue, 28 Apr 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zgj/vBq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q594Efyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F37406276
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396923; cv=none; b=UcNgrSfs3IJLfLYnoxSCWXfllI26QJI20Te9Lh/js44GolSjJl6Il3Xc3JuTcsWkJFLBQ+SabpmFCG/96DjgMuD7tUq3THAPfhAZ8hO/b+jGwB+7UpnjT79v3hEtDxpHIPjemZ8U/nnk3YKgFSb0PPnI9kzXfXkUo5+TYx4ddmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396923; c=relaxed/simple;
	bh=+BJebmGZv5L+CpcsUlKbX9w4WfPuB/kmCkcyzr5U4rU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BCVj2OIHfOufjz8uNBykTTAngoidIxp+P+/e0UXgJcLao5TC+NCH2QndkxCPGBgSzE2ug98l21QXMGJirj6TWusbfyY/EodEKbEmTJlRjdZlKayxIMY0VNxE1NuU7xsFESc/ZWJrw8r4naKrTf4qfIXO35xFlrZ8EHhQxUc2Q/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zgj/vBq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q594Efyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsgoe2890960
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=; b=Zgj/vBq+4V+Yaxx9
	U7L7jp2rL0oMJgoZBAXmDE+9S2Y4ivv7elhWum/sN4h8ntIVj/EIVs/zmqd3Mp4M
	x0zLV/54Wh6IZSxfJsbAO1rieRfFxbjVyxnju25+y8yoDEWbW/KvYAzccA4AHgja
	bi1G5jADU2/Yxi6KJB2q8oQSQ/GM15uLsNOHIIBG1PXqrmUHWFDHfngHoq4ghzbE
	Olor+IEkon+eWFjqPb8ZQtBpj+E2jlyDBBm65oWg4XPz4Lh92APBkyBuzZewAxsQ
	ohQISFTuPKk5VGcbVFC5F9zHKrY66vzneX7oLTytTBvieDbzSEQSI6TpsBm5Hmfa
	6VGl8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgysv39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:22:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e5791871fso15194230a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396920; x=1778001720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=;
        b=Q594Efygw1zVoG/EABmYc1qPCsCxcUPJiCUSkzbQML+Tc55fOyAxWVHz5m6AuNMyil
         18WgmD08Birdm7/YeBFkqsgxT4KlCXjyEx68m+5Ol3KXnOgG9vGVrgk9NFOVOdPtcE2I
         k+5b49ZR+dXdhb5UYUHrDKvSwYOmx+4cosl7sKFg+OU05+57vriQWhfDi8hUZfIa3iDk
         udTTmSu8+aYVnE762jrSmi/RfAope6GeJ7swhsu+XauddES78C7b/zbsZJtH/FO8CgaI
         ZtN1f1bJDkTC6na6R2qcIlIB59x6xpWn7v+QqaHBPoaO0ZT3V5hxgTzW/NxEtDr0qRYC
         upJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396920; x=1778001720;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=;
        b=X2T8G2FBZy4encXeUKagLoZkiO0AF7K6K1yBmfv669q6zmkdUpoTFPGwAwraFmZWWL
         uAv0p5nDdLU+4T1O4vUxNO+Mg/qwcpLUcHyjfZW2g91jj+YHAqEjK5GHHYz+fAuXD417
         L/eyDSiGiV+tMkbrWlr7SN7aCQsG1RLE3TdsOXfxQ2NzRdrZwS+kyL8o5Aa88aTshLMb
         j3QDozsAyOPAJx0YFtCmtP0bYTqfd3eF0EV2yhUQCGNQ5+A8Ul/aJJByQT10iKLyPSQt
         MmTQ6D5fnNYMS5IWveMPnp93pOuKkLxMmbPl7CpIP2Uox/QlGlpyXyvORNT54i234wVJ
         UWBg==
X-Forwarded-Encrypted: i=1; AFNElJ/p1BIhaSmcCfbN8S56ussaR0uFUEDKEWqZjBUjPRPFMqQWDUr/ROh38YeH7BrvMMbCb5kF+3yder3gLRKc@vger.kernel.org
X-Gm-Message-State: AOJu0YxermETpAUtglzp/nsOaIR+clkaZRrXYML0S/8+sjMHXbtI+hwk
	ufi4Iq8+1VcXyoWGgeKu9q2WqVmbk1ilcUZACv08LKhuhAVuTo/KlKBHqJZA6zMl26aGxWhOMHz
	PzoLxltcmio1VgU2f6snvAD9A79SZ6+v+YZPonmhDSa6j1T94uR12r9VRSQCEs1/1BzSo
X-Gm-Gg: AeBDievyWA6Uf0QrB6kyWbzeOvhm4qzSCAdCjhgCu1DhK9Xe1v7/Lt2hoVqih0CqvES
	Uy0q0UAycKSxDAW7PkTnfHw9hAilSIqlcthcLEGRaKOcqoTeoc8sfKPb53S0mcQOy97sULz4dke
	O0hWYjuXSGbrMyy2Acxr4RYWSMnqZLAxlMvEtrB+oVIRqpibjsA6sIeVU7Yek87AsIIDlir3Mid
	koYlx4fQLpJ+d479qXTc2hgDA+TxTSk3jljmoSC287dvBAHFf9fnhhYGV1LRq/tejZictIBUOn2
	TJ8xLRsrWwR1pXCrQoqC8+vC2Ic9bpmc6YSy1phUDJEAdyzStRSE9qnz8tlcMr9coukZ3nUAecQ
	7Lyo2mRz6nfjxCExidk0b+EVqciROV2VB/z6DeOJdSZkgq5OtNMWZc/3VW5r2sMBs
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr299371a91.2.1777396919760;
        Tue, 28 Apr 2026 10:21:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr299334a91.2.1777396919181;
        Tue, 28 Apr 2026 10:21:59 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3649fe8990esm349871a91.0.2026.04.28.10.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:21:58 -0700 (PDT)
Message-ID: <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:51:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
 <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
Content-Language: en-US
In-Reply-To: <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FLvA3C40Y2KdWzexDSr4o0voWMvLZV3H
X-Proofpoint-GUID: FLvA3C40Y2KdWzexDSr4o0voWMvLZV3H
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0ecb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hyz_MBUfSQ2kkO8oYCUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfXwfUHbdE8b3Wz
 YflwItWjxcEndY1LY7L5meAyY8LWGq3DfoRvK1w3VfcY28EJ8pugyl75Xkhy4l0p7NL5hN8QzIV
 2RAHmQ3qP+IPyrtdIN99r8iWxxHPufdPu+05ijuYIgFYEPxrW/WYVNsodCgSZlFQdRhpJ2oFsej
 6dURglH75HdQ3U3xR6DIV017ZFXBDc4EF4QrEkS+kPvz81odAoHRMoY9HHFGQwVJUcZgeRBIUfz
 XguJugxv7EFbzn5eI4HlR+c4saWZhNnkZH3rw1pW/kMjbgg2/mFJHoJ6w4v83HvIe89LhRyViBd
 KZkn8ORT4AvcSLSjrejPJPP6cbcWby/8W4qjFDGRrJKrFsdNUV6U3BaghUdhCVYP5CQ+aCtGIhR
 sVfJIe1oq7v+9Qp2LUf0CQ4I0Uk16dEPEHd0XzRYnKr/l4AI6iSYfGi2q1jCZ3PR0e+JCtUotoT
 a7hs60oI5M6K/ajHN3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280167
X-Rspamd-Queue-Id: 5A9EF489F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105058-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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



On 4/23/2026 12:03 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
>> Add support to control the DISPCC MDSS MDP RCG and the associated display
>> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
>> enabled, the clock ops of these clocks will be updated by the common code
>> before registration to use CRM specific clock ops, allowing these clocks
>> to be controlled using display CRM (CESTA Resource Manager) hardware.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
>>  1 file changed, 56 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
>> --- a/drivers/clk/qcom/dispcc-sm8750.c
>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>> @@ -71,6 +71,16 @@ enum {
>>  	P_SLEEP_CLK,
>>  };
>>  
>> +static struct clk_crm disp_crm = {
>> +	.max_perf_ol = 10,
>> +	.regs = {
>> +		.reg_cfg_rcgr_lut_base = 0xd8,
>> +		.reg_l_val_lut_base = 0xdc,
>> +		.vcd_offset = 0x268,
>> +		.lut_level_offset = 0x28,
> 
> Seeing this configuration makes me even more sure. There is no separate
> CRM or disp-crm. The CRM resources should be consumed by dispcc.
> 
 
The CRM can be used by interconnect drivers also for BW voting via CESTA.
Hence it cannot be consumed by dispcc alone.

>> +	},
>> +};
>> +
>>  static const struct pll_vco pongo_elu_vco[] = {
>>  	{ 38400000, 38400000, 0 },
>>  };
>> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
>>  	.user_ctl_hi_val = 0x00000002,
>>  };
>>  
>> +static struct clk_init_data disp_cc_pll0_init = {
>> +	.name = "disp_cc_pll0",
>> +	.parent_data = &(const struct clk_parent_data) {
>> +		.index = DT_BI_TCXO,
>> +	},
>> +	.num_parents = 1,
>> +	.flags = CLK_GET_RATE_NOCACHE,
> 
> Why? It wasn't there beforehand.
> 

The PLL rate can be changed by CESTA outside of the PLL callbacks, when a perf level request
is sent via CRM API in RCG's prepare()/set_rate() callbacks. Having this flag ensures that the
PLL rate is recalculated from hardware every time when users query the PLL's clk_rate node,
providing the correct PLL rate configured by CESTA.

Thanks,
Jagadeesh

