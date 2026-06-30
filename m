Return-Path: <linux-arm-msm+bounces-115358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JjzEM4+YQ2qicwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:21:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667D6E2BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:21:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CImSIX+l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rxegup9T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115358-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115358-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F6FC303FDD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF09F3EFFC1;
	Tue, 30 Jun 2026 10:16:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E43EFD29
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814573; cv=none; b=fE+YrDjTNGfP2BLI1HqipNQjJPO+bV6IRZLLcPBSGIl4OJLb9t/fwExQ416TC6djGdfy8WYCMEEy8xR1gNjEtvcw07wC/kC4H/Vtvc56CcPEwZB5gWHUsI3cOsDHdDDXKUdpkIS3KDrPTJd9FkhEyotAEYWRPKrcXGj1qrGWozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814573; c=relaxed/simple;
	bh=lRKXJKZrP495IiUZDHG4weeCWTHu4o8bUjJfmGNlq8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToAe7Ay7HdiR7/g6uBvkgUE8YOcVqnV/othcBnzyEWSZtn8m5vYMUGa/NM4B4YGl2GJty2DYqo9JoTWE+OIZ/Y+2gBKZIPiJHCiuV5xFC2JIaTGWDesbAXkd1fwoNvWysbdvT0pi4PIbQuf0hTN9TUABKQdPO+gJZgJtUtx2ekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CImSIX+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rxegup9T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mx1f1604773
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=; b=CImSIX+lnYq6QRGC
	gfkBDthWL1CvqXsbiRVsRpxi3pFdzMuBGz85OsV++lx0BqyyGS9RQbt0WKHpB7MG
	vY2oWnceAoDcB6q7audWseEFs0NHaOpS4Qmk0q2mS5kGIIEKRc+PivXDv3HykPeR
	bjnH6Xl43aWpdZVOLUxueVOlQQFU5Ut7AcRZDwovSkzWpAEKsdKCjW6z/qmYSm0Z
	B0oLZMv5T1xjSHHaejA9tMj2wnWLomphV90mWkk6AzZaqVU86D/TgMU3ydl444xZ
	ICrq0AArOqkWtFn6ELk59EpGLc/89XpHh94Qw3kpEU6MVQ8aaazVCZ1Glli1DJ4Z
	wyI08g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhmvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:16:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bea07880dso7774611cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814568; x=1783419368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=Rxegup9TuMBqrFwoI2Rubqz1X01lq7BdUGi0JcDKbywzUy1GWll1EThTy4E+nWzLmT
         jOZYZsZZ1/MbFDKOukp+lbbZHmJjKh5S1IJFjcxYX+JPTocShpDuG8ofCsdscP8tW4mD
         lOuEFgaRraR/isBgByXG+SZZRuEl36qyLPBbf7wqItBQYT7sgwYTdml7O2Ph0cax8KcW
         H5uZ39xtRuZtpPp75vi0zYlTkLhZCJL6tVL4VeDfG/bBH5rOQKAZZyaSvuORld2L7swv
         yCnHX07T5U4skvdRECC/eT0cM9YMYz3SPc+6PIxwADOa54IyTUUcIRkT3sALpnN84vCr
         GQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814568; x=1783419368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=sbWRsR6+alOKKncaH/3LOXwp8xkDBRpBjlscwxZsmxjZw3jF9RdqQ1+iHgLWvb9Adz
         OaJvfvzDeEuUc28fb2Qqe2zCMWFvqCC0vDVAbBbcVnBCySJKq7eCwK7nZfzDAFzuLnWP
         AwCfOB21J39QuFrmJz8ItQwHTj3jlZozamLF+TF3EMIDheiROAjj9QFzyHr3cPXwLVpl
         8aXFExAKvRcmc92YeGjRTrj8MUm47715I/1NbRJ8IiIDK9OrJEfvrvAC/2mTmCB8fy8Y
         oZnbHy9uV5sP2sDtuJoXPPnqseaJ5a5FTf1Oq+TlqoIZjBsSKI2a50UrW0MoKkbvh0zj
         Dvpw==
X-Forwarded-Encrypted: i=1; AFNElJ/N4EU/6Bp96DO/xMsjnsTOMFZ2LZ3OEPsHJXk/IWhI4FOw2vdd1eAkoWyHFU6psUUSFkHEgRBhdKSF7f1n@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGn3gM7AlHyVezfOGwdfTAL+nBYlKXfLQnsaraF46bSapkain
	uRHKuLw/VwD5HxECG03zhSNqvHD6wm3fOCp1gMgSMfqsFVg3NAtZXQFoJ3dmkYK+l+/mhJjs+Ei
	LaXAkisuG2qme0v9Xy1ZBn6ZAWDq+M1V5KPRwotpFdDROZuyf9C7fiUmRZwk5gxrsL65J
X-Gm-Gg: AfdE7cm9HVtHx48+7wO6GkyXCduuRswjjqDQTt1EtekEUsQ+yPbAWj8MXLeQ+n9sT1I
	x0+aszISZp4xT1G0xKhb3au4Q5rKegwHKN0evOW5V5snG2EmOvy7yYDxtIcuZl2B5E1DFkwLYnF
	Lh+5+Tp0Q/WcehHR5+PoRBo1rseWXWU1XF8FIIbnpKqKbVKv7ZtFRSxHI4ozEQifhj5p8CbXEta
	VusbrDC+74F5NmpUiQDJqazbB8Gis7d3A/7FaKpPwYFQk4HNZCQzT7Rveol0vAepvVX4XRR+YMy
	t3TOPKiMVAqMnW8FNZCumEgeZBo1vJrf5hG8wwCQQoJbEwSeFYNLjHWi8xFoC9BvM0Ho6Uy1/Gf
	ceFVcbtLY3xBx/La+3SGJ1IS5AUSZ9rqqapM=
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969661cf.1.1782814568011;
        Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969481cf.1.1782814567520;
        Tue, 30 Jun 2026 03:16:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm98630466b.38.2026.06.30.03.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:16:06 -0700 (PDT)
Message-ID: <4fe8d4d7-1aa7-4c18-95a5-f0a9d91e820a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
 <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
 <akKUIsKtWXNYSaxA@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akKUIsKtWXNYSaxA@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX/EhS+EdyHdhO
 KN6F9CEpxEVMi57TkH5Ld1uuIxipWy81IopAlzpozbAKj3ZIi13RjheiPXaVUBg78tHKmxb+vYJ
 5uIM4R/R8s2B76sMT5GcGkw4qEul8k82ofCWtEbrZmkUbV0cFJUQciK5WuDaW+7ksXJ0DdSqQ+4
 HAMxVLfOgEm/iHDFZiEufI0OE3qK2Y+PleQsXOcm9RZFXQF7o5fP1usVKqKV/ucWMMCC9SqSlbs
 opH/BZLq1nAGdzTrK8A0tfBsseyOfroEvx6cLpuGFq+TM/mFl16aQue58DsUwPc53SP2SWMtsOj
 QtwjUNIhGM9TbFVu0L/iwA2gbdjHCFTivkyPHhC/PokZ0/r3lSSHggHMOmzIMRfGQBAO7/258t8
 Sn+3qId7AWI7bu4gHIxL3rUlbcUxV+CWkDLfCkPix0XYHN6qng+/Ze+I20ul++yK3BTewChc6Sp
 ekWT67lKo9+DTmwlHiw==
X-Proofpoint-ORIG-GUID: WN98ns4u63duM_Wj_EBB6XwZuwE30DQj
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a439768 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=n_5_cvKnsOMzfkmOiNQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WN98ns4u63duM_Wj_EBB6XwZuwE30DQj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX6l72BmexCVmS
 hux7F93Im6grGeuDwFDY3F9VxpIt7jKIhXATMFLDuM3ggLves+sIUFZvmUydwpItAKDpx9Ds1aa
 /o22ozpBd/l67FJxd4rCiOHu+jzhTXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115358-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3667D6E2BF8

On 6/29/26 5:49 PM, Stephan Gerhold wrote:
> On Tue, Jun 16, 2026 at 12:52:48PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 7:58 PM, Stephan Gerhold wrote:
>>> On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
>>>> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
>>>>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
>>>>> match nowadays is gcc-msm8909. Looking at the differences between
>>>>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
>>>>> definitions for the BIMC PLL.
>>>>>
>>>>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
>>>>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
>>>>> used for GPLL2.
>>>>
>>>> BIMC PLL is never controlled from High Level OS (APSS). These are
>>>> controlled by other subsystems and voting should be via the ICC for BW
>>>> requirements.
>>>>
>>>
>>> The driver doesn't really control the BIMC PLL here, the PLL is defined
>>> with fixed/shared/read-only ops so it mostly just exists to model the
>>> clock tree properly and have the clock rate readable for the PLL itself
>>> and any downstream consumers.
>>>
>>> There are multiple drivers that do it like this (e.g. gcc-msm8916,
>>> gcc-msm8939), is there a reason why we should drop this?
>>
>> My fear is that the kernel may have stale data at any point.. perhaps
>> unless we set CLK_GET_RATE_NOCACHE?
>>
> 
> Looking into it a bit more, it looks like this "read-only" feature with
> firmware managing the clocks is unfortunately a lost cause...
> 
> CLK_GET_RATE_NOCACHE does help for the clock *rate*, but the clock
> *parent* is still cached in the clock framework (and only read once when
> registering the clock). So if you have clocks switching e.g. between the
> BIMC PLL and XO or a GPLL you won't ever see this properly in debugfs.
> 
> In addition, when enabling a child clock branch we make a vote for the
> registration time parent (e.g. the BIMC PLL). But if the parent changes
> later our vote is never updated and will keep clocks alive even if the
> firmware already dropped its votes ... :/
> 
> I will drop the BIMC PLL and other firmware-managed clocks in v2 like
> you suggested. It doesn't seem worth the hassle, and that's what all
> newer SoCs do as well.

sgtm

Konrad

