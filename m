Return-Path: <linux-arm-msm+bounces-100799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIFxHSh2ymmB9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE435BAA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4C53037F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DFB3D34A0;
	Mon, 30 Mar 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTQeaf/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEBJZwuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D703D3335
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875999; cv=none; b=ng6kbWDmMnnhDAfIRoY6mDRdhzvVBIlNzDe4c/AZpeVjVaws4qlnZtVOQzdgOPO3hru1EfGo/Y2wtqcEvaUZrmmbMbpVMVW7LpvQrgLPT1zvElBZggdi4wCG3wbsqySRIvVChZkap8x93XIBhIqZxc07RwxIbQRPnF6yXUL0R3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875999; c=relaxed/simple;
	bh=hnJBIkRTxb/pEx74u11pPM/34htrB6sS8kh15oW/cOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aisAwgql/+aTL58FrCMLDnuo+sZNTYiEr62+2gBWi976c8jHMDjyEyyC4cnub4LTVfhAHEEBJi6VJ+/WQApxB2ndzivtm9wU2/Lc7wB2e5Sr04wSffSKjFtDMfSnDwTKFoPVj1NTXUtqlH3SjvI68NBEydOf3AxLn0y37uDBduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTQeaf/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEBJZwuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UB3Usu2765461
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=; b=ZTQeaf/bytoCSzFg
	EDH8gepEfMTHNA3ea5/l/Z00vj10jB0GWj/hak8WZ2+LJeykTE127InAgZiMx8GO
	XzS+nfcvuaPOcQSDV/SozA0cdn7P0iTCyazjW3u+in77R91Vp1YhT0ur9yrYylGA
	xTtTJH2szq98RqFxdWwzcUbh5AdSzfj6Oh2WLltinAPul7VqEGoEu9DTevdoSnzU
	G7Nu0ewwB0ISQNtX33XcF9XfT8fOiKcE3hVaBq5iYhS0xATgA6sbe5cZvXmLyTAL
	k10JtG8qp5qG3CD+Cbo58BxEgqrev9YdFl1OYWZEo+XALFovMpnZlEif36TQeUYG
	zyjM3A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c48n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so16634735ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875996; x=1775480796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=iEBJZwuJoLqzYX1ayOSt/bomnl1mo84JQYdcC+JOu6KmwGqzJYAOeNy16k5CH0zpUz
         N45VBk+8UzEbizpC+KanG8U276OK1C7myh/6gTl2CR2ckJEH2AfoMjQLtUWRcb4L2fbr
         gyoDpqebAVHjfYrbPM4lphPI+CPDJbDuSe2iwG9ktJ3vb//He+oyixcDkSioOuTwXIf4
         k6sSTgxlu5/4dH/n/aSHbGAtIWIhRK9xf7XGgRabjr3VsBGXLM+yuSVYukhaOF2H4+A9
         2HLG1Zvr4Vek7t20Bkj9fe8Mjj+2vdg7edNY0Qbt5vC3TRcN6if3vrE0tQXXR/jgkDjy
         CNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875996; x=1775480796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=DyjBhgke6UTgOQ0fWuZP5vYjvCyE7DArVudzKMg6g4hdhTDqS3HpBjywzZZdlTzh9k
         24TNc6w6iKHnSGYvqxWhTqB/dtej+Oy+SSkWK8v3wBZS1xv6Dv5ZT/M/DLxuuyYR0ZTy
         ejwkjBcq13buNM74C6prMk2hl23Aczyd4ZOxQIIerz9OcbZvx08LXwKf2zo/7zJ3aqep
         hFlftqQiwHQi1/clgl9CfrYItTyGopiZOefLea7o2h8F+9ggQE+Hduri/QrmQSmIatnw
         E6AXvNJuvKMb8XECzPBmHPv81HlE3apqctPJGKKaQSbCYvb4EKDQJELHQfz7+CR9u4qt
         4pOg==
X-Forwarded-Encrypted: i=1; AJvYcCW53Bu7CMVmSrf3Fmx0hBXr7P0rcJBUPsB3sYGS3dMa2npfJxaSps4rg+luYstQZps52LHbCLBldS2Fa+j7@vger.kernel.org
X-Gm-Message-State: AOJu0YzilKNN+4VkEWMQNHKnDN0RS1S6umzUJAgbvHU0qXleORGeZdJ/
	Fat9PLiZMp+dQZ76nN0vkNpPYBIpj9Sh9njHnJn//7fF3HoMkpe1UqnNfwRSSY7mM3/JSrVU0wU
	S2pWk10Jv5AF4p2hc+dFhF2undlbj94mYkNG7Kt5tAFPVXZozWtjyS+xq7JYPduKQZ50Q
X-Gm-Gg: ATEYQzw8chR64ltopjtmHLe3RNCCiZ2Ng6VMNr53toCPMRdNK2rtkV8zVdrNwgXSuKE
	osCN572PTCfZrYm6esFCX6cajETdZuiArQ1AZi0wK64nUOOhixYnjHbjTa+Kjs8msI5ZQUldks8
	yvP7zbgVx+XqOrC/UkbcusyfM2/C8Ij/zaoY478DwMXxU3EKVW/Zq3QZq2ltgOgdppYUHYgdt1v
	GnyA5pQHQ5GvwgzULCO3N/j5UTQuNX53Tt1wPsSCGN6EfpwY7LqhAs/S7b58lvBm1MjZLzU9UuI
	iWwDrAPGxbBnedSu5uFBcqT5OpW8DM304GfuRG1GbCTUkx7ewzHKB8DF0KvmJQ8mILxebtAwtT+
	pNnyMDXH/9VmVqYxCO+T96k+bgwPEz0h1gqXmzuOYQmWhZhlbDzIi4A==
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600695ad.18.1774875995489;
        Mon, 30 Mar 2026 06:06:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600345ad.18.1774875994884;
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24267397bsm88213025ad.27.2026.03.30.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Message-ID: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMiBTYWx0ZWRfXzkGntBEK8pBV
 FR8cm4tqOuxiUdSXg7gdaW7Q74sFTq45Ab+Gh+1ZUSOk0yAUxyY+5qXtT6mFpOIfXLBgSzMVM+J
 MnB1gE2S+2mIMkIlte83+D6ObRLqpA0A52xjRzQWKTtV5GdGMfNQkBVXc/JMWiSqB0pFcBaSzU9
 X0ZBKKC9bwgYG7wL4Khb5QLWvMoNUb1eut/BbuchGnGvKTX+sIkBIdx/K/aKT+HuTlXV4yIHbhp
 dhTrHeEoXlmq0+MZExXfnyGDqDHZv1tJ3pMdGEd/DEcUM+GA1lVey03dLhqXGxNwzAh1zIFX2ve
 2goahg2N8qFJs4nf48zO8P/PciZJRIWkWLtFZWhe34Nd7MO4eElYLDa8HjlU4KsnMBaHp8DXXga
 aI8NuWdaROr2yY1tqBjlfIrOAu6DQ/M1NozwCHT+t5/dMI/sdpLv4jrzVl3UJhQ35HXQuj3oGjP
 bL/BI0Bkl7LoU0A728w==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca755c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PIOu0JlNxAVOzX5nUJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JqzhZ6hYtbmRPN-LdCu2dR1AraCqIFB1
X-Proofpoint-ORIG-GUID: JqzhZ6hYtbmRPN-LdCu2dR1AraCqIFB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100799-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35FE435BAA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>> the PLL is powered on by the MX domain. Extend the driver to support
>>> scaling both power domains, while keeping compatibility with the
>>> existing DTs, which define only the MX domain.
>>>
>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>  
>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>  
>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>  
>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>  	{IRIS_AXI_CLK,  "iface"        },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 7b612ad37e4f..74ec81e3d622 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>  		return ret;
>>>  
>>>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>> +	/* backwards compatibility for incomplete ABI SM8250 */
>>> +	if (ret == -ENODEV &&
>>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>> +		iris_opp_pd_data.num_pd_names--;
>>> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>> +						 &core->opp_pmdomain_tbl);
>>> +	}
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>>
>>
>> Hitting below compilation error on latest kernel
>>
>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>> ‘iris_init_power_domains’:
>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>> read-only member ‘num_pd_names’
>>    71 |                 iris_opp_pd_data.num_pd_names--;
> 
> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> dev_pm_domain_attach_data")

Ack, Thanks!

Regards,
Dikshita
> 
>>
>> Could you please check and fix.
>>
>> Thanks,
>> Dikshita
> 

