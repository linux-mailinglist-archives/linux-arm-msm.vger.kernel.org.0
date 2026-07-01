Return-Path: <linux-arm-msm+bounces-115713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nTawEZwcRWrK7AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6F6EE6CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZxjEtdz8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkMrLg2e;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 085173082E57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFF0481FAC;
	Wed,  1 Jul 2026 13:24:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8C3F4DFD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:24:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912264; cv=none; b=n4gDXXPv4qo7x9LEkSBUFCojdTJQnlzTIItGyPAVmPESnTxrNiY8AAgLszfO4vH9XlkM7MCdl0uRanIUXhaB9hM9GscehlPhFUbTxUmYqSLM5seQD+87GG4Pm3LFrWaZouJJbD0Pvs8E3UA7C+GqDyEubxLLZSIKE0AtCnT9G+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912264; c=relaxed/simple;
	bh=mDbV3v7IGBqVycD0ObKy44+eHDQ3Yt8L6D3S1h4aar8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFXB9NX3tqEPL3xbZpbJRh6zLNv+9Mr7JFEMQYyEhxWwXpvnkqvXAxJInpyN00VHNtFLcmlsC6fYuSx8Yo1lilAQQCPUSFbme+9kYMaS9jRHkTmbQZawMiN+iRv0joUCCW5QqDRp/3+5Xokqz0THoVyCQoROeHQvQOfd4euVsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxjEtdz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkMrLg2e; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9G76756557
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67QuYRt+j36IR0FVaeM2JIjV
	JpPGRXJM35kB9AKweaA=; b=ZxjEtdz8VxCSiXbSk3fR9ONGWdDmvtwLJdOIrQEs
	Uaxdc5aP9nG1najkEwEM6f6LAtebv440GGsQFyOqDcUyOqWJbYGiDiO5GHARNi1k
	g7p/QeO5XHQEfMsQLAtKDW2hT93ZbVu8m/CqZenQf5W1bW3ZKutVP04wvw0Ql1+k
	sVlb6P4pBNpiFIdwlKc0H8p9Twt5/GQM9DMdYS6ECqPBUFykLP//TVz5WEGBbpSG
	SJHlHCTSXc4SySJW1LQ5U8sQWeEuqB/69e0nMaMlqrrqY1VsuCkPAPr47Ms61vr9
	XUb7a1OpKnsJXqoGE6YAFoErJPIToXZOAW6GEvp2YbkUnw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqruq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:24:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd954154b1so143729e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912261; x=1783517061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67QuYRt+j36IR0FVaeM2JIjVJpPGRXJM35kB9AKweaA=;
        b=EkMrLg2exEQ7r8PGbLpaQQtylmNarjkJUddDFfj6BLG2t6uce++iw0f7bxVjdOeOCl
         +arJxB5CIBkYimv1wgM0XQC78yJYTc4DtbxeZq1G0FAummNssxtaWHs5RxogQsuUVYa7
         3hMnGSRSJtii3Zce490IXDMwJtsK9zVtu5yImks6HYobIzb+GgdtZv1ETcSGgp+GFLei
         iDXY8BGKr36smkSxcTdaoI/q0X3q97ygMHFaeIJwX0g8Dvcj9QDnZVWu4mYONF/1qx4u
         N20iOKegiIYv89C/6GM5Y3XN6rG6bTdmnIEU8QJrZxqoyTUXq/zn8jMH2l0QQSaepcDx
         pSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912261; x=1783517061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67QuYRt+j36IR0FVaeM2JIjVJpPGRXJM35kB9AKweaA=;
        b=gzqgmeeQ+bD5fsEYa7GiDWQRf4DBDn5AyXXGesGQdSj9nDuNPDIuNtfTJiZ8gAktxv
         9kgeD4fBJS0ifDUCjW0JaGMgJiiHINAmRADekHwVg1E5whjormKoPpjFW8q2S2ewl0Qn
         QGjhJQRSrnks4nFbSnwm+SNa0f+38I7MdYb4YkVfuwfaMM8yaGbmKFHnfyEHFArwxloK
         qn+56w1Efh49lgpnah2lCgaE/6u9jcAChtpLsIUILU+69xKcRNuP43sV+7vn6opnMgRL
         GPLdV39hsQtj7q9uspDebtGJLWvblhZWwHa/BvuNZ57tw77nv633DXuIL8eY3BGkoNEH
         JB6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrX59mvHTNMeCvOoRnXYiqaeGja7dat3IcZBlIcYq/nkPM8kHTbWeA+C2gGeMD4fQ5nYqIIYN4TnDH9O5Ew@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8cTseErLAn/x/BfeHcbyKW/sFMrogiDkkz6ABhTicpJjcEBFs
	Pw0pzS1mfs161li3+VT1rQchnsjHsUFTPSeY2fVZcRxryRyyNkRCZKW1btPeo7GvaMoJBIuvSMp
	6NhzsaO2kpzGlU5T//vv8a14AAxYvZfXhM6dVFu7Fm5ibV+XQUXG1a9iTbxQ0pMV0UEFE
X-Gm-Gg: AfdE7cnicpneqX/YgWh56EwDclIFf+yLG3CSmqB80J8W2Wg19EsKZ58mtVrzmip/4Bl
	LZnaICMBOnRH2CuczRsstkVy8oyzHDPa4yjpQw9z5Z3KiGvkkfDHGKEDd4wkQ+vQO6tN8+Gx5qZ
	pbLWXjtvS8PSOWBg9mQMvvLpkHv1zNS/bGrN+9U45xDG0l7ue4MzC4I27tFHCMECbRb9DBgcrVq
	RxLQRfdX+BugQAd/K+ynYYhnKmOqE6OM7nrQcQyViC9S6HFEyYC0j7M1Msvfy90+QHOX9/fiLdS
	xVvcKmGwe3NK3L9Pj/LGJfeaghgLn7ddxDTeiN4kx9dlTVlAeUYKZ/VKNw3zNcUi/1II5q2B8p9
	yG/2i4BmOArAhjkg/e81tKVY9DrTw395syNBQl+NgUHXqU3ZqRb1K5DGK45yKB/Emvkck52YhiL
	BdwWRJGcnIxv0i9bRly2/rMWV5
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr269711e0c.11.1782912260503;
        Wed, 01 Jul 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr269692e0c.11.1782912259914;
        Wed, 01 Jul 2026 06:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec487405bsm413000e87.20.2026.07.01.06.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:24:18 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:24:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
Message-ID: <gqy3msdsk3bjupkvq2mnmnksxeivp2now5a2tg4pun5h4t6hp3@yt2c443vyen5>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
 <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
X-Proofpoint-GUID: z0GheXsVDvEZi67uQYYNKp8XbQahztIW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfXy3e6dngg3Dix
 k7raT0GPtJ7WMZEYUB7hgfwXygINW6LLqUyoDcnNKhGLr+S2DEQOro5RzKqggWDnTkUfuPu7xlC
 48EaiSKgx/brHWlJz3Aui/zz/EDFm9U=
X-Proofpoint-ORIG-GUID: z0GheXsVDvEZi67uQYYNKp8XbQahztIW
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a451505 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GaV7wLYTZcZhLFzwE0gA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfXw+69V18ZsKZg
 9yCt7lCP2OaNpzbx7dhUQwPTOTZoHssgnokIH2Hi1RKQ3dZqr1d/mvmGaRyiy8vAwwu+Gc7UFQ0
 81Y4BEydcrbUCO2hUfa4cmUNF8X7nnhCGU1RgZC+eh5M5y4nC+bxDRxrjb9y7m4UnGu7fZiLOXe
 OeNcSvdh6xb0GHHpO13S2F9ZwzkTGI888qcTusAKAzFxYeT7U4PMWtnJJ8XPKulGFDx73q2COSm
 ROILIjMP52c1xRFfDldjH9ZmYsMLqMI8GgbvXlsTOdd+NWpK0CrAqehCD8ZN6/UpBHio+5rti1L
 NIn3Vk5aSvdbLKfxbQalopmq4XgAm1i8uBnlIbVIMoha0V8LDAuzyth6IY8LejygKYhpQfxQ6nk
 LOUXZ2fAvjKBrfPSSMxxg87CL9g7FJn3OP1sRNtT0EBd6mZNlknOZ+AHGBq8e1mYmMJkU7/nO5K
 5sgtQC/Ioxerb6J08Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010140
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
	TAGGED_FROM(0.00)[bounces-115713-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: BEE6F6EE6CF

On Wed, Jun 24, 2026 at 07:47:43PM +0530, Vikash Garodia wrote:
> 
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > Port support for the AR50Lt video codec core (present for example on the
> > Agatti platform) to the Iris driver. Unlike more recent cores this
> > generation doesn't have the PIPE property (as it always has only one
> > pipe). Also, unlike newer platforms, buffer sizes are requested from the
> > firmware instead of being calculated by the driver.
> > 
> > Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/Makefile          |   1 +
> >   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
> >   .../platform/qcom/iris/iris_platform_common.h      |   6 +
> >   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
> >   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
> >   7 files changed, 362 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> > index f1b204b95694..bbd1f724963e 100644
> > --- a/drivers/media/platform/qcom/iris/Makefile
> > +++ b/drivers/media/platform/qcom/iris/Makefile
> > @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
> >                iris_hfi_queue.o \
> >                iris_platform_vpu2.o \
> >                iris_platform_vpu3x.o \
> > +             iris_platform_vpu_ar50lt.o \
> >                iris_power.o \
> >                iris_probe.o \
> >                iris_resources.o \
> > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > index ca1545d28b53..f57af31dbd9f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
> >   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> >   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >   };
> > +
> > +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
> > +	{
> > +		.cap_id = STAGE,
> > +		.min = STAGE_1,
> > +		.max = STAGE_2,
> > +		.step_or_mask = 1,
> > +		.value = STAGE_2,
> > +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> > +		.set = iris_set_stage,
> > +	},
> > +};
> > +
> > +static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
> > +	{
> > +		.cap_id = STAGE,
> > +		.min = STAGE_1,
> > +		.max = STAGE_2,
> > +		.step_or_mask = 1,
> > +		.value = STAGE_2,
> > +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> > +		.set = iris_set_stage,
> > +	},
> > +	{
> > +		.cap_id = PROFILE_H264,
> > +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
> > +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = PROFILE_HEVC,
> > +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = LEVEL_H264,
> > +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
> > +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = LEVEL_HEVC,
> > +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
> > +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = HEADER_MODE,
> > +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> > +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> > +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> > +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_header_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = BITRATE,
> > +		.min = BITRATE_MIN,
> > +		.max = BITRATE_MAX_AR50LT,
> > +		.step_or_mask = BITRATE_STEP,
> > +		.value = BITRATE_DEFAULT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > +			CAP_FLAG_DYNAMIC_ALLOWED,
> > +		.set = iris_set_bitrate_gen1,
> > +	},
> > +	{
> > +		.cap_id = BITRATE_MODE,
> > +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> > +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> > +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_bitrate_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = FRAME_SKIP_MODE,
> > +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> > +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> > +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +	},
> > +	{
> > +		.cap_id = FRAME_RC_ENABLE,
> > +		.min = 0,
> > +		.max = 1,
> > +		.step_or_mask = 1,
> > +		.value = 1,
> > +	},
> > +	{
> > +		.cap_id = GOP_SIZE,
> > +		.min = 0,
> > +		.max = (1 << 16) - 1,
> > +		.step_or_mask = 1,
> > +		.value = 30,
> > +		.set = iris_set_u32
> > +	},
> > +	{
> > +		.cap_id = ENTROPY_MODE,
> > +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> > +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> > +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_entropy_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = MIN_FRAME_QP_H264,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP,
> > +		.step_or_mask = 1,
> > +		.value = MIN_QP_8BIT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MIN_FRAME_QP_HEVC,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP_HEVC,
> > +		.step_or_mask = 1,
> > +		.value = MIN_QP_8BIT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MAX_FRAME_QP_H264,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP,
> > +		.step_or_mask = 1,
> > +		.value = MAX_QP,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MAX_FRAME_QP_HEVC,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP_HEVC,
> > +		.step_or_mask = 1,
> > +		.value = MAX_QP_HEVC,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +};
> > +
> > +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
> > +	BUF_BIN,
> > +	BUF_SCRATCH_1,
> > +};
> > +
> > +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> > +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> > +
> > +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> > +
> > +	.dec_input_config_params_default =
> > +		sm8250_vdec_input_config_param_default,
> > +	.dec_input_config_params_default_size =
> > +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> > +	.enc_input_config_params = sm8250_venc_input_config_param,
> > +	.enc_input_config_params_size =
> > +		ARRAY_SIZE(sm8250_venc_input_config_param),
> > +
> > +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> > +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
> > +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> > +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> > +
> > +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> > +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> > +};
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index 6a189489369f..bc04831ae7fc 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -39,6 +39,10 @@ struct iris_inst;
> >   #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
> >   #define MAX_HIER_CODING_LAYER_GEN1		6
> > +#define BITRATE_MAX_AR50LT		100000000
> > +#define BITRATE_DEFAULT_AR50LT		20000000
> > +#define MIN_QP_8BIT_AR50LT		0
> > +
> >   enum stage_type {
> >   	STAGE_1 = 1,
> >   	STAGE_2 = 2,
> > @@ -51,8 +55,10 @@ enum pipe_type {
> >   };
> >   extern const struct iris_firmware_data iris_hfi_gen1_data;
> > +extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
> >   extern const struct iris_firmware_data iris_hfi_gen2_data;
> > +extern const struct iris_platform_data qcm2290_data;
> >   extern const struct iris_platform_data qcs8300_data;
> >   extern const struct iris_platform_data sc7280_data;
> >   extern const struct iris_platform_data sm8250_data;
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > new file mode 100644
> > index 000000000000..393256f39112
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include "iris_core.h"
> > +#include "iris_ctrls.h"
> > +#include "iris_hfi_gen2.h"
> > +#include "iris_hfi_gen2_defines.h"
> > +#include "iris_platform_common.h"
> > +#include "iris_vpu_buffer.h"
> > +#include "iris_vpu_common.h"
> > +
> > +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
> > +
> > +const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
> > +	.firmware_data = &iris_hfi_gen1_ar50lt_data,
> > +	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
> 
> unlike gen2, gen1 is calling buffer_requirement from firmware for every
> buffer types. And given that call is a synchronous call to firmware i.e it
> calls and wait for a response, i see it can cause delay (and infact not
> needed) if called for multiple internal buffer types. Can we see if we can
> call that call once ? That call to firmware (get prop for
> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS) fetches requirement for all buffer
> types.

This matches the Venus driver, it was querying buffer properties for
each packet. If we query buffer sizes only once, what would be the
condition to re-query them? One of the property updates? Which ones?

-- 
With best wishes
Dmitry

