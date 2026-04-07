Return-Path: <linux-arm-msm+bounces-102043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHfDG6tu1GnmtwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:40:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6D3A9284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 656803004CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D91C36C9C1;
	Tue,  7 Apr 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FraAhuGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYzLRmso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EC1A0BE0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529636; cv=none; b=Xk7K9/1Jso632fvXrNGC4852BPsBgMYhr0TbnMLIpSYEzknu7S3un+tHl7MYzigQtV6JDHWz4do42gs5onxwXN6ECqrwYXRw4+s5BkOp0xkOgRv8Dptq6bKLXAax6dRTTROk8H85tpGfMgksUJdNjaIzLBtIZJvV8WuhnRmQzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529636; c=relaxed/simple;
	bh=6nLuycy9ugL1PICvbpZ1+CdVUuin2IvkNY5gP/mgO6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzI8kb5WCRtb6bs5VJfWCjfvot9CneXBnXLYlxSgy+/nXhalH1RriK3eV5pkACc5B4QA0RxJiARMHtCMluRGpNC0CxkVYYikklO2aQ5rtFaXhkVmn8KqCJR4sRprzpnUX7BNhwDSYFjjLG5Rx4mt4Uogbk2nXv4ToKyfITBvQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FraAhuGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYzLRmso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQN593537365
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=; b=FraAhuGX0h8bJK8U
	yUTiV3UkjuVeGdijZgCFCpNHqsrgUdIZ9DZXUCw0sIVutMmaqi9sVwF1HamNbAnd
	pUiT2tpimvrn8RfNrWoM/BopFnioo2eMbsdGmELbUjtlf1cgy/KwSNmhf1lBNmWi
	imuCCz6mWPZyRBzJMoTTkT6JxB85oObSDgzGQELITTwEys9rbuyo72U3IuEg25Zh
	mD9yii3HTEcdDBKjzi78cE4hkbe5JoTPHv57QYiXMqj9MVhV/RBLsfhBhKm+TPKj
	vSVaSOnvfSYYPpBnXl2axfb5GeVwP+Hr/dx4Mmi7p9NsBz77u8KSye6u3r+L407g
	BR6+Cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0pjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:40:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so4702951a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529634; x=1776134434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=;
        b=jYzLRmso2yS5khJXVM4yyPXsidoVAX1z1sZ18wbskxjffkIfO28zIo9fRpEdiWOT1p
         p1et3CSOITQcDhXZpWGsrrAbJDLM6BAE02dZZG+9pqVySax1uSF+N/QaRvAtRQqwzLVY
         L1gr9w7E3Nkobc/5e7ri3z+w9tIQJFVBOkWCZWCglGtNR0c5gItYgLuSEzJ6QDXIuuE4
         Bc3Ev59B3UHi1ZfLhmdeQz9Q5HvCZqM/mP/cAFoEFhTVT1F4XscA0i1lcVdzgFxAi0r/
         KPRV3T7ewj5fLwVxUMu86jaqtemnaUgPild/I2KiNmNR4ffWwp89afVQ42GieUlFiRCm
         k2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529634; x=1776134434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=;
        b=YfmVA2grzy3uGY9PyxXeVxkNrVgKNmXn9h+/xq6OYXsq3uzgahVMCBjxgvc1E5c9tf
         njv2fg3cm3yeiZKynQLnP0twr3dWTdZ3Rv6irhKv30mUzZWFEJNBb/6iIrtlEYlE/0Qy
         UAt6c77pgjduIWl51HinDYY5gMVDy86PBwxrWwFssePvwHbYAgVmvv/5HK/Jib1X5CjG
         pc5OvydqeciCuoo6U8CnV+VN6o2MRcEdrQm9xo7eyaUPX4huPVbX7KxHJqqV3dSAKqfS
         veKwZomkLMVvD/RoAGRAUtYy4O+RbMxf1828mQdcNdqXX2aKRvpXNd+VzlXqqwbdrAzk
         SDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMAmulnUD3tA+kz4ag0YuVb89s2VE95Tm/f3gSHjR1q8sNCp2b9315Y7Pw6yxN9wx6EP7y9QUHRoIjeUwR@vger.kernel.org
X-Gm-Message-State: AOJu0YywftZMCOvcr9RqIx0soAWimS+6c7cqVD8+RHbSi+utzT+Prg4u
	HCgWzsaxOp8lXiUvsiR95/WQVdEXVEPsi0L4/1awzhE/9Gu5G0B/OUjb9EwbsAYD5KowmNc+aKK
	BNDAwvDPhXWYPZyTdalflEXU16CjtnOU9rjAytm1TBvdznYXdSKpPes/SnRy/PbGgtRSS
X-Gm-Gg: AeBDievg1NpL7m+gjdI9ivNhjRrc8O/j3cM/Y2O66lCjvx4cOYc3cnJYhk/Hoxm3Zsp
	FJrjA4cFaK2RJi6+6IL456/WAMoKI+CnHdgRkdQ/XCevWl1A5yHqwyiMBoDxlbDOQruVLN+AbaA
	l6ft8hcFzIHA1agbYiWO4oERmtWV2oVbZ0XfmaP4bWDhrWsOUHDNFmnRFJr4WC8KY5jbgrQ91GK
	PENQMUsNi6KTu8G8pyxnT9pZU3H/67++hveTNrgnCGbkPHO7BuIN6dQsCFNmMmG7r+Ktfo2mb6v
	zc4SlMyVxPHG3c/XB8520lPRDsPReLhRxdKkHvsBggO0zXkzVLXsdhx1EFij/rrpqk4qrXyN+fL
	PL0eGoFauc+O6zGPjKnEaE1mjInqkaCzuK+w0a711IW7mUwNmcHLJookRtq8aYiExDfQZhR6ZAW
	Gb17/8J7yw7GO59KV/
X-Received: by 2002:a05:6a20:9389:b0:39b:e9e1:699f with SMTP id adf61e73a8af0-39f2eda70ebmr15601185637.12.1775529633670;
        Mon, 06 Apr 2026 19:40:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:39b:e9e1:699f with SMTP id adf61e73a8af0-39f2eda70ebmr15601152637.12.1775529633148;
        Mon, 06 Apr 2026 19:40:33 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65935cbsm13954195a12.26.2026.04.06.19.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:40:32 -0700 (PDT)
Message-ID: <9b1bd10e-5ddf-4f35-be6a-cde4f157fd40@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
 <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
 <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
 <adPLDWz6_QmBa8w1@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adPLDWz6_QmBa8w1@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a_k-CSXSaEFcA-5e0BJZB7LX7JL5w6dT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMyBTYWx0ZWRfX3bOghIAz5U2Q
 sGYYV0axbwTPAMwomAo/8rjovCI6Jk5BTeT8+0uM8wo5KqbzI+Bgs6m3K+hqyY8o9oo2bcUiFFQ
 sJ9MUTCMTetSFTlKXxwXJ2JU0JMspWXZ2H60hu3VHqGBPeMZepb1jZGr7X+SKlloFYOdNGB6jwh
 geTUZIW7uO7LLRj42wa/OGKcc+SZl2VXm099zrulaCXW4MGsIa/eyhQofMXmM/yyUgKll1o8cYT
 0i7N94pdJvpOB9xvMbaMvpD8gtcFEn59Rfz90o+8Oao4/pQGIMtXGSfepwH89apJKWaM3W5a9mA
 Oa6HYb1J6Sh1ltFDfxyk3EgYttkeeknTDPHZE+ml2s2gCH04RfOauxHkWnpCy5ZxUrgdq3DsNbQ
 /9GNqMhntRcocAmPP/2re/8cOdpDSZtUf3DG9dM6HPCclxcBAef2xzxc9AZZQKT8jA2CnYO6E2I
 ScgpghK6W70MS7EngdA==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d46ea2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jyXJO2DQ50KPEQLR6RgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: a_k-CSXSaEFcA-5e0BJZB7LX7JL5w6dT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070023
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102043-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AE6D3A9284
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 11:04 PM, Bjorn Andersson wrote:
> On Thu, Mar 19, 2026 at 01:44:48PM +0800, Jingyi Wang wrote:
>>
>>
>> On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
>>>>
>>>>
>>>> On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>>>>>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>>>>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>>>>>
>>>>>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>>>>>> config structure and only set when registration succeeds. This looks to me
>>>>>>>> like papering over the real issue and I think it's still racy as there's no
>>>>>>>> true synchronization.
>>>>>>>>
>>>>>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>>>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>>>>>
>>>>>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>>>>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>>>>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>>>>>> any other work items that can be scheduled).
>>>>>>>
>>>>>>
>>>>>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>>>>>> but releases it right before calling inspecting rproc->recovery_disabled and
>>>>>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>>>>>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>>>>>> call.
>>>>>
>>>>> Yes. Nevertheless the driver should cancel the work too.
>>>>>
>>>>
>>>> Hi Dmitry & Bartosz,
>>>>
>>>> rproc_crash_handler_work() may call rproc_trigger_recovery() and
>>>> rproc_add() may call rproc_boot(), both the function have already
>>>> hold the lock. And the lock cannot protect resources like glink_subdev
>>>> in the patch.
>>>>
>>>> And there is a possible case for cancel_work, rproc_add tear down call
>>>> cancel work and wait for the work finished, the reboot run successfully,
>>>> and the tear down continued and the resources all released, including sysfs
>>>> and glink_subdev.
>>>>
>>>> Indeed recovery_disabled is kind of hacky.
>>>> The root cause for this issue is that for remoteproc with RPROC_OFFLINE
>>>> state, the rproc_start will be called asynchronously, but for the remoteproc
>>>> with RPROC_DETACHED, the attach function is called directly, the failure
>>>> in this path will cause the rproc_add() fail and the resource release.
>>>> I think the current patch can be dropped, we are thinking about make rproc_attach
>>>> called asynchronously to avoid this race.
>>>
>>> Isn't this patch necessary for SoCCP bringup? If not, why did you
>>> include it into the series?
>>>
>> yes, will squash to soccp patch in next versoin.
> 
> I'm sorry, but that doesn't make sense to me.
> 
> The SoCCP patch adds support for attaching SoCCP. This change tries to
> address a generic problem shared across all remoteproc drivers (that
> does attach?).
> 
> I think you should interpret Dmitry's comment as "why is this part of
> this series, please fix this problem in a separate series".
> 
> Regards,
> Bjorn

Sorry I might misunderstand this comment, this patch only address problem for
remoteproc that does attach, I will send a separate series to make rproc_attach
called asynchronously

Thanks,
Jingyi



