Return-Path: <linux-arm-msm+bounces-104176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JsJHbop6Wn9VAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:04:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C704144A720
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99C693062266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504073F20FF;
	Wed, 22 Apr 2026 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKxHAsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lqpt0Ese"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26D367F2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888187; cv=none; b=ubE14NHeWRwnZPVI/Bg8y0DF2ceEivANsJj4ppLkSFAe5aUmYfL7cARyc6dMg4rNPrDEtSf81vHygwNrfyV/MwtnvhcZIIJQH2dYQ9n0Gfh9zg+XzsEeFq0N08+G7CBH455lGHmMiWOcTPR4e3v4FiKf9vU5PydsLwvD3J8NkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888187; c=relaxed/simple;
	bh=o3uw8Dl/mDosRTBxq+evRZ5aY6Q5yBBBb4lp4lxAIhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u33m4slNooxY1Xa804ob5ItTlzRArhNSCKCwBWwd42TxinNSk56EgsHGzt+D2noTMnTNWpKQq8pP1qVPydPqNzGsEDZGirewRQ36/U5WtFL9avmRpcpeKg+tHohqOAAOo3TfLERvhXM89mdoBrKjbfK0/7EBqgcWF3bzwfF1zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKxHAsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lqpt0Ese; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG43uU122915
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uwtLBUqQQkmSkDCqcS+GWdss
	NcMifU1gLo5bRnSqrfc=; b=lEKxHAsik6FJ6HUGneLN1ZT2KQgTXLF0hnGafeY2
	yIu5osCeC22v+sv//KKgMtlUneLNP7jnuUl/aYe4vuMASRLx1nNZSAk2TUIp/Q40
	hSGL+MmSpcmBYxEQ8ZcUB3PZf8bxLL+YaICbDhNfFcmNlvEMsLdWAattVbtRdPl1
	Fk5xowyw6oGFtvzpRrIRJKjBSYXRhKIhs5VnMod1xOv7whhErIGMGuKXtfNEx0dQ
	qpJqQ4N5qKb2dcbSDuVLhCbqpHeDnlLlYJCVNlV1PRjJE5i3mGzrR2qM+egCPYPG
	7rEKu7o6OJqvcfRHPoFPEQlngUIK6BVQN0n18FGQWSDm5A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80usd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:03:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-694a25a6645so1820881eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888184; x=1777492984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwtLBUqQQkmSkDCqcS+GWdssNcMifU1gLo5bRnSqrfc=;
        b=Lqpt0EserkxK4nP08gpeTue2BRUUj7LrnqMovhJwN1jVX4gTeIw87HVw6X6wQTUtU5
         f2TEma3Xlo9dglm9yQNGiNOqcYzxT97zBBK57nzs0/QU9hIWhCY5eEtVbX8X5jRQ8Kap
         COxyKlO4zNTfUiu86CcS0uCcYQ8kLmOxLYvFNLCYCjJlUPaBjE2Iv8rzcwdsilyepYWx
         MYCGKBf5qCkP9tE1zkz6mjzCfbLNrG2pMhr+dyMRkyBcZjEkBIyJ7oavNBYZCCznjBO9
         GpzfF9yDs2ScwwkYQmBPQnCvez1CnjaMtTMZcs8Va1ROoi1WXJNRFc/1SKCCVf7yStlY
         F9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888184; x=1777492984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwtLBUqQQkmSkDCqcS+GWdssNcMifU1gLo5bRnSqrfc=;
        b=QOxj0osLdiTcweDB/DqkSiCBV8vlxUKGAl37zVJNqPyb+zDmHHhG9SyhYYtK7Ph/kp
         gFmjf7cYqApFNA0gVqTa6i5n0Uc8KHa/vzzMw6icF2fk6UPLDHfP6HgMsucQbC5Xpt+a
         1uhBLEEX11zVGNON97s8rS4AtshOqJbkRB84Zdw+x7RsjxEd/ixpDDG9bKOEv026j0Qs
         aB6OobhY1wvOBGC14SEAe57pvKAHjuRMbzE1Z+6wqMzKuyKRvwU52opnoRoYVL0KRDb5
         L378RYSmCqajroLQt6cBtA/BC2w/5+IlovRCvWKXKPu9Wz5q/2KAYvRTztGLPJNb9XfG
         Thpw==
X-Forwarded-Encrypted: i=1; AFNElJ+kWI2CEDug3QX6qf8ICO3xEzqtWQ/3p2KfYBFAdC1TB27SHLQDrvyGDmeJXeQ7mj4nPJM0/zUjJpd4NP64@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrb+5LCQ4jqb8iIdgSv1oKGNa0rMPF/Z1aTlKkMuMShTXlI2Wd
	dS6svXlmDMGbs+axaMoTTr515M8k6ugebeFjtu1Icf+SVmirpuUxWkYclb8twsN2NPhio47CBN8
	Rl+vNSq8MFvtd1CGq/3rDYQ5zVT/pRm2UD81ue8yaKCOkbIY2Ba1VtOledLMVOhF4d35b
X-Gm-Gg: AeBDiesgx7RdSJ3NtvH2VFvscKiwIhozgvhfWTO6ESOzFNxmtIe57Il8DTwx9Gc9WWN
	f026L+hV1R5QceY5J85cm+Vu+kArvenIOHEpGYKIDgMAdk0cNXgDaxQ0biE8iUisQSh8IH9uowf
	uchEc5aW0x18w0IFa0nZwXKKIIHTNbdFcTpnkg5GZTUXWoDNeu2hxvz8USJRgUWs+jfWbAm9kpg
	YeZ8ZXRQjQ/EkWTpSIUAK6GmIfpL+MqOE6y03lIXb8MlontGUySKvG21vcaw6Tmu4pNkwYAokCC
	zK/b7qgT5mHdUTup3J1+0/kZlGQjBMmA55/IUJ0m4rWvkbtzjjkj3za7/3e2HeFddIkPxsd20Id
	qqw3S/Zuh2RVN9i3EHWqOle4fZs1CimIno+faZHQ6ANjVtyPWhkXaZa+d8mNbR11bBMXlah+Qn+
	cmpY8D+4GObw0tsz5rzOIi2Z9+h4prnh5nKP0pKvHiEKRvpQ==
X-Received: by 2002:a05:6820:81cf:b0:67e:cc7:ccf5 with SMTP id 006d021491bc7-69462e168ccmr12989577eaf.9.1776888184550;
        Wed, 22 Apr 2026 13:03:04 -0700 (PDT)
X-Received: by 2002:a05:6820:81cf:b0:67e:cc7:ccf5 with SMTP id 006d021491bc7-69462e168ccmr12989547eaf.9.1776888184086;
        Wed, 22 Apr 2026 13:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec153sm4690454e87.79.2026.04.22.13.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:03:03 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:03:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Message-ID: <6gsfte5cqf4455la62ruf5gtqkwk3i5wv2xkgvs36oj5hyqpzn@dfcsgoy6vo4z>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX2CYij35g/xEZ
 /oTUvbdo9z8t/YAoLIj/7iNCmv4i5a6W//7ysjUMUkDrBuOyxb5hNRPoa7s/vNj6XlWxtbcPutw
 qSA6Ji4Mdbfn6mFX3XDGhhCd4diqEkgWTzdW2YrbbGgsbDivUSjTpmrDPRAXSVtYVWXP9r1haqy
 yDdi7dLEvA/A0ztsA9rXHNwKLqLNu0gqiuTIZ39T/2IuepWBVLM2ymcj3zavDLYOyeO86cBh4IZ
 XPPR8ElBZanKLAaiAEZeQudOTh32n8Pysg1hiXAbjmFEEnBCX1ADU23U5CWm5O9u+xEpJ/sc85f
 rhcPWytKPvB35uIwyAbVTWLRP7XHoMd00q+vD78C2ZFEYyRkdikFS55MxrmEbJlC5NAJeFTMGEf
 9mDsYd3wWL1wfVcXUV3k26T61ut1zbVl5fMgcR/2rucShN1Htla4093ZR7oztV3p1m7ZmOebqn+
 fsJRACvq38OUVLjh3Yg==
X-Proofpoint-GUID: kqhzpdhEG12nsd6RHigGVIo3N4aABeM7
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e92979 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DiFzayPZZ94SbrHq8V0A:9 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: kqhzpdhEG12nsd6RHigGVIo3N4aABeM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220194
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104176-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C704144A720
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:05:13AM +0000, Raviteja Laggyshetty wrote:
> Add clocks which need to be enabled for configuring QoS on
> x1e80100 SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

