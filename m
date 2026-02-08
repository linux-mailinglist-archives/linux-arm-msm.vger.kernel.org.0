Return-Path: <linux-arm-msm+bounces-92175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOluHXcMiWng1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:21:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09710A6EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BF0B3001FCA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 22:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D6235DD14;
	Sun,  8 Feb 2026 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lzn2udmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayqnLRoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107A22A1D4
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770589301; cv=none; b=OFC1rtoMTE2Bd8+YdmIBLZtC+8i3YuSpX0ErwamYx/Cu8sGOJ2uU5LzAPybWun6k0SKP/XK5cfBtwwVavWNjN0wLiF2srOJVTY4ZideOlHuqxjOL2HhAVO6NoCTDgXSlQnOVHEDruQ4+Tkxzm9R4u7s47YE4TS6/M7j1//o3udE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770589301; c=relaxed/simple;
	bh=fqL4MexeECx+vkwEA1F/BuCH0L2heCPFV1NXUEcOGJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXDm03sXWwjIYcgVVaJpXfX+gLuqeDHWuWOuWg/bP+GnKWhceDrflMNmcoKBF5I3ZBSiN4QAM0e3YwyOM6sGGqpA8EPrKFxlILkMCydCuakzyPf//C05Gv2q2GMy/a7w6WD7UAAJHtCeltU87D75LunPck4XiE7AytTF6uqakrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lzn2udmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayqnLRoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618BNP9b3995275
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Feb 2026 22:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKKCfL4j+Kw7qRAdk0gTGEl7
	2FgrEL8wLEcL3SRPoTE=; b=Lzn2udmMEn7HLTwq1LbJVn/paRy3c+HWs2TIH9cJ
	r77IqmwxaWKf3O0fEeDw7nlx6Wl9Huv+TXprq5ZWSODcpcLuMam9MGTPEYC5/pVg
	GA1i95073p/FXgtITaWw8HzgdS18d6qgoYRHx47FGZf3nGc2nF0aKXauf31csJOb
	fSyv7/eot1LLz6Zj7r49BPCNafOdPQi5uebks5UJE7ZQw3PTBNeYK3m2DM1e4N73
	1ipjtE51LhVQwmboPUGg7UOSaQZTTRGLKXWwIXlTIetX+eqxH5x84pUgbsncQhlV
	i6IzeckKmQi+cME3upy3+kqPqhu8jYGsFzg5k7EmZTC7Rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd30g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 22:21:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f89b415so1013493485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770589299; x=1771194099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKKCfL4j+Kw7qRAdk0gTGEl72FgrEL8wLEcL3SRPoTE=;
        b=ayqnLRoRhD2Goj4xS7oZIqFPABpEZfAFg7Pq2GufsT5uLXsjYjFfu01eJgApQ9KsJw
         5zUBbAyI0bmKe+MQsqvqBsOyDseRxl4k6NsrKty8X69WqplItKIIlbTiUJrLuoCf6ckG
         L8xoQqTE8fTdGZoEeDE/4KFXz50m35fs1OBAb8bdEiEsqqyz3XDyAhGcUzvzSvNKScjU
         InjKEAMLihS1PqpkE4Gh5Edsfw5ch6w5chXfvc1WH3FgyVHXaXcFeXPau8goDTeYUJIS
         N7Jhu/CEsKPY/NRy+J7lsbypRWYN2sSS767EElEwAMZlls2jYmVze/bidCdEu/G+NVA5
         Rwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770589299; x=1771194099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKKCfL4j+Kw7qRAdk0gTGEl72FgrEL8wLEcL3SRPoTE=;
        b=o8HylvrL7MTPjCyp65qJqjn6KIW804eDDLDaS0QUCgK/NOLpjzuwVDTW4uU9GvA5f2
         i889mOsHX/f6KQEXyX9hTvm+N25qRuAT2PLSiYta7pQRqavKL3D19uttvTCJ/h5iiNsv
         3c4YiRyHo6qmDWzLBddaXQOQtrCGSj78ZLdKON7z47FX39GfQdxQ2hWlkO4e95KdsRUg
         8z+VyKpL+0hex+knMnBV2b0OX+J2OofP4kzx8/1Ki10cTEBxYDTOBaCq6uhBCTIER2im
         /o7qIVstg/D/UuQNQmzWxzmvhdOb70rlO58bddjlKRmxInk41ajKTodDW1dHVC0f8cMQ
         CHdA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6wXp76vbvoQFwsPWFhhJGVka9L1EirfaqwInnKd37H1wLbyyzWNEv1tOq32ntgIPlyR+g8XGpWDrSQCC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp35UdZsGT/SfVTHzJiV9KfSOeJBQyksRaVWcXVAS7C0uWF1PU
	0dGELdP8KsWU2vcRu9sCKAPEnkJUUK24t2hKv1ajurxUTVpOMrLaJ97yVKmwSImKl2rUGgUp+Dz
	b8BH4o047ZOx4ZxVcVIrdCXE08oadMHEiYJZ83fyQx90iQbqJUSu5ZHd58lTbyoizlhit
X-Gm-Gg: AZuq6aI3M4VW3bx07YeswXvmH8YJ2/ZKHr5kjQKwu2viiGRJwANKOePRhFlVA7pM/pD
	bkQ5V/t7jZUQptKnSKeviF+nwUH7iHxc1tMhR2g5hAHHbh77X7Z6Z8zx6nvVwV24oFEC++7Rj3D
	oH9yBv36bfzDoyyC1KSwx9wt/o2untcWun+WxXRu0P8AT1MlsAhPmnpym5XTjsR2+KESkA4sezc
	F2z2TsQfeHenmR7Bryp4F/Ug6b7KyAuyJteE7up3q93MLwgnX+KptoFU1X3zFr0SzRfsBlGwIpx
	4eYzNw9O9v9bJMG3ilaZViMa8QGmNm++28Q4XmXBttecyWfriOiqikBKRi/zWrXUbsMdd+AlgrK
	5LA9njTNbwQnlB6TCuBhQnlsd587gLw0Ww6dURXzUn2xlOEp65uvaz3y6bUdQIO4djCUu6DnAv+
	ateKrd8mHBDY5r1w2lzHEAx/s=
X-Received: by 2002:a05:620a:1929:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8caf1fa635emr1193995585a.59.1770589299464;
        Sun, 08 Feb 2026 14:21:39 -0800 (PST)
X-Received: by 2002:a05:620a:1929:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8caf1fa635emr1193994185a.59.1770589299025;
        Sun, 08 Feb 2026 14:21:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6feasm2201807e87.7.2026.02.08.14.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 14:21:38 -0800 (PST)
Date: Mon, 9 Feb 2026 00:21:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xilin Wu <wuxilin123@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Add PWM controller
Message-ID: <4qs5xm23x7qsyijjkkftcpen2d5at3hclbogtgvxxoorrctvk3@elfrpbhky4i4>
References: <20260207-pmk8550-pwm-v1-1-f2b26ab98d8b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-pmk8550-pwm-v1-1-f2b26ab98d8b@gmail.com>
X-Proofpoint-GUID: R559k51bxLU6GUvFjFM92m0sVIeDoPuo
X-Proofpoint-ORIG-GUID: R559k51bxLU6GUvFjFM92m0sVIeDoPuo
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69890c74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=d3Fc6ww0Fr534fpUGg8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE5MyBTYWx0ZWRfX1xNoeQy+YSjj
 InAUm8DJzZPwtNAHC5JeqEMP1O83yEJfBD1ajHB5FVRZTlIbM4xk/1aW21qDcDQwplhzaJlDHrn
 UrXi+OLfcV07s0GVRPvjH96ojGkealaaddDE0nUNvxcrZ3633iX+bEYOwIpy26kIRvBlDDa3R7Q
 0cMXl2On3TmYzqTCjPvvsvq4FfF2NOP+GYCbmlAgLvs9M7KplcFQd4hMWLj6NyKQG7Yv7IOLCem
 ogFDuJWJgQ8/ONbIg6m4BIFl7Y/hpNslTraNVVfiSnXJGJLnaVYsmOb4v58Drrby2qqdXZoiOdy
 bHmWF6J2XX6tSkwrsPEqxlnwJQBNnv7csqJ/5TTRzbuRRHVIVbVPDa54SwPDD8fGXiwrx3lESEG
 EQx+1jr24d5lG6qhpvNePR52L4LcwSpHa5xVpmfw2KAlr+xz2JjeuA+NLWnpQBTfnsfdrJLQMr1
 OQp78lPSlbZRUQNjISQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92175-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F09710A6EC
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 08:12:11PM -0600, Aaron Kling via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add the PWM function to the pmk8550 dtsi, which is usually used
> to control PWM backlight on platforms using this PMIC.
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> This patch was originally submitted as part of a series to support the
> AYN Odin 2 [0]. That series stalled, so submitting separately.
> 
> [0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

