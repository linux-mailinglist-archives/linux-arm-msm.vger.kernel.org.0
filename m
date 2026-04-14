Return-Path: <linux-arm-msm+bounces-103091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBabIZEN3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:49:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D90193F8308
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A8A93098456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2C93BD22F;
	Tue, 14 Apr 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suhm7e8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9F2CfFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B166A3BD657
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159936; cv=none; b=j9XGiy6k+eKj9Hwa+QeFQuetw909f/Rio7zildGH+CfGHltP80BVpvhLvR72DmJePz7UtjOn7N9G+w8cPiDHw8VpkKkc7qECT6xixP65d511Djq5rFniSt+xzEpsmErPdaRCSU+kR4aMdnXij69w1ZtJV7HfEcPcYGn2sB8AwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159936; c=relaxed/simple;
	bh=VfZJL/05CrykX+ouf4RhiP1e4++49VnbXustyYGDWMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImWV8zOUFvdFN7qoNrs9K46Ef1vXFVGRJw7GDMmcZpGHNXKlkcebzA4vHcr34616StUcu878U6li1G65TASkTbGi5tIe7978ekZ5fqIAglLRoDGTxrMZ9/YSQGHDX9eJASfhW9gvGmkfTeA4gnotWSC/LIl0He0R0unAHSdHur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suhm7e8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9F2CfFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6V9VC1479046
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=; b=Suhm7e8mZGqcGosW
	9je+YigAKvzd5Q8YTF4XfC0yZ2BfpxQDLqaGpSJaampK3812YalnqDcGBVxYko5U
	GdFwsqe20bLeA3OPm+cN2L4EUjHsQ8tRdbwkm6M0ZcvHZQ4xrn6Qkf6o2/pfx67l
	c5yrVPdjEwnkN+vj687HmoRA1WNgQsAPMznaIxgBUuziNpKFurLiOqR/gYRHwGcD
	FkzKSI8t9EgVsN3DdxNg2Lx68yyoEgN9ZsfaydMw9GJ5e4n+dyJqqLLj6Y4mC6uV
	bNuqLLyaqwuhQKbXPYFI1YYJm0/F/yI+K26XxOKZuQDUqmaZ+8IgA8SJmWWxl6DK
	WMonVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j25dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:45:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so105168035ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159933; x=1776764733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=K9F2CfFJvcE7zsW61ns5lvvgrXhYZO5rXgbStDJI9RM1k3SVevxOgisX6SAYMheHEB
         Hg8VCABTVItTgJ/TBIwOKGklzI6MEnk3bI3z/6ygSMXVXrqL1w7ghkTW0biTjv6A14L3
         z0o74GV0KSVppGrB8wbaDcFOUmMIJl2A4Jxd96ueVRvtsYR1ltGcbROleafR7OD7Ewlo
         Paf7rkFIT8FF3EdaKh5XRcbSAptgY4xhTItIiVlm/Lx9cIE0eG/C9ORGFwlmAT3W6Ds+
         Ge9yEsMeCxaIbPAbn9/nGPFrZ/rVN2uyzP9XZegJccwmsC3HDv9c2VpL2nNLsIK8kT2H
         5R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159933; x=1776764733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=mdgUuWFzS9ASvmy5VAu9xEbVNTXSgeiwJ/aR/WkJO2811tXov6ZPaOzmrJHFVscvx1
         UKndKor2ew/RhNF2IXrdJt80YlRQMQo0nmjTrP7Cx3vj99ByGP1npNizb5ThJc4ta3+3
         gqRslkisruGd0DEGtoFmlOh/EmVPHlcXBFKguRknoWIXrkiUXu4Ydv6Q+smow+mAFZ4d
         pDwtMctkdoGgnPAT7JPwxg31q442l3KkIdabDBmu0xzDmbHMekb1Hr9ZS3xwGPl50r9Q
         7n5sSjk1SXfaoyu7lY5vI6sikCajK+YUR1b4uFia20l1T8C9duVHj8pSmWHU/Ogc4F1K
         c34Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1jRDSMyQH07Rcv1NfWMSPZIH0tJgkRUT0QiMXWMrIisAs2Gln/jro3Ay2E+dl8o6CAqklwwzU4jLHuOBi@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1B0SgOOT2KNtfrB1kH9hIbXfaaH+l/hduF2Jv03oElVjsLbK
	L8lQsfcnh2db0Zb2Ctph1HrZVDAE89fW/+oRh1Rt534GChbF4YiMky9I84X3zuimeuJqu/25Mhq
	bdsXMLG9jwPD0Skk5uNOkm+SJFQ4+vVBujgRXtGkAXZ57v+JIWA66maodOGMf392G1vT+
X-Gm-Gg: AeBDiev3unxh0M5IZaycFEUQqEZMNah4BFEAjqJf0xFQnKKi3Hc5fkraYzXT4hzK3Ev
	xP3d3DJTbSc7rxydqskuUzs5zyGiyPAqwVX67iVfIBQ/t7NCSGgMHY4EbL4B/NPw9ZsrwjNU8PX
	3Vc9iXTNpJE2dp6d0stIsj4L0V8XSPJRY+lOGWlqXUaFh4dhhLGvqjsRVKxzyEDbei+GOHY+Cjm
	719McIaM4wlazEYPDz1UJyXj5uUIaxYPK6f0l6SC6outSX4xWdpC9OEJ0MqMensNPrz+pVcVhTC
	YtLC7OVRInJJpB93kk7Up7pB0JmX9tnmK0UTHlPSnS5Jr+1Iio7qR0OvefUK9qhhXsqBmsY8yB5
	N985ZHXEQg34ryGuWNciSNdS5eyc9aKdX//BdlwbUp/PmGwgZrYR7kQ==
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707615ad.16.1776159933039;
        Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707295ad.16.1776159932546;
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2f8e7sm134928975ad.65.2026.04.14.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Message-ID: <5a2fa53c-a895-4c39-9670-c6d383ca17a6@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:15:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
 <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L0orDCRE-nunI_9EoFbaYuB37YoRB2dU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXzvFpdQ2GYQC4
 MUidiqlp/EswrSh/2Y20+R8tLyeTSymXtXy+3fsDrk0+AC6ygwO6OZAiwvQb33/bvSNpJJsTBmq
 NumY42/geEmsJNPXDGtlhz4dU6MAXLGKnPsIpIyQB2uv661XG0zLVH+jO6n9zbyI6/Enle8ddGM
 UQh7zH8lvantXbP6p4oC8GeJAc0LC5xO66478B3BLvbTgDMclkCZSeeaxK/viTHmzd+fstreS1A
 4J7Ax9h12R6/agytYK0WDZ1BN8d/5yUT3Q9uN94ilOaYwaJ9ZlXsU9mbQhAdJCTlOzcgtXe85Dx
 +Rum3CEDFJXyAyI+qLp4HQTsKHr8f5+sHcs3WAi6urQajbjwS6e1kUBPZTY+50aiORcJxq5P3AK
 iduU8/UwsA9aldqOoIXgpiVzWGvWR5IfdniJOouxZxXoIKasfEwM9tHv1Je94bpG7GVEcfgZBET
 Rfr6P9aTByw7hANS0+g==
X-Proofpoint-ORIG-GUID: L0orDCRE-nunI_9EoFbaYuB37YoRB2dU
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de0cbd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=W_4NKV7oC5Mk2jKmMQsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103091-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D90193F8308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 4:34 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 09, 2026 at 02:20:02PM -0600, Jeff Hugo wrote:
>> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>>> The Sahara protocol driver is currently located under the QAIC
>>> accelerator subsystem even though protocol itself is transported over the
>>> MHI bus and is used by multiple Qualcomm flashless devices.
>>>
>>> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
>>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>>> specific and makes it available for reuse by other MHI based devices.
>>>
>>> As part of this move, introduce a dedicated Kconfig and Makefile under the
>>> MHI subsystem and expose the sahara interface via a common header.
>> I don't think this belongs under MHI. Mani needs to confirm that he agrees
>> with the concept of moving this there.
>>
>> The Sahara protocol as defined by the spec does not require MHI. We know
>> that there are Sahara implementations over USB. I don't see a dependency or
>> relationship to MHI other than the current in-kernel implementation uses
>> MHI, but there are plenty of things that use MHI (qaic, mhi-net, ath12k,
>> etc) which are not a part of the MHI bus.
>>
> Since Sahara is a MHI client driver, it is OK with me to place it under
> drivers/bus/mhi/host/. We do tend to host the client/controller drivers if they
> also bind to separate top level subsystems like Net, WWAN... but for the pure
> protocol drivers like Sahara, MHI can provide asylum.
>
> - Mani
Thanks for the confirmation Mani. I will keep the Sahara driver under 
driver/bus/mhi/host/ and also move the Sahara documentation under 
Documentation/mhi/ directory.

