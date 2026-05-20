Return-Path: <linux-arm-msm+bounces-108872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFHtHH/9DWoo5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:29:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF4596514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22DA130E9BA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A113F889E;
	Wed, 20 May 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKhqo80d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWUhseL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD143F7884
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779300813; cv=none; b=OgSiH7hF18reCxT1/8ebQskBOG+zz3/Yv+RsHajYk1909I0drRJ7UGieV6Z6zZhNNNYm6ngWtCxUfWsqqhQTwVtjj60+ilODCxm/It5rXyOnSOg/3HTUcQx64RA8Bidi/rYaIzu88G4j1tkjIhXG/9Uqe0hv2gcPodKHYa0Nx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779300813; c=relaxed/simple;
	bh=VGBAg70L6yRE+3wY6u2w1pvPpMW/hIWgg0wzLNi2yh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDB4h1ZVVt5n7g5B/blTw+5+QgNu95JUSpXFUR8DKCbpATiV0UofgMw5hepmXTfRoCllRJLjLocu63Ioe7arYoBUYe4ulMCOctsuLuvyIF6yjnIDi0I/b3NltFNmANfyNZ8to8GPf6BWWeV+mK9XYh4eWvweKwki0ImmD7whjOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKhqo80d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWUhseL/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFasC963757
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=; b=dKhqo80dgDn70xdW
	rOaLg+L3cxWEkCulCKsvvTWiEI6VcfV/vvG6YoZBHdgCtsfaSGeoCD9QukzHaxf6
	Xmdbv/s8ZXUF7y46sAXcREZ7+HrLEV4PWaMAPYFbTqmStLQKtSf18Hpd6angxnnB
	QFfDepGLT0gRCmuSJLZzvgEKfC77Lggs/XZDhavL5rl37OqdfVLVSRvKCd61MNpw
	2LzvGujWpjxo1RKR6t7JHu/NtBhDeqnxluTj7Qspj1WmqB7uJe0mipE7pySZvjY/
	m2BtqSxTqebHH7+c12fA/n6jwmcdMJahZpB+nHmwsbcttRQZEDGpKKPNyDikJZ1G
	bux+YA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh1337-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:13:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837729dfb2cso952051b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779300810; x=1779905610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=iWUhseL/Twn+1GVHz455uTUlnr8YOgP8qitfYlqwGjCTj+nLw+SPZUa60gfrwniQVk
         95Wh0FhwSTNqErCb7u4Twa4QHVdBw2YUHpT6ySzk1VwN/Ahr6Jnp86AhV05ururXD6jf
         r4KKEGm6pdeZBEVCgLVPSrGl6OMW5ltkgLPQetlj37dSXnlPbx20OBJ5Zbb/H562MTIL
         yDPkkGED8XUjySAZW+HMtuMuBWUICuEPXRurvVmOrNqitDqvGC+SyrLw04e0sRNI7fSz
         N5atUn0VHLFaMW3iTmgo87VkkupjGGpqGVgqlMRoXZxquWOwDGibckb7lV/IvIELHAOp
         qKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779300810; x=1779905610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=tLjUplDYU646TGsUdKXcv5qxvPViPs8G05/F9/ueNlTNB5iZnU1fSXnB3gJCTS1wV2
         rm6n6qPq3dbKbimhfvbj2yucuvl6kqiY6uE4YSG6P4xQGadcIqNL/I+mpzETDyq5cA2G
         Kakij49Jyc8K723oIMqoGlsHYjr/kx2pToUh7tuhmJUAhwkyzjJxR+W1GKmZ0QVHwv1u
         dXEaJYF9Qh3lJ2o8Y9z/ci9JFVwo6dHhAjHRbni4U5YtaZT+uaYzXCwas29sQCbbl5JP
         W/Tglspk1MxoDmhehKe8IQphrUn25HsyZM4tzer5M1J1KwQzH0llZnHx4V2pgdsbi6lz
         KGfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M1rGQo5sLaGnk7LSLXJL507v5oVYHsorXyrCjEkZo6sxEd+N4d4ZCaANqTz4CR0bKNuitY3gPmYI15qGb@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDLtlF4lrdoCiKRIrsS3eRKGVtNdJvG12K71Cvll6dcvA6u7K
	NAaSa1fX3lauPGK7OXn2jRptrfTFcdTmUilsQWTTm7jJPBPLgZt2ZyRcOmFTC07KMwlZwgTxjf+
	9styGFoJf+iBfOh+xWHnIEZ0VcJPBJmEtv3uQl6bXtuAQI5Y2CNidiCN/qrRCc9F9gihe
X-Gm-Gg: Acq92OHRNuL2K1cHeMHMzas3z/7YZB2Cu+bLRRIF9ljGgNwgEAXa3ryBGPohWr/jr+G
	XtGUqzjjnFnwJqiFcc7vskTjsnn3AvFAJHCE8m4AzD47/lNxgy0SnsyDIAFP7Wn8wF4ITKRiFne
	mD2lJ1LhiFqdDD4a8dE4/0dSziErmVUDPYdDQkdtxIKrF9Cbz5tBslcM0jlbSr5zc0Y65JrTeyq
	/iVD3IyVh2yYPffdUHGrh3TW8z6zcrHNsn53848j2PwuchzQLxPyEVqgix31ZZG+aiGnXiive2I
	fMIktnaf5sQUx/LzWxRO2qAGqGFkP91vkqoi+XGMVsTVf3Wkq3XT/ggEjBQE9xN8W9TRepXLZ1h
	xTMSz297yq7lIm/rGFRUD4vPSx4/N27/Q7yeNrf/vgXHhCJUD
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248426b3a.7.1779300809981;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248414b3a.7.1779300809371;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.26.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f24cd0422sm26506189b3a.18.2026.05.20.11.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 11:13:28 -0700 (PDT)
Message-ID: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Date: Wed, 20 May 2026 23:43:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
To: Rob Herring <robh@kernel.org>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
 <20260513175823.GA1471517-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260513175823.GA1471517-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0df9cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6DK/O5GeEcI+fsUIEy35yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3A8QVl99vi6_thLXI7oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3OCBTYWx0ZWRfX8SvOWf3cFGGE
 fER2Vszohvkj9QivhkfN2oG1DPQnZFvS81qdCTR5sqRCuv45TEPYiQYy3BqSi8V1Y9VpoZcxkuq
 cc8GKVsabC0Wev6E/3dPkM1epfT/v7tRU/1W8ibGQS0m3IWpU7iN59+X9iAs3QyUM6VrsvufpON
 fCnZZ29QYkjThvMAs+hmjb7IOHLNPdzghro1CR7M5GwMOIoOZxI+wprjow+FFP5CTmSfbQ7Tuj/
 cFQiTBJAxyHNPXbPMTYgRsihhPDygunw/6WpWOY/JgZblhq9ir4mDF0Oa7M6EXgpI1KuMW6Ei5J
 IdALKrvp75zGPm3+PtXuEih2LRuqW1qcCtvPTCMkZbVCoIel1I1Jk4/6ELo/A6ftzh9E4/stOWN
 lQqQJoy9jl/bmNzWE6Ey1fYRiEcwZeCQsvRZlwfb9vGRaCh+9ZMi/iCAGuF3hhTfyVUrs0orWiB
 htQ+1BcS8cwaRqrB7+w==
X-Proofpoint-GUID: sdYDfF6rFB7XDZglYDU5GjT112rwFsU4
X-Proofpoint-ORIG-GUID: sdYDfF6rFB7XDZglYDU5GjT112rwFsU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200178
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108872-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59CF4596514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Rob,

Thanks for helping reviewing the code!

On 5/13/2026 11:28 PM, Rob Herring wrote:
> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>> The Arm Error Source Table (AEST) specification describes how firmware
>> exposes RAS error source topology to the operating system. On ACPI
>> systems this information is provided via the AEST ACPI table.
>>
>> Introduce Device Tree bindings that provide an equivalent description
>> of AEST error sources for DT-based platforms.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>  2 files changed, 449 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> new file mode 100644
>> index 000000000000..7809a0d38270
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Error Source Table (AEST)
>> +
>> +maintainers:
>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>> +
>> +description:
>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>> +  register interfaces. Each error source exposes one or more error records
>> +  through either system registers or a memory-mapped register window, and
>> +  may signal errors via interrupts. The top-level node acts as a container
>> +  for one or more child nodes, each describing a single AEST error source.
>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>> +  Flag bit constants for use in DT source files are defined in
>> +  <dt-bindings/arm/aest.h>.
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,aest
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +patternProperties:
>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>> +    type: object
>> +    description:
>> +      An AEST error source node describing one error source defined by
>> +      the Arm AEST specification.
>> +
>> +    properties:
>> +      compatible:
>> +        description:
>> +          Identifies the type of AEST error source. Each value corresponds to
>> +          a distinct error source class defined by the Arm AEST specification.
>> +          arm,aest-proxy represents a proxy error source that forwards errors
>> +          from another error source.
>> +        enum:
>> +          - arm,aest-processor
>> +          - arm,aest-memory
>> +          - arm,aest-smmu
>> +          - arm,aest-gic
>> +          - arm,aest-pcie
>> +          - arm,aest-vendor
>> +          - arm,aest-proxy
> 
> This is a fundamental difference how DT and ACPI get structured. ACPI 
> defines new table for some feature and puts everything in that table. 
> For DT, these all belong in the node for the corresponding h/w. For 
> example, if the GIC supports AEST, then that belongs in the GIC node.

Thanks for the feedback. To clarify your suggestion — should the AEST
RAS properties be added directly as properties of the hardware node
(e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?


> 
>> +
>> +      reg:
>> +        description:
>> +          Register ranges for the error source. Absence of reg implies
>> +          system-register access (interface type 0). A single range implies
>> +          memory-mapped access (interface type 1). Two ranges imply
>> +          single-record memory-mapped access (interface type 2).
>> +        minItems: 1
>> +        maxItems: 4
>> +
>> +      reg-names:
>> +        description:
>> +          Names for the register ranges. The base error-record window is
>> +          unnamed (or first entry). Optional named ranges provide access to
>> +          the fault-injection, error-group, and interrupt-config register
>> +          windows defined by the AEST specification.
>> +        minItems: 1
>> +        maxItems: 4
>> +        items:
>> +          enum:
>> +            - fault-inject
>> +            - err-group
>> +            - irq-config
>> +
>> +      interrupts:
>> +        description: Interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +      interrupt-names:
>> +        description: Names of the interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +        items:
>> +          enum:
>> +            - fhi
>> +            - eri
>> +
>> +      arm,fhi-flags:
>> +        description:
>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>> +          in the AEST node interrupt structure flags field. Constants are
>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>> +          AEST_IRQ_MODE_EDGE (1).
> 
> DT already has a way to define interrupt flags. Why invent something 
> new?

Ack, this flag is not needed for DT based systems, will remove this.

> 
> Rob

Thanks,
Umang



