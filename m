Return-Path: <linux-arm-msm+bounces-92033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFkkCPnjhWnCHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:52:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A0FDBA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDDBC300D0E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA4D3B5305;
	Fri,  6 Feb 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bswXsaaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+dwJWqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B83AEF5B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382252; cv=none; b=h3f7Z1HerCffQl3rzhpaA1lXKIAWwfsCsRwBr0n8n47ETHxe2U6wegrAiXGsRqyZ0vtGMBUpV9QfYyNW3rRbbLWQUV8Xdimh+Aw95/IVgdBjy1G1lej2ZvfpjTk9zCG7Kiq66MXkj0tAsWt7qYJwSs30/Yj8MPoRedh74SzVKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382252; c=relaxed/simple;
	bh=ZWUSfutXGKCikBMX8Q0Ep5H0GBuz5LUQSJTdCNe1x38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBm7trJW+MC6t2BjSDX6b4cChAxSpZ1OvkJg9+KW/jDBNoYMSA21wZbtOGFSZo+48LI04eBWnzs9Kv+LtzXL+ReF9hDX+5S76vWbrTiTuU3vBjhRNG+rd5bjf2xPORAqVy2EkUFgSf6d1CZHyS9i9wEACMiqCr9KIyTtL6mbMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bswXsaaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+dwJWqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167pNow2489781
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 12:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfeubtNFCdvI+87VUZgOtTYw
	db+qMLhkzHGY85l1U64=; b=bswXsaaCXm30mtGk5aL5RjF9A9prwuCedxiKZQag
	JSYMoTgIrN83VkA9+FGu92lmrnHlRY3MffDi0jtqKoxb3DvjiNOVJWwZm3MS+DEQ
	WuDt6xG5SZJuNTEIzbye86JUzH8GEg9lwRN7qMnHAFyjHBc1wqmKuqsOnQjv2D6W
	zGY/ihAatRJv5d9k9MISHFEXPmII+hbQD6WPx2vdxV0aooc/5azsGq7RU3DktO+S
	oi+4zs2j4CSYezIWbsWhOT7653cmXJByhbEJGi9L6ZQ40re7yoTNJ+q5i52lW+YH
	dq4xB3EFDmkcsUfJ6WUl/6N57IpqqtrHJWp8RRr1OpD9AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c9c0wm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 12:50:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so146984885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770382250; x=1770987050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfeubtNFCdvI+87VUZgOtTYwdb+qMLhkzHGY85l1U64=;
        b=G+dwJWqoV5o5/FfOXi7/GboZHqz1I21ZLvziJTfb8PInkpDRriAttMHuM/rEYgOP1x
         mYJdWQmgzkDtd1+TzdfAzMYSU99qLYPpwd2myDNj5QB7GxQklWq3mY3FN2UXwaqh/eus
         0VMFHYpRL0tgYhNhqnm+EalqprKm6WCAq6kCG8PKz8N61JeE04eSRy/dpyn5mnIaWa+w
         cX+TI5GmHda+eBWR5txyVvPn2J1/7KK9sPj618XxaESCjrA0RsAfJkiKzeVSvnqfJ2/V
         2ji8zJMdr+h9Q2ty35a+jf+4GcwchzgKSj4ggPAYdSm8Rmk+xJqUDVe+ayOJ6CsoOLxt
         KLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382250; x=1770987050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfeubtNFCdvI+87VUZgOtTYwdb+qMLhkzHGY85l1U64=;
        b=YFwDyJHYwKY6W1+tZbni9+hAmBfochUMLprgHlJlgMZAdwqaKg2iazO7GUrkYFdX+o
         m2E34IkmBLbVDNSuCpT2d2nDbEFneuxwMOwgjGp/M2yV4EUDb96TH28a7UdF5k0I2gqq
         jqTSSjEEVmeN7LTNsCenco2pBDaJ89Yd0T/TZ/sG8Wy7vmOV/lCqn+km1IT6Ey0vuo0U
         ypXSeiddft9y5AvPaO2ylY8UXjdAERSKmT0S2nro5IROHpwGPrymDCmjulK5mMH238ET
         IqxWr9g/XFKbwfoCR1qrfPMUMK8a7/WL74h4iBwcPrdVQOTGJevQZxYaqxalinnQ/eVX
         dCEw==
X-Forwarded-Encrypted: i=1; AJvYcCX612Ra+TCjV3E0N9R93l2SwhuJyfu3YqUWhXRGrOJTqpdvx1DfZZF3evl+ThKD+AR2WbAOd+oZD5XkWASD@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdJ9zL41xJcmkr3efg6Ze/ZIIeBjyMp5tTNTniKFKxBvRtBHw
	+ywBhcAhLsSiIiowqdx4evbw41zGKeDPSc3c10kCWhPqQTvVv5cNuXEWtkXIc8VF04SGIP3VitI
	Cj2TP+dZEFL6y+DGndWUaa9KdwWh2+pKIjFSQu0bj36NjVHwYaJmNdGJcIWN2I+k/AFQH
X-Gm-Gg: AZuq6aJeQFzfWi5fJtpBtIZP8Cw0+Jj8JSx+0cipi6PZfnaIKhrleTsLYx3FR6Hgm71
	aKCyBulZj4iijukDqbt/2goQTu4H+FZVBbDsOV5HqSCGmB66EbrXcFfSlcV/lcqTyayzEYp37ev
	yFwwLOHvLn+1q6ALBDiyWto1kOU3Fu8Nnaooi3R7kNlwQIffi3SHFJDFf82g3YksxRBhwC2K/Us
	sqLlwHsC4SVv7ae+5aPt0pStRNvt8WZajxNNx0zRNNnzX6Jyx73dnGFGeoAtgPVklKa8nqkxwX6
	RNYoJitJ4zHH+/CpYQxQvj8BW0cDTP5h0yqY1cdHkbM8Nu+uYETgk+dtNrZZlnO5i7Wpsmzn22w
	cOjto39NCzh40011DnTu2KTR9N3zhkZYXr0rT
X-Received: by 2002:a05:620a:40d2:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8caf1acb608mr309508585a.88.1770382249943;
        Fri, 06 Feb 2026 04:50:49 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8caf1acb608mr309505485a.88.1770382249289;
        Fri, 06 Feb 2026 04:50:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48323c0296dsm38981985e9.1.2026.02.06.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:50:48 -0800 (PST)
Date: Fri, 6 Feb 2026 14:50:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <w2zz36w7jpxafunxhan4jvdh47kx2mhxunazig3ubrvwe4yfhk@6sbi7rqo7lul>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
 <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
 <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BbzVE7t2 c=1 sm=1 tr=0 ts=6985e3aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=0XEvXGck0KlApgr3KlUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UsB38BKp7wOQak0DahsfHGujrjVMK_wO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4OSBTYWx0ZWRfX5x7mGN6D6WvP
 msuPbF1FvxEYV5BPaXEwLLaYR5csueDMPJERVgPqm9a948Hq2O9cv0hgemqLdO9UJ7sRnhOXnIO
 q2pzjDiqm+CuNqi+NBIJnD6B0BtB0SnLmqeEeG+qVajnqQ/FN0OKwAFsoqNEF4h3e/9RlfKxS/+
 rxWR1lkeF/GfoClvBb0xAknv63OsD9nC9S4bXDbx3LR2qIlD4QSZB6hWI00Rr3SqzPBbvkgTUdP
 XBfd2o4YiYcnxzoPx63YeDCFnvuc0zq35GQYzDx1BexlBrEw5M9GUoCqfGdQEOFSXnsSjFbrq95
 Eb8r/8t5ARFbX6Xl+iGhzZbV0lUlbgh/BFhjJdpavVZpJIIuTxRnFkaKFdd7cTZVOdhkpWIYwkV
 j/yrjjnA98lYP4vY7+hQ5SRmG57j6s8A5OOS4ZMZJuHb8yTg+5ClxlXJnQK+HUZyUuwweDKOYQe
 cMrQAkjDVA4v6LtYFmg==
X-Proofpoint-ORIG-GUID: UsB38BKp7wOQak0DahsfHGujrjVMK_wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B62A0FDBA0
X-Rspamd-Action: no action

On 26-02-04 13:36:57, Konrad Dybcio wrote:
> On 2/2/26 9:53 PM, Abel Vesa wrote:
> > On 26-01-30 22:40:32, Abel Vesa wrote:
> >> On 26-01-30 10:43:44, Konrad Dybcio wrote:
> >>> On 1/28/26 3:10 PM, Abel Vesa wrote:
> >>>> On 26-01-28 11:34:49, Konrad Dybcio wrote:
> >>>>> On 1/27/26 4:03 PM, Abel Vesa wrote:
> >>>>>> Add the TCSR clock controller that provides the refclks on Eliza
> >>>>>> platform for PCIe, USB and UFS subsystems.
> >>>>>>
> >>>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> >>>>>> @@ -0,0 +1,144 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>>>> +/*
> >>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>>>> + */
> >>>>>> +
> >>>>>> +#include <linux/clk-provider.h>
> >>>>>> +#include <linux/mod_devicetable.h>
> >>>>>> +#include <linux/module.h>
> >>>>>> +#include <linux/of.h>
> >>>>>> +#include <linux/platform_device.h>
> >>>>>> +#include <linux/regmap.h>
> >>>>>> +
> >>>>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> >>>>>> +
> >>>>>> +#include "clk-branch.h"
> >>>>>> +#include "clk-regmap.h"
> >>>>>> +#include "common.h"
> >>>>>> +
> >>>>>> +enum {
> >>>>>> +	DT_BI_TCXO_PAD,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> >>>>>> +	.halt_reg = 0x0,
> >>>>>
> >>>>> These regs certainly aren't at +0x0 to what we normally expect to
> >>>>> be the start of the TCSR node
> >>>>
> >>>> They are if we add the TCSR node with reg range starting at 0x1fbf000.
> >>>
> >>> "if we take the wrong base, the wrong offset is right" ;)
> >>>
> >>> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> >>> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> >>>
> >>> The registers that first appear in that region are the same as on Hamoa,
> >>> and so is the address, so let's continue that tradition
> > 
> > Actually, the 0x1fbf000 is the right base address.
> 
> Actually, I think it's 0x1fb_2000 ;)

As discussed off-list, using 0x1fb_2000 would include regs that Kaanapali for example
doesn't. So will use the 0x1fc_0000.

> 
> > TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
> > doesn't really look like they belong in a clock controller.
> 
> Correct, and that's because TCSR is not a clock controller.

Correct, but as agreed off-list, for consistency reasons w.r.t. other SoCs,
it should not include that gap.

Thanks,
Abel

