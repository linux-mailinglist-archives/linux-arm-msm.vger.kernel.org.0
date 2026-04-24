Return-Path: <linux-arm-msm+bounces-104468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O+OHk1o62m2MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:55:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BF45EBAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2FAE3008D46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1A13CFF7F;
	Fri, 24 Apr 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7H627hj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMMMyiab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931573D1CD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035325; cv=none; b=dVG86Qzu902KAMwYgM5nQ95c4CoLNyol8FW1LfVOeSDufYYzKw6oUq3+/KA9T6HpKIQF7FjjRLYsHOcxZIvw8Mcf8PFPJaWlQ49YqoQsDmrCbJvSx31/pYUPnoLC2Xuet9ivsZmo0SwDV8CUUyzpt/WoaoswmNkjqyli8wrgbuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035325; c=relaxed/simple;
	bh=SMWFUGavbE0VkV3fmehSGnnelO+VQoVhuLxrVUV1NJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edzd0P2Igvuaf/vc3FHicZ0NAW1zx/2/DAOagNdl8d+518L122aLIrBjqx37rrPRW5SeTakiDZtKVb95aQOtaSkMvrx2sGJ2nSbny0nOuRS9kUo+knCjz48tHQmK3FHFyL+z8YwPy+ZD0dI3W6eixQmO/+LZTWkvspCjGOqOoFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7H627hj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMMMyiab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OC79XC1823032
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zpLKuxXcZNSD9Vho3/l2L+f7
	A1uq769GitjtFC6qSuk=; b=h7H627hjnNzIT4c2kGVLnScxEsMoBp4avuK/E/Vq
	nHgRCQvHezOfYS2SpWo+6rP514C5dJCbGn6ryWrCF9l+VPYy+ukb5wUlUq13Q3RO
	Xr7cNqADfWiwTGzQJ9PoUupLwtNoLe1W9Y/SFZ4XBCyNiBTUBc7OfannRQUj4xWB
	tNk3aPmZ1+0zEJWl4QieEdBNTgxYK404wsALEvtUW4TmkisADwN0ej8yuVji+EyS
	00CmK8xulfKpL3QoVszjG0Ta9r2J3Qh0I+bDCScT1oCmt7kP7V78xuSLOQhjp6WB
	aYQhUGAcHINZLr5ZBylrVowY7OWf83qmj82YktxH6aoNZw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5ru3f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:55:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so9585723eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777035315; x=1777640115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpLKuxXcZNSD9Vho3/l2L+f7A1uq769GitjtFC6qSuk=;
        b=LMMMyiabSEcuqx09Bo3e3mEzAahpzlydP70Nw6bUedv92Rx6Un3lH6zdHIFyOcsc4S
         CsHsNQDFj4lFzoRQtw+xtKZ8SKdKtcCMTOA2UCt0TsfVM+I10YHUoq+8k/O2/rhatkEb
         UuMCnMk7E+b7vWIA0WjFIxSuG2PheAaJIJeInjofZOwk6Xrmt5yXeS2nvPWsoTcfjV/H
         Vydu1EEyxUeR9L7sUzp6krox42spVl8Lc9zdO5ZLgCYT0RjCsfP/T4eDTLClHRhNq54T
         ijKVG/AE5RrBmgHcu4OolpfpJ3ibRFtF/Aa4XlBCn9zUzVGcK8b8rxcvuAP8SL1722hT
         XlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035315; x=1777640115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpLKuxXcZNSD9Vho3/l2L+f7A1uq769GitjtFC6qSuk=;
        b=YSJJZpqJbjt2zL+AJZqNN75ZR7UMVLKS6/GEipLUF3BvUDm+/SXSwZYdHZWuc2yQJO
         PueQRZbcVip2jK9TXZSv+VGZXSRzgB/P79Ok0PGMZjbH/Mq2phCgsHRj84WsbQewoNKm
         TqrpDYZ3jsafIXJvkFRKzAnUlUZgClZcLrWlfR0UMpRl3glsSftvBLAp5FRYj2aRMX1f
         ql3vG0heHgQLJQ761Wa7ZAtwFO9CbF7a1mXFwyOOb7VtP9ROmirLhXbM4YvBxXjVHEPy
         Q5jIbyeBcIWLC5b1Xb1A2+KDEqTqTKSklHFZuRbC2IXVwZU3Kr+Re/MUdTcJRRQaj4yZ
         wXFg==
X-Forwarded-Encrypted: i=1; AFNElJ9Thoq682NPaQ4WnwYhEhxHV8rFW3f0KtB4P0gWYVVOaZzKkU8K/BJhiNB5YoOQfmawHXNm2FkMrZWYNaRd@vger.kernel.org
X-Gm-Message-State: AOJu0YyaF53CI1ABHYgJ4LZq8ddfQrWOfocTfSpFHQNsVjpszzxJc1dQ
	NPkAoeJySRq6SBR4UN/42lvA1fmOUO/R0ChrrFxMhRijyWopFV1m6laE6aigyTug78tf/a/6M7y
	5PEM54qlgNlh/AB9BkZk3XYxdNRDAgO0Nd4G4Bk0nMhmqQ0OMf+jOkZPqvt5pbKms8L3Y
X-Gm-Gg: AeBDievzl0mG0lHr4RvUlk3Dr1KWJQtb7D+Qs4qIAxvNnOI1HOTvPUI6FqosH2I1Nje
	bKbwEFwXS2FH7+GW2n0Qg4r4z7qR9ZsUQFDeIQRbMl4Mk8bJCkaTqqoIvKxvNz2Me2BUlqvJMRl
	AQEcvAt9ZKUWNZ12/KdDjTu68EtibVjVwMmNzbD9bA4pxo8+7ziqTwnJRcq0s+FzFOUP9akzm54
	VKWg9Pm1BeIST6Qh7dS7xroqRvifcEvY6bPCuIoTIWv3lVaz0oOpP7WndKnpemzYdJfsFpRT6Ym
	qzJUceC80d85NjhqHKnX3p6nOIHDoulPVzmzjGNxWnx8p3wE2eU+8w/SDBPqD397y5rHCK754FW
	MURMJno9/jXQOxeRCVQKQXUUYwsZ3CRtLPFb51e4M0KNBf9O5StUneXQZCt7v/98FNa6aCCEOxY
	I=
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr15313616eec.15.1777035314740;
        Fri, 24 Apr 2026 05:55:14 -0700 (PDT)
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr15313604eec.15.1777035314221;
        Fri, 24 Apr 2026 05:55:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm31824043eec.28.2026.04.24.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 05:55:13 -0700 (PDT)
Date: Fri, 24 Apr 2026 20:55:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
Message-ID: <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
 <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb6833 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Uo6MfCy8GOolxduyRh8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 5s9VogMfoW2oFpgTS5ztZflzvKVimvRP
X-Proofpoint-GUID: 5s9VogMfoW2oFpgTS5ztZflzvKVimvRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExOSBTYWx0ZWRfX5IQIOn0Y720x
 r782M3z3I7Riw5ARHhP5eJk++2wwiTk8RWt/mplpdCTgXRb9rvvfky2XFpq/pYqWVMnq+D+MT6L
 eJPV2PApLkKAodUn0CUKW5ixW/mSOIWmFf4VN8yq6hmqk1g87GnlomecpGcqw3nnUdDJqQEuHIu
 ynY51tOjbJTsXMr+mY7qJzj23oxQJJAT9iHcBIrcf79ZV+wF5lOb+k8PyKoUP1kbKDXCstbgQx1
 L2R8GjmgeboC6+XyFDKomVlcOaNJaG+uwEcAEqcR7zCmFD3xnNovgHk7RtH7SmkFnjolf/soF1Z
 8uzMl3zOQxMyE7Nflg/xEgYgmdh7kBPZNbUVWYWoQSSLnMnyzsuVOADmn+HHAk+OkIpCUuDffl0
 2odvYf4DQcGATf9EzHZoUAIEc8cdsnhpn2y1ZnUWPwDaN97mqxl/aWN4B+WiXb8lROyGxK4qwEV
 DA/wr4LQyYUgdKY+fCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240119
X-Rspamd-Queue-Id: 278BF45EBAA
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104468-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, Apr 24, 2026 at 02:12:44PM +0200, Daniel Lezcano wrote:
> On 4/20/26 11:19, Pankaj Patil wrote:
> > On 4/20/2026 12:24 PM, Shawn Guo wrote:
> > > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > 
> > > Add compatible for Temperature Sensor (TSENS) of Nord SoC with
> > > a fallback on qcom,tsens-v2.
> > > 
> > > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > 
> > Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > 
> > > ---
> 
> Krzystof,
> 
> are you ok with this change ?

Hi Daniel,

I plan to improve the commit log per Krzystof's comment on another Nord
binding patch.  Hopefully he will ack the new version.

Shawn

