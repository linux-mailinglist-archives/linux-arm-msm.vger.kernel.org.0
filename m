Return-Path: <linux-arm-msm+bounces-114321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0aRHH2uO2r6bAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:16:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F76BD42D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JhAm8PuI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=baVaFoS4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114321-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114321-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D82CB300620C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E9678F29;
	Wed, 24 Jun 2026 10:16:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA917A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296181; cv=none; b=F49zDjt4DU8s4yGzZVr18DJPnnAvTsgigwZWZgHcuJC1epKOctLp5eMFqA7ssA0Vw37LGP5oYysV5Hn8EpSSKS6QPunQqvjKIEfLDQCj/StrJhtfHDUt97W/0yJADzab15eIQQMhpfA8lw9t9PfzFSwwjgD3fMhqcrX0Wm/90YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296181; c=relaxed/simple;
	bh=BzEk29JGiWKkaiyVUQyQsqDYy9jEYo/hDm64CTzoK7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4DFqcg4zEbTsxnkpYBKMkv8pibz9lXZMA1R/lK0sqfn76jZqLDiYzcrNLHF1+5P/r93J1rhjt0ITuhCjnn0svP8e3rz22Yd73pk2qW3YLcDD5qxdKWnm6BZdblc5dfVCMJG7+39L/FFqjfC9AypsqXPymTBnCnLLZIWlhiSUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhAm8PuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baVaFoS4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uEvF2555759
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=; b=JhAm8PuIimzxY4nu
	GS2uhlEEqb2Yjm5SVwjENCRXTqJ/Hsxk7kwOE2TCIawEs2ZAJaYTY2G9lHJ+PAPS
	v/QgCKobCRLv5Awdw8sR9RW60OIpxId1HT5oP4DQk7MVcxQAyDvoYMOd87q7sEIK
	E9rfyrhIgKlYgWGtVyaXVV2y9iB7FsKh787wUXCp9lkhwaaz4/39GSLND5VyN8eK
	HsdDu6w2ET6R549FobBtKP+s9gf40Tl+AZIjlUv5dZhYLhGkZvz73cYp8s6Qyij4
	nwiYOl8TFNkGmFA4kAP+8fKiWjSoVGouTaQcVJuQ28FRlR5z102xHBWEki25THSV
	Efy52w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996h2dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:16:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32faa62so13536735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782296173; x=1782900973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=;
        b=baVaFoS47oL41AXMYtnaMSH/mxk32DJvzuQQbHbWL9gBMMGEExQRZogDX1HazteXxJ
         tAq44WLta1FHxhpvQKprcaD2l6hAtLUFqyP8WHYkn2ijC/OFRjjKA6fWxqr5RR0mvsyW
         l0ggRqfydGC41m0bUdOgzmSOcQHe8ww73T+kjDWtQAiFwz13TpdT0p6Kjxs6FFhuNAu1
         ZwfpesPp5dWfX9zQdejCxuk7iAFQq++bkU1LmkjgAD2cBHjXNCLGaJI5hwAJ0m09bzHk
         gBSfneWCZQmIfV9FBGEJgNyXyY7h4JiEyOIpYK+8OCWxg00w8qNkvhC9525i2M9hu4C/
         yZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782296173; x=1782900973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=;
        b=Ym+rhFqTKRLtB2K4k9LN9UX9bM4PLLir+pdSEuoDmXpTMs3WAFPbZuNZecqgwf30Bu
         Wy5n5R42LcR9JHMBwEHJDV/+EY+fNiIlj2AGMDLWzPEwBRzBxzVMfPtIgIpYXynwBAXe
         n2pG+7M3og4OpHyzacAzxjUEPF7h4wqQkwRQERwxDScEoS845txzN/ReOhpcUoNG4LCs
         jhXr62g7KUJTm4rqA1j4s84QA09qyNJqFoXHoFFrJUyy6ZG1v0Fuzb9VI/9t0HO7g8hw
         N8O2GyNZPl6HdaV8eF8sWG0MNrDE9ph3MZPh2AJpmzp/SakQ1gIa6it5xTYeTtXGvvif
         VY8A==
X-Forwarded-Encrypted: i=1; AHgh+RrazbVUQWxFGzTHwUIGziMThbeFVot4mgAUd+TwGXbf+uccldgD7Gf40usDpCfp/PwsyLmwmWSKnMYpIngu@vger.kernel.org
X-Gm-Message-State: AOJu0YyYU/bvlf2Qowa6hGtEXSumHD4gfE82LV1GzWty0fhs/x7p1xJg
	bkyor9CJvbPYDu3ZDu/HAL3zy7JF3FjpZ6ex/mS3xcVpRJc/wH2nkki9nHLnzodiJP+zPQcMtli
	YhfEWIKXJZDL4MQqMTN/aewjr94WpiXtLnm8H3mLhJ2ECvrycC3VtvZEWQ+yKWfLqyJaT
X-Gm-Gg: AfdE7cnC94bBeodZTb61zO1ZmVEJs1XFwjGIh1poMEXlHQsYyVc4UW8NPzr9cwIM9vB
	SlKkE2lYBpQ0CwQCDunsqrHWv8OBGiYYjSgKHeOl/POFa+ZtTYbFjjDZMm7NLoEU5Z8UP/Av2RD
	7IUEkw764iWyTXiW5Eusd130zBSLd0KZIH6x6OrUxhiVJCFc7/7fqN74uTmqHLDU6lLepemQujh
	BwK0V9qpVLNktfmy2P9ICIhB+EIcRNGGczyx/gl5JTGwvYpwZWy1wG7NpgdmsAtSJdnPU/MDbd4
	2huXF8ax2ef/hWIz3eEcoP1pWO3SPtRtJjzPYcgSF0bzk780M3TGs1NwgGScMSy47/rni0aih4+
	T20sG8dIm3HDBRH98T2I9ZgsnSI+bB8xyp2SViyk2JPSDbCcrXo6mwT7bkPPwstV6m4/NIKFJHA
	A0
X-Received: by 2002:a17:903:1b03:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c7c772e013mr70238355ad.37.1782296173428;
        Wed, 24 Jun 2026 03:16:13 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c7c772e013mr70237995ad.37.1782296173004;
        Wed, 24 Jun 2026 03:16:13 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7ee339400sm4026735ad.33.2026.06.24.03.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 03:16:12 -0700 (PDT)
Message-ID: <50cef9ba-1a64-4079-b416-9b418486cbca@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 18:16:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>,
        quic_linchen@quicinc.com
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
 <7095f7ba-bacb-4d03-89cf-ed43882d8213@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <7095f7ba-bacb-4d03-89cf-ed43882d8213@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6hEw-KyVGB-Y0tkfBM2rc-ssqqwbsnHg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4NCBTYWx0ZWRfX/3YAwST5lNv/
 p/zowxt3EuJREedC5Tl6R3Ub66Ee+Di0H0LLg3NK9/R+oYLeYECYI4y7WBJ3W6atATDK2P6MvmY
 Fy8Z9E8giFHYcDxV3Xj+ZpPF5fQAdRM=
X-Proofpoint-ORIG-GUID: 6hEw-KyVGB-Y0tkfBM2rc-ssqqwbsnHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4NCBTYWx0ZWRfX49megqBY4HEr
 xBdumZsaIH+EnW2UDN3Q7/7rYvVG/4h6JqFnncTlpy6JqZOPDDmzysKe+BR0CAIqYV4azZtI9Nh
 e/FejuhArdT9ZOfiW0c6jnKILhwhgokIWgznYcRrhiWEHolGJPx+0pdC4MIrRKBWJ0PqxqsrZGy
 Sg4g8bmhRoKAc17HfQGLx/5adVhkIVGjWyw0DG8Z4XWrJuCJf+mkuVppBW5LeOuKykGUxzaqH1+
 39akPbAT0mO9V7RfFcmC6Ew3EnmZW/gTSLFQFlC9jyxNPFBh/JimPOxNAunIlmlo9YLQTnT9ikB
 /ph9LrkBjqyo6zJ0Lccy0lRgEwx4N7hEZt0Ub6EnFpPFMXw+AlPonpOxdlfcrOJXPCMH7cvlKaS
 cBW1mratRuvJklk3EI83P2JHukQI3A==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3bae6e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0nUQaeTidBPDXHyOA6wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114321-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:quic_kkumarcs@quicinc.com,m:quic_linchen@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A6F76BD42D



On 6/23/2026 7:31 PM, Andrew Lunn wrote:
> On Tue, Jun 23, 2026 at 05:42:34PM +0800, Jie Luo wrote:
>>
>>
>> On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>>>> Driver is not supported - in terms of how netdev understands supported
>>>> commitment - if maintainer does not care to receive the patches for its
>>>> code, so demote it to "maintained" to reflect true status.
>>>
>>> Maybe "Orphan" would be better, if the listed Maintainer is not doing
>>> any Maintainer work?
>>>
>>> 	   Andrew	   
>>
>> Hello Andrew, Krzysztof,
>> I will continue to maintain the listed drivers, so their status can
>> remain Supported.
> 
> Please understand that being a Maintainer requires that you respond to
> patches and questions about this driver, give Reviewed-by:, ask for
> patches to be changed etc. If you don't respond, ideally with 2 to 3
> days, the driver will be set to Orphaned.
> 
> If you want to maintain the Supported status, we can help you set up
> the needed CI system, and get it registered so it reports the results.
> 
>     Andrew

Thank you Andrew, Krzysztof, for the clarification on what "Supported"
status entails and for the offer to help with CI setup. I would very
much appreciate the community's help in getting the CI system set up
and registered for this driver. In the mean time we will also look at
resources internally within Qualcomm, to understand how to support
testing using kernelCI/netdevCI for IPQ SoC. This will help us test
the driver continuously as well.

I fully understand and accept the maintainer responsibilities for this
driver, and commit to the below:
- Responding to patches and questions in a timely manner.
- Providing review comments and requesting changes where appropriate,
  and providing Reviewed-by tags when needed.

I would also like to take a moment to provide an update on our current
efforts for IPQ SoC, if it can be of help. We have already re-started
our efforts for the drivers and are currently actively working to extend
the IPQ drivers to support more functionality and for newer SoC support
for same family. We plan to post these updates to the current drivers
once the review window reopens.

We feel maintaining the "Supported" status is appropriate and reflects
our genuine long-term commitment to IPQ SoC networking drivers in Linux
kernel. We request you to retain the current status for this driver if
acceptable.

Regarding the email ID change, we had attempted to rectify the
MAINTAINERS file a few months ago based on recommendation given
internally (please see below thread), however agree that such an update
in documentation is also required.

https://lore.kernel.org/all/20250903-maintainer_update-v1-1-2183fd2a3c44@oss.qualcomm.com/


