Return-Path: <linux-arm-msm+bounces-91880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOONCkRehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:09:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180AF0529
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0883730498CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE3139901C;
	Thu,  5 Feb 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYzPURQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koDBWlj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CD399013
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282284; cv=none; b=bCHkU6OLFKUrB5SDheRuBsF4j1qcRi0dQRZis/KlsVv1r2OBClABoBVk9ZnPkfWqpoTPiSvZNGRRdD9GvAP/t/mxh8ekMC9/DdJWp+86EmJOfcH04cnqypolC4W+YxAGg2bJqhtOCLoIW+G2rokKjJuyoUWKhvvUNwZP7a8wTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282284; c=relaxed/simple;
	bh=Krv9fO3Rxovb62iG+JbCuDQ52AHKuJ4On8QLflhEybM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=b2+z6S7suyiwdleZzQ5fUQXdaBR05M49NnDqiZSe81LBDCOhEdeU6bKbrnErVe/x4yQ7GG25dG+cEZk8g4v+KHrAZb6VJNrOKz1TpYzoIT+1hirrvOOR7fgY2jqg+53kffbO5245y3Eaon08eejU9dSYK1/BUvpLwYAJUEysGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYzPURQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koDBWlj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dlGD3397124
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=; b=aYzPURQU3nY/tKTC
	tJDlUa7yIyknTjAi+coZKgJ3rSfqCJKG4Ks7vlW4W5f9eYhoywHJyRTLCcVWSpuj
	1r1lwiYUuq+kkqYqJGTB6XoR3H+wyn2W8XZkrVPXnLOOkKP/MQX4GKXRIXVQ2fa1
	yhDtdPeKS11Lbts2oerydXWlP5ABSemXix1dVhXykovgJBxcDSNqbrV3Qd+5Cb16
	MGaVcfVyxSK2GMboeai3L851AW8C2pYZAv/Fxbw/Gs/TdwwoCXNvmi2j3sHcABBb
	oigkC9V+y55u3kxlBr9Lq0ItzcoNaRBm8aHj0p9I+NeJwncdvyv90vOcUa1IAVHU
	1X/EHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh3vuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:04:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6133262e4eso527398a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282281; x=1770887081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=;
        b=koDBWlj9JArCOBmR3vgsNprEVg9Izo/lUnNfOIXbYp7z5tPuYIBY12lROF1AhRpeoT
         PL6fR6XChoL75LBBWG+l+RQ1Neqxto+im2POhurjeDAlnsdsvAyS9kYoGhyNjpuRvF0d
         pfv4nzqm4/CMCJOs0JvgWc7uMRGaM66kjV7SmPrV5V0jmUSEC1uvOgrIRa4QzuJg/4nv
         bXJqNfUj+zXCWi7Ln7l8tXaTKysBKMBYAyR5DKiZABKoV+VlCQwtYk1A6CPF40/f4c6r
         xrl+l4vqEKKbOQjpYpsP3PT+4uFEpg2pqe+2sO+qNU9rYx5pC0P5J5lvRBkOrDD5d7e1
         dSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282281; x=1770887081;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=;
        b=TvHYti1di5J2+OxEE8hEgsYUev94Wgc1Z2MBG3MNNIdcCdawZ2PUeSjh8hfhv2Zlrv
         6otwoXsGV+zIlRB6S9RMwuDmw/q5YtShHfnn5JiT5L4cNgCVbrVZiQf5MqMg341NrUoU
         +AVPr0KLtYkuNzgeqQvvjv8l/irLshgW9ctZNu9X7EG9VovGPff3xyDOkVCuAEjGuCTB
         oNwdYjbTr1xs7jVSn3FyhS0oFDv2PpDldaVKAsepyMkmVYad5kMMG568OCvES334hfKf
         GKtBmV5wx7OeRUQFp3cejRjeCAZv9ywVA+xDurK9dleffjY6p2Ke4w55nheymz/YyVEo
         l4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfvc0pVuU7/KccpLj2rd1/OlSAA3mRDUpY8GknXyY6lBPxDecojX8bOAhqBGACkqwp7klH3iXt+AEIm5GI@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKrjUSvkhtQDUcR5vqXVe2Ome6duRgCLrg4SNlr8/fed0GFqp
	pDeBRqddYQS41ki8QD0/KJ1/5U3bhUNa0nhFZ6Y2OayX3ElgDvwoZNkAuWO5fLdjnPlQmK/tO0/
	Ofiq4M1e17F9fKLixre3lioyK8/Ni0odKimhr3jdLdXAL6QzuHOvDNy/SOMSnD9/W6HoE
X-Gm-Gg: AZuq6aJXQui95lMqt7eZAnMCWxjBTT6wpUcc484AZMZKtiqkzhzVKr5tPcvWkyScz3X
	QqxlSd79iFh0J4FooO2G81O2VGLwGaJnhAdLDmr1jfB3/ehVo2R+jdidTeuRj6Ae0j+IjO2htmh
	FVtvFGnjlLpDV+kFwx0kLY+Hp5yYROGnkxLjzRFoBjgFZpXTq2m0DkbYdmnCytueiotVbadLTwo
	2zjwquwIigApl1+3WoPxbikyFvGCLYJrgEPwZPX5e2Axx1KN0sPdYfwNa4n0ADYOaJKZvNifAAT
	8JH9KJQfSPF/53WySL9nAkuBwF06zOYPySlRDiTiEfT+XtJhmw862KTYQ34WfktYFRBgZ64WhaZ
	TwjkhqhuoAHL9EChykHdx007QIesH0q3LestQJRmKp8GgES7wZKHHlzIp/nAxdkVJDm+bVkNiQO
	aSUkp3
X-Received: by 2002:a05:6a21:6e48:b0:343:af1:9a57 with SMTP id adf61e73a8af0-39372486619mr5352458637.56.1770282281455;
        Thu, 05 Feb 2026 01:04:41 -0800 (PST)
X-Received: by 2002:a05:6a21:6e48:b0:343:af1:9a57 with SMTP id adf61e73a8af0-39372486619mr5352428637.56.1770282280933;
        Thu, 05 Feb 2026 01:04:40 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f36sm46175105ad.10.2026.02.05.01.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:04:40 -0800 (PST)
Message-ID: <c0236922-2d30-4588-a799-0809d242ffc1@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:04:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Bjorn Andersson <andersson@kernel.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
 <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH
 <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=69845d2a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=RXZXvM6syZh7F40latoA:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8WsZxEZqJLnvVtYZQ2YUCIYsrUZLaCxA
X-Proofpoint-GUID: 8WsZxEZqJLnvVtYZQ2YUCIYsrUZLaCxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX4hA7/Hplfdkq
 NOwGzVHHncGCnW09k3veas8y0lQc9nFdd4uqsijbDYvSemNCFhQtevyCQUyy5JrP06f2Gj4gEr3
 uXx6hv8jI5Q9AYZmUbtlt9ZlC4P5ToZfcyG/u76wH1iTJKVrlQ4Lel3yVq8mXA1AHBrjRRI91ET
 9GXrUFxS9MIjHC0MeKYAU5uXukvjvtFnpqhigDi+XTjUYdPCcEsaVuh1fQiVrPRHc+ewSfARkpN
 UJZJnnmTOryAu4d7rDvzH667AfxGc6iqEPVo30s89J+H5R3Wrsve0e9rOVS+JU0soluwVFdjjIM
 K2mllgV/IhJYCY3pTPb9+qWDRcBnWqM6xJy2T0vI1sg06xsb7kmDT286kprDUfKu4QWlxem/nnq
 rxfdiockAB+IVXUrLYpNf/oHykXLyl5Ktf7WVFrMQjH2PYX1E+yyO30zyGE3m6NVD9nbYBJrAvw
 0gYPUXiANDnlvg/nuUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9180AF0529
X-Rspamd-Action: no action



On 2/4/2026 5:42 AM, Bjorn Andersson wrote:
> On Tue, Feb 03, 2026 at 11:19:39PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
>>>
>>>
>>> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>>>>> The entire reserved-memory region is now assigned to DSP VMIDs during
>>>>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>>>>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>>>>> heap lifecycle to the rpmsg channel.
>>>>
>>>>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>>    	args[1].length = inbuf.namelen;
>>>>>    	args[1].fd = -1;
>>>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>>>> +	if (!fl->cctx->audio_init_mem) {
>>>>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>>> +		pages[0].size = fl->cctx->remote_heap->size;
>>>>
>>>> Do we need a flag? Can't we assume that remote_heap is always to be
>>>> allocated to the PD?
>>> We do need the audio_init_mem flag.
>>> Once the PD starts and daemon takes the memory for the first time, PD will
>>> start using the memory,
>>> meanwhile, the daemon can be killed and restarted. In this case, the memory
>>> is still with the PD and the next
>>> daemon connection should not take any memory for the next request. This flag
>>> is maintained to ensure that.
>>> The memory needs to be resent only if Audio PD on DSP restarts(due to
>>> PD-restart or Subsystem-restart)
>>
>> This needs to be explained in the changelog.
>>
> 
> Not in the "changelog", in the commit message.
> 
> 
> @Jianping please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> Your commit messages should "Describe your problem". From this
> description it should be clear why the change is needed and why the
> change is done in the specific way.
> 
> Regards,
> Bjorn

Thanks Bjorn for the reminder, I will revise my commit message.

Thanks,
Jianping

> 
>>>
>>>>
>>>>> +		fl->cctx->audio_init_mem = true;
>>
>> What if there are two racing IOCTLs, trying to init AudioPD process?
>>
>>>>> +		inbuf.pageslen = 1;
>>>>> +	} else {
>>>>> +		pages[0].addr = 0;
>>>>> +		pages[0].size = 0;
>>>>> +	}
>>>>>    	args[2].ptr = (u64)(uintptr_t) pages;
>>>>>    	args[2].length = sizeof(*pages);
>>
>> -- 
>> With best wishes
>> Dmitry
>>


