Return-Path: <linux-arm-msm+bounces-114327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5jM1LojDO2rscQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:46:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C76BDC7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:46:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AueMYbaO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cm4WFsvS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114327-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114327-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1395C302256D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81382D5A01;
	Wed, 24 Jun 2026 11:45:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF52D7398
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:45:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301554; cv=none; b=OxnNRKQqgMM2i+4xPpFDu5vGql5iUtIT0IiR3b2izI7GVrumXbJy3rBI4CwXZ4RLGVTLG+byvKtebdLEGaVNf3P6fC3nPJvYw2ZYcSHrDcVk5jdQ0jSqZW9FltaqmvhzkPVBkvJhEJoDslyUjt7N57eabc/JNutExwdE2WItqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301554; c=relaxed/simple;
	bh=Ng7sARmYi7p+GV9I8JUofY1Xk/cSGFYDUMv6MjUCXEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCJO0CzXudojyjB7QXRYdS/J27hlIxGINkLVmoeb33ygHhqz6f1hD84flcaHr2/owPIgMKHYCxZYTYr9O2SFKki0P3dy6PKuOmuE2h/QLCaxDP/6JVboZKpXdLaD3y3UD1Ukrp1wYThjaQ4pTGLZmkpP1FdggiJ4YMRJngyeL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AueMYbaO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cm4WFsvS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANXW82503312
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=; b=AueMYbaOtvtN9fQk
	neSYjVycOh1E1xMdLX7665SYaaU9OVYHFbKdehLJjzDYuvgrbuBglB98nJj8xR/3
	50LOF+kB4iITwUWYK70G4EQZ+/7AvmlBpzoCU+HXSg2vJlC/iyo9dv7ntcYA3vHU
	kHpF0a1YdJO5d1jdUJk0H7fRhz5mIhA5+E7yYe40X2z8yc31iK8+H5+3sEckdT2r
	9CsKtfgj9b7PnQ4ldbCQOMGLdZsH7jI4uiG/rPqE+UrR1gaWEkubGjUffP4MG4yb
	lm0FQNxpD2B8bdayUBcdGp36K3uLEgcvQpaY4osmpfTUnQ5SvYI3MmkDAybAK66p
	seTWpg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfa1gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:45:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dc94673065so2607176d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782301550; x=1782906350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=;
        b=Cm4WFsvSt7zD1CouqHXAP8HODFGTh7eImWhlmlGvHCxco6oe54vL238J+kXleqPHIu
         sn6Dqfr48Uw/C0hyahzKnHjhy4L16cazb88p/h7szD8miFf+zxXPzPpZBdGRzTCo9B4z
         SEIGUx1E45ess05JD44dqG1KDPuCpY22uPUW+mWiRxHxur6CQ2r3Ns97TcgK6cdpCriL
         Oj/t4/FxhdR2ir1OkjqtRLrek+y+a6kZOrlu4zjR4srixsFuARFD5jV8t61ZvVqEcQFO
         aXLIJKW0udWfWn4eZnM9woGHfoZSqYf1VBYwqWh2CFAgCqLAbnzBC9EH+ndvYR25Jtfg
         eJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301550; x=1782906350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=;
        b=rWXoZpwMnv44bcI4ykGY7ubSWTGMjgsT4ja1Jf4ThpGobPrVPIBZJpZ6j03kCvaB+O
         LheeWYv3o78f1AlLAcAnd6sn/c4qwtxME35OOsRtyalfwJa8GKhhKgFYW6wb2j3x0O2/
         R5sSQ5C1r6JThTnUPNKJf0/WbGBkXBVb+dXAbyuxMPebGwN2lGoBkpMd1FyqdNKsvCcg
         Tzt3l+Kcs98UYaTe1CQMzF+/MarduGGKjCmCNCymx94nJrHV4wwuv6ryNZ0EhPC2QVOf
         U+U8FxAwJz14Nwp0jJbGeLIhq7CgL9OU2ktIjlYshiXc5EW6yEXqvCGyHSJKtuHde4Yl
         opCg==
X-Gm-Message-State: AOJu0YwoXUQBWflipe5CVtTHtk49zvVbxHWzCdxnU/pHvgUXMMUkHivs
	yWPf+BmtBzjj2CPV/dhI9ePfDDlopoNb0GcmqmmJUU5sOXvmrGz8HE8fBuVGbetAqSdr0SJpjcQ
	3B5NP/LTZdprSIkZo/HgvSZdItZjdmwBieDBONW7MS4vGQbeoxOdi/A5ZteP5Ai5YutrPkL9AtF
	1P
X-Gm-Gg: AfdE7cmHsv7uqj0r/GZ91PE5Ki//DqmmkTCZKmOs8OqNFjdPtBV7C5YUcGSU0na7RyK
	ecwYYyiOINxH1WOJj0ozZPvCphOqZ4aN+IrRkL9C0X3h6woJz13XmeY7q+rLrI6s+353uJBNZOd
	rM21vMGbA+77mmD4vil3J6bTh2VXmeOc+uDru1Une+i9LrkH2YY+cQKQJ8PS859C7jMZ58UiI1n
	TlVgOiW/i3uE+TU5PC6BPXrISllgx+emVeGiWi482DY3NJyS13au9B7o4XQdcpVGOP7cLXepfVf
	uzHEfGyeMA955gU6Cs4TCU3ORZtL9yiPRuJhJJeYTgft/F+UwcVNFvBWMryTBNQOrWwOh+xSmWI
	5gnwC3v9iuT1+U7wInG9UTTX6vFI1y/1/BsA=
X-Received: by 2002:a05:620a:1a1f:b0:914:ea37:6f14 with SMTP id af79cd13be357-925c6576fd1mr912772285a.1.1782301549936;
        Wed, 24 Jun 2026 04:45:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1f:b0:914:ea37:6f14 with SMTP id af79cd13be357-925c6576fd1mr912769585a.1.1782301549508;
        Wed, 24 Jun 2026 04:45:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm655824766b.53.2026.06.24.04.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:45:48 -0700 (PDT)
Message-ID: <b874a5a5-ed41-4521-a9b0-40d9bf3899cd@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bc36e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h9zVLhnXF9m6a8bq9Z4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _jMtKLL-Pr1pvXEZMYOLHig59S6BW1Sk
X-Proofpoint-ORIG-GUID: _jMtKLL-Pr1pvXEZMYOLHig59S6BW1Sk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX7YEtx6Nb2M/T
 rTjyrXHylBapd1X1w2VDwsX7Eghypl0bIwUcd0P6P25/rV8mprk9pZl6H9dHmldQ16PD52brXqF
 RPQj1H1SxFVPjMeurDQxucDHiGQGrtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfXyXKt6b7EYHWU
 1bBkpNZ5CW0ePmSI936EazInl2llr3OtDfGyoXSz/rZWN5XfnRta2K8539rTvYJDq/57/OF/aKo
 9n2AqvalsRac8Qygua/ZHFJ2VVkvyQQxTd5ioI/R0yRIVm7XVfTyqbqYmbKZAVIyPI1fPqXi6FI
 CmfJDVozaG14Kgr7njj1ax5iNUOJnG9r7yr6EJopEzKpT+PlCp64ByLbBPeeShJCPKZ4rZcM91I
 tPFulEoEOSJhGrUfa3MedbF7laReMGTeycaH9uUA6uSC8o7wLvUdGh0RJoCeduATRv6k6jAeGQk
 woZonD0IFpC/dR5rKpw04uu5LVur+OT/1qpobrbsaBztvlXOdSeeXzFdWRHaIbUQn5GbTtqF1jM
 4Ooo5iFew5/LPUm+iRedUZtxr8aoRRUEl679rgJfDdRT+Atw1l9uAxS9h7WsWtKky5VTgPJYmME
 hXsqziIazrOISpl6q8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 251C76BDC7F

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> Peripheral Authentication Service (PAS), always map the MBA region before
> use and unmap it once the usage is complete. This behavior was introduced
> to avoid issues seen in the past where speculative accesses from the
> application processor to the MBA region after it was assigned to the remote
> Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> before handing control to the remote Q6.
> 
> Currently, most Qualcomm SoCs using the PAS driver run either with a
> standalone QHEE or the Gunyah hypervisor. In these environments, the
> hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> violations cannot occur.
> 
> However, when the same SoC runs Linux at EL2, Linux itself must perform the
> unmapping to avoid such issues. It is still correct to apply this mapping/
> unmapping sequence even for SoCs that run under Gunyah, so this behavior
> should not be conditional.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

