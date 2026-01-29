Return-Path: <linux-arm-msm+bounces-91173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMdEEGVOe2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:11:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9EAFEE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B5DC30234DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18D83876DB;
	Thu, 29 Jan 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6Z21/3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRdeCM1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C633A701
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688667; cv=none; b=MmF12T4/ODM0o2KB0fCkA3guOi+5PyoU/dxBf5Y8AGi6OkV5xOjt0Nd1HYzkL07iExJCS5cTY6p6BeNBpXaJ0ZIhKmZEn0QiBa4Y1s1tJk+WmtwcykwxkrWPrGPd5MvpCp5nzW+R2D58TstCogNJCbQAcvFmOERqgWNjCLfnzPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688667; c=relaxed/simple;
	bh=3azX8oVj1c15R3dhcDwWK3XeVSUWIUXitKc5ZBu7dDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u60apEBVTJj0m0+9gmFqi3AbflfFicG31XUV4tMQCiEBEBhVCzRdi+redZ+SkUib08Q6Ka4VOm1V3nKfEHYuHGlgRzgFN5l7lgauy3ASU5U1mHmp5hsvXRMMZ4BRUL4JeagSUbIjNKElDZhUC3yzN04rYGbzJ3vyZerxA8gQofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6Z21/3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRdeCM1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TARilD2034151
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3T6vtt4wbQUsGCz4EvbMTMZdQSqORbzLetNOyheoGkw=; b=L6Z21/3tAVTCqmB2
	K56KognUAtw65/Wqk5LFhvANpGKkkcNUTTlOugFND3yDYa7uWgoD12BHWTXYyVk6
	O2RtyLKgLF8vPQfnUZxZOqUrv6B24ZI3f/88gChKswxXJJQKSj4xbZZGyVdjnP9h
	m7QtfGjP57IsJnCBqjiwDSLKpTf5ouhpdwwfosoBYmrFUSceJbdN+nijAA5Osi7J
	Q+khLLg6i6EAvEIROIo4BHpQ0UZViVkOZDMsanASNzLm789FOhhLn5fcng85yemK
	UkXUrlUsXC0WQpWACLDYPE3Hr4qaTNOXBAoTreksoPgUvy/Xk1g0xMAPsVJSwawy
	hACpkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7khnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:11:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so932286a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688664; x=1770293464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3T6vtt4wbQUsGCz4EvbMTMZdQSqORbzLetNOyheoGkw=;
        b=SRdeCM1IlzVTuzwr2L4iyyw8W+lGWYJZUignAtCL4cjU6w8tsJJ6GHFRtaeXcD571P
         tvUvFBwwy03HpmB7zqTBPtb3u73I7Iv2pnGe8Uqec760ZPoqrD78MEwJXc+bxRPfS+i/
         Z+Xjm2Bhk4+VFUpF10PsivaxNLnAbE4zVjho/WMI4RIJGjQzkEJDdJntJ3INN28haqJc
         H+15+UcdbLTw0zMi5cs/iulYY6vlpq8tgEwKPHFnKx3Y565VA/xVw9EsUXkvfPLf27mw
         Ws9biq6nuVGS4upcGpBWN9v4Uvg7ba6C0a+BvKHMxK0N5NXrZ5Ix7kJVUoPyEkcSaEp+
         f8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688664; x=1770293464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T6vtt4wbQUsGCz4EvbMTMZdQSqORbzLetNOyheoGkw=;
        b=OOv6tui40qmjfzbGoBtqlwLUjYGbY5wDJDTlwV0bs0iM3XIpb7Mg/IYDKkgFFgTTR/
         LSRM4AkLaifYvO3ZvVr2WR8jnfnS6gbgC5o1ENgEn6qWJsmP2DfWdBTtDNmwV7T2qOTx
         1npuyM8k0pwDO9FqD2u2JUTgZRo3vOiQbBhIQrNeFCv03wi4EkLuz8vl5AjXlPBTkSkM
         dSxzgwPyK9FitSUUHieUfgC+OKdJMk/gAH7+3z1L+hojQhATghOqSOLZTP+wmVNdyf3x
         pNYkFoc8pzNwzSmxGTe1qCTwvxktFyvDivt9fjeePIFCRAfcPlazu27mR/J00Sca1zFz
         vkAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Pcbz5qbo3Xual+7zWXuUUdgNJR59ADX1VELwtsBuXcV46jNJPyAK4JmXjSMYciEGJVtjkDnEg81L3YBk@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAWvLhqltLWhSliy1oGT90t5ilhGV5TT8AL/IlzlTOCYN10ij
	v7q3LFI7vcSJUzCd/TJWRw1Sbl67mImnN3vZQoGd5oOkpZsA9sPwVXTKG7kJ/tuu8zbgELAYCDf
	tUmzx9k390yPBUaNTPhVwI6wZzOJE5j5FGWxsN+6nm27ugDmIt9U0P+V5/E9i+SOhXstE
X-Gm-Gg: AZuq6aKR/du6IjZItm6FcZD7Yo8DsjsSDFIqIvIcIb2kdwOTu8BiaHHdVlxlifR0aWx
	yxxOLLlb+1o0Jppqu4avBPQaRMtuy/bW+PYKx+cXdBFtwMskQyLybXl3zTi4guAMJ49YkoHcD9T
	XX+92vY2+3YQ9lnktLh179IIR5pxUTjppIUJDQzd562H0Tqcq0T2zoT/A/555+4loT6B2vYmLyO
	gelut4hSe5VxLBrXZ+/KVZtY47cC+7DYWqvgkKWHepcNv9lYskmBJWf+QBsEZ6aaTWwW7KD3fk8
	zfC/PMQFQBLZswJDRQ5QeXWVMFQ+xl6q95MMeLZb+JOklK/QMtNJ4fL2iFvSmHlAIazoA8S8XtB
	mZ5lMBeAo27Uuvh3Ww+LMit/yDYig7JynK4b++lDt
X-Received: by 2002:a17:90b:3e4f:b0:353:3b33:8263 with SMTP id 98e67ed59e1d1-353fece5768mr7723454a91.9.1769688663639;
        Thu, 29 Jan 2026 04:11:03 -0800 (PST)
X-Received: by 2002:a17:90b:3e4f:b0:353:3b33:8263 with SMTP id 98e67ed59e1d1-353fece5768mr7723430a91.9.1769688663151;
        Thu, 29 Jan 2026 04:11:03 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm4882283a12.17.2026.01.29.04.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:11:02 -0800 (PST)
Message-ID: <3a1b3a2b-d73a-4dae-b866-14abec2ff18d@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 17:40:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
 <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X49zOcI056_0qaTYkomH7SreG8TXtFh2
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b4e58 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V2w4IgnLWKD3j5nXI8sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: X49zOcI056_0qaTYkomH7SreG8TXtFh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MiBTYWx0ZWRfXxOZUHkADDcN8
 cJ+PI5Uu4MkBmEoCGK8xEmTr5DyEKxV330lfib5kbN79oWyNpRF5SLc3/h+O1cglLQUtXtRkYBU
 B9HnwF+tp7vi1x8VeczJB6DTLOCYFKB2hDIsd2d4A/0A2lksV9aAx4nBMQDQJZwYQHNaotr2Ary
 ycRDvAGlv1sJvRcJ8ZsfZ3nnaKC4UXev60xFG19D9+uVykwqUC4LJrkE11ygCUlx1IkpN2dQ/mJ
 bKNrjwb7RgxEz520INPcooW83js1InIYasjXxfKHqT2yZkstEOtyHYhbiKBGoVqE4rp1FT5hEP3
 /JWQM+bUDgfRbPFctq805Q24redkTfudu+mZSQqFqASecEeO0X3Wm6zlyKF4Y6FZ2S1ohVoiaFi
 jT5jNr9mq0My3n4Y8zzRq0VQSnrv26QDcboMwZ+8z7V2VwUv4GZnvhAkaOflnhoPqGGW1Go+bMT
 CXI5gnINn3uF+pIkjtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290082
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91173-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:server fail,2a0c0000:server fail,oss.qualcomm.com:server fail,0.0.0.11:server fail];
	RCPT_COUNT_TWELVE(0.00)[17];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.11:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 87C9EAFEE6
X-Rspamd-Action: no action


On 1/29/2026 6:13 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 09:27:19PM +0530, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in Lemans.
>>
>> Set up CDSP cooling by throttling the cdsp when it reaches 105°C.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
>>   1 file changed, 126 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 808827b83553..c747dd534caa 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -7281,6 +7281,15 @@ compute-cb@11 {
>>   					};
>>   				};
>>   			};
>> +
>> +			cooling {
>> +				compatible = "qcom,qmi-cooling-cdsp";
>> +
>> +				cdsp_tmd0: cdsp-tmd0 {
> This question was already raised. Are there more than one cooling device
> for the DSP? If not, drop the subnodes.


Thanks Dmitry for review.

Yes, Each subsystem may support multiple thermal mitigation devices 
through remote TMD service.

So, need to define subnodes.


>> +					label = "cdsp_sw";
>> +					#cooling-cells = <2>;
>> +				};
>> +			};
>>   		};
>>   
>>   		nspb_noc: interconnect@2a0c0000 {

