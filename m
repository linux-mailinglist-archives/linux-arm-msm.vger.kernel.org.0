Return-Path: <linux-arm-msm+bounces-98467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P7uGIN+sumlVagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:47:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCE2BC4A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F032300D0F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1530F3D9026;
	Wed, 18 Mar 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPvCaOLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwItATNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B49390C8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841611; cv=none; b=KhwCllnO+O19nMnvsaeFrZ5bJmamgFu0Ejcy2RSoYP6nxbRZ9fvP4XPvotGD4pvok4CFX4LvntlVjdk5Z6JLioloRF9QW9s9kIDLFi9p+xlXzAkUjOXz6DHdX7jk0Nk7z1EG/7Zr7MmJi3M5HwmA5AwZab52W7zwocHMx8zrAl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841611; c=relaxed/simple;
	bh=sm7GjfEX5XQyMLkWOaLdD8o5qur9TwiNeNmhiSPCJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/l/cZupqy/lSdHaMw12uF9w2eKFGOZwJqHv1n9ZguwhqVz3S8kitIJDut0sNWJpgbp5guCYzDhb6mDgekAhsj1UgXt3LNQhsSNkWaw4eKuM7WAXwPDpGVFU0vev/VmTypptKQkpYEq7drO9QWPlw6Oqg2n4Lf+rBrUqhUXdRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPvCaOLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwItATNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi7Mr008805
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IDSFjTcjEjfACG8rvUFFH5ed
	RHFF8AGGlL7KJH7J7Qs=; b=ZPvCaOLF4tS2u01PZpSEEN5nmtUMq6uyXViQWeV7
	IlE0iPZulEefe30jSEORchIC8vV45LK8lxttFgxkbdJJi/b71E6fbrTLiyo4S/2o
	tQzGsSvORk4kqoOTKNG5KfkiCyjTnCIp6w8tlkApbRCrOuRXw9pnhpcQ9osinX/c
	jCG6cvQcER7GESq4eHg4v66K0GBlyKrdULYyJatLE5W14lQSgq7pt8fBashEoh7h
	UQxYDj+eoqvAOhPcdOvg/1m2LgCdMIqD4POAwTLM7pfFcZYNtBzLMHlUGGbrp5vF
	hEv+Pl6mICA5WDCZa8QAe1NThDdC+K9o+xNUqi+GBv9HZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50mjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:46:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509114d7418so19296721cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841608; x=1774446408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDSFjTcjEjfACG8rvUFFH5edRHFF8AGGlL7KJH7J7Qs=;
        b=ZwItATNOEPchWE9TPwa6mBo+YRCpIGSUkU02uGLwreDtZqYNUW1L+XJbBk85t4IWFZ
         2FvY300uY6dGIkKjtzulg56BJ2ziW8aon9JqLZSv2b6tdODbo38/oYDmttTIKBZQZ+Cr
         FCBXL8pagvtdx5iZ3XdqRvPfEqmfDRNzfn01ZcecurPU2lqpuqdi9xAAU9IxtrhWYKR7
         TFGduQ4OzpMs7eP9qKaFyDEchDx5picEiWstv07ZTvWAxLph+1Drj6IPSHqoaMaw7Gkx
         0CHiy1fr6YW7Wtjd1wBs70Z/qwEBLxj7FDoOKtheYpWvuV69esZNPNaf/YQumKsx+Uwq
         kvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841608; x=1774446408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDSFjTcjEjfACG8rvUFFH5edRHFF8AGGlL7KJH7J7Qs=;
        b=tH/53xIfesn73hVH13LjygIFDaJR/gQILnKlRi6H0qyKtTjshpL4SN8cH8L7j2JbC1
         j/n729wgu5O1ZZ4WibNsj0etwepP07ek8HBKk8OqkfmeB53kiB/QitUWbo1nQZ3ROmCI
         D2K/8nKtkv01qIqcXDXyIKM2x80TFEd2v7/Bj2L7bob//ZKOCi62Plp0KpL3NlgOaIol
         dmbvM+ZqrKlCjJMrixYWJvixbqC5SXDEGx+Tbq3+rsN3PlI5Sh1m5sfYrVEWsZYNPx4t
         wAw+fLSHhWx2vjwgITZbb6PBxPzZUPvusKC9PqAS2VOC5YsujTZly58nCCnswkRJJ30x
         Gt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdPGUSlOjjUsKkUpP2GEQspk4Q1sgZ/sKxZYTDJkhKX6oe9teAbxZ+NKhzEgTR9V8YfjWUJEB4ItcHHoQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6VPYR9Dpm4BjrwHecBeBS2pcNyuCTylibqCCpekvxotHa9GL
	7NRmc9KukLTDwVQ/Q9DeSH6jsQJi+Iu93mZQYDIj7icYi5a2tAKftuNfhOlGH8cZEevenXcUqyc
	7FfIh4MhxcSHgAYliWJseNTZ70KZ7Y7Aze0LHX4II9qbBJl6RB9f2csfaSrBclvKdrOMh
X-Gm-Gg: ATEYQzwDotSX7ykoYcQZF38I3eCWwMt0cOgKWDklhScx1TF3MmljpgJiyUcKmmUKkvO
	91GBT7CMwLUrVEddaXb1D17frnk29ld8uIJch3zK8MV+WP+E6Sq3XpfK/VZxPlPidnmh9xTP1rT
	oRjLha7SwGuxLDr+ab9SMcrOza7I3YZhptPg+p4qRmc3qy9WjyvZbSJHKimguIuGZj1HMKQ1Sh/
	kIy9D6D0tvoqkHt8yntOlaQ0gtrw5nb/EjerLvgmflu5YJw6M3G/aO9wrsbYd8ZzFxU0Q5vjbCU
	RNvhosTzvEPmrEybVLCUYTJsU8LeqbxSwRXHh/FZEIbENdnDTEL1mWdBpfJ2f4URb6ihPr0Thk1
	nShW0hBywb3p8TCNNr0k1q42grnCodY/r+eOitRuOiQ1JPQwniUuyWhxCsDObM3SbbBlEhQXmNn
	rpUFg3wN437YQbyrfPuzOvWnqSbLpC22XrVZ0=
X-Received: by 2002:ac8:5a82:0:b0:509:1ef7:dd90 with SMTP id d75a77b69052e-50b14743c53mr41534541cf.12.1773841607942;
        Wed, 18 Mar 2026 06:46:47 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:509:1ef7:dd90 with SMTP id d75a77b69052e-50b14743c53mr41534181cf.12.1773841607384;
        Wed, 18 Mar 2026 06:46:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5157108sm6168061fa.1.2026.03.18.06.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:46:46 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:46:44 +0200
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
Message-ID: <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
 <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX6x4kSNlQAMYN
 oeQdkRogjaLlxepFH2cIH+Q5PCEOdiCdL+oQ/qrYkbFFSnc37xwPeSVjCsqQjxvNzMxWIlJ51mh
 1ha6zbNbXtaBsCclwxy6R2P/iU/NFKes+56nfAxjQnI13sZt4B3XJZROW61Dd1dOGzkdP6VV5Dg
 i8AAmga6Du7vICNv9VEWxyrOh8+zOSutUklUeQKliMitWQzqxDd6hvUkEEpfOQBgnnrKD9dSZMg
 bIJdhAGbbZmpi2UvKTl3xeknZnPYaUb+oK7SzlT2Nuflh/zZdgLG6O1yZESXVFtS+jZLuHHZUGE
 AUQN1Quc/kd7Mci6dj05V/026Qd7g5eEl387FnrR7NH2d5oTug7k8Uh3AkNfrfaLKIS9bLnmC4G
 TGpcHpafzncL29dvbuiFFnVS9YWQAqRt8HP8Q9oCpY+te7oX75PTBi9NweiMdEoV7ntYAcmSp/z
 rr5VpXEBVZKQ4Xja2Qg==
X-Proofpoint-ORIG-GUID: zuWjwvDfqrFUILFeRNVBoDmApKOlN-P2
X-Proofpoint-GUID: zuWjwvDfqrFUILFeRNVBoDmApKOlN-P2
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69baacc8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HmPH9EL2l39KE_PJ_n8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
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
	TAGGED_FROM(0.00)[bounces-98467-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5BCE2BC4A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:36:24PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:32, Konrad Dybcio wrote:
> > On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
> >> On 18/03/2026 11:48, Konrad Dybcio wrote:
> >>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> >>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> >>>> which is copied from SM8750 driver plus changes:
> >>>>
> >>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> >>>> 2. Eight new HDMI clocks,
> >>>> 3. Different PLLs (lucid and pongo).
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>> +/*
> >>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>>> + * Copyright (c) 2023-2024, Linaro Ltd.
> >>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>
> >>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>
> >> That's the copyright I found in the downstream code I used in few places
> >> here (with modifications) and I am not touching them. I also don't care
> >> about these and I am surprised this keeps popping in community review...
> > 
> > You may not care, but our legal department does..
> 
> And your task as community maintainer is to care about community and
> Linux kernel, not about legal department.
> 
> Legal department can comment here, if they care. You as maintainer have
> rather responsibilities regardless of that legal department.
> 
> Don't bring corpo legal stuff to the community.

Then please follow the internal company guidelines as outlined in the
legal&marketing documents.

JFYI, several other Qualcomm maintainers also enforce use of copyright
headers for Qualcomm-provided patches. Konrad is not unique here.

-- 
With best wishes
Dmitry

