Return-Path: <linux-arm-msm+bounces-103201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODIrOPWB3mnkFAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:05:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6F3FD6F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6101301BA55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492A030DED5;
	Tue, 14 Apr 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8P05sQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8IA8THE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E5303CB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189658; cv=none; b=Zq1ad8UpRsBRsW3UJIiE3ej+8l5l8HCAYFYk1RpYsJbHc/HPYvyIS4Gq+E0WyNy25hecnKEcebXw6khjYAFMKJ7pzpupa8eYL6lKytc9P2KNKeQQaUMV0GJ6LP/ICb8EZLk37A+2VKe6rdTLCA7BMxJMUhvbGXF6OLLbpyjHtSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189658; c=relaxed/simple;
	bh=kUfdx7gUHyI6QETEVlPznOfKLyhENuPqzqw7yoOLTnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThB4p0U53jxdKbMoxewmaygwqth2mhiQ8zRqK2srmkQTZNzHPri9un+a9poC9N5emg6ZvHy/NICmgE8mImdYx/OPcez24l2zUXbeX4/KBBXsL0z/GWFTpJJC5JJD7M09En9kxDA2tcAYjej9IHzsKA4CuUSJcc3Nm01Jam/xi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8P05sQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8IA8THE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI0YmD3759256
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6EeSe5tf7NpDqNPZfyeQBWoD
	QvTfUNSRRnuEMGJYQ2c=; b=N8P05sQmyqWJOtzH0JUrwR53wLrsCMUUzaBo4lZJ
	+G/IVeFZZWO//zdEVrZn7fNTuxWwJoYjmZxK4iefOOYO/HhMphRYvhuWFLyq1BfE
	meZr976TgHLUoZGLjVhHS1hqUMMks6489H025hwTSimCEejV3JnlKCeeRGFDJCPO
	Er3YTU12UPpgDKdxHDXhPkJCg6uCTIhjKw4eJL/SrsKk8emQJyr2q4HA4rVkAmwN
	5/HR+HMcwlZ2L9You4BP5NbFNYKwfgxIXioWgiEM2pONa8fNdqo2gozdIvtref8Q
	RWmjPE5OPt0w0jVLfoGBE9h7WR0RCxGR+ehNy0C0pKZFXg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0801j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:00:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso158657396d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189655; x=1776794455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EeSe5tf7NpDqNPZfyeQBWoDQvTfUNSRRnuEMGJYQ2c=;
        b=h8IA8THE/1Kt6Jbt0pL4E8hojzN1vgZzKVXrcbfxT/Pro9XWYFcSIGaM1v1o4XXHJI
         npFhx25UaSxShpyx9eW51syySwawk1/NhtySR8xKyWEGOcUKTmztc339fiN1lYMczo72
         e30aSoCoNilUGjaJloys+xzslMdhazqpueYCCFfMwn1tFxbhr6m/zLbVIiQZpH2qx2DG
         cUj32NSHaChIC8wVIR394Vmtb04YRWp83TEldfnbrgqpYi8p+q0OQmTkJAm1m2VlXHNq
         JKtgqf5ogQMVIDkZNA3TT8inhK28D1dIpifIX+M7UxJFIBzpApQtHuVF71I/mLZefs0W
         hqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189655; x=1776794455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EeSe5tf7NpDqNPZfyeQBWoDQvTfUNSRRnuEMGJYQ2c=;
        b=jhTRxhEGXcXOFN2QIdphaUAwTB3T4N57C7R1sw/tROJ5O+xFUGJFoT/kZMdeW6055v
         3NOLwkZPqBBrnz7uWqVZz5yduPXor5U3LZLkKY7gp8bxlu1qw+zM6fXrr+UXlEcevD62
         AlkWPlmP1g6blD3coAq/sxs7Obko3EkGwXe/gn8ZYpN1lc8L4TtkU/hyy3IvgC0yIJ1h
         UeNW/BT4AueBHmkSmNIdS283I7slqOW/LPKAO85Ltmk97ampV2/ZTa4NI64VRc6vkp4f
         C+eX4mFijwXU7eqEJSOBOmMMIjDiGIUSD0RvOEu8zS6YjbkTmFQOL14PEch7WAXMi0pC
         9Yyg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZGuaDRZCEfJrWEDn2JxQ1kelrPyN61ZLoD2GVpb0op5l0zI2ycXIGX+K8iDztA/mZNgsFEUevcipBN3Dl@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjmek2zMgGHRv5x88cj8Q95OYBYfEyNsOVtVjZ7YYwkw1zeY0
	5gNj6eldzeiRheSl7i0TmlZiK2nqzR77vGmNaT2tEgNWg4P4Km66NYgCEEpOqTUrGJ/PqBj5C3J
	99KFsstRSb6DcnTXuFMoDXXNs55Ed/hbszsSsHmt4r9M242FfoIOFTrsqAAensdoa1nQl
X-Gm-Gg: AeBDieuSxFJjH+8UFsSdNFOXPUa6zjm9lvZLr5UGxy7aL/pZw/ZqnbG7KRbwWoQRpBJ
	mwFsMbwYBa5SE/WLLp0juHDX5BZuwO4r9Mm9wqIfqADv9oARw9oKhuuduDfdig+mVhM12glIHXZ
	CPdEISn2XdR91W9IQQW4+P/6Nl9xDeHxuy1OwDbuUEXFTuVb9rTRt4MI/j2HhmPLt+UUpWMb53V
	g6kOZSkUbKz3xaxPhOMF3AsyRL69wGVDs28spg2ITxHKMWmiHQ5xFgev/cKjlTYqOHcEG2rff14
	AqkLpAXeWZTMDKdMvl6KlsaPIQQ8ZqctHy8eMlI0DqIsbC9oSUKkfzc1f/oCMbn46VrN57FGRQb
	63Hnu9rCdbSL3l8KXEVUFjwapHQxnOyiK9pYpKXiVfTC8oJTQpgUr+Uks6WBk99t7SlgQKxeKCB
	UM4jJ8Mj6XvibWz2FFZ62rH9pzE5B/plSQLMThZrvdsmGW3w==
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr278308861cf.17.1776189655186;
        Tue, 14 Apr 2026 11:00:55 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr278307921cf.17.1776189654482;
        Tue, 14 Apr 2026 11:00:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4926eb14sm34363961fa.2.2026.04.14.11.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:00:53 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:00:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into
 per-version helpers
Message-ID: <y53xe7arbjuxsghvi67uwc5w75ulbti7wfujasho4vwd7dmza3@qnnciwzlr6ej>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69de80d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7VHkyeIEd6B37TvAa9YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: JhGUNULJW8bCFjdRNS9pSx_fqN8BPu-W
X-Proofpoint-ORIG-GUID: JhGUNULJW8bCFjdRNS9pSx_fqN8BPu-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OCBTYWx0ZWRfX/DWU+gFSlZRN
 F90YfckmG+FgcUv8Su1NbhmWvycZPVFHJUpb1X3IgCnNVFhIBSZ50tOxkILdVigx7+uMbpFsvJZ
 WHv3icFU/zNI3uzJWHS6Ltmh+HEsB/2UlIt8BDoN85v+pTPZX0BSAjnTBdK5HaudwlfSswJs0sK
 mz7+KpD2SqrN2RoD/H+fKw5vj60PF/eUkFPkorYFKrdr71//sSvExAGZXzkwzVKAlgN+Teh4mfC
 LrihL/dvggAftpXZHyykMmf1TqaZ+bJr0S1EYXG/wUID4kvnQAfEDuDkiDIfJSulKDzQgLodglA
 bOjmmkv9bRHmPHw+Eqv8cfHB8NWwpuHp/tVZgtejwRKuIjeWKRyzu1yg4mrm+zdbRuDbEQKoQ+Q
 9qlTpsD1tduu/0IuryTUMbR3c2eN47SZvX8Km7i8LOoNNYLDYcStspqpPwDjP5RFHNYoeRayD5i
 m1Pc0iZdwiWeGgVltCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103201-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30D6F3FD6F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:39AM +0530, Mukesh Ojha wrote:
> The __pdc_enable_intr() function contains a version branch that selects
> between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
> register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
> HW >= 3.2. These two paths share no code and serve different hardware.
> 
> Split them into two focused static functions: pdc_enable_intr_bank()
> for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
> change.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 42 +++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

