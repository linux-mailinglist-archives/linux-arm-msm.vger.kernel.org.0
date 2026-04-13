Return-Path: <linux-arm-msm+bounces-102907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJRTJ1qx3GldVQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:03:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 274D03E9803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2C03004F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA523AB29F;
	Mon, 13 Apr 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryp78dd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJF8+ITw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BAD3ACEF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071000; cv=none; b=fqicYJmTRbReGz7qN8c3N0qcuqBKPGrxlwqs4Z+jeWxelRhvDA8IYGCRautA3Zei0e8Ok9s92eS6qpardBek1SbxDDPKFhmSmKA6tkpHPjKuQ2xH7bLGjCVUWw5j5bsJMbtNYwD6MYRUdMfvoYhOqMw52c2HMUBP9pAmzxK3r9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071000; c=relaxed/simple;
	bh=2fhfWqB0s96d9TRTPdduLQ8pllmNmEb/7aVSAY5VdBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7QKUSnoz5VDfUcXoXGbkZoPLw+CHaflBYFdiKkQsPcNy1ayoaK6RCC+CDHgTARWWvvpqvaKKKtovr7sT2Nm3uTo2KNysB5LOasnUtg0KTsqB2SJwgwUGkwkGXpa7qLWXgQ04cMuSN+IjsEIlF+v6bjwRLu4ekXF/ums2/RontA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryp78dd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJF8+ITw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4n0mv3561249
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=; b=Ryp78dd989PduCH/
	DeBkaW9GFdsXXsDMpl+quFEk31zgyYSo/wNbmmZ4aSdRs69/gkbdN6l6rdsGvCQU
	OMlx7bfURuKpx2OFgSPa1rpHFIRNtClK9Dnb7UVyDDFXXu2xJCd4/ZtBKVbkJkJs
	oIaJw3TanayOPIWVFkjENuKNZiutvHAkpPHMbJyABlCeOaRhhV2b15wbr/7mUx78
	5zDPYIy/mRuPNvDsv4u8vTUjE8E2p8cSkvBOQ9Wf+0/FWZzXa1xQj6P2p0zIeoeS
	a7/H+NCbCSuPhfImD1OHv5Q8FhGBzGf1QMfvlOP1ShK3klas1LzF1z3RKoRpetNP
	tNGS2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mhcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:03:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so98197895ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070998; x=1776675798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=JJF8+ITwq46L7yqZkoEEiMbdXQYXydk9T0Wp9VvzRrPmZHsIzo/mjJnC6OhwQNZQsa
         Mrw7KVSgxWG+BGcG6lKgNdvzb6BnrYwof4TDaaBWawi7xCqwvUmcqSoWCID78kWPTGb6
         CallQvKoWRdu+NuVpt9SBi5idqkVFwEm0XTolohs+arfdwb0JCTXhwvvLyzYQZ1Gf+rR
         5dwl3hnpZSVNWhTNLj14gh4K+O9RvP1ZBPSsccYSQAgXJdEBE7xdciuDJlbaOtiW9rXf
         h3Bef7jseY0RmeSr+HYqo9pvZveKrX2D0WRbDhIJYO/ybINB61c7j8wBgs3lsoGWuIV7
         eCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070998; x=1776675798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=ROAk3f0h+X+Eg5iuZA4gHo2oHm6kybibE5yV8FQ7FcYTdwlcWUtxsZrfvfg3Q/xQ29
         S8jtyf7Xcttiq0bnKhcyw/3WLTU4VURgm69FZM+yI+gI7D0rnVTfy3svwBc9w8jqHL7d
         VYpK3LBZY6J/83M4yWX8oMzAYmkuz3pYD2Ob+1kiI6+0+1amYd7H8JkZRrWbZB70LBbQ
         i/T7pF+BFVtM/yf+chYwK+xs7Iiw0/hQpcvKim1HwS09HgmsbB0ufXvVK4OVCFVyuRO0
         5JoVw5cJdV3Z19S1gc2vTlCua/l97xJZMZCLqvoGk8EmUeOIT4m5euuU5x5pqCb/KwkG
         3YrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+nDf/8KL/K49PkrqwZLoFfaessmSE0oSoEZ+gCrib8AtEWqbHKHbNVcEzvG4Kxg0LJ/fDG6U/1oneQ3Xd@vger.kernel.org
X-Gm-Message-State: AOJu0YyL62DzJFpoHZYLkF3X9XEv3BbvA29xFjBfAyLtL71Lconpu2O2
	xSDVy9na/I/x/DLvMJ3l4odwzkxCwhLFR+E0fj+dQhdw4M5i23M20zOGLIlSSPdlL6LcrWsYmmj
	VGSzsXM65YsUfzkyuqus66xT4uDCfQfKI3ZbPhpyqAxwmAJlcNzH8txRNRo3ArMwtx+1G
X-Gm-Gg: AeBDievliOma32jy2E4QjsrKNjhNWKrL/AfGLO8Spk3lHyB1MU6jlCMYeeCH9zd0Ctl
	Hi5sq6rzXOww6UKGYfHma5I1Z7Q2BcsG8SIZNeiTbdt3ZGmXtfr7u55JpW+fWjEAM8J6r2PB5t3
	cOD9c87q05dbED229Ll1SWZFflOlBqwR4vtM7iQ3WxygVUb4i9B8Xg2RjetORAnX72BsRjTlgkl
	cLE/z6GN00GIIzbLozN8bvfHsg1THP+sAMwFbpg/jSV5IJF6P8lIOf/8oeucsq//gcwsJT/jHX+
	AC007HLiGRHt8jRA7TgAJr6WnE3Gci2n0XpWJDrWMifwuDwwUw6bI8aQsz6AcFZLE9OX+UVJZeq
	L/Cn5gtQRUayWcdUy1dXyMfwtWrepWUPTcxnfP5E2ug7khIcAl+uva4o=
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132828905ad.45.1776070997520;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132828655ad.45.1776070997059;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b462830bc5sm16069325ad.50.2026.04.13.02.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:16 -0700 (PDT)
Message-ID: <65e37364-f721-4e86-a105-1058d6267121@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
 <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb156 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=05GiTeiPTPDWsqTu57sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX0PdMQlaQy67t
 E/IiwBuPBmfEV2AmOmoln42QM889PhzyGNAzoDF5Vhspa5z0VqB5Z51hS7o2ngFaDR19Sj5LDpO
 mNFLntpCpz2O9lp5oV5PJkT1pTUNGxf5JW1eXgn6AcdeqqxOErpJzCP8e5hYBeClFoFXzlXqwmz
 dblkvkNbZ8u+51tlIwz5/jPE7I0b2iSBou+sVwyi837qCqX1dT7XZPIw8AM4zoHZYlyX2YUqQ5N
 +X9wE4/XTVYwJXy9uHj+aU3IUrzzDR1VBAfRAxJYZgw/8pq2BJ/fEzUnAqJLyjwTrngDj0C4UGS
 /2PUs4oFDFPsYKeCjm0+xQ2frZptNh1sCQ9DsMmkz0aN0P1s94ZP/PM+IM6d5+drPn/sbCMdphe
 yXAepNmR806qMfb1xo3BZJCUsxNAsKPCaGPJ2rD1KU5xvypSty3RFz/AASJymVFIrROM7Xuiw8s
 A3YvKEraGN05H+/lJIg==
X-Proofpoint-ORIG-GUID: aE106yd3y-VgLVr69NPFi9g1aRVLYaqq
X-Proofpoint-GUID: aE106yd3y-VgLVr69NPFi9g1aRVLYaqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102907-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 274D03E9803
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 1:17 AM, Jeff Hugo wrote:
> $SUBJECT is not a complete sentence.  You should drop the full stop ".".
Sure. I will drop in the next patch.
>
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Introduce documentation for the Sahara protocol, describing its
>> operational modes and their respective functions. The image transfer 
>> mode
>> enables firmware transfer from host to device. The memory debug mode
>> allows extraction of device memory contents to host. The command mode
>> facilitates retrieval of DDR training data from the device and also
>> to restore the training data back to device in subsequent boot of device
>> to save boot time.
>
> Thank you for the documentation.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   Documentation/sahara/index.rst           |   14 +
>>   Documentation/sahara/sahara_protocol.rst | 1241 
>> ++++++++++++++++++++++++++++++
>
> I see from the cover letter that the sahara implementation is moving 
> under MHI. I expect to have more about that move later in the series, 
> but MHI already has a documentation directory. I don't see why Sahara 
> should be at the top level if it is considered to be coupled to MHI.
>
Okay. I have shared comments later in the series. Once its concluded, I 
will move the documentation to the right directory.
>>   2 files changed, 1255 insertions(+)
>>
>> diff --git a/Documentation/sahara/index.rst 
>> b/Documentation/sahara/index.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
>> --- /dev/null
>> +++ b/Documentation/sahara/index.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +========================
>> +Qualcomm Sahara protocol
>> +========================
>> +
>> +The Sahara protocol transfers data to and from memory and describes 
>> packet
>> +structures, packet flows, and their usage.
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +   :caption: Contents
>> +
>> +   sahara_protocol
>> diff --git a/Documentation/sahara/sahara_protocol.rst 
>> b/Documentation/sahara/sahara_protocol.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
>> --- /dev/null
>> +++ b/Documentation/sahara/sahara_protocol.rst
>> @@ -0,0 +1,1241 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +
>> +=============================
>> +Sahara protocol Specification
>> +=============================
>> +
>> +The Qualcomm Sahara protocol driver is primarily designed for 
>> transferring
>> +software images from a host device to a target device using a 
>> simplified data
>> +transfer mechanism over a link. However, the sahara protocol does 
>> not support
>
> "Sahara" should be capital "S" everywhere in this patch.


Sure. I will make changes accordingly.


