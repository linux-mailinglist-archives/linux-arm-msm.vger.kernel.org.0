Return-Path: <linux-arm-msm+bounces-111970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ikbJHJIyJ2rftAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:22:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C512C65AA77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RmEelbEK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jWBrG/wq";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FFA3026F32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACA13A6406;
	Mon,  8 Jun 2026 21:22:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B163A2E36
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:22:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953732; cv=none; b=YfzUCEjn5e9dBvVqw3BCUJcxfxNT9Tb5QgCAFLHgMY3q385zWfwRwNB7YgniTmn1Pl+ellkEpTtjRBFHilbdlDdwAQbJPW6f+A/Xnqfmd9tEiidVrDbQzKDaY/LoHyI9UCJO0FxwiRLgKC6/X5Q3K8Wz5SstwrB0mr1MiM35foU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953732; c=relaxed/simple;
	bh=XbUyMXtBZr9pGNlJPLsBaaQCIaM/yl86rjmWv1KCVOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cna0VyewNkP/MkGHLw49cnXqI2w02pLCS9EGN5W8txlxS7gwoEeBK0rLEy2PksC2EGQhA91PltWklcanXkKT2toEIQgAXw7l17b/TuXkyn40lST2bnLzXyw2GJlmbgVh5cgO7xDVgk+mvYUP7ZGWW7rYlNFsZiRGUf+18VudQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmEelbEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWBrG/wq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IvJ524089141
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVz+fOVuKO4smSW8RDC/ZccU
	4SsUeieaUdAdJIiuWdM=; b=RmEelbEK52Q87W07SRl7Rxzb02+Hwh7d9WA+PbLh
	BZSf8fLeV7k3EOCjRrOsGL9r94GdzmtxqPpUJaywqYTtPSVsGdRjoxOmbKuepUgC
	CnCQht+Pmj6RqRYEnMvIZDqQc14GDp73mfVXerfarVcW7lPYdvQvtX23Wp2/5uKS
	9yXahyF/fztniHGyR39wXQj0JxWDcxP8VkGPZ0s6ERnSdHyXJpx0SRhyNY4pb25U
	vLh+1TWEwiTCCqH5okO5Rg7/2rKJSDavBTHfL8It7wHN9SkG3toT7hs8pId4O161
	Ys3CxM3WIUyZDHGfD8UndoZ+9JpEQtLz7k6UZHRQ5bs5Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m2jax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:22:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e08848so65779545ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780953730; x=1781558530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVz+fOVuKO4smSW8RDC/ZccU4SsUeieaUdAdJIiuWdM=;
        b=jWBrG/wqMwAiP7GdJjYbmqs2Z4yDWdyWyPNCiQA37P6G0fgMF2+Y9ECkELMT91hTbq
         LDRRt31aP1fzV/WXkxtITrPMs7ejV/e2u6iEIzqfZWp4rMRGv9ctOf7hR28JScjZ2kAk
         lu4jOAY3ZEej/hQqLhCSv2xhZQVyHmgjabxBkH7QSAYpCFDbhkM1cICXGi3Dm0AsJw+R
         OVKNiJIEw95FOGzxHhxDPnPfswie7s55aW0L8nn3msnjH1IK9ZMQOilYXm6ZMgbmz4IL
         bLRLRf9eZMc4QMPmB5IVgQrOfFOeZPA5FAAF59iwoUrrK3OX0hu5TuvGliFdhEIj2SIu
         eXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953730; x=1781558530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVz+fOVuKO4smSW8RDC/ZccU4SsUeieaUdAdJIiuWdM=;
        b=T4mos5PcEHPtTS9RLNICMf6pUd1kYc5WJUFHkZ8xdGVfySg3vXm9CcKw/PHSMac8iN
         FzeAIoaaizPLViVdGbRrpHFIaKEvcd82N/K5vQKX2z4AzVzPkxoWUZ/CqEmSYm2vCHDt
         kdJf2XncF9TibWLV63mbf85EPQyl2k54gf7N7zVJGUbBa6B3CXn26RzONyzwhnJtP3HA
         eBUcMKdYdMcB1W+Rx4rbTjhjRIafKBFYDLbUsKZyRyYXvOVTuRZOQqBdjZNK5VH6UcgX
         Fd+NuowbmRP+EGh+/H4XIZ7RsdX3lhWc1POsFnJau616OmECF+EA8ICyClQ13aps6VUL
         iLIw==
X-Forwarded-Encrypted: i=1; AFNElJ8LEtkSEBsOmNGVduig2jF453Su0Zw8eum991jq0P3vTxxZL2JU5DZhdY3yxUZCqheyOBonvYBX0XYKWjMA@vger.kernel.org
X-Gm-Message-State: AOJu0YwAILVF0IIFLDkYxjAsUSa6xICqFRtizGX3qiDWapiA7RyhW/Fh
	iVwh6Wj/FSZu4OCAK+W5TV2WV4xMsXn9C+34IGH3ZrIbXL+BMKZZIyYOLx02DRcJ/IqN4MCaJS7
	fE8iUxiuc6nzGkVLBT/1sQf+T4OkdVW6sbY56EJVV8amMAm3cNmnG45CxH/2dZDn7o6HJ
X-Gm-Gg: Acq92OFPAwvBj0DIkOA0vv2/n/pRff7baRbRlZgGPIK7uemp9LgPCT5Hf9OvKprH9ou
	8gwlyXxz9MSRoEFbkYO24MZJZQ3l4cWuoG3iocWFiRsd0RKrlAQEqKtheAAWn1ao9gcoB42lfhh
	EbupUO/BEUYDrdAf/P3iHSzymt8wYx88D1gOkzoXaHJM4xXSIcjJ1gmVWOiJJ2NTIq9b8z0c6s/
	q63cXONBVQPA0LjwbW1k4YbN73LVuLQQ5doxH6/QkbVROsZ8ut41VLOOZTGDIAl5ohb5gAoargm
	1PPEo8gitIMNoSY2qY/OFvm9f06bIDKcTd+Lb1Ffkv2Lbl1Hln7gzNOhq5Rh9vxatLc8DiLCMCK
	JqnbMRvOtU6jao6Cy24YshgEIbhHEnHbi8HaPDSBAyKug6Ft0t+PbSWWDOgJ4hSpr4tDLpg==
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr203235805ad.7.1780953729926;
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr203235575ad.7.1780953729507;
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm62610475ad.38.2026.06.08.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
Date: Tue, 9 Jun 2026 02:52:03 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <aicye2g/HRlaiiEl@hu-arakshit-hyd.qualcomm.com>
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
 <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5NCBTYWx0ZWRfX5IfdkLgVhkzU
 mayU87dxnTq1G2V3WUbvQQOnCiRI4xF9L8mUS/PyocYUAhve21MVbR/1d/LE4NUsWgLEKPQN61r
 n61TiqKiDSu0llsSCKgsxgBr14RKcIW8R4KZR6MhNmIavrVQr81kbf+Bg07uKXrbt73jbM8NEKl
 lL1u846beIPUO4yzEtZg5BHnyBwv3V8uxjcsRuLz2D3xZU+CSNAFwBm2LUPuYoCHBlOVHiAnrHL
 csgHt+iLdQxCkK5t2j4c4VqSK0vtOWn51b8uWrRnaAs6j71gEQxqU/p72Ngww/0YzWDu4PXtQms
 uvIL2ZvQsCZD9MA/fmBZVf1l5OeMnDCWBMg/eJkyFikjgtDkvHlUmwdkpJ9KyjVBsPSVATL/IyL
 G3yVC/JwcNCUl8WoJKHb4KMhmxq8GdLKdoQlvItx3bAEv2dSneyF47Dc4vI1U5TCurSbOuRKvgk
 px0p3X5INtMhIMaQ4kA==
X-Proofpoint-ORIG-GUID: XvTE9MLr1dSXNSsBVc3lAIZg5jTEkJfP
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a273282 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-L58Xp8eqOkf6jkiZYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XvTE9MLr1dSXNSsBVc3lAIZg5jTEkJfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-111970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C512C65AA77

On Sun, Jun 07, 2026 at 02:15:38AM +0530, Kuldeep Singh wrote:
> On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS device nodes for LeMans platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> This patch still needs patch-series[1] as prerequisite and cannot work
> standalone. Can you send this patch in same original series just like
> other DTs are updated?
> 
> [1]
> https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

Sure, will include this patch with ICE clock scaling patch and post a new patchseries.

Abhinaba Rakshit

