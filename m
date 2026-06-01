Return-Path: <linux-arm-msm+bounces-110492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBuDO3j+HGoYUwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:37:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92289619411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DA6B3013D56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 03:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC715273D6D;
	Mon,  1 Jun 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkxK8S7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNRt4d/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D3277C96
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 03:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780285019; cv=none; b=i0l5zNw0VC4Jz0velQpP05fbyz43gsSEFDThg+WniFbYVzclGEhg3nQ8E3AdLeTgN1/bVjmfd2o6+ZsGFSmKI9HLVfWI06Z9SkAjHCnuSZ+Df9pE3JmUer5ZKrZbYiCsF8vFZSrOmmYvT+P7DwWtCfX35qLfHGFdMtOEJWULCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780285019; c=relaxed/simple;
	bh=1DrukQp3wK0gwEV6QysVx/ctZfa5SwEFhYpTIFcXvjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LudRHTXokBuNppwkumG81SKgmzDcQ57vldaetkBYUpb/NK6BJDyxZU0b4vo08q3LqWpF+J7v3Xf24tlgXgEXuEU8CBDAkgKbPSLQ4eK0dUgBTy2C3S5BEPveZ8f+Yvj5lqvcVY0KiMfxOYqG9LaPcHpBY+DMq2oqNv1SGwi80Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkxK8S7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNRt4d/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511O46g196252
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=; b=OkxK8S7K5UMKZj8g
	CdurlZWGZU7+eB2JmC6Zhu/Yzy288rmB3MUElnbsdT8id5GvdJvLuOBw456zmARv
	7NqsGXaLETG+WiUHSGFPbJV+ufP8gD2KUS7Pv83M4WKrIiA4w1yYDRz56wcspzWx
	dFTR5nuiDXhH+xyGHUYyw95J9zIRDtfCoilZgEHpQEw8RobYIRSthdqZh3Hd3sf6
	FQTHh6hcV0SR5Sww1akzWyq2hlH6k4S2T0LPHXCEgUpwf88pc2sHMg+CuX49zjhi
	/xXxCDtVACmHNYhgV7UFVYmtyq8oNKLQVtO57R5D9ciF24DWYl9r+4oX8Yq5z0dC
	YV7jZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pp30g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 03:36:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf55c3f44aso13751515ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780285016; x=1780889816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=;
        b=MNRt4d/uK2wivPDwyCl+0RVP40a/pXj4/zjwQJPUx13XKSR9pMvtSTZuxl3IiQqt1n
         d/3dN2NB8FCilqlL2GC8+YOdjvUlSy6MdxOOrOmQarOMctE+w4y+aes+DSTq/CJERkY6
         b6+/91CiZ+ADCYJWaPQj64eYl5cC3I8KVKA2k74iTXFsVLK8BJ1GhlRTY+bNDvvAg7Py
         YyppOgfQpX2W/N/KMgU2Qzs79pi8a0NgXTzPxNcjYuCsGUJ4wv6leas1cPrt5nJmhiXj
         5VKznM53zdGCUTjAspzUlz1NM/nWNja6ndJQOuDx1zPr6VITu3YeCaVYFTzJ9b4vXvsp
         jKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780285016; x=1780889816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=;
        b=WanxMD7edv7dpXXXJsK9UTyrbepHitEhnCeqFtXrUkD8n7rOGv+pGSTCaDwp4wtiqx
         USg1XamHzNrMv7d0mxzVZ+OzNaNCkgUNiFzuvU/x+dprk70AE/fnWlk4ITsiIlzO6RI2
         MIwgm+aFESKukVKufUDsI1GsGk6JURyswVVatxYh5bCcUc9xmT/tLnrN18r9H7TDOjZO
         /ryPlS/Zlo++X+46wwxn8RbEhN0+amZX/RcBUdPRRmlQgCMQ3ZS9pvCB5eI+qC2C+b8x
         YHAUG33h82CvAWgxbo/Wf+nlvOQrAs1UgeRENa2nMEn9ULkcJeOhfgP0lQdqEj8vRJL2
         RIEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+godNPUUUMZqFXjUHkd7RVdCG7IXgdatxh53gzZVfuCTHu7cqzlhKes+XbXjJwTVco4xa/Ba/H8mwp4gGM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIgOj6RfmSjtG/icxE4aZT/Bpq7sLa0/GZaOrrV5OWx51kCgMy
	8RLmva7uuadNCLQDPH+RYUYoDVtqns2SqCAFQHZxpQXiX7vWH8+2bqoUZRoHWPy9j0eFKBofkzR
	9YpmqQg/Pfoz1qEazIErPHFni6BkdHt8FoprcaUX8bxegWNQxcjxUq388Q6ArfVFWng1z
X-Gm-Gg: Acq92OGmeC4BD2a2x9ysD7XoB8lO3NB4LOszTkzDmj5Pgw+rwdXUTvPuXQTdgG2jdB1
	5H27GdgkRHh2E3oCPIfWwHSXKVy7i6dK00QKbq28/cSybvfFK8MZPgLaiZkpL11I4craHz6SoR6
	DS0WWgw4ClIvYC+UIJvWyVdtmbqj4nOZojTMeN3uWO2r0cYWjcEGD6aEKetNEyOBCeuQRp+uMAL
	KFDNKelLkEJMGmXsxLTLWkekKEY76sepO7JKZbUpSJbFh1aWDAt6yUH/NeMrdWm+HtcGsqqAA16
	NeIBhCUL1a6hl9EimCh0Sv2ggSuuBqtiA6nIhFG7RGHoJa+hkSwM7DA+qBJU7iGMvuDJk0Jo7w+
	FbIJq4AfgOSKH+L61/5Xa8x5x5UQ6qFQFkn09/C5gSsiCTnOANX2ABgJlz0c=
X-Received: by 2002:a17:902:ce07:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2bf3795d52amr80095665ad.17.1780285015988;
        Sun, 31 May 2026 20:36:55 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2bf3795d52amr80095275ad.17.1780285015375;
        Sun, 31 May 2026 20:36:55 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5c83sm89026105ad.16.2026.05.31.20.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:36:54 -0700 (PDT)
Message-ID: <e3b50b6c-cea3-438a-b9b4-f95381d1a37d@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:06:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
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
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
 <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
 <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k1uw23hqVwCpZWgGfUm4aBLsO2xTJfnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzMyBTYWx0ZWRfX9CGzEEB+POie
 /zYAY16WuZCZKMFLL+yVPHb44Pb7X/08fOJw5ao+Ez0qdMQuTFjFaGqPnqjLOyOI+E03FFsHIUG
 kRS9aj71ehhSuSoQLr3mbON93vLpSbewV/x7JkqKVCQeQspWIfVWo49SpcFHlQKijSiqfDveX7x
 sQo0dbB9X51cQ1kbc1vA/VLdASGbR80p+UHqixHZaZXHCmHW6Ac8pugGuZ+iQHRukZ4FlndlVZB
 ehBGlRG/wmLW3/+7zRR8niZohMykYNqVb8kiJjvNkQi+vd9ya5vY0VaoXe9ZLkB4JihsTr9J2x6
 R6jVHCUlPUaOlVXeqWkV9BQMEQx/CpGz7muDJ80X3hSIMFyKskShXFYftorD93Xa8k98xGfczEc
 23GUeEkl2dX0zY0trKRzLisGywBD3XqQW2X7JPPlJ3FReaSIqO95eEwgfTN2cs4vVTwFoOb6xY4
 eC6YYVon5Fsr+AzeTvA==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1cfe58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FgJNp3MjKRr4f5UNy7IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: k1uw23hqVwCpZWgGfUm4aBLsO2xTJfnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110492-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92289619411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 05:04 pm, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 02:53:45PM +0530, Imran Shaik wrote:
>>
>>
>> On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
>>> On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
>>>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>>>> but has minor differences. Update the parent data of mdss ahb/mdp clocks
>>>> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
>>>> flags which are applicable for both QCM2290 and Shikra SoC, and add the
>>>> support for DSI1 PHY source.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>>    drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>>>> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
>>>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>>>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>>>> @@ -2,6 +2,7 @@
>>>>    /*
>>>>     * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>>>     * Copyright (c) 2021, Linaro Ltd.
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    #include <linux/clk-provider.h>
>>>> @@ -32,6 +33,8 @@ enum {
>>>>    	P_GPLL0_OUT_DIV,
>>>>    	P_GPLL0_OUT_MAIN,
>>>>    	P_SLEEP_CLK,
>>>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>>>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>>>>    };
>>>>    static const struct pll_vco spark_vco[] = {
>>>> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>>>>    static const struct parent_map disp_cc_parent_map_2[] = {
>>>>    	{ P_BI_TCXO_AO, 0 },
>>>> -	{ P_GPLL0_OUT_DIV, 4 },
>>>> +	{ P_GPLL0_OUT_MAIN, 4 },
>>>
>>> Why?
>>>
>>>>    };
>>>>    static const struct clk_parent_data disp_cc_parent_data_2[] = {
>>>> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>>>>    static const struct clk_parent_data disp_cc_parent_data_3[] = {
>>>>    	{ .fw_name = "bi_tcxo" },
>>>>    	{ .hw = &disp_cc_pll0.clkr.hw },
>>>> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
>>>> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
>>>
>>> Do you realize that this is an undocumented ABI chance?
>>>
>>>>    };
>>>>    static const struct parent_map disp_cc_parent_map_4[] = {
>>>>    	{ P_BI_TCXO, 0 },
>>>>    	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>>>> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>>>>    };
>>>>    static const struct clk_parent_data disp_cc_parent_data_4[] = {
>>>>    	{ .fw_name = "bi_tcxo" },
>>>>    	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
>>>> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>>>>    };
>>>>    static const struct parent_map disp_cc_parent_map_5[] = {
>>>> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>>>>    static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>>>>    	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
>>>> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
>>>> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
>>>> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
>>>> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
>>>
>>> Why? It's not mentioned in the commit message.
>>>
>>
>> As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG
>> parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them
>> accordingly and mentioned the same in the commit text below:
>>
>> "Update the parent data of mdss ahb/mdp clocks accordingly to the hardware
>> clock plan"
>>
>> Will move these to indices approach, and add in a separate commit as you
>> mentioned in the other patch comment.
> 
> 
> Why are you trying to move to indices?
> 

As there is no functional impact I was of the opinion to move it to 
indices based and make it aligned with latest convention during cleanup.

>>>>    	{ }
>>>>    };
>>>> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>>>    static struct gdsc mdss_gdsc = {
>>>>    	.gdscr = 0x3000,
>>>> +	.en_rest_wait_val = 0x2,
>>>> +	.en_few_wait_val = 0x2,
>>>> +	.clk_dis_wait_val = 0xf,
>>>>    	.pd = {
>>>>    		.name = "mdss_gdsc",
>>>>    	},
>>>>    	.pwrsts = PWRSTS_OFF_ON,
>>>> -	.flags = HW_CTRL,
>>>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>>
>>> And this also needs explanation.
>>>
>>
>> Sure, will add these GDSC fixes in separate commit in next series.
> 
> With the proper justification, please.
> 

Sure.

Thanks,
Imran

