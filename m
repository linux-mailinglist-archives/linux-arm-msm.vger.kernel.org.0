Return-Path: <linux-arm-msm+bounces-117641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2c/CAVBSTmrOKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE3726D89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IBi8AVUo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gV7E6SVx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20401300211A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B7637BE75;
	Wed,  8 Jul 2026 13:31:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D637AA65
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:31:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517506; cv=none; b=t4lrXqkhzO+OrCGWSVnxY1eogRt2fjCp38ONg10lGB5x8zjWbW6vloOczzyKtXUGz0im35exry0yVcoeK3h7oJnp5Hn2AKrA+BQFeFbVjArEncDYlOZM9G3uwVqDUgp5Fmmh9q1l1mn1L0CDMRg2WUvNP4Q/mQPvUaCSB9MkSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517506; c=relaxed/simple;
	bh=JFQ5ZOBtWMOftJo1ydp3nD+9WNA1LVmHbMPFMaIDKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a36EK/jR7TRQRtFPyYLa0UrW0/kikU/Y1F88YMZfCbHKrAYCmp3bBvu4wBIw5vQuMACtqmpUsCrOeAqf9vES9A2iaJoKNIR9sm04vwGmiHTsFCphWffmjAw+2Xj1hbmMT+5nOw6dFtVtk/YlZgl4c6Dfyky2O9d2qzyoixwhfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBi8AVUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gV7E6SVx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7qgQ2677951
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=; b=IBi8AVUoYI1UJ4NX
	Xwazn1Ht6CnHOA8FVZ4a9oDHrLU7UdsNrEkAMJXkGst23mHBI/hMSRe1ycfAKS2D
	P7inGgzUz3jKrTekjP24xFtPK/ufRZBW2osW2Hl07vjJMsJcHGyqwK1z5BpflgOs
	I/G8RPQbehR1IVNF0Ak6dQVW/sKdU0NE+e0/ARq+C6OkjJUr5pHDmaSdalfOBjTE
	FBrzwO4815CEZXVwt9bjSYL+RcoGWaRWaYhp6QW5o4XQbBB3W9WaV4F0XZ6bZ7R5
	hnQDeRzKyuMmAggUz55MMfffU54PcqlpQZYZZBySu6bpsZSDPeMeQfy1SW8UMJgh
	CMjd3Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s82xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:31:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-967973f71fcso223735241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517503; x=1784122303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=;
        b=gV7E6SVxcb9ABzw7RGmb9wk/iKAWH79E9hUA70hsgTddFygPFex0LTKhPnDn77a2q0
         /P0HRwXjW0DzbFPzItDEf/Mr9ZJ5qxqO5GTX34is0441l5IkaChbLvCjI16HIZh1Pd+z
         Tp0T8X1QxNp0BEA0r2Bi1bq3syfhnR7c5R980WVGYVwQaQY1kU4rKLyfuGjp2IGmgdaF
         cZN1AvngWCiYb7hWh8pfrXKT8UylNCSXZreaAbKe+INu+UzGmgsq33xiWdOULOVHY2WB
         ino19nSyqCZdNY9HWqJrZb83EEc8CibxDJLa+y70kwX4nSltwzDIajZnWA2joVzdfOmX
         Y1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517503; x=1784122303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=;
        b=ZT8qY6PWGjpqJ2+cWJg33tSiQ8DUOgmk93wd5Ept0d0QZFDBU0xBP9YIImgL8BCQox
         6Eum5XU0PJqT09vg2thEPZeIBLUHIpB3rpn5149JSRRG8LUl7DZEePhW2eay+amlueTD
         itY4VIXMAWdPGoq//50/u+jXthc1PHeEiiw8UOp1zKFCfzj5QsUJAAfVIjb8cAmPnkK1
         nAMpsKuIrrnRMF+JoSC8wSIbnD9pE4ymuoSzs507xVGGl3CtjZqZ6/ttKbKt3u56PpOW
         RZ/MFYVOjInkEY/t4jCWILlKLWNQmEJRWnz2BILl1MM//a6dNPNqNF5iM+ftIkvzs7Pd
         iKpw==
X-Forwarded-Encrypted: i=1; AHgh+RphNyk3bzNZ+Qem5Pbb+rikARGFyvkEPjNCCBGdD5o+QevcMrNHfbovu74DnFwgSBPdl4j8J9Ww2hZzue98@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Z4CIWbLKcAsxz1edxj/IjxsZwaFKZprb2qpo6eKmT0F7eIwL
	RlLBAAJcCx0JC1BQjicRMXMA1/scN30iC0E7H7WQrMr0PapzfPO8c9L9ruyXodp7WUE1Hw4kyF1
	MgRXjSepLI1ylyXmA+h5cvtRcU3l0W7vJX1n0ppuxNpcPtOYjsIeivQMOKkSU8h9NZr1F
X-Gm-Gg: AfdE7ckER+gEsckLaH1Dbx2yw1C7Yn8OMguL3/gj3Iza/U4u1TYoUhKzP2qy/+dw0eT
	DLXfmruXWXcd79fKeS1KX0kADHAv87C9e6dB6piV097jCzUROsbAxcTB6GuhcWUOrQElbnXSFwh
	v1mKgn71KBiW+Kj5pt4tsVAoewkYWouVr2+HIt6qQbmtGOJ/8X99qKRRkTib+qvl4Ew3TLtUISN
	iP9i8DFC/nJnnXgMXtMMQ1RhFxQmQC/h1eanld80ar6PIpMthq5k5p+SNjRpO6iVxze/IxLdmkR
	izgvOT5lErd4uPAfDcyv8x008yu0wPmVXQJJcv9t7i3m6hWPqzeES1Dl+9Q4WIdNy6ddJBcUI2r
	kt/wav9lyjK5hlY+6Fajws1jUWMwHpAiCwEXKPVfnPkftG2pssPGwRL0NGSOAfy9cKI8ROsQMPm
	7FV0MrS0wBEwCYbLNkFMjb+f2U
X-Received: by 2002:a05:6122:4d02:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5bf75e7266dmr991022e0c.10.1783517502593;
        Wed, 08 Jul 2026 06:31:42 -0700 (PDT)
X-Received: by 2002:a05:6122:4d02:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5bf75e7266dmr990975e0c.10.1783517502168;
        Wed, 08 Jul 2026 06:31:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a2dsm4485853e87.70.2026.07.08.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:31:40 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:31:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfXz2uUq+z4wCnt
 3aXI/Q7LPfF0JKtZAVPVhBSejYr8vASuyXXG5FNwBuqX69yGKu2geLHdaZbO9fdTrloMAnA//l3
 l2GYfKKuk/TRjHvqJUpZB+VqLqwzB3ULTrwO0e2mfj97DWKOcgH/4bXZ434Ryxo59O5VLSjzeN3
 Y1l3dMVXldiP/MGXCVc6Q3321vdQij+Cg/pYWCYwMVgYjtAGZDra1ynv7zIbP7Ks4dat0Rws7KQ
 lF5+TZTErNh7uVlbdvGWoPSZsPdOWDgV8oMQPK1fmzuRxmT4hlx6c2dSOLHWE9Dnx/oxWIatYCn
 rjfKAj63AjoCpmIsEnLm9G/1aeekLR5ibK3zPv6TA/MJceP6th8V+0K1lQRLJNnB1XGkVH9L4lN
 p5zSKpRWz/3pqpMfJZ/S1+gIsvOL68/DtxZhDugVOkd8jRag3hGdP/yjG+m+u592bGYYUw5jxOA
 I/JoErPnXgDs53WwOtw==
X-Proofpoint-ORIG-GUID: bTywk_DUrydPaX8KE_2MQidd-lp0v-nm
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e513f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=omIcalozpB-dROxQmn4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX0PitX26b91KD
 sJ5XfpiiUn3869p8+4aVDgmEIpi68Y1oK13qmcqrL9gBpQSI97t6CKr5PJySmvUG6jHsadSbLO+
 4sDkNJupuBQe62rpPoG3UGJ4tHMRArw=
X-Proofpoint-GUID: bTywk_DUrydPaX8KE_2MQidd-lp0v-nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117641-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:mohit.dsor@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@qualcomm.oss.com,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56DE3726D89

On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
> On 7/6/26 11:52, Mohit Dsor wrote:
> > On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> >>> On 5/4/26 22:09, Mohit Dsor wrote:
> >>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
> >>>> working and non working case. Lilliput is just a normal display working
> >>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> >>>> Gen2 only.
> >>>
> >>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
> >>> looks like this regression is still unfixed with nothing happening for
> >>> weeks now. Or has progress been made and I just missed it?
> >>
> >> Thanks as a reminder. Unfortunately, it takes some more time (and I've
> >> been a bit overloaded lately). Worst case I will send a revert soon.
> >>
> > Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> Hmm, no reply. Given that we are entering holiday season and are way
> past what Linus expects in a situation like this[1] I'd say we should go
> for a revert, unless some fix shows up really soon now.
> 
> Ciao, Thorsten

Please send a revert.

> 
> [1] To quote Linus statements from
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> """
> From 2026-01-22:
> 
>  But a user complaining should basically result in an immediate fix -
>  possibly a "revert and rethink".
> 
> With a later clarification on 2026-01-28:
> 
>  It's also worth noting that "immediate" obviously doesn't mean "right
>  this *second* when the problem has been reported".
> 
>  But if it's a regression with a known commit that caused it, I think
>  the rule of thumb should generally be "within a week", preferably
>  before the next rc.
> """

-- 
With best wishes
Dmitry

