Return-Path: <linux-arm-msm+bounces-110060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPJwF833F2q5WAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:07:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E835EE415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 279CB315EE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676C736896F;
	Thu, 28 May 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQb0SGSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHqSJrYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63B36680C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955232; cv=none; b=U3te3cbheTqn4bCMajJbi+V0Fe/x/gGVRRBD6+kDx2in5p+tdIwj+HRM+KNPfnRPbrCLFDSgvVqn0BN0NlmRTc8dp6ydtVcb94NC1dMiSTty4iAxq9iJ914uJvuwb3feDKKH75AxJis03eJWvbYpXwAukrWJjCnkWSXqTXRgQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955232; c=relaxed/simple;
	bh=hB9rWWdziNFSDSCFK0MEsE6r1p8y3/lPTZryWO7j3LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8jK4D2sDxm/MfBF5rTmro9P9Xtqmo8HzvljutJ/405gbxm1giVSx5I3mkJPqME8+L4rQsnSS0O8z36NuLUYv+toQCWodnrNLrOosSFSwVSk09MoGxk/jl3WOY5oFE4r+4ilxaeJnFgeW+Hc4DKX2B6FjDiV+5JWiN+Pm6fgAT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQb0SGSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHqSJrYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S6jgBT2621799
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N7iMbetrrOwn6wQkhuxIddok
	2tB1wY35g7JsfGtZdak=; b=hQb0SGSr6d5nOnQPbsCqqc0XyBMozQI1cGgGMDJ0
	HuBvifkSNS56xU43f9j1SX8TrPK4gDXm6jFX69BIj4SUUSnvdgv5RSpQcBULEcdu
	EJiccDSiu0yzGLi4bofFOPIMoQtsTrCiQFjfYqRND9u9SA7uP/jo2540P9eLycXD
	r8UPzbVXdybVReSAvPvOjYz4ESqP2+DOGL5CVSSamw4GAM8OulD50DfF9z3FXBoJ
	h2orbLsRexGINodAogEXinEUSVsiMCBgtyg0An13pUczxVyvjsnem5WJ41FkxlbT
	Bftp6/7r+U4kEQZ12WyIexaxQSg73IKrXFT8Jl6oBBVFcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf1vs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:00:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so82655341cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779955229; x=1780560029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7iMbetrrOwn6wQkhuxIddok2tB1wY35g7JsfGtZdak=;
        b=iHqSJrYRGRED0ftPYZl//0UxIHI7BhtjvkZZXL4viB+NL4IeKJft55tbhAV6CJ1rxe
         0CvruGzU8v+UkqKw7barjhCNZnXqoYe1r/5LL1QsS+39yTNW0mIWCEoIGGZaoAKr6q/y
         /8ldEQnNLjfWrcGGtESApPdVhLcJaN23MR1s5y1rkB1AZte18uzqiTfmiKOeWFYC/OeM
         um5aPURc7ojGHjYjRuUJZHss3CU4F4Ayw0mnXiGTlAGUYg9LdU9ZbM/EQYOz2PJkXbOY
         EQ9yuNt3zqCH9ja0GoDG+emmwJ+sC1bbOENAwBxrKWH/nk7FTArlozthAkK4Q8A35CiX
         GVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779955229; x=1780560029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7iMbetrrOwn6wQkhuxIddok2tB1wY35g7JsfGtZdak=;
        b=jz/jOMY5C9ZwjwSXdijz3OZTzw8Gu2PpFdS9H5nsYpkd44+4tXMDtn2Ko0ySHJpvGj
         CbiMvX7E7up49ebkVucKdtB/UCHmjlH2z/hj1g6UAx3IVNU0O+QIfhcqa41Dihhn0R/0
         JFQ1pQbRfTbGu8XcZq0fUwBpsAwOP809CjMi61BpcXkp9kdOwtPitFS3lj4BQRPdAYW+
         Q9yCp4ZMRohjeMjRxDtoUfcexF8AGws+4QjeDlZkpuebusKq4CiE0ycoxzEH/DD0LfN/
         Mle4l3ON1k+xsKEBy50TqvC64UkzXk9ZSttuhi9UttEyBkaNuWe9psQ/dmCQpNOX+kxQ
         e6Cw==
X-Forwarded-Encrypted: i=1; AFNElJ9+rXrQXEPYERmyUwbZnYj5RQZ/DFy+3oH63qBYlb3ar2O4mND9Jcl5cyQtDFT25+Xle4yYp69OOKEOSxC4@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8AnozZnRokgo8T5jZAVTT1NuC1dr73vKzfmUeYJ2dPhI/bGt
	86Fam6SOAtlYJHIPTMdHiMpDTXbp3x4KIx5KaJNb9ECPU8M1lPWr/FJhCB64/C9HX4ZhiqfXXz4
	kK2NLEwAZ6NIm34ZQ0ZHFbmoKG4aP+4I0ebW6p79anCNw8HvCwvxBuVwha7JM6Ygh2AwG
X-Gm-Gg: Acq92OG//KEh4JM9wEg4g97/yYx7o+Rue763LhrOOMKCrJBsoohTBhkRSPojkzIMa0k
	1eSLrYamMep/pJb8bU0BepWeW/QjNI2NDYbI4Cgx6jDEdL9nKroiJ4E+odNlMDLvdWz0CY1BLyB
	tQPCgRT5+o5OQNx3CueA6Sa2Dhg6fmGVq2lJUY41CTzUrGZHPqKUOASAdU3wwqoYg9ywVYkLfKc
	120Shlb3UeynHOu0HPyLtqbsAhjfwTtyUoMIrHNdKPC3a3ZFgcJ1AXGNEl0QFifLQV4RfY8OsxD
	4UC+723fvDkieXaedbWBs6IFeJ1PlX68J9ZoUlkArsdVmunIPsF6je6cnJLLtN8b+wT3zG4xsXz
	uyBmfNwaIwdEMfNEyNI3U+MttEa1Jb28k+VjtAuMWHDzdn5Vw+xljjkLgnts9mfzNwrXv12kIu/
	gUDLQ+N66fvgsjCZ72Oyy7KCc64LuAobJrokmRVqg+gET2kA==
X-Received: by 2002:a05:622a:8589:b0:516:daff:7f71 with SMTP id d75a77b69052e-516daff8005mr277691201cf.56.1779955228567;
        Thu, 28 May 2026 01:00:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8589:b0:516:daff:7f71 with SMTP id d75a77b69052e-516daff8005mr277690111cf.56.1779955227789;
        Thu, 28 May 2026 01:00:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462cf284sm1739113e87.7.2026.05.28.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:00:26 -0700 (PDT)
Date: Thu, 28 May 2026 11:00:23 +0300
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
Message-ID: <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
 <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
X-Proofpoint-GUID: tSvYERG3BH71Qwl8zr1WCKq3GSGTBrZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA3OSBTYWx0ZWRfX6pGTiECRh+/Y
 CPH9tnOKuZ96USW7DgapfKWc/4pp1sXXafWHw03lThLoWclqYXJe92Mf5LnoTwNVI1Q17tdGcq3
 Vtomdq+v6AQIn9UeMkpzZ3aku+XOQx0BbNcAigjUdM9KLi8UROUBwrrCu2c77CT1caUdZ8lQp5H
 PhIHY8GauZJEm2gJH2vZhofWNG7U2FctwOBp6YRhqxYeh+XjLRAUQH6litzaUUY/AXgZL8lURPe
 zK/azoj7mNcLxeCcWMqWv85ynqidDMAiU4FHzmH4B0Mjxw7or79bv46vYkE9QWtXmWAXBqVr+9n
 gLYn8r9f/Y8E+L+zDRRHGoR70bwfCRGoeBSVwmUNp9RtUo/fibqOnfdiJJyED8MZPjfzpFsarwH
 MZz92S5YKeEFqAOWxBPZCySqIBT3gcLOmKNizIjWx9CclE4MZbU8Q/sZvJb01WLN3xmvXeEdKRt
 mcKteo+7U4x5u7+ZBsQ==
X-Proofpoint-ORIG-GUID: tSvYERG3BH71Qwl8zr1WCKq3GSGTBrZa
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a17f61d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PDx2_Kj2Eo2xtKM_tVQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280079
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110060-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09E835EE415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:05:14PM +0200, Konrad Dybcio wrote:
> On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
> >> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> >>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >>>>>> and DP signal processing capabilities. In that architecture, USB3 and
> >>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >>>>>> The DP part is roughly the same as on the instances without USB4.
> >>>>>>
> >>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
> >>>>>> given moment (not to be confused with USB3 not being able to be
> >>>>>> tunneled as USB4 packets - that of course remains possible).
> >>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
> >>>>>> turned off to save power when no tunnels are active, but that's left as
> >>>>>> a TODO item for now.
> >>>>>>
> >>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
> >>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
> >>>>>> nullified for the period when USB4 PHY remains active. This is strictly
> >>>>>> necessary, as the Host Router driver is going to excercise manual
> >>>>>> control over the USB4 PHY's power state, which is needed by the suspend
> >>>>>> and resume flows. Failure to control that synchronously with other
> >>>>>> parts of the code results in a SoC crash by unlocked access.
> >>>>>>
> >>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >>>>>> submodes.
> >>>>>>
> >>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
> >>>>>> couple specific overrides, pertaining to electrical characteristics,
> >>>>>> which are easily accommodated for.
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>>>>>
> >>>>>
> >>>>> Overall it looks good. The major question (after looking at TODOs), do
> >>>>> we need a separate submode for USB+DP / TBT+DP?
> >>>>
> >>>> The problem space is as follows:
> >>>>
> >>>> After a TBT (collectively TBT3+ and USB4) link has been established and
> >>>> we have a link partner, we may (based on the HW capabilities and user
> >>>> config, such as kernel params but not only) start or stop a DP tunnel at
> >>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> >>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> >>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> >>>> as a separate DP AUX host)
> >>>
> >>> So far so good. But I still don't grok if having a DP-over-USB4 is a
> >>> separate submode or not. I.e. I see code (and TODOs) to detect and
> >>> handle DP going on and off. Would it be better if we specify that
> >>> explicitly?
> >>
> >> I really don't want to end up in a situation like we have with:
> >>
> >> $ rg _USB include/linux/phy/phy.h
> >> 29:     PHY_MODE_USB_HOST,
> >> 30:     PHY_MODE_USB_HOST_LS,
> >> 31:     PHY_MODE_USB_HOST_FS,
> >> 32:     PHY_MODE_USB_HOST_HS,
> >> 33:     PHY_MODE_USB_HOST_SS,
> >> 34:     PHY_MODE_USB_DEVICE,
> >> 35:     PHY_MODE_USB_DEVICE_LS,
> >> 36:     PHY_MODE_USB_DEVICE_FS,
> >> 37:     PHY_MODE_USB_DEVICE_HS,
> >> 38:     PHY_MODE_USB_DEVICE_SS,
> >> 39:     PHY_MODE_USB_OTG,
> >>
> >>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> >>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> >>>> (and each of these routers is hardwired to one of the PHYs).
> >>>>
> >>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> >>>> super high-res display at one of the physical ports, or a long
> >>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> >>>> we would only need one of the PHYs (associated with the router that's
> >>>> wired to that port) to provide a DP clock.
> >>>>
> >>>> This, along with the normal (logical or physical) present/absent status
> >>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> >>>> or something along those lines to toggle that bit as necessary
> >>>
> >>> I don't see phy_set_opts(). So maybe a submode then...
> >>
> >> Sorry, I misremembered the name. The function is phy_configure(), and it
> >> takes a union phy_configure_opts, hence the confusion
> > 
> > So, phy_configure() will be called for the DP PHY to set the DP opts,
> > but how do you plan to determine if DP is on or not? Or do you plan to
> > add phy_tbt_configure_opts ?
> > 
> > Another obvious option would be to set the flag if DP PHY is being tuned
> > on / off. I don't know if that fulfills your needs.
> 
> Either this or tbt_configure_opts. We still have the muxing question to
> chew through.
> 
> The bottom line is that all AUX traffic happens between the "AUX adapters"
> within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
> and the far-end device (and anything inbetween in a chained topology) meaning
> we only need to engage the DP host itself (and therefore the PHY) after we've
> already performed the capability negotiations

I hope you mean USB link capabilities. DP host still needs to ping LTTPRs
and read all the DP properties on its own. I don't think we want to leak
that to the other layers.

-- 
With best wishes
Dmitry

