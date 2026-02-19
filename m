Return-Path: <linux-arm-msm+bounces-93339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m5ohEuWzlmkxkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:55:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA715C878
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B85301BF62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEAF326920;
	Thu, 19 Feb 2026 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJsE05yM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRSTOn1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D41325705
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484127; cv=none; b=A2WzmkXfk8E/5o6Y6zx2oi7q0ezcJFhVAZ0wbBizPsapzM0F4c2/K4Ywe8bJZAYhAVTqRLbba46VxKcUs6AIa4dB+ZomtsP6Uqx2JZ7RNSZyi2Fx67BjIQbw0jCUoJz6tLjU8WSwdNPcAK6FctkwgWJmOT4HNl10u/joNSe643w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484127; c=relaxed/simple;
	bh=cCiiKq4o7dI8aHalTEeVAZP5oeI78eT3EGsOlE6IvvE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WFdEYFDpRsJ37d/2JdIXxtIP6S5HrC3L8CiPbOaIGaGwqku2jZCHjesCceI5qV3K0InWWdGfh+4DuiGEv+g+vr90Q3NTIbV1k8tQUCpz9xo3CcbdqCUlJUGESZBfM35C53276F1/JOLjK95akJEbn6IzKGf1msr7BtBA6bvsJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJsE05yM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRSTOn1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IK7bAd2773503
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/NTXBujdKsjX/xbc5Xh0qmB4MhD3tsJFDjeS3SuB94=; b=YJsE05yMC9gn946U
	dWGD2UraMrUd2Aj+wMqNqMMwty8Icm+hwq8WbUxA9rvcT4Q+KGtH+KbOpj9sHmXJ
	3cTqYCwbr3Y77vTKdnCHm8XyGFYKG8+3mDtkmjb47dkSANRAa5bzQijzfAyVGOGx
	I5GZAS/kFW3TrzO9bLHxqjKEmiLG0TwDQEjWu1uOw1li1/1pE2sAootJRDpYpo2w
	pEqXxAA01rs/a2qlGLx6Js/COWw2ozJIlpT711DOE+ANjatBGPgxu5fPeWPpOcCI
	w/6Gd00VAcsme4ltBIHfILO3YUIXQO2oGn7j521i759P3Osa9OL/gWBG0VjT0iLl
	Jjb+Cg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7uasaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:55:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so36819355ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771484124; x=1772088924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/NTXBujdKsjX/xbc5Xh0qmB4MhD3tsJFDjeS3SuB94=;
        b=gRSTOn1udGRbyTzdyFjA2+MONf2WFoRz+ytv+/LOhY3WihRCC2OESiAQ6nzDiy+pDS
         IanOU445D5+f7FtGeKz0j2wYiHjXKDhTOCuBAEimvM2qbper3zB2poyXkLTU+hjvgb71
         eyLgtIVlAzQvoZN6myIz6oTnJMp3mlrYf5xoe+UAaLPYvtxHDeD9rD2L164cqcadReuz
         yPRRvkumJupbEsaCHoFwWn7dJsgfZ43Dk30S8l6kc9uboyeFLVmfqzmVBMkgf3GkCSFU
         NHiMYbXCexzPR10L41gMT1pQmqSxdo7VkFidZVZAIrr1h7/nTY4Ou9x8nA+XV6YaF/lS
         XlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484124; x=1772088924;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/NTXBujdKsjX/xbc5Xh0qmB4MhD3tsJFDjeS3SuB94=;
        b=o5yiBaIFWpj5Fc2kLMG1nTYzzmmb74l/h/CTuAe7Z3VNuhLv6UI7lcXrwqyKUoPa92
         Gas0vRVy12suBjj9+0HuuhcMwSmoxElKvssO8ldxK9UYGcdF6ARBsVIBCMlfNzxvXnbx
         LW+ijbcbT3NNE8Svw56RcRoyL64CB7xurYx99gj+UC5vX2TmSVzbqjONSO45EWpMM1Ny
         g9AiNt/qTYpEv6FcSUw51ntMMvduioKnxTOjTQk3kjnJLja8rYtS6JCkyPtZCaIytc/Z
         5UcPjQiuWTvaEqI9Ugpwz6TS1Y78eUrVGxuQ1N99MPEm0wVEFDfXj9ok9Vad9kbGm9Hv
         CPpA==
X-Forwarded-Encrypted: i=1; AJvYcCXGNa3D1S1GdBvuTuBbK4EAMgUhKawPZifrmzDUoC68t2ukRGoRLVhKaMNk+LkbidqkpQ873SRGE0ljIrM5@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpnBWPUGnJGuI+RVm/TEE4F1rQG6KzYJJ+v+qpOAa8KNl3EdU
	hqbO4F3XpcI2rbJIaVXgBplroGcWLHj3bFv+wKxxdTgoyaQZ4PZTU9A/59GhT8fWHKv8P1StKrT
	wIabwrrLSwjn+Qqcu7dJtmrV2aet03jqZSjEXf8nOaZfXXvBw9ad4Bz9TtN39lWEzLfUa
X-Gm-Gg: AZuq6aIXdWKra7bUDzcgDh363MVLuwPjv6OINLNTeTm3k5Hf3aP/HqeiRG7mTkXS+i7
	vhdd7sI2uFYQQVWGcVR50O8jn8xhmT4yCu1Rfl7HyC14iBvVe5Rh51aprlNtD9Lus5rwhO5ok7M
	JlrU058HdpiNMnW/VvELBy73RqgtZ+4uGjDK6CoHudSjFE8cNfZtzWxG8g4A4NBBoNMCcVaAlQa
	e4IJBBiVMGrIeua4zuy4yjvLYHQs4kcUgHC8ai3oGl6HwkHvtprgFaaLYrvgGXCIBOMQlRVqFT7
	Hpp9HCDKKbsKZp7SZ+2/2mHjUa1PV7ADaJ5Po0Yi34UUHojcdKFN1GByuWz+/f50XXdIIFZm+31
	pgmlKXRYophZ5jt2GnF/kLxyYE/SGnpw6givbbMO71uyCyQiM6w==
X-Received: by 2002:a17:903:3c2c:b0:2a1:5785:4417 with SMTP id d9443c01a7336-2ad50f342a6mr43716405ad.34.1771484124044;
        Wed, 18 Feb 2026 22:55:24 -0800 (PST)
X-Received: by 2002:a17:903:3c2c:b0:2a1:5785:4417 with SMTP id d9443c01a7336-2ad50f342a6mr43716215ad.34.1771484123518;
        Wed, 18 Feb 2026 22:55:23 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73200asm153096865ad.36.2026.02.18.22.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 22:55:23 -0800 (PST)
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and expose
 as a pure library
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
 <14de409a-d6b4-7c17-d04c-7d26f16469e5@oss.qualcomm.com>
 <dinx3z2aumwfoipcijxsequulmb7sxaeti5eo5wjug4fjssxbz@v3azphuen74m>
 <ae80421d-2a45-bce9-d05f-b135c26216b2@oss.qualcomm.com>
 <i55xjnbuortawc32flfxa6lihk3l2oqdccdmctngvyq4iw62wt@s4kuycrczgyx>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <6109277c-9f0f-ac09-ab2c-5c55913d1c15@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:25:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <i55xjnbuortawc32flfxa6lihk3l2oqdccdmctngvyq4iw62wt@s4kuycrczgyx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: twqhih3CT6K7Nwp2zhKQxpFyaBBuoutK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MSBTYWx0ZWRfX4Vee7szWES+S
 qUkDNU4Z7C5l9Z0ihMz7Pcg/PLAQRANbUUE8mfflGOw9Sj5SzwJGaipByPAN20aZBNg1HA3D74P
 XBlGugpK4IR+4mPQ8shb1Z6X9b7BDNqHGfhhTUfMymdGInddCYa1Lf9k4KiJFl/MIv8KqWOHasB
 uG+wQ+CGF9Xl1NGhETfihpyCnPdr+JbAbtv8+9FDd9uFdECr+SK4iGQiXG0FWMvAswoyt5e/h8t
 drJ+WRrTOh5g3GRvlgnuVH0lNrfziw+moHVuriH8jcNabcaUhkOfpO1ifBubsX0voqwmo9yFTXq
 jBgDzGKZ5B2JxRWI5+v7l8xfdSQPgI+re7iWyvmmP4l87rvcUX2VpK0tOKyHun8NutoUW0HpwQu
 Cwm45Xz0Wmj8ravTC6cKW39GcxbJyT4tN79HGr5UXCfSHXmaDbMVier8RShzjftE41NWke2ICtY
 41td5FFLqvkvkk+3N7Q==
X-Proofpoint-GUID: twqhih3CT6K7Nwp2zhKQxpFyaBBuoutK
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996b3dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XdfUDi49QBOC_p-Twm0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93339-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BBA715C878
X-Rspamd-Action: no action



On 2/19/2026 12:17 PM, Manivannan Sadhasivam wrote:
> On Thu, Feb 19, 2026 at 11:27:07AM +0530, Neeraj Soni wrote:
>>
>>
>> On 2/18/2026 7:11 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 17, 2026 at 10:03:27AM +0530, Neeraj Soni wrote:
>>>>
>>>>
>>>> On 2/3/2026 1:40 PM, Manivannan Sadhasivam wrote:
>>>>> On Tue, Feb 03, 2026 at 01:37:12PM +0530, Manivannan Sadhasivam wrote:
>>>>>> The current platform driver design causes probe ordering races with clients
>>>>>> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
>>>>>> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
>>>>>> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
>>>>>> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
>>>>>> probe has failed due to above reasons or it is waiting for the SCM driver.
>>>>>>
>>>>>> Moreover, there is no devlink dependency between ICE and client drivers
>>>>>> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
>>>>>> have no idea of when the ICE driver is going to probe.
>>>>>>
>>>>>> To avoid all this hassle, remove the platform driver support altogether and
>>>>>> just expose the ICE driver as a pure library to client drivers. With this
>>>>>> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
>>>>>> instance is available or not. If not, it will create one based on the ICE
>>>>>> DT node, increase the refcount and return the handle. When the next client
>>>>>> calls the API again, the ICE instance would be available. So this function
>>>>>> will just increment the refcount and return the instance.
>>>>>>
>>>>>> Finally, when the client devices get destroyed, refcount will be
>>>>>> decremented and finally the cleanup will happen once all clients are
>>>>>> destroyed.
>>>>>>
>>>>>> For the clients using the old DT binding of providing the separate 'ice'
>>>>>> register range in their node, this change has no impact.
>>>>>>
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>>>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
>>>>>>  1 file changed, 39 insertions(+), 61 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>>>>> index b203bc685cad..b5a9cf8de6e4 100644
>>>>>> --- a/drivers/soc/qcom/ice.c
>>>>>> +++ b/drivers/soc/qcom/ice.c
>>>>>> @@ -107,12 +107,16 @@ struct qcom_ice {
>>>>>>  	struct device *dev;
>>>>>>  	void __iomem *base;
>>>>>>  
>>>>>> +	struct kref refcount;
>>>>>>  	struct clk *core_clk;
>>>>>>  	bool use_hwkm;
>>>>>>  	bool hwkm_init_complete;
>>>>>>  	u8 hwkm_version;
>>>>>>  };
>>>>>>  
>>>>>> +static DEFINE_MUTEX(ice_mutex);
>>>>>> +struct qcom_ice *ice_handle;
>>>>>> +
>>>>>>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>>>>>>  {
>>>>>>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
>>>>>> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>>>>   * This function will provide an ICE instance either by creating one for the
>>>>>>   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
>>>>>>   * clock (for legacy DT style). On the other hand, if consumer provides a
>>>>>> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
>>>>>> - * be created and so this function will return that instead.
>>>>>> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
>>>>>> + * be created if not already done and will be returned.
>>>>>>   *
>>>>>>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
>>>>>>   * consumer or ERR_PTR() on error.
>>>>>> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>>>>  	struct qcom_ice *ice;
>>>>>>  	struct resource *res;
>>>>>>  	void __iomem *base;
>>>>>> -	struct device_link *link;
>>>>>>  
>>>>>>  	if (!dev || !dev->of_node)
>>>>>>  		return ERR_PTR(-ENODEV);
>>>>>>  
>>>>>> +	guard(mutex)(&ice_mutex);
>>>>>> +
>>>>>>  	/*
>>>>>>  	 * In order to support legacy style devicetree bindings, we need
>>>>>>  	 * to create the ICE instance using the consumer device and the reg
>>>>>> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>>>>  		return qcom_ice_create(&pdev->dev, base);
>>>>>>  	}
>>>>>>  
>>>>>> +	/*
>>>>>> +	 * If the ICE node has been initialized already, just increase the
>>>>>> +	 * refcount and return the handle.
>>>>>> +	 */
>>>>>> +	if (ice_handle) {
>>>>>> +		kref_get(&ice_handle->refcount);
>>>>>> +
>>>>>> +		return ice_handle;
>>>>
>>>> How will this work for a device using both UFS and eMMC storage (one being primary storage
>>>> and other being secondary)? UFS and eMMC will have seperate ICE DT node so returning same
>>>> handle to both clients will not be correct.
>>>>
>>>
>>> I'm not aware of any platforms using separate ICE nodes. All are using shared
>>> node only. Which platform are you referring to?
>>
>> Example talos uses both UFS and eMMC:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n699
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n1398
>>
> 
> These are not using *separate* ICE DT nodes, but just have their own ICE MMIO
> regions. This is already handled in this patch which parses the ICE region first
> if available.
> 
>> For few more targets where eMMC is used along with UFS, the patches to add ICE handle for eMMC is in flight with this patch:
>> https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/
>>
> 
> So this adds a new ICE node, but just for eMMC. Are you saying that there will
> be ufs_crypto node as well?
> 
It is alrady there for these targets:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/kodiak.dtsi#n2514
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/monaco.dtsi#n2685

> - Mani
> 
Regards
Neeraj

