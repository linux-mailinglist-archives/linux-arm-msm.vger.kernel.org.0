Return-Path: <linux-arm-msm+bounces-96352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCQMD9Uqr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:17:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27472240C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FF9D300D74C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B1A3ED12F;
	Mon,  9 Mar 2026 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFXCoAsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzufRY/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281213451CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087441; cv=none; b=XWHY9HEtv3Ed44h5Yun2KjXu/rNGuNJRpI7GqDNFq93ZfLeE5aaKPe04dAHFITqu+Dy3KMibxyL6xovsXR1Z21kvzwUxTeS/AkLhHx4mXcXgGK6nZT8/uRABHlbLD8qzDn2B8IaCcyJsjQh8TJTduvYXzB5Gm6YKPd1TRzgPx6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087441; c=relaxed/simple;
	bh=gPiX92NT9mKde0zMMT/God8FXw+kFh6poVE4X8mEfeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR2HMT3FC2XETMQLz+s45FtaHKh2+t2phYT+jDsqmTyi2hALbkykbHrAnCY+gWtKqlPB6r3R4pPyD1cjNGHvZDsmyUVVJKx53QzJokbVJS3M3r+eUdElLC/+u02LGwHQ2rjBAVMTs/XjR0Dg5Bp8K8eGHR9gv7Bs8GRyRhKFw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFXCoAsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzufRY/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBwEF2427819
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bl733rFNVoHjnY3FJMPPEyn
	NpusuvQRv/qTulZdrOA=; b=BFXCoAsLF0mgw8ieUsfxpwKDHQqw7+1m3KKuLS6z
	4Jot9CZ1mt2cVx9+ElH00mbvWAUjHYXk13fBe1tQG1odJaHEzCgv+3mJergFGSEg
	94cr/OjizUlpgNxN1oqw5Rk5bC7zxTAqoL6eFiMTz1QQFmLHfhRWsgd1dPSjRXPC
	jZPc754xamjazxe90POwp+spiI1rUO8ISmdk8O/sXN72wzX4+I9j+f7YvRXbFAX2
	5lhzc0TpI78iNUxh5PM48m2JLwUl423PWVvFFhSmCnOO7kzgVm5mSF/yqDKjBJxH
	zclxk4868t0A8HQnBrONpAvWPHxnimNRZijH7FH7oChB/g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekrvc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:17:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899f474fae1so538841456d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087438; x=1773692238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bl733rFNVoHjnY3FJMPPEynNpusuvQRv/qTulZdrOA=;
        b=YzufRY/8IUcKfGIUyTcJBrV+3Vwzk94odtc1RB9BLxVVEB4E5eJT079fGS9z70ggz+
         Pw4XDGdI+R0AwbEIc97H9Wxcu60kdXnZypXQ2w+1hrR9+K0CsIjJWs3MWXth+KOFKbIa
         sf65DAiJRYsDvgZsKb05HQwqp0pIbcp8C4WpZNaLmI/d54NvzYGMvIA+fW48bm4wKoTw
         PGAtSbP7gwjw5AA3Zmu6Rv0x5HII2q3NG2i3fHHms0Vb/VuCw/y60AOuE3ybA3BxAGyu
         eV5YEUKHwgWYCCOnTCuymiut+Ocybx/VustUmYP2E6ot6wwotD3LbeIMIKWsXfabUfNM
         wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087438; x=1773692238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bl733rFNVoHjnY3FJMPPEynNpusuvQRv/qTulZdrOA=;
        b=SIagUpvOSNcGiG2wMQpgi4Jfd/jR0dE1wEqvgEW4EGcBWLQUU0uvlMmT9Da65439kC
         1f39l8nJ+sCLJctOxKktxxOeX2EPz2DnjtGT8XeFK2UQ14Qf6/1Z0ancDOwVh1OZdwrO
         EB34u0U2/G/MBCEKeic5L8Pq132Kn69j0O0NJgSjVWexwBcB/PtOL8DGv1GyfJAPObsp
         Atli7aNgT7t6ks2No0Ym0rqyMnGvgtdVMdyGIvgFYpy4fMp+iZJfebBgTRG9D38lTol3
         V/zXDPXhJc6tqrpIlud1kXZ/XaWxoEWNwUSPe9xY+xVnC1zzD5kwpUKu6UedI6L8wGwg
         Y8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdKXLS3jaBmp+qnQ1rCqPshLPSsHHZpkffsGkRSc003ztr2n8eHisaQJVubMf8pKZj02KNyFJkwm9gqrAa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2H2z2vFClc4Zb61/peMGqcPJpw+I1TPTvxUG5/EO5mmubPT6
	TCHtTAs6ADHKyIOo2Y1KfkfpP7ug8Y0RMZP+uWKUovrOVjiVewDM9Cjt8sUYRa7dsvcRQiw1J7B
	tmk9mX5oAeSz8DKBdAiC1q2fEFPnd43Td0Cxx/HhHpIsVnrb/TQXF+nOP4/84dWAnNmIe
X-Gm-Gg: ATEYQzyysgUpWhYVnajPheNzL4QhagmV3GKKKzG4Nq0sUqCcEnwlhD8IOTy+yZzCbTy
	pdqcjDAURXgQ8Z3YhLAR3k7By7+NWN3uAArNt6CfKLv+QCUP1T8m/gWr9lYOYiP+O1YPYjuS4f1
	nAAlCxwBIrjOoEFGQ0LDETBi7aZVNUPO91F5mCYpxcYbSLv6dEpNbwsAoHlYt6P4i0nafc+benl
	ezsXxtHWegG6fIlQ5zcR4g+aTMbT8zl3R4Y8YHBFqRqEq26p7mBf6Z1y//WPJNNvle7+KTVK5bW
	ypbuU+U0cv9w96bnonr/e8v5kTlN+vgIxxVqRU47/gcVnqAED7Z9jS3yPH2RU1CdGk2Qt07fmVh
	Zzevx5M6jyEM57f8WveLCw2RIo9GywgLF2zXs77/u+1aMKPyEvDD/Z1ePo/Sw+gluM97NK6mjU1
	MMJjbxb2IeFWWOkVICQz9/S6oviMBIjtTWlY8=
X-Received: by 2002:a05:620a:c44:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cd93b3cbd9mr99037185a.1.1773087438267;
        Mon, 09 Mar 2026 13:17:18 -0700 (PDT)
X-Received: by 2002:a05:620a:c44:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cd93b3cbd9mr99033785a.1.1773087437839;
        Mon, 09 Mar 2026 13:17:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2281593e87.62.2026.03.09.13.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:17:15 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:17:12 +0200
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
Subject: Re: [PATCH 5/7] clk: qcom: gcc-sc8180x: Add missing GDSC flags
Message-ID: <usvdz7ocxyl6erj5aay4ghix4h3x2hklfmkg32fvakuzuoj7vw@zq66ysfqgte4>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-6-val@packett.cool>
X-Proofpoint-GUID: p8cPZSw6cyk9PCkkdMPMQCKaz-7q-vGy
X-Proofpoint-ORIG-GUID: p8cPZSw6cyk9PCkkdMPMQCKaz-7q-vGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MCBTYWx0ZWRfX0RrwFA5kNYvv
 Gznl983UCPeVw0raVI6NzFi/pZTwg3em7ZU6qR91CXwYHsmIEwulRz6oEbYTcb/GG68hqrLkALz
 XWMSTJJLrWkPsyJO/fmK2X8/TeKJCqloTxQJ6vnRPw5IA1B+KadafbQmdIrH9ewuoAm1dGK0HRN
 TG1xSZalrS+bx0hnK9PsXgSgkHI8T5/StOJftH4kB03bx9cg7EJvLGr4PqiBSqxx7DQQArVD2gK
 2XJELY7qB/8PfzAfUEboB+6rBgl8jPDnHvdP0grOC9rE4Q1xDi+0bb16HrztZARVy+HAJ+9DIMu
 3q86BynJ2pcxDkbIxRFOXCCUepSuwxS2QLjClPUZDiLYEIHxBW2FEHpYtZAIGsMyKVM0lNZgB9T
 HzcMTiqxbrNqHAxFcQHd7uimStkg6fz+cziJcv7mF8fWgn3OK1oxMQG3RpRwOlDqMcECu2vcwHE
 jgtsBfU7l5sn3cVgf3Q==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af2acf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YcTtKlT3hu8PWQJ1XPkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090180
X-Rspamd-Queue-Id: 27472240C58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96352-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,packett.cool:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:00:27PM -0300, Val Packett wrote:
> Similarly to sc8280xp, the GCC GDSCs can and should use the retain
> registers so as not to lose their state when entering lower power modes.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

