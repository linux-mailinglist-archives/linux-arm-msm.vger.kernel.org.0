Return-Path: <linux-arm-msm+bounces-116903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ag2E5vLS2qpaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:36:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DCA712AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:36:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ko24b0pF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZwYAsrkg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58CBB31B9439
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76C340A953;
	Mon,  6 Jul 2026 14:39:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD4416132
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:39:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348783; cv=none; b=g5OMht7rLhsCWxeBAalFnRKxh6bRV05B/JEqNDWnV403pi1JUT8UuTeywGnvdsbtzjk0HHoZuoSyN7i0Dlt1lvY10D/mM+t5bXX9pcIPOwsRX32uykTEhkQ6l3Ug71J9/lu7pHj3HpReSzfr/9Nh4bNFfTuCNszu2Mxd+jrrwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348783; c=relaxed/simple;
	bh=v/r/WqLZEOFyAMYQx4rralUtoGfSDfJuZ6bjDMVoL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY0v1g3SBKCh0Pi7BqevIYGr47QSeFbOJxT61fWXsjDm0L3pHOPBbXIYHDP2yCCYqgJh3AH2sDMVFVDaXc7jDedAtPO8z0bnk4Z+gq34QCygx5Oa6DfnKtXMVt1dSor/ylyeHR4yXDUBC3u7dc57wBjHSDWF2DEF3KlPMwDqlAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ko24b0pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwYAsrkg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDsfN810630
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VEz5SR4P6MGHr8FEm9V24BJ/
	fL5kDCBLdYNsiYU+fAg=; b=Ko24b0pFQ71GsCvA+R8QJ7d8YA4SgN6xcO+NiAAz
	ObmFn3kMSm9+C5gUOzLEChqAnS/JBdtAe+AIIdzdQzYBDzH4eDOByNVWEbLlvQLi
	Bsqqp0BYH78cJKUaE+hLbO2tsrzdZMtAUBz/nap3o1TiL/+yAGv5UnY2T7ePl1Ic
	iUi+ybm2xa/vE9uCOrNM1qdqJQ9OvSkVFTJyM6HY+nGu/FvDtJwoIfWhYHAImPTz
	3HYze1uoUkqzuamD5UG3jLB91BOjcDwuN9et1HC8RHn7MsnbEFawix5TeqoLnv2v
	bTTBdNrG0bZw/y7vvfS0kEmwVizQnoNZ0SN4IXighlFR0g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usgmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:39:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd7905b135so707011e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348781; x=1783953581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=ZwYAsrkgw6L8XfvJ72meKLXNelzntI/pi1/uBQ1usXkcZJEnmDNl7YA0U+zOs2IWCy
         lbDMXYVLJmJkCP4dU482oJ/sHJPKGeX4GWwCdzKalZqa9D9YmBWQnnqAF4+i5oWvyg6I
         yqBwJEMy3okl+a67OlFWSnLirqpvyYGpdPjobMzWrA4/JYyvKsBtyhUupBlDCIcje+MJ
         +AV0uC/3Lf9z6KuyAMf1SnPT7ryu1ZD4X/Cj0TaDPfbzhNhvoZe2Pf9hobwP3uIpH8bS
         4t0DY3xd53bU0cZlZtnwJAXSLGCHWOYsfrYadRWGqllOx0dFEgvHZAmeP7NB2NXXlIGQ
         3zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348781; x=1783953581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=dtMvQYZf67bZTmie+LI+LYKTY3esjbLXXLqyikQCRluptAR4B/UUqdfBhLE6mODYVU
         PYWvxyWHNWI5J6UWvj8+5gXNWzO9szExrtPoT764v0CBWyoHXJo46km/S44U17A14OYN
         5eG+AvFzMz1wX2W49XnjqlpBTVYGQAKH01htpxRKl3tblHNALaVp43NnFgST318i7XK4
         YnS/DOzYJZSV/Zp5gwG8vAbcK35o97N2nf08N/ILelHOJQjRW6taxlattY55AgXaJsgx
         uwQKJNrKUQbdDkV0+HNqb3h3XdAS49o0WwBTNYgB0CcEUfGQhmrrx85hGrfWktIm/AmD
         06Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqDiIOyKyiAqdFyQEl3yQg77HyyXmJgUMnprfgZ0NrOY1UjaObAjspM/Hn1DY3o36t7Eo5CDOj4g2Dnf8dX@vger.kernel.org
X-Gm-Message-State: AOJu0YygCJB/pfKOHUGKTUXlCq6BaMAKnIwzXH/Km2RaovvWIdi+cUaP
	3sPtP0iDMIbify3NIf2/z6Du5hyIvmiDlBaVjvMubcHsLiQmodWuTFHb24x8ZPl19ew6wNeO0Hg
	WQjq/twoQCujc1n1SWpHWIx0O7UNiXHE1I7eYonAthWALxRGkZ51p8Gyn0cGwgM8vLPDU
X-Gm-Gg: AfdE7ckOkBFzBIOVdFqrY8Xa4MrL6RjU/h2VR65/dR5CZGMQvU5qgmXkiNT2qSynHTm
	XqB1uNr/VlE3/vUFdVzPZVAjIDnsVsLB5/BIQYb0Xl1KqL7p9k82OXMuEJ1bWnKuEwJ4wF/kJOv
	m73k1bfGHMBOHvUBqCc+ckWLu/BvzZHq/pFuQTCWzA8kyVZMleg8/K8pq15U9n25Tr7GOPvUhYh
	9fK9GmTwRdYSDLi5lutVs3avPi+njLVJLBVaQJo/FY70StZ0hj/svLR4nEa33zNJV5d2xJ3BVFT
	iDKyJA/2xPZO0lQExjdUhYrg1e+V1ydfQzgJezS/YKJeUs5SEQUIG/EODaZBBAK2LwZISCEnZfD
	LR3r9dbtG/LaQRCBnFhw6D5QrtRlW1jh3i19LXT9KCXmwRc+h3+bp3nZx6Mecz1zkTAjooxf6Vx
	MxMwV9wdvwa6adMr477oMrAC0l
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473113e0c.9.1783348780744;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473088e0c.9.1783348780248;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2906428e87.43.2026.07.06.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:39:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:39:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
Message-ID: <6pecwkpvl4inltqzy24hbhouuz3e4hss477xy3ce6zldk6qcvg@4vnvqxykmio5>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-GUID: zsMHQy_81xvh4H_pm09TBNkEwqrTNvLT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX9zGp2JHVvL82
 2WcMWD4pX5cfI4NKKVAZ6i1UtHQGh0Lp0cTrjbrrtljsazCmHID2rfjrSuCwjOeE8RlJGAwpcrY
 YkTYHVtsNM2syb25QGDx0hMlKOjBhUE=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bbe2d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX1+UchOAEj+na
 k+aABDyBqqol17MqurfXAsmWCl6BY4NXDZEgIthnDCD4hkdYYW+LZnDWJHe0cMZYJMdwawHQPP6
 GFRQtbvzEzvs1tww0Y+CqpwFwnCgLzx/9AfwamGVbHILBeUvOjctzGMzU9+FdJiohcATiyLGFU0
 BPyvyOhiQ6Ciqq286hMCaW6EdA0g/6hXoSXvKtTUBM2LxHxwbd13VsbbT5f+bFGr7d7syvXVs8q
 MWY4KPgxWlrDRtxdQmnFqT59f2qCPKni50i9WshTjsP6Ehmo+XmVuFTD2hnWsq0H7O6l2Iz5JzA
 aJUtKzlqxfDDR+Us5BWofK1s5U93HMx2JtWH8Ic2msPJWnB2adZBzah1E8BaPH7hAe7NmmVXRDZ
 0wSMC+OtD4ObaSUEH6/TeuqMOuNYpSQ7Fy1k9+PPQsgWyQvL6jV+ChKwFwUqUY/dBm5hzOPVMvX
 zDoJuTJI9eUG9EFjkQg==
X-Proofpoint-ORIG-GUID: zsMHQy_81xvh4H_pm09TBNkEwqrTNvLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116903-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,4vnvqxykmio5:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62DCA712AFF

On Mon, Jul 06, 2026 at 02:27:15PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  11 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/videocc-nord.c | 507 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 519 insertions(+)
> 

This is almost the same as the Glymur one. Should it be unified?

-- 
With best wishes
Dmitry

