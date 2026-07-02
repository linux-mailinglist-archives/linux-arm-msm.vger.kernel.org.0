Return-Path: <linux-arm-msm+bounces-116033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B79YH5BiRmqXSQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AE6F8234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="QrytFl/T";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VWNUzpLt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E112303E4C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 13:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B72648034D;
	Thu,  2 Jul 2026 13:01:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D1E35DA56
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 13:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997310; cv=none; b=F+iEcLchencORB2KuOcbiPCZVIWv1lZCIJc4sBVKfZ+NK4Gr9VYsSk7qYwH3lVbYo+eLBZ9H0DpghVGv68KEd5mzj8+yB0O+9zLb0G06P20DeiHNq6X7zpQtJgDHoK7IWkTUafF6PkC17opgNUPzidMacGXLsokGkuV5Zk2SQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997310; c=relaxed/simple;
	bh=ezLOtxWqKn29poR3EbKSCjTs8hzTE/3uKWAQhVGNsNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVDffol0zVC/k3DDpRzaC06dOO+bLXTR3+Pgp8k+D8ufEYY1wJ15onB6y07tuYyvyaAqRJxudcAP0K7PlSYVOokrPOkU6MDBLC3zQIGGxASjSincVYWO3gr496riVBjWGLjZLoUuHcrdkU+42Qi+0bHTSHhi1Q7goUnNl3mhlsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrytFl/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWNUzpLt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0aiA374234
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 13:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8O20KImHQpmmLRgmOVM4WWfT
	ZSqB/dhjPfVMqyEC+IY=; b=QrytFl/TK8VegvviFSMz87RhVvK+2Hh1LCJaJBhC
	EUF7H/00g5YePMfNI3JTaHZEDKdwruVEUb9bSO7tiGikMoja4laZkI1toPWMyVmQ
	KSLV+nMC3EgsOJLetSMt9SiDBhJZqZ1eNVcft1BzVLhuMyGfezSquHgqBbE9Fx1f
	4O8zSpr+6aD83cz8IQ97p9YeC+3jOsRB8lYqhju1fwRz6vEW2khG32WoasGIUp7M
	NXpI5uIIza7tY+Ro0vasJRLnfPOgHVqIL5v9DaZ/kznhyIE9kzhQssrbAmUK1hji
	eZb6VjRFnTaWgX6kZenIgjTDplMRA12dKx/kQtaUg1Up0w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8qdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 13:01:48 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-495eadd4143so3136094b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782997307; x=1783602107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8O20KImHQpmmLRgmOVM4WWfTZSqB/dhjPfVMqyEC+IY=;
        b=VWNUzpLtHe1kmYk6uEWaYzqjwNGJ6I/R5AJPXsV8eH68524+p/062MpoCHFjWoc4un
         f2h/jPuTn+D+OXI0cXrlMs8bexA1oJ5jIYe9in+DJjIks46vDDVtelBElggZIQLElvE8
         ag+vfY5jYQSQFLY40SMUG3p5dGyN91bmuSlmMtEo5o2T9nBdUuuD67f8EhwdL1Bzt105
         7klSQ6XZaPWUZdM3mr2AfkC5KHt7kNbQPtqX0lIfR0Sj9t2VYVKcB7qpjGVwIjuRcvyo
         rIrwbJm2ILqoYtzuCPZVJX8WwUKJPUJUzqIvnnhSEA5eKLrWOyqhv3YCQ4wWG3T57X3n
         Hqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997307; x=1783602107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O20KImHQpmmLRgmOVM4WWfTZSqB/dhjPfVMqyEC+IY=;
        b=XvcTLcIJrJyYVBV4ZAE8FQ71VDo9j0uVxuLplUEyM6cjVIPVF1ub183VuxEG/z3FfN
         TNmvP6WPnYCIh+J7DKP187ObYarqi7g4BjPLQTFn+YkqT+7KAM+CSe6XIspk8t04USQx
         mw5z/iCCFUNf5I7mzPnkgQxcfhOgI8W2E6awPnJ3CgfSWhZ5AufoTWs10qbsAGd35dsI
         bD3Jl54F6rftYcdm6TlaEU/OBRjrK2Eyignc7qx7mD8u/AG8VnecDM6TCE4HgZXqxpEy
         Kd75ncJF+mpoHnRC6JxoIegI5aMVcSdNE+nIjgX98qXt644Hw7QbNZza2iQ/81k1fSPM
         K+WA==
X-Forwarded-Encrypted: i=1; AFNElJ/pa7jTktpG7MSYYU/QaKZ8p3eTNTyB+Riugz0A1A5MT5O8fkKKthMXYDG69RxTH4+DBw01JTp5ZPblRQXp@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcackCB1sTAvrbTqZQyf3sOheIdxpNd5CzKpkbEMVKPgv2zuW
	FtUwRgOd97/texqtuC+3HrBe6OpWsMH4KIKxRtHvWfKooM0OzkksMFdveM8Ot694Vr4jHoKg5P9
	drR+N787NR/oqCMeN7bTK42DC/8T86/pr085Zfpbpmz4Mk6d8wzTPpvCbwXEvw02e2cek
X-Gm-Gg: AfdE7cmUsu5FzqsO8jEgXrS/X/9D2akbCdwpZoM5YKAl6ibaqCWui2gRbCvPAGe6wi/
	kOdvzVi+Md58+UJFDu5cNXGYZtPdjYDKIYRchGcwBWiCBqGoH+nyUKEGsnQxCGj7Tky/K3t4ZIB
	0DVPPsIq2DcWkA/Xq79iovw8U7y2bhdoyR4cEB2MAunXx9PagLdqC99XY6+kZ+4kpFbsCps6kL/
	txcgrSOJyxfAXeeroJ17W5Klk8O9nkXKWLF0IPIkQwaN0tzN93849zQTB/Xu0/8foZQRTSTRtWK
	R83JRjYKiln8n2Y4glFlK/CYeBse1cMpC80L14YaR+FjfaNcjBy1IOdc+jQwDj0lSN2EbrhjtOr
	jMbJO9NA9l3YgzRuioRgED+f2XUeybTBsP5AVH0Vz3ZTpJF+gKCPJZ8Ra+HW6PxyC9eWoypaCqy
	kdc48LvcSiLo5XNWGRC15epdUb
X-Received: by 2002:a05:6808:c3cb:b0:489:9e32:16f7 with SMTP id 5614622812f47-4960f12eadcmr4022654b6e.39.1782997307488;
        Thu, 02 Jul 2026 06:01:47 -0700 (PDT)
X-Received: by 2002:a05:6808:c3cb:b0:489:9e32:16f7 with SMTP id 5614622812f47-4960f12eadcmr4022557b6e.39.1782997306567;
        Thu, 02 Jul 2026 06:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b430e7725sm895821fa.19.2026.07.02.06.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:01:45 -0700 (PDT)
Date: Thu, 2 Jul 2026 16:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <f5ltrexhy7ggnchlhpjax5xojowr6f6m25v6wgdcbgyijrigo7@p73yy57jan2i>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
 <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
 <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
 <20260702124331.pogzemduzwv25pau@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702124331.pogzemduzwv25pau@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: E_RcY_n742fWeacDpLQPUj9ZrzmNpGcV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX99XKMyUP6OK9
 HJO9OIMVHJNeGhmmpgZ5NPaPI0DCah+TXr4xhKYJG+FCwlRBGR63aIMAnTM3jYLhEICAIMzi9Ni
 0bHiUt3s9PAwWnEFKEVqgjAUElxDebU=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46613c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=t5tVnjamzBmkMDoTyUMA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: E_RcY_n742fWeacDpLQPUj9ZrzmNpGcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfXz9TeJnBknScu
 fvGXEYp6uhNnrWd1z7AykKjawG8ya0wOka5e2M/dMZw/t79liZoK+pMspqvuTPbex9YkX6FT9d0
 WWAGc8j+6WS+r6K62ob+X2hxLbz+Pu+MjCAZ1/cXSmCThM+zbZ2SIIqEf2TGdSvUItzVU536gM9
 Dk8kcCmHjBRwKP1Oy+aPfriUrfmWM4q99lufsUQYDvyoiJnR0bdYJNNDlQNWIQWSNf4vAOWGqnj
 Jwfb0Xns6qX1F7s16+9HvYW0+57yd8H8MESq/5STMWIJfEso4oOe9Xo4frhgCZIAvOkvLnfrz9e
 agRuS8R9wYEfKZB4npwRcNoIZbVORbCslxTzrsYYhE7UbPfvwyl2a9rkDW4RDlGHMH+y7joDK2n
 4xBSqEamt41fbSonu3IjLZ9SZvNdJX9TrIC2KCArSoSnBPwTAOChRdfWVXIPcwbYywj66Bko27f
 Iwuy2LW2znktKnlbH/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,p73yy57jan2i:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C4AE6F8234

On Thu, Jul 02, 2026 at 06:13:31PM +0530, Rakesh Kota wrote:
> On Thu, Jul 02, 2026 at 02:07:12PM +0200, Konrad Dybcio wrote:
> > On 7/2/26 9:33 AM, Rakesh Kota wrote:
> > > On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
> > >> On 7/1/26 12:28 PM, Rakesh Kota wrote:
> > >>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> > >>> constraints in qrb2210 DTS files to use microvolt instead of
> > >>> microamp.
> > >>>
> > >>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
> > >>>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
> > >>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
> > >>>  3 files changed, 5 insertions(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> @@ -37,7 +37,7 @@ pm4125_resin: resin {
> > >>>  		};
> > >>>  
> > >>>  		pm4125_vbus: usb-vbus-regulator@1100 {
> > >>> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> > >>> +			compatible = "qcom,pm4125-vbus-reg";
> > >>>  			reg = <0x1100>;
> > >>>  			status = "disabled";
> > >>>  		};
> > >>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
> > >>>  };
> > >>>  
> > >>>  &pm4125_vbus {
> > >>> -	regulator-min-microamp = <500000>;
> > >>> -	regulator-max-microamp = <500000>;
> > >>> +	regulator-min-microvolt = <4250000>;
> > >>> +	regulator-max-microvolt = <5000000>;
> > >>
> > >> Perhaps that's a stupid question, but is there any good reason to
> > >> not just keep it at 5V if enabled?
> > >>
> > > We could hardcode 5V, but keeping the range allows clients to select a
> > > lower voltage if needed. The driver supports voltage selection per use
> > > case, so hardcoding 5V would restrict that flexibility.
> > 
> > I'm trying to understand if this would ever happen in practice
> >
> Fair point.The dependent client here is the one connecting the USB
> device to the Host. We don't have a concrete example today, but the
> voltage range is kept flexible to avoid restricting future use cases.
> That said, if 5V is the agreed practical default, we're open to
> hardcoding it for simplicity.

Moreover, I think current configuration can end up with the regulator
being set to 4.25V and thus undervolting connected devices.

-- 
With best wishes
Dmitry

