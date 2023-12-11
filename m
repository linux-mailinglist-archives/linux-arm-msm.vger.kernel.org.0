Return-Path: <linux-arm-msm+bounces-4136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5D80BE95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 01:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E791C2042D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F86715A2;
	Mon, 11 Dec 2023 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UvDvafvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAA3EB;
	Sun, 10 Dec 2023 16:52:48 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0j1qM018569;
	Mon, 11 Dec 2023 00:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0aq5YyQXrAepoV5UwbBHOeZM0uSL2uBVIs5hgeuewj8=; b=Uv
	Dvafvioq77VwWwHDoDBcTjTHC4OVX7dj9ESNumJIjtPbUsbdA/mYDh8QlVndzJ/a
	+Nc2MkjHl5fhmsJkfwco5KSUelC2Jd2YWlPV5ssa52qebpzT+gghZupqVJn9EYVX
	1AaL3wTFE+Sz1WbQR9rVBGQ4JyqMMk5/oVcAtd/eTcv41uDSc/G0QiM2u9bgjQn/
	LIrczs5D8Pt7S4Fvufkyzd6GhttbAub6cQEWFk36hLrssN+FMKSxrtY/vPj50CpM
	07Fpsq7DF99EIsMdfmdL8J2eh42x2dG94j0CwsapQyqth1F14PM6tp95BMD9T2D+
	57cscHb5TNw6llGENjAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnrg1www-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 00:52:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB0q0L7021049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 00:52:00 GMT
Received: from [10.110.42.222] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 10 Dec
 2023 16:51:56 -0800
Message-ID: <2db0f02f-b15d-4767-8b7e-9051a46707d0@quicinc.com>
Date: Sun, 10 Dec 2023 16:51:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/6] of: reserved_mem: Swicth call to
 unflatten_device_tree() to after paging_init()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <frowand.list@gmail.com>,
        <dinguyen@kernel.org>, <chenhuacai@kernel.org>,
        <tsbogend@alpha.franken.de>, <jonas@southpole.se>,
        <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
        <mpe@ellerman.id.au>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
        <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
        <chris@zankel.net>, <jcmvbkbc@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20231204185409.19615-1-quic_obabatun@quicinc.com>
 <20231204185409.19615-3-quic_obabatun@quicinc.com>
 <20231206213110.GA3345785-robh@kernel.org>
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
In-Reply-To: <20231206213110.GA3345785-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XQi_JEGWWCFJZBA7sFX-GSr81mIcLGWH
X-Proofpoint-ORIG-GUID: XQi_JEGWWCFJZBA7sFX-GSr81mIcLGWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=522 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110005


On 12/6/2023 1:31 PM, Rob Herring wrote:
> On Mon, Dec 04, 2023 at 10:54:05AM -0800, Oreoluwa Babatunde wrote:
>> Switch call to unflatten_device_tree() to after paging_init() on other
>> archs to follow new order in which the reserved_mem regions are
>> processed.
> You did this so that you could allocate memory for the reserved regions. 
> But unflatten_device_tree() can already do allocations using memblock. 
> So the same thing should work for you.
>
> I suspect that moving this will break any arch that called an of_* API 
> between the original call and the new call location.
>
> Rob
Hi Rob,

Thank you for your feedback. You are correct, I see that
unflatten_device_tree() is allocating memory from memblock and writing
to it before paging_init() is called on these other architectures.

This series will still require fdt_init_reserved_mem() to be called
after paging_init() on architectures such as arm64 which require
paging_init() to run before memblock allocated memory is writable.

In light of this, there seems to be no non-architecture-specific
universal calling point to stick in fdt_init_reserved_mem() that works
for all architectures.  Therefore, I propose taking out the call to
fdt_init_reserved_mem() from the unflatten_device_tree() function and
placing it in the setup_arch() function for each architecture.
(similar to the way it was in v1 of this series).

Doing this will allow us to place  fdt_init_reserved_mem() after
paging_init() on architectures that require paging_init() to be called
before memblock allocated memory is writable, and place it before
paging_init() on architectures that does not require paging_init() to be
called before writing to memblock allocated memory.

fdt_init_reserved_mem() can also be called after unflatten_device_tree()
on all architectures to ensure we get the speed benefits of using the
unflattened device tree APIs for the final pass.

Regards,
Oreoluwa

