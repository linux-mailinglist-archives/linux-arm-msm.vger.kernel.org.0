Return-Path: <linux-arm-msm+bounces-117338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t9yDFDAGTWrwtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:59:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986A71C433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="N/BS5pSA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jBBTVAAl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117338-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117338-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F42B323542B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C30422522;
	Tue,  7 Jul 2026 13:47:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2F421EE4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:47:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432034; cv=none; b=liThIUjaxxbu2ggVCPy5UqNmmrNXhyODaUUc3lc+4x0CPmZ45T9t/1fzqry7rE6KNAy1NBlIBUhVs4Y4+T3ojy7J4mIQmk44usSL2PALXdW6726G2qsItGm/8MjxipYuYf5OuMvFWk8SA24F4mA51Tfe7JJMJl0z3qBkmz19wFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432034; c=relaxed/simple;
	bh=bENWIoUDmb+p3ApVBhAj+ipAHOlaLeCOdg1Ywad5Xuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruDs+bqPAVE4d+ikGoBE9lo2XqqAdPWIeUkgmTGl/QQOUQ8OaQQXxRmH98XeH748SXVgBVABerfoDUPoUN3IRY3jl+42sT7Zzl1tppOnHXLs7LfkAqArW9en5C9kRJA7xHLZ3GLv7VIyjQ0yZrG8PvWmMdgPLdhUxShbLaT8ccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/BS5pSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBBTVAAl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8hsU3616665
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=; b=N/BS5pSAK22IBIPR
	C7q8d4MPC6CupunpWede6AWAyvgf3jJfvxsuLdOoqZuhTw7ITo0iveWUP7L5U0S2
	TMQ3sTEwFtG+Tt7oNXCKnhszvPMY8orddr/sMLvSCrCC5cvbVMihZJSBJD/NhaPM
	px1VLvSP36vpimk3cG9J5y57XFI7WDeCm6DFS29gURmNw1Gm6izCYFQdBVDbNyCm
	vX5i497hU+zCAzIKG9HGuU6oKc9YoFBptFDU3cATN81vhOJUjv1J0gDSa8rDfI0t
	k94NwFNi2Pw1CRJ7y6EjFbnNvAIHNBcL8xIIUcV/Km3bRJ8zIzn/orwX1/wfuyy4
	33sV8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1ht1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:47:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso53776486d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783432031; x=1784036831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=jBBTVAAljrtlwIbIJ6RRbiv0cxugWIQFllytqMrCLAMK+1E+ZcX1CJcD3NFtcGqK9f
         Ak8sPimeZUTVynGxGU6PMhWU4uBZP1qXI66aRFlA10T8vJKJdLlb9IuM9djQZ3YOFqKd
         hAJDuDXHCzwO7Z3yTIrfqSEw/RMZ/ZSWRjwkuzLMsksQ7nIcu/YxC+f2TEWQI17vlw0b
         1bHJfqrGqik9BW5Dcwb/PwkDiTnLqd3Fn4TiOvIKsph4Xof8Cel5qiFVY9sPNeBeJpCE
         D/8ee6C70qEZp4/ooXl83Pt86KS+LLU1RepGN9bw1LBAO5tKMfDdOSl1DaBe5e8Nw+Ti
         QUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432031; x=1784036831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=TenWtMSztSaOsbvXmXTA8+OnizXt6soBbmgDlxX7vZVBR72r+dbGQwleO0tGt69RUx
         m+c6WrByTdc75FrMbc5z6xRaOm2Sca+DANiCiCmvJq5fGT8yjX84BjuNdHBmqfS3RbGV
         MnxeRVpJkVok9Pa2EfKfU3k/m7PTStMI5/O/mHULPYA7gFhDIKyseAi7SnIPkhjZiEwi
         O5d8d53EPa0q5sClE7SKu8MrSay3dtje+LTwDN/XNr2f7xwWZrvRYbJSrzEEanvKSHwE
         AOrImW4HU3E136J93B9YSUeW9nQsD4RvF1d7X+d6ZSq7QxDbtc2Lwc852A7PKBzrD6Ur
         UtuA==
X-Forwarded-Encrypted: i=1; AHgh+RpUnlQKtVz1oDqHgPg84KT2o9DJXk5s9pAkZGSPi9tbBJZEFuL9WZ4lClhAvWLYuD0CEOBgIV4YXecSP63e@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSu19dvxeiU6giOwckq6/J95gAO9oftUPefhUOdkNHw4l2lMn
	jH+FNwP6+hTaheRadoJ6zThsiq6aQBUJ2bVi0/ILAN64GWzgncVydyzLWxPmFchkrz65UQB4Bqr
	drO1J+6YpGKdn3vVybR1EJv6uEhna5NdVfgOzXgSWzJCCgaV/HGxDs8tGV9fqRJYqaUYA
X-Gm-Gg: AfdE7ckvFznpJcbGvIxa7kjGvYApvxZrCkoekqNu49fm0q5G6wNIcT+nc8ozoTkSK/d
	Gk6GxGW36HwqWOMiTaKs+zfGsJwA7Q2L6dAw4DDeM5PgcqC0FHFsUhFHafb9EzBYhDyB2RhTWvD
	W8cKbLN49XKK7KOiX6i89ysEVR/6D38uTy2lLcISoiXN9tTugIppubR5ZZKE5RBtNqSNxHDq9U7
	xuGd+AYd61b9mQdQSWwshTsnHYrhAkYiy3d7UxhILm03kc0nGECvTpA3n5ZvhSBIxx9wUZbEnED
	HtPJ01ZahMFVyRf9zron1jelBg5MxJCPBPqpY81Jp8DME1SQ9rnqM6z/HBro3rWwvqvXDWrY4Kd
	PiwR329THxop3/Z+m//SVeG8ngbQXBC3R24Z239fQrfKt91NY/G1JzY0OMAPzQ9wLls0sfX3Bjn
	swk/ExobA=
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798591cf.7.1783432031376;
        Tue, 07 Jul 2026 06:47:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798071cf.7.1783432030794;
        Tue, 07 Jul 2026 06:47:10 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daafe2sm5659651a12.25.2026.07.07.06.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:47:09 -0700 (PDT)
Message-ID: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:47:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNCBTYWx0ZWRfX0uta4v/McUhg
 hpAXHm8PunRfhRNEXCVdltXuo6spxM/yq36XcApSYva9wapqdr1SDV49U9lZIxqQXRKxkJiznOO
 THYWFSP0VyWNysFKHw8g7w3eD9vxYsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNCBTYWx0ZWRfX8nyB+xyST2u9
 bdc//dsECd6Ay+AHvpagP0WYx3JxiPaN+3we3knqWRoobncBtZCrzVgNArya5eVB2ZiiUzhpIuT
 F3FqjC0fRI/miHLFZb0/1dxU7FdYFHTjBlFHimh0zIDtLliu+9BIdbFF55xE78jX1Q1Y8K2HLNH
 aGYIcwvSzfJeyEIwvHzx4+xiJpFgWQ/7F/8djEQZNSc9RJoIYACoww8VoOicoO6F1qfW9H560HP
 pSJ9EcuXNvX+uavbOyVtNqk8doqoJkjaHfOyhDLf4PKqKaobxp4EPMja4ziijH6msaYZVh53ecn
 ljcyJP+lfEnYLQoIvKbi/FHJC+FL8ukzOMyjpR8TJDgarKUQTHXZ9iFJLu81gkVjUt53oa135Kc
 chyKe+8EZAaf5FDBdUPP8HzeyR33WRXojUBkXBAtrtqXyfcDdysD+r5x3hnkVgV7jiQoEykI6jM
 1ap5d/1hFsNNXTLbimg==
X-Proofpoint-GUID: yJ2G7LPeByVLde6JCz5TTEebktQhSADo
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d0360 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FYVyraQ01RCAgbHwNcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: yJ2G7LPeByVLde6JCz5TTEebktQhSADo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117338-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9986A71C433

Hi Dmitry,

On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vlad,
>>
>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>> <snip>
>>>>
>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>;
>>>> +            interconnect-names = "cpu-cfg",
>>>> +                                 "hf-mnoc",
>>>> +                                 "sf-mnoc";
>>>
>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>> position about the need to remove all "CAMSS bus" specific resources from
>>> the device node, they are found and should be allocated on parent's side.
>>
>> The interconnect has functionality to handle bw requests from different
>> clients.
>>
>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>> vote
>>
>> on that (actually it is possible in icc framework) but what is the benefit
>> of moving
>>
>> those to camss? Is it not better to create camss icc. I understand
> 
> Please fix your email client and stop inserting extra empty lines.
Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>
>> you want them to be on parent side. But how to vote on bw? Most of the time
>> it
> 
> If the driver actually votes on those, I think, it should be fine. This
> patchset seemed to add bandwidth voting, but then it dropped all the
> votes in the last commit.
> 
>>
>> depends on the jpeg encoder configuration based on resolution format etc. to
>> set properly average bw.
>>
>> So i dont see how that can be done with not explicit dependency on jpeg with
>> camss and some exported
>>
>> API's which we discussed with Bryan they are preferable.
> 
> Interconnects should be fine to be referenced here. Especially, if JPEG
> has its own port to those busses (hint, commit message).
> 
> As I wrote, I see a bigger issue with the clocks. You need to have some
> API to vote on them (and then let camss driver aggregate those votes in
> a platform-specific manner).
Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
for the clock voting.

Regards,
~Gjorgji


