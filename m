Return-Path: <linux-arm-msm+bounces-103173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG4RKIVq3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:25:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED13FC88E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A12D4308E76C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32523ED124;
	Tue, 14 Apr 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3gLXet+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0L5HbNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741273E6396
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183611; cv=none; b=TZWu7avkpQZyhwp+X8LjtUQmYkHPjPud0440HeSrqc2E9qa5N21AD0k7HJzBLQoFf4hfrB0nUz0dW8x+Lz/5YtPUbwwfXv/VoRa/OJWizPdGpeub77xluczao7eoc6KbwnOBx8bYE997W64/vFy7lfUOIiU8vdkTaCSA7AUnOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183611; c=relaxed/simple;
	bh=txOq4UZ0M9dkA/lPV+LEOE06DUusaR/ywnIKzIYbdx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShslqSaYnE3Qlvi1UyH9JZ6rjONTY1ccy+/XsJtaLX13JNDtg42KN9GlEkv5RKiPIWyR1S8Nxx0lCcArsp5H6vUFFXirhRQEvDGmmMfXaZiDkpi3lxsV0z4gFjVTbiv2oZPIDsHvLwDb7H+9CPj5XbACulVjj7N/1o76TlgUcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3gLXet+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0L5HbNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBhnWM395647
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZZfQAV42/8HOHv5lacfx1mg
	jGrHI1LHwa/ZyYNicN4=; b=i3gLXet+Mx/5Z/gUyctyHmw2sPmxL18GMa5pO7ZW
	46e0018sfXaQYgiD8Ph3MVqy9rKbhjVGoMg3a5Ixv24a4C5Yf9HYpicy61JPOzxo
	O/OWNGkOJxNIoqXZC/2SC0ecxfEDiHBcy7nIqadAjvs05YpB2vpd8AgbNOQxRhLZ
	CJqb5DSV2JM/GAz8suK1J309m/IUu0swqMC38hXPCEpm0qHtX9pj4OgmUigJyO2j
	Uhtn7F1eRyiUJTNtPPw4sw1j2gTfar3+K6P9q8raBUFFTtPrhGIWcJsniYvBOnPo
	BNHs+4ZOcqe4eYHwLLs0nxSoyN4CYLC/xsCsUmZ920r7Sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870uhbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:20:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso70054391cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183608; x=1776788408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZfQAV42/8HOHv5lacfx1mgjGrHI1LHwa/ZyYNicN4=;
        b=e0L5HbNS2DHMy/audXMDhlV6NFtrGk/pO/7vuTt02DNqZCFKceRKc+r7uFMPklsho8
         9oSy7J1RzH35KmZA7npRufA0vfDNv+bp55Ell1Xj+RbU+b9TwzHTJXwiaiKMKCn2iK5V
         WdffTME01cPJT/dPd2Vc6UZoVPamzy8v32gj7I5biW1z4ZjFlEXv1QlefBmqXw7480Ga
         VINBg0w6Yv8OSxd4ug9uugQMx8s/q93xVopdHbU4zbG9XgIJiWNL24tngOa85hKAS/Gw
         fEpMD2Zkuj9vmIbh+qtNPALScw5RyFUBuOSmjPQCY4tQE5khuyswr4hhmumzaCs5HWn5
         +odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183608; x=1776788408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZZfQAV42/8HOHv5lacfx1mgjGrHI1LHwa/ZyYNicN4=;
        b=KWyL6aSh/nhkHHYmsQUNi/9w7u34IU235iN0B6WXpMwhukaxl9+KEKZ0y5uNc87FkS
         YS2IYFm4JTebJfczkUBtzk/jlRoc74FaMzVoI6k4KF/rHL2DgA5p2sqvMcoI1xOcEUvD
         93oGxEfb8oZS6rDgjTXIU+Obx0Xax8iYFGnF312kv/d6QAmMZaxIqtIWsow7QG9dm4ld
         wO8HRUGgT5LuTiSLnlvniv3WG/Jfb8eJwDczGHSS9KpVj2SMeWZE7TX8Q+n47+X9hESP
         zDrAn6tFbczSi0vQ8FV2dlkPRB+jZ5Xh/50bVXqxflXsFdFBdRJ0RV4A3mWb4qOsUXpV
         CYWw==
X-Forwarded-Encrypted: i=1; AFNElJ9qBJJT2yX1TVGtrfcvBWQVP3e6Dt0scHf356fJkUJ/VO2uifnAMaCngQCdL9rbAAOeFc2htIMAnZ0eXNCk@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcubmy4msZVlkCNcgibM3c7oefmrTxkJNYJ/xlciCkNhCsVss
	l3PnqL82JHH7zbQngE1JxVtlG0+U9Fg7dROhl7GBWcBuYmwgDF2549c3IUvlULfy7m32V9Sj0Ff
	HYOVsXXVH2ZKOqf6qJ2bEambNzj5idBhkHXtqUzzDoANDKtvIZ5MJugGAnatlt8voM5kE
X-Gm-Gg: AeBDiesOfSVACDRzNOf0dxEGuXE+wKO9Q5BT+fbYqV2R1fAZKPwIzBStYzrKxVDVgm7
	wj+YhxNkwkuyDHvJ8cbSRP+hJxxSCPD2JslQoyb4yYawuSOcHG2SkVS6c0aJ5n8/WcoevhDu/3Y
	2SjSplEu6OGOxPLMuI/9ugUKY4jG5EogYAw3iOnWDAbNV4Cjp9A4wKc/9lF8GLmCIlVOeiIs/6S
	9tOZjtK139yvVpHaRX3CPM24+riffdtTjo6iJkK1ObhHV5FMx6AZlPz6m4hi+CLxML44TXJEQ1Y
	TzJSWy/rozU8j5xPYyw1GzLhGn52gpQVaKCgIuUfYxQeo9xLwJAoS2Ozy9rpVBCgEIO4ZJgr+XI
	l9EXqcB95/90Y0ZpVAa33CdFDG6BVfIf0nwEWCpKsiemCOeMSFXhpah197OuCNBA9tPzZfxhSn/
	N2zNjU+uFq3Qeyc9f3tvl/UYp7p2HRvrfewBUTKNOAQ3QHEg==
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr318593831cf.19.1776183607472;
        Tue, 14 Apr 2026 09:20:07 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr318591331cf.19.1776183605398;
        Tue, 14 Apr 2026 09:20:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee864a2sm3355630e87.2.2026.04.14.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:20:04 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <gt2huchpumtefjnwsg45ddyj5x6axibqytuqsxtvuwipu7qa2j@p6sw5htikfrz>
References: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
 <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7Ja9CVP9sRWcHeJuQ5kyv_8zY5KwyLkt
X-Proofpoint-GUID: 7Ja9CVP9sRWcHeJuQ5kyv_8zY5KwyLkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MiBTYWx0ZWRfXwbraqd5xWRD6
 lmx9iV+tH7cp52iP8yKKBxBKHhLhsqu3Pfi+fBPCOlYSH+wMGGJhM2HbESWmJRaIFpqz3oaEwfJ
 +LjooisnQqMSke25dbI7J58lbjxGC56t1NEQ7G/zMXyKFY1IatwLfxyXUGYPgylOwz8TyEb5uMe
 k59SaT57/PJvy4JaND1QSpxQWWwpbeo+cNU2ttLzSA0iv/JrrY42HbZVGyBaJyvmFpv5pUnT1R5
 2XHPp9/CWp9PNCewtyVPLpZGfkyNgJJe1qzY8EDFP7rBE7UNVYCMuGH5l9NAKG1Eujg5sNFRuKk
 JZYOp5CvGK1ZDts2HXkbvaUibUTKvULhbMXvgJkS4qDH+NJnbAgW2dYTI7hbWxm8HewNt+DG6LQ
 rlTPnKFzTSPZizvaqss89YOJ7ByUyjoM5uVQ1YPBGunlRhTVKGE/pgLFn2F7CmbFHch6sX54O3o
 FrP4/Lfl1YOVFSNx2Jw==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de6938 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=tRzE2P0BVMUdLtOBgiIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140152
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103173-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19ED13FC88E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:53:01PM +0200, Konrad Dybcio wrote:
> On 4/14/26 1:34 PM, Alexander Koskovich wrote:
> > Some VRMs aren't present on all boards, so mark them as optional. This
> > prevents probe failures on boards where not all VRMs are present.
> > 
> > This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
> > probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> > due to this device having a slightly different PMIC configuration from
> > the Eliza MTP.
> > 
> > This matches the downstream approach of marking all VRMs as optional
> > and makes the previous clka_optional handling redundant.
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> > Changes in v2:
> > - Squashed clka_optional revert into patch (Dmitry)
> > - Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
> > - Squashed cover into patch commit message and expanded on background
> > - Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me
> > ---
> 
> [...]
> 
> >  static struct clk_hw *glymur_rpmh_clocks[] = {
> > @@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > +	if (!rpmh->clks[idx])
> > +		return ERR_PTR(-ENOENT);
> 
> Hm, this is going to surface in some places where a nullptr has been
> happily accepted up until now..
> 
> Bjorn, Dmitry, WDYT?

Yep. I'd rather drop that part.

-- 
With best wishes
Dmitry

