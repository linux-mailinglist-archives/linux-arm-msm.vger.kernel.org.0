Return-Path: <linux-arm-msm+bounces-108817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLNRKOTXDWrW3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:48:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F400659133B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14ABD331C4FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DA63F44E9;
	Wed, 20 May 2026 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbftYt2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5yd0bMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE543F4DF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289575; cv=none; b=Q/0lGCmKeFLfHt2OiQYd1raBP0pOiKfg/fbHsyttmCnyReH0TvSBGT5WOArNm0ahb4FJgVBvOuMJgCIxFEAE4B1hchTWPTx9B3kUDScDmkR/SvmHdK+nA+eIZYirB31Do+FNS0lwQX7GEzyfVyKaAQSxeXZK5jggXZ+V4XcJkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289575; c=relaxed/simple;
	bh=4nW29ZsDPdoDfRzL0itjwADUNqk35eX/f3+DLF1LjsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVGowYW24Hc6k6lUAHi+2diW7VvUZ3BYWDtORFsdFag7lwXmXND29NQOBd0jr20lVGAvePRY9pTrItfnQKt+b7517ynGhQtGNjMxNQRezMfNe3yLNuS8TOwKLcSuGrx+/uFohYRQJ7ypXalSr18Tww1HpPyWa2kptcA1QtQ6nKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbftYt2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5yd0bMo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8ua6W4115171
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ucp0jQG/I87lDUm5pF1K1vCe
	SDfAsNpNDdsrqtrG8ck=; b=NbftYt2AnGAsdRAYG/RP6oSSbGXqghAnrkPyW7yo
	ODKly3absVdYcR5lUccwxOQbg2DQURdbvfB28aKa8OQN8JnNJv6bZzG7nQFaQdhu
	nSMAbAbHY7QMxbQNX08l2kyjZnmuiyYSWuxhFhbEsw5WcaHgm7NFsfAvfw0nFcGU
	NavdtmBQcqaKCEjUuPY87zobfIPEzoADgEkGPn+1nhogFX+X+/qIYldP5BpXSUDa
	qQvWxQIbI1Q3k14h2mLkyJ63mzTuaw127gM67mA7BX2dxnMIRrLGtqD2wzPx9nGB
	RvgY4OR8vOLJ66GAH6av4oVNy44CLPSfJp9ixIjKDt4wNg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hd1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:06:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e4026a2524so15840500a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779289572; x=1779894372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ucp0jQG/I87lDUm5pF1K1vCeSDfAsNpNDdsrqtrG8ck=;
        b=j5yd0bMo/Rxtyf9yV9RaJuX/ESdIcf7EutSK3iK7QMYfnBN4q1kvgPhnbedSjTQW+8
         PP7SonGHuJOl6Hsv00Tp2qYrYPOV137LfB5jlvlktascQMiGPqXwSGzSlL4eJaz09MaO
         V1ZUxViJ8dpMMIOUw+I4J78WzH0jBPfzrI+ns1FHqVmDHydMCy81olKswX4rgUuEDepm
         41m2VUCOKPacOqOfLCNEMyZriJIduBdc6JmnJ65CG1rM2qeP0X3t/tC8DUWkVvmXYVcS
         ninj6w3zTFt2KHyldkpZATWrq8jAuWnFVdVpRHPcXtoTRLQ5y0lNQtP4dGEzXJUayQow
         kiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289572; x=1779894372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucp0jQG/I87lDUm5pF1K1vCeSDfAsNpNDdsrqtrG8ck=;
        b=oGLkdfZasrL+GP+cP9yaXHDegASuPSWZWOgAR+7bE0bR19xNrP0ikHwiVO2fbwH2sv
         veclqfoOfVYzDhhv59hK5xnVEauNhNDo1doxITKmTAVngywvvPLGNIJ6bmFcCT8j4Lpi
         39iASPqSEhSspxkB+RBgbyrMeoX9CfycCnKsr9XwReIaNDoxLTCZlCT3Vf1S0b/godJF
         UN5RWOq+cxkG1S8t1/06CbY86luX1c3I4kpjoM6AkJebO5vlxktumtvhyo6nuTSLTKrr
         2m99zS9krsX9RbVUTSQDDeCBdG4Qoe5WrLmpZUe+qHTdh63kzRxRKAPUT5CKCN76QsK3
         v87A==
X-Forwarded-Encrypted: i=1; AFNElJ8Nx62epKpOfrqEsV9FrT7/Ai5aCK6iFN8IKJ1+jE+PtQrURqvF/njfv+l64UVk7CnaDfuPpiDEcDLKRKG8@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwTwoe6DcC+NPEO2hHzn4iocmRHKl2gbobZILZbM+upJaNN7P
	bGLpcHjrF2coArb88WVEODHTuwJVFWVXaz/AwXP91s79Kjio66GCGtWWBd9u60+90yGsl6ggm6r
	oJzuruBXy9Wfqyu8pXqfXoKXfhrzkDunZ6tYpiazl7S53RlzlIOVB8oKLXIsFI7/rLj4e
X-Gm-Gg: Acq92OGCp6o3gUxr4B24iD31etq50UBetIpIagyIJlWRuMAouMowGF4xO+yeQdy6D5S
	4SFgKEcoWltX/PuwLmvAOF4EDzIRxr+pV0jUDD2fxqtFUuA8BckQKKUWgAYFEUJWN/EBMhsfsVB
	z/RLagL6kpfjUzP0JBtOy45w9RfVvm/KlzNukGwdDdRZOpRAAweHZ7mOhlCKCOz7gzoeZN4ykAz
	QRbbAyaJ52iek88BenHGZjdGw63T7yWqfyg4S6l1LgRMP745hnEDXfKGZEyPRB0D3361Nmd098N
	WXUJMAo5N730/GqC2jDg8DAe7n2QmFqcTzErMBRJy0vFstwPX5vwzEw4cJg1ItEhsfs63wSfDVl
	oCCDJCrCMcHwpKqTCMyq/PaOsHziM1QnOfT0OWW+irnDgz5bTwaqWY6PHwI9AW2IuvNYUqbHv8J
	ENXr6Ne+OSx8VKoPXEI/pevX/U2QyIRVUr84U=
X-Received: by 2002:a05:6830:d0e:b0:7dc:67:8c9b with SMTP id 46e09a7af769-7e4ea020074mr17292025a34.4.1779289571675;
        Wed, 20 May 2026 08:06:11 -0700 (PDT)
X-Received: by 2002:a05:6830:d0e:b0:7dc:67:8c9b with SMTP id 46e09a7af769-7e4ea020074mr17291981a34.4.1779289571165;
        Wed, 20 May 2026 08:06:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm5056179e87.41.2026.05.20.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:06:09 -0700 (PDT)
Date: Wed, 20 May 2026 18:06:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DIdOyh6k_YqMagV6-Z9evBYFltOMXiY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NiBTYWx0ZWRfX5Zffof4Kv7XT
 PCyOHzTS4A+kpzRHhvfQEJjqWdMip7Tpiobc3PuWhk0PDSqlbE7Vu1TW6E5xigIOYBtG5qjkpG/
 /EKbt1eKiRChMmX7co6OqMqjTpm3RmrETL6yE5CSFUQJq7/pQ/FyoDWl/B8I+jVW6TtlHN4pjOH
 Jck1YBz6vO8PnoKROibtjvhm8lhkY3LEfzVpdv9wCscHjR7kU3PdbJ3vbQZW/enulekWW0pbHYJ
 sQ/cBagvd7BiZLWruuVoV+kqsTHgbNoW8GCeF0FkbvV4usJxV7TuydSLW8fTJE3QLcPZtMj+i6D
 la9Qz4ENtWwNQAlWhINf3KEUNcTtHsN7I8fQke/xzVuDt5dOyYRoPxmb9V+mIjwxz2kd6peVEq0
 U4mihcemNIWcc/WY1xYSSq70P27KwPOGo58V9jh8zDuOHSsm7dG+hbKB40KPn93WvxHjPwt9OJp
 nTF14o7QhijdX1pMKug==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dcde4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3AD8K0hoVNDCmrBz8twA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: DIdOyh6k_YqMagV6-Z9evBYFltOMXiY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200146
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F400659133B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> >> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >>>> and DP signal processing capabilities. In that architecture, USB3 and
> >>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >>>> The DP part is roughly the same as on the instances without USB4.
> >>>>
> >>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >>>> Only one USB protocol (and flavor of pipe clock) can be active at a
> >>>> given moment (not to be confused with USB3 not being able to be
> >>>> tunneled as USB4 packets - that of course remains possible).
> >>>> The DP PLL is still used for clocking tunneled DP links. It may be
> >>>> turned off to save power when no tunnels are active, but that's left as
> >>>> a TODO item for now.
> >>>>
> >>>> Due to the nature of USB4, the Type-C handling happens entirely inside
> >>>> the Host Router, and as such the QMPPHY's mux_set() function is
> >>>> nullified for the period when USB4 PHY remains active. This is strictly
> >>>> necessary, as the Host Router driver is going to excercise manual
> >>>> control over the USB4 PHY's power state, which is needed by the suspend
> >>>> and resume flows. Failure to control that synchronously with other
> >>>> parts of the code results in a SoC crash by unlocked access.
> >>>>
> >>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >>>> submodes.
> >>>>
> >>>> Thunderbolt 3, having a number of differences vs USB4, requires a
> >>>> couple specific overrides, pertaining to electrical characteristics,
> >>>> which are easily accommodated for.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>>>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>>>
> >>>
> >>> Overall it looks good. The major question (after looking at TODOs), do
> >>> we need a separate submode for USB+DP / TBT+DP?
> >>
> >> The problem space is as follows:
> >>
> >> After a TBT (collectively TBT3+ and USB4) link has been established and
> >> we have a link partner, we may (based on the HW capabilities and user
> >> config, such as kernel params but not only) start or stop a DP tunnel at
> >> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> >> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> >> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> >> as a separate DP AUX host)
> > 
> > So far so good. But I still don't grok if having a DP-over-USB4 is a
> > separate submode or not. I.e. I see code (and TODOs) to detect and
> > handle DP going on and off. Would it be better if we specify that
> > explicitly?
> 
> I really don't want to end up in a situation like we have with:
> 
> $ rg _USB include/linux/phy/phy.h
> 29:     PHY_MODE_USB_HOST,
> 30:     PHY_MODE_USB_HOST_LS,
> 31:     PHY_MODE_USB_HOST_FS,
> 32:     PHY_MODE_USB_HOST_HS,
> 33:     PHY_MODE_USB_HOST_SS,
> 34:     PHY_MODE_USB_DEVICE,
> 35:     PHY_MODE_USB_DEVICE_LS,
> 36:     PHY_MODE_USB_DEVICE_FS,
> 37:     PHY_MODE_USB_DEVICE_HS,
> 38:     PHY_MODE_USB_DEVICE_SS,
> 39:     PHY_MODE_USB_OTG,
> 
> >> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> >> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> >> (and each of these routers is hardwired to one of the PHYs).
> >>
> >> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> >> super high-res display at one of the physical ports, or a long
> >> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> >> we would only need one of the PHYs (associated with the router that's
> >> wired to that port) to provide a DP clock.
> >>
> >> This, along with the normal (logical or physical) present/absent status
> >> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> >> or something along those lines to toggle that bit as necessary
> > 
> > I don't see phy_set_opts(). So maybe a submode then...
> 
> Sorry, I misremembered the name. The function is phy_configure(), and it
> takes a union phy_configure_opts, hence the confusion

So, phy_configure() will be called for the DP PHY to set the DP opts,
but how do you plan to determine if DP is on or not? Or do you plan to
add phy_tbt_configure_opts ?

Another obvious option would be to set the flag if DP PHY is being tuned
on / off. I don't know if that fulfills your needs.

> 
> Konrad

-- 
With best wishes
Dmitry

