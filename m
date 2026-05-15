Return-Path: <linux-arm-msm+bounces-107921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAFAC2AgB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:32:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F045507D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59097305F793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA1E364052;
	Fri, 15 May 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhtFgxHn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPS/MdfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F4379C3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851405; cv=none; b=IOWnngEL02qGgkp8F7Q/he5cw8Kl/jOq/PrfJ4ba46BCAKtJRiJWDzUM9w6j6fsE3ThdVAOEQwkwDFSrLr8mCtBWVdclGyaRNgsc1R0Kb2E8P9N2qiJrIpbbJmcVZrmi//pSdx7nNEKT+ccPVCXoxmyqlNehJ0dQG/T3GwQ1Evk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851405; c=relaxed/simple;
	bh=QEdw/eEh0/lG6qQJfmjuSVq1clRrTvUryIOMEkifb9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzkUknCZAlcM2361z9LDt5dyXWtFuYPjQAk2pyyE0hF7SWRYpbxPVpV+NArtyoU8G1deODSpt0Zvq8qXMM1ZXl9hlQEwEvi5TQeBG4M+EeDMqgJbN06L/tc55L63/Z12uNy+bNX3qqm/Oiel+3ojI+lbY5MJm5fKEBLFPiDkeq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhtFgxHn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPS/MdfU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAffvq3672547
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNIOeyOfHfqkuA+98OANG6jWuYLg5dxeMgUwe8qYPMc=; b=UhtFgxHnhA2VFnFG
	n1Tbm8xoua8GonzOYork/+6I4fYgp2o1zjZDOisFyH6aUIsy1/KzOsd2LnHnCiFa
	dupicfvxRmUyBVxaiIEq2lxE1BH9SVU4aUoIWT16RSpfiFWQB6Y8hmKaJytT1m0B
	nVPEcnR/IpLJXWm/E6g3GpNzSaVeG0J+xl4FB4Bw3ZwdvTk9Rx0egWtNUXpRgN6R
	H4hHLEhPcecz4BxdhF7eGWLFE/Um6omDqH7WiFuN/saQVrKtv/kHP54jys/nlVCU
	RIm2TjtEufZs0Gu06m94wScXCulVcJJq4zAxPYA8ZPImf3TnL0zr94w8VWoSdBBS
	JuHYFw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3f04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:23:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2efc342ef15so12686725eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851402; x=1779456202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNIOeyOfHfqkuA+98OANG6jWuYLg5dxeMgUwe8qYPMc=;
        b=kPS/MdfUPonG08ze4b+2qmloZcK/KTX73v2t9FREMMOWu9JR8ZFBmg4/A7AwkgsudM
         9+Qg5j8ETapVA46/Q6h2cmIzl494KlzDtwNZd9VqZkwceXg8Y8c7GpyvYbipc8rHiBpq
         wh/UvfMCBc4pkoPNDPnAYZhaH1PWKm8WydlOA8Htbe/J210zlZkNJdWUzLFxbCy/fT1d
         D6IH3k4LkGO22KU1s2m2ehsA7mHcCf2EdoDc8+H554Ixd5mtMhdlym/3owLRYqdDuBc4
         M4cj2Fzis4rwhk7cDgpFbPJT9mBshT5/0lr+8yEryn+Cu2LPP6h4m4bVL9hs3m44kcaN
         jznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851402; x=1779456202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNIOeyOfHfqkuA+98OANG6jWuYLg5dxeMgUwe8qYPMc=;
        b=sdYbJ5sCGaceTsUErKEpd9f1rHNqNrwYKjXlbi4vBhqL4oPASjEkm3gQWFJe/Qs9rS
         XjUl0Pi+KQewLaV4EmLbwt3jEUR2VD7LrhTYpHVQqgyiQhIBJ/ULJbH1nyqqHs0MuMX6
         0FmmPZUY3cypcMBgDL38ypi9PMCFtDQDEywbDFLfq6tfR/HArPMHhscYJWjDZmaefcUO
         fKJFGsWtkKrn/HCbH1QUq0yzFBdhh/VX2Me7gO16ve3p3wx1HSIqFoTT+OFQKxAGBKOC
         pWqCJ92R+1VUZQ29IIMg3AxBTU2ZTFVSLokAeOyL32yw6WorYcj+kYN4nycnpAwoi+Ad
         4Iwg==
X-Forwarded-Encrypted: i=1; AFNElJ8vRVyMBrOivb/kliHnszCVSUXAHQv9PixRlicTTkPdMm5h8SbjRGXLVQLN6JnHeW7xkvwYr3Nz1+b4lGrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hsEhhvqR2imnChYnYOX72peac3qfUAYlzAyqNWxEckIFSKSI
	Ptyc+NMTD3e1g08tUuNtik+pzxO7Il/a7xiHTx2vPhO4N+tIVAXky+s2B/5qt/HJUyqA8PEl70p
	45+j17oODejKtblsZDLwaLofABvuwUuWuH48cIBznvwT96vduFFgxL3FLYCMROj62CKFE
X-Gm-Gg: Acq92OHUzeCkOxtDwRJjyjpZQH1V+2C35vocpkZMOBFWKVq5w9PhPUyT7q7/lkBUWw2
	Cmgku29VmSJmFAyX35CcA1BYHYn2RFjWh/QaJPHKI0NDxtXN2lCyEk3+AQA/PFEXaiyQfFhXp7k
	3wTQUC+F6HiorjkWV0QLVuxmF0tvjJcNO7GbvIoXP9VbmK5DcxA+NqLDQgZVbeiqCH8pkU7Sa15
	2Vx4G/n0C43c5PB0nZZK9sMyD1kL6MQRWoE7zu/7KI54CGeoQeMynZVDROMEWlJEq+vey3AGtRJ
	r2yNNCoIL/KpZkxb95WPX3joZ2c10hLsnfb+GefPeLoXRby2JtDVP1UgU7ZtnyZ3MEDJGmB9DBh
	DAZYAoxYfUZO1GOvnjf2DU3PD+rvxFszZ1Hcql1BLoTv3LURqfdJV+d4VdONozFsLf7wGxmQfxw
	c5h/Jc
X-Received: by 2002:a05:7301:688:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-303982bf6a8mr2162194eec.11.1778851401981;
        Fri, 15 May 2026 06:23:21 -0700 (PDT)
X-Received: by 2002:a05:7301:688:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-303982bf6a8mr2162170eec.11.1778851401285;
        Fri, 15 May 2026 06:23:21 -0700 (PDT)
Received: from [10.110.108.188] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm6771472eec.23.2026.05.15.06.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:23:20 -0700 (PDT)
Message-ID: <56f5e73b-5f40-4bfb-9796-dadfcb4f9085@oss.qualcomm.com>
Date: Fri, 15 May 2026 21:23:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com>
 <20260514-clever-apricot-goose-acc827@quoll>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260514-clever-apricot-goose-acc827@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNiBTYWx0ZWRfX5x5jSb8FbkD0
 h18/ksirfub5fFnhf6R41/w9tvB/IJ7Q9Q3kldchZu3n4llT9sKUgyEw+xibujf3LuKvwXK6iMd
 jfEzE8d0Rctx2aXR+2bSsNq4rNd8jzk30KzhSRpuN35sDiLhW9Rm0BEHYze6f+SLT+/OSQprO1t
 PcqoBVV8hirM1p3NGKNhBzF1ZxOIPhjL5hiaqVow0Maf/1uxg2ERE6dGxEQ3CIxRbh4AhXomSop
 7rigmaI4LU8+ZouqrUlZHALRds7gi+Kwyvq3xe5gAlIdOiX54oSnSeh7qPqr02tQcDr/Us0rYLu
 Mwfk2cTI0LkntgXdZnDpSLCM69U9jk2D4lZxwQKuyS/4hc/Il3G4C5goma2v401yT27mHm9Tdea
 rm6bSc6VOOiUquMfzVkw8WhKabw/vXEPMuP7BtUnYufq1nL5ZFSpcGk1vD1ru50x6gaRfgfV1/i
 oXvLbRu3otJKqbt2oeA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a071e4a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1_zi5yXmVb3nt7myx10A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NgyAs_aVktYo1vj5s6NQWTzArVfilvSD
X-Proofpoint-ORIG-GUID: NgyAs_aVktYo1vj5s6NQWTzArVfilvSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150136
X-Rspamd-Queue-Id: C1F045507D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107921-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 8:55 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 08:37:48PM -0700, Linlin Zhang wrote:
>> On sa8255p, resources such as PHY, clocks, regulators, and resets are
>> managed by remote firmware via the SCMI power protocol. As a result, the
>> ICE driver cannot directly access clocks and must instead use power-domains
>> to request resource configuration.
> 
> Then how can it be compatible with qcom,inline-crypto-engine?

Thanks for the review.

You are right that the SCMI-based implementation differs from the
traditional inline crypto engine in terms of resource control. On
sa8255p, clocks and other resources are managed by remote firmware
via SCMI, so the driver does not directly control these resources
and instead relies on power domains.

Given this difference, the SCMI variant does not match the same
programming model as the existing qcom,inline-crypto-engine
implementation. Using it as a generic fallback is therefore not
appropriate, as the generic compatible implies that the device can
be handled equivalently by the same driver assumptions, which is
not the case here.

I will rework the bindings to:
  - introduce a separate binding for the SCMI-based variant, and
  - drop the generic fallback compatible string.

This should align better with other SCMI-based bindings and avoid
overloading the meaning of the generic compatible.

Thanks for pointing this out.

> 
>>
>> Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
>> optional for platforms that use power-domains instead.
>>
>> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
>> ---
>>  .../crypto/qcom,inline-crypto-engine.yaml     | 27 ++++++++++++++++++-
>>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> So this is v2? But previous was v6? Look:
> 
> b4 diff '20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com'
> Looking up https://lore.kernel.org/all/20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com/
> Grabbing thread from lore.kernel.org/all/20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 8 messages in the thread
> Could not find lower series to compare against.

This patch was review internally, and the final version was v6 which is
approved for posting to upstream review. I'm sorry that I forgot update
the version to v1 when I posted this patch to https://lore.kernel.org/.
This is why you see the previous was v6.

I updated the patch to v2 (this is current patchset) with some changes.

Would you please help instruct me how to fix it? need I re-post the patch
serial from v1?

> 
> 
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index 876bf90ed96e..4e7d9111d0eb 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> 
> This should go to its own binding file just like in all other
> SCMI-variant cases. And if you looked how these other files are done,
> you would see my complains already that generic fallback is most likely
> wrong.
> 
> Otherwise explain me what the generic fallback means here and how is it
> supposed to work?

ACK. I'll separate the binding and remove the generic fallback.

> 
> Best regards,
> Krzysztof
> 


