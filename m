Return-Path: <linux-arm-msm+bounces-109648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJZICfA+FGq6LAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:22:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B30995CA66B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27B1530054D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AD43812D2;
	Mon, 25 May 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4yopz51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZWtqNJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8733603D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711726; cv=none; b=NRJ5Byu9a1ZsC7Md9FkXEo/29UuEROrQbL6Jlc18yIU2xTRDSXKLd8tJLoKwxrVxJ3U+G8P2mIHSeMf4wyIZf7+Tkn5rNOhjtcLfd7567NK3IC0hwRE4hk6fhkmeGzkov09eZham+MDcEohhx6V6pa7bnq744sOzK+aG0buWl38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711726; c=relaxed/simple;
	bh=2btaEAsFIeOo4Dk/9XtErvOk/K+pyuYcCLZyVtuxDsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAXyb/HG5XgyRw36Prl13GGY5NJumeGTJYyli3Hb9+G6KPlmZJZ1iLSUE29s1boFo6DiiQHDumSphO3eDyTLyi9S/rnk4UjfI+bXC6nTr35YD5R3/TFnenzcjbvJvB41NQvTRCLZvGvQ3uQCtoccKZTHgYrF3YDWzGOp7CtBTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4yopz51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZWtqNJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P8xYge1381700
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=; b=A4yopz51ba7eIhUh
	+zlCY2Fd3QHnGDMa8jD6QDcyTgmmPXGhjIOPBjQKjbIL0BJI6YC6Qc32NcSIS9KI
	5BZflMKAgN76ePJ/RXH33YWiTh2b6k7xGhkD8EDgVila4miqmHIaqm/BFlVkOJNH
	LGRQHmwNotcy1+cZK5apMXSO6LEuMem43wO6rUsDFgESAdX7DhrHoAQoWsmMzoad
	1FBrdPjlV0rjrxdHEPaSlKW3aGfSD9DYyjwXDn7cBVqHx3OckuxhYh097K1c91d2
	ut9AOnoUN6TdLX9M9J4q0NqJ1ef5AXgVwMh2d1wEoIvdBbNsI/2kyLfkrXyzviI5
	7wR1UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3ej09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:22:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cd650fc2so11171911cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779711723; x=1780316523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=;
        b=jZWtqNJIy0y9UrG/msCNbVjnkLsIvJWR0tF5dW6BqGru+9Xi4gHjXZbxeZAq0+n3Dr
         bjpdqHJWUm30bC0C6nRs958wtAAB9Ho9+wa4ZAcv/lF7Yfu4X/Cg0p7i/+a60hQIiZEp
         p/jObsqxkn9otynVVyUx+PT4c+GyySsulBoe9/QsraVvgMwUy9zb009xlXG0eVdIQ0hf
         R47AwMwCFcUxWqJUCSoNxcscLK89N6ECJ9nZYtYUs4kAx/RkANwsubnRC4Bv5YDFsKpP
         TsSyMB+OSYXB8Y9j5uOQUs1Yi44YaWRTNt4lWaaMbJCpEHR44RQV/guDNHzEC6LcBV9V
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711723; x=1780316523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=;
        b=je7XayGR8eFKxXLMvlJnxSr4idE205EuFr966W45YwqmI895WX9tktlRloieNP+oKu
         HEFhj+B8HQtK9anb+H+eK9Fc9V7oUN+0GETU/mC3mYbnBXhAOaEwfuJdO64POT424qkG
         BCkk7SszhnvqLmJRVLr4ccCBjcUC0c/WtjwHc5JCydBwhkXWJmZpvqwKYOS5NQeC9SeJ
         hL4qraK8KsXQcVLqvGqRuLZyonUhEFbf8SEyvcuHPV6hNn8437p1bIjTqng8Ks2TLHpi
         376d36GfdmlrzNI9ipybwgIvM/xlrnR0f+EKZPRPp+bENP+HMaSitt7YBFF279bb60WN
         Em2Q==
X-Gm-Message-State: AOJu0Yxr77f9x5tcJLlwOrmenygEaDpRwaPacizDB9LRSGH2hi1F9j6x
	rofzOVVsEAkdMswKP9rKLXD+LwjjvBczPCzpOAUanC0Uvdh54X6oQpQ/vEQtDZn0dzOOfOUTpbB
	IymzeTXBiBogMFojIS2esNnFvZhgLqurL2pPPDmQ/AW1luN2nCD+m7K1jB32l+mBpk4eH
X-Gm-Gg: Acq92OH1P/fv9dpRhhsBDjOf4p47iJaUrUquL/DK0vMX0XC7ynQL9VeIOYvo9OMQWle
	qYlwmxlwdmvuf1l7tv0y3rTaowxhYoN/nmYYNQRS8fMwj8lKUMT3lguyaTMccZZuBpkdW/5FJtA
	Gqg61ngIJEJJQ3xhEXRNmhf2iq3nkLd+icKS/uOpJdYCBK90UB+HlXqsCzHsC+RMcX9vqS5Cx0V
	4iSoegQ0OxMx0R9ACqjQjCbiUb0WgQup59EBih1dGAeqXbxNteejhNjImjkRRm7/zhrDmNL+IBQ
	M0by+K1VRoCb0RfrlROuzSqaTgvdhXAoLWyDPO8Rk3m2E3z4SPXtJPyeGXkdt5Ta/IAv00c0IIL
	n4czGoO6yETrL0GiLy47C4i1g/n0sJ1hS54ZVfzm2tYypkQ==
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr153486501cf.7.1779711723187;
        Mon, 25 May 2026 05:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr153486101cf.7.1779711722779;
        Mon, 25 May 2026 05:22:02 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eced0asm396478166b.39.2026.05.25.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:22:01 -0700 (PDT)
Message-ID: <73e7ea01-d0d4-4ea2-8157-f2f699d64c4d@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:21:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BX-lOPvDU4E6OmXdW4vkhNwlY9jlh5PQ
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a143eec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AL6Zp-OlWJ-5pd4xuMwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyNyBTYWx0ZWRfX/XPIH2XmPvJQ
 T7jCGB1lvHGrG4/Pgbz/ksY9OdPPHXi2loC3jr3B9bilU1G5B1W7HXgoroFK+VCdr42Q79BG+Lg
 U5IG07Xhq3WwqZzjH3nBri4Xx52ll4wJvqXXwHxbrw/up9GY2X3DoUmdzoAmhE2uorVA4ZgVzxc
 dBgpNmEkr6339Y2orRQe+r7nOfRdmL8tFQn6857aO8M1+4pwIl0a7YyZgtroW6figwjz9gp0En3
 qYcF6z+8AEPjthu6JWDN5jWIZ0AVsAo5FfPDxcY0QnS4mgnDuXvQa/JTx2Tzcqpg/iw0hk+hN1w
 BPVg7i1gxIRP/ZpqovrWP1DVFOp4RDzZQlXb3F2PXNtw376ThRogGUrqUwnnL23dKwAvSkA/K2y
 04c/6/7at97muXzVbcsL44p+0lfKxx1UCd7pK3d2OaqTepdB3UoSP66OR6hBThvqO5X5PZRW1VY
 XmLXgomv4Cjbk+W0y/Q==
X-Proofpoint-GUID: BX-lOPvDU4E6OmXdW4vkhNwlY9jlh5PQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109648-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B30995CA66B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 8:03 PM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> Qualcomm Shikra SoC.
> 
> The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
> L3 providers, but supports only up to 12 frequency lookup table entries.
> Reading beyond the supported LUT entries can expose incorrect frequencies.
> Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
> existing EPSS configuration with appropriate LUT entries limit.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

