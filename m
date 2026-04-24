Return-Path: <linux-arm-msm+bounces-104425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCm3HZlG62kmKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:31:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C645D16E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C8363003632
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68737377EDC;
	Fri, 24 Apr 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6JWbiHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dvd53uL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BFD36A03A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026691; cv=none; b=WZLHNYK1UJYEtBFeONLRy8D36dyQ8cqXDDOfrahw+aQQfuJncR6XEhyFLTSv6fXO0BqiZFJ9epkLMeKCAe03W01+j+8plt+hWXTtqQqOm44FNTNgOE3nd78c1F3mBmoQnSSjhxtoA9bjkgeslZas9wLuYQnlpOkte3xqtW/2jfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026691; c=relaxed/simple;
	bh=YMZ3usUZw9E0KGvmv+ttUT13W4jFnP9tOa+jYYoLrz4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k3H9JpXOcdBawg+SdULvcn3tMK0gGYiNb5fiAG8lLX9sE1tG3JUaEGE03CmOta2aZNRh/Gs+hSWDks3WGH5ETCEZWOiBMXtv7/SLur+aq0m+KH8R8QUxfaqUoC9vE9gR472smD1ZIruo9ig38ur9QH/l3sWTweixDgUIuvknOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6JWbiHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dvd53uL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z8lV4167699
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=; b=R6JWbiHr1Hws4KFD
	P9EShqlovtNlSf0AByxhdLPJUa4yZ+U1z93tuKKYXReXUOh1Ohhj0F+mt6flshwR
	/tF0rSAvddvM7tnnRNYDFv3A9iHf1kV53PboqvNmAtcE591LZnrza8MHeK7UtcNz
	7ZOsi/JRnOGYSR7FEDqRo30aq6g1dO6aqVzP4lJDQtaHtAmCoHR2NBnkWM9ZsnaH
	jp4+B05Y44J3DavygqvO8iGPet00xALCA+r31AZfZC8hIbuVWCLFIeWfApqtVG2/
	v9sxRb5TtsM4rnbuuWDe01yfk7PpNWDZWXSqhooweWZSAg3Fseq3PT6bCsIOiDrn
	5FvXyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0su2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5115117b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026687; x=1777631487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=Dvd53uL8vIjjDJVqNn1QJeIcgGW18h6rZG8Z/7GQQRVHa6Hx8J6AjeLSu1oVVyhjFh
         VlJWkF72YY4LW+81pDbSFZBlTqVxujrjlhR8kpeQTZcHLrNDBNvZEYi0tI0u4uP0cvF6
         wSEWG2HmrbwPBk1nf03dmFnJnggEHBew0MaGXLJB9hT4EQUZKjnbqpMNOdZoxivq3K/P
         b4gR9EcYE3YiyWL4MKLzaDrV0PqoqyCNuESOJWTuC+0Z3JYC+VfyBchIO8bf6S4DV2GO
         CnWYAG8+we7GjGbRHJPanj+yw+dTqJD2rN+ecFgKC2YAhVEgHyy2uKe57ymwzFCk8gfV
         WWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026687; x=1777631487;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=p+DcN3KG6Y4y6hMHpMO09Ge8DoTeXd3l4Yu87MbmEChn/nFJp2oxnVevlWLDRwSVqP
         htDVBUg9l2cukeyanO91qqvuAF8I/ujc97XUSrKU/8j7NCIKToYUhLoU4fsX2X4E68T1
         9XzhdKq1l8QKgKjks6AbZatsxrtpx35bND5s3UK0KlvEkrWYkgJR28++21VdQJkgdtzt
         Ei1PTk0ovttJ9i3y1P2sEa6C2vJXJmwdtT1vx65fXn4kL2fLOWCpY3Xi7tRVUjaAfwEk
         RVwPB4NNbrJJWBcm+SoelVc3/5tlrtuMvBwTaqPe6FMWPvzv5OISgfMxJUu7W2yzZ1yt
         5nmA==
X-Forwarded-Encrypted: i=1; AFNElJ8PS4NQwWFb3VdQW9m3EqwciwZiGrdv4z6GdZYriR9P0+MuarXVbrGJdxQGguzYmyxq7qLCcfXE0liKhSdL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Hu/QfxTJ9TqifPh48gsfNRZJJmxCsvGbOxUEzYhHoikFoN2K
	I85IUad4qeQtpacBnb0ce6M+sJVbttAJAYDJuIwN3x3jo+p8qooEIzFfhOE46jFuvz+hLTwfU5C
	poZeNgsK4rMZ8hZV9Uo/OeUv0brFP8DWgqs3MX+S1VwJZk+060cy1mqXXUD6M7eUlaFn6
X-Gm-Gg: AeBDiesMaSjNtrULRvPLJCTcPyb6UAcWjH9GfCsRF8OAl1h7/c7rdY1f1D2V9n9eMWH
	2k8MLrEB7MhxGoMRV2vDHWcD36tbC1hjCK3pi7HSnR2nYCq3auA0A5ZUODYjl+s8MeYjv72Bg5L
	ODpq5bwsXMkxbKLEjVVFIHFU6LOudZWMqMPw6tqfFSXfzbRlhgXZ/eIKKQ54O7r655Gcofwbt5+
	fzz6yBf3x2p4luom6wXdnEd3uvNjtS58BOUiwRArmVip3+lpIFbNYO6/OmD98Bt0VqZuqRdBg+E
	a1fx5zauUwpmK6Rhwahm39s4geNSlU5eY6PhbzROroGpSa3IfXzgPXSC0yy5L7lzJHlKC7kjdQ5
	qo9zN654oScxQGHOuq/mS0GxcakVUgx/oQ1yDYX6BQ6pxhd4gGIPrjK9F4lM0Si3O
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808608b3a.23.1777026687549;
        Fri, 24 Apr 2026 03:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808559b3a.23.1777026686919;
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm25153536b3a.14.2026.04.24.03.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Message-ID: <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
Content-Language: en-US
In-Reply-To: <2026042346-trustable-register-095a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NPUbrDd3LQE0VwD9B17ITlPNlofOAjCV
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb4680 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=5Qc4mBPHLNQQZN8o19QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: NPUbrDd3LQE0VwD9B17ITlPNlofOAjCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX6masqFh7O//I
 4S36dB9T/vBUeULYeiZc2LUerPirq3pcPUQ6smhXHSo9vFgMy9+601EG16WgbDepXHmbkX3jQ4n
 kJt2rIvHw5nUNogshbGAZSKDeEQ3qJt65E2XuSG1jjUWMvhWaTd/0vGMDADj0P9Uh0ebxIW1ntu
 /haCKKREfZ+Ri9I5nzJyqic1Q9ImgmCEo7UDnWRnKaTfgkUxX1NLueaOHV7GLARJ3756yQQbp67
 2WMsqFqM690XKlbCLfjNGPHnmWT2805lCpD91EbTnpwQe9lne57MxtRruTgDepjWOpkakBwEpJ0
 aMkP2fyMmsoloZb6r4KPIUH8+y9McmREHpaMZWHfEdxPWmNIrCEHtVFbC1hHxbegJi72tENpyse
 STYB6/UVxzX5uuaRd7jXSVn8x7XqBiQctIuhGIVudhRPghJzKRxhUbv1ZgZpLbBKjvmb0JaV5jx
 ihkuVILik9VrtPRN+6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099
X-Rspamd-Queue-Id: 1D7C645D16E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-104425-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> When a driver needs to create virtual device at runtime and map it to
>> an IOMMU context for memory isolation, there is no common bus available
>> for this purpose. Each driver ends up implementing its own bus type,
>> leading to duplicated logic across multiple drivers.
>>
>> host1x driver implemented its own bus type to attach an IOMMU context to
>> a dynamically created device. The Iris VPU driver now has the same
>> requirement. Rather than duplicating the same bus logic again, a shared
>> bus type is introduced under drivers/base that multiple drivers can use
>> directly.
>>
>> The bus takes care of creating a device and attaching the IOMMU context
>> to it based on the client inputs.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/base/Kconfig            |  3 ++
>>  drivers/base/Makefile           |  1 +
>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>  4 files changed, 107 insertions(+)
> as you can not have a device on multiple busses at the same time, this
> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> please add it to the bus that you are wanting it for.  It can't be a
> generic bus as that just doesn't work.
>
> Or what am I missing here?
>
> And why is DMA somehow "special" here from any other hardware attribute?

Let me give brief information which was discussed, in the initial series,
the iris VPU used platform bus for dynamically created devices and we got
the comment/suggestion from Robin to implement a proper bus_type with a
.dma_configure callback.

https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/

based on the discussion, implemented the dma_context_bus and used for iris
VPU devices instead of platform bus.

Here, the device have only one bus (dma_context_bus), not multiple buses.

Regarding the "DMA" naming, the core operation of this bus is its
.dma_configure callback, which calls of_dma_configure_id() to map the device
to a corresponding IOMMU stream ID. The name "dma_context" reflects this
purpose.

I am open to suggestions from you or Robin or anyone else, if there is a
better or preferred way to achieve this, I am happy to consider it and
rework the implementation accordingly.

Thanks,
Vishnu Reddy.

> thanks,
>
> greg k-h

