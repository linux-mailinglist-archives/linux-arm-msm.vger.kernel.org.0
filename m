Return-Path: <linux-arm-msm+bounces-97578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCNnCGM3tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:12:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FDA286C0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4046931225D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A013C278E;
	Fri, 13 Mar 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCUNzVw9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrvVaTCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81AA3AB289
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418170; cv=none; b=ZaqsTIBOYbkIK6nFV2NeA2cOjwgprWY9wPQ6q2Q5xUyPcswhTOX8urg+5T+lB6r81AaUIkENkhm1EYh/pZi3qUK+C2sGwc/7h41AbzBci2EGcbCk/6/t1CAwEGK2+g+U6iv/EV3nC41G1FnEGr70n/gIR+E7LCjEO8AcEVVJmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418170; c=relaxed/simple;
	bh=iihJ6G2glai3LfV6OsWXxGEnrOYpm8RkkrKTZjXasTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9Tj/Czw1/tnnWLWFJm8JhwqZC3Ady10bQyQFeNkGxgIS9hKzMMN3qFvHRuDMwwLKUij3xOsqP4qNwUtWYeSJotm/LbT1Bl5TL3Nez/u03QsFCym4H2Mm6yD5SMgK/DW8jb9zx157UlCFHgs0uJZ44UCphFDASYhQoImLkoQCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCUNzVw9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrvVaTCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDk4Cl792882
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8I4q9a3KfKyDHzN1MBIbMh4h
	6MhvhvFPqz3BvEDRvwE=; b=mCUNzVw9tl64ghspQuEG5hGE6/wORJiVsaDCBYmN
	hk+rSn59ITg+K52ZrXbGM9D1YZNjtFci/kLpXBmVKzSVWhO4mnEhIpNX7x5yiNGs
	dQbXGwfd62OErytxZT/RCfNSHRjrId95HPeh3K1cimceOEZviukM4OWRxNhRelWq
	HpmiYy+wrYcQY8c3x3CDy80PAxTeZLzIlLY2LnqjbZI1tGg2AmwKSg8zN7vHQduT
	uAWkaILJXupic2T3uPIJUaJSyfw6+r1hJbyNHdWQkWBJJ7u7kl2VY8X4Be58NaxE
	e188Ff37GepJ6O+Y7mXZ9E6T9XJflviiqC3RoZ1X3pnaUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1y8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:09:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd820c6a4fso1848165285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418167; x=1774022967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8I4q9a3KfKyDHzN1MBIbMh4h6MhvhvFPqz3BvEDRvwE=;
        b=HrvVaTCUc5WOFBQi2grTnIar19tDIGF/OQ4KQ4+zKEzcAOoS6D9U2x8P1l58ThmQ5w
         a7QIP2F0zNydmwXXCokegDjmzlfrxYW+8I6mT6gT/u99cMWKu9bCDLclznx0AoNG11J8
         VSeFbISTGScvZjBOgi/cFOHCoMC5+8hHjvu2Kp2ukWXZSKsKvJm4auz4v+xDXZnEf7N2
         zxanR7X5S20kmhHfWReuvPcFe109N3HmT1mRYyCTWQI9xJCQDPXKw9hxlgphRrGnIlnc
         2WQud4BTNVRfYFj+zwScK2UmaXHakneOZnm3zR1LQ43a9+1jCwBrmPNBOXhrCmBuNthA
         mQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418167; x=1774022967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I4q9a3KfKyDHzN1MBIbMh4h6MhvhvFPqz3BvEDRvwE=;
        b=aNfpgrN42cynxmhPD2YhDI1ItkfzD/HurzhJUuzlk3KF4v8xs1KB8yjNAcLh7xjmOX
         sCoEYM6S8BGuS4rqxU+dp8PBWpJ+mj8itnRlY0FcALBBjNSeJMDuieRpEeLkCuQlYzLx
         DIDsGX+eTvWj5CoLybz14m5KsIhlVRbmAk1UJTvSQq+sa5BZ/uclIOzm0UkEVg53oqZi
         /Km31wIPGWbP0zeKOoK3Y8UnUHbZSnjdFITvapv0SBxqUp50vQa1QpB4p9F3rYQZ2tDH
         B4i9faYJl7XlGiHdh1enuP2bBssrhYXt1TI51bbzDRyPVRbnyKPYdA/Iz1VqRko2T/XK
         9rtw==
X-Forwarded-Encrypted: i=1; AJvYcCWNmpYbtu108vdY2rwNk6Wo+k1PIsgI8Js2h6MbXE2U66acAqx4EDiMEsNqHshBMfciYGpFekjQYl3If2m9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YKFKPmN0djHiI7QDh0rXrqMbvu1KsGb6JvaxcgzqnNFaoVgL
	seqIasV6ReIxZEkRVqdXDXlaQOkP5bHWmBSL4EdxxsNXacZpNnRRhEZC6Za6yfpHXOHH8h3rtHa
	gDyDVv1228dzuAyYusshP1xVhC8bPv8lRzK00FW4j5ehJTV/z9qdO7x1/8eZrvWkXWBs+
X-Gm-Gg: ATEYQzx6VPopq7zIfOV82azM8vTI/GgVPV/aulStY4hmlqLXuOOV2O4YAVSTR7am8OE
	txQTEHC+hsnt8zopQQZQ+DVODmqJXqwGi+AEQn3DOV4yGHPPNnmZ/lzer7E5XxipuiJSnHiPbhS
	lSSGMPCCJf8FXrNSjut3xnAnBWTcFB1AqSllSRX/huRYpYywy/qPuzsPHv+7GWHkmkgQfmczuSK
	f2rrzwkNehEVHrh15L/DPxboMJiKc9YoGIvE7r4aI7fWXbx7eSxIc1BVxa01wI+v66YyUmEn4D8
	9jK+XENmJ8ETBDgPLLFUytbp54iESxGF5TTSxwHQhcuNHlfUbJXMD0YnqaSRAE0aXbheR8vJDYV
	D7jmQSSm2f/CKE0bv5i3aEJYlTDaY5dGiWuWaGqVlq2mN/YMtb130jEa+VHKwXnhMYSAzbePgGf
	p9pUBEkdkSVnzgq7rQhy5O32+8ZsRYpW/TfY0=
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr565298185a.28.1773418166793;
        Fri, 13 Mar 2026 09:09:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr565292485a.28.1773418166254;
        Fri, 13 Mar 2026 09:09:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366682sm1602254e87.72.2026.03.13.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:09:25 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:09:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of
 select
Message-ID: <hbb6v54npcet2n4tpv3fguofxmco6k5bpji2ai4fubu4wczhwb@umo7x25c4z4v>
References: <20260313111018.130068-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111018.130068-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b436b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=waaz1P1htruZV5NjjJsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JtlOHg_hVcPKoPheyYh7WIS2VmhMXr7A
X-Proofpoint-ORIG-GUID: JtlOHg_hVcPKoPheyYh7WIS2VmhMXr7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOSBTYWx0ZWRfX8cKTR86mwiDp
 bBO06lUsDqeAPCpldKT4M0OuKm1EN0qTDzs4wgNuw0c7Y1lwOUdlfDConejRscPKy95dxQK6oIu
 7weFthd+Jg8TYlm/YI/7ALLFJ7rrUH+ygsv2sjJe5WcD0MhsQEUGibaYASoJasWOsjKk8jOmM7W
 Z0BXKN/n9G1LMzDZftHguB5kVuAmkF8dPvdquzm5Q3wYc/D9XQoxgYkCVPBH3D9NShH9+ZRvdP9
 jGiNNBLvKmdSjJYvlkFTQDmNb5Cv+0CeQRo0RXfaJ8iC0L2Ji0dFUPNLwpip+wklkakuIGEj3J8
 tzd5bh48a4jxr72yuLrXo54s+ldMhWk1PT0VHWkvOX57x+H7rAjK+eC+EBSG34mqG1Ry54212nt
 K2swLTuZ54508vsmoD4a6ZIDwyO3n/MvVbcA8egSjQNYGN5mTOItQB3RLxktSF0FoBSMjYzdRmy
 JaOAwR6X8OL3eAY/A8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97578-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2FDA286C0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 07:10:18PM +0800, Pengyu Luo wrote:
> Both sm8350 and sc8280xp use this, on sc8280xp, this would select
> gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

