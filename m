Return-Path: <linux-arm-msm+bounces-100606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGVCNuMEyWmitQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:54:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A6351AA8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F384300FC56
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CE9314A95;
	Sun, 29 Mar 2026 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nX5zkHrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBfZRk7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C62FFF9D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781605; cv=none; b=qv2A9BrOYoG1qBvmnCRblxyrAkQD93G6A95hgXNv51NYpbq/qqVTsXTfGtwQ3LVmJxo/Ax8RPfwDNlNPUOkvUbevx4TujU6iOf52jiVhFIkA5b+8gGjMHcTm/PiUo4lDKQuOJUWv1WT/ntmnrFSCfU9K6TSLLz004AEohyjWnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781605; c=relaxed/simple;
	bh=BdDWlm9BRqHY8tjK8/4aj7Hg0e/7Tpv2q2ieM1+zSVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UY3+Jf4gImvx8KXcR/vvhU/mM336rNWMFX7TvcjdNrRIqeLtZ+UO3qrTJR7QkBYuWbKOsZYlwQ95HKQcG38ohgMwiix9JZsxtd/uSsqKamTMMTl1L2W0XsiwWPaSrnrrPNiItLsFoqf3Les8P4x9M8Ao6o3EJ0Djd5a5Vp2zzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nX5zkHrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBfZRk7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhiRj581227
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/rTaVNY1wzo8rZih8YshA5dD
	ugomeeDFDEcqLjW4chI=; b=nX5zkHrQC4Yrea8CBQJr4ttsarHDQ1xlUozdAStv
	eqGBaURSCPYj3mtd/7tLcHEM5avU8GTZjO6Gvj+PeRL15CGgJLq4ArO26sAcWXmh
	8I7lF9sCIKBXwRAp/NAymhec+gbb3ATw8XLlIMLB+y4yLENMh6HHUOmSnKqK1kzx
	a1nOowmqi9Kqebzo8l9miqdw1HsyVZzcS61gJ1nEvfvccHxfWNV3d9NvvOuCoASX
	gcZUu4fIDpccva4tDSJtBGbuEfdM05PLgPEUJd0SW2D92xRCxsWQiUWUA0vIKL7L
	Oo9p+kT1XK3MDlvVdnwxSozXNKYtTlaBDXe/jlux2RS6ZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjryu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2cbe7223so118080171cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781602; x=1775386402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rTaVNY1wzo8rZih8YshA5dDugomeeDFDEcqLjW4chI=;
        b=PBfZRk7onzoBgcZLRHX3+aF9LeQpYxMxaLJcz7/3qOYYhZu5Uvd+TyDtR0j7phrzcN
         lt8lhf03FoMcI2Sj/4JmoMGslsH5OBQH/2rOsJyRSTa3Qu8FTwdf8ryAI3vuz9ptcShN
         gu/36mo5wPxmsWgh43mIrzOpSdhsYkZb6uI1LuIOLtadHsclB+OcWipx2aTxeBvxuPDF
         AMXy7tDvhmjkSUNEdgzDTVnxs1YNWrcJEfxqi4U6tJt6t/Dp7nNJotIGREczBNHVyYVx
         YcfHkyAnphPJeDzhXpL5YD9IYRUSmAtlaPuHkfjGw9xSEOWhX/dworA8/KbNawCZumMe
         HHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781602; x=1775386402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rTaVNY1wzo8rZih8YshA5dDugomeeDFDEcqLjW4chI=;
        b=mtrdzfM4ZwtzSJ7yoMNd9mK479iJGvKJ7ucDFH6wffXsEt9y68vgsk35bueAWBo5l+
         HVT6aVMOQmoFz4f7KYBZsPlxcXyCVlFYQyIx69RDMcNs/lkvkuKo2uOFj0/ofSiCN9Bm
         zhDJqkv82/6CytxRCLs8Dz6SB4OayrfTLu2kkQKLtpNQRbdB7wagBUG9f0XwLUPPQy/U
         YOnVlKieQJUXbOlx+HJqwDQy4XZ8azumVQPgHlQ298ppqdz4DkgCxZGGKJtLbTSBbbwH
         XJUGuExfOotg/NRuGDhmMrkEY/wPnOjLsVylAvPhmgJAnMAzhvTvOmlH1lP1GLeY29Ki
         6TNA==
X-Forwarded-Encrypted: i=1; AJvYcCWFJ3ISFI1z7NXthp7+oHR4YBPlG2z7wG/cq1O58FDF7dgCo+czLgTs0ItbHpXrViVXih2iXm3M+UtbmnHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHb7IG7HtI99WFklxJqVNf/0zHoWDYzub2R/Cmud2WFydfikMf
	wGoxebPbIuSsjaIWWOgrco/VbHGOWe9fNHZ/XwfcEY2PD+QggbC4UqxeClFhsQ8GuBvGjmaqDIG
	qALk5y4v9NtWK0gRYAi/WocjlMIK/v5O77+c70e4ek46jrJHP0y2oPS3tKOM/2/Z+nnYC
X-Gm-Gg: ATEYQzy4JgSedzje9UW5i+/zxeDg7abD30oOwF6RYLt4DvYp/JvxS5BXq08ny+cQt5v
	QSHY2kjIQ7CNDaMZzh+7igbUEjm9WE/uozAvIBIT3zN/Pabr30+rnT981G3yU5iUQLNSIVWsMVo
	Ev7mAUJaEyY+WeBP5yHSHzfX6ZexLywDEZuhQnsMDmZitxnhbHcZWZcahHEBnBuKwVXeI/kF2d9
	/maH7qWFI7qu/CkdBavbcBfoEotKf8WaPDxNpJyYRolHItoNBdww7N7JvytkVVukBuBj5aIqEyB
	X/56dSs4t7YYvIpaIlCP60otZ702BBGxTFNxMzdMYggBdmBp407+7DznhcyOLoGIIvrpa5KLu3Z
	+1fiawrCpcm1EzSjr1PiED0R8sTfvTolZCmsSCkiJLFaV+B7AZbqI/CLay9mSpv1XwYAQI5h9pM
	meImgiYWqK34lIf7VOCi9WBB75iweizWzdxuA=
X-Received: by 2002:a05:622a:24f:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50ba3832ecemr122080951cf.29.1774781602547;
        Sun, 29 Mar 2026 03:53:22 -0700 (PDT)
X-Received: by 2002:a05:622a:24f:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50ba3832ecemr122080811cf.29.1774781602164;
        Sun, 29 Mar 2026 03:53:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4350sm968261e87.11.2026.03.29.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:53:21 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix error path on registration of
 multiple pm subdomains
Message-ID: <4m3n5jrnkpfvaehyx2yjzonbyl4o7ejn24bwufyilenbbt5x7r@cixwn4gihkt3>
References: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: ea25oO-5iJ-NUq9Jr5zaf-bhPDMJDD2f
X-Proofpoint-GUID: ea25oO-5iJ-NUq9Jr5zaf-bhPDMJDD2f
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c904a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=7RLGmS9YjY5vpI0NjaMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX6PqpmW8n9eZr
 xjCerdQA8wQI81xz2ZxRtev58fY7+xx/d9a7z9Zpc++8pneDMOMGZIFcpJy8elV2xFwq613/+N8
 pA+FgAVnh7vzm6W8vXrST3iiVdBFKn5wdpF9YWSq72Tg7UZh72Fkc53V/1tevLeo46qc2NLs1IR
 P4YK0kiKf9CAvCUfa4IT7eRAm630XHgWxbbfXecc1mDBaRYjZqkhgjNG1MrstS40RCvfa1pLkNT
 +CwuKsF+wtaEcZNVK6dzGtVeCn24DGVSe8+iPrOn0IshRu63jwM5A5ejri0J8WlwjQACxIL3/SY
 UX6QlcFWuL4f2+4v18nGIjgbcqwnJFWmeRMMiE/SfeOaXAyLsE4rqK5f9HqoDjftnOkSkW961K7
 4/2BA0aQIEF+pytVuIumubgy9pMM8FVA+20W3q/jAYiAgH9P60nyfpQKLkzmhFZulQHZfJcmh/z
 wqNoVpCkc5a1lx2Dwmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100606-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 899A6351AA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 03:26:19AM +0200, Vladimir Zapolskiy wrote:
> Some pm subdomains may be left in added to a parent domain state, if
> gdsc_add_subdomain_list() function fails in the middle and bails from
> a GDSC power domain controller registration out.
> 
> Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

