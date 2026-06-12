Return-Path: <linux-arm-msm+bounces-112851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 08/gGRqqK2p0BgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:41:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8A676FC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:41:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mv3ioiRm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZZ+aoBQQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E197531104F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CB63D8103;
	Fri, 12 Jun 2026 06:41:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529622FD1CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:41:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246469; cv=none; b=GboElmJCvRtuyuOLlfygTUU4+q8+Gk95LwAtlYI7suJyGVKCfOLo6/FljpXfCjHddd9Iv0cfGhdRetjav4lCFMMrVUxQ8Pwgsco0nKeM6/bimhtEjZ/NVwKmbXrhabS77z1ZXtqRtwrvO4/0WSUg5i7Bk5F+9K/C3o1dn0DuXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246469; c=relaxed/simple;
	bh=SCwu4AmAYC2pEDH84RC3L97RW1JBqwpQeUoQyIgVd44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD+5jkkOS359d5WYANz6E3UcaO3aNUWMn1Yi/38KBaMWlhkaYO++vZl/1XRnJ1gavYek+i207WHCzc5DuRFp0IbEX3Age4I3QeWVFBFZJEjKK4wdStCL2kJvhRjoANAW1EE1Wup8cHe2m2EMR7MVhpGOb0YdZXHjludk9c2q/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv3ioiRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZ+aoBQQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bind2450823
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OX0aUgrRa9G6MztTipGGrqcI
	ri5mfaFg+g0QKuO/wuU=; b=mv3ioiRmXXM4DC/Qfh2WvP/hPJgVoNzPaSmtO6/U
	Gta8kuhvS6UcTG+rYOqAzkv9ttIDpIuntTLYAdvSxK0aAMCvyvD3UJEfTTowX44x
	VtsVMvkFUW+bBAE1nWxqLu8WE+caR2xROU1Lnus0Z0NilDeHD7GkV4iNA4HoLwdi
	9G5mpbc2+F9ZdBCF7numg9FxJ4Gzaapizq0yKtNIpWDKRBxGA39eIz4MrvVr2cpD
	n45gdZJOuPDlUbMrTF8po7k7S7+cJiPrGokxN+ubXJxjrQuzAQatPGRgeiamwNSC
	9lIlE1s+jEImhtYz7Xw34dOce9P9s7Abc2o7zJjnpT7Q7Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcj6pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c5794db0eeso609926137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781246466; x=1781851266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=ZZ+aoBQQoeMC7vV3kQrouMIVdFCgOfFuihkfDr0OM9PbTfCuLlWAle/Ht+3sausNM6
         DuO5hX0W9wN/twdyyZQrUKFZVTCfOxfaPupOrGTMZlNHF5mxijIyy7acxDivzv8WTOKs
         4tEsZPLHR22hRm1M6pMrYPILAlXDAWe7ms2cVx0WCsMD8XXXjjfW/RNeLpP295rmSDRu
         LN/bP6Q2Oqdfvmr5SVsOZzDaGYt1IfoDB0nWk+AirrU2XQ5QOkH99unhqUT6WrBDlrJ4
         kV8cK0sIwC/+jnI1jw/phAAzxBzb65KuYEv+ZZte/kbzI4nOPItc51+0L6U7NohsidJJ
         BOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781246466; x=1781851266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=H0p8ZTY7xo8Zmmib6sJXeeUJ0n4FaLdMGI0KulwbetYX14/16ZBhESGFfyxzIY0V7o
         DLuiXWy2PY3swWrkx7iFUd80SyJEYAJ91dX+u2+ZfSFu1uqbDEBRc2I3aJc+oPPRgyWp
         UtEouMgjkBgbfmXIG/95Bj/PgTdzu+onfStX71dTTLhtKs70cIsHpaH+zu+zYSGwD+SL
         UWwQREuG3pMTtRdc881SLlnNFXYfp5FodhG0upwRtasyCUTiuZSqI6y2qGFttoS4MD2i
         0Lcu2hUy4lTQuRfn/dy6bGhuidGv+BZS9M4pxeaWxbZn7ry163eMyIxAGwnTBh/KmGmz
         yXKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bBxsPqKyVayx0kgfMr7jyr+7YcJra1e6SO1OoOtAx9zl8wM9ycqbyX4DS0ckpPoBd8/BxiNQM90I0R8f8@vger.kernel.org
X-Gm-Message-State: AOJu0YzCy8twP8GNPd1WdlyLbiUPnPn7fYfzHokkd9W+bT/urXc0JnHg
	n7L+DdZFUHTq/+H9mPhSh8KDRaXEe4GbIM02ckZZYWY2VsZdp6QZd12j0XR2hvVguK7iNrEygUc
	Z9kqWZh8v4iRnuTHqHjXFTTgL5yVZeTUCGBkX6Or2l5RIrNcwti5QzZp1nk6Hyf9T7xYC
X-Gm-Gg: Acq92OFOA2nVlhelhdCu/cL00QF3CTNzDFZScBiU2PGvYKKX0cbRLnAGKEPJigVuxz2
	LB17dWRu3Y5quGWyAz3iaTPlZYZHixANfAvHKCmnze3ASXQeU3nYpx2slUVxmJMZm5epciFPSan
	0gnQ/h8GGL6fmEO+NY8qX9Lj4hEmT3sP8vxaprIDj/ZU6qgc3jYct3dGvIVStLOzYLICMZHO4cq
	wfy8k/0464jXGuAn2iqp/aiWo824gAHjSJmkt6s6jqKg8zuMCftpYk4qM/z/vZMZGWJZjvovK27
	f/Uz/xBBD/bh03zO/sZ8uYY+23tUL1LsSJYc71Rn8NOtEbncSKUfDhyAM7Yid4r9DRfuztxYQnP
	SVNobjp75sIwSEabhBtucB0wiJHxn0dQYIEQ0OBXXWvXayfL3nvaO7tu5tB/OUHJVx0Zm9/iGRb
	2dDqww3CdzQ6A080Y4Y7o7KzXlizAJ9Ldyt0k=
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603736137.28.1781246465620;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603725137.28.1781246465226;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ef4sm271847e87.3.2026.06.11.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:41:04 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:41:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <v5okvua6bnicuydjqy5pgha66gbpo46g7o45ejhezsgbae7k3r@wwqpqiu5k5e5>
References: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfXz8O/H6M7uxyv
 QlPrVR/KxjM1V3PA4IEbUWTmZZjV4Me3T4a0NIxDcURhlzot3AflNT37PAMUvyQpEeXXVXNizdh
 1R+2VL4z/q+v7pTXtyc/xwU0XS31SQahEM3RJk7GE5NQGmD4EAQh7E8SEychKb977Do+ysTBsV+
 +uHhtWiWSl68Vtx3OugInHcX0Z7k84oIL9TWgYAPTz5x5t3vGLc61zwHD5/5V2JSW6odvqMNVZ4
 uI76koc/pameAFJbYA8tlQmV6rKl3V6PdbZO+Bb7INhuk3aqKBPKle4jKcuqMIuFcEvu1l0ncFP
 1MYh823Gw9vSh4S/sjt0/2zoQeArHOgDIdCCsHkoGPImNUjG4gg2S3N0Ceg4qw8vsedbh45jnSB
 wSlI8u4RD9OHm0/xxX9uviHk8p0AjUfiASklareKbX/KqeqLnedPVWgvT6SLWjdxUXgV235N8vH
 l6A7RSk6csT0fKosrcA==
X-Proofpoint-GUID: 0z_RSjNhyjSUzamr9g3RAh-nU7pNiV5N
X-Proofpoint-ORIG-GUID: 0z_RSjNhyjSUzamr9g3RAh-nU7pNiV5N
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2baa02 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nxjr3CeA32HRPHoucToA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfX6DL6ROH4aXvR
 3WNOj2velYeXnFYB5Im0AE+jsO47XYPr0cJVZHOB6DuLHm14RZhP4jZctyxYzZ+Gc8TuXWtABXb
 U9xvmZeGpFth71KJ5mqClasLZIZSWmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120058
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akash.kumar@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CD8A676FC4

On Thu, Jun 11, 2026 at 01:48:21PM +0530, Akash Kumar wrote:
> Increase nominal max votes to improve DDR performance and USB audio
> use case handling.
> 
> Currently, Bandwidth vote for max nominal value is set to 2500,
> requiring DDR to run at 1GHz under normal load.

How comes? Please explain the math here.

> 
> DDR is allowed to run under nominal range at 1.5GHz, which is
> consistent across all targets. However, with the current nominal

Which targets? Does it cover Agatti? SDX55? IPQ8064?

> vote, glitches are observed during multiple audio use cases over USB.
> Update the nominal vote to allow DDR to run more
> efficiently, enabling simultaneous multiple USB audio use cases
> without glitches.
> 
> With the existing vote, throughput is around 125MB/s. The updated nominal
> value increases throughput to 145MB/s.
> 
> Benefits:
> 
> Enhanced performance and stability for multiple USB audio use cases.
> Improved overall system efficiency with higher throughput. Slight
> improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.

What kind of KPI is this?

> By implementing this change, we expect to see significant improvements in

Expect or observe?

> both performance and stability, particularly for USB audio use cases,
> leading to a more efficient system overall.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..aa43a03f3c7f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,9 +46,9 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> -#define APPS_USB_AVG_BW 0
> -#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
> +#define APPS_USB_AVG_BW 40

MBps_to_icc(40)

> +#define APPS_USB_PEAK_BW MBps_to_icc(80)

You've tried to explain, why we change USB_MEMORY_PEAK_SS_BW. Why are
you chahing APPS_USB_*_BW?

>  
>  /* Qualcomm SoCs with multiport support has up to 4 ports */
>  #define DWC3_QCOM_MAX_PORTS	4
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

