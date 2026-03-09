Return-Path: <linux-arm-msm+bounces-96266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML07CRLCrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E12392AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BA48301DC33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D2C2264A9;
	Mon,  9 Mar 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFTFkS4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8dfBwMP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B403BD625
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060622; cv=none; b=Ckbor2D/7owIMH4PF20kVg99dAxiYeCaMPfaEOKM3U4+IefPulue49qoyCmUcgKyInGatIHB7OLpedwr+UxQafcN5Epwv/KBnTjzaqU5akb6crLabfK9ki8oWFXcl+yyMYWrBi6si1eYGpeFnvEavR9L6m0SlPlANNilJlSUhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060622; c=relaxed/simple;
	bh=4jULtj9REnh5AmwKY5zTwWslZ8dxgKTzR+k6mD1vXAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKXBvb1FHL9GJ/TND6lYj+x+NaPEj9KSsUHszjB116uOVtv8ykc2kJRVOruQUMQe1D8rvzszSplDlGHRe/wZnBThdk7t0OO/cCCvi6mlo21sGB/1o+OHKxQN/oUAeZVDWM7RGIGWQweRtToA2Tt3w7zbf1gs9pSsFZPJ+p/m7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFTFkS4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8dfBwMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297naF81932586
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=; b=jFTFkS4vEM0vzqKN
	J+chGBygG3E/RHwNJ7eqFwJVZVrxOSodpQLS1mFM77AmK128gMC2kHqFsC750f0U
	+aCHVrge+Ow0bXYhbgTTVNSt0/TGroPrDRcEeKUY6jRKj+oyX9EWXWEhdpp2M26m
	0bMC4xs5EQMkzd3ZedE+57tPU08HKefriRajcs+A1AsmTuw+YgE1yqby1Kqwemvx
	J6Dh1GNZ9cYqIsUfPiAbziASJ1DB4ntTZap6OEMgs6g4Jstu7gMMe+5/qKJ68CX8
	tFaXoKUp6+d1NEmlItbd5vJ5W+2gNuYpdoFfFd2qlSPo/PA6Io/UwFdDxGuuOFbv
	72ImZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9d84k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so765029385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060619; x=1773665419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=;
        b=P8dfBwMPJCbgAtiVWBX5QJ0007Pdmy63C6QZKyVWUcHygwF0g2D0/zzxyv3BbkHrTC
         IVgaxkL5q9N5JPHP3nj2EQszMW1beDpDH0MGpgHgM3CVtGmT/aXokT63ugyKwUQ2ZIW8
         6ZCSWkijuMjJRli4lv7akX+c1EIGKILRAlI1zZJoRhPNHKQUIEIeJUXvHirhUfyRacCt
         LHWIQRxayLCogqvGBwWiuu1Ub4Z8/sq2Onv2RwpzduHqEV6RLnrMvSkt7RAD1Ri0Dyxs
         xuj7k8H0uyva3HPEQHi5/W5/zTWnTY1Qke9KQIr6Yvi3P8z1wwjmiv/KYW1qhmzqpEBs
         woJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060619; x=1773665419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=;
        b=iZDv44lHokMyhZFdSuFTKsr7kLhj6N6DRKZmMdHOGA05a6GsNLigQDrFzQeUjHKXky
         Vn0hqTO4Q9kAeIkclyccHlZMccLm075yCMwGrv0qfN/EoAumuBRwOK8Rn9JKjE6/6hH5
         u+mIXuiZrz8pyQaI6WnCpax4zcZs60f8n90gIo4h23P8s3N0f5aDB8v0MP5AocppCYGr
         wYQWdCJ686HluUiPaS/LBrlnUJA4uhL6WGsrljH3Y3HKWM/CUeq9ox11uJ8RXhzp88cb
         zhFTuQi58mQpriNjipYPK3/WGMCRMTiAfMMqaCFnyTpdtrOExB7JRST87+cF1Ss4sYIz
         yniA==
X-Gm-Message-State: AOJu0YyMAIwxplzzgGFzJOUTBATzd4cdmeWul5OmXy47GY/lcGzcX7UN
	n9pEQOA+yEA6RLzvig4nVIlZUOd06LBhe6hpOVOGc4e/uuqH4MRRzMlluNDXvSZMTW9VvwjXuf4
	X5bReruKJiK9UbiUUZIs19TLg+xwWCpq4BvZRphAuM8614ECN2PS3Q6+8oo58rOHA2dlL
X-Gm-Gg: ATEYQzxOTEgq6ps7mnhFcuLkMD6Bj3AouPdoqbo1gBx6bwBT/azxaqZ9YG9LKNvAZba
	Sr16Q2EiVpve0RB8KpBsVWt8UdE47u9O3WdaQ+TampOcJVlPwvA6R10nfnuAYQqKYfSG8ROkXKo
	ROiIGeU1pN4BumwmqMkXLl507S/tjSH1HJKcztto/SiEkvK8Bk6AJXWzreohv39uPQVWq1tWZfe
	wUnGeW60RWOl4hnssjO6cj3k0CDg9WASGGuY9kDQxLg8Noj3cExIA3ejbwtjexj7Bm+gxSIzvz3
	TybPDa2Drv9KIOzHOxlZJZV6ztfgmmCWctH7rE7rza4HaN3YJHt2D3LGjc3ckQUhRSvrypdx/Gm
	+oGOCXEBKUZCuq2wT+jYhRDjCQDLPanF5W4AgYK/gDHWqV8q4qx9Co+OJqqdz/CwILWP1onDYk5
	VCSzM=
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1066739085a.3.1773060619615;
        Mon, 09 Mar 2026 05:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1066736085a.3.1773060619163;
        Mon, 09 Mar 2026 05:50:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42addsm375925666b.14.2026.03.09.05.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:50:18 -0700 (PDT)
Message-ID: <7b085eb9-972b-49a2-9b82-25b76fd9ba6f@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: arm: qcom: Add Redmi 4A
To: Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-2-436f1f4b7399@mainlining.org>
 <e174b1ac-380a-41fc-a1c7-d522e8e75c70@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e174b1ac-380a-41fc-a1c7-d522e8e75c70@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNyBTYWx0ZWRfXznOHU8SO3eRV
 gKEA4tkBNhGIfNs3UD+SzaF93tY5ZyX+0V/j5b4fea8mz7Yly2Qyw+qvmZpnMwicsHVyf7zE2wp
 ozIl1ysIZptyaRu5i2pXh6HptAa8mBzsX3ZKIupPHiGzCplStGy9Rof7OQ34jcjVywGtilI0aCs
 HzRyrqEceBzwHt1BYonU9UirXXcAPcXq2iokhBsuu6GQZYIXsPwzImtEI4aul6xwNXzxt6d0Fwt
 aX6bdx6x72Ou9RHby6nO7RonNUbaruIDZJhi51YBGpl4HajO8NYM0J3huovcyPIHjYk3pKEi09N
 BTzsXMSEy3mck3ZMjYMf3xQbW1TL4uueQenRestnNWYEvtgzbRK/8OALZc1ipz04ObmEAtTUpBm
 Pycy3nV/IiD9nfzqovOyt6d+pEWeSP/FzK2lDPpx7FVMFCES6i9LRcVMvg9Y1cJZuTjn9LfcE2x
 ahlVlkDkhD55112X4OA==
X-Proofpoint-ORIG-GUID: YzVquf1EsQnEdJ58SK43bSqAxuwdt4ur
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69aec20c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=9Zh9aq47Bl5YVDQUYeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: YzVquf1EsQnEdJ58SK43bSqAxuwdt4ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090117
X-Rspamd-Queue-Id: 938E12392AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-96266-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 11:57 AM, Krzysztof Kozlowski wrote:
> On 05/03/2026 18:28, Barnabás Czémán wrote:
>> Add Redmi 4A (rolex).
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Do not Cc linux@mainlining.org. It causes multiple bounces and is not
> even necessary. It's some distribution list only growing the CC list
> negatively affecting spam scores of sending patches.

Custom mailing lists are great for keeping track of patches within a
team or otherwise a group of people. They definitely shouldn't bounce
though.

Konrad

