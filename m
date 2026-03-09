Return-Path: <linux-arm-msm+bounces-96351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HiQKcwpr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:13:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07768240B7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C29E3300DD7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24776366DB7;
	Mon,  9 Mar 2026 20:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1cbXDht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Apn9ffxo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B2362124
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087162; cv=none; b=HSda8ZNJPQ0YgQ/rhDuljmDV68w5OLUIJJYpHpzFyrymqMqK/L6tlb9y3vr+K/zlR7FTqYJqMtPCYlk6jWFbupxSniKfJiXkoqZHstMj2DnUZ0RChpoubdFBgSCBeGKr5Adw1fAfcdxx6/axgfZBrfuk2HflsgHaDHyNpBCPQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087162; c=relaxed/simple;
	bh=UlBS8zDCFq3qzumo/lae5ujk9i0RFlrqy4DknCMxrsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDH+EhFohztQ8Eln1CyGIEfFZtDu3locqaS6qP5ciADpQPCbfEAyJ3SncTgn2KFtREARqMODzcERxXN2ON2aZriMYOFg4SsfBvdngqHrFg/IZvMhEv76I6Ep7qOUG86MPWuvebaIIdmJrygsS84I4GOY7xphuEsSnBJo6ixXeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1cbXDht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Apn9ffxo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0QV744380
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WhibxgqJcJzy36Lrz5MTMsf9
	66TmVFjPQjvRvKYimYo=; b=f1cbXDhtiWvHpQ/14WfLH1FwotMpW54iIHuAOxpm
	9VDQ+GjnQk7sjxZTfKH4Zc/hgVz2uCJRFfSte57HraAJOynXGbw3zKMNBBfoyTv7
	FpATUiEq3hD1lSJ9+V9V8tH1y4noins/10tT7qm5F7azWwNzn540S/4TEnyLgLYh
	gLnyiysD9GDxm6dtrgmJnG8cTn9UfoA2qUf0WMQbQHX0GUqV/pguphhGxuCBk+Y+
	pPFvtnAP1s5vpI/qNE7mwg8EiG2wwb/2X5/mQOdOWcK0jITZKLvXxDmXp9WyGvA3
	+kj1A1JWiJhgrInHih6sNBJ1YGjwXqdfqvWIaAbS4meNAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaabet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:12:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so896444485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087159; x=1773691959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhibxgqJcJzy36Lrz5MTMsf966TmVFjPQjvRvKYimYo=;
        b=Apn9ffxoBKWrwNfUTFFRzIB3D+MMd2co/jAkQrZAP7zhSy0qPQj6xRByFjs6I4ph6C
         kKHQn0hF1sSjN+K6BAngdI9oT1tD0IHxP/e0ArcZsA1Ji1kAJwRP8XkTUBVtfzq5FORY
         qqFQ1H4DLK9kM+qiA+7PDn5HHHC+aR8UesFm9PUYYwXchqJX2OL0HBU5FRPR46OZW7op
         t7GnEEL3AfqlMmvDfgOgYGj6LE48cNtPNwmiiTZiEOcSZ7xbRAF3S/eMk76acopPG/2J
         PqhJm+S9AjvqI1snSlzbCew5yZQ6QB5TGdt5HQyIhO7CrGbXY+UMfx1oTmfEYVl+MbtD
         WQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087159; x=1773691959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhibxgqJcJzy36Lrz5MTMsf966TmVFjPQjvRvKYimYo=;
        b=bBWOPSBXrjFpVmar0EDCx3he3Y8x8hQql4g73iTtCDplcwxbEAeJ4WvMh1hLIuFzqb
         zsy4gJJT7srq0AhV0udEJCk3Xr4cKusJqfTjBUiCcrAPJVpa2/qzPIRv7bJzq0tUMvDY
         YvzaTgcVyGTLvqxjENxBDw1TdRuI4tAmAeh8UvL5uUl69CK2qTTtS/9nts/LBZgWkwCh
         ElnZoyL0oAIkGoXvJnSkJgANeTCqOPd/0S1M9vPkypCV27aXLGdnXubSjx18pUnhFl+M
         qisk2i5RoSR4/9dlg2edL+jqGL8If2/1tPXvAE8cx9OVDN5KkMOkv24z1HABB7xWrF0Y
         KY9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2GYfZeTu/Ba1JpieHiGDrTAH39Ldx83y+EFhZ5zaEYzCH2PQMDUNpWRp3Djh/UPG1O5GtXQvLJOP3Rcn9@vger.kernel.org
X-Gm-Message-State: AOJu0YzpnifRWgHm2QJ8rt7IZmsfELlJsrbwerNZd56+eHjbyoqc6Bl1
	xRWthBp6/cuys2dfVdPXCgUe6KCgkLAW0y8EzpcT+vrv46y43+uTjaqpY56LufLMoMXahK9lwKG
	WH/+Wtyl871h/mgI5OcVCOY5CmJZES9k6hBrZOVSNObtkcqV/qB2gG09lMGmOyoLSaXhw
X-Gm-Gg: ATEYQzy8akagfD3OKpoZrsO72+0wmowyWVHnlVw/5fzjmhEql/VDqoUOnEbC/Yd89cO
	R5r+EsH/rJJ74lpgdLA+v2UNHgF9baMO1cvGK8OVz5P/WES389RdbTod6w05kufdX2oZHLYiw2v
	UJ/hesOchnl9KDxF2ub7N3MlfkDdda9OaIKj6b9J4zwPv2pqNsKzRtAOHMqqDEyT/t+Eyk2Rt9X
	wwJ5hUwOCTZyEsS8E3qXa4WBRO4bVLJBNB8Gn3o5uxdpoAAVSMFclaHozK06S7mYXfwFhQyUx0C
	sxPUZLKGe0aIUGK7F2P6LFyFn/OokSzfxfjr3PSWuDyPvZqegIgaUH/vlgySnkAuirXUbX1bL86
	1XR9PgG3lHfU3TGxl1WAapmyB5GN0JfCkabbMeRmoQQaZOl7K90bDU4XVwxtTq+0lR7nY5VJe4W
	3kHDqjcoKYf1GJf+vEKeA+10G5hu6295Jie3I=
X-Received: by 2002:a05:620a:3714:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd6d390203mr1601995885a.34.1773087159308;
        Mon, 09 Mar 2026 13:12:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd6d390203mr1601991985a.34.1773087158851;
        Mon, 09 Mar 2026 13:12:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d62asm2243445e87.91.2026.03.09.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:12:36 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:12:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: camcc-sc8180x: Disable always-on clocks
 on probe failure
Message-ID: <3xct2a34yimgbqp4war6hkc5txnbmsys7mkfgpu4hmsop6nqts@pmb7zymm6wn7>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
 <20260309010653.4266-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010653.4266-2-val@packett.cool>
X-Proofpoint-GUID: DOi-NdoXAk3GoHaa9haUkjp6GtCxP2Vr
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af29b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IplSaSJw_Jdne1jC1k4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MCBTYWx0ZWRfXxHXtWV6glzG7
 LbV0EN90KAm+VwkK9dqxOGqk0YheNAlxmtx7aCYnScEWMLuV6LLpSgiI143oRr7lScauVHEfzlp
 3Kkowg9k5Tl3Elf1RDL6YkCo5AfEjW4Gj4vMVcI9CPx642cmTZPjsYc2Yqaw7CDqcdo2R5wGN31
 LqEYfVI6WGqrSPGvBi9K3EapatxP3igDNrEgvQAKCK6QFh00geGjcG1FJBe5zA4HFizTHmxTE3M
 igZpWgBqffZUEof/N62O6z0+pDtcSwm3lf+KxNhwKeuAQPpLyhiRQemxnkakUoXxfP/6J/o880r
 hLwv1wh4v33+GoY/sCU7HH3X/RYCLc1p27YTmmF7uEn0QKQLn9XDMD6X4pmtZ7IfOvTPUAjHG+7
 PmRqRZcpJUMXhayljb2Rv4GcmrWYLsBTfiie3b4/1KUcgfoFAgC0aDCcnbEiu1r/r92Za7UzKnU
 2Ss08/6UY1RjdEZ2/bA==
X-Proofpoint-ORIG-GUID: DOi-NdoXAk3GoHaa9haUkjp6GtCxP2Vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090180
X-Rspamd-Queue-Id: 07768240B7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96351-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,quicinc.com,linaro.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:06:04PM -0300, Val Packett wrote:
> Align runtime PM code with sc8280xp, fixing clocks being left always-on
> in case qcom_cc_really_probe fails.

Why? I think (some) of them might be left on by the bootloader.

> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Should this be folded into the common code instead?

-- 
With best wishes
Dmitry

