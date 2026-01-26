Return-Path: <linux-arm-msm+bounces-90530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PE2L1RId2ledwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:56:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE67875B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D076A3019830
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34EB330327;
	Mon, 26 Jan 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jr5EMSTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sr6treNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6B230BD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424923; cv=none; b=i++OHDNHOCsGY1qfIe9f1sqGimQ79pbtol/gA+qux49vVsUL6eFLc+Lpott0kjSrtYidXCY5YvVhyOBQp0PvEf/1wM1mU+r6r84dq56G6fkOPwfYtgwyggPtfj5yrmxocQy5Pie/CMTnBEHk445iiBcvEhdeAitAMufBLcAt+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424923; c=relaxed/simple;
	bh=eFMeGtFIFGJquwXlDim//AQP9KuI8WKVR8aq/1BCx10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GW8qoIYDlIPuiifW2W+c5mUCp4LMF5cwGyjkcTEf94IpxiOK0V9ysNMmSq3ha0CGHFwVuGuGwPdZur0IPSd0ynyv6wcNk4S3qinrgVjpW+89D7wd2aX6LJYkc5e3v682oQ1veRQgPF5haKPYD9lkj+g3VWrXCqhMaczIT4h75/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jr5EMSTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sr6treNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40qsq1361590
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZPXRfD10D1Dsj5FWFf81PZVjfVxlK6MiYVfjk3qR5g=; b=Jr5EMSTIJ2Uy+m6l
	hNzDWiB33joWqgG8fE9mV4QMtw4QLT8setVWu86wimUQSW46nSzTGphzzjZZ6KHG
	NKReh2mM4LtXGSWKevu6X0n6OQz8TO+43yR78rJ8XKI0d+olTpTZ5u/DyejUyHNA
	X0QZ/nLN0Q0EyPW8Rft0oj/z/gwAh9pwaYpMzICW5KlogxUz+47jMWTHWFVqkxGD
	H1VIT795KzNhfw2ygI3zym6wGqU8Y6RWnhvtRWsvTjXprOnXC/SAS0MHHXsB2Ue6
	laAYQyL+mo4x/o2TerPungI9VNAF15LSLdm3iSv5FbNZtcHwgTfPxAh6afl+DLY2
	VL+q3w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v30x95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88880bc706cso15069066d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769424920; x=1770029720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZPXRfD10D1Dsj5FWFf81PZVjfVxlK6MiYVfjk3qR5g=;
        b=Sr6treNTHDR/mB6Px4sl6gap0rQtWuSUdBjDsnCzju3+kNI8Bt4T0vhSjxffBsaP6a
         QNcY4Kxy+Q95H9nv2mF5Fs/3aqP03Z+2Z+y+4aAFRy1y21JDLhxhndXGCrSLdQqcrqAO
         UGdObFLcHWs8Abh1AVTLstlgo+jMDFOEEnu9LF0Px4jrdH9fA/ae4/BG3asEVmCln4Pb
         Q+hssNCQm6dkp15FWyIm8EfjhxJvOh3KQJdJSw90UsL/NR4Fdwrc0i045MSfcdzd/weH
         ZAIgj3LNJoeWAW5yRGrjYZE+tGrogZnLNv+8PsZrP/TidngekSro3cqe2Gy3+rYp5sD1
         wmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424920; x=1770029720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZPXRfD10D1Dsj5FWFf81PZVjfVxlK6MiYVfjk3qR5g=;
        b=cn3nwV5iDaS/FeqSdg8BPVqmtOMCFwF841s9ovtF1ginTnmt12lwKtBmBZXuMzPyKa
         yp+yVgWxIGL/wbTeHHhd2NMDmAo9pGEZtjmpzFs0f1gloLUgdpbBZRXxZwxzd2PiY1Ra
         RXaKg/RBKH9X+xwJIFH7XEOd2ypYkx5gVX5f3Sf9e8S8J6ucUKQo6H8Z7aZXUeq9dCcD
         LAwswZo9WajbCHol39UPRYXbJv3OVVLrobmgmVWyunDUTzoRiMmrDE/2s6lgyQVz3rDf
         0I9wx2L8sVg3zDyI+zrUB3oXkorC/UT7vvHBw+8dvkbjSftzAFvvRyQ6+uhUOpvlGUTU
         6EXw==
X-Forwarded-Encrypted: i=1; AJvYcCW39trdwR4H7VT/lU21wQVwUFo719/DaVx8To6873OCd+MGvHgTrCuQHg2cSG5UdO3zH8FwUCx3VgXD53MI@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnENL9WVhTQe6OsrrdpiJlE0rnLgr6ZAQu62h6tw59THtuXrG
	yueO1gzy7Ait8u7iyud4KjHvVGNjmgZAhbjEqrXTQU5Kd9P+VcC7iA1JXHZTTVl1mqJuhoGHcY9
	gSQH+wLDVjkE3YWahw3ZyFOrij6JJ0MuZGQxavUyGbKvb9Rbvi9IisUOaY6rYJwrj1P3E
X-Gm-Gg: AZuq6aJHLK0Em0WxWFL5kedZpvAQmjT5hYJcHsis75FuzmvLKGr+uvEXgOjNfyS7ZBG
	z3mtGDob9bfYvRK2Am05lwQ6Fso1Kbi7ue5h5Gbk3dPsV4u4WYEB82YLP0vliAUDF1Ho3qDSBWe
	EWbLx94ofB35M3tjLdF2dd0Hv3s5QVWzzgqkFjrUW3VERR5PGX13+S8YwpKYnyvLCVnUMXyInEG
	NYPJa5QUJ7VXqnLn65yRMKdQI2sc6337MVd1an+3vGlVKRPUWE7fqmAqdoXlj8XJQSBmqiwlCq3
	FNk0yR2rMAPW2eMiDd7OkZaTRZYoGcrgcSo50bCbtP9Yras4NdoOp/YM/XOJvOJ3Qix0yOcS1aq
	cg1jmxrGmOoG/rVd8YbC+aVA9C9RrE8o6tdywVk0a3gTXwW2hcc9QpzGbCii8GM19Sl8=
X-Received: by 2002:a05:6214:55c1:b0:894:a36b:f7df with SMTP id 6a1803df08f44-894b079435amr36883366d6.8.1769424920294;
        Mon, 26 Jan 2026 02:55:20 -0800 (PST)
X-Received: by 2002:a05:6214:55c1:b0:894:a36b:f7df with SMTP id 6a1803df08f44-894b079435amr36883036d6.8.1769424919635;
        Mon, 26 Jan 2026 02:55:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm25102401fa.2.2026.01.26.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:55:19 -0800 (PST)
Message-ID: <90c9fac9-3c55-492e-a0af-3d379164727e@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: Add Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
 <136bf12f-cead-4485-b689-af780c937e2d@oss.qualcomm.com>
 <ecfzllcz2b4h45eymsg4quncu5ec3fqbheufn5wtkbykb6dg3m@k37ocioybgpx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecfzllcz2b4h45eymsg4quncu5ec3fqbheufn5wtkbykb6dg3m@k37ocioybgpx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MyBTYWx0ZWRfX3o+uEBV0OIXo
 kqSva3bcwMDvDe+dasrEhj3VIhQqkekR1GJc7d23PZkD9wG0OrYCQd6JO6F5fA9Zr5GrN3K/maz
 +0nZooIf93evG/hR+GhtlskO+MR5XtKD8N3/QnbaSoepKsDZQPxXV7u5r2Fna6sXNEZDML38dzj
 ZJQAFugTzfHm6hlqlXBLZtCq9nwLj4eyIRUqDKjGfiwhZghO0QdYIr5Z7Wy3NtBVt3z+RMFmeiP
 pMp/31XzHeVpZcsR7tsuyxphfGEEUr9cugg3lF5rbDpe4QuUuXgzYZug4mGqRY1vy7VFfvIJSad
 7v46t+iZwttm72nRqEsh6Z2pkAJQrZQbJ2D78M9LHV+TQUdBya4biqV8Nkgb/tOBN7mclDFMFyF
 YtIRxGZvvjTXYY4mOx6/MUt7SQ2MQlZxbW0+V02OXBJop9oYdZyUvjO+PjG1XdvI0lVrrQp/Yjp
 Yql2REndsN4JIb/2uPg==
X-Proofpoint-GUID: 36ds1Fi_cA_43KCO_gOmd5HWTb8ZwBgQ
X-Proofpoint-ORIG-GUID: 36ds1Fi_cA_43KCO_gOmd5HWTb8ZwBgQ
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69774819 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BXNv1TGYQw0SXM4-lsYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90530-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,abf0000:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CE67875B2
X-Rspamd-Action: no action

On 1/26/26 11:47 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 11:00:25AM +0100, Konrad Dybcio wrote:
>> On 1/25/26 4:33 PM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Add the required nodes to enable Venus on sc8280xp.
>>>
>>> [ bod: added interconnect tags ]
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> [ johan: use sm8350 videocc defines ]
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> [ bod: dropped video encoder/decoder declarations ]
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> [ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			venus_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-720000000 {
>>> +					opp-hz = /bits/ 64 <720000000>;
>>
>> You need to div3 all of these, otherwise this LOW_SVS OPP
>> will actually apply a more-than-TURBO_L1-requiring frequency..
> 
> Hmm, is the OPP table for SM8250 then also incorrect?

The OPP-set clock is "vcodec0_core"

The DT references VIDEO_CC_MVS0_CLK, which is a branch-child of
video_cc_mvs0_div_clk_src, so that sounds like it makes sense..

And the frequency plan concurs that.

> 
> I cross-checked SM8250 and Kodiak against, msm-4.19 and msm-5.4
> correspondignly, the OPP tables are written in the same way.
> 
>>
>> [...]
>>> +		videocc: clock-controller@abf0000 {
>>> +			compatible = "qcom,sc8280xp-videocc";
>>> +			reg = <0 0x0abf0000 0 0x10000>;
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>>> +				 <&sleep_clk>;
>>> +			power-domains = <&rpmhpd SC8280XP_MMCX>;
>>> +			required-opps = <&rpmhpd_opp_low_svs>;
>>
>> AFAICS the PLLs will not turn on if *MX* is at < LOWSVS, but they still
>> need to be scaled 1:1 with MMCX as the freuqency rises, so you need to
>> wire up 2 power domains to the OPP table
> 
> I don't see this being done for SM8250, should it also be fixed? On
> SM8550 we indeed manage MMCX and MX together. Should SC7280 also scale
> both CX and MX together?

8250 yes

On kodiak, the docs strangely say that it's *all* powered by CX, maybe
+Taniya or +Jagadeesh could confirm if that's right

Konrad

