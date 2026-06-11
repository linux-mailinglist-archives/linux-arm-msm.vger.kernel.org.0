Return-Path: <linux-arm-msm+bounces-112712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MMAuDdmRKmpwsgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB0670F70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F0HAjLk8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vd4Q7ky2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F5F832DC8E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210B33D564B;
	Thu, 11 Jun 2026 10:43:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652C3D47B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174587; cv=none; b=qEzVNMRraCEN8kzIaA2IXkMJDi3NEy60B/+4pwdQ9NCsL8WuYNEIEDkEWLtBEso+cXiEA+YmBqCkBna/YQXeknNr2gmuVxdaiJU4ifDMnz+vQ0/HAZkgeNB+4+Tt8mb+ISyP+7cKf9cxYW2Ty3arVSwLGkFwT1ENmTZx8LSLe9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174587; c=relaxed/simple;
	bh=TUrkQVS+nK+woCaaeRYuiCWpYY0/NY/9Hz7hw3d9ZUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqQ5tEFRGyv+OMhxlP3EIgeLi7/24stFElFvxyywWo72+xlIc5VD6FkjmclwFTcgZ1cPH8OFSC358kqfuZwi21KumNspBmp7rGHso95OkLuOfRdFLiJvfB93jwTCo8mDJKCKzxGpug7O7NUtlxKHpmS3q3c/CQqKpTH/2nAMdwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0HAjLk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vd4Q7ky2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xpdZ214485
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8yW4Y/G286voQEgRLE73+RcFwqX62AXTHtgT7u6WBA=; b=F0HAjLk8oKvTGXUG
	C3cwWNqwhprLLzEb6+F/vOb3T5UdV5O8v0bNTjQhZrg1319JsFS7voEH/Y5ZAE0i
	hv+oT9Hej2fIioLcKtA6khYh4dme241OpROqQbzwNlPndJpk08X26tbqFxFdUvbV
	ZgxmEXeBqmKjS8/WfFyGRsBXFN4aCR64vYrOZmTLwKEu8K9F5EJ355zJmnA2Gouy
	lHBYmFFCXoAE1LVfLEwYQDB3sl82R58cVAKydlshx6oJEBcKX2uiQUOxN6AC4hmk
	iaj1gd6TD83y5eYzYOiNkoBBKD8xVhOsCbEMdXUYqXIJYs3N4x/4v/JluYvY1DTi
	y6SJ0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk2eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:43:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b9d265308so5856419a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174583; x=1781779383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8yW4Y/G286voQEgRLE73+RcFwqX62AXTHtgT7u6WBA=;
        b=Vd4Q7ky2hUzVf821qjT6nWHaQTEmBR76f1yhqeNDKuK/NdtDZiJGmUukhoR+emOhpX
         w+BciiD5JhT0XMjkBB6n//YZWy2pdSrVfOykQulg4TgKU3VnvCNehtrcp8Q8X5x+/3UD
         R+FHp1zug4tFbztnvsu3mr3TN+/t5/F1Ye9pDT+nisb9xSeZRQolET9wvCK5MnU3h2Lg
         1jlk3jT+3lkO2EDEATPAWMjCpJoDTo2Yo6nrC0jKF5Uu5a87jqXmiuJU7jLlH4CiC9Lz
         KdSQcr/3AqOibyAry5esOROmZQMiufPzN6QYswQnjwi18FBz9216PmMpMjXcrgXGvHoJ
         qgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174583; x=1781779383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8yW4Y/G286voQEgRLE73+RcFwqX62AXTHtgT7u6WBA=;
        b=HoFXOC/IObF+h7CRoj2LY6lIvdJSamruuRXfh/kWD0rNLeY6qKdjERitIhpfhUhx2b
         hu3su6Ve7lbmVlpV9Jc1qHLT/+VNfw+wAM3+ZiJP/qIwJR2kGDcZLco7id4dNNoTDNL7
         YeIDfauI6G4M00LCw/Tqb4JCyyH8WKkkTwRfLHy85bMVTzLDjLxaeaDYNP51oO2pF4D0
         bCgmeXbj+ubaAGPRAvmTI1j/vvnAvLVKwMtY2dsuXlpFhZ9l733ehZbfxpzFWC3h6D3F
         51pwTn+dMCi6CCszXXawQcUKQk2rUNhbP5OFXnHbe43+/NHsaHBM+gkG220PhSo8tP/f
         J6Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9X9PsOgZz+ChKNbJ7ZmDxSo3sFjzS1h1nDFscivPKCEOdx+p+ywwlV0rMsMXZjqOdWcmnqJxsDNqjIkwN3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4kqJRvHv5sE/OgEfau+GN24+pSjtA2ik3505mUUhFcP3VNtx5
	WrHJP+s0CFCoNA/qkA37jLIj6Khj8oQyZovOqkEmc/UR1+mj+0DFg3PjzifIbxhOZQinpEzn4CO
	sc+L0ZUzDkRr8fl7WKQOwEfbTf1+y9pRDX4zRMWPOi1/0Hhp+u++S6f+GSL88XpsAgxn2
X-Gm-Gg: Acq92OFR0I9cVfhfIgpcF4U0VfrXX5TQQVTbie/tdOx9u2mHFQPbWSQQKJ8eHsPm5gO
	NFoZnMH5YartlRlDnGIcIoNycqVMwv6jsjEWQhAnLVDoq2h4+Owcg2A88kBSN/sRpIWhLGOscnG
	RwaKKBmTWxpfQE7leHeT9dVlYxKBuYwpduAacwTVoyBJaeWPnOlCUdtSZ2W9SlvOm4HNHOg67VY
	aoVZTng/QPWvnV46VFfKl46YH86BB6yltyW45RrcNC0IQXE0cf9vSzJkH+DYP/XVbJ+vZR8Ra9l
	XLsswEFEThLngtk76Y7FBHNZkmW4SZD8N+lLT+7Z2wBuIffEueluUk2QdmN1OeAsQq9nACUm6ja
	ex2gJY8INqdJ/F9H/U/HQ4a3mGDMP1JRMLHLxYSG9YsYL9il8AModr0IMCpSwLWHe
X-Received: by 2002:a17:90b:3ec6:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-3779f091c30mr2715984a91.10.1781174583018;
        Thu, 11 Jun 2026 03:43:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec6:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-3779f091c30mr2715949a91.10.1781174582523;
        Thu, 11 Jun 2026 03:43:02 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm273881735ad.19.2026.06.11.03.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:43:02 -0700 (PDT)
Message-ID: <2c7b6222-d394-4edf-ad6d-d413ddd97f5f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:12:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
 <ah9q6JbkC5A9riO6@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <ah9q6JbkC5A9riO6@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a9138 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=r5C68v33nSZEUmtJHtYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tCPCovD89bCHwy9Hevt2jmN58cF-upxF
X-Proofpoint-GUID: tCPCovD89bCHwy9Hevt2jmN58cF-upxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX8eFi/JFBX9DM
 4mQz54ivzHzghQr3s07EsSzWRtsnJjNLVSIe9NI/hcIfkP6eJkYrkvxnYun3BZJYPn+tlwSYhrb
 EaGgQhqZA03c3KGqtVHOCMAvePaViToLFI482HSgQWefMgcfLWVw9nvkIRdslprhDQ7tskr0DNK
 b724tkZiABKxKCHUjhedVX8jORjJctDZzATSC1dkR+t0vi8V/YxnodZFyyxVcpVqxb0EHDGT3+4
 P2AvIJ02L+RqFGgQvTHPfKrTcVyetQ0d0+GQjJWeR58tlJNwVjBQ/FuAMZbWN3xdpS+DwRL03rY
 dU16BF/l6QQaYsJb6oxV20Nq0vXu8FB1am9hJCApkVDJQPsih04Zaluxydxko5bhNhJXSbPVX6y
 pJJQzZGmnzCcGVpvI6K7hk4hf3E1YBioLsa3m2/RWPamP89SPZXoceO5TOZyD00+gSUxLGKSxnz
 FHGMMzVm2V7YXbDlzcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX/UTv+KJoUDh+
 DuznDRuvKE7oP+l732n1GcYzz4O1Gw0V33DSt/69No88vgJ5QVn2n5sGg/z/zt2IIFMJpWKZhBJ
 YeDyIOrPDp/aceVPLGZwvJqfqYx+D7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-112712-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACEB0670F70

Hi Andy,

On 6/3/2026 5:14 AM, Andy Shevchenko wrote:
> On Tue, May 26, 2026 at 04:26:10PM +0530, Jishnu Prakash wrote:
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
> 
> ...
> 
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/container_of.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/err.h>
>> +#include <linux/iio/adc/qcom-adc5-gen3-common.h>
>> +#include <linux/interrupt.h>
> 
>> +#include <linux/kernel.h>
> 
> Why?!

I think this is not needed with the other headers included now,
I'll remove it.

> 
>> +#include <linux/module.h>
>> +#include <linux/thermal.h>
>> +#include <linux/types.h>
>> +#include <linux/unaligned.h>
> 
> ...
> 
>> +/**
>> + * struct adc_tm5_gen3_channel_props - ADC_TM channel structure
>> + * @timer: time period of recurring TM measurement.
>> + * @tm_chan_index: TM channel number used (ranging from 1-7).
>> + * @sdam_index: SDAM on which this TM channel lies.
>> + * @common_props: structure with common  ADC channel properties.
>> + * @high_thr_en: TM high threshold crossing detection enabled.
>> + * @low_thr_en: TM low threshold crossing detection enabled.
>> + * @chip: ADC TM device.
>> + * @tzd: pointer to thermal device corresponding to TM channel.
>> + */
>> +struct adc_tm5_gen3_channel_props {
>> +	unsigned int timer;
>> +	unsigned int tm_chan_index;
>> +	unsigned int sdam_index;
>> +	struct adc5_channel_common_prop common_props;
>> +	bool high_thr_en;
>> +	bool low_thr_en;
>> +	struct adc_tm5_gen3_chip *chip;
>> +	struct thermal_zone_device *tzd;
> 
> Wouldn't `pahole` suggest better layout?
> 
>> +};
> 
> ...
> 
>> +struct adc_tm5_gen3_chip {
>> +	struct adc5_device_data *dev_data;
>> +	struct adc_tm5_gen3_channel_props *chan_props;
>> +	unsigned int nchannels;
>> +	struct device *dev;
> 
> Ditto. I would expect the nchannels to be the last. Also play with the position
> of dev to see if bloat-o-meter will show the difference.
> 

Thanks for your suggestions, I used pahole to check and I'll update the above two
structs to remove existing holes.

And with bloat-o-meter, I tried moving dev around in adc_tm5_gen3_chip and
found the below arrangement was the most optimal:

struct adc_tm5_gen3_chip {
	struct adc5_device_data *dev_data;
	struct adc_tm5_gen3_channel_props *chan_props;
	struct device *dev;
	unsigned int nchannels;
};

possibly because dev_data and chan_props are accessed the most frequently
in this file. I'll make these changes in the next patch series.



>> +};
> 
> ...
> 
>> +	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props,
>> +					    temp);
> 
> Make it a single line.
> 
> ...
> 
>> +	/* Low temperature corresponds to high voltage threshold */
>> +	prop->high_thr_en = (low_temp != -INT_MAX);
> 
> Can low_temp be INT_MIN at some point?

From what I see, that would not happen. It looks like the convention
in the thermal framework is to use -INT_MAX as the limit for the lower
threshold in the .set_trips callback.

> 
>> +	if (prop->high_thr_en) {
>> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
>> +		put_unaligned_le16(adc_code, &buf[10]);
>> +	}
> 
> ...
> 
>> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
>> +			 const struct auxiliary_device_id *id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
>> +	struct device *dev = &aux_dev->dev;
>> +	int ret;
>> +
>> +	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
>> +	if (!adc_tm5)
>> +		return -ENOMEM;
>> +
>> +	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper,
>> +				       aux_dev);
> 
> One line is easier to read.
> 
>> +	adc_tm5->dev = dev;
>> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
>> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
>> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
>> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
>> +	if (!adc_tm5->chan_props)
>> +		return -ENOMEM;
>> +
>> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
>> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
>> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
>> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
>> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
>> +		adc_tm5->chan_props[i].chip = adc_tm5;
>> +	}
>> +
>> +	/* This is to disable all ADC_TM channels in case of probe failure. */
>> +	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * First SDAM's interrupt is shared between main ADC driver
>> +	 * and auxiliary TM driver, so its flags must include
>> +	 * IRQF_SHARED. This is not needed for other SDAMs as they
>> +	 * will be used only for TM functionality.
>> +	 */
> 
>> +	ret = devm_request_threaded_irq(dev,
>> +					adc_tm5->dev_data->base[0].irq,
>> +					adctm5_gen3_isr, adctm5_gen3_isr_thread,
>> +					IRQF_ONESHOT | IRQF_SHARED,
>> +					adc_tm5->dev_data->base[0].irq_name,
>> +					adc_tm5);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	for (int i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
>> +		ret = devm_request_threaded_irq(dev,
>> +						adc_tm5->dev_data->base[i].irq,
>> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
>> +						IRQF_ONESHOT, adc_tm5->dev_data->base[i].irq_name,
>> +						adc_tm5);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
> 
> Can't it be combined by using temporary irq_flags variable
> 
> 	/* ...the fat comment... */
> 	irq_flags = ...
> 	for (int i = 0; ...) {
> 		...
> 		irq_flags = ...
> 	}
> 
> ?

Thanks for your suggestion, I'll update it this way.

I'll also address all your other comments in the next patch series.

Thanks,
Jishnu


> 
>> +	return adc_tm5_register_tzd(adc_tm5);
>> +}
> 
> ...
> 
>> +static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
>> +	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3", },
> 
> Inner comma is redundant.
> 
>> +	{ }
>> +};
> 
>> +
> 
> Unneeded blank line.
> 
>> +MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
>> +
>> +static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
>> +	.id_table = adctm5_auxiliary_id_table,
>> +	.probe = adc_tm5_probe,
>> +};
> 
>> +
> 
> Ditto.
> 
>> +module_auxiliary_driver(adctm5gen3_auxiliary_driver);
> 


