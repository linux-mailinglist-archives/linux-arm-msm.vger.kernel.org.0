Return-Path: <linux-arm-msm+bounces-112147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJ4bDQf6J2pC6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:33:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4265F877
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lsXQ1Ohd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UxK9Aec3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E6543058E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FF322B87;
	Tue,  9 Jun 2026 11:30:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A329B77E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 11:30:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004632; cv=none; b=GAjKQfbJTa2FY3Js+/lMtvx5vaN00p7nKUnhIzsy1UTmUucEhzsYkKO0HI8YVkdNtjsOBIS4D9e3cC+qdzMfcSbldrYph0VzDufTxu8+pmyfsuTE1YE1k5Drq3/OMOjL60MjphhkAod65E2QtBHSlw6p/wf8BowAP1OwBkwg1Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004632; c=relaxed/simple;
	bh=S4Q8JfDSOy86mk8qHKSFJyvJJBfhSZfvatmbSsO+s7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3aT9L2/c2bxzyuj2CTgr7n776lN6R3kXMyoLeJtpKl9Cr6In1zQ43F7XnVtdas7M5xMMjHMi3J8P+C5CH/pdmAKALzxE7P4WbnA/WwoCfomNx36tOgRDEOA9PPDde5qLV/O4MHX6/Hg81HsAynM2GPChX3js0wM1ECSrhRf7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsXQ1Ohd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxK9Aec3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xY1J2320559
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SmZd8HlL6I9HoSV7gRqWa8WS
	/XjnSYeWrkGTA8Ew1rs=; b=lsXQ1OhdEYokO3VpnABhDbcR5p52UmBUPSPAlsyb
	sDfod+di6oybfDPayeeQovG0aIAN/Bx0jV+K329/AoVUjtD6PntYlmTi8xemYso9
	bT7pHGBtiTU10A+pL7Q8Ktqxhp55P+ZKRvQzvGvRWCXxFBOgqjHAkxapOvM1dA25
	KLRWnW/Ad52t7xl92iI1S80uSpRAd5Qj7nHMG8Cbb+bhWc+P3Z0qB25b/+NZVS+y
	IzXaujVxgs08VrSgySwDWjBAmiSA1rTB/CCaFOWnjz9Cbmg4wx4lHsPEw5/F4RCX
	m8y5dtuVfwMC31bPBb2KCy6L79XExwkLU6ovkRzUqVYqjg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearxnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 11:30:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec77e0184so4378959e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781004629; x=1781609429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmZd8HlL6I9HoSV7gRqWa8WS/XjnSYeWrkGTA8Ew1rs=;
        b=UxK9Aec3bAyaW8N5d0krG4lpAX7pne0eQdJ+fnRaLsnoVbGOcU6sxQ3w/3mg4wsGFC
         aRhnLfUQk9oNgOnWT+WD+JWFR+ZADYMu6FYVq2/nGxrBuCSr5eGWmXvS1IJiG0JAp2Cr
         GVLcNQFS4ok9bULI2C/4au7reSsjd2VeCXjHDophBhUvOYJnTRhbhKzTpGu1gzT/x1+p
         bjgm5EB20+7YGETJLGcrAy+tZwkkVUDKphYeErj3GFWXsZvPjgVAtUNDGsZXEvrpGD/6
         SxlHu4owe2a8iIOA6hCeqNvvgURxQ0Ea2/pmgotqc5/ZqwusBTgTQj2FbIN/AAp2/+88
         3iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004629; x=1781609429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmZd8HlL6I9HoSV7gRqWa8WS/XjnSYeWrkGTA8Ew1rs=;
        b=INIYVV1wyB4XB/bZv102ZT5VdAsN49VAjGP259idJuoGuvl1VcR6MfBd0zu0xQ03g/
         uV4YFP6D2ISygNBwccueUNYhIXdr5lPd0LSQXgK19XhuH27wXmIlAd3/nvF1Pf4k+5jR
         Y2BAtLM2uk4Zg18k9BqqTKRkrQmzBIYnXwWdzCQz4sX5soE+EwtLJN76nHrWcJiEiav3
         CnwmuODZOgE1EycvDuMymc5QEh4cA0TDin0rv8QNZ73uh2E87zp4sNbQxXKdjZrNy3ea
         edWmwcvAnL2wzn6tB1wwYvbPzQNUPhYaJJLi/J35Hh7IwqtEzrq5CSNkras4IUcXSE+v
         8GjA==
X-Forwarded-Encrypted: i=1; AFNElJ/SZtCmy8m0FgdlKoG8DH78ROtIDTpApvqNtZNIz+Ng+UdrpNEOOFPaV9y4bOf4l4i3QrbuLrL4EE7DYrf3@vger.kernel.org
X-Gm-Message-State: AOJu0YyJif/tdY0H9NJ1V/y7luI0qVTfNri9XpPmSa3Rt0MRbQNpbgpj
	YYKSxB8UNSpNNA6jBODQNLpeq31aMfOMy+h0ufV+0XwGShaUBwAKKlLiPCUd788LSUPtWOOGSX2
	JeBblr2CHWc1Sp5CrUPBijWGwwP2gQZZsW4yJ5dVPghMIajDU3Z/UUhrckY2sZzVMEMos
X-Gm-Gg: Acq92OFkeboOysGczuc/+JxhiyU3XP41MjezIi3cqs5t05dGj9GA8xtuNX8H7YlNPbj
	bxOBYTFMIN6f0iTr2Q1lTr6KU6VoF7XeMaRECcTnYBHQLiLW/E6ag40hdudBrziFum4cRiV/G20
	azOxKHXmDOYpM/uSosB9SzYpZwarCIDsrKiZ6fa7553/tnKfNH+csWoNMBznMjYoQ6H2nsu5Oum
	ohd3CrUqFnqA7cg7JdAboqZ1aofySHS68TokCSB99kEOuHnKs2Y5++FgmqdGjFAxflbyqESUl2P
	0VkZa8UTo/UgbxAjH8Nt96xpsoxeNexiaXYM+f81WO1AAXSxuOl29DAdKUmSoosndyHn6hNDPNC
	SpvTbEvJ2O11hceUHRXWxd3nGJUDeOAXUEGPzxqJi0qMDgUADJ8fw76RkxDk02LbCWzrFwFSmFW
	q5bvqWk1ez6HvzyCDuGZU1TVWLNCTvOmr4Fazs9+yrrVu8Aw==
X-Received: by 2002:a05:6102:f0b:b0:612:21f8:5afd with SMTP id ada2fe7eead31-6fef306c31bmr8389511137.12.1781004628663;
        Tue, 09 Jun 2026 04:30:28 -0700 (PDT)
X-Received: by 2002:a05:6102:f0b:b0:612:21f8:5afd with SMTP id ada2fe7eead31-6fef306c31bmr8389498137.12.1781004628078;
        Tue, 09 Jun 2026 04:30:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be00dsm51836001fa.24.2026.06.09.04.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:30:26 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:30:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Message-ID: <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DvWjvX6ANVq4R14ZQEoyQ4J1E5wCaeio
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27f955 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=9aqgws2OXNifCg0UiHQA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwOCBTYWx0ZWRfXz+/CgAG8LH+R
 vAdRSQGNyNAjYU8jfxFgtX1ERVJACpS3hK4OBAndeMyl36bY+YPIy4nLc+J9JKJHwmuIg7SkPZG
 C6OUhFrm7wA4mWWW44c8uwJpIxRpeQeU75S9wETdQDMBWHRd17t5QydSvNn+UAEvihjFCeX352q
 fmCbdPzG6SjQjDtIU4J5sp05EsDROxiTBpOJdnrgjZuWSR4whyrP3gb7DrUg5dRQ9weLedSQuY2
 BqlXKh/vWWelseSBilT5a4OmjulOYiTBsB31mwEodkZgWS1Ip8/IDHa6/5XtqZa6WD1a/s0YnQt
 QRuR54CC2b8al9XcU7/0CK+n56cNQUNzanePK+uXbnWa4WCthqKiEz/bn/VlUXtJeuyme1m6FgB
 mAkVR1NZ0nfu748ee+ZO7mWjfu8b8xcqDBSUUm9Qp3aHVgsKfid4b23fJ8LLuJjQ63Pwj4MbkO4
 rohaG9UqJj5rBtgo0+g==
X-Proofpoint-GUID: DvWjvX6ANVq4R14ZQEoyQ4J1E5wCaeio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112147-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ts2v53im4bos:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72B4265F877

On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
> cooling devices backed by remote subsystems.
> 
> On several Qualcomm platforms, remote processors (for example modem and
> CDSP) expose thermal mitigation controls through the TMD QMI service.
> Client drivers need a way to discover that service, map DT thermal
> mitigation endpoints to cooling devices, and forward cooling state
> updates to the remote subsystem.
> 
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Wrong SoB chain.

> ---
>  MAINTAINERS                      |   6 +
>  drivers/soc/qcom/Kconfig         |  10 +
>  drivers/soc/qcom/Makefile        |   1 +
>  drivers/soc/qcom/qmi_tmd.c       | 604 +++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/qmi.h     |   1 +
>  include/linux/soc/qcom/qmi_tmd.h |  23 ++
>  6 files changed, 645 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57656ec0e9d5..3d60702a655a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22286,6 +22286,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>  F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
>  F:	drivers/net/ethernet/qualcomm/ppe/
>  
> +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	linux-pm@vger.kernel.org
> +F:	drivers/soc/qcom/qmi_tmd.c
> +
>  QUALCOMM QSEECOM DRIVER
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	linux-arm-msm@vger.kernel.org
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf830..a292ce57fd4a 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
>  
> +config QCOM_QMI_TMD
> +	bool "Qualcomm QMI TMD library" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS
> +	help
> +	  This enables the QMI-based Thermal Mitigation Device (TMD) library
> +	  for Qualcomm remote subsystems. The library manages TMD messaging and
> +	  handles QMI communication with remote processors (modem, CDSP) to
> +	  exchange mitigation state and apply thermal mitigation requests.
> +
>  config QCOM_RAMP_CTRL
>  	tristate "Qualcomm Ramp Controller driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a57367..4544e61c74e7 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>  obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>  obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>  CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
> +obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>  obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 000000000000..9d88ae48c864
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
> @@ -0,0 +1,604 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * QMI Thermal Mitigation Device (TMD) library.
> + * This library provides cooling device support for remote subsystems
> + * (modem and CDSP) running the TMD service via QMI.

Why are you limiting it to these DSPs only? I quickly checked, my X13s
(sc8280xp) also has one on the ADSP.

> + */
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/net.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/qmi.h>
> +#include <linux/soc/qcom/qmi_tmd.h>
> +#include <linux/thermal.h>
> +
> +#define QMI_TMD_INSTANCE_MODEM	0x0
> +#define QMI_TMD_INSTANCE_CDSP	0x43
> +#define QMI_TMD_INSTANCE_CDSP1	0x44

Other instances? Are those numbers fixed?

Should we pass the instance ID from the PAS driver instead?

> +
> +#define QMI_TMD_SERVICE_VERS_V01 0x01
> +
> +#define QMI_TMD_SET_LEVEL_REQ 0x0021
> +#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
> +
> +#define QMI_TMD_DEV_ID_LEN_MAX 32
> +#define QMI_TMD_DEV_LIST_MAX 32
> +#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
> +#define TMD_GET_LEVEL_REQ_MAX_LEN 36
> +#define TMD_SET_LEVEL_REQ_MAX_LEN 40
> +
> +#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
> +#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
> +
> +struct tmd_dev_id {
> +	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
> +};
> +
> +static const struct qmi_elem_info tmd_dev_id_ei[] = {
> +	{
> +		.data_type = QMI_STRING,
> +		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
> +		.elem_size = sizeof(char),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_id,
> +				   mitigation_dev_id),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_dev_list {
> +	struct tmd_dev_id mitigation_dev_id;
> +	u8 max_mitigation_level;
> +};
> +
> +static const struct qmi_elem_info tmd_dev_list_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_dev_id),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_list,
> +				   mitigation_dev_id),
> +		.ei_array = tmd_dev_id_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_list,
> +				   max_mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_dev_list_req {
> +	char placeholder;
> +};
> +
> +static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_dev_list_resp {
> +	struct qmi_response_type_v01 resp;
> +	u8 mitigation_device_list_valid;
> +	u32 mitigation_device_list_len;
> +	struct tmd_dev_list
> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
> +};
> +
> +static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_OPT_FLAG,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list_valid),
> +	},
> +	{
> +		.data_type = QMI_DATA_LEN,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list_len),
> +	},
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = QMI_TMD_DEV_LIST_MAX,
> +		.elem_size = sizeof(struct tmd_dev_list),
> +		.array_type = VAR_LEN_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list),
> +		.ei_array = tmd_dev_list_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_level_req {
> +	struct tmd_dev_id mitigation_dev_id;
> +	u8 mitigation_level;
> +};
> +
> +static const struct qmi_elem_info tmd_set_level_req_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_dev_id),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x01,
> +		.offset = offsetof(struct tmd_set_level_req,
> +				   mitigation_dev_id),
> +		.ei_array = tmd_dev_id_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_level_req,
> +				   mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_level_resp {
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_level_resp, resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +/**
> + * struct qmi_tmd - A TMD cooling device
> + * @name:	The name of this tmd shared by the remote subsystem
> + * @cdev:	Thermal cooling device handle
> + * @cur_state:	The current mitigation state
> + * @max_state:	The maximum state
> + * @qmi_tmd_cli:	Parent QMI TMD client
> + */
> +struct qmi_tmd {
> +	const char *name;
> +	struct thermal_cooling_device *cdev;
> +	unsigned int cur_state;
> +	unsigned int max_state;
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +};
> +
> +/**
> + * struct qmi_tmd_client - QMI TMD client state
> + * @dev:		Device associated with this instance
> + * @handle:		QMI connection handle
> + * @mutex:		Lock to synchronise QMI communication

What is it protecting?

> + * @connection_active:	Whether or not we're connected to the QMI TMD service
> + * @svc_arrive_work:	Work item for initialising when the TMD service starts
> + * @num_tmds:		Number of tmds described in the device tree
> + * @tmds:		An array of tmd structures
> + */
> +struct qmi_tmd_client {
> +	struct device *dev;
> +	struct qmi_handle handle;
> +	/* protects QMI transactions and connection_active */
> +	struct mutex mutex;
> +	bool connection_active;
> +	struct work_struct svc_arrive_work;
> +	int num_tmds;
> +	struct qmi_tmd tmds[] __counted_by(num_tmds);
> +};
> +
> +/* Notify the remote subsystem of the requested cooling state */
> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
> +{
> +	struct tmd_set_level_resp resp = { 0 };
> +	struct tmd_set_level_req req = { 0 };
> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
> +	struct qmi_txn txn;
> +	int ret = 0;
> +
> +	guard(mutex)(&qmi_tmd_cli->mutex);
> +
> +	if (!qmi_tmd_cli->connection_active)
> +		return 0;
> +
> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
> +		QMI_TMD_DEV_ID_LEN_MAX + 1);
> +	req.mitigation_level = state;
> +
> +	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +			   tmd_set_level_resp_ei, &resp);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		return ret;
> +	}
> +
> +	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
> +			       QMI_TMD_SET_LEVEL_REQ,
> +			       TMD_SET_LEVEL_REQ_MAX_LEN,
> +			       tmd_set_level_req_ei, &req);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		return ret;
> +	}
> +
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		dev_err(qmi_tmd_cli->dev,
> +			"qmi set state %d failed for %s result %#x error %#x\n",
> +			state, tmd->name,
> +			resp.resp.result, resp.resp.error);
> +		return -EREMOTEIO;
> +	}
> +
> +	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
> +		tmd->max_state, tmd->name);
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +
> +	*state = tmd->max_state;
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +
> +	*state = tmd->cur_state;

Mutex protection?

> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +	int ret;
> +
> +	if (state > tmd->max_state)
> +		return -EINVAL;
> +
> +	if (tmd->cur_state == state)
> +		return 0;

Hmm, again, mutex protection for the cur_state? Or is it provided by the
thermal core?

> +
> +	ret = qmi_tmd_send_state_request(tmd, state);
> +	if (!ret)
> +		tmd->cur_state = state;
> +
> +	return ret;
> +}
> +
> +static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
> +	.get_max_state = qmi_tmd_get_max_state,
> +	.get_cur_state = qmi_tmd_get_cur_state,
> +	.set_cur_state = qmi_tmd_set_cur_state,
> +};
> +
> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> +			    const char *label, u8 max_state)
> +{
> +	struct device *dev = qmi_tmd_cli->dev;
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd = &qmi_tmd_cli->tmds[index];
> +
> +		if (!strncasecmp(tmd->name, label,
> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> +			goto found;
> +	}
> +
> +	dev_dbg(qmi_tmd_cli->dev,
> +		"TMD '%s' available in firmware but not specified in DT\n",
> +		label);

If we can read them from the firmware, why do you need to specify them
in DT?

> +	return 0;
> +
> +found:
> +	tmd->max_state = max_state;
> +
> +	/*
> +	 * If the cooling device already exists then the QMI service went away and
> +	 * came back. So just make sure the current cooling device state is
> +	 * reflected on the remote side and then return.
> +	 */
> +	if (tmd->cdev)
> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> +
> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);
> +	if (IS_ERR(tmd->cdev))
> +		return PTR_ERR(tmd->cdev);
> +
> +	return 0;
> +}
> +
> +static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd = &qmi_tmd_cli->tmds[index];
> +
> +		if (!tmd->cdev)
> +			continue;
> +
> +		thermal_cooling_device_unregister(tmd->cdev);
> +		tmd->cdev = NULL;
> +	}
> +}
> +
> +static void qmi_tmd_svc_arrive(struct work_struct *work)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli =
> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
> +
> +	struct tmd_get_dev_list_req req = { 0 };
> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
> +	int ret, i;
> +	struct qmi_txn txn;
> +
> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
> +	if (!resp) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +				   tmd_get_dev_list_resp_ei, resp);
> +		if (ret < 0)
> +			goto out;
> +
> +		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
> +				       QMI_TMD_GET_DEV_LIST_REQ,
> +				TMD_GET_DEV_LIST_REQ_MAX_LEN,
> +				tmd_get_dev_list_req_ei, &req);
> +		if (ret < 0) {
> +			qmi_txn_cancel(&txn);
> +			goto out;
> +		}
> +
> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +		if (ret < 0)
> +			goto out;
> +
> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
> +			ret = -EPROTO;
> +			goto out;
> +		}
> +
> +		qmi_tmd_cli->connection_active = true;
> +	}
> +
> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
> +		struct tmd_dev_list *device =
> +			&resp->mitigation_device_list[i];
> +
> +		ret = qmi_tmd_register(qmi_tmd_cli,
> +				       device->mitigation_dev_id.mitigation_dev_id,
> +				       device->max_mitigation_level);
> +		if (ret)
> +			break;
> +	}
> +
> +out:
> +	if (ret)
> +		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
> +}
> +
> +static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli =
> +		container_of(qmi, struct qmi_tmd_client, handle);
> +
> +	kernel_sock_shutdown(qmi->sock, SHUT_RDWR);

So, connection is protected by the mutex, but socket shutdown isn't.
Why?

> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
> +		qmi_tmd_cli->connection_active = false;
> +}
> +
> +static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +	int ret;
> +
> +	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
> +				     sizeof(sq), 0);
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
> +			service->node, service->port, ret);
> +		return ret;
> +	}
> +
> +	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
> +
> +	return 0;
> +}
> +
> +static const struct qmi_ops qmi_tmd_ops = {
> +	.new_server = qmi_tmd_new_server,
> +	.del_server = qmi_tmd_del_server,
> +};
> +
> +static int qmi_tmd_get_instance_id(const char *remoteproc_name)
> +{
> +	if (!strcmp(remoteproc_name, "modem"))
> +		return QMI_TMD_INSTANCE_MODEM;
> +
> +	if (!strcmp(remoteproc_name, "cdsp"))
> +		return QMI_TMD_INSTANCE_CDSP;
> +
> +	if (!strcmp(remoteproc_name, "cdsp1"))
> +		return QMI_TMD_INSTANCE_CDSP1;
> +
> +	return -ENODEV;

Okay, this definitely should be coming from the PAS driver, being a part
of the platform data.

> +}
> +
> +/**
> + * qmi_tmd_init() - Initialize QMI TMD instance
> + * @dev: Device pointer
> + * @remoteproc_name: Remoteproc name (for example modem, cdsp)
> + * @tmd_names: Array of TMD names
> + * @num_tmds: Number of TMD names
> + *
> + * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
> + */
> +struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
> +				    const char *remoteproc_name,
> +				    const char * const *tmd_names,
> +				    int num_tmds)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +	int ret, i, instance_id;
> +
> +	if (!dev || !remoteproc_name || !tmd_names || num_tmds <= 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	instance_id = qmi_tmd_get_instance_id(remoteproc_name);
> +	if (instance_id < 0) {
> +		dev_err(dev, "Unsupported remoteproc name '%s' for TMD lookup\n",
> +			remoteproc_name);
> +		return ERR_PTR(instance_id);
> +	}
> +
> +	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);
> +	if (!qmi_tmd_cli)
> +		return ERR_PTR(-ENOMEM);
> +
> +	qmi_tmd_cli->dev = dev;
> +	qmi_tmd_cli->num_tmds = num_tmds;
> +	mutex_init(&qmi_tmd_cli->mutex);
> +	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
> +
> +	/* Initialize TMD structures */

Is it a useful comment?

> +	for (i = 0; i < num_tmds; i++) {
> +		qmi_tmd_cli->tmds[i].name = tmd_names[i];
> +		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
> +	}
> +
> +	ret = qmi_handle_init(&qmi_tmd_cli->handle,
> +			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
> +			      &qmi_tmd_ops, NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "QMI handle init failed: %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
> +			     QMI_TMD_SERVICE_VERS_V01, instance_id);
> +	if (ret < 0) {
> +		dev_err(dev, "QMI add lookup failed: %d\n", ret);
> +		goto err_release_handle;
> +	}
> +
> +	return qmi_tmd_cli;
> +
> +err_release_handle:
> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(qmi_tmd_init);
> +
> +/**
> + * qmi_tmd_exit() - Deinitialize QMI TMD instance
> + * @qmi_tmd_cli: QMI TMD client to deinitialize
> + */
> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	if (!qmi_tmd_cli)
> +		return;
> +
> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +	qmi_tmd_unregister(qmi_tmd_cli);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
> +		qmi_tmd_cli->connection_active = false;
> +}
> +EXPORT_SYMBOL_GPL(qmi_tmd_exit);

-- 
With best wishes
Dmitry

