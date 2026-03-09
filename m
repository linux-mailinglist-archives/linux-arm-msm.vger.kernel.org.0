Return-Path: <linux-arm-msm+bounces-96348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I5zMlApr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:10:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B26240AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E3F302F981
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5D6363086;
	Mon,  9 Mar 2026 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCVAv5Vf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5IXX1sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070D347BD1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086944; cv=none; b=uuDX6jmSo9RxWO7SHke6krumqG2O2/G/Rer5Ogo61Xyv1pGPKKYYM0GjQ3ZIVA35h3hHyLFZr6fUHbek/XM6gUbCfcc+saMZTjl5d/jJzDUX+N0qbvNfzg7HSbBsIUt/zAbDbg0qvVIE+BJRI+v7bzbikg47arT/qDjmw0Vtpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086944; c=relaxed/simple;
	bh=CivJSULlcUm0R2bIxIpB4VJIERX5iO5pQAMhO2JB8cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlZ59Xb7vrfx0BuZft+CyfQVDQhyJYR/uKB71UY2rGHqiDCJ6lNL6mpC1+uLRxmmvoklkz4jTbUZAT+y5i1w9VM0xnVn4/Bj+KtCYaEoQhFxQpfnj1cNLZVEGogfEFUxhG1CxglEWO4u94UWHB38s89OwIzgiJ6l1ieVIVb+IZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCVAv5Vf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5IXX1sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JG7SW2872979
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfUKW0y58mLW722mWNg/T0ju
	WraeqYsHF5gBWmkSdLU=; b=pCVAv5Vf4z7opukgFZgJDKJzdQ7YLr0+JcyiK0Ph
	4/flBE9pfFpjopTmsg69Ps4UcajawjmRONN71jlI8E2PmnbdIEkDBngvl638jGCt
	HCQu7FjYP2tABBwP1pugI1fCBf76DAdSpsz+9OBS1ybwS48cYFbGJfDBoqPU4TzC
	Y7UJTjlesF3AAbeljxaz+UyTCufxa/5sPwO+ZsBQtoU7MxulMWNlmXckjF1H+Akt
	RbIJMXbr3+AHM/4WtovW66kO0nMjxZ4y/sWr/F4NOKfREGk/TXBZWQADC7/TiKDG
	cJ2SAjoBkkptX7D8WVC2GPpWz/wip0wkOEN8OEWRwWqMnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477g5hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so871319585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086941; x=1773691741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfUKW0y58mLW722mWNg/T0juWraeqYsHF5gBWmkSdLU=;
        b=X5IXX1scC/hQ0he8wA32Uh1oXVTFwyIr8B1MInx+S0bJSN8KACsSW+Tu4qhUkXY3X4
         BXq9fEcLIOxX8UQ5bquzJmiMd8J28UIgJV3ECkVNj1xz2NaMNyzZ0xIOp6FvCgZiQAH0
         7BaoftKh34Ce47W9eyVpze/tU+WSG1krdRmenKu7XToEzoE3bMpmzJhCFtmS7IqzFvvF
         KRaPDUikMrHqL74A5ZXvWqrZPNyLJEU70I9sgUk0buiD66aoDpsk8NEcKG8GTJnXqELB
         vKkBOZvL93U0Gb6YpPsCyQY3dgtQ44/Ap1lDC1VOeocGWm1Y2Ny9JdrFjMCSkZbkStRP
         6f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086941; x=1773691741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfUKW0y58mLW722mWNg/T0juWraeqYsHF5gBWmkSdLU=;
        b=Ze2Zk/UDJJWXjB1ekmN4XhpDvZwCG1l0vahlhbMIFl9aI7L4v2F+lk8pFf6PXc5Ktb
         TpWyDX2AYqj0XFdSoEyvWiOPuJZLkt64i4RlasAB11Qs7dTx/yEwCws+l9OuhWeDBUhe
         UY4FDrlzixSV2GjUXRlKMq0urp8EKQNO+T5KC8CqvAVzGga6Q7sjUJKp5ceXgQgC4tO/
         wfo1jOM/X7l4yJLlmEUM+qwNu8BXTd8fe4qnvJSR+o4ygmro4aEz5efoYKweM1mG0jwi
         +fBJfvxKnfIwG7yD8ji05rn8gXIqn49wD5Mq9l7ecNabkIf+tUPpePZ0Uq4CFuouEbXd
         0+4g==
X-Forwarded-Encrypted: i=1; AJvYcCVsyP3vWAlk0P+qzHnQth3+yrSjQEtMJwkI/oe0qZgpxnJJNTStPB0cMuhuKYYLBcXYq/+6rwVXAfEw96xa@vger.kernel.org
X-Gm-Message-State: AOJu0YwNb2mqp2DVTb5cV6NrQtfKsqXzO8svSuKPCbYrS+brAC8Amfb3
	jLI3FoTE/tTFbytEgh4oAnxyKpjQyxSioVsHZ7RkV4kD7IoaUyQH8tl7U2PV9OZmVx+ZcXO1ukn
	SFau1p0OgNV9559cnVPMETfb2zaJbsw3/6Fi/2wkNUZWEazEyJhuvxjH1OhogISRzsQGG
X-Gm-Gg: ATEYQzzvQ2QoG4Xs7VzW7G1rOOYHDzJRloyyuuWcAz9rKTy3WtHhnOgib9PRlYEpQj+
	5kIrvXhvsUSGyuuh/4ECY7m0kN0EwZwcawzwcUrHPbNR1kRBdIr17c+ltUoNtQ/qPe+0ehoMOpv
	bCxwll6soshcAqDuqkOLIMrdmD9Jg9CY416mYMoPOtin87wNshZjkBzKVvJwBEV4bHaTd49+olT
	Anh68rovc9BXbvei97XTalMJM4tkn6tl1xrF4EEFUz4S/j6d7Dgyw3ygk7whkvGx3fBmxQwU2ie
	McuIgQ74VTFMoEcI+sLQIIFc/+ev1nEJgMB3NbQTZZqwOQQfmt1oFpb1E4uH8pQxPYhhimnIv1N
	cgwnEkeTpRaAxIjcXh75CIbr1zn3CZiQTOkepy2T/q6nmnjtRLwjyhCumYrxkPuT8HKEyNTcfHY
	hdnj7BXqOHQy9ViyWAXoN6Ce+wUZBOoAKfOVo=
X-Received: by 2002:a05:620a:3952:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8cd6d4fae6dmr1660093585a.39.1773086941378;
        Mon, 09 Mar 2026 13:09:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3952:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8cd6d4fae6dmr1660089885a.39.1773086940961;
        Mon, 09 Mar 2026 13:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c1cdsm2361438e87.79.2026.03.09.13.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:08:59 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:08:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: gcc-sc8180x: Use retention for USB power
 domains
Message-ID: <axivj2gb3ymbqjlu5xovhjcprloxw5taeja6vrtlirna6limbs@5umxnlw36utp>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-4-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-4-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX0gQAYrt8uNbe
 63O/u1SL8zS55Qp8Yp82I9yUGUeVx3J0Tm6s/xTeuUmwPIciYsTBfPdZm4DiCOs3eazIvqr/l/p
 6OQdo78VL/OzZuvfeHILQkwZwKDTwnJLTHsAqF4LeTw0NEKg2udsNfm7FtVN929rzGECKrDidzP
 9SDfwTOBKxrUJuA1rXZzzX6EdWjdT45Qf0LLiDzUup4YsRguCLrvbhJJM5g5GSADtk7XI5DfMQ7
 +o5Up+Kafz/hIpkP6SMwXrigbECPdNTRsdv6M38n+a67pFYB95TNX6SYv/VltSedDRmkUz/OadR
 wWR+BLCPUz1Uo4zNqwdJPjgE8nmDFr3qxHgZ8nBy4Ekt/oWT+6RCYpgTDMysZanLjhGJs7+hJmL
 OmIlSS/607neMdMUwcNg/iZyPo9LW72sNPfKvGYnnL94+EWuU57xweznyLPNnctlxd+H0KUcrmR
 BhrtDQlvGlm7FIOf1PQ==
X-Proofpoint-GUID: NlltJdPKRuDEym0CImNipPYkkld40JFV
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af28dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M0n0xMwgRafrvhQXqkIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NlltJdPKRuDEym0CImNipPYkkld40JFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179
X-Rspamd-Queue-Id: 29B26240AC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96348-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,packett.cool:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:00:25PM -0300, Val Packett wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
> 
> (The reinitialization usually succeeds, but it does slow down resume.)
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

