Return-Path: <linux-arm-msm+bounces-98625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOWMCmONu2k4lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:45:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C262C64E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C99D30A0891
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBE839A051;
	Thu, 19 Mar 2026 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwyKWURb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6JarO/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3DE39935E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899097; cv=none; b=qP7BfegOjQ5yj9FDFDtb4NWiCCVCKPuSVcSsNYxhiTpcIODtmS6o/IK94jyLLKiJf/3SMvlGuxQ9KqSh7lmaS8r4eXOCvXvX2DuvV4MkBbZpjc4lEn5GtnN011+Rx6LSpAePMs2axVAQ83lpfPKZcoyzlMW+wMKwIijx6ArgJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899097; c=relaxed/simple;
	bh=NNB5xffDO5KucLPq3mYXRXkkzL7ZnpefOvtoDqD9dZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9ukWmq7f8LXc2I9v5n5Nk3bPanUNhhQMST6ZpPhCbjRayP0GMOky94uvS7DMV0nklBp6IlvsocRdehRFG0QtOBpBgMwf72NuUUZCojm+otcQByV9FZfCkjFNOOnVwXIzeaGP9w7AOt5Bzdg2IRX5E6/e1OYFoAoKi1UQpJ4q3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwyKWURb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6JarO/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xs501802673
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=; b=iwyKWURbyLNcQ8Oh
	RexAbUlCFF774kwQjATg0aXt6/ftyCCwMkxySXaOw//d0AlGft6wMuXsVolWhdTF
	VngVhthHCAfM8OoNig2SeCcjqzxIQVZkPYRj0MFEBVK/ivL1GHgFIUwPehjGQKnU
	oe5X/djf3PL/3ln8LfpEuT/I7c72wtckco8NR4zJgt5hVMDdxB+PymsgJyMKnO3W
	CN7VDkqJSAclcw4WejqMzSYoXuAvIcDos79cSxTmen9gHCsiy8gJL/b1jb9WpRjk
	gug8jOV8Ec3sM7/2st9VYt2rJE7XSOTcac44hI/xgaqoLNUnQZxDo1r6CtlbVcEN
	pL/A0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb3rpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:44:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso358495a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899094; x=1774503894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=;
        b=i6JarO/NL2ANNLNaQ4XrfaCGLQl3H67QVz14kl2kFP2KE2Gpb9ordCZzfa5SYjo+Z8
         PB8O/5LQqyL1zb5uku1bTD6zSvLFz8MGbLEtANK8I897OoKfBg0Aur4pY3FCHHPi3RNj
         mlE4/j8m4TAm4Kpra+Q2hzohr2yhoZxIdfmwyPyJEJ8qdLfmlrD50WWTp55jnADvi6Q0
         iZw/zRUCVZiB29bGQdwSETX1U7wDEazp3I7cM9eoApBVTSWDRCziFdQmxMlw3HgUPDss
         ABj/45W5+N53XACYoO+T4eKIbrjS98+sumuHpmKnh0RkdEV6rPsDMnWTOMRYT6T69aCx
         yNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899094; x=1774503894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=;
        b=VLtRcEMG0vay5GqOgiEdd/8kdOvfdCgnr+N/YJA6ZzIDUQ6VsISOW90eBIv9lly3EP
         40kxVYqWfb2oab5tItDdlVwUKLfQvxFwrba9tGgNJDGsJhGEypkFxXfLm55t55VDa6NA
         XYUeBRUB7QjtQ2LAuOOIRZWy4IP7QDuL5dMciasQwoLFUUVJcJ4rjxJ0A1is0PW6aB2b
         OxJ84X3jZDrVj0XpI4KU1uiLUPatSYWIGA5FvK2PSqGOH9ot+bjWGMCCYW8wbXPBIRTy
         QoQU3Zy6FcmNuHnFFni7bSihW/z+oAWzfVwPnyzlsxcsGQt4xxrNtsyKNtpTnofBiOSy
         gcvA==
X-Forwarded-Encrypted: i=1; AJvYcCWcpbgvxwb4YeIsrhkLZKwOKviSbkeJ4Zxa3O376OCpSqzNC1yHoGY0a91FLPWDrogzmpD0YutiBc+ArjPO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aXio2cng1oMAOyCCJp+uy0aW4Oxd62JLwrBHszoTPKejRUXd
	OBhIU7DshtoyFbJFzHDVNPhDE00FQaoi+5R/OAOQ8lDvyjxtvpgCXdQ1fJP6Qdl3YI+TRxcQkKW
	Jtdj+29JfD8n5Nd1QGHenKUT+ib4YAskUNbwz1igbX/y3ZLsoE4NJqjOV954CBwFgEVsP
X-Gm-Gg: ATEYQzy7SiUOHEUoy9K3Oso6nY4Fqw84lZ/4cJM9ZK6X7UI08oXLQ7ghiIm5nVjswKl
	7OwMHh1rU1oNHMaU4/ECoBgFxnB8KdNaeEjgJS0AFgcW0XtKdyf4VW/4IFqzvSsFy05jbuSSzhG
	hGhpzlw/o76E6Ma43Usam+IiwzY6DEwDRItrBx2WzlY4Mk7zX19QIPbS9l7o11xzVY109iecv+3
	rbpiGFScCgmS1KDeSQdVQgXVdIRSA8OmSSEiw/QwweLJO0QgqM8N/3HX/3E/lkhYkKn1pnPD4j5
	c3Lzmy3H/8gnc0IuCCccTqyA9D7wgo16mjXh4fkILTi7mIbrZVOX/s87fNqGoYyIJa+4YKV5ui1
	HwnfBmlbS0mEME8QrQMQ5AoVSUxkETDjjeapHxGnFlUznnGJsCSEBD0TOeweCWRwuaZ/jFIN3xh
	KpCQVOR68bJrX0NRtx
X-Received: by 2002:a05:6a21:3d84:b0:39b:9aae:fa01 with SMTP id adf61e73a8af0-39b9aaf5283mr4413800637.60.1773899094388;
        Wed, 18 Mar 2026 22:44:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d84:b0:39b:9aae:fa01 with SMTP id adf61e73a8af0-39b9aaf5283mr4413769637.60.1773899093879;
        Wed, 18 Mar 2026 22:44:53 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e543d25sm4068895a12.20.2026.03.18.22.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:44:53 -0700 (PDT)
Message-ID: <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:44:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -1aaqybZGB19B8_2-jCcKmP5FNU-_K80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0MiBTYWx0ZWRfX2QlUNqYjNGF/
 7GW5f1AHCE+ddQdDBv2Cqt5ZFz0YEKoVqYmQBAEDPCA5P6wanSsu5ORiJVfmnECtdSGCHzEZX/F
 oH228VyeNKH4mRdePlJ20FV26WKxqZ90d845g5VQ50GsUL8hKt8KjOzzZkFn36cMsqcCYq8BSDP
 a0y+CbRx0jCwH4vEsn6yhsWDgTAMLO/YBOyU40DdLCRTfoJ46WKtGj9d0/7Mz5xmIIDwIQGg/aV
 2MdSeKC24E1fx42/lSoTd7C6CRcTxCHNnd5b+O/DfxhyarWDbLSAT3F2hGTMaxnSpFKEb75A3zF
 6yVX1fGkVsDokj9Hsqe7gyyadnLd4+zxMAJIbmpF0vFetN2CbdWAFBOpRfevTuZCaYsjyV4DT2t
 WepNsEh7C6aI1vWG5YYdx6POIJUGnWrK+vtf2vAXznk6KbxKKl4OWt+imuCOOdND3XwS67rVXbY
 TbDfLqZkYtyX0bSMahQ==
X-Proofpoint-GUID: -1aaqybZGB19B8_2-jCcKmP5FNU-_K80
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bb8d57 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rNVI97BeOdma3RHj8UYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98625-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8C262C64E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
>>
>>
>> On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>>>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>>>
>>>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>>>> config structure and only set when registration succeeds. This looks to me
>>>>>> like papering over the real issue and I think it's still racy as there's no
>>>>>> true synchronization.
>>>>>>
>>>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>>>
>>>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>>>> any other work items that can be scheduled).
>>>>>
>>>>
>>>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>>>> but releases it right before calling inspecting rproc->recovery_disabled and
>>>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>>>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>>>> call.
>>>
>>> Yes. Nevertheless the driver should cancel the work too.
>>>
>>
>> Hi Dmitry & Bartosz,
>>
>> rproc_crash_handler_work() may call rproc_trigger_recovery() and
>> rproc_add() may call rproc_boot(), both the function have already
>> hold the lock. And the lock cannot protect resources like glink_subdev
>> in the patch.
>>
>> And there is a possible case for cancel_work, rproc_add tear down call
>> cancel work and wait for the work finished, the reboot run successfully,
>> and the tear down continued and the resources all released, including sysfs
>> and glink_subdev.
>>
>> Indeed recovery_disabled is kind of hacky.
>> The root cause for this issue is that for remoteproc with RPROC_OFFLINE
>> state, the rproc_start will be called asynchronously, but for the remoteproc
>> with RPROC_DETACHED, the attach function is called directly, the failure
>> in this path will cause the rproc_add() fail and the resource release.
>> I think the current patch can be dropped, we are thinking about make rproc_attach
>> called asynchronously to avoid this race.
> 
> Isn't this patch necessary for SoCCP bringup? If not, why did you
> include it into the series?
> 
yes, will squash to soccp patch in next versoin.

Thanks,
Jingyi


