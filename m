Return-Path: <linux-arm-msm+bounces-104522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nFhPCFjM7GkVcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 16:14:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0444668F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 16:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8EE9300CCBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB81038654F;
	Sat, 25 Apr 2026 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7BFeiVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WD+sPSlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77005224234
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777126483; cv=none; b=PZJmn8kOumraCqwlC/yP3R+39BXAP6xVXTcUprwA99BL11EoyWwUm1cB2u8I+5A2ivFUxVF51AtB7mai9F27ZMtAsu61PMyLqjmNu2LwXXhmatuffZJYu54E5qWzvKoyqZWHn/+zuhtVq/3/IBz3Jp2ieSQEbCJRSrNLMEzRDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777126483; c=relaxed/simple;
	bh=eYGL9lE3JVIqwAAW9KWYWS5tFK2BAmUw9UAz50Q8GqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyABIpfCXvaFPwwws7U7Et/vVj9liVeScZ+zTgnxJsm94ISqMRpW8oLhizRc+VtOan9OQNcL/yMbIensJ0FlqIdCXi//hIjFMMHdF+fq8EujepUb++ScEvqbd+pW2njkzAjXAB8caOhTnQDbgnSNNc/9e4zk1ecIykzBP6GQb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7BFeiVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WD+sPSlj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3Jif41728137
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 14:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yVmaNDoZQRpaL1NHPS2XxDq3
	ywskpFtbeygHqbfYChg=; b=p7BFeiVc9Z5CU6IjeCOro7SJoS6zJvMvFwSkup6+
	wWZtrdCXIrWt/6eBAeG7bMd94GcQCXdEFUr1L9+fCe5WlLRj4hKk6EJkzs+ii60p
	l/u2KAkO5WZvDBkq8KOuUa5MTHEX1ir1V/IYDV1vNKh8juyV1LHqhUSEm3bs/+ET
	aGoiKfF9nJCP9fA/erswePhZBO4lIcdTdPkjXerir0e1f/LbSkJko5KzvBEEdpXd
	DlDMXO8xHhPbEZ57m/0UV5EaFjgTTe9SG3r2qHkDV9VvBz7WexsbhzxDc/xRWOAG
	ByRfE0k5ese/ulT48rY58uvuoQex+J81/7bd99frzOT+gA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx93tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 14:14:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60fd805d912so6595656137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777126481; x=1777731281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVmaNDoZQRpaL1NHPS2XxDq3ywskpFtbeygHqbfYChg=;
        b=WD+sPSljP5cSQ5Aho/aDe04A0V9QsXvqhSGMHCs7I3ehS/1DSgy2VhdC0g6bUBJqcp
         gJAlGlnJe/Dc4rkiVylR85TsDRafjLex4R6vWEoZBipQOGEhoTyOd/m2XnxnpaNTx69i
         1Sz0+FRwqhfNKYnEKGAdxZsIScT1WBVoOkrA21pletGicDLtJRCZRufNoNk2SjmlFtcr
         2kovaWoYs/HSgCxV+joZYXxKLaoPIQJtOqhTjqLkGMLlK6yL8urORXhsiVX+IUPXs763
         XrHV1ct97pwuRdiIX8O04VsD7739hEcyOSzSN2M+p5h7kEnpGYVLLUBPR/Ifhnv56eYz
         V7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777126481; x=1777731281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVmaNDoZQRpaL1NHPS2XxDq3ywskpFtbeygHqbfYChg=;
        b=RvLOIiNkSzfi6cJiGFrDU72hOc4TgdEzutDqNH7iVL0qKgD9sLaKp7XurpPIN+ME6e
         4i5fhwDW3+xj763mpQbGLMtyyh2SLYsCxztW5IIFWxK8VStBMo3aWJyAUtyg+axOJqC4
         zHff2ZY6Rsa6uY12PEnWbMqDk0djPnCa8b+iiAVU1cEGcu+EJzKHRK3FdTmd2vcNAa/t
         WiGCGHrOZhbbW0vA94Y7MW5hnwuGzndbTlg0askY2J7JrA6lW6NUUJGOYDvHA7ES+yM9
         twPOFRWWHYJpPUojPLzU1p/nNPSMyZxKwabRu9t3kdz7Rw3n6FG/13vSCjOAGF3Tly3S
         vKNA==
X-Forwarded-Encrypted: i=1; AFNElJ92B62MOBuDWK1phLntC/CeMPDO043a+F5v8PB1HuZ9MDS+jB4b464Yx2b4M8uu6hZr6SglP2Y/d5lPmNkd@vger.kernel.org
X-Gm-Message-State: AOJu0YzWbQ4y68QicLMyTafkRLfhnVSfODvWvTHHiW0xJPeZWpJBx+mQ
	of3XpY+XZ25VhMhAOYPMA0QpUWxY+sh68cOnif+Bk3POkNi58EQhEaA2rbJQ23cUws/En6f154k
	VfhuKS3sNKGMCwp8mauvy2H839Vj4BgKu2UBHhw3gAXrPtBqPCc2s00IsHe3llXlUggNu
X-Gm-Gg: AeBDieuJ8Px7XOzAqzlft53HhQgIqcHFz6ZR1ovNKH7O7SEbFqGciESKnvdT+h86ngj
	O3lyNoWuFAQXSUiY5ZX0gCnztO91CEzY5LQcN8KiEaAxlQjXFqL3Odzl0ahxKswiCcTnNwJ6IgS
	sXBH5wqXqkwETi1XXxWklxxkM+NV5DJ7ktjEUzFF55BJOVFXIo0JyBGNxdY6NF50PhmpwgaVeEA
	sBvIDiQ2xIta4TjCUb6hXs5GBfWjERfaW5pBczEqbk6X2g7B95bV3QS/1/6GdGj6pzAIDrcuIIz
	T2ZAwcOk7ZRG8GPAtpPcqVKECr78yqi2bhXGK22MKilnoJIffsSuiBwIA7822FFcD7DKgTI7YEV
	mq8DAyyTdosabMU3pl5nu8R9p3DSa5Sii/HSYiX32k+7lp/w5hxB95S8JyDAh6jyOssKkqzffS/
	gaMXTUmStDR9J5fwMzZ6zET53eNY+0Nrc0qmVBoNJEc+BnSg==
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr17012913137.19.1777126480757;
        Sat, 25 Apr 2026 07:14:40 -0700 (PDT)
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr17012898137.19.1777126480264;
        Sat, 25 Apr 2026 07:14:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3905419b4f2sm34022761fa.6.2026.04.25.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 07:14:39 -0700 (PDT)
Date: Sat, 25 Apr 2026 17:14:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN
 supplies
Message-ID: <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
References: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: IjhwfNONXUbnufXDuF3TbDEgp5ABphrx
X-Proofpoint-ORIG-GUID: IjhwfNONXUbnufXDuF3TbDEgp5ABphrx
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eccc51 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XZbvWPK6OdUBLnbwwvwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE0NSBTYWx0ZWRfX8eGGcycza3mN
 tUZyNouoLdYFY0xgQNI/rRUt3yGn4ANCozwRgOVhT2vp+68tuYnF5pivphlRf2cWK3c8Ane98en
 V6eZtKLXPofeRHkVfy9wSXT6sZ+tgwQv4GcZJywYT+i6wIwPCvdqunJX9O9PdRv50mkgQmKlLjD
 Xv9yY5ftsSGeCWPpAV5wffRa11zmXS3fshNqxrkbjJUY/bZMR6E+j+c+g/Ph/Sph9X5KtRWNaTH
 S1pze31qUe9Qti4o1DpQBV2hHBeRq1T6kt5CyQ8W6RSRgP4oEuTqS/z9BqFXJfumjGWZMslYItU
 Yr3WM9JbN3E/mH2EZqOQDqOY9WZu5CfwwIHzyOucGzq9MI2d2rvl7UIZcQLYuWRusR9P5yhUwjz
 yoLDac6wL7vunWM0aylf1QTeO4aF3lam4PR/CT6gxCLUA4i8o43d3pid1AzEaxDP1HAa71rjwfy
 ApTc/Us5XK535+xTBCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250145
X-Rspamd-Queue-Id: 6B0444668F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104522-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Sat, Apr 25, 2026 at 11:17:12AM +0800, Qian Zhang wrote:
> Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
> power rails for the Arduino VENTUNO Q board. The regulators are
> enabled at boot to support WLAN initialization.

Tell us something, how is the WiFi wired and powered up? Is there a
correspoding BT, which isn't mentioned here?

> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

-- 
With best wishes
Dmitry

