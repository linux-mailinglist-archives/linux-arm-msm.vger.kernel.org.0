Return-Path: <linux-arm-msm+bounces-105288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM/tJEb08mnNvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19D49DFE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70CE93027687
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C0B374E67;
	Thu, 30 Apr 2026 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+sdZ+sf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkwKhPsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7D19D092
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529752; cv=none; b=Qzz4cUbIVhSAShZEJFZUyeU9NxjPEDsuHMPLRb/SskwzDBP8BTFC0Lh34FNrT8QMtySuJJgjLD+6tcQZZge2/KF9V5qde0jXc499r0x4rZ036nCbJtH6agFMepAkpFITzin3HUPVWQ3W5+M3fpFBNl4YNCO1/XDvk0cR63b4Vu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529752; c=relaxed/simple;
	bh=kmbX0XTPH+khESPujp6eG9FWEPnrJtDuQREBrSqGWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViPn5OUfg3MUifKhk0AuMTwx0zcUID42+1NRQ1LDrsou3vNAy8is9sqA5D0B2FPnG+2mGLKEMq6eNDKaVwut+uy5Ll5xi9XYL0uCTcBheG2BMbpssXWDpjG9MZYUwJ5XsH4nnJ39ACkoMbVwA6ZSbSBoh1DCrrV3IlNoHn7mmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+sdZ+sf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkwKhPsx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TMF9DY3884903
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XI1Ys6X0HzEWeMMx6Wwm+y2i
	RQ92XxBIvCwJWthvM+s=; b=c+sdZ+sftVuHDMkQ1mj/sYX0jcgvMDxXKsVHoKSi
	d0C8js75C+bVRjeS2UjD3t0YuFW1lS/Kbu0yhrSfZ1fXQl+1q/6IgxEkKd52CjmT
	dth8t2AsBScFbCxKSQrVwokRVPSZ1Vw+/UZ9HRQ/Lr1ow7SDpvLzVldDQS1qK8JE
	Gj48nwnQtJPwYC1Wikly3cEgBzt7Pwi8mMJ/U2AIoS88lSEPkpZuaWhWoN2Wkn75
	NcRReXSIyGYqaQGdPEalC3s7XRdcO8mJ5DdDUb1Za1SZNV7ir0vaS2F9XyXndHDN
	2EFYWFekccNpDdfhi1jfKPfjuCHEQNzRYbx684s/alQbWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmah8x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:15:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358f058973fso635627a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777529749; x=1778134549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XI1Ys6X0HzEWeMMx6Wwm+y2iRQ92XxBIvCwJWthvM+s=;
        b=AkwKhPsxk8stPUW5G78VHPcyTdiq8v4kUe4oHyskV/VgduIsVBUJ6OC4WdsbZFTLZv
         jkDgIlPD9/H0VhD94KWn2HYQW0G8i7YmefClu2VHstoKZ+Mm9CbeKuQACHGx1Vvqpa2H
         pUxbzfas9M9BQ3Ca6pWWTgncPwMxqyt2vKU6xEbFlKih6e+UYgztau+3xPKK8YX40/Vg
         lFF6ZphtCRXMkFQW43A1aANchZ1f0TP8lG+l3HTzz4ndWUDWGpkmHZChAfa+ZOMCVE+U
         yS3Pawk1M58oZRuWjpH67l4v7r18/uIVnnBWgONxsLN0TUgQu7NqI1Fu3LoNRCHK1i6i
         ETWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777529749; x=1778134549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XI1Ys6X0HzEWeMMx6Wwm+y2iRQ92XxBIvCwJWthvM+s=;
        b=G6aWJDL/y2NStdzQMKcqb626EgBloZ/hse6us+Mpr1HKI+G61EfasC6qHyujm/HFxH
         iqZiGWD4D4E0kmA8YgdIyLinikqt/qSE0ct09nQGvuEzgGR8ZnRw74/XgvEpOMYlGAW+
         VxdzVMD/fHPxLF+M7kK1APk3x2KYyxnlmg8jwBnT/jxhaLMNza7hHzeAc/2uqBUHuDcr
         nm518C6dzZVBQVaFRCsSPWNBIi5LAN0WdaxKSAwlBZPqsU2MEqqJa/o/QeCWp9OApY7T
         2eDaaccTN0lhGpvAm6m9w+NqRG+1zXFsJNRh7HLpqbfELADSzXv4fLsbB+W86bIGhFe5
         fb/w==
X-Forwarded-Encrypted: i=1; AFNElJ/nzVJYTHtiTBoSI04sX554HP11zXfKYGAb/myTK8ehcWAs6t+R9mgIZgepeiGS9rRze9R7PVT/9jxeacAu@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMXRkoSBmmvzu3V0dO0K2FLsCVlQT6Zo7vuTLx3j4Q+FVlKuj
	74CgvEVoVg0YK7aSZUrXyPDYtBSOBTWT1Wwc0+E/dJM7RbFxHLdhuBS+p14RO4vjan6B8Xwn6cP
	98UKzLQ4X1GCJxSgagXe/SZTDcx6K6HalPoF2aFUOnor5GrVxehEam1ovUJikkP39sFvI
X-Gm-Gg: AeBDieveB3sFnfVjvaDu4dVPkWLoexfSw0d+tVHuDIZM70uqeX84O83JjggHUNBlVcd
	7/px/Mxmzc8LAGradspPZVDZN585r/EEjnW8BjfKDKuNOytvqWL7GTUX5DBunGZshpC7EfWNSA7
	iUyqSmqajeZTDSlfmgg1NAbXu8rSsj2KzY4m/y2a9xNi2HB+m3zwfRlYOkNwSiPIEzwZ8zCcsHJ
	Kbw3sAKZt+SwoKqxPgDHHPaURR7uglExL6/lplb4KKyrvLW0hMGXC8cyFjfh6TjjXcq/Rir36PQ
	KJw8DjnjXWbKhc4GvmVdZgLPSKwoR7uXTH+kjBkJdvIQPYe+F5Qbd9OSwMcPAdK3G8TpYfDiH9t
	c39VhdU1QDP4jAtMRfqCG9R4lWI6RJ/0WFIwem7cz+kHxLDWWzNCWN8a0eUayH1z75Q==
X-Received: by 2002:a17:90b:2810:b0:362:bd99:8813 with SMTP id 98e67ed59e1d1-364c2d85ccbmr1463699a91.0.1777529749166;
        Wed, 29 Apr 2026 23:15:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2810:b0:362:bd99:8813 with SMTP id 98e67ed59e1d1-364c2d85ccbmr1463671a91.0.1777529748708;
        Wed, 29 Apr 2026 23:15:48 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772ca0sm43712725ad.11.2026.04.29.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 23:15:48 -0700 (PDT)
Date: Thu, 30 Apr 2026 11:45:42 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <db85ddc1-b302-45f4-be26-f835c63ef069@quicinc.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
 <acqEc_urKggA5s62@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqEc_urKggA5s62@baldur>
X-Proofpoint-ORIG-GUID: _dz0yv9Bnc2OPwR9XLKNd9rX9kD-mzHn
X-Proofpoint-GUID: _dz0yv9Bnc2OPwR9XLKNd9rX9kD-mzHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA2MCBTYWx0ZWRfX1knzP413WZWw
 a3aUI4ZL9FR9NIRaGW1Kd06G7a6igy4nI6l36bhk33SZegU2RPtU5rqLhZIbcTACUeUU0agK4M3
 T2I3+rof67OmqTNuAt4GClDOmRxxMX5dBLsOHUNM3CuROpxTWJl2jyaUgNikKJ4T6EwJYqhvvI4
 FrA/s0pdpcQk6onlFuygUS/oMJAvv/seFsCOOy84a8LnO1t2yCjsWhhAAg3xor0HWnEQKR+GL9h
 /IfM6SjBLB8XamqSJ2s6zU5AZyxPmCfMkcl2A805Y8BDIwYcq4uzojQfpsPC23ZMkUA4bGi5/GS
 eOBmKYJPUFOa+c+LavSSyNmfr2zgmgwrrB3yWClYhErLE11EafQaYPu8hjTSTlkazl5ZNtx38xc
 4Jdqg2ZYhTL86ZOgt8oAd4hHwJs0DP0OwsmVuz94pTNEGesd6r5KSrejzPoUUpurdbHGEbTzXlp
 ZUqZcDI32kEoiVBc6fw==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f2f395 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_jlGtV7tAAAA:8 a=Xunf5EVzr_mzzeh-NLMA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300060
X-Rspamd-Queue-Id: EB19D49DFE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:mid,roeck-us.net:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Mar 30, 2026 at 09:11:48AM -0500, Bjorn Andersson wrote:
> On Wed, Mar 11, 2026 at 11:16:31AM +0530, Pavankumar Kondeti wrote:
> > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > 
> > On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> > through MMIO is not available on all platforms. Depending on the
> > hypervisor configuration, the watchdog is either fully emulated or
> > exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> > Specific Hypervisor Service Calls space.
> > 
> > Add driver to support the SMC-based watchdog provided by the Gunyah
> > Hypervisor. Device registration is done in the QCOM SCM driver after
> > checks to restrict the watchdog initialization to Qualcomm devices
> > running under Gunyah.
> > 
> > Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> > hypervisor interface provided by the Gunyah hypervisor. The design
> > involving QCOM SCM driver for registering the platform device has been
> > devised to avoid adding non-hardware nodes to devicetree.
> > 
> > Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
> 
> Guenter, there's no build-time dependency between the two patches. I'm
> applying patch 1 through the qcom tree, please apply this patch through
> the watchdog tree.
> 
Thanks Bjorn. I noticed that 1/2 is available in v7.1-rc1 , however 2/2
is missing. Guenter, can you please pick it up for next release?

Thanks,
Pavan

