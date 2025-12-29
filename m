Return-Path: <linux-arm-msm+bounces-86837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F31EACE6B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E6B73011F58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D0830FC3F;
	Mon, 29 Dec 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPq73gjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/tRGW/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7A30FC06
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011739; cv=none; b=BaWrHeorUCTnbKAaLhtjfKCJUAH9+wYqhdF5m8FEge/A7FBQ1nUs1Qp9e/QBFcXbJAqY7pUmR+Y4cz/ux8KpBVMB0gYcXrcbFAYD2Zp9lcsfmS95lfygmxl5Jk8Wcqwa22d0BJJ15hJou3javSWuz+mInH+4dIo4995fc+3hPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011739; c=relaxed/simple;
	bh=g4OXYPcQcSofchlzOOAukww8ISzrXUFBBszpmvxJEFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYl3LhnyVXa+H7vIGdwHPrqPBOEwQ53bkayHSCw/fZAMUSyQQ9cL5jzJDjgdtoWI7F6pSTFR+FRDi03biGZ7XPlw6SrYw1mkEJHxDB45ignN7n7OCo+EIgxyPb38OsyHa4gJlziO0aofQiYJR/ZglnClnsC2APs3xpW59x0RItw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPq73gjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/tRGW/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA5k5b240688
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEvmPEuChPyzeYK6tnvDKVgTheTEuaN3yuYanFJHD6Y=; b=bPq73gjqxgqcpLvo
	WVDYoUERDHeluIBZcrdX/+zh1WE3wH7+NW07A0JfqPdq6h48OTwz+yRdxee4WQ6j
	JVdbKxiop4MVIGe8GSCG6rm4Na5rzJ2PqzRJZXVf0OOUZV/W4Ycshf2o1NnWFMnP
	cHe1+pgbGB74dWiC1NE+rcgXfgCXm1aivgdtSAAez0FwX1GAzIrA2emoef7E+432
	/Tpf88/BylaF0t130Y+IfGfzsn8OOxh3qoq+w9grdwTUdjgtRfDBI3jPuRqdEFNk
	BgrEToc4n3aDyrfgN9lXS4p/uZxZAUvYKzr6R3/YtbK+mcG+0vTfntzjxsY6zcUd
	6+/4Lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v1jxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:35:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso36109211cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767011735; x=1767616535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEvmPEuChPyzeYK6tnvDKVgTheTEuaN3yuYanFJHD6Y=;
        b=d/tRGW/e6o9xMNNgM7xUy9b/b6uIU4b/JqDJbA9e9NbPmDERFYPbmwssnLNNJ1iaTW
         RJbYk0BhcLBWVdJUzFIleDGjY0+y9acvS9ayHloAYFNY1cWFi/NV4ic38NQYjkokSKsk
         O8igcALOFDZ56jCb4orKci1cnXy+AAQ2lChaLqlJ0znC5idu3nOH4mOBfGRLzStnLQuH
         siffLx3NnDq9JpJSqcnsJMrS1RBZqmeOKMWkCuoUUfTw+GT8JUWvN+4Ww+8FzKquRBLP
         NlEUC2xPHU6CB0AZuT1qAuqVeR9GKFSfYgU2jIF8t0R5+ooeySjvKyknYQzTEJwPm01L
         GvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011735; x=1767616535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEvmPEuChPyzeYK6tnvDKVgTheTEuaN3yuYanFJHD6Y=;
        b=k+6G9e0QMmuSLGBnV0XX0i588igReiZci2Jvxh4zx5QdCTM9kyTOy3A71Pk78ZwLGw
         R/jlvqA9X+wf+BMSB7j0OMioekJ7EGNvUdvwvKcVbYXUDp5L80M9WKbI2Fclxu0mo3aR
         Q2rRkjStN8wnEfgNJUtSDQkDVhPHWA2Qxdu6H+HmSuT/NrtTKRKGYxcP2mucoTjJI7Dz
         5Alb7iiE0VQSZSAcnoCsBN/R1ngFou/4V3M99D2FQ8Syv1BbiaUtpdjhBJ6SEt591BVs
         KNf0j9TORaFnFBv4G6d8nC9v+wf/6Q7KUbcpmwKHcZv6URGJBmadHMh0bqyG/yjGGkxT
         XOPw==
X-Forwarded-Encrypted: i=1; AJvYcCVhd1Qc7JQdnwKP4y/oDbHdfzNkJ/DUJ4+t/vJNzR4nomYuYrkt0NHCKbFxzssIbtc0ceiTcKGYMj559Yi0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv7194qZu7vf4IjrrgLIxwHmjbPAH97piuwwHvPJ434PCJ8EYS
	p15uSCj2HgKYsfdQ7rxRl0cgSxXylqiVWbdA+oqgvANQLInYICzsn80Ll2lryaHDwgaBeag7fu9
	uL7kOci4IAo2O98vVRi9CwYQ97MDgJu7i/FJ/BKGB37JjiCxjrxntMq5/fRDC6rYQ+qLN
X-Gm-Gg: AY/fxX4yWIA87oytu5F33HJNrKDbzXP/2X13/gaIie2pLcWX7N9sEcqFrc2JmOl/dEA
	D4dSCYWiNy5VYDriF/iGsBdmVa/vuP0yVe8agoGuG2GcxftpSn6yXGNjY2KRFFbrdSEb/TPRvXS
	ZBwTEDDEAYqZp/88fp64EzdJVouhMTYuLTfEfBy3kq119frY3Zmj/YJHfoNk9Nm/2LUoXhRjPD2
	ffve+QRE+mAcksN7F6FrQ5CqS9KB/ta8jPC8M/SdtTcr5bQMfb/mtsdN2AHMCSvZUhqQ8LD/lq4
	HXnIvCUFS8jiSLgfOPwOuH1QIwfEJqjSfYckFvGGHuImR0ScYSa8S9c/mNZFdXXpyNRTpX9AGCk
	flC2cioo8SscAU9g+ELRgOg+361V7J6AoY2NpMZiHLNY6YY1XHOATwbCYPPOULqzdkw==
X-Received: by 2002:a05:622a:594:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f4abcb7f60mr367641931cf.2.1767011735565;
        Mon, 29 Dec 2025 04:35:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXL3tbMW/OSJ2/KVKDY+HT+2NwrKl1u+lI9Qbgms1oF47RLC+3Dpr8m/EkKpOFDWEf4G4bMA==
X-Received: by 2002:a05:622a:594:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f4abcb7f60mr367641751cf.2.1767011735076;
        Mon, 29 Dec 2025 04:35:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f87sm1844216866b.17.2025.12.29.04.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:35:34 -0800 (PST)
Message-ID: <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:35:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12223416.nUPlyArG6x@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rL31s8T9-z5towR268UbVFGt3xVYm7z7
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=69527598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=UAULZ1QVBjdXsl7FWKEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExNyBTYWx0ZWRfX7N4NBdZ6jnc7
 I4DVeMoHVqW1+0qiT8a3jNkUUWZkj1gKvKEEY7jOl8jbtOTKMLnqBBrm8Qq8BS10Qj1PdgvS2RG
 4utnHOnd1MaPS6tm8wKzWHyfw9M3TjNvP8hXG/TQPpVWFOUftfzsG7cnBchgl0g5UfkX7qx5AkS
 hDK3mdBHHZ6m/Pin7BuIC2SvmHG3mKNJ/eEF3FoWuYLIjcoMvQCwRpqmKDSMb403AJwS2yFjeiB
 DZYvnfWMqBoTmegG9Rdj/ZyTQUx+M9giNx1dRvVZQC9IM/C4UczNuMCCTT8fHtmWAgKviCagHV3
 GLFF3Va0/jidHErMuBFwZM2UXZ9DDK1rzDzIaR0m9dlH8deyPorYflxpM+UAbk+/mHqI8Ao0PqF
 3GvJhRK50roymTa+K2cdtZNERs1idPcf35y3DwC308Ud2xyrvvMaMxlqGAxPtKV/hZJv7QyTJrw
 LeFwCkemNmvb/4PwOQA==
X-Proofpoint-ORIG-GUID: rL31s8T9-z5towR268UbVFGt3xVYm7z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290117

On 12/23/25 9:21 PM, Alex G. wrote:
> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>
>>> Add the new sequences for the WCSS reset and stop. The downstream
>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>> using with the "q6v5" driver because all other parts of the driver
>>> can be seamlessly reused.
>>>
>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>> register. The second set of clocks, "clks" should only be enabled
>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>> tries to start the remoteproc will hang.
>>>
>>> The downstream kernel had a funny comment, "Pray god and wait for
>>> reset to complete", which I decided to keep for entertainment value.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---
>>
>> [...]
>>
>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>
>>>  	struct clk *qdsp6ss_xo_cbcr;
>>>  	struct clk *qdsp6ss_core_gfmux;
>>>  	struct clk *lcc_bcr_sleep;
>>>
>>> +	struct clk_bulk_data *clks;
>>> +	/* clocks that must be started before the Q6 is booted */
>>> +	struct clk_bulk_data *q6_clks;
>>
>> "pre_boot_clks" or something along those lines?
> 
> I like "pre_boot_clocks".
> 
>> In general i'm not super stoked to see another platform where manual and
>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>
>> Are you sure your firmware doesn't allow you to just do a simple
>> qcom_scm_pas_auth_and_reset() like in the multipd series?
> 
> I am approaching this from the perspective of an aftermarket OS, like OpenWRT. 
> I don't know if the firmware will do the right thing. I can mitigate this for 
> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver 
> and firmware together. I can't do that for bootloader-loaded firmware, so I try 
> to depend on it as little as possible. I hope that native remoterproc loading 
> for IPQ9574 will be allowed.

These are two parallel questions. I didn't even know that the bootloader
preloaded firmware on these platforms (are you sure that's the case?)

qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
remote processor.

The init sequence provided by this interface will be at worst identical to
what you're proposing here (except abstracted out), and at best containing
some fixes and/or workarounds that may be necessary. Please try using PAS
and see if that works.

Konrad

