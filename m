Return-Path: <linux-arm-msm+bounces-93737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAeeAm1/nGm6IQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:25:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A094F179AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C70430168A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB53D30F52C;
	Mon, 23 Feb 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IraS8mIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buewaMZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46330E0FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863914; cv=none; b=Bgffn61HETxA2oKNVpCjYzw5uSJJjBw7x4zJSSxeN45MPF/n6sEfwI2OzYFPc7qRpESP0hoFKvjtHd0I4dhpbO7+TjJfTVPLLaoxLjfmm9GelU1pWcxeTFOQ+dpyEMAn2EE09u3S1i3YPPNjzK+2HV/HXcgZpNjCIEz8q3GLNzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863914; c=relaxed/simple;
	bh=GNQnTqvMrNbcJwLNm0gQIxbBvfpU+ljSsQI/UkizJ5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPHrib4VTPMBa8cD6YG1mOJUs3hFsJnDukTIdA56wmqp5LJpyKxEx55F3Y8CwWswFMbTIF7L4hdtTJKy5SYS/AA8aRhWCs3JkIj+2kzJjK71PnhCWqAfZ7vC9SjIrAbAfrr6/ljksADx2ct5glJlOaejrFQIqek6DAi4HGjsPJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IraS8mIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buewaMZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFSE93936387
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=; b=IraS8mIntf+gMSGs
	dq98enbYj57qNyOa8qFH5TqTItMONDWgapRKkVNfmGbnjZBkwfPrP9q5cUBIU+q3
	LdKFs02ZE0/sY+MkfmxDmS4C718Q2z13t9N21dVIfLL1zlabhV5Hnhv2R2zaXoeU
	2m1I6mP5zfoHz4wONN5rNa4nM+KlhYmLIgeiz6T3w89pXV5viXRVAKJctnevABxM
	KLppNnaoKtzmJw5O/V2y06gjYINKUaX99ohewnQ7OMeDQNSPDt9mwnQbcc1KTKn0
	9jfTFtL6IZvg0DwHqfMHHlSD/DOtktWTExH3rds36yS5735XjAVqJ9F7SYLmgjqB
	PrBuow==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mg11j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:25:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12737f276a2so7441793c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771863911; x=1772468711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=;
        b=buewaMZKGKOMT4enPysi27arYEul+27nZI8Mh75U/rdHscyCOgB6fvJfZOFYUjKel1
         tdeZIke7Ov3Q1eMSVq2eR6owSfKlMTScDvc+E4Op5upSTXw8faQW+m6MQ7rUL/JsvT+/
         /khzNas2U8EDbm/0vcKVT+YO8C1/Z8pshWvFolcnkvX73Q5HeBtlkc0bRn638p12lSP0
         Hv999LiTrQD1uOJPrJ8vlZiSsemTY4fKMCqjvu/K1bW5I9J/AfAiFKutbEGaGzNuZOsE
         vQ5vNcsqMvTZgFwD3pB6Jr+2NAmGPTpZOolf8u36K1fw0gurJO0cXpjpUutS2vEPJgb7
         dfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863911; x=1772468711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=;
        b=wJcG0LFCk0PbbhLUU6fT+xbt+uop3jb0Lt7UMXN0q/cSHECFMBM33XYCqy0CX17ljJ
         /HM0igs4Gz0dEmZY5JvP7rIJXHsgxvKgvBnZfI543w0hD4wiStDqUNDW9ANfiw3G5daQ
         WxYa2WbUN559mIf2v685rQqj2xQgCLUwqHsEGj3idIPEB3msOAJw9/GdJ1/sgvGY34nu
         ZWRccSbesM9awM4uscxMkcTbFdlPWwSdXDBgKon9mJds65ZiGtjZpHM7GsaMK2R2Zy7Q
         MJ50qP+XpyWw9tIet0mzPKzvEY3Rc9vZlHxfOpfrN//po1cpy+38NB6UwmgWJChsemby
         EoLA==
X-Gm-Message-State: AOJu0YziBZF0GvTK4+LhJsxB9S1zB1bk440m1/RXu5M4FMDiJwcAvTZG
	j9OI5smzzdPAELaMHi1UoKKRcvkg9ZjUSCXQ/6PVNptmrpvZPzJkx2HWrDvWWg8AiHZZwaKvFgX
	E6Oj99UlVv0UCa847/przRFOYt7jHsLZRNy05yIMYfn2T5jmW16wZiSZjri7baYRyTMvMoJabxb
	ii
X-Gm-Gg: AZuq6aIkrZ0Bh2uVnaSoe1FLZpzwf9qeed7Fp16llT29yuqseeHT3wBw8l+v/9CMsA9
	b+EqcQ/J3b0tF5jO9JXTGgeUCAclH9+vD9n4ayCigGiRkiXLOgEavtOR1rLAk+HQX47XUwGp04H
	7OIgFZM79oxqfjEW/M25plP9C7aBTtSl+SFDvNEx9Ba9vrHHLsUTiWpKr/17a169Fmyd8sK3mk3
	TkbV2LZLBTWoHiKGqYJSYM9dgx78hu+obA0gHRH/y3qD0TF8Z/63HVC/s/LJ6+/NgrIZClg+CBE
	/BgGwJEXGorrLh920gobJyt3KpQmgmchKmD6az8eAw3EmVExPSQ67OP16fPpLZXOzR4aca1wFrC
	2CbJf+1Eo3ALZSrMVo7S752/X/SxjnRAUGsJUKGpr8tSEIrAN8TT2/O1pyvAozWS2mkDiQTjI5q
	c=
X-Received: by 2002:a05:7022:6b94:b0:122:a2:ffcd with SMTP id a92af1059eb24-1276ad622d5mr2369796c88.23.1771863911418;
        Mon, 23 Feb 2026 08:25:11 -0800 (PST)
X-Received: by 2002:a05:7022:6b94:b0:122:a2:ffcd with SMTP id a92af1059eb24-1276ad622d5mr2369787c88.23.1771863910794;
        Mon, 23 Feb 2026 08:25:10 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm8614239c88.8.2026.02.23.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 08:25:10 -0800 (PST)
Message-ID: <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:25:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
To: Shawn Lin <shawn.lin@rock-chips.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
 <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c7f68 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rUhstlRxwOIcCgk686EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: uYxBdu-a4sL2mbehrwe1FcVXf2WkVCiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0MSBTYWx0ZWRfX94q0gttFjgTN
 mlZ6sJmeIBJjV9CCbNduzgGfo/Hupex7cNRP9QIcyKuYUTgJ+16mnopuP970ytY9R3UZ+Nd4UJI
 6wNFnM+tPfFZgze9wbRZzyYY7O4gbzYm85BmmbDtbMsoQh1YYdjjC9ZrTP+WwLNTqnQxTzg/v0U
 +8BeCOVmIpXrAw+UoBj9RqSW+5Qx6qZ6AG6scaLKxo3wPeepS1xrZY4xHGGujhbrxTzfFPfawp8
 1cGjwtItCgwvVmjNmuHWxD5WaifY4K0crwqW6eJopXgtdth7Q2/hgkAs/+QlSNy5g1WocS436B4
 3j/9n5KYd0i8jNU8SWAWABRC7ki3mJRHMCNdtZp1qT9xMFUFeC0Rz9yWdNqEFtzrY2UvMgJMSvB
 9HfIQF7+vZNNrmmtkprumwUacKFGtteBuQi0t9xyDM7AhYBeZUmkju3Cfiugv9tOZ2ZbHTEUARn
 Zv3Hi37PFvy3YXkeUWQ==
X-Proofpoint-GUID: uYxBdu-a4sL2mbehrwe1FcVXf2WkVCiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93737-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A094F179AF9
X-Rspamd-Action: no action

On 2/23/2026 9:15 AM, Shawn Lin wrote:
> Hi Jeff
> 
> 在 2026/02/24 星期二 0:01, Jeff Hugo 写道:
>> On 2/23/2026 8:55 AM, Shawn Lin wrote:
>>> pcim_enable_device() no longer automatically manages IRQ vectors via 
>>> devres.
>>> Drivers must now manually call pci_free_irq_vectors() for cleanup. 
>>> Alternatively,
>>> pcim_alloc_irq_vectors() should be used.
>>
>> This seems to break bisect.  Surely you should update drivers before 
>> you go changing behavior.
> 
> Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
> users to it. Then the final patch(37) remove the implict IRQ vector
> management in pci_alloc_irq_vectors(). So the individual patch for each
> driver should be safe IMO. And if these patches go via a single
> tree with acks, it seems unlikely to break bisect.

There is a conflict here between the patch description and what you have 
just described. It seems like the patch description is wrong.

The patch says that pcim_enable_device() has already changed behavior, 
and now drivers are broken and must update.

It seems that the description should be updated.

-Jeff

