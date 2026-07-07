Return-Path: <linux-arm-msm+bounces-117113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TTYBFhSHTGpSlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A87174E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RaEG282g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NUFWhOn9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117113-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117113-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDBD302BB90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A553546F7;
	Tue,  7 Jul 2026 04:56:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829836729A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:56:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400199; cv=none; b=tXkSy/KTY3QhcGqPW0CQJepHOi0n0/lAQvVIrR3Ig7lYPD7yyI+wtZMTQaP1O57cRHCZQwa3qBK6B3863SrU2QrVItlgvSekifn5XqDvNgxk/0bZa7plXW2YkXOQPvGbum7Km6H4IUIzgveWm5+C3NEd1jRfbjc4tCZ+MdSbkaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400199; c=relaxed/simple;
	bh=mlRumB9cj3I5e+lkTXBh8BkejiErVbUy+fnvn4ziiBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEizX9yLp64b0RjMQyg12IvgE9wahUy9dTlrbgc0JqoY6JGsRWDsb8hmjg7KBuS2PD7wMN58bargVFVdzPS/Gfk2MEE9e8qZy00f2UGq0AraI70qkRCQLqmzn1IniFHw/KS7+iok+f7OiAmjvOoLGVH7i5hMddfQKnk1eic/U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaEG282g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUFWhOn9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749W6W2631883
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=; b=RaEG282gCobcPoTv
	lXLDIX6vFMP/KmKGFQByZhfts6PobiV3iaE33+I15JI/xvYYRyXNvqqP+Upl4Dzs
	atcaT1PB1ZzqDQHOeq4rRAbYyY/+HrAB+z1LrD95r3r1AqiI5cRnR01O7TrC8Dz8
	fn/9JOZG6drPfbDp/+hpn/zJs9kMFYF/JsWaGrOopSufKMne3v4K2fGemvzKRlkH
	v/C8BcgtysaBAyrGqSiMRKpr4T1qb/8jcpYRXOSSUoash97rYsmKW+sTSyK0AN06
	N5enwb3omUlowcEImAC3u6O1hH2KrKya5S7Y7VfasiSrm8dMFTaofhEtMw50IWxD
	AxXOJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54j1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso50309045ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400195; x=1784004995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=NUFWhOn9kcNA0cTYU1w840fjCxKGgtvFMYKX6xOeJ441EcCewXmFStCYs85HMmswUK
         MbwlVfeuxxg3X7NKFjy7rLdflHJpUZ06YEr8ereb8LetftH6ihvcAnaBhGbrIDG56GKD
         /nsH1sULo8WIIu8gxc2u2ws1600NoH1VkJ0zlHho83sXtNFe4L5wG0jJ7dN7F8EJoDy+
         2uoWidodN+A78KDgwhYpDDPlBt/SI/yIpzfN1lf2aUGuCwiqXfuRpN35lE6agw2m6FSA
         dBhIIzuU7aEGgUIMQbNNgVQpfZUGtum366+HRkK1b2RwzqgTYKJJ8QYdf2ElrXxgdn5u
         EkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400195; x=1784004995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=pyNs8fOEpOxggtyvlehiMqbtCwE1meHmzwc1twi+0dmd3HSSlPcs2wx/4oVfvshGFH
         6BuvMfjk4ZRjco4Se3Kh5b0kQMAyFOpj/Gj0zcW+dVzP4l1MDE1WDD4pruY6NQRc/GNL
         +7dzKoOiPtOfTIiYEDokoHNWXDtH8cdjjJ7mbsfvi3NO7jMH0nSyllqeMzjuKNJzYko9
         RcNfGoIM45n4PslNLQWq1m804ixcv0omtjngNI+7O1DS3L0cJGLdcQ1vVtWT4EizautH
         ArGbEA9z2YWfPgNRp2KhtGmnJuGOOT+oh4NFxUTr1b3klrDaO4nCH20yR1pD6vipYDMN
         l2mg==
X-Forwarded-Encrypted: i=1; AHgh+RrgzG+CW5Fbl9M88UoxGUB6s3GtkQTjb+2xvzJpnRlXpoJsdOVHBqgHSEYAadVfBLYFhKoxn49DjoMj2W+m@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzYQzxNwTJqy12+H6uef5f8DVd89Yz5zfyJdk/BoF+WZlqifS
	AO37oJ1z0mepSn9WSwIaHXyxtXqA300mtitvDzAmiOe3ywfRhkli854YBqIdr81m3IVmizN3hlS
	Wpv8S3dTQccbyprt9vD2umDO9nARuvluIQXq04ZTwDULa0B03eGlE31o7AODKB0vhYLMD
X-Gm-Gg: AfdE7clXnWrgPaEMj0B83F1Bfvgw9eydqXeh7d0L0GFS3OxvwKhV4HO/2c6bBDOdY9c
	/C43UoW6IOsRJBqNlBYuJtPlRrUOkn6AIS8yg9TajqLTlrI9jlSLWoiJYi0ej7KiobFpc8i6jo3
	JNbRGq7jEBdomdD3a/lLuIfrDmXhpODB27/8VT7TdvsHTa7nqmrY3PBzZ+lvGHFPAYXn8R2MERW
	eQMDZgn4BZqTBl+Z4ujNeIHRk3QBwKf+yu+AkxQFebES9AlnTKvI5EhlgZedcMX1r2E7/QZEIEa
	vQMI3OCteHPwGy6g6N7lBkcZ5aCAs3pBDVc2BOJ6kz+9ZRXy/tlAnj45o0rXTNd2KHBLjuaLJ3s
	KB/HGY1YXIGeMn0r/kkzuwoKcygh8c/XFdRin27Y=
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39933125ad.2.1783400195618;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39932945ad.2.1783400195167;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm4515115ad.77.2026.07.06.21.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:34 -0700 (PDT)
Message-ID: <ca6149f9-d6a2-4dd5-972b-12999c7243c3@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Osj8PW_puLPeewHjINbsjAZJ0zivsaEn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfXziqCxRgtlql2
 3BOC5PMXl0YQcYJfhiOQVfG7nSlPFYYESmHDdppBCTKwl3//7RVulclbPIqEE8wYjDC5l/2IMni
 xhVzr481JLaEyqu6Q/RH1Cbv6s9rp2Q=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c8704 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kwMOkDkW8xLcxF6SdFYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX4iNLHan4P+Da
 lxif3lU6Hap2316nBqUSnJ8OHWRKb6LqTJlERAfEYLt2iOT+oWh9uUG068CS0kyX7KcbYfNt6aa
 3woy44QHqWyES8+XDK0NduOJjcaUgw5PXrsfyVR1aJ+2IfjEoNSMSJ9fOiynN4o+UZ+Qrg00ohr
 V1NBbT2C/5SL8C+xnYST+wGt4rWOc+iF9QyYQwuV0Cj7RLX6k2ISCBduXaGwFIqfaU7VQpnGx4/
 8CNwKrjaT/Den2YHwVNQkc6mFo4v7DEzAEw5F3k2nRZpyo9veGAvLZVhyCyVLJg++cIKfGd6u8r
 sv55+/Ld3apha2IeM96LNaMN00KmSY27uFPjvIJcuv6v0VI2NOpyoOYVY0KTw0F6Ugg2ljmHdF3
 whKHL4PAoPl3Gjdy2El2eJBoYsIqPkP6AWAjlD4OqO63HZJx+OJDr877QHyPrHO6Vm78U9ng8H/
 bbHtBFfKUgrpmpNNC1w==
X-Proofpoint-ORIG-GUID: Osj8PW_puLPeewHjINbsjAZJ0zivsaEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117113-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B14A87174E5



On 6/24/2026 8:12 AM, Shawn Guo wrote:
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> This include shouldn't be needed.


Yes, I will remove this in the next patch.

-- 
Thanks,
Taniya Das


