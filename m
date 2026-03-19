Return-Path: <linux-arm-msm+bounces-98615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI+iGVJ9u2k2kwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:36:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B92C5E90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75C45302C314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7B8372B5F;
	Thu, 19 Mar 2026 04:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKgxTF7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoWbZpQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB663351C1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894987; cv=none; b=rckzYLt3NC9tWTmluCDQxGTLJsTMRuBKHFITYxMO+PHTKP6JLMRNU6niRRMH+hYHhK2n8eL1P0Iv39hTbeCpnfTRLBPg2x+tTKpqTu6+YywPpcZCCv3o/4V8BxsdCBUgPV09GM0/bGrAFc+y35JCn+N/kAqajUoKem3q7cfFkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894987; c=relaxed/simple;
	bh=3cvQrCwXJOWrGoiE6LKWnIc8rg0AExKcczPTqdkd/dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZqnvYyXUq3epjCC6J8GpOebvm3G5qW87BG7+wP5Zo/In5Jvyoexlc/s3lCDAILqxLTlqkaiMytjhIHBi6UVLVmMG+oLFvlsLk6oTbSkYdrJ6C4mk6/YZ3Ru1vdBSBXSMn6xZ/S071WT5k6mgcMfOfmiW5ser8vvu18RrVMInds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKgxTF7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoWbZpQ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3qN001622715
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=; b=IKgxTF7FZyYI6X7u
	rMqD494aRMfmPb8juLUL0weIKMuKQ0M/QU0ROso37FwrheQCvq6FuJfk4VtbITlC
	OZoZSr161VuU+5tgs+IAq8X0ytshMKARj7mcUSWJrO0qYMdfQODdg5pRQ3GmKFjZ
	+Ecsrc2/lIYD6hZ6A2ylBEFhzs2EauwZb/E24FRYl2/J/obemAOWPG9lMhZ/pzBc
	U++Hk3gwqJgoFDoInwi7/2DmTLocDlXu2t6YKU5CsZn5D0FWraDrCNPAZKeQd9QQ
	l7sMWWVSmADYoeFF21SuGVzE/7X7r1N0oqX807SDWmpp48In34R7VOSSOxc/ikj6
	1HtL7A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9hr3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:36:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c737b6686ddso388233a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773894984; x=1774499784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=;
        b=WoWbZpQ+JmHud9ZiGoQv5liHV2ka0ZWua0avUO0x8eUDkhYjzFwdie8zeC96lhCWyc
         PGwaMDQNxHXdmXhFD3HltazI77k5JqBTBqlMeihs4ndDsR14eSZt+of1UjuyT5udH0/8
         MCMXFcG8SMg27lepLU+eqjLTC3oVvQHZLDIB65t40AYmEegwSBjTNIXmm/v+694dZ6DQ
         o7hk9yDCbuAhWBEZeqrxumWOmHjly10TZb4Gyc5zHsjspCgKrzlu0PnoupSMhREk86JA
         Bv5xn6VNYFVqhT0G98fPUKkms4tNVVndtv+KMSJ7kysyv77i6pqfMvhb4nV3vVBWqidL
         FwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773894984; x=1774499784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=;
        b=gRfe+IRyNh3qXsDBhJO9lWiWdTC/CxVJK2XeGPPPUiYdKQtNFRjzimCwTGnzaAuHFp
         qGr4h264pWQ0irTpkErzsUtJ2/E4XZYU+DAXhOIPE3g/nljPql0EYt88usyZ3rl4BOxV
         fi6YEQI1XxqSTc5Vdy9MNQPJDMcAeMiDAjgGNq5jJti5UJ0zHx6Epl7ZgUQNj0v7L8TD
         gwOOx1xieuNZQvTHrOUeolO/lpAImYQmAN1r0NZcS9tOVL5OHxN8kb6MCo83DUEfGJR7
         nmwNBK7+AI/NC0NWLd38mId7XSccL8EX84uJWl+mbOVt4ffT4IxRb1O4v4WhALRlvsrq
         KE0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjmP5LGrpW0CrkPTQI6jozFa1AgyTrK2Koc8cwA1yzDjBjL5WvxNWD0JeKfiHBUGSdRR4cNC0mt3ZUi8gY@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeKlI4RrQ7Qp79NS1Nx0wQWuzl5CO3i+OPrWJZJ/lLj2wwII9
	4bDjpN6qddVBN3tBVP1ASwqfWW0j1Leie4QHfHCgAfGcLVzEWjgR4xjJ+s6KqMEeh9QsyNR7nUS
	BeZgx/nI6vEc+AbjOvT7vlo0+VSCFj7dyxzlh4AjPIfic1OhJ9JAmaepDacScHU1+nmeN
X-Gm-Gg: ATEYQzwpbMvZKSZf+7SFfy20j/e0/RbQKVvPMAR174u6M35UiEwIhfFXfsIcDlxw4WN
	aZdq5xstm0RQYcWFy9yKfITHGsGlzAuWbLjs4oN4f+dEmS3ACTQ5lHOA0xLEhAAS8BbPrAARhOS
	lxK0AGQmkDXxqAZz3ytByXupK5Nx/RVt3lGop7WbSGklXOF884GF6yi5CpO/82gGU7/VnMtrXYz
	IUMeXO7/uUfhUXjFrzWUWi0b9IMugQuGPyYVn+9o3KWwXqW7h3OWXS2niMkBm0/vf/516YPiwMH
	eyf28oxcRazsIPSECCFpEaJg4YJaFwaFVQcu4I3f034tszeLlTdUWdEhOwD0EeadfB4LuOCGgU0
	EWZzUXd0dCqocfm5MdaVG97S32czgbuvsT3Rz++Ny+dgFLRti+9dKbtqWpXHcjvuGIXjahiAbmA
	MMQEaIbZ6+49XuvWSS
X-Received: by 2002:a17:902:d54b:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b06e34e487mr59339955ad.20.1773894983821;
        Wed, 18 Mar 2026 21:36:23 -0700 (PDT)
X-Received: by 2002:a17:902:d54b:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b06e34e487mr59339645ad.20.1773894983347;
        Wed, 18 Mar 2026 21:36:23 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199d4sm46413095ad.9.2026.03.18.21.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:36:22 -0700 (PDT)
Message-ID: <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:36:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX2cpSZIW7gE5L
 OTJcTN9ppGySw68Hv6fd8OpwbPjW3tOw5ivyqI+65Nrwh0Owu8YukltSa4HHFofPtfazJuYOUt2
 BbZPtTsG97Enrf5+Xa/4zS9agbZLu3T4Was5ZJ0yGHzrd65E2xN1pZLBSdlPXjJ4IYJjF/WdUrp
 j6YlIXZOTm00R5Y1GjJi6no8FmosPlK+hhNiZGrHWXcn6k5yl0FLBvcmNFNx78PfqYQDAJw0M2Z
 47je/NDo4rf2H/tUzKSFkYUcnoqiJ/w9x9gmSttNNY4phv9tFh7QOqpyid2XylKvSt52rK5dVJG
 y/W0vO+EOExowcu2u+mUgrtZ0uC4Fb1WuNDWNMAtoqKVtHNYmSv+sIsLSwES3b1bVxwsHwNVv1E
 9SnebF1IzJIpmiE+LUO5j5XqIU4J8ZWHk3/Ur1vYssD1b2XCgISRNXNnFjca6aEhJAY/MxljWyy
 TVtbs5u5KiSPrHXSWfQ==
X-Proofpoint-GUID: 60KOAP0G36sWWYNmmKyhDV4Wm8hiavBj
X-Proofpoint-ORIG-GUID: 60KOAP0G36sWWYNmmKyhDV4Wm8hiavBj
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb7d48 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UbLAXycr_9YQHWOW9u0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98615-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB7B92C5E90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>
>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>> config structure and only set when registration succeeds. This looks to me
>>>> like papering over the real issue and I think it's still racy as there's no
>>>> true synchronization.
>>>>
>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>
>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>> any other work items that can be scheduled).
>>>
>>
>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>> but releases it right before calling inspecting rproc->recovery_disabled and
>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>> call.
> 
> Yes. Nevertheless the driver should cancel the work too.
> 

Hi Dmitry & Bartosz,

rproc_crash_handler_work() may call rproc_trigger_recovery() and
rproc_add() may call rproc_boot(), both the function have already
hold the lock. And the lock cannot protect resources like glink_subdev
in the patch.

And there is a possible case for cancel_work, rproc_add tear down call
cancel work and wait for the work finished, the reboot run successfully,
and the tear down continued and the resources all released, including sysfs
and glink_subdev.

Indeed recovery_disabled is kind of hacky.
The root cause for this issue is that for remoteproc with RPROC_OFFLINE
state, the rproc_start will be called asynchronously, but for the remoteproc
with RPROC_DETACHED, the attach function is called directly, the failure
in this path will cause the rproc_add() fail and the resource release.
I think the current patch can be dropped, we are thinking about make rproc_attach
called asynchronously to avoid this race.

Thanks,
Jingyi






