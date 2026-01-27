Return-Path: <linux-arm-msm+bounces-90747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHvzNCyneGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:53:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7B93E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A7D4303981B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E6434B195;
	Tue, 27 Jan 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPJ/IBsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKVfg7mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050B34B40F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514768; cv=none; b=PLHESNNdJiwXGpDiJP52S3tr2XeRS0rah4FYrrHD6E6E9KJtvguS9t0/N4YA5+dN6H/lo/hIEPKHoAthYJCb/D9+foQ6vETOnVnwW9P1nq1cOGnvCbH9eSFjxZuOmAXPURfwNqPL9H/IeXZrcnQ82tdBOFAq1LHIt6JWxHw3IOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514768; c=relaxed/simple;
	bh=6JAzVZsU4KubP9IgDxyR6AZcv2GMmZ6+OF1QDY+5G9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3oLCRAjBf5lHPIExR6LfXR/Ui6+5PtAGSsvam5YYpxR8SU8rZbuHToPm0xUy2x2C3Zv2qXtVFn+GLpqsgbhGNmiTyBMRWdSLyTZqH1rAjZIqoRI10wKee5EGeh90E625oZ/DpAPauzHtSTiRd4kQFGqDtYyKZIXhZ0FuPl8owA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPJ/IBsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKVfg7mm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKToa700178
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IdKihRKTuK8o6lDlHKbGDjAG
	XAhwUnc+3Y9rbly4WSo=; b=TPJ/IBsBxG1S9yuDyy5ey4JJRo5GkUrvhw52MFOD
	qXejSeLKkEKKcqLpbSTETpqBscszsuhhzSjxd8PV1Wl6txIIlFOW90x7X+Eeq3Jw
	WpaHCsNojN3UKCFFQfHphWUtG2sFt1bWwk6mCER7SQITFF9EPmW9F/C28i2PSdnl
	utlkyjOHYZVQMLCxtNKRhuN9OTvaLp1rwLZcKSwH0NNvyjkugVuErE8XVZmEe4Ye
	/Yx6NopRAnuNwJ/eknWaQCDZZuF2uzwbrZrpKtAGAJ8rZoZ7DcAEOhS/EzcTfgY0
	rCehaEJgsq7nyagfXblCj0b0ZJ0MdxtCMn+aIylXAjMUbQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3tnfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:52:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f52597aca4so6124711137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514763; x=1770119563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdKihRKTuK8o6lDlHKbGDjAGXAhwUnc+3Y9rbly4WSo=;
        b=fKVfg7mmfuMITxDlIAgpLllPYUwklFhmWsPqEqNjvGmpbiG24PPqCqzcrp1cKA1QCn
         AfbwXHhgxv90UzTnmU8zxoRNCxtkaUoA2uvyB5cOEl7Q+Kc0tL0HZJXCXJ9sYPbaKrZf
         N5cr6C7aD+FK83FFzWOQlmdLyRNb0fcJCBWF9/+AWIW0jaIIEmAd5FRqFkAxWk2SegP8
         fLDqYlzXpRc+LSROp1oLXRzXLLA5hK5AuuzJabKF+e8gPI8DjGVlH73Ugg1Qy46hIbn3
         PY03kqepMSqsPFDCcR+JU9WB4+i0W65zZYfzlDffWOvYQyxQzmbF/Clx97WtwRRkwkJm
         oU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514763; x=1770119563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdKihRKTuK8o6lDlHKbGDjAGXAhwUnc+3Y9rbly4WSo=;
        b=hSkobIiO7tSLZ48NnFI5EZ9gn+AjIDoeaCxHg8CuqFpBf5c+Lw5PwmKxZrjJysVXGs
         2zUKiwXD0DZO0cVDmS2X6bUbLXSJ/PCRxRiYeB5TQt8Si4swuHJsRGnf4ObF4X0SPwY6
         lWgU3g3crwuIVrhVNbgQk7hdLvun0ckqtiGWnxhImtJwRvW0oBYqRVCG62qPWGgOFx3S
         2JIFcVKYZWO21qOcGLiJkHFtvQRIKV9vlTf9L3DwCdfnXQJhG7QH+RSdl2BCx7b3aKDK
         FvkGTWYMbE06PNcW7T3E16XYgmlO2fW9fLZNJugq1rFc1GX28sv4m+/kbINMFHsfyZst
         t2tw==
X-Forwarded-Encrypted: i=1; AJvYcCXZUG5+KFEbo05Zzz/xM3GDrOXi9fqGNCwUWO1mg24/K3T9ITomZPRP1gH9HnIujekzr7RGuKX4cofUzniO@vger.kernel.org
X-Gm-Message-State: AOJu0YzAuuvqia1e3M6DBeuV02cb+B3M/RixSRkZ+Lpp/tYLazYGVJpn
	HLDyBRkdTOCEmbx2+0dJYQck+e9U8pdjJGi309wc2RYgNsqSJx/gasCeA2f3hdCvxzbhyoEIocW
	2Ok9U4Q9loTEO1iF3ACg5+yglT9PLpmpkkwoMBvkPSEI2VOkShqEN6eghWTCpZBvnH6Fg
X-Gm-Gg: AZuq6aJJddEvF3TdYUlViR5Cw+HqPxAu0VNhzz9UtcTJKjm2qk5QBgfnzXetveADkFc
	CxmclrfVhuBCVnXYBHuC+UKEM6XmHbJ6ETVMLD2ku/I4MknQisMJrZGzov/hBTO9VhROMQIpsmC
	cWqskOLHkf/ppOZhNlZ7AqRhDyi18fyE2J8pTcCVwpc7Z6KPw7OM04HbzcBEOZuIV6bYqNPWQLA
	xpONmiOUnI1CZrI2wZlWzV7v476b7xnmws9g/vIkpNCgNObXlCkoF6cFZ5va0P+qirGGlzjIuwH
	WWZiT8ON6ZzYb6hEg2/ioUF8VueBxkdgdYb72Bd4PnT1i0JzZtlS7cYDd4JqlE65SRg/36k/BJM
	pMLe76mSrr/Um2XmlNYxwVGlCBOW+UHiCWRRlob/FjkbQ8KFdTllI2LpmNGN2EEIRjvjbwtUp7P
	ylIoCdKn36E1UzyjIftfT0yW4=
X-Received: by 2002:a05:6102:3ed6:b0:5dd:84f1:b51a with SMTP id ada2fe7eead31-5f723841222mr634369137.43.1769514762552;
        Tue, 27 Jan 2026 03:52:42 -0800 (PST)
X-Received: by 2002:a05:6102:3ed6:b0:5dd:84f1:b51a with SMTP id ada2fe7eead31-5f723841222mr634345137.43.1769514761958;
        Tue, 27 Jan 2026 03:52:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a16sm3564116e87.59.2026.01.27.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:52:41 -0800 (PST)
Date: Tue, 27 Jan 2026 13:52:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
Message-ID: <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gF6x1wyDC-KNR4jAd7o5DEVMNXN6Wq8r
X-Proofpoint-GUID: gF6x1wyDC-KNR4jAd7o5DEVMNXN6Wq8r
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978a70c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wY_k35-0G0TR-rtl6zUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX9rk2l3LWkERG
 fZSI3BiCO0sw6wHlQuGa1X+WokMmc+xnV7cGQ08dFKr7+ogFUBaV1+UAcGpsZh7Wvz1KUjWAJxu
 /XywMsqYuZtEGsXUiLqkHJXHXZcJtzV2RD6vRh1eIRbat2JJ6sloTWaQTGvu+mBh2Tk44e+gDIi
 O8cPC86K6i78AOEIZus8PpOlkV8OEVwzs0WeOE+lGnLDo3x0L0FrAqBuFfo3r6i9C/OZdG+IrKJ
 fRj2jKybsingiKVuP1muFPYqXxQgSLJFOp+8t0gdk8zWYg7v2PrttC3x5gMtBISveKRlurXNQEU
 2Pg3V3GUh68TsJnzy8tXLmquUw3RO9D83eWUPfByycByv0a/EG/ezAvo+htBDnbsuR50emiO4YZ
 k9zabnlDT9xgtZaC4YpR5H508vpNbJnVOGRzQwMc+xC7fNU8QR/zPLCfbk6FqZq3kCZ0H3Dc7yx
 HgS6O3P7TeHiI6ouiJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39D7B93E69
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
> 
> On 1/26/2026 7:08 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
> > > Qualcomm kaanapali platform have a newer generation of video IP iris4.
> > > The hardware have evolved mostly with respect to higher number of power
> > > domains as well as multiple clock sources.
> > > 
> > > The series extends support for multiple iommu-map entries for the same
> > > input id. Considering iris as a client driver, it adds the handling for
> > > multiple stream ids from VPU via iommu-map.
> > > 
> > > This series is depend on the below series:
> > > Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> > > 
> > > Following are the compliance and functional validation reports.
> > 
> > Please validate with fluster too. Having a "knowingly good" command line
> > is not a validation. It can't be reproduced by anybody else.
> > 
> 
> Below is the fluster result on kaanapali (will add in cover letter in next
> revision)

Nice, thanks!

> 
> H264:
> 77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.

What about the extension testsuites? Even if they are not supported,
they should not crash or cause the timeouts.

> - 52 test vectors failed due to interlaced clips - not supported

Yet or completely? Does "failed" mean "returned an error" or something
else?

> - 3 test vectors failed due to unsupported bitstream.
> - 2 test vectors failed because SP_SLICE type - not supported by the
>   hardware.
> - 1 test vector failed due to unsupported profile
> 
> H265:
>  129/147 testcases passed while testing JCT-VC-HEVC_V1 with
>  GStreamer-H.265-V4L2-Gst1.0.
>  The failing test case:
>  - 10 testcases failed due to unsupported 10 bit format.

MAIN10? I was actually surprised, Venus driver supported them for the
Iris2 hardware. Is it somethething to be fixed in future?

>  - 4 testcase failed due to unsupported resolution

Can it be fixed?

>  - 2 testcase failed due to CRC mismatch

Which means an error in the testsuite or somewhere on our side?

>  - 2 test fails due to session error (under debug)
>    - PICSIZE_C_Bossen_1
>    - WPP_E_ericsson_MAIN_2
> 
> VP9:
> 235/305 testcases passed while testing VP9-TEST-VECTORS with
>  GStreamer-VP9-V4L2-Gst1.0.
>  The failing test case:
>  - 64 testcases failed due to unsupported resolution

Can it be fixed?

>  - 2 testcases failed due to unsupported format

Hmm?

>  - 1 testcase failed with CRC mismatch (fails with ref decoder as well)

Could you please raise an issue against fluster?

>  - 2 testcase failed due to unsupported resolution after sequence change

Can it be fixed?

>  - 1 testcase failed due to unsupported stream

?

> 
> > > gstreamer test:
> > > Decoders validated with below commands, codec specific:
> > > gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> > > parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > 
> > Neither of these commands specify, what exactly was validated. They
> > specify that you've validated _some_ videos. It's impossible to even
> > reproduce your results, because you don't specify which files you've
> > used.
> > 
> 
> commands are shared indicating the pipeline used for validation for
> different codec plugins. These are some basic encode and decode commands,
> and shared for reference for anyone to pick input test files of their own.

Thanks, but it would also be helpful if you stated, which filesets were
used for validation. There are enough public filesets for testing video
decoders.

> 
> > > 
> > > gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> > > parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > 
> > > gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> > > parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > 
> > > Encoders validated with below commands:
> > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > location=<output_file.h264>
> > 
> > At least these should use test sinks in order to be reproducible.
> 
> it is using filesink in the pipeline to generate the encoded bitstream

I should have been more explicit: test sinks to generate the image.

-- 
With best wishes
Dmitry

