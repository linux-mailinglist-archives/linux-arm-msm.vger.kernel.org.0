Return-Path: <linux-arm-msm+bounces-105974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK0xOQv1+WksFgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:47:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B04CEC42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921453023DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717E347DFB8;
	Tue,  5 May 2026 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+21tP3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gh3/rHO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7247ECD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988849; cv=none; b=B3T67Cxys1b91cd1fAK+Na9n4G1Lnra9V0RML4bUUJ7Z5h3v+2IymxlQJE7dlzXWkLSDYQ4+doq+kmIaWUQscK0gdQpQ2qBBoDDg2nbarySGJBD1acUxS+NyGifm6bdxbPw2pYEdVRAuMiRWIPhYaBYL9K0PxskB+PJc7vczaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988849; c=relaxed/simple;
	bh=X0lJ93HuV+UQAuwXDcwrBvXaZUotHEOYc3plzcPp+u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8RNCIQipyoeFHrg2VxpZjpvIvqWBw7kkPVBf3qElxEiqZ2umFl6oui7BLw/wjPHrEnLGDwNaXItSDZLwKeTCHQ5vQ+qWUeqRzl7XZxeNV2bT6Low0FiRcLnvXsyUNLfgm2m9vglXwcdmToqx2QRaKu6yyNRvPDwd4mgCUWEzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+21tP3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gh3/rHO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645D0sfY331109
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=; b=d+21tP3wBchLVwVP
	/FbQD14AwZdOxm2vroESniRXZHTZ3948vZ0VRZwGTDQuEDuWlrSqB7XvaEbcF8B8
	e8tW4RHT5csriqWL2lhWDr83ps1uyjvdlOJy7d3JZK8YZ0wiCARAYTLr5ZftSGF0
	6y9qtjbSx9p6pcmHAK3ejCV6kt/djny8rTQCdoYSh/4IBvrpzpYJAtvw0zfoWO3U
	8zcAReSSM5F37RgovsPDzNSAo1JVEPuxhhVzg8SiolqUV7ioRu8GZsD9zD8GWgrf
	Y1fL5JMAzXEHLqyxQPdExzoiUmjCuxxgmeesLHBVu51I1/rBEoamfu7JVbb0rqAX
	9pBM/w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1cr2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:47:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb22422efso1493765a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777988846; x=1778593646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=;
        b=Gh3/rHO8xtkdO6M/JPOYvYfQ+7JmQ6cPhB1XjJCyU2zcinMqh5lGxMJ6jPKJDgBnbe
         WUl3bztX6m0vt8lMzfKViE5mdRuh6lqan/eYY70UirMAp9997DejTuP6O5ieHNzO1j4B
         3q4uyc0epcnJ4/0cmB1oW8R+CiA27w4OSDiAT/34ZtNrHC/DtbQqJlYJnNUAIK6SJgvX
         brJk5EFRCaKIzUy6XKgexIfnK4QwOMDdtgBCwF+I9G63p5rNBRtWuXYJ6yQ11Ftr9voq
         ExeCjn2g5iZjtGo+Am2Becyor9KtcOpt0Ubmx31LjvGfCNOCu2auv4IpLb2j6r4FiUyS
         QoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777988846; x=1778593646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=;
        b=NTKuC65MM73VN07MQ9m1srK3DxTiyzdIf0etftAW4t+IEVWCYYCNnAl42w7IUl6a4P
         d8Re0lpwdGybVVDuwvjd7jiQ7HXhb5aPertGlIzo8r5LOhZtWyjkbULVpgIrgePEwILo
         iFJDXzRT6hIfNWbP4m8t7xGOfGgnvdkZ+c+R60EOU3K9rsVU1g5b9V123O2mSlEf45DN
         MklQ4tQ/QufA0hojPZniiozyUrKosE4FUqL9Z/YqgTO5dEI9Y7+OZ5iUW+tSULgXCqDs
         OaXwW0bboP/5ijYhFml4EOlQYpWP/uLu56mjAOohulm0hUon3C/b/kYvuxNw/ilHlISG
         dDFw==
X-Forwarded-Encrypted: i=1; AFNElJ/8g9vgqZJ8o7K4+WwBF6wbKetThzD6D42T9v6JxU+mc7RtXNjifcl6q9gP9d/ai9vasrh4s75XmHkWpfvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxZSyqeg3fbLp6BKP9XCgXGR7TLP6eCQWW5wbIVAQJk3cIbWT
	QvptAo5okVMlihcxfoh0gKqggLZ+X3wFHu8+uvmt8E+QB4HGkw4S3SjfUyJ0tY930y+HZJ1YvQ1
	6fB2hnWY1RXI5r6K6S/3auNUXfnXXAUhnp4Mk3M6imN0eGFaT9MomhuAKYhGIBvEGBsy7bQHm4d
	lb
X-Gm-Gg: AeBDiesJPn9r98CzOx7LpKqDAMnvY6xoYqjwsYSSdcnlIMTfDkc1BKYKyTkbpFl9spY
	mxAHaZe21y/SyAR16o3zEaRjtbp7HGHrohCjXaB5CgIye/uxpRCEn0FWuTIiYQy3mTw3B4Rg8Ui
	5NBflKpkROmYpvlpZH6cdowhX1FyVSEOnIjnEcRHze7aVCRuzxZ7+ORQwH2UwhqsRWNxOkyeF9E
	ObwArQBU1AOXKMC9KVQ2cLwr9u12sz8B2sbuuWaG6m82+YssT3ZTWoQBjsgb32N+VUHPfjp7tSw
	eqUfbPbLk1vIIOX2PCRwziRaM/QJtaIajaXUqdQ68IvKHLojLkHuGaosMW5PjtVyk+Q9FQ+wT7g
	jf8jyA32dUHMphI72o8obkKFf5GUD8gsDN+1VSjETFvrkkCoYLiF1K3m0BNYH
X-Received: by 2002:a17:90b:3d12:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-3650cb63481mr7629127a91.0.1777988845035;
        Tue, 05 May 2026 06:47:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3d12:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-3650cb63481mr7629063a91.0.1777988843143;
        Tue, 05 May 2026 06:47:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.27.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8024ffdef6sm7653976a12.29.2026.05.05.06.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:47:22 -0700 (PDT)
Message-ID: <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:17:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ZwzabK7374G0EPSAYPpQpQhHqTP_QvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMSBTYWx0ZWRfXxAbPo8m3O73I
 7ysXdm+cArTY6Ddk65S/LS4Kvkw961xTvS5FkypR89AHezAXvrahyetSyBBSUtlM6gB/qnSliYC
 ygD8+E69kJmzXaT/RtpLB3oA6K7FUMtv+yQrMLkJBUzfqZusDo5NaNExVWhI0Er5Lp7JwRrVG1e
 4msdA6O6DsrBjda6ULfx8ar1d9hA3edZBZWEX19kPQJMaAmSATN9u/94y+QaPr36AxJ5Svhu95K
 RIdWAfQnVKpM4iZY6MOd06Q5sl+WeXx9kDUBUryMKobINihsGwY4k1m/cjTsbXBO5kLUmd6k07C
 XkLVezZ9iYQB9vloTTwvPXWFs4DSaIugLFrGdPNRo1YSsI/NNVzEs748YB7XH6Dyb/7dI7+Vhyq
 3aI4dPtV94+CMbFD/6cHTh4L8ASXcI9nBIIETEBve5kCWmsUUaLsiDvpYOYaHgo2j7NqfoeVLJg
 QCP9XsC/dP4HAWGVDbw==
X-Proofpoint-GUID: 4ZwzabK7374G0EPSAYPpQpQhHqTP_QvA
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9f4ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9uzW0PS53YT52NB8YZ7Mfg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7OoR382vXO5eJJLDGIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050131
X-Rspamd-Queue-Id: 492B04CEC42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105974-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Dmitry,

On 5/5/2026 4:58 AM, Dmitry Baryshkov wrote:
> On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>>
>> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>> its hardware description with the existing monaco-evk board.
>>>
>>> No, this is not a good reason. Is there a common PCB? There was a long
>>> discussion for it for the Hamoa / Purwa EVK.
>>
>> PCB is not common for these 2 boards.
>>
>> Also, not sure if I mis-understood you - You had mentioned to have a
>> common file for both the variants [1] in the earlier version of patch
>> hence refactored it this way.
> 
> There was an explicit question if PCB is the same as a prerequisite for
> the unification of DTS


Thanks for the clarification.

This was discussed in the earlier v2 [1] — even though the PCB is not
common, the majority of the hardware blocks and their wiring are
functionally identical between monaco-evk and monaco-ac-evk, with only
difference in H/W being 4 PMIC in monaco-evk v/s 2 PMIC on monaco-ac-evk
and the rail which is supplied to the SDHC controller.

The intent here is to avoid duplication across the two boards rather
than imply a shared PCB, similar to what was discussed earlier.

If this approach is still not acceptable without a common PCB, can I
drop the refactoring and keep the DTS files fully separate ?

[1]
https://lore.kernel.org/all/8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com/

> 
>>
>> [1]
>> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
>>
>>>
>>>>
>>>> In preparation for adding this variant, extract the common hardware
>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>> include file, and update monaco-evk.dts to include it and keep only
>>>> board-specific overrides.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>
>>
>> Thanks,
>> Umang
>>
> 

Thanks,
Umang



