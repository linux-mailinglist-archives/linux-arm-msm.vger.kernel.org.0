Return-Path: <linux-arm-msm+bounces-102259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPDDNz/w1Wlz/gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 08:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C4D3B76C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 08:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 687343020E90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 06:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489E0361DB2;
	Wed,  8 Apr 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtpHvwGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmeT7GcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164C35E959
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628344; cv=none; b=PoYSx1oIm0t83v9nqNU88LdISdqUVDSeN3iEhFAdutTjAZWeOgGDS4khwL5PelhFgGl1AmnzPJVJ3slpjHTJwMfFifHvPbE4U5NF+8SX1KjZRsJQobmOxz7eb/daSokFbODEI1Qxnpw3iboA75/o+8d9qtquJvpvpOUvC9Cvr2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628344; c=relaxed/simple;
	bh=c6N26IhPygukcAcEbbwCi5kxSzaFfkAPpzFHNLonrc4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N0jlovYjyK6x3KCrzKB6ZbDk0oH3VNQwsT4CjBNN2tDpb7VgahqjrSvbWWPmbksJyB4hDeqCCIPzfnfJfpEbQBA7+mHJWxHplURKJsc7h1OSaseaOjx8mLxycjrhn/dYt2PQAPaBJthsxx/uPKcYKzTz5hs390UaUTGBV0cY7fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtpHvwGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmeT7GcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385ePrV3363716
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 06:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=; b=WtpHvwGNYHHRhOdL
	k7g4khmayRNuNCuhQrBxwv/w+ecOjHITw1adu1pAhg7F5hBw+y31PoH6rDIBwJoM
	BOWt+Ph1jt/8+hO448hzpvOEuhUVg4ALBZ5nA1UPjXrWIq32GmyHHs2ZtO3ACFUn
	FOK7Cwt0BRMDeJ58jzDgxddJzzv5cTv7Tc47Kw1+4triQcHFkBRr4hg1IKUoICCj
	VQWDHKzNOQFkoGDnV/30BpM8OvUcc2e/bkIdHQM84VIQDFkja3Z/hi3+6QFkqsyM
	mHgLv+fzTLq2+nvLhx8m7UgM3V6yEBpiiD7rZwKt16kVnWGV+8eZmhrpXeGKpM+1
	SBJPZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkhs71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:05:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so97840335ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775628341; x=1776233141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=;
        b=kmeT7GcCNvigH7NyYokCqDYS7AFAbr8rS9mR7J/NrVH4HmT8MQL2hnW2Lzb08PmLQ9
         Pryhq0bQB47lDrLcAieffXaoW70Gmo9+bj02us/hpmZRFSOX/wdzNldOO50h1HpUDB0J
         yaDwXH0CvjsSeQqjBsTYj/eOm9R2IIAZ4qAfVGtUdYcEqlha12/ww1qyAYCAvbEZm+yt
         rAlYD4Geb3e3RQDpZiFihjX9NpaDm203+OpgX0jw4VTH4F/VmVnYfztn992Rb2kOato3
         01umlaPpcCDdSRlAlgy55Zpj2d/KZo5QlgMCzCiNLlRAYY/Z3XD/3lOiaoS32LT66AIw
         qHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628341; x=1776233141;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=;
        b=kkYhFO3iKgS1apr03VQ7RktyFyjTxC1Agjfh+CAwBoMkDJB+DHYEWZPdzgB3z04/g4
         gKA7Lx+br4IkxWOrsfenQhiMGb+l3lZCeqGECnfW+95M55VFzSEkFo4JoD/6LVvInM/v
         hY/tW/XT1ARwGTSyyrlqdkk5DT3IylwsdtOKuqBI/1ihjNN9/p3zFvJ6WBIooAtd3KnI
         dKBbYIwwilxk/6jn19sFdVZWQIvnjerEKdnBZziL5E5Uin0p4HKE1Omfmj2Uf6njZg2t
         ViCygHQrkf8y/YOjYQJhdblhEFuLAzvMr7TyrSlBrz5hX5xxq8RS9JGtle6Qx8prUDB+
         d31w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6WIdFEjLec2KRaVj2HebLgtPq+40x1tCAZmXVb+LDA974QtTLhWvymXlfjqf15e92vf9HqCvVYem9j6Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9b2SqdvUJJGNuc2oJ6oLqoAZwwWkG4uziVCz24zObOfcz72D3
	a8lxHdjDeHdCIBR59bI539OaRoCY2tZYIwN0D1zGP7VTEJSr+xL+u2eb80uS/A5KCmH7j6wRDvc
	+5kAd/Qxx0CO3ASPaIroKwfFYWkDNr43Zbo3zg7eB/t7DwmIiRm2GHo2qThLRvrfGBaI4
X-Gm-Gg: AeBDiesdPd2GDAyKi955GF+ypD65mHxJXx+C8t8wRTQcLhxYYQ2rsDoc2oBi9t7451j
	ukRTAIOLe/NcG2Rk3jQEMRhe57YgUJ4GRFd/LDwFjMh4DUiCzV8q9UEl4O54ovaowGGVyDn658t
	7Q11OtWhGDIGn67Iu48I2iJtaVZp3nrv67dz8Nt8Wg9UtopKgjVRe8qThsnGK+i8q4dAkVXolRb
	Di3/xaiesxAfxemjCzDJFxi7xzsOqUe071az0EgCjjqCWpHzvoCLxoU6Jdl0A1dLYAgatsfhcKc
	ah8RDiXDj9kk3dJlpgPt7P7AdXV2y1IPgzgbPsunOv+T7THfxRMT77fK/LFhn4sFfcw7e3Ea1yN
	46RgwQ7Guwxes2CtubqUCWTJmrCTm53utM+U5QT2ukjIwqRx/CGvA+NOMrGWET5UcVKKnp+4S3F
	bLcSE5MWxwVxNLF8ouzTRtA/x2JkPKobqgMw==
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr193082965ad.23.1775628341138;
        Tue, 07 Apr 2026 23:05:41 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr193082645ad.23.1775628340581;
        Tue, 07 Apr 2026 23:05:40 -0700 (PDT)
Received: from [10.79.196.164] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm240381685ad.69.2026.04.07.23.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 23:05:40 -0700 (PDT)
Message-ID: <c256047d-cacf-4ef1-96bc-529b3158c60c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
 <308ae40a-34f1-9b69-bfe7-150ca8ad1d29@linux.intel.com>
 <e35da42f-e43c-4810-9985-7f51a1f5dc0e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e35da42f-e43c-4810-9985-7f51a1f5dc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d5f035 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=-0q7uios7j49SWls-T0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: f-pn_0b7HpSq464EW1YFkcqgb4hMf7-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MyBTYWx0ZWRfX76+e9WuU2B31
 eR9Fk2iEebg2nWzZIUaICRKI+fiQ6MfwcMCZLVZBdI7CSONtuRZC2xCtpUQNxJkl8UXNK0Ifd+Y
 Tcjt60s8Heb0GJCV3VDJKrn4a0z4SLQST2APjLF+nTspWk+aDSAxc3lm1jM0FkiZtdkOZQmH0z4
 QC0PGdDVV7IROPZkU6zMpNFKlfGBZa2IezBHdPpKDEq+mO4gnH63X8vOJXW4V4I+0fueHvsAXx4
 9h8pzpbquX3sftqVVa9qhmOWVMEsiLPpudQbtfg9BBpKLpb/VOHBJatmdtpSUWWMOadvDcGQ3ms
 8caIBfA9Lo3pxrFDre2/+IHgGG5ATCtK5grByuLrK9avfZV1T+YV4VS0BwFpVls+V3Df2rF74hJ
 kvyI5Di8fovwCJ1Nyv/eZ4PbgznpAAtXwWLuZFtEKLYUdSG1Ubft2FoPfqn3x1iYnC4Mo66i/dt
 pndZwDBdmhCfGASJWFw==
X-Proofpoint-GUID: f-pn_0b7HpSq464EW1YFkcqgb4hMf7-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102259-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96C4D3B76C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 12:14 PM, Anvesh Jain P wrote:
> 
> 
> On 3/27/2026 5:20 PM, Ilpo Järvinen wrote:
>> On Fri, 27 Mar 2026, Anvesh Jain P wrote:
>>
>>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>
>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>> reference boards. It handles fan control, temperature sensors, access
>>> to EC state changes and supports reporting suspend entry/exit to the
>>> EC.
>>>
>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>  MAINTAINERS                            |   8 +
>>>  drivers/platform/arm64/Kconfig         |  12 +
>>>  drivers/platform/arm64/Makefile        |   1 +
>>>  drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
>>>  4 files changed, 472 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 30ca84404976..536dfd9adff4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>>  F:	drivers/misc/fastrpc.c
>>>  F:	include/uapi/misc/fastrpc.h
>>>  
>>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> +L:	linux-arm-msm@vger.kernel.org
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>>> +
>>>  QUALCOMM HEXAGON ARCHITECTURE
>>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>>  L:	linux-hexagon@vger.kernel.org
>>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>>> index 10f905d7d6bf..025cdf091f9e 100644
>>> --- a/drivers/platform/arm64/Kconfig
>>> +++ b/drivers/platform/arm64/Kconfig
>>> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>>>  
>>>  	  Say M or Y here to include this support.
>>>  
>>> +config EC_QCOM_HAMOA
>>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>>> +	depends on ARCH_QCOM || COMPILE_TEST
>>> +	depends on I2C
>>> +	help
>>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>>> +	  control, temperature sensors, access to EC state changes and supports
>>> +	  reporting suspend entry/exit to the EC.
>>> +
>>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>>> +
>>>  endif # ARM64_PLATFORM_DEVICES
>>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>>> index 60c131cff6a1..7681be4a46e9 100644
>>> --- a/drivers/platform/arm64/Makefile
>>> +++ b/drivers/platform/arm64/Makefile
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> new file mode 100644
>>> index 000000000000..0f883130ac9a
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> @@ -0,0 +1,451 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/thermal.h>
>>> +
>>> +#define EC_SCI_EVT_READ_CMD	0x05
>>> +#define EC_FW_VERSION_CMD	0x0e
>>> +#define EC_MODERN_STANDBY_CMD	0x23
>>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>>> +#define EC_THERMAL_CAP_CMD	0x42
>>> +
>>> +#define EC_FW_VERSION_RESP_LEN	4
>>> +#define EC_THERMAL_CAP_RESP_LEN	3
>>> +#define EC_FAN_DEBUG_CMD_LEN	6
>>> +#define EC_FAN_SPEED_DATA_SIZE	4
>>> +
>>> +#define EC_MODERN_STANDBY_ENTER	0x01
>>> +#define EC_MODERN_STANDBY_EXIT	0x00
>>> +
>>> +#define EC_FAN_DEBUG_MODE_OFF   0
>>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
>>
>> Add include for BIT().
>>
> 
> Added <linux/bits.h> in v6 to address this.
> 
>>> +#define EC_FAN_ON               BIT(1)
>>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>>> +#define EC_MAX_FAN_CNT		2
>>> +#define EC_FAN_NAME_SIZE	20
>>> +#define EC_FAN_MAX_PWM		255
>>> +
>>> +enum qcom_ec_sci_events {
>>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>>> +	EC_FAN2_STATUS_CHANGE_EVT,
>>> +	EC_FAN1_SPEED_CHANGE_EVT,
>>> +	EC_FAN2_SPEED_CHANGE_EVT,
>>> +	EC_NEW_LUT_SET_EVT,
>>> +	EC_FAN_PROFILE_SWITCH_EVT,
>>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>>> +};
>>> +
>>> +struct qcom_ec_version {
>>> +	u8 main_version;
>>> +	u8 sub_version;
>>> +	u8 test_version;
>>> +};
>>> +
>>> +struct qcom_ec_thermal_cap {
>>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>>> +	u8 fan_cnt;
>>> +	u8 fan_type;
>>> +	u8 thermistor_mask;
>>> +};
>>> +
>>> +struct qcom_ec_cooling_dev {
>>> +	struct thermal_cooling_device *cdev;
>>> +	struct device *parent_dev;
>>> +	u8 fan_id;
>>> +	u8 state;
>>> +};
>>> +
>>> +struct qcom_ec {
>>> +	struct qcom_ec_cooling_dev *ec_cdev;
>>> +	struct qcom_ec_thermal_cap thermal_cap;
>>> +	struct qcom_ec_version version;
>>> +	struct i2c_client *client;
>>> +};
>>> +
>>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>>> +
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	else if (ret == 0 || ret == 0xff)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	if (resp[0] >= resp_len)
>>> +		return -EINVAL;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * EC Device Firmware Version:
>>> + *
>>> + * Read Response:
>>> + * ----------------------------------------------------------------------
>>> + * | Offset	| Name		| Description				|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x00	| Byte count	| Number of bytes in response		|
>>> + * |		|		| (excluding byte count)		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + *
>>> + */
>>> +static int qcom_ec_read_fw_version(struct device *dev)
>>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>> +	struct qcom_ec_version *version = &ec->version;
>>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>>> +	int ret;
>>> +
>>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	version->main_version = resp[3];
>>> +	version->sub_version = resp[2];
>>> +	version->test_version = resp[1];
>>> +
>>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>>> +		version->main_version, version->sub_version, version->test_version);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * EC Device Thermal Capabilities:
>>> + *
>>> + * Read Response:
>>> + * ------------------------------------------------------------------------------
>>> + * | Offset		| Name		| Description				|
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x00		| Byte count	| Number of bytes in response		|
>>> + * |			|		| (excluding byte count)		|
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>>
>> 0x03 ?
>>
> 
> Typo, Will fix to 0x03 in next respin.
> 
>>> + * |			|		| Bit 5-6: Reserved			|
>>> + * |			|		| Bit 7: Data Valid/Invalid		|
>>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>>> + * |			|		|	    (1 present, 0 absent)	|
>>> + * ------------------------------------------------------------------------------
>>> + *
>>> + */
>>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>>> +	int ret;
>>> +
>>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>>> +
>>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
>>
>> Please add include for dev_dbg().
>>
>> It seems you've missed at least some of my comments to v5, please recheck
>> those comments. I won't look further for now.
>>
>> --
>>  i.
>>
> 
> Added <linux/device.h> for dev_dbg() in v6, will include
> <linux/dev_printk.h> as well in in v8. That said, all your v5 comments
> have been addressed, here is a summary of what was fixed:
> 
> - Add <linux/bits.h> for BIT()
> - Add <linux/err.h> for IS_ERR()
> - Switch thermistor mask format specifier from %d to %x
> - Add missing braces
> - Remove empty line within variable declarations
> - Change loop counter i to unsigned int
> - Replace snprintf() with scnprintf()
> - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly
> - Condense devm_thermal_of_cooling_device_register() to 2 lines
> 
> Apologies if it appeared otherwise. If anything was missed, please do
> point it out and I will address it in the next respin.
> 

Hi Ilpo,

Could you please take a look at this when you get a chance?

-- 
Best Regards,
Anvesh


