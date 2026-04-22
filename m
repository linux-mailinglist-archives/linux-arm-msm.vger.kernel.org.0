Return-Path: <linux-arm-msm+bounces-104168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOezMnAT6WmBUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:29:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D16449BAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB79304DEAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C07F3A168B;
	Wed, 22 Apr 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o17J0P+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmBhH47J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473073806A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882335; cv=none; b=IkL5mrrlz/z8+FeQUY/THJiMTbJyA3RSyl9/HLyniA1WAVqmEGfAREOVrVTd8NDYu5bUVX6WJV6S/zWe8nIYMhs+PXNeJkOhNFcG3yxOJqaexoNA4iyYd9UeJuUkxmWfIFXi/HcKN6yXiTlKqYIU8vu6mFCdbPAjnY/LhgsekNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882335; c=relaxed/simple;
	bh=9DKRl8QYVl9x5TgPt370YkzjxrOSzgrdiRjOVx4OIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDd3GnlUL5RZImWQweS3foxHRfkYBO1COKKmLLgzMgxmKP1dCEw55z6mTPrRL/7nsweI4OJ548mc8+LNPXnw05k3eLNLe8cEmdpRqb7NB9UX3TWHGOICJqNZu6FApKzoAGO1hAvC80dFAUCktEtjiTnG5hUJIawMIkKU6NdZ898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o17J0P+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmBhH47J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfLVk2956103
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTvaeUQtF7QTlnD5MjA8eD/C
	AAUi0oyVrLZtmtZBRXQ=; b=o17J0P+zrrORnHuLub1eXptrRoY1Eyi2k13i4qNj
	hvzVmg2I57Uv70Nzg81dNyXXx9fIozBLgI+PHt7+MRxJc59oFut9ogj14JZX97bz
	wX9FTH8xK/bmZjy0+Pl4sD51aw/oy4IePRkB9l/CNK6W93ZML7bbDTyi80PBuVhg
	mjzVFLHli3CD7BGRlzOkuEhzz9kq9kEAyWlwQAo9h9i/PTXmqW7+AH/vDM5zVbns
	AdHY2u0XRDGegtBHKOnyBwAjBudOKYEkq/oYg6rv5MYlmDxhC2FoLUmDuFp3bWJ8
	592vwM5aMB73poeVcwfuKhhcLVs0B6oihi55ljCyVVBfsA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0k1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:25:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso2518198137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882332; x=1777487132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTvaeUQtF7QTlnD5MjA8eD/CAAUi0oyVrLZtmtZBRXQ=;
        b=YmBhH47JPUno6S/HVlA/JrU2EZOUJzfpgHGapQ4z4TzbPV93C6vlUQb96v0P3G1DAU
         jeeYG1c5AHM5ANmbBvxmx4lM7yNzxvvprCGJoGFYvJM9203rsY4P3gXAHNWQrKTEakYG
         4TmZ/6D45fXpKqAloPK7fv99CyrDtoTnTL4ZmSLIZ0lWwEPXd68hjOSDRwZpipa2g/xq
         rKjvFRr7kugu65cAsu5gdT96ru8aDtLXuaN4uTHkFuadsHi9KkJF07t+b0C7ltrP7qfP
         8VHLVc5hrVh1TkT3/6ArupvvjJYs9Pjfsm6vrHkR4srWU8zGcC/Ck6DHEmYHCG/A0ovI
         8K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882332; x=1777487132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTvaeUQtF7QTlnD5MjA8eD/CAAUi0oyVrLZtmtZBRXQ=;
        b=SX9Ysdw3rH2S2+GUvjmaoN8tjjIKGHzQS7Mxk8CsUXgQx7nlVxZIasw9g17GETLSFC
         W7Wh1l6w04llLC2/ns0qUSN6PPgBrOEJ+l9vxWP63DMrjyUT39TQ0sebBvTIdEXcCYdX
         0w7aybUW9JjXANxbAJkzcL23iOMGh0a8ySVrzoD+nQaMIyac5EUOwpceLKFwAOpDhZPP
         CLKsaxC7HX8nG7Drks5vSZY7QcinIXo5r9ZdQr9TmNnxP122vUNS19uXDI4bLwj1m+v4
         rrOP03Z3qoAcm+QY82lyPu6h8an1TQrbFRQNt41TeSlayBaKmIZiP+40vyxemaAYbRM3
         6+XA==
X-Forwarded-Encrypted: i=1; AFNElJ9Gs+XZmh4uHp4d6Uq+nfHDyXZWIKwTjhNO0MC83sWVzNWsspGXUCdYuHkCznPrMJVJHkWZM3xOM8THSU7K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywohp/j0uzUZZIe4QASNikDj1Yv18mtGT91REDUTDlAufdiTim9
	QjcwBF3yFIRq8Pwx4kbPc5tbMkVOpY5EKHvwntB2j1GcWs0dk3FNn6OQqVuLk3onBrsYAOds4bd
	Pw+VVE4INOhInvAk4jqyT4MsMvwU2oPVW2qbG4KBNY0gLhsq9uWrzy1Kjy7QJpPxsLynm
X-Gm-Gg: AeBDieuvt0vy2GusmS6Dg2TvVtuzbzyMOdrTF98e6iBxtn6bTwHhQxxB4vpbkJ2apM2
	ZXvcHioweNOKu6rIUduiNN/DLhL7uapoxFkLMmwQZXyZDKaHS93JY8w1e2lwjMe20FKpdhrdTID
	HsMN2jtVEkTHwWGMkr1KdqyBs680RtGXyEYejN0kKAQbY4l10UuCcKn7A5mzID8ycanLyEG+NuA
	29UE9bNgsy91qVSuxp8GIM/I6bwjQcfk5WL17Wv8a7ZqTZBfLvESswLiuXJB1SlIsKShCTiw0fu
	IJzC6iqKqd4Kx26SlokaSfqclixu8HHxrroz16hZCcYUgFJQvMdCi6kBsyTgxYkZsIBu1qpNncS
	CXbnClAi+TFZaT0ry5ijPRLZfrUrIX9RSrdmeTasb+Or1WQwTGWc9LVhwLPhcFxjUlERCBjYZSc
	q0beZ3XLM9lIS6wOIOhDP53jfYVf1qOsaqHtKDx2xJT32ezQ==
X-Received: by 2002:a05:6102:689c:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-616f4e7a272mr10488492137.2.1776882332153;
        Wed, 22 Apr 2026 11:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-616f4e7a272mr10488468137.2.1776882331561;
        Wed, 22 Apr 2026 11:25:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm36295321fa.12.2026.04.22.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:25:30 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:25:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 06/13] clk: qcom: clk-alpha-pll: Add support for CRM
 based PLL ops
Message-ID: <olwylygq2ljeqa2jobis3nfryqtqfqui3uhtb5rpl6ix4gegli@sioyi3kyvb5f>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9129c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=x0UCZEZdVX72ttqwImEA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: vDAhYfCCjVNS2BnkYp4Ftebsiv-tp5yg
X-Proofpoint-ORIG-GUID: vDAhYfCCjVNS2BnkYp4Ftebsiv-tp5yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OCBTYWx0ZWRfX3eQ573IB0Lm8
 +GL/YfJ0D9iObmFU7eoGshKJV3J+6zgov3QXkqsZISrvHNf1MSTmYuqKJlo1HC2Ip2EnlH518SF
 JEzOqJ5r+yZMHRSv1AztZim5mdZi4W4ZgEVAHW024vX6XN+P14CKQpDjkb5zertr/PAH4cQFr53
 hKt6lI09HDTsbEs9Ab7GvlT4negCh/DQvcmEnQLgZDsprERBzg3bnaPp21nTOzpgD9EXAk55/pq
 zVseQUOj4hq5I/ecmxoDrWZEo2IuoqARqk6jdgKXLpRE4T+gEv3k4pJF4qtNTNXJLsJhrjy4w7v
 P/uOiQuVuFrDdX+NM3gq42Jx1xTYA7PH/IiDNIIZMcTP93qJqhIXMW4rNQv6VughHCKz4vT8SHR
 XviSsjBNYqn8RZA/2XOapycCzuix0Bc4F1eytsrXudokMfd1PDEJVtwQKsGW1Urs+TRFup0M0h4
 RNEj784GYeDofaJ0gSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220178
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77D16449BAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:59PM +0530, Jagadeesh Kona wrote:
> Add clock ops for PLLs that are controlled by the CESTA Resource
> Manager(CRM). For these PLLs, CRM programs the hardware based on
> aggregated votes, so the clock driver does not need to program the
> PLL registers directly, but can still model the PLLs and expose
> them as parents to RCGs in the common clock framework.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 7 +++++++
>  drivers/clk/qcom/clk-alpha-pll.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index f8313f9d0e30ffd5393e3163ebc0e51b2bd96437..67fc97739d0d4c26aec0bac5d43d1b87d297bc6a 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Note: you are supposed to absorb th QuIC copyright.

>   */
>  
>  #include <linux/kernel.h>

-- 
With best wishes
Dmitry

