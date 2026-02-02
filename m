Return-Path: <linux-arm-msm+bounces-91564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ERnCsgPgWnmDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:57:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2AD159D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FE2D301AA5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 20:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AB930F812;
	Mon,  2 Feb 2026 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldi8WUkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXnxzxAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE52ECEBC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065605; cv=none; b=uQh1gIKJrUxP0I2ffacc1QhmFsAd4d5k497lzaoISpYmbOJ1XWAI6fLtHsbK+OsptQYogFaLZbttHG70W4/fqvXktawMW2u2iU46mRgUqStv+Nfov2x8/RPVoSxkvW3I0fgUY6eehdlwrRpdE2KJbFkJJoeEtG4Qjb56rfya7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065605; c=relaxed/simple;
	bh=2vlaXSLaGFUxT7wOiZ58bkGZ0gHHQVhhJw2/lTdIGlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7C4y32sgVz+xltEJ09bI5J8mld//1w8QiEld5RgLFX9ukCDgG9gdwNWMpJYg0YhDbZDTtMmHXbNiay/gXWxE+KHg4cfIeNRRBE8iB37iuEsAqV3NrbsgW06mCxe2PhHPIbc9e6dRV6V3e3kSzWDpWqzxEtrb8eEngaFjZDnEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldi8WUkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXnxzxAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612IYU1x2100258
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 20:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GLN+casBjIOKtCjCw2YctrHy
	DRXxC6sdK2KmnTQrA6A=; b=ldi8WUkSBgXdDQk1Eww4iqoIIz22hZ2iY5RhbEfp
	LVZC0/H+FGOUfKw4DnYgzzoqmroc7Y+6USnEAadekY57SKMVDxT+gsaI+3eSmio2
	XE4kHWBt0CO4vtHM+AkG72XT/5IWLLtZLF2QMl4iseICP2eS4yDnWiUQDlDGZZ7X
	doJGRrKH/NtlaSO5jjGxh5ZQryJqKHr4JjCaEQdDFztzp7VEGilW1vR7mcdMDofs
	zYGaBIC2kQDyKyp4pXq2lPOZeD2WsLbmNR8EnDxGpnvAH6N07gbrOlrDpfpStSIc
	gwYdVXkZcqrsfKZWGGzVJilDMMlVLxdMPzBqckvytPwIKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5e9waf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:53:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a62ca32so1499949285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770065601; x=1770670401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLN+casBjIOKtCjCw2YctrHyDRXxC6sdK2KmnTQrA6A=;
        b=MXnxzxAuhOocVo3c0SDH7a9VT4DNYq6V7J6P3ZhWl1QyJDl1J895TTYlUVe1/ooiYT
         XCX4WoviR3HMa4mVZhb4dJUEWTzQZXx05FIJHrycy/aV0fBqmaFsCtwLXhJ1DgPpQLMQ
         KQmR9cuqCW9m+4qHLDfg+oz6TVX1LUWKMOEjpz2YdDdgr3zDiVdMpSCciR1M7pjJgCcc
         c92q2EooXyo8dfpFIZWJ4Vz7UZ9tul3NMRM9mSsNnKSGInbN3AFSFH8ebEIxHuq1ZCAR
         +yuSXURJwRTBKL8ty2sFKsm+OhGS5HDFSvzYd2IksyVE1kdM0ak+aV4Z13fpvYlcZI+K
         FV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065601; x=1770670401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLN+casBjIOKtCjCw2YctrHyDRXxC6sdK2KmnTQrA6A=;
        b=Rw0RXl8Z4evKihhKUirakiYLPTtV4aYb2ugrbKXlHLgzpTSoh2AEWtIn6mK/fmRf9E
         ygEvBrD4TmO2G8XGRv4XdOOl3x8wbpBqCJIPHNMc2ZSf9erNPjfvsOzhWnw7vgnEsDbN
         mFBZ2JJGSYcsgzTcvp54SWcD6z5yMblJn7C6T2bGYdcRuJBYDgPozGE6s3IjkF4RFAcT
         htYXuNHMiEgFSyYx34Ec9cO7BfWdf8yR94H8gZYv6BNrrO0x7JP4ZPaY5k0KRggAE9o8
         Q5grfmJF37npq7A2JOCg1saMJIg3QjzKHC8zku4lNQuuA0A0629Wv9R20yM88lF6w5qz
         9M4g==
X-Forwarded-Encrypted: i=1; AJvYcCVGpZPFygcqm5mDrnJmZ9BndOlinFu2uExGsVypRWChIshd02Cqevvbw6EgF8SAxZrkrgqf267RDQOYSaPY@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXyApl1lxyhXg37BcJfXCASmLnxBU46WLI+dtVcSb4sKp57+G
	ymMFz77tyzcNbgxkfO4+/UVdPq+Xjn+/hrBMcKHJ3g8UvQSMSrhqF+BVabQrw+9f/rBfS+SdOTf
	A/IABlufn8dK214vjWxMxcW8U1tpMWNt4wZYc7hHJ/xX62REVE+mqXPTnuXKByS9n2lCJ
X-Gm-Gg: AZuq6aJxYklIwTmpdOp13M2n20yk0bQbP7ljYvuZYoM0ywtuEdpB2tn0oiJy9MAfddM
	EZJKp6gfIib+k5kTbshRSWfzP3hSOr/P5BnHzVIXDTBvT8qJQUJ4PA+IsIFJEyJGWP+Q2hunNgM
	1iWNey3b5SEoB6A4Q8JzxzE1I5o6B25i6W5py1hiXYkpY0BetHba6JEIkcQpDGCA9zOVlKJDTSz
	Ta0v5rOFPjyTPkz7GxwEXBRvEozKcQiMafcM8swajixyOtIThVyUxbap/1k7XjZR0ybZ0dQwrtX
	LJlqoZShxK9BlVBRJRRV9yT7QnTaMg/IPHJ4wMIzRvneQUqcSUL4si5SuUMwiqprAKrBHp575o3
	j78bMTYsmnQsxxJ6nuTDH8wgt
X-Received: by 2002:a05:620a:440d:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c9eb315ad7mr1821082985a.79.1770065601442;
        Mon, 02 Feb 2026 12:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:440d:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c9eb315ad7mr1821078485a.79.1770065600824;
        Mon, 02 Feb 2026 12:53:20 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm44717903f8f.17.2026.02.02.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:53:20 -0800 (PST)
Date: Mon, 2 Feb 2026 22:53:18 +0200
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
Message-ID: <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MyBTYWx0ZWRfX4LRNTkwJhiJH
 jedge0RILCqFi2NS5ICki8Pyx0jiY5dR5Ae3bjrMlmlEY9bNn/NywAUG8HQq2dd3s6TBb2g54tU
 aXqPHgQhbWkeFXQtl7S7D5tEIj61J4SbvXzgfq0Xkl4Eh+dZfvjR5qR/Viuou0hO85kbEMHatLl
 65RFHq76OSTuvLZe8Oex7t2OX9VQ+GwL4t8N+gKUxfUvAPcpytswzqxG+6UKlx2hhbbkaDLYsCX
 n//GfnhMClvIKvx99d6oOTWDlqdDyvBvbhE1ylg6AYUh6rFU8kwecd8nLyBrqFuaX+ZOIObBL0C
 GVKxChidTJetMc/b17tKBUMPW9KbzENmZaFR50eb4JOL7keTz0YchjkVmudpIBLjNWHfOOQzshb
 jtq0Vkh4SQzy7j2Z/nUUIRBe/Xq7X7UcRSFAsLnVHv6POdQz2UpBFhZAVaZnaPAtXDv76dAESGy
 ZFBDrkVHJwObIBoRnng==
X-Proofpoint-GUID: sUs8n4eW2chdDAbwTlaeIK5JqXWRDSdo
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=69810ec2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ga2sCeFbclvdr6Ph1usA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sUs8n4eW2chdDAbwTlaeIK5JqXWRDSdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020163
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CE2AD159D
X-Rspamd-Action: no action

On 26-01-30 22:40:32, Abel Vesa wrote:
> On 26-01-30 10:43:44, Konrad Dybcio wrote:
> > On 1/28/26 3:10 PM, Abel Vesa wrote:
> > > On 26-01-28 11:34:49, Konrad Dybcio wrote:
> > >> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > >>> Add the TCSR clock controller that provides the refclks on Eliza
> > >>> platform for PCIe, USB and UFS subsystems.
> > >>>
> > >>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> > >>> @@ -0,0 +1,144 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0-only
> > >>> +/*
> > >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >>> + */
> > >>> +
> > >>> +#include <linux/clk-provider.h>
> > >>> +#include <linux/mod_devicetable.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/of.h>
> > >>> +#include <linux/platform_device.h>
> > >>> +#include <linux/regmap.h>
> > >>> +
> > >>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> > >>> +
> > >>> +#include "clk-branch.h"
> > >>> +#include "clk-regmap.h"
> > >>> +#include "common.h"
> > >>> +
> > >>> +enum {
> > >>> +	DT_BI_TCXO_PAD,
> > >>> +};
> > >>> +
> > >>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> > >>> +	.halt_reg = 0x0,
> > >>
> > >> These regs certainly aren't at +0x0 to what we normally expect to
> > >> be the start of the TCSR node
> > > 
> > > They are if we add the TCSR node with reg range starting at 0x1fbf000.
> > 
> > "if we take the wrong base, the wrong offset is right" ;)
> > 
> > The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> > but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> > 
> > The registers that first appear in that region are the same as on Hamoa,
> > and so is the address, so let's continue that tradition

Actually, the 0x1fbf000 is the right base address.

TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
doesn't really look like they belong in a clock controller.

