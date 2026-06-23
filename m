Return-Path: <linux-arm-msm+bounces-114257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySyUIPfJOmoaHAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:01:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D76B956D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NahfPp48;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XT3jAzlO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 952B630E52D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294C03911CF;
	Tue, 23 Jun 2026 17:56:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE92DF3D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:56:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237412; cv=none; b=Pl312LXbgD3k/K5o59uhQHVUzo+BrR1f9KWYpuA3RmJ75GTHfr/tHk8+5hndlIcICvkHFmmNEEeJlZwVu32nRolQa7MKVcBZ6zA7DEfB2Yy9gXsgXw0UCx/dZllbxjfKu6gADH8k/NkUyCuHI/6Yaoh4h1LBVxrU2FURXiLRfM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237412; c=relaxed/simple;
	bh=bssbrmz6IebSeZcV9tGxiid6TnATcUOztAaNiiKVx5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ5luyFM2koP5KymGUqku5eESRaWQhXpmJzY7cPdhcaEnuq6gk/8w2o0DekHiNvjLM+aM03W8yw6ax0rrTyBegRxc42dkaXmz62/XNMI9iH3TsluMSCbA+YsEijjmIuNHFZl6aPBTWff6l+n02X5Xqhn/agq2/xq9APtSD9B7p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NahfPp48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT3jAzlO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NHppVS113506
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K44ehTwQkYUZ6rlL7/DNpEjH
	H4XJiDPFFcvpHvTXK4s=; b=NahfPp48IU9JzRYlH/CBhrTEdYO8M32kK5Yh3JQa
	wQmmegiQhD7FbPFcbsNRb6rgrprZEe6D0wz1UJSnEDMCQDXrfLUYVLnE+0qk2Bql
	bs5nMgtT6IXqAoGIpGzbTzwyG9Ip732r/sjghjzSYUKgebW5feuJ91yH5uZVfI8k
	7xPOoF398tthlyT4CYd9d3kS9OvyR/hfhWH2GtC9mFG930VKZ/pTZ+1MSOQFsrOt
	w+plLqxpCxxAu2Yd9Bi3Me/LDC7DCZ8aK6x7hQXRGdBYn65Lh1BT1hMTPZ3Lexsc
	AeOhmQ2ycNi/IQKgq4svyu11w3tW9xS/TwZxgxXq4vqs9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvu0nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:56:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso7074885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237408; x=1782842208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K44ehTwQkYUZ6rlL7/DNpEjHH4XJiDPFFcvpHvTXK4s=;
        b=XT3jAzlOnkOQJcdK/m+pGN0ZfxR0hJL+Y9S6tgORoXgYn9H/PNU1uhTRJ+bwhNuIcZ
         VoC5KV41k6ViVjo47Ca/ZbFWnbnZ4zGTTfbbzGdaqSx6BARH7sGpdr8fyi+eFHq+O1Z2
         TqqM66qksY9k4lZ8WhZ9T4bqgMIKDA8tDMefXRsNQQCAp3VtgTnS8kBDI6glX0nPxjdp
         tD/nyhBUZ7FEMDLDIJyFD7UpMlm2Hg2jXQ1AdDfmIKlaJVDSCNZhGR8qP/02bta6rLIU
         zVF0AtdqcFhIX8Qp16VAk2uI6QBGa0Eie48G4pvK1TlJ0hPL/8LgfYAcPxRISGGm8EgX
         Q8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237408; x=1782842208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K44ehTwQkYUZ6rlL7/DNpEjHH4XJiDPFFcvpHvTXK4s=;
        b=ggrt+hXd5W1UKeASHhapDS+HORZTELCO164ocijOWeNxyoYQLvNf1iaBJOwuabRtc2
         O0pQaxZ+ayLRy2I5jw8xSSvvwZdBV2APl7UPH9Du3BHI1UjrEY6mHt/A9wcULNG9Kd1e
         1aQ/kgJU+TWsxxoefcia97uK3icwgeF+EBXcwP0vY/vMxmam9wOfou6w45ICfEnV6YY/
         ZMLiTmePTmhod3XabEHWj0cbO8CjcmU12xewHCatRxbC2WVBsv5r8yr0NqYfWgjn13Ya
         RBO7ny2VAu72oIDwqvFpLA+16FZuAdX7udt5GQWZfMkq/YPaPxWKOYEq1c+y+usLV7So
         fY3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9VgL3vJOwQMga3cXbhKaACKLDQ2ECAbA7rdLfvd8M8HIsn0qfvdrK62C2K5dMCNpCOZjwttJZPMahOxJL9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywicv57bGUxlrT5ZZSTnIKgW8CQ+1G/9ldejkbHGkHinKBoNost
	7+mqw5T9LgcmL1ywBx8YAmQzS94QCXGl1DzlzsIiYL8KisCXEJXN6RftCHskJRU6aIwKnYI3GA7
	KJng4gQuDFLKiYZfm+bLil1A4fsMOU+MuyEYv1j9tIs+7cqlgp2ArQ21HlkfjK/cZA00a
X-Gm-Gg: AfdE7clS/Vh6Re5h+nrAS7RotfmjEMK6Jg+PsmJ6niWO+3FqVFC2OQFogWFib9jvw1G
	8vx8mxWHHHYQY3N7HL++HqxPG1Ya7pplzb0lTZXdX2M5/xyNrbi7maNWtIhBOo17ZTFxlt7vMkN
	ckLuNPeAVXP5/wadkCNt+ClTBYDWmT9Sm/cTjrzGP/kVJjchhk+A53NANRCemOKzNdzLqfADB8q
	0CJoh5Z4y6AJJqY9rUhm6bG3Ul/ppBIF7gnq8OId+RWz3r+owEI4V8riS9YDKN4FiJ+DLWDBC7v
	ZNbiTu6L8MBZiwPvFnPTbx/ThLtdxR0qYTT/KlsbpbMEFMLxyim9K+OsPBS+jB5qbL68bBXoJJS
	zrMD8aD+tjsVnfjQ03boTEfmm3jbTnUIrVzZ6arWubVHw6tXvXjqDojIZrhgNborqoSHDlWm3b5
	10y+NEZ9RRxgjv4nov2AClC/M6
X-Received: by 2002:a05:620a:f10:b0:915:a762:2735 with SMTP id af79cd13be357-9278357030emr10159385a.37.1782237407992;
        Tue, 23 Jun 2026 10:56:47 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:915:a762:2735 with SMTP id af79cd13be357-9278357030emr10151485a.37.1782237407254;
        Tue, 23 Jun 2026 10:56:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a6cesm989274e87.48.2026.06.23.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:56:46 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:56:43 +0300
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
Message-ID: <37a4vzkiicm7aw3bg2r3s5e53kigh3wsc5yuqqjp4h6oxhpk7g@oybpt7kdnnxb>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
 <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
 <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
 <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3ac8e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DbwxBUtuSyURhUCB4_gA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfXx8DKDhjTaZ6P
 J+NiUU/087TLe1Y85nPRtRXdQJEhcjirbY3Fmo+bWjsDe3vAb4Amj0sxydFMjPOzJSKBs7vkc0J
 jEU1VVFChyqjkaeWEsEOLW27VhH2Gvw=
X-Proofpoint-ORIG-GUID: GM7ba__txNCmnKqC6stB2ZE1Vfze7RgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX0mNgDFx2BvL9
 mjTZEplrXYI4C/mvy4jslzeGmk72opVviUIqmuxOqX1YlENpW21vKOYxU+e+sJyCMonWk7myXPH
 1ebkcegNSu7hDDWOlhYqn655o6jboG9GRy+/6ipKfCxfap1lpRfosTDdGCXWqgUA6S02XZH9/Oa
 jDI59Q2ETd1PNNVOX2IixLr4hzqQGDSPrx80w7tGJTpdhFhrzTcCA0VyewERpBzml1KCmwbMWve
 e6zkZHAtVLxTb4ZlLueOjU5+R197UyBdkO4sT0ZGd4TMrb3vf7whFndtipmK/PytgkuijSmiW0b
 Q9tNeAegWM7SQ4tugB/Qx2xcJpoQMml/igifGrCMz/deJNKguJ7j9FSM88ultJMIINSGmQ8qKIM
 njIFVn1UdXGWrAMbXdNVhVkGNSicHX5HNNTxzoeWjxW/UBCiqpEY/MrkbS9IzkddNTTNknAIFYd
 cTBrbhxeiHNlYFi1xfQ==
X-Proofpoint-GUID: GM7ba__txNCmnKqC6stB2ZE1Vfze7RgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230147
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114257-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:usb4-upstream@oss.qualcomm.com,m:rthoorpu@qti.qualcomm.com,m:westeri@kernel.org,m:sven@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D30D76B956D

On Tue, Jun 16, 2026 at 01:44:48PM +0200, Konrad Dybcio wrote:
> On 5/28/26 10:00 AM, Dmitry Baryshkov wrote:
> > On Fri, May 22, 2026 at 02:05:14PM +0200, Konrad Dybcio wrote:
> >> On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
> >>>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> >>>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >>>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >>>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
> >>>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >>>>>>>> The DP part is roughly the same as on the instances without USB4.
> >>>>>>>>
> >>>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >>>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
> >>>>>>>> given moment (not to be confused with USB3 not being able to be
> >>>>>>>> tunneled as USB4 packets - that of course remains possible).
> >>>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
> >>>>>>>> turned off to save power when no tunnels are active, but that's left as
> >>>>>>>> a TODO item for now.
> >>>>>>>>
> >>>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
> >>>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
> >>>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
> >>>>>>>> necessary, as the Host Router driver is going to excercise manual
> >>>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
> >>>>>>>> and resume flows. Failure to control that synchronously with other
> >>>>>>>> parts of the code results in a SoC crash by unlocked access.
> >>>>>>>>
> >>>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >>>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >>>>>>>> submodes.
> >>>>>>>>
> >>>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
> >>>>>>>> couple specific overrides, pertaining to electrical characteristics,
> >>>>>>>> which are easily accommodated for.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>>>>>>>
> >>>>>>>
> >>>>>>> Overall it looks good. The major question (after looking at TODOs), do
> >>>>>>> we need a separate submode for USB+DP / TBT+DP?
> >>>>>>
> >>>>>> The problem space is as follows:
> >>>>>>
> >>>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
> >>>>>> we have a link partner, we may (based on the HW capabilities and user
> >>>>>> config, such as kernel params but not only) start or stop a DP tunnel at
> >>>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> >>>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> >>>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> >>>>>> as a separate DP AUX host)
> >>>>>
> >>>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
> >>>>> separate submode or not. I.e. I see code (and TODOs) to detect and
> >>>>> handle DP going on and off. Would it be better if we specify that
> >>>>> explicitly?
> >>>>
> >>>> I really don't want to end up in a situation like we have with:
> >>>>
> >>>> $ rg _USB include/linux/phy/phy.h
> >>>> 29:     PHY_MODE_USB_HOST,
> >>>> 30:     PHY_MODE_USB_HOST_LS,
> >>>> 31:     PHY_MODE_USB_HOST_FS,
> >>>> 32:     PHY_MODE_USB_HOST_HS,
> >>>> 33:     PHY_MODE_USB_HOST_SS,
> >>>> 34:     PHY_MODE_USB_DEVICE,
> >>>> 35:     PHY_MODE_USB_DEVICE_LS,
> >>>> 36:     PHY_MODE_USB_DEVICE_FS,
> >>>> 37:     PHY_MODE_USB_DEVICE_HS,
> >>>> 38:     PHY_MODE_USB_DEVICE_SS,
> >>>> 39:     PHY_MODE_USB_OTG,
> >>>>
> >>>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> >>>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> >>>>>> (and each of these routers is hardwired to one of the PHYs).
> >>>>>>
> >>>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> >>>>>> super high-res display at one of the physical ports, or a long
> >>>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> >>>>>> we would only need one of the PHYs (associated with the router that's
> >>>>>> wired to that port) to provide a DP clock.
> >>>>>>
> >>>>>> This, along with the normal (logical or physical) present/absent status
> >>>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> >>>>>> or something along those lines to toggle that bit as necessary
> >>>>>
> >>>>> I don't see phy_set_opts(). So maybe a submode then...
> >>>>
> >>>> Sorry, I misremembered the name. The function is phy_configure(), and it
> >>>> takes a union phy_configure_opts, hence the confusion
> >>>
> >>> So, phy_configure() will be called for the DP PHY to set the DP opts,
> >>> but how do you plan to determine if DP is on or not? Or do you plan to
> >>> add phy_tbt_configure_opts ?
> >>>
> >>> Another obvious option would be to set the flag if DP PHY is being tuned
> >>> on / off. I don't know if that fulfills your needs.
> >>
> >> Either this or tbt_configure_opts. We still have the muxing question to
> >> chew through.
> >>
> >> The bottom line is that all AUX traffic happens between the "AUX adapters"
> >> within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
> >> and the far-end device (and anything inbetween in a chained topology) meaning
> >> we only need to engage the DP host itself (and therefore the PHY) after we've
> >> already performed the capability negotiations
> > 
> > I hope you mean USB link capabilities. DP host still needs to ping LTTPRs
> > and read all the DP properties on its own. I don't think we want to leak
> > that to the other layers.
> 
> I must crush your hopes.
> 
> There's some preliminary TBT-layer setup (handled by the tbt driver in
> Linux), followed by the expected DPCD (and alike) r/w accesses, which on
> our hw must happen through the DP adapters housed inside USB4SS (again,
> because the DPTX's auxbus is NOPed out). Think of it as just another
> i2c_aux provider.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

