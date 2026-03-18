Return-Path: <linux-arm-msm+bounces-98524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHqkKYfEumkNbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:28:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3772BE2E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04E363118A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785FE3E1D15;
	Wed, 18 Mar 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdGeTTlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo/YGy+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25B3CEBBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846369; cv=none; b=IWogMKI2X5WO0x+Wr8RzRIYwitHEeIfmyeXIVLMS4ThQi4uVRWQOIutqjAXndKpeKyeW4kEWfRhUMNvzJzvMvLbPUHUH0EVMV0Ze2/QhFk4l9AbQEiSkVVJA/cglviAo/pJzV0vy6Az7nGCE4ot31ve0v8IDSdhYHIMkE2FVafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846369; c=relaxed/simple;
	bh=w8RVlObokax96tSpdXL3RgM28FgDZ7jKOP+xERdOEDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkHig4TQoXkrn5wATtRDRD9pAPLLIttUDTc7gy/TDyuvsLi3yvOIbSoaZ4O+0TEG3y5YPYCUTGCW0xolVZZh0oGkTCG4uzJ+mLItpo+Fi6sdRqPV6sBVI/3zUvi5d7bjYigr5NHbmZ3iyOGnq/N6qwQxFTm9goez7fTx2Dt00c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdGeTTlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo/YGy+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICJCl92878124
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whZ+BLOA3aSGWD/2ng6Ki2lM
	3Sn01GwNyZKo3R4NKMI=; b=hdGeTTlmMxMj3TzYlVrgXrj/e1/Hzj6MDLkHrFic
	+y8s+mDG1Geh4e4Ju/56hTT6aBksCxF3Vjr6+HVxlX2d14yw1fZ+XYcQQBBpECRr
	GqHJTTSammK3CpezyGOOltekCt+I3l6NSdnIX9Rd6GrzbK6ygQlQWn7LuA16PYpC
	nGWf/PQpTDFGKV1d07lBp/0lkU2ahjZOfGrqoPb/P+HQ3bWVtF4UY5WkXnle23HR
	O/1ESgRQ3KBfjXSc+WLS33Ji8Q18FaM6NvWFGVM2aXSuQybnUNHyGD1FEwWDz+mq
	O2yev1cNopvbNgxahs6wEUUHLS6nQo72gjUntROHQbhAIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr21d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:06:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60280bcf80cso6959407137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846366; x=1774451166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whZ+BLOA3aSGWD/2ng6Ki2lM3Sn01GwNyZKo3R4NKMI=;
        b=Eo/YGy+0wuAB72XhM3TnEBvTrIf25CjWkD7vMgeanelRZtkpIKXmRBXicrk0vi3UNJ
         PWqBtWQNe1dSH9afYnGsE3QKuA8qtiwryv+dzY/HSeFfmFa+XQN71Ysjxao9sbUW4Kzv
         +IG0iogbzDtkgJXUUa0Vhuips3b4hSczVB3zHGbla6LzuTKqFbDlD1WEXk6vSehwkN6v
         vVBtBcIwOHiwErSWoxKta6ZXnC+MSJGsHXDgJjtvP19CGGNlJ5pH/QOxNOffmQ8b45BN
         YGSeNpwWg8aF9y3MajjrJb0d1fyVi9OPVQecKFsldoKsqjd+csBPQ7/XHeFa6MZcye/q
         7v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846366; x=1774451166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whZ+BLOA3aSGWD/2ng6Ki2lM3Sn01GwNyZKo3R4NKMI=;
        b=jzKtI8YaA37qK1C8WoXYkyO0ZyloDNNghUWSarRC+F74jDHQ03bpyi5Ol/X9lbTMaQ
         ICngnfKW/9ahvzjQYPpcv0uwCPsue1tik8ixEzwe4qVZnZMhZ4exFdjsdH5Ecte2Pwjq
         MwXz+BoQ9EukvKPEteEk5IXlwwD1jhiUjWKegQNwTnMEJLqsDtKMqjgbFfMLrj82+0yP
         F3puHD3fn3DJuXhY4jehqxaV0XpzwPMa5fZ8qjxwv+CObeNggsUfpEK1w0gaNoJhuUnH
         iyq0Mq4sSruAukalSiIyH2PG+IDdI8YQLzy9IsYoSvoz6rxgVs6bb0o8NsDSh8bEEazu
         jFbA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Qnv/MtWlkEcPE2iuGhTzz/+jTNWAaRikh0DRUs9Nge3Z7KwRXexsFEB9YBzYJmlF8g2kjVXIaZqKsO5l@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJH7kkjqQgt8CeS5QvBLcz+vKqSqlTymKuFZrpPyGoYRaXNwc
	R+guaPyIRt1NWLXiPAC5FD9WtRl5/+q+ry6CjmbuQpVdw32TeNQT9wAo7jgcuE8e2x/3P/hyhi3
	dO5bLVWykj9kfzZcjtxYszKU05lOuJ1B2KNjdMaKYpxd1/ZU2anawjXhjHgGSW/63zd6Q
X-Gm-Gg: ATEYQzxZgcOc57e/12JuCmdbCYZfXSYtZoQX7jgWZXsoXoGU8g5L9CHu+1ckjXlJ2qz
	ZKOAgV84408LvedXZOd1mwx/0sI887+MieF1ixu8L5PQFbhiRsNbYKd2uZ8ZPLgLUmHjkhBAQNm
	5L2wWT5shOhUl8WFeN6f41gUeu1KmYjd9AhamMoTp9zoaXoi4diCzdxVxG3z/U4aUojEpg1vD0j
	C+zbdwkDW35oOjiCwC3Wf5Pha4xiRn6LsOAXojUs20um4qQ0gzEC9uiteWTUHnnO1gn6gcqUDWa
	8pQP9/o8rxLS+m2jX19tRptXdbiKDt3dfrCZgNIvpTaPPgwdlRuE4HflGhlUq6qvoVgCTfOcHSk
	tMe7h1f2SXZJ3DoojsJeiXrqwU4guw0SLP/V7dc8ascIkqTNAnLf9g2m06l8qrs47WiUOOpXFzY
	xtQRrSEsFw3q9joid5E8eBBuTfV3n9JyOcJgE=
X-Received: by 2002:a05:6102:956:b0:5ff:ea89:449a with SMTP id ada2fe7eead31-60263f21872mr3470547137.13.1773846362136;
        Wed, 18 Mar 2026 08:06:02 -0700 (PDT)
X-Received: by 2002:a05:6102:956:b0:5ff:ea89:449a with SMTP id ada2fe7eead31-60263f21872mr3470469137.13.1773846360105;
        Wed, 18 Mar 2026 08:06:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c256sm586547e87.24.2026.03.18.08.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:05:58 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:05:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
Message-ID: <oqgc2rtmtr725u723vwueew2g7oq5aro47744j445373j4pp2z@e4oaur2fggyp>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
 <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
 <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
 <9ea16bfe-ac9b-405c-8597-e4f398347d8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea16bfe-ac9b-405c-8597-e4f398347d8f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69babf5f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RL4VFcGN3qrngw8Fkn4A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: oghAdCPJgoc32Srj02gX8qc9cDVo-PWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyOSBTYWx0ZWRfXxctOkVlEaGfR
 RZO0vB2DZSYXJPB69rrKlPWhhBAUjQzWMEYH5Qkfql5GVKSVYF/6+Na3N/A2kcuSk9sCdB3vVKP
 6FT531q6qZKPJOFS/t8F32yg3Qa89QxFfGJuTzBQwOTLLVR7RwBweEEjh2Ii5doqJZrB9wgFq4i
 uaw3cHs+5h9ARaPYLoWdbV4PWB8kn3NT+jB88KP2uLxOnfzWpNqv9Iy/x5FxVScVUCh5/49Qe4m
 ZtdHJvA91z3hBEwpbLRyOAiP/jplhCnAaDzRSPsJlHjdgfbd6OzZJH3Rg1gXpVWHxhV5Si5/N2b
 d/KNUrbSSzJp+c+UBSqgeC3gKUJf1/aNCdLLwrHT2iXf3dnyBDHtwHTRZXZ5GlDPT8DkImEayKf
 PmVy/ZhIYSNaBWuTw3J57Ipz9xNGR7wjRzZt7zaxIBI0qzOr3nMJZnmN8CRyghnZ6vFNkWZrCO9
 wjZ1NtBj2zmMY6IIS7w==
X-Proofpoint-GUID: oghAdCPJgoc32Srj02gX8qc9cDVo-PWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98524-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB3772BE2E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:33:56PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 14:46, Dmitry Baryshkov wrote:
> > On Wed, Mar 18, 2026 at 12:36:24PM +0100, Krzysztof Kozlowski wrote:
> >> On 18/03/2026 12:32, Konrad Dybcio wrote:
> >>> On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
> >>>> On 18/03/2026 11:48, Konrad Dybcio wrote:
> >>>>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> >>>>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> >>>>>> which is copied from SM8750 driver plus changes:
> >>>>>>
> >>>>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> >>>>>> 2. Eight new HDMI clocks,
> >>>>>> 3. Different PLLs (lucid and pongo).
> >>>>>>
> >>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>
> >>>>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>>>> +/*
> >>>>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>>>>> + * Copyright (c) 2023-2024, Linaro Ltd.
> >>>>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>
> >>>>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>>
> >>>> That's the copyright I found in the downstream code I used in few places
> >>>> here (with modifications) and I am not touching them. I also don't care
> >>>> about these and I am surprised this keeps popping in community review...
> >>>
> >>> You may not care, but our legal department does..
> >>
> >> And your task as community maintainer is to care about community and
> >> Linux kernel, not about legal department.
> >>
> >> Legal department can comment here, if they care. You as maintainer have
> >> rather responsibilities regardless of that legal department.
> >>
> >> Don't bring corpo legal stuff to the community.
> > 
> > Then please follow the internal company guidelines as outlined in the
> > legal&marketing documents.
> 
> That's not your task to instruct people what internal stuff should they
> follow or not.

Well... For me it's not different from your comments telling other
submitters to follow "internal guidelines" when submitting patches. Or
not to follow them.

I don't want to argue about the corporate guidelines. If you think they
are incorrect, please change them.

> 
> Especially not implied by previous comment "Then".
> 
> > 
> > JFYI, several other Qualcomm maintainers also enforce use of copyright
> > headers for Qualcomm-provided patches. Konrad is not unique here.
> 
> I already objected to one of them, so I know.
> 
> You do understand that this is completely broken review process? As
> every contributor, I can object to that comment with arguments (and I
> did in the past), however you as reviewer do not bring any
> counter-arguments for that all. You just refer "follow legal internal
> stuff". No, this does not work for that.
> 
> If you bring review comment you must be able to justify it, when it is
> being discussed. You cannot refer "but legal team said".

If you want to put it that way, sure. As a Qualcomm employee you have a
set of internal rules you have to adhere to. One of them is this
copyright string. I'd rather not have legal department pre-review all
our contributions. Been there (in another company), thanks, but no.

In my opinion, the maintainers and reviewers should ensure correctness
of the patch. Correct legal header is one of those. Consider someone
submitting patches which has copyright strings such as "(c) qwalkomm" or
"(c) lunix foundacion". They would be questioned for correctness.
Likewise when somebody from Qualcomm submits a patch with "(c) QuIC",
they were asked to change it to the current form. It doesn't concern
non-Qualcomm employees, because they cannot change the copyright of the
material.

> 
> Otherwise look for comments for your contributions where you are going
> to receive review "please remove all boilerplate because my legal team
> told me that and I am not going to provide actual arguments why".

In this case there is one. "Because I assume that you have a requirement
to do so from your company". If I were reviewing patches for e.g.
Mediatek driver, if I knew the guideline for the patches and if I saw
any of the guidelines to be breached, I'd have reacted in exactly the
same way.

-- 
With best wishes
Dmitry

