Return-Path: <linux-arm-msm+bounces-111608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KjujLOngJWo6NAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:21:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FC6519E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:21:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PoBYGD2+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gHZ4fN9J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9991300BD84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7E731715F;
	Sun,  7 Jun 2026 21:21:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A62E7362
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:21:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867278; cv=none; b=kDAUin3j52ccE9rxE37/S/hFMIfJ6Z8yfLy9BEu/lsYE2JnAM5M0RZcyAcFrRWpjJ9WCdXEb0RsbhvRDznfwlduELH8Kp5DwBQ34s4dl34eCACieyDDKZpsjz7YOSuPy3vZ2SxAujrYrjQtRjLoSefCZTTOo76u6qU+I2YukV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867278; c=relaxed/simple;
	bh=fVzbXV1sJy1UmP1P9U7A4Ziv9bNeyp5SHeVOnyh3NSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMfDXoOgN8LU1s5THri6cxeAru94xH8WYtnI1MRYaCr0QWp0XgvUmrjRoQKiVjnYR5E729U+HTXkCJ9N6rW+l81A7gBagjsYUk9p3nxs5Fycx43itslfQCxxwbzqcXLAz4KfOL7KNMu8G8lauY24K+Ng7kXflx+4U138CNGk3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoBYGD2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHZ4fN9J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657IIKKG1219810
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=; b=PoBYGD2+IlZ3hjS4
	+rnDZ9vnHL5KSAKs4bqQG16TfJvxSqp9dGqUGrHXGVHbLn4nmTjXoeLUaMh7Qdyb
	m57i2FVDuGS4ZdzfW6OHUf62aqoJqVke8iWPNA4S29imjAJEgFb4qQTnNTKU5LIl
	xOU21xBOIPjR3SnR6dVJr+ULMwQOBMbQVQbtGtq1/L8mb0FWdSJzlSO79wQrOR4Q
	+EZ81WXeSPqJNW0ykmg/aFbuHmjMPQP+gYldOoKAngvet5cJkacemy5s6wZmBGsb
	m1o/CTJVLL3iwZCo/hLjW4TldesTcWjB3kPLthnrF0X5dRHbWCGnJFNWvtvwc3xs
	c5wwOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4ym8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:21:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51775f7b2afso88868661cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867275; x=1781472075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=;
        b=gHZ4fN9J8Ymc+exGy3ilOsanOl37BCTko5baNJf6kR1sE6dEK15KG/A5r9eDJWcp4N
         oVR9LBtJE54h4W1R6LXyuLwcSW/Nv6dXucZAh4cvvjXeTsxbxygc/Je0EKDWOkFr0pBG
         by7cXaOVCx8hrJ0PSSwsU7MU7EiEAFoMNKKVFdK7GxdnUXoL/UtdCNozZ/xDRj668yLw
         iGN1utajEsQi5Jty7KYUlp3cX2frWpv69H0irgsKrYd2cUfgad7RCxQAv077qZml8iOu
         Eud5VdJAc37Ezgk+jnJCNajncmqrbn+QRTd7csyU+daE9XpAzIrHLEAT3TiaO5ttxyBG
         pThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867275; x=1781472075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=;
        b=qCVMXtzKmSRN5KwQzd/9b/84cOFGXil+POElWK5K+mYSAJsi3oJlxpUi/lao6Monm+
         VoFrVRwjPNCtx9Yo5k3ugKhRqNxZfeZXW5wO9iyK1/NgycWJ/9+uSZrJ0xDIUMZNgR4N
         i3kuECxnVpSwCOvGFjiwf4nmXos98ZijGnHEJDPq6tSEpqtG20ik9z2WZncsfu2/sI5I
         xfYmxBE0sonttMk+6MBusFxd1SRj0Kn/+u4hr8/KbtDd/kmqp8X3DuEy4yY8KaTSg6+b
         nJ4dB8eYX9xs48tF2mYkerFmL2eZkri1Udhs0/Y8zUiN+BGrPqfnSjIDPGzpBgRUW5Ge
         oVxg==
X-Gm-Message-State: AOJu0YxM0lWbI/1GxYJGE0Yx0aT8tNeuyxEiThqvOWTppSlZhuz9fWU7
	bAxm+yzG6Ln9UUw1I4/NUH1+i6717fvW9SYc2QqOniv5c8b/bRIAxGBW2+aGP8Ik6jhy31jU8/n
	V0RgoG21kRFZvE5+BA49TSPH2/yyP8UmImrL/rxrykefpSPY1prv7rlCQD1/g1V1qEPEh
X-Gm-Gg: Acq92OFUvN5sLFHRS7ht6UkCf9grWH5sQLYuoS4VWtIRh202RaV/h+vYtDKII1a2N+G
	5zhvg81mppaXZFX6s2NuiEk7AnCtHGMwuUrs6/+J7O/kcqwtq6owbgi3S9HEQPVHfWI66xNF6ia
	TE3pH8usXjXicTg2Pd9vAUFZqgG1dDdTNT77X1JFWeVyTVYaxXLq1HsFRjflN+r+JmN3klgyGmd
	sHbbxfS5ggvIeyZ+unPra1ge434gDk23Cx/s72xXi67BL4HlQ0mA3poQno4hPBJpxTR3x1s+BWo
	CCm7NvsgQ/QM7NXp0GwMLn8fJXeD4qCdLY7/15HZcW9bJFE1Af7FJWILCy3tD3X0Y5IokkzZEpx
	6XOj754I4ZXKA/f5a7DWfkc1AdIADRMiZ8Ad1qaPiadOBHD9faI21nf/HVY0O8mLnWx7MkSEg3t
	idfKHrqpMrdDoGM8vj3QNJPlafX/ek9UX9T2FIs3lZ5s8etQ==
X-Received: by 2002:a05:622a:4d88:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51798708bd9mr128205291cf.16.1780867275492;
        Sun, 07 Jun 2026 14:21:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4d88:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51798708bd9mr128204941cf.16.1780867275013;
        Sun, 07 Jun 2026 14:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm41529891fa.17.2026.06.07.14.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:21:12 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:21:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Message-ID: <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25e0cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=I5036ZPCcDZR90z1f1kA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: tuZ2H2p08ZFxabgGj9ButAwLkdOiKTXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNSBTYWx0ZWRfX+029chs0H0Co
 dzf4uOIx1p1qMmBZ/2N9E103mXunL3+Kt+DSZfqpVcMVp8OWTuXFPGMv/mEGcoc5xLQOdESJ1iG
 yT/Imqsd+OTlodiDwokcHfxhgN9zEwFi7GSJwTucfRTMpfF0BmNmSRSveXfX0+RtnYkiFB15sZC
 +y/cGbUtbph3cU6GRzMXIA4SxFV6mBClxkIO4mLwKOIrpLc+p+NRBwBbh+QCvTG/gEmSxWOfkHP
 vGRh4dp252jUg5jnVKBAi/Sftl0S+baM1xq/10TK34oeWmcm0t1M07uLulmsNeU0jPXRvVuZ+7t
 tB1wjG2rT/5DQcrlgUznAin8camxQVmzfGx5Q3MBCrw/+D+xC8z6cYWsMLWQt5Lyg0HOma8GEmI
 FqYTjIZ+dEnS4djH843ShZqtJ1oKUAR01sFRMys0SHezhOj7UZf6jOOrjjlIzyely8BwEyx/kzR
 mu+VMKGb3Xol6xcF8XA==
X-Proofpoint-GUID: tuZ2H2p08ZFxabgGj9ButAwLkdOiKTXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111608-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim,fb2js7bw4dca:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F8FC6519E8

On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
> 
> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
> > 
> > On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
> > > On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
> > > > Currently, the RPMH driver only allows child devices of the RPMH
> > > > controller to issue commands, as it assumes dev->parent points to the
> > > > RSC device.
> > > > 
> > > > There is a possibility that certain devices which are not children of
> > > > the RPMH controller want to send commands for special control at the
> > > > RPMH side. For example, in PMH0101 PMICs, there are bidirectional
> > > > level shifter (LS) peripherals, and each LS works with a pair of PMIC
> > > > GPIOs. The control of the LS, which is combined with the GPIO
> > > > configuration, is handled by RPMH firmware for sharing the resource
> > > > between different subsystems. From a hardware point of view, the LS
> > > > functionality is tied to a pair of PMIC GPIOs, so its control is more
> > > > suitable to be added in the pinctrl-spmi-gpio driver by adding the
> > > > level-shifter function. However, the pinctrl-spmi-gpio device is a
> > > > child device of the SPMI controller, not the RPMH controller.
> > > This replicates the story of the PMIC regulators. There are two drivers,
> > > one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
> > > driver targeting only those paired GPIOs (and we don't even need to
> > > represent them as a pair, it might be just one pin).
> > 
> > Thanks for the suggestion.
> > 
> > I agree that adding a separate, RPMh-based GPIO driver would be more
> > straightforward from RPMh control perspective. It makes the new device
> > as a child of the RSC device then it can naturally use the APIs for RPMh
> > commands. The main challenge here is, we need to make the level-shifter
> > mutually exclusive with other GPIO functions when the GPIO pairs are
> > used in level-shifter function, which means we need to write SPMI
> > commands to disable the associated GPIO modules. I am not sure if AOP
> > already handles this; as far as I know, AOP only manages the
> > BIDIR_LVL_SHIFTER module registers. Let me double check on this
> > internally, if the GPIO modules could be controlled along
> > with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
> > 
> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
> registers, it doesn't disable the associated GPIO modules. Also, I still
> have no idea how could we make the "level-shifter" function to be mutually
> exclusive with other GPIO functions after moved it into a separate driver.
> Do you have further suggestions?

So, for my understanding, we still need to write SPMI registers to
configure the pins and only then AOP can handle the level shifter?

I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
being used by the normal SPMI driver.

-- 
With best wishes
Dmitry

