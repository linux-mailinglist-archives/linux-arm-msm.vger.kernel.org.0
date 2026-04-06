Return-Path: <linux-arm-msm+bounces-101933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNOFOvt102mjiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:59:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC13A2662
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 014583016521
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 08:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C462E3148D9;
	Mon,  6 Apr 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf7jhBWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJu60Flk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B931987D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775465974; cv=none; b=kqWQx2oPVDllCEH6aTzbBvW5qOcE75ndDvcf7OmfmoNHY+bvJ9Tf8HLy6SpX2+14TFC2T/oQfLfRphZWXdBv6Krm6CSiU5gra3zwkLPqjCLSIU9rz5Xvkqz8K6znbwkpks0E7ejP5AVS1YRNBOtzvOiR680AhzVDu4fdRrPobs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775465974; c=relaxed/simple;
	bh=BrcVfbLNxhMfWFJdUk7YBXP6HNG08kaECFRtSb+MLrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UU199x6nSEfYMhELm2aoledgT+vYd+wSRynG4nXDj1OzbBzomQ5y0imaeAmwZTTR0TPsrIeayqPX5a79nc3zPH0qxOMu8MjPOcZfuJZ7H6Kw4KKwJLOP8j975Ef9KYvVOnsFeOmmKcgjlj7LRLbsmjQj1C/j5+ouBxMahvWKCxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uf7jhBWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJu60Flk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6363bljb1017627
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 08:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUuQJyQWeCMv2lcP2Rhjh82ZK23+I0twqK0B0ISiMFU=; b=Uf7jhBWcS1m0c0fJ
	yFlq+FWFksjVKVFL+ZUXH7Wo6ttRrFZE7flKHGjfSaCLRKSODzOT+tHHQfgEMZu9
	/mT8eM3EBRff1AIqH4ghH7z5S0oAjNlRGem5XbOfl9LquafalQxmibYnjf+7v+C2
	Py5gEQn5UcIEAn3qEb1th+VbSggjaehJoyY4rpx+6edRO/FCgadw5G/bk3/hnpLM
	XqpZiZNihO/LJnwsyzz+OUFGbpOjp96Vwvsx15ZNe5xSWeXUB2xo79bjeGHw3l8k
	U+o+ec66ngajYen/HDQvx1ZjKj7ewXBm1cDHbwZb3tj8Z4HhP1BNNcPWaGqW/41p
	BZP1vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7ucjw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 08:59:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da37203d2so8622104a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775465971; x=1776070771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUuQJyQWeCMv2lcP2Rhjh82ZK23+I0twqK0B0ISiMFU=;
        b=kJu60Flk5Fd/J14JHZ+OAQONfpwDCEkxH66xJObZPRscDQhVlthpO68OzXq09T79ST
         7F+bekbUUBb2b9pTCnSJ4mBSvupMB1CL1OnUHvGiu3Fmkd4bdh5U34B7+U3RgQPo5bBw
         FUMa5u4OkAa9xvRDBQ7T1/oSSjsgx0dI8VrV6rupeLTjTRS65odkeDZBoHv+T2hLaHNz
         raIf9f84ZVxjqzdQnyYQnWaL69GVYxe8odLEtpk2PEcwuUeBewDSv7fnSxrmwdaOnTzU
         9fGKqpYPpCxYRliOSiZW55K8U5yH/xRthAhmd5FAd/TF9oQLv+U3tWefs8lA8dS7B5Zz
         CZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775465971; x=1776070771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUuQJyQWeCMv2lcP2Rhjh82ZK23+I0twqK0B0ISiMFU=;
        b=i+EX7b6IoopHFAGjC+8yJ9Dn8dsH2oPUONw4ik1lMhg1Z4BxelaDaKccjKPG0vPKEe
         a8DC4h02sQq3e5hYTxjGT6Ef6hXudPZGL9DwXvociolKHYg9P8uuCHBgYFjjv41lb87t
         BsWGEHvd741AZILvCPyttlqtIE4+h0HCwpyohtIjz/Wlru4R+itgPokZqL2UsRtoie31
         ReqYz6pZLZcEUwkrNCkAO6vKcBkO7vfr0UtvHwvuKwgHgDiEPXEk/L7d1qROroWdq9oh
         /W9ttNsm89vnZYv/di2CzkAqTGCryEkJzla2R+Fee82PIp3h1meUAqYQlxptz2j88vH9
         sakg==
X-Forwarded-Encrypted: i=1; AJvYcCVwchOu+Cpy4W4bDP+zCRj+2DzrOFsTRU2eHBciRr9TwKBTOiaXm+y6BRIngqwmSyIo8ScfG7ZRjG9e3qbv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUklu32YhHwQaD316MNkFeWHUpyEqCjwckWUweP+l3LpP0FfcI
	MDevZ6+YtKeu2MqhNusi3n5h6EjqwTmDHypW4y5bQ19LKpTYyv5D+y6TNm3KXwQwUpxZ3ehS6jk
	GLFINocak5RiJdfH30lObDi/FEqA58SCRyhb2FpqUwspKTV8jlDRREg3YkY9XyNUp8TL+eDSqUN
	36
X-Gm-Gg: AeBDieuNZUq8Ne76d3YwTe5niiDevkNh/WiFFUfAT/LH8Il3ZeJltySlwQNsoJAnurB
	ScpliVyx2LkCeRU7WeY3/c62Kga5gvaDhrPIbAKjD9IGfEtbJOHvKqRguwK6XwZjubNsfvjH8pl
	NN15F1CDA4MVJK9U+EOXSf7kQEYLtqKFRYJZsFA1+rtrXuCZJF5C+1vEzWwRuMBa3+goYmeSKDC
	sso/VAI7C5idpyncKdMjOf8mXDhb3N2JYrmCjbjK0o3WxEK0aQn01ar76kXz34MR4+Jr49Kdp+l
	vCm9/Haniep45qOgsHFVGQ5bUZD3kMNsHuxTiNRJrK8wHxtN+hIhvmH81vqBtHM3wNC3PU3ZK/7
	i/lQUPtNbIKjkzpStnKzq2X2rzMTiZK+U7rTGirI5HWGJtNK5rATs
X-Received: by 2002:a17:90b:350e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35de691ac13mr11912810a91.16.1775465971033;
        Mon, 06 Apr 2026 01:59:31 -0700 (PDT)
X-Received: by 2002:a17:90b:350e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35de691ac13mr11912785a91.16.1775465970588;
        Mon, 06 Apr 2026 01:59:30 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35ddb973ffasm11945602a91.2.2026.04.06.01.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:59:30 -0700 (PDT)
Message-ID: <8e42c7d9-d96a-4e73-abbc-443cf131c176@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:29:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Document the Milos
 crypto engine
To: Alexander Koskovich <akoskovich@pm.me>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
 <20260405-milos-qce-v1-1-6996fb0b8a9c@pm.me>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260405-milos-qce-v1-1-6996fb0b8a9c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4NiBTYWx0ZWRfX2kD1n+QwrcA5
 rae6QYI0iAhCVZdQnhNyyPixAvRC3kzzkEZT+oixdF4Y6N7a+9EX9YO/v+uynCoDF6MLvxUFAzp
 yQOJ+4KZyPP+HC4duCyEgpiZYnQ/pEp36bCPM9NZFllaaj5G0sV0o/yz0aqOraYIgucp7KLjUxw
 J0gJusLVCrb9YmiAvZPNDp0d16OnRPITc4OQS8x0MRlQJCOFrxd7QSg4J2yJtqZGR917WBGiU/V
 9F8UyZXlx0kTbmH2SpKPcY8bZt5A76CyNg55xzc/GrG0KqF3oKy39LyD5fIGuQDPcLfq+Zv+sWi
 syUVSR+DFNRVjK348WhjfEEnZYQTSEE5tc5KeoAlIjF6/kaDPI68rcmOCH4qCrdIKp71FTmAQt/
 xbs9hlQEsc+OmtJ7KBLfXcNEkjolavVPcYz+CGORZg817hQhe4n+NAFUC8LxN14z7VezJlm43EY
 jCX6tdJ4p36xfcqQAqQ==
X-Proofpoint-GUID: FL1lz61K2OHjeir4bdsMC8pR42b7l-Kt
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d375f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ocJNlaTN9KdHZx8uEnYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FL1lz61K2OHjeir4bdsMC8pR42b7l-Kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101933-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[pm.me,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95CC13A2662
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/2026 7:40 AM, Alexander Koskovich wrote:
> Document the crypto engine on the Milos platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


