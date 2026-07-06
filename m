Return-Path: <linux-arm-msm+bounces-116625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JQmVNsY5S2qRNwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:14:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7F70C89E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oexoi/IK";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=imRtolRn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 289253008500
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2CB3BB11B;
	Mon,  6 Jul 2026 05:14:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1B22DB7AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 05:14:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314883; cv=none; b=SKmgEv7Y8HufSWN+hP7kyscS53VdeCPSG4OPSYwt3vtTOdaX0OcEaclXUP/Jo5akQt8sZ9skvS1r2SIZcchHEAIhG/OhJSQic3J7ZlfSLOe5K613HVAsvh8k5mW+Z9bihi4IWWxEEqujxbFvU9RBLg3hjOZTSeHn+aS3fKDTD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314883; c=relaxed/simple;
	bh=43ten+Gz/F2+MVp56/Q5AodSmF6Ff70fegkfs3rK5Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKUgd2Jr6aGcZLR9fpTegRENodGMea5TSt9mgbqcz2Y8fvsMaJUgHBGnM4gPSDkALibjkn1vFl1Z2FaPNCL1WfgPzSAeQGjDEMol7pXm4EQxT4eWTpfUfeGE/VMi2Y4AjZZMCUBfwC0l9/ObFspaYcu7kFuWmJz9zIXe2pW5iRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oexoi/IK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imRtolRn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dHq3402284
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 05:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=; b=oexoi/IKfP1qRu5K
	BlcxNHcj210n77IvNeQKzmT6enZEjddXuJqiG8DNsbmPhr98QhwgIaQGc8i0gA32
	n+b+6aVuVc3neYXustu21UlWfWiQvr/60lQBybn3ykVb5PVRRZK9Qm9Z5pBUq/qA
	oTSWicaKasaXsHvk2CD/Xr0n+7SFdXgb7xmXHYZY4vb1YQMvXCXVMc9x9NGUY1Jw
	D33spxKjKh3W2zvVoPkKCtXRTfNf68RoOTn1H0LCXC/G6rDXoxxtjtc3oe0+c08T
	DNuRgpX6e3zQoiqk+HDtxVMlm/XbllGei6GY1wS+rj51I9B1eUvtVrTwLDCaIzkw
	QfQtiA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgm9y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:14:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso2419921b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 22:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783314880; x=1783919680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=;
        b=imRtolRn/ILSsxiYCVNduscAn2eJv0H2FrX4qdusy24dvg5XeKDAwZ8cRSStofQajm
         7EH+635EO17FnaqP/N+y3XMAzmVOyRe8AcFg+pzyDvSkzAU7k95g4PeXqGm4nODtUlPf
         UBZqNts0ZC+1zaf8F+Ei4qr1C+ZvI5H2QgvnIpxHmYm7S5fmlDm35yVyXr1VqbrIrBu+
         fVCUjR7Ht0FZZROJ320CYWvpgli2e4kc3o3fP9W4ou1eyIvKMhkTg+0UrCZTBzzr4GYv
         L1V8JLlrpDBHVSKnLRP6V0fPntgx0jI66rWv4A5MRUmzWyu5cR/YReds5BhK4sVoWbMx
         T5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783314880; x=1783919680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=;
        b=Fm8yusGnnN2HopLteE1VgbuHSyoiwPhUmbktEnctwOJHtShjl3L1PpYQJsSNQnseE1
         4iCCaCeAQbKwsTQ/9H99Az8cwzaOBYNEhNyb4RqnnIyDqoRNHyCxmxXq4I5AJzUoSyTZ
         EJETqb/fmcPINXd1/3rHfbpEGApfn3uGUVJaGaXmV2t09HALdWG/kzn42MIgNMzOa7Xm
         G3Kkkl4ahXe705QJfZRB9NKGgzeipfmfZjzbrWQQJdCqoOkLgKTC/FkwFPg+jWsMaT1F
         3m8NmZuU9bJk1qxlHzrbj3laF/HIrV5gCMfUxaCrxcE6HUnMOJmqTJCRF3vLJdaPLIDj
         5oqg==
X-Forwarded-Encrypted: i=1; AHgh+RpKYUEs4HfI1eD6LcKevSiA95anwKTGNVO/x/ioq2+pmNtCNnV/xjEYWx20KHkGrmIdCzLO1Mw16ZI0pWKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oON2SskYDCDd0yXYYO4b59GOKjBnGE+WzRGRo3hj+xeHJscv
	zoRbf+RTQ1I2LIznQnb9oASus4vG+aJwrGtggu/lWJQjyrInfw2SEGGIRS6haRBa0jF9Qg20juN
	w8/hOgFGzQtoKyjwcd/rQsJ31uTEjqvtbcQEG4/gLMkAf+2dg6lnkauORl2+tSuNFWauR
X-Gm-Gg: AfdE7cnmxMrDisPA9IVNxRF9yFtfpolRNDAE6k7p+8gQLCzMYfiZrO3lWabNHa4kORQ
	v0L/TsOGF8N48E+t+OIq5tp5eZnnfkR51Nj3/OA+oeJYRI2O6P/Y8uuhiRi41HygUYbf10Z0HUl
	irCbumO6PqxqQVdwGC4LlnpBlppcoehBB4K+BcYcr5lZ7yTXKKBy+v7wuH1ka5JgXksadRRGiet
	NTwPAWk4+rENErFhQIcJmSzVRo6MKO1ivkwLlZdG0I18nOtfpmc8OdQWFGDQez2/TLo8bNKdKbx
	JiJPyTbZuypBbzlcvfU9dztmEpMZX29jMg3tAXy7AaKKxidS80DnUClx2BQYI+lWYnYvz6KmDR6
	NyqQINCRy/V1mehVbPVOzNo+/DS6qL3CdkMfcgJ77vLU=
X-Received: by 2002:a05:6a00:4294:b0:847:9268:d73f with SMTP id d2e1a72fcca58-847f6d5dfd5mr7123202b3a.9.1783314880425;
        Sun, 05 Jul 2026 22:14:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4294:b0:847:9268:d73f with SMTP id d2e1a72fcca58-847f6d5dfd5mr7123182b3a.9.1783314879970;
        Sun, 05 Jul 2026 22:14:39 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4986bsm3015278b3a.29.2026.07.05.22.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:14:39 -0700 (PDT)
Message-ID: <ecc468fe-5c19-40db-8df7-4c57183cfae6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:44:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
 <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
 <bb8f2283-93b6-4ea7-ada0-875778c89b3a@oss.qualcomm.com>
 <95251d7b-fcdb-40cf-aedd-a60773eb3136@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <95251d7b-fcdb-40cf-aedd-a60773eb3136@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfX41MAUwPphW9B
 8HPW0t/N8JeHQUp2I5FRyPxK8aK9KDRqCX2eaa66SXZ59inLp9l1bKyvBCNk3jynT5vXcdGsDqa
 3ID8xZbAWIj25eIWfqHuyrFEJL1yiMI=
X-Proofpoint-ORIG-GUID: 7NCZIL6c0cIBEOv_g75j_APJzHLwrHLv
X-Proofpoint-GUID: 7NCZIL6c0cIBEOv_g75j_APJzHLwrHLv
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b39c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dAOp68QCQ5i3jAq88wQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfX2RKCxaSLjVCu
 a6yfHBULq1I/bA9gkpoSie4TSP2BcXYRoEX/nPC7kYGCJ2o6UxftXn5ok3vuJUMGWW6o0Cs2Ufv
 q39RXwGU0gCuSaMkEO2pWKam8geFp9VOu7WGyjNSXSzFoxG2xrFoICbm6r0zWDY/YbOsrRl0CBI
 8G+b11lpDrNLuR5MmwAgktHaey7QDRXZQcZJlXcQCWbMoEgK3S0w6Q/VFgjJyY7/88DF06bYQCT
 jORjCQV2pqDzbhg3Jlkx12MuQf1qNZzg1a5V6j1SXCCtvmlTk7ZsyenlOVNZJLwsHx1QnacOTGX
 UhwzKdCNy95a0ikbcT/1yEIfoeybdGm++wUfsoggpEUnBjIBS2NxAUK9XVavH3KfZtr/8yKRLQl
 brcT1AeZHlla9Nn+6/j/Po8QEAVOrVSWeJpa6/8iPVWTHjd426qNn6oX5Gsg3ftWnmUUxd0o79b
 IFrddszGHMb0NQ5qdcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43A7F70C89E

> From that answer you should have understood there are no warnings to be
> fixed, no warnings to be mentioned, so that commit msg should have been
> fixed.

Sorry for inconvenience, seems i misunderstood your comment.
Let me update patchset again and repost.

-- 
Regards
Kuldeep


