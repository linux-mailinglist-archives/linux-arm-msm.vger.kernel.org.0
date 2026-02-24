Return-Path: <linux-arm-msm+bounces-93999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIwzMt+tnWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:55:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E88188155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EBCB3002D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F5639E18D;
	Tue, 24 Feb 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L982G39d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I988fCM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEB37FF4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940592; cv=none; b=lNZrl6wOWs3Xdqw1efXdz6ugFQC+P2GsZ5yw6JsHUwzzVsygaG3WRHo3bRocc3PqZDAdFoCEobNEsyuwjrQutkXZN7W0jWQE5ULd+N6mZzwUwdworjNIKw1bPFCohsf9yNB/fSxNzDoz4CCeEb+BbAjfqDBxWgAVkYC4m5xYaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940592; c=relaxed/simple;
	bh=KdV9DDI4HE7BDnsr7zZOGoqPkZSPUUnrYiqIRzDmiNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbm9vURx5hfkFoLMMvkmD7Nz5VyANYuTVXWadQuJlE6emwy3QrZn8w3qROBB0ueXo+dBjp+4M+9d+OtdwDhima3/DZPS3F73iHmBMHKllxJJ4yH/W2QtCZ2JKnLpWBdsDS7UW2ZZsS1riDiHZ/2Feezl0JkuQJeyuWDIRQjjewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L982G39d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I988fCM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFeAh2560773
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=; b=L982G39dyY1Xvgxy
	aMM242Co/+oMtGIayJLHxmEo9gLFQqK8x6W19+Q3wmPf9ODj7EmVDmVnUh48ERQK
	095+urQITLqbbBtKHsEv4MhO2spM6isJ4PfZ1/ntxWG29ncaqUFr++tIlocH3J9c
	pV2KjaShvxWXwjtglyQJThsV9VDXxjE2bmYhxwgy7tXJbQIMA3YAQHKpSntuoA8/
	8HoLz9f4hv7RLybwSyTIpYUUAFq97n0X08eXUet877OGL8qNCLp9q6ih9zpJmLW2
	PQlzuOYuVP0wpkCZGJ69LvtmoI5cJipHpMhia5W7JHWpgVOJ3CYBiU56QNfeJacf
	cKPeHA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39jch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:43:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fd4945a471so1166419137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771940589; x=1772545389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=;
        b=I988fCM8JGvZidOjaAr7EdaMtbgK4nu8HdIyDztztFbP/rawvofaxAmbhJWIAQgdkE
         36vpemJ0xw/3iF2/Av37AOMu+YTQKtK0z4iiuTcGfwvQAiowf14pr8FDbhxAhES/Nmnr
         4TKfLbPYmC8/fvEZdslIFissGCdGumGhjH+xdkq3c8n3WeBviVvyBOuiy5vqCuiVk4Nu
         ApReChu9ncF4TBcJgBivCw0jQgEgUX4WAaxCXe4A9raQSCYnU2qKkogjjFL0oihzWn0m
         t5+lZPUDyNlxSTCRr1/Qs2XK3gVid0ltojxsjPdhkguTpQUd+Ejq0XP4kBUGw3GaFc+d
         zwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940589; x=1772545389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=;
        b=dE8rQTzqyGBDOYZVatYAMNbf2tWbQrgD9VAn7lc88WmTWLnovq3VZaOKcsrHfA09+7
         gTjkokoJvqhOut/OKHNp0G8Nn7+nEX8hx6MygywnllBtTICq3f5V1dyP9YS9eypnSpCD
         a+MU5t/LRdelys7/Hlqc841Y9m2V9QhLTorRkE3fK85yIlfrbWLm8rWCwwW9mmzf5dAW
         obv+uMs5sFC6u38US75ExcHb7SOepOnS02kY4V0YnykI8UKsbW+n91YCCR8IxnhoaJA1
         EXMM8jw1Ld18bTNhAuBkQEfcHDpHr3jp4pA9f+oSH0cYMJMf+D4PZBOO1CfbBvnK7aVR
         qBuA==
X-Forwarded-Encrypted: i=1; AJvYcCUzpeS/Vh+4rFdQ/GiovoK49oZwacP4UESuWXjYln3169i6HyOnQGTUhf1dB1h4TGBHcOtbstPffiwWv68b@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3YHQf4tkXhvwbUPoCYHKfUMcMND6bMpQfXUh79KKHgUJiScg
	NG2NBG1bQmfCGN2Tkw5/SRVhg/34gsqjHZMOoikuyuK9YUEL+1+0DAtxS+jhelMS6iddRMPJtQE
	uYtSX0+kjJw4konvbs0kY2VUtxJinol8z5/mzqbb6U33nvnYeMTt4PTOc8fBHc7AA/80z
X-Gm-Gg: ATEYQzzNi5K0xFH/a52OfEWw/2sYEAfRPhOgD0itg9ZMAbtO0u0tOlYJxxoZmHTnx6u
	gJMgk6IBWQ+nnyiU8fPM3qMXN/ReOjN3HLMhIJmhHPnruA/wsac7GnMpdorW6vTBsw0+fGgXf/8
	SN5maSw0qBCqb/D77jeXd2w8HWzXcsr1//CZ6LaPmhq9IsxADVa94KHtyoYSkmx2k3G0HOPmpES
	e5ogrw4vDpqFxgJllWpUG6nItwermxXnFhQSCowJLC4CBd2VYeRGjYek/Zxou60BYWNezm2KvDo
	g4MMLxBp2G9/RRKAdpmV6L2iFCVAYoPzvtVXrqaNp3eTX/OLGZIBnfxjiygq0bfu/pdiqORP7E5
	FEKZwX6Ea1MyasC3VtwJFv/mdaYmMEMMdiTye2d7lWj+FIgDyYK4Q5ll34pPqSmshVettDCJcz9
	YdmUA=
X-Received: by 2002:a05:6102:4192:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5feb30b9613mr2410054137.5.1771940588878;
        Tue, 24 Feb 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:6102:4192:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5feb30b9613mr2410026137.5.1771940587129;
        Tue, 24 Feb 2026 05:43:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb6204a47sm10763224137.2.2026.02.24.05.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:43:06 -0800 (PST)
Message-ID: <d661600c-0b45-433c-9bbd-0ae5a3386804@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:43:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
 <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
 <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699daaed cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=knmiLqVa1aBOnVowHCEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: s2lHMD9MhHwF3wmvkf44WpP8EOiTwf4U
X-Proofpoint-ORIG-GUID: s2lHMD9MhHwF3wmvkf44WpP8EOiTwf4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMiBTYWx0ZWRfX+jjmbu59s8AF
 /d5QAY1FzQn/TnVE9J/joAsD73LHIkrDDd1LD/jfLu44uCgoLGOCNjGL7hwo2D5kiMfC8yQjuds
 gebS3APSlWqbRlN6vhbt7lcFe4auJV1OW1/Qp2RTA5H3FsnAldBoRK2glQAVqhNqze+naNl37Lw
 aisZ0aCxWufhlT8oRgq6kyLzbM5ZWK9Qmdq9oXXlQasGe3VXHyOwb8b1g5x28Xgk+IxFAKVGp2M
 y86+Y0QxHZwEFQ8Z/9Otqgvd7xTyF+7FIqP6jMtsI8klXmUPpdpUEAKOvKQ1VSlwSuNaA8QT2u4
 B5gbjjTmDL/tmEDycaWOslybf403WdNsXC0hTfhwAKk9Wiq8D8XZiuOJVt/bIJJvaJPGT+BM5k0
 o6/iT2jQDKY7TLqMk1YtCc/z7PdhiHHha2fMRJp35fnjB0nrxnp6xf/2E0OSL0GFdaTW4ahEDYY
 T8SEB87esGhUe2hGzcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93999-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: F0E88188155
X-Rspamd-Action: no action

On 2/18/26 7:12 PM, Imran Shaik wrote:
> 
> 
> On 17-02-2026 05:31 pm, Konrad Dybcio wrote:
>> On 2/17/26 12:56 PM, Imran Shaik wrote:
>>>
>>>
>>> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>>>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>> SM6350 SoC.
>>>>>
>>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>>> far as I can tell.
>>>>>
>>>>> Though when stopping the camera stream, the following clock warning
>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>>> while the clock is on, and 'off' while it's off.
>>>>>
>>>>> Any suggestion how to fix this, is appreciated.
>>>>>
>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>
>>>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>>>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>>>> and keep checking the hw state)
>>>>
>>>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>>>
>>>
>>> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
>>>
>>> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.
>>
>> This is very useful, thanks for the insight!
>>
>> Is any of these solutions specifically preferred from your side?
>>
>> Konrad
> 
> From clock controllers side we can use the BRANCH_HALT_SKIP as this covers both enable/disable scenarios. But this needs to be checked further from consumer driver side as well to handle the NoC voting properly.

I'm going to read that as "better to just fix the user" then, since this
splat essentially acts as a mining canary for incorrect ordering

Worse off, the camss driver currently doesn't consume that clock for
sdm845.. (clock-names entry "gcc_camera_axi" is nowhere to be seen in there)

Konrad

