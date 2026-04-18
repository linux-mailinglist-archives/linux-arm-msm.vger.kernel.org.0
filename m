Return-Path: <linux-arm-msm+bounces-103609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D5qKmLo42nPMQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 22:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FB422355
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 22:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA23A30091CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 20:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2A33B6C9;
	Sat, 18 Apr 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fahkhzad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejgpdd2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EC314D14
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543837; cv=none; b=IhW3cb1Gcxw6HpJs9UbIwxtJ/EsHXxqdd/lRLbwBBrY1PqPL5KSJXdDysLL59G/YrnvXGdyxb84RyHMGKRUvDULrX8rvP/k7iDUwcoOo1ZtwAs5QrTVrG8hDFAbb62Yis75F+1k/tN7URjkKwTN+GIwkkLQTe6fIeyNarh7KjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543837; c=relaxed/simple;
	bh=g9NDcf1smfF8vm46KWA60/glnAzkSOqt0MO682JSkIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLbqyklF2AMSgtAJkdbawO001o7ZtSJG0rh07zrhlSl5zeqVMX8QLmMBqmHkXNRJZYF6H34vVyA/L8nY52OkU9TLvHmRwcUlmZ/i+Ab6sCgWtsZqIdGkBQ+QWtTNeMDiZp1QBMvooqA6gzZYo/GThMSmE2MRSj6excA+9UjRA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fahkhzad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejgpdd2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4VKv31432028
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Unkrq/OjgBeyx4OlaQcXktpk
	Zj59I96fgHikJLzhnok=; b=FahkhzadnXWSzUSFX8ylrov8v/eca/m8++AS+PQ6
	sGv9/pNWH5QIpAFkQ6dPIb6wJRP5R+jDTRTtDrrc59v/oSDWbjOoRzWRecIAG7fr
	q4jCYDBz3GIBEW2V/HIpiYeBT7NorzNlEbfsvz9adFQ9tDLVn5vikvamVXf34zGh
	YBWuA547yz82/WYjq0vAUD0wEcEF2GoBc6pR3XE2jSfz4bRbffgI9526VtpafeXE
	88bGOPCYst9VSTR1bOqTFVPplXa6w+pWyYIuaWx8DXuV6c+rrMN3sXa3tD8XG2sM
	+bBvbqjdqSvrlx74ZpqGqLjt+Pxe9oOcmd03Bl8aez5ZEg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21uhc5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:23:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f694e2ab8so1460340e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776543834; x=1777148634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Unkrq/OjgBeyx4OlaQcXktpkZj59I96fgHikJLzhnok=;
        b=Ejgpdd2IUpmeof9XLnGn0RSY6eu5xTn2VoOgkS+0p2WAvYYomTxiZcMaOgkI7bnXHn
         37W5K44vIRsOoNXfuTy2muD+AIwj3nDqnKA4W98Yet/uGr8jWBvUzmRPDtiXwTuVcztp
         dDrfYDik12cl+9O+lcYYw7JBK9TvBr5sObwYF0YLKTCBa3ivWQK/V36aB4uSwgnYp2o0
         n7nYPMZWs5bxw9zpWuyPuzeC2u5LQdDKsaqQad0NI58V5nNE+dczxlSZ3C5JDtTpChS2
         +/SechPrwqFUGsc8/IDXfjJdeYPs8fyUEVp8ehExTlq0rsuIL5Z8Es/vHacuNE5Azyq1
         cpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776543834; x=1777148634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Unkrq/OjgBeyx4OlaQcXktpkZj59I96fgHikJLzhnok=;
        b=ZueQOZBf8djH61vwZ5N/OvGP4Q/4gTYkICiAVhUafIx8ELnYvVPWv7SiP2K91NtPN+
         7iFIhbuIzMZi5Zb5gxvnRHs/EODHJTEswGBV19Wej+4UO4FP+f/0abM2piBcahRXvG8b
         QorF2f6FqFKp6oEhIKvvH5Xm/9v5O4PF+HWQU3UkRE3Oful1uQFQzGPhA8pegQFfdRme
         q0j8JQBXW2Ri7GPMpPGcRlrBXvkI4sqbpbFXRZBpPpReuuoLcbn4cAW6H63hzu+qixe9
         jt7rglBHU+HdvfIgE5crJjpbF/S03mdA+wE6WgLBEJA0x8k2zLSEFO8wTJACe+bzJjo3
         nteQ==
X-Forwarded-Encrypted: i=1; AFNElJ/766CQbEFSSk4N7WePQLPqsjCsJKKxwQQTJehjlY3jHdSHSlFDSP5Dy8LnYuoX3mMOkpdiG1evr69GHrDt@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9Er7dPeDI5VkYLWa6CDd2uaLii8Z/Yleh8EvT1Zmo1cPWcEZ
	Z06jF6bhz+Hi9dVfbbAW80FfeNsOsSUAHJw9UTttGkrniFHULm8usKGOGQNEsm2+nF8gOt1faKe
	v6sRKSVLBk+BWKFeQjjtemb9lg2lchC/zBHFd6a/0rmJtGFk79yMn42ft0GTN8/7NIPSJwSrWtU
	7h
X-Gm-Gg: AeBDiesqHWVXpZd9KSSXk8DMU2uhfL66gT5s+Y4LyqnIZk2H4HiZWRyce6+uCi2Q1rq
	W0EhopGG2UEDMOImgvoC9zK4XN1y34m61+yMnM25+mwWvK9b0mT8hJShjGnuZlWIZmu52WyODdX
	73aol22OtgBUnOs1DL0JnFcbTDF7hHp6qu4uYqeg5kXr+hunvf8slcYGdQ0JD+5G4Jee1m9Vl/V
	AU2ckwb/ysYTi7LctEXNfODx7BWX2HgPj5biJJrG/G+RsIou6bjgFZGMZxMhQsyvsnFa9Lzk/Tk
	N5cmUp4x7bVX2Ci32XWXZ7tks1Ii05dHvpywHr92FvXWGHeKVSqPNaBYOkXySlXg9RVV3VsapLp
	65gs1MbclpAljyNqb1BZg2HFmA3GWMD06sCKBG+AvCQWdIcf6iOr0qk3HPzvkcPcf8JKt3Ce9dy
	CzzQyNHLmwhwBPRKQaRlbdAKiRdOj0DxjmfptOvdmFkSwtHg==
X-Received: by 2002:a05:6102:149d:b0:613:3fff:feb8 with SMTP id ada2fe7eead31-616f91e60cdmr3492503137.29.1776543834268;
        Sat, 18 Apr 2026 13:23:54 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:613:3fff:feb8 with SMTP id ada2fe7eead31-616f91e60cdmr3492497137.29.1776543833817;
        Sat, 18 Apr 2026 13:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm12679001fa.12.2026.04.18.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 13:23:51 -0700 (PDT)
Date: Sat, 18 Apr 2026 23:23:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
Message-ID: <ycqlsccmlzrsiggg2f7rps34qxjzpbqf3x43jyajaecn3t3qxo@giplsfboimuw>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-1-579e75c4cfe5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-clk-qcom-defaults-v1-1-579e75c4cfe5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDIwNSBTYWx0ZWRfX0csvXnu5NkBD
 NTLwfohCcbk3dDIusL/ZosaQHK0wN41wxGlXPLhaw+m0mN3mKWyu8FHfYE7wFtDmRgKILHrcKIZ
 8s9unw/40y5KX4fm2mLlv0omT2tm1XoI+FdZ9SMuOXaJUW/JnUo1h3xxhrNlIadZAFrYx4LG0Ee
 dSCZorJe0OvBRZRL9kIlVTIfnSMiyaZ8TG+DUcUS6yETSQWfgHgFWuwVzrcCZlFZlu3ZypWhoqn
 wbWiBecYLvLomUgBWKqt3/nehH0ryEJem3JjgjGIfaKbYNOk5iovmXIMBEvyG8nH4PxtNX5Z52Y
 matIiaF5URi57h0p7lBqFdu4yod4/HGkh7+P3NTHRIxuaoFmAHfQ+SBKRVYKTDNW2G8H7leXm+J
 dN1E7RQCSYgjn6X94OFIBlP4iRSyGRzPPOr2mMSQiPM2K2xsWDxoj+gOXFKTMmFcDk+m/tLtxDV
 p2yXIVM8v9PUKz8/oiA==
X-Proofpoint-GUID: Z0RMne3KEJCumLM3iXDHehnMtkxVeJK-
X-Proofpoint-ORIG-GUID: Z0RMne3KEJCumLM3iXDHehnMtkxVeJK-
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e3e85b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XY21xBfZkjNNQA91HVkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_06,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180205
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103609-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A84FB422355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 10:10:29AM +0200, Krzysztof Kozlowski wrote:
> Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
> already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
> so should not be a choice for ARM 32-bit builds, to make kernels smaller
> and user choices easier.
> 
> IPQ_CMN_PLL is used only by the SoCs already having clock controllers
> restricted to ARM64
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

