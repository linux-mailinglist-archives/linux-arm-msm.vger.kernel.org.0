Return-Path: <linux-arm-msm+bounces-102540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBpCN0IC2Gm2WAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 21:47:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2683CF177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 21:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A91F03008216
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 19:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C732D7804;
	Thu,  9 Apr 2026 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E258ppeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov3UNrzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8B192590
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775764031; cv=none; b=sB0Z0Yi1XfA/t441bolcBs/ENSS9oQZQ/bQszbyi3d+u19ieGoBO2AGvm90US25dJHkncfKIY/eE7mFR+2jBE31knirfgZxlRYlnbCE+JXJuaHC+qeIl8w2PbSO31p4m3wZyxkeN/nrkWMVeCdDfWiC0A0kSdW0kQWxK3s2NrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775764031; c=relaxed/simple;
	bh=wE2v5piXmBNTShghMARat1tBKYtFecBTpTLeG/24KeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUUJHeB3HlgY3J0Ft4a9Irn5P3c00Xv0naaM+wZE8InY46CgUb7ScDv55ayyndGreJsMaKKGhOajYqUU882MCOZk3Xf3tXbIzLyTCTqY2OG25jXYbjgxiuNZd7pXfIIe92gRTtDOIg/ZCSaNS3FlhDlIBrkIMc+qJsHDoGOvC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E258ppeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov3UNrzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IbXIh779516
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 19:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=; b=E258ppeTaBTn5jcT
	fpDf25bOdp8etUBuri9dWIQ4KzrdxasmAACSd68I241xfpF97QvabQdVPyVnQ/qv
	21/gdNo0mRTcMj+LtHCjqcEk+N+0gKmm+VZBQ6955Cc/CTLHh+JIWl59J3Z2dqS4
	Px89Ewvg93okNdGlc7AdZcTUbtzoJYketddZTlbpqQh79enULdlXCJSeV70wrczL
	T3AQeQCsCxRS9xC9K4bWylVgmwSC27CsF9ZO7vOWAtbiMjeL+tuxeVlrvlHinebT
	TXbNN+64GRjB4hgYqyAz7MZ99QKvhR0CiLbt7B94zjY60pcja4oboMG9PLsovvwq
	Owd4fA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hspss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 19:47:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso1792561c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775764029; x=1776368829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=Ov3UNrzqw+cHzyIt36kho0v6OtG6bhZP2yqqLXsYYxJb+e6EIkhUWmyvZ/TvyEHRvr
         zWtcVg4DAN3Nc4rf6uD0/Kr0gJkwqEwCKcMyEdbqt3sLgHRjRWqGdwvfhIYSIw2mHhpT
         JMeyO4HJloU+dF00Trp9qomeF95tHWQ9DxfabvfsKyA14/pYihCLF0M79PpNWSUxUrDC
         0tNKjJ2IkFPOJ+VcJgiesklskKtSDAvn8VS3RN7GdkIilPE27fzMOHE+shj4Gnkg6/lA
         UrP5GTy7n52oR5Qpxnh2y6IVy07gsGXf6evYsH8BLfILEeO5dEtjIGWEbeoDWvhmfNR7
         VuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775764029; x=1776368829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=LT9MYruL3EPFz255ZsHxxuRZ99X1GG3tr5D8zEzpJ6DjrDS/Bqn7XwTyCgulzhprZq
         b8UV54EOHiCwqdkR4XA2hrlTo9vXSwRg+nxHhrG2/Jmn9WdUv6yI0CpRbSvPUlnqC48q
         Csoe6yuuODUeSk4eQehYKbcHJe6VAVobc98H29egB32jn8ozCd8CbOhXoGL8oeRxmztN
         2i0EOrQkLsusjXBJ+F+mIRBHJtqt5b4p5yDEPaCL6R4dWEtAlrwPnSHqxXPrIonuzsn8
         x0+byEuJMJ/axhXBSMlxuEd10UYmgHREqABcpJ0bteuU1JnBYIW393G35Ah+XA5VHcMw
         ID5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7pEyaZpUB3hua0xKevAiQyDNQ8Ch33WWHjk6QO2E599gaKHyB4qwhalrCgsHpaheWAO7AQC1bMr6snbDm@vger.kernel.org
X-Gm-Message-State: AOJu0YxmBbrJptrypo4wVw5vOV4XsNIAdBc8igXTHiZOt/y8H0RGePfn
	xkZ8OdfW+1XC7e+WYsnv+FwBV4402LfNJM93N+whGCGM+BF1534KD9L5zsjyw6N6gphXgKWI+i2
	FeaTLppc6GS0kBoZHyTZHCduU4YW/cmeHv4MyEdQDDp2B305tMqDzvQlw6QahsYOIsN5q
X-Gm-Gg: AeBDiet9wIdCtJVbj5zv8i469xD8rikicSYgnnezzbuwkNNhY/tl4LzXiIHBFaPmHjn
	q+Dm52I60/M3JlCXooU9cJ9AaEFHR+2AU5napNPHJ4uz5RopzgzeAafrL5dxzjqaO1m+8C3dNaH
	HBmvQSTK4f2z80DG392yXlBy3GgSaaGZFtghpJ+0FBQJp+bjGvZuGdzNfTB814UUsUYezUsSVkr
	nkPqdh5pFW6EHA1eKUIo0KfO++Di+9D6hRuD4+j2Ok0iG21dKC6vhNHlwd7/IvfTJH1CpqBMogk
	1mrIwVq91e3nchi+b+V7dnq+wNUtyFHPRlRLumybwV9j9nvF6+V0MNKOZD/gzcXSFhOy3u6vvyI
	I/x3M+DMGU5vRn/tDFgkdKWSkoVuJyiPDOlWClPEVbhYurWZSM7PFQl1fK0r0qZodXb7SO0Bs2R
	k=
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224068c88.30.1775764029052;
        Thu, 09 Apr 2026 12:47:09 -0700 (PDT)
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224039c88.30.1775764028479;
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345a96f0sm738890c88.5.2026.04.09.12.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Message-ID: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:47:06 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d8023d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ddSKszWcQf2y6ZE3pzUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 12CAe2nqK_upVq90kKZQraF62Gg5QNRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4MSBTYWx0ZWRfX7R/BGRv4AMOb
 /XMMy//bVqQSntmDm+VHSAavhN+FQek3bhkbMiBB4eKrggvsBjTrjv+bHo9aBlKh6KnqDZyu5VX
 hl4DyxS2GTT/mdACEGzFsRLj5PlQn9CpTwLezMCwY8rEhWldHL2bvV0mDfSVUCaQrXvD4B6vIdP
 KhdCsSAfcVFMnRlsa3FykNqksIOGWevMwaNLO821kU/6zEPJZT3w4cy/TLPRCtKi/hJD7hBvOYj
 lM5KSqNfXc7flcZFsHd2QpBzOPFSeWusS4/OZ+EFCGL5JDV4X38oE8YHAMsdbO7KRGK2hG0kTz+
 21HIsArk8nU1kz62j4GSR8gulqrU82z+tAbTR9ht62T1dGTJI7uWhfg1dVklRoIGihLDdR7JkSE
 api3ULaRZOIMXodXiFHp+OFS+8bz3osKFfRFTM3jVLz77CotRSlBPpDS7jTVWbaVMBhR+gdX9QQ
 sB8G3zlOi1W8PFeSlOA==
X-Proofpoint-GUID: 12CAe2nqK_upVq90kKZQraF62Gg5QNRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102540-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C2683CF177
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

$SUBJECT is not a complete sentence.  You should drop the full stop ".".

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.

Thank you for the documentation.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/sahara/index.rst           |   14 +
>   Documentation/sahara/sahara_protocol.rst | 1241 ++++++++++++++++++++++++++++++

I see from the cover letter that the sahara implementation is moving 
under MHI. I expect to have more about that move later in the series, 
but MHI already has a documentation directory. I don't see why Sahara 
should be at the top level if it is considered to be coupled to MHI.

>   2 files changed, 1255 insertions(+)
> 
> diff --git a/Documentation/sahara/index.rst b/Documentation/sahara/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
> --- /dev/null
> +++ b/Documentation/sahara/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +========================
> +Qualcomm Sahara protocol
> +========================
> +
> +The Sahara protocol transfers data to and from memory and describes packet
> +structures, packet flows, and their usage.
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :caption: Contents
> +
> +   sahara_protocol
> diff --git a/Documentation/sahara/sahara_protocol.rst b/Documentation/sahara/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
> --- /dev/null
> +++ b/Documentation/sahara/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification
> +=============================
> +
> +The Qualcomm Sahara protocol driver is primarily designed for transferring
> +software images from a host device to a target device using a simplified data
> +transfer mechanism over a link. However, the sahara protocol does not support

"Sahara" should be capital "S" everywhere in this patch.


