Return-Path: <linux-arm-msm+bounces-91465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KV2BgV7gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:23:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD65CAD05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 392783001C79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90B02E8B8D;
	Mon,  2 Feb 2026 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw7sb/0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9KfRx/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66D2BD5A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027386; cv=none; b=sRpEu73o7a05dJM+DFJtDQE0EFThOLhMkJZWkHnKkvRI1LlF7FwVKJ0iDzUKCe7W/7FY3GsbCHbP4DbK6/iQZyYQTDHpVeefuuww0f4b5Lhi38Sp1E4KTpJ9+skLwjrNKkkPhR45Qd25qVLd1NNdrbVJp+54bTlZL0GSYTzxoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027386; c=relaxed/simple;
	bh=UGR0pbSiMwJMoCLH0/VjKOOJ+kx6tbM1ebts5IHb9QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY4FrUfALXo6UUSKLdCePKMnbM/B96jnSLCxGyD32r2pjjO1ORpkQID8oo/pwnk9z2PRYzcGByX6zUnWa9TLEhwriMb8BcdkBzw6zLtS9PoOrowVSH+EZLmeKb+IJIdInGNk0bfDiG0AXa8bJtya2oohggHZ0+ePJDcwJR5UIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw7sb/0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9KfRx/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61280Oe01651648
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=; b=Qw7sb/0rce9f7zDO
	FGabQ0LLUkYrNY40peWecMw+w/f2g5/DCzuA5XWznng5VSs6T4O4AHTPTkXy3mHk
	wE+3pj3HObw31vADOe1uHj7aZnB//UmmE2wFsul6aOE6sbTp/VwvTVLSvnps9a6x
	LO5hUJqnTh4nJjf5dnXpu751XNCWgX8EBP3jcW/XTkuE4QY08+bXsx3JZjIbPVSL
	oo3jk+4QLLKzGf6OoGzoBezuGguMrkYtwnIIwlBWspaZzf2wPO06NWWIs5NWPqcd
	UhTFCo85PNPp7CfTLn/D159CXtjbJbs5oSchpH/vHDcc6d5u8FnI1uydagZCzIXA
	83gJ0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn1fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:16:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so110695185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027384; x=1770632184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
        b=g9KfRx/5xpXgb1AGXilxX15nOs48kV/bDddc/PXayqtHRalvUSNO81xeqk/VWdzH1l
         XU+DDmzwxesFPVKxXFnXQuEe41YC88atp9FHNTcub2PA0msRTT+r/ZzQ8vKKgZtjLXjJ
         K030gNLzAVACD/RAsfTExI/M6jM4SQHGhkHZ93EBTKAswy+OnlZwCL9xeXXllMv+OHVo
         dbCUmbLn9k4gZjJ0FhUOGtZXUSloFxd1Hl1NSSTXuzljP7foxe8vzsfy8CDFc3AXBtBt
         LUFl0ddkO0IopT13H0sl1WQxjMVzs95+HxZj1HSe51UwQPW4U3TZPKUNVX0JqM9AanIY
         yh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027384; x=1770632184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
        b=Kg9pSzFin1UmBM1bPVA/FKgidMos4IYk/2/w72SVEZTWzwoR3XCFn0ZZC209vfK0hc
         FNCXSZcgAq/a+DNTpPYQRQm+t/4rdx6DFB08CePhxdwtTqGALjleIxdFYiEVR/5uU3LS
         wRFPck73ORjb9Gt9ZdlxuUZJfnpbubwzd3djoCL5kEdy54CHB/CuHMOBM8qIWkq6oplK
         AdSCS3bkPYdFnClTdwZ8IlI2xqgf4iQCbN3eEm8I8a84IM01ix83kuU++8F0k0TD7Ljp
         XSxT1/mIWom3cpbQiQHo6YYuM4hYq/2iY033z1CmcewnybE+Pmnu2OBKbLdbjiwwploD
         sPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA7lT5ofI4QnJsa7qYKKqtDy4V4JklVy8Egy3ACRUt7/MGwxnjpGCpSuu87UQm/8Gqgx8x2HYtSikiaWKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaa4hXicg2koqBwuVsNm4Iz1DUq0dhvwRHW4g0EUzDaaum2lir
	W5zjK9i23omqG4WeOEQ2VJYNNz52X4bkkT3/eer8shY8Twhe6xI/paXn5MX5XrQX+JVbeh1I1uB
	3Q+/JpwS2uifHD426fL3a1KhYDfIu8N4LcMQfKxNZNLE6ZIGjr1KZD8Mz2stfjh3Ng99j
X-Gm-Gg: AZuq6aIVKCoof1gAI0aNtA+IeZT2unQctJhEjPO327hHOy+QDo51xBB+MARallfj+Ba
	bK5Ai/btOmccZfmqFY9VDx7nlAd92wkXHxh6n3N/ck9JuYW2ukPtNW08npGBHkpQY1XotkusAvH
	Guq85X0kXcGCxiJ/3HJvkkdOLpm89KTB+Rgf9YrozvH8vkbeRbN/1UAu4Z/NAIMUQWydRFvHEHL
	XL7A7e4YjbS2LJIAsFnmLzNdksngDviKemsqVxVdq9F/zCQ22GJRArX/XchgSR36kwVJzidKJUw
	FK5rZ/otSqkMIsK5SpKcIRqiEuWpuBEXLcYo8i3ys7khhPBDWMOEEu6ZAv1mleol18pXs6betFY
	pqssG97QjffMsluaDkfSz+1gXrnOo7oWLLvFPm2poF0b2vBjHZ3ibuDFmwYLPwi3a5HI=
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1055640585a.1.1770027383612;
        Mon, 02 Feb 2026 02:16:23 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1055639285a.1.1770027383143;
        Mon, 02 Feb 2026 02:16:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abea5sm7601946a12.31.2026.02.02.02.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:16:22 -0800 (PST)
Message-ID: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BvGwif2dd8WqoTRR_6x8c22PZ7Sa2YOs
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69807978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7qjKt6vscxvWZOHtmVAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BvGwif2dd8WqoTRR_6x8c22PZ7Sa2YOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXz7y1F093KzuP
 Cdvbss4dxRKHYzc2dk+q5H5MLHh3VfjC6ecM/j07IGLjnb8IEQd2DnnYlJVhmdRbvbLrhkzgdE6
 rTSlIy98RUiBaJmbuQao8GB9aFOH28SFZqRSIV0f7wMEvAIATGdVhLlLgo0fnwVW8zr4J3dI4+R
 3MfBzASloExKjgxPvs6y1fcZzKgpU4ITpevR10KEtjYelbRVl2ZGGyZcYfrZx4pLzoCrgOILaN+
 KuWUPuvTd9kddWgzKgdf9fqgJEwWgg0agzpnzN+aiXMHKR9yVczpLVQHA/Xm3y8L4xhgeKJ43qX
 9krhzuaLACg2UfEbrsVUXKtrLYvKpYnyJS1XPE2vW38l75OgPqy5sDn7E/POTdqLjIWgtIBfj9L
 8g3wXbb5d6413Ucp3xyRSGr2HK1+Qn/1SWq3IrLw7lSsWHUnXgjR0/D2Pl79/5fKcKaQu/1zsWh
 Y5pw1PWMZ1zKXoS7PSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91465-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DD65CAD05
X-Rspamd-Action: no action

On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>> Enable ADSP and CDSP on Glymur CRD board.
>>>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index 0899214465ac..0eed4faa8b07 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&remoteproc_adsp {
>>> +	firmware-name = "qcom/glymur/adsp.mbn",
>>> +			"qcom/glymur/adsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&remoteproc_cdsp {
>>> +	firmware-name = "qcom/glymur/cdsp.mbn",
>>> +			"qcom/glymur/cdsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>
>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> but the firmware in linux-firmware is (now) targeting IoT devices,
> should we use WoA-like names for firmware on Glymur CRD instead
> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> CRD.

I think it's simply time to stop pretending the firmware is generic
(some fw simply isn't and some fw may come from different/incompatible
branchpoints) and include a board name in the path

Konrad

