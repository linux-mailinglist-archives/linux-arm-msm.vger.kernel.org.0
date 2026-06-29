Return-Path: <linux-arm-msm+bounces-115173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMM5FAWGQmpt9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:49:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB06DC460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SZt7ntB3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OQ4r4K1K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C12C6307D7D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230C53E0C44;
	Mon, 29 Jun 2026 14:41:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21D3B6366
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:41:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744071; cv=none; b=hoVTj7/Nj4N4pySIAvqkEzgakJrGQnxeuwFL+4LI3IlNNcIELgwUWxHtT5yz74Nbiev7c8pqpD62vAcSYsL+e4GxYED9xA2zsRU6dqztQtC3/ahvwpxt4fqzuYDFmMgqESxcZnjc5lYQ8oQnwtGdGFxqPd+8Vm41WCoOFxxTin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744071; c=relaxed/simple;
	bh=zjwRCOleLOc/aa7QhScW/iZmDl7IVYNpFmmX2d/CwPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umb7CS7SCZRIrtsUslcpOgZMH75NnqQ42+dxHpxYuCgdvVQa8NvMeF6phPyv7Cid7WeBH7h3RPWMqFPs79i4Y98wGRpqH0v+QXpZSJePiVcdMHDty5Ppb2X+dI4qqVEFV7erfAPK6pFwT2VVgIODJKeNq7p/T4jpwDiYZ+dd8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZt7ntB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQ4r4K1K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATXlb2628519
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23JIWeyj5zcJAjKuALJwskbvtpgcoGyXvoa7QrCnhHI=; b=SZt7ntB3gs39rRbK
	n1kgIs8cZ2FKGZP0W9cFR5/hOijWDiGjjCPRFQr0DmTRk8DUU5/YwSkjz/ZNkMU+
	q4iu8uFtN9NMaQ7MUAEn1wRpI/EiKaDTEMq8F7r0KyXUPlkNhNIdPLIHq/z5blrV
	fhfhcfroFFlD5nwenjMbEAhJxFL7oXINIbZ3cTX5rQB2tRdvpTHzKh1wRWw1x5OF
	xbIHudiT0oVrkz9ts1o0SgJmyrD1Xv5yRbpvbeMGK1/kBK6DhbRCIHcMhpnn7QKR
	IcBnnq3Mc6M7KbpSi+Q7WMFFaF5GMXPJUXz74BHQ/1Ovj/YG2e8DEXgbbMp+O13m
	i+3Mhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgsd9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:41:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92c326f6e7aso82468185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744068; x=1783348868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23JIWeyj5zcJAjKuALJwskbvtpgcoGyXvoa7QrCnhHI=;
        b=OQ4r4K1KN01hKoFmwj875Zy+XxnBiCj2SHjh68iYC5fWPu2mv36SxZdnI3ngAIyTMm
         oCbGrwViBCoYE0cVtc8dCu5AExv0MeAoU7YPfsT1WmDhHijOchIX6FLHOoJxmYrFVZqN
         jxDr3sXHWf0f9h0BWcwTSAGH3JeXg6cOHYZFXgfgoEm2e8p+VgF6gopBv+B1LeYBWcoV
         Lsj4tKWfWrvuzBow5H8OAn+14BajNr/lOhsCRtHONf9smVZSgcXyFpPg6GD1Vl8KSYAd
         yCYqq4E68C5WYBZlbVfAkqZdGX1JCJ2DZsJCOF5zR4L/QHNplEpWI9Vc7rNEubuFDbqd
         dmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744068; x=1783348868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23JIWeyj5zcJAjKuALJwskbvtpgcoGyXvoa7QrCnhHI=;
        b=TsbhdnAZEvFiCO2obGneiXxpmhPRxIUTV/eQUwMxI5Qxr/QHYe9h3hm2jTVxvVhcOG
         Bpd/6b2phA4jIteJNRXg5FrBGmwfBCDicZ7OyDLhw38JCiE70fvpy7Krg2nbWE9L1A21
         2Y02oBllFQjGXTCS6uFYb16C5vdgZ949icm9/s2c30/XbuRs7oS2+KSRpD5XyYoZs6Re
         H00miuYM2FAmYKWDhQcCpvBVzoT+tsaY822zgez6/B0dzvgwjxxB386KUM7h3p6cEGb4
         3ObPcSmyE3Spw6oKniezA7xMXfQiAJZpoLvSLRzoxiRO/WBWRU64MUDeCkongCdS6g5g
         BAgA==
X-Gm-Message-State: AOJu0YzlHr2mUw6re7IYAPjXHZKwbo/3jaj5ZQI4/v1lSHQHOc2/8n/5
	wyIJMoO8iuptbD93zZOn9k+L2s8hFDvSvvvG0rB+DX2aMmukJqAckA8LW3V4GKibZN9p8dddQ/Z
	5linsmedT6gmeeEfsJe+uIh6ezi550qlLBT33ZR2J2QFE24jiE9C0tVO9reBTsoKc7K2k
X-Gm-Gg: AfdE7cn9ml5TpMajB6ZBe+/i1Zf20QimAbBHvP1peV4JDla261MfaNrM92r8IsdndGF
	4+OWrRuVS6iLA4wHLSsfwO1IaX1o/yb9dfzX5omjgSjCIdgoV3KryTaIW70QSfAzEPiqhNeqONs
	RiEy0M0ZJhfglAHu5KDVpLgEimOaqNE2OSqeS4gNawyWP7T5CTSPHgD/pnJ9FrDdDffxOhX+Vjj
	pTYS1H9TZQlIuRdO/Avws820Mh+oH36bo0pigM0/QegQJh0WviUfbIKtsD321rKbY3z4ZPApVdN
	NQgFptCQqss71UYfin6bo3bgSZR5BxyGdFVSQEDk7nQ6jZcj0GjFf8JsUZv4JVAJtd7aG50LOtu
	YqYnmUO3gDqZqrZ7ecn0JknjJJlpxS7m8Mgs=
X-Received: by 2002:ac8:5fc7:0:b0:51c:4fd:9a1f with SMTP id d75a77b69052e-51c04fda1c7mr18956211cf.0.1782744068185;
        Mon, 29 Jun 2026 07:41:08 -0700 (PDT)
X-Received: by 2002:ac8:5fc7:0:b0:51c:4fd:9a1f with SMTP id d75a77b69052e-51c04fda1c7mr18955731cf.0.1782744067384;
        Mon, 29 Jun 2026 07:41:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276ec6c96sm108700066b.43.2026.06.29.07.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:41:06 -0700 (PDT)
Message-ID: <a26881da-b5da-4d74-9d48-54dbaba1c25b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:41:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-9-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-9-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kMY3qL_j3kdJ4mxuZFZTtc4NLhVGYVC2
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a428404 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6o-Bo2YM3VKyGZF6QcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX/AS/PjmCJuR9
 hOCpx1/zOMMDLAbR9auWLCI/w6ZU1qFiOK2/Z9m9hhI+R0STTNeW1CyqVwl9gvGQusERA5ICJb4
 pESg1OQBev7htc23LW4/Ef8KzGh4G6Y=
X-Proofpoint-GUID: kMY3qL_j3kdJ4mxuZFZTtc4NLhVGYVC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7Ct0GZ6h9Iv/
 Zjr72Ww4ZN9IB5Hjqf/HbPG+dCbalaKVvK8PguaIKgGQ62mTV5msUQPGjv/XbiDAlAhtmwPJft8
 j+ofGy/8CUUl0xNiLe3+jVp180QmUszXZBbdYxa1M6szmRYgS9PD6DD/Payc8EeJsSLOSx/3zs1
 rfWPBIJ6Hn2//IjkkfF99Tv5Bcru/DaafzK9qFqQd+JccgfGj1YyQdMmFy1g2nxK6mVN8DCEGx/
 1OsWt8QsZ1zr1i9/qbPFUR4MP/B+X03FkXeQqBQRZjkPvo5wi4ggxCvrBHEy2lgZ8H4aoJ3ko/4
 oUcktk2utBdTqNYzW1YLWQMGEhhKRswIJrU5am5smQO/SVaVg7b7vdA17IJKef2z/9z1+OwFMVz
 dZ0BV6nfg8wETmo4oYX1ccFwyzG7NMsc/YoCXa3bvadKNNSqkQxLEitYRjLB/Wri1py79gesz5X
 zySvkE1jDqXjkeweZyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115173-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1FB06DC460

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> The shikra includes one TSENS instance, with a total of 14 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 120°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 110°C and critical trip at 115°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

