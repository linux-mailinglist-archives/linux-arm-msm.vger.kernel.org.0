Return-Path: <linux-arm-msm+bounces-107331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH+mAu2DBGqILAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:00:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E55348D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14C563023102
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB638283FD9;
	Wed, 13 May 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/WhnjUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+byKp/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501B218EB1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680266; cv=none; b=mLViy6LkP7wX6WLXjWAQi0/0pEShTyusr7O7JGOILfNrUYZ4CCv3Z+cN46d+cTJt3Yn/FTMLCeas8SE9clRoHi9HNdEhU11ghALRDUIse1h6NwK7erVXRTsIKwko4GASS0zIm9jSR7V/HirHuNepd60fWH7JkHqV4rd3UrC7YJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680266; c=relaxed/simple;
	bh=DSXT4NIuUnw076JVTQ4vmKkdoF9b5t0jZ/mS9/vfQ2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCfSALH5A0dfI5nG6Chdj7NELhUiwKlE2l034keBhtfN8SSP2KEKCCOj8SG9Hik/PhR/h2QZ4R7xuFmkbuN0T5jfBAlDQ6fGz/AOcpak56sqgwScGJsVExJzIFJW+6kR0goLWKMUIuQBiEZMwn2qK8LrhwMeSfQNxEWWmQsu1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/WhnjUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+byKp/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgfC3007378
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ouiD8TrXrDRqoLSjw/cWwHcmGHb/0X/tro5HKYheuY=; b=K/WhnjUYZhY2JLpN
	wBMgN3JtHwmtP6Soup8HY0kcG56QeDjaamQBeQkWn4PtZxOA8zekqHfmYEkf09LJ
	MBYqS5dUD57JSiZebMLnoRXPBghWYRSlqyF1u9ksJTn7wc2KwMcRJRjcCLcKagX3
	m9Ep4C02EWfnwtibo+KfNjFpy/XT21zp8org35CD14GUcFL1FDN4Vi9GI5eW7NLp
	PQ292zRZBqXbiWWkrZEqFJYYpFjwQfqO4LzaIfC/pN/FAqQf6DIp5T7FqdYLaRQD
	GXBpDRL27EANANTdS6OzmwuqQu7cCqJLDbF871vaMZIIp4obTN6i+xdUgDjUFr5u
	zQNaLw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gutf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:51:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so4617872b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680263; x=1779285063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ouiD8TrXrDRqoLSjw/cWwHcmGHb/0X/tro5HKYheuY=;
        b=i+byKp/4JCUDsJYSw7sONOQBZdAhnCJ7hEezR4TjnGrKZsZ97x2DvF6NJLsLPmlvPN
         gqwBs/oX5pRysz1pC9MMtLn2nUTdlQmY8f3h8/ZbQja9DyTgRiFVKU9YZU2a8NisHKHM
         m2PFZIJfpZcMFJj7Ua8/gHtXr4OoM+RP3s0xlmpjqYmSt1okdFQYIVUlfHjf2GWSfTK6
         ctvfxLCPZMbCSrSDnN9ihBAvr3IxO5aEAz5+qqjfRFEpzR2rcnm3+ZXvUakhYaoN/1eu
         t3ZWNDGQTk0ALw1nkRMPHjRlZUr7re2LowXMCZ0erh0UMEIn2Njqe89rVVDvt800kqJ3
         Otxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680263; x=1779285063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ouiD8TrXrDRqoLSjw/cWwHcmGHb/0X/tro5HKYheuY=;
        b=mWG+cblGCwfoE1OP72zAqh25Pvce3BSN5OshOien5DQEN1eCnBd819efDz8k3V0hhi
         XE6PAnvYy0+IvnoKgrPibyPXhfaUuPw994R8wIiI+v8grroBk8Dl1r9tm4KQ95EgLtVY
         4ukho+h5TpqDuHkLdyJrX0lYNNuBXAGPw/Z8eQtl9t7JQeL1zxrycCGL7eT20WB5iD2m
         OFBXkzxZuA+WmARZiO+q/fwyuIIOkljGnUW8pZ/rq4WWilC1c4wdY2k2eXvQpBxYy44c
         ezvg+hIktuu7n9NrUE9ZQN6VUVVJKSkpUdw48UoZzKqK/MB1jttdNcqAjplrItVzwfFU
         3l/w==
X-Gm-Message-State: AOJu0YxDZ5U10f5CBiqe4IkzRzqWLzjbwu46jO7Zrgw/czYD9VxKZlIO
	dC622G6KM7o1RkHOBdw5PUgm7vjRDihyMxdxhLRqJTZkc7c3YORGQ98ZdmkGsVI1iuEMleUmjJ+
	FEQhLbGyBBRzRIBtigx55fQAVeRrDJMkM7cA54LVyvwNmfqW5KyNLLcSNFchLX4bIXOtx
X-Gm-Gg: Acq92OGARZ1eGTKCamfdIyOcsQnzhjoR7pOWeGGwhzPvnUHfvfDRsGhduFjx2yU2HFN
	2I5I8sU7Lg/2v6Y9R0an82tRkq5otgXipG4SDEfVy9ZOnsXGjpygpgbi00txqQ92Eqcr7OdiUSj
	Jv7hLzQDRsdSbyRrJakPE3ZOSp3IL72z3VxqfwPtPH7lUeIvo215jzc29IERwPPwRuz938xrKi2
	6Gqy7dsQ77YV688xThfHyUV31RlpNdT4lGCpwtrNkRgNb1Ow3gMMySDsFTYrjQvueua+AFrx7z3
	j3cQuHROE0jyCjLiVEwncnXLGa+U79pzmfOH3JeSFe5IGbYH2APGGQs0uAbNpePvAnCiScoosvi
	ZjKe1ycz6R2Ftb5C7OMT5u9LaLgTrOG269ev49YdUKlvOCDgXLA==
X-Received: by 2002:a05:6a00:3d16:b0:838:c01a:7a4c with SMTP id d2e1a72fcca58-83f05c17193mr3167310b3a.33.1778680263410;
        Wed, 13 May 2026 06:51:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d16:b0:838:c01a:7a4c with SMTP id d2e1a72fcca58-83f05c17193mr3167233b3a.33.1778680262545;
        Wed, 13 May 2026 06:51:02 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm33012801b3a.46.2026.05.13.06.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:51:01 -0700 (PDT)
Message-ID: <756b5d98-958e-4ad3-9543-8727b082cfec@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:20:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
 <45cc09dd-e5bc-4bf5-af87-cdd2616c02e4@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <45cc09dd-e5bc-4bf5-af87-cdd2616c02e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX7WQhshXbT7LA
 fKTQLBk+12eizFBgKRjXM6m/wnv1i8aMaD4vRXiUlYlCiJD5ekFNGLmUp788LR0Inxo/GY4dVwj
 QCzistf2r6Cj4XH5sxDi8E/x09h8ohdYFRHdd6jS+rZMhgbl+FJOOxvmUncjzdNbzvY+5r6yIlX
 /6Xs/86WvJSr0ZKnvs8AgEv3kVAl14NbAtlekQC0yzrVXP9zu3Ws6hfU34tqsXpuSbZc5tysQFg
 ZXfhIbWe9GLxd9GN8lQTIB+XCPm4Mc2TvgP2ZzcXl9vKdLLpe/Vud5C52lWhNubtBjOa3eYfPxr
 QA3x+75ZQGPuWz3U73ScLDchS8Q46Y9EOzFkqVvrcULdJ/Q7+MCiW1UsZW+nqrKy78vyU9S5AYX
 1PNvBHbsgNdhL7FWIp6yl37lhk196FbMlq97iTlAGv7WZGewZWC0505P3N/RNStULKkl9gLNe8q
 S4dCTnIldCo3+lyGoOQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a0481c8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SlG7AwRQmjCY_m6tYyoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: buhD_WyM2hVeCGnCux5NxeFSPmbyflE0
X-Proofpoint-GUID: buhD_WyM2hVeCGnCux5NxeFSPmbyflE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: C27E55348D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107331-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 7:11 PM, Konrad Dybcio wrote:
> On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
>> The LPASS LPI core conversion to PM clock framework relies on variant
>> drivers wiring runtime PM callbacks.
>>
>> Hook up runtime PM callbacks for the remaining LPASS LPI variant
>> drivers so all SoCs using the common core get consistent pm_clk based
>> clock handling:
>>    - milos
>>    - sdm660
>>    - sdm670
>>    - sc8280xp
>>    - sm4250
>>    - sm6115
>>    - sm8250
>>    - sm8450
>>    - sm8550
>>    - sm8650
> 
> This list can be removed, as we can deduce it from the diffstat
> easily

ACK , will remove in next version

> 
>> This is a mechanical per-variant driver update that relies on the
>> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
>> pm_clk_resume()) and DT-provided clocks.
> 
> Please mention that this commit alone is a preparatory NOP, since runtime
> PM is currently disabled for those devices
> 
>> Runtime behavior was validated on Kodiak (sc7280).
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> Please remove the word remaining from the subject and commit message,
> as it no longer matches
> 

ACK, will update in next version

Thanks
Ajay Kumar

> Konrad


