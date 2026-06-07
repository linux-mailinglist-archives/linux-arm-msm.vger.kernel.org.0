Return-Path: <linux-arm-msm+bounces-111599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y8bvLmbXJWpSMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:41:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1DB651859
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Avd8w0Aa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XilW9kF0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B241130022F3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5400032ED29;
	Sun,  7 Jun 2026 20:41:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAF32B114
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:41:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864866; cv=none; b=CE8wSqEwe+jLqI5WPk1vWSDhjUCrQ8QuVrUAVQDnQxLO5gIx+vlrUASOY5+raChoKx00vxK9dyAvHiSB28snwq8LNyDN/+uEXn0Cm1kPePvuA6zhaq/30K+VtEFJhRCFazrLb+7RderT+R5+2RhubNB2BsWNEItXAZtkVqZT/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864866; c=relaxed/simple;
	bh=+5m5rmf3V+hkSK5cmgnOj9hQ9UxG3o/gjBvZp+APxu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tshs289LybsqEsc/Eeo3qGn8DTtNSbMgxT0lN7JW/3YpH6cWuSJvkEYibMzLf2VM96ED7kQP+nvHRAM9w8nPnBntcav02qFGusI2znukYhCL8tiqnqACPLm0MbNhSNerAgLA2e4WsOH2+QZZOoT6QN25sdg9GLxKGRGM0VCY7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Avd8w0Aa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XilW9kF0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ejd5f335142
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CDWHOHut/TY3vww+eWtSsc9l
	NQKtXLnMeJFWCV2612Y=; b=Avd8w0Aa7nI1+ZDGfb/YFyJ/NWPbYvoJZAC65wHs
	7RaQ/DkIa/0Ei370F/w7xNCugSRbKvqbDN696VMiE3H+sGutCJEIE8Vxysugspj2
	8wIAcBkwoHpzX20QZhuvvcRFLbXawncxVasm+2+LXAutO2q0l8NCdFrrqRuM5GPg
	Z7VO2Dybq8UMAkqOJHBJFjSv36PbQq2UllWSpBFwuP2LXlyereGpbqM3dhmlbnKc
	GNnce4bzN7hn4O4mos8lze5bb3b95MBmOVtjhTBDhlbyz7oe6ldcSnese/BD1D2t
	F7PveVeORrqh3Gt1ashzcErRggdpPxZmi9RtMwEgEh1UvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvee2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so101620181cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864863; x=1781469663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDWHOHut/TY3vww+eWtSsc9lNQKtXLnMeJFWCV2612Y=;
        b=XilW9kF0FVOVK+57fA7zPE7Ox7vuBMu6HXe0An+QygHl5NXjnIutb1NoBAdzfRhF4y
         p3qhuRbBtVzihJSoWBW/mESSuLhQ5ByNy/JqkjWdbHP/aH0TQF8LgZPdQ85ubopLZgo3
         JB8Svlfk+3Z4TX9iKqU3weY3sGi3zzCRVKulbUBD2ZtGMAQwuwRe6IreFYeoNcWZi52w
         3TPEoB1MfDb/y4RrFIHFaNjnQGqL5xiMEI6tYJZxCp58RYegUNl/rpOfN4hrQF1yHWSC
         jj+do+x2EF8+ENUXMz3qFYjmFB0DSo8tqpRFejpmA05qvENHeEqsBTIxdKYU744P2RW5
         9eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864863; x=1781469663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDWHOHut/TY3vww+eWtSsc9lNQKtXLnMeJFWCV2612Y=;
        b=XUQJLyAFxBQxeOYpoKTKuVeYwI4QY+uvoGQWELdhyfiLX96/Il6o2jDdTzC8S6RJmS
         +2dOe54xRiQqbLX3aSxmHJ2U/YAxHYm5C4Cte+fxftr2X8muoFQ8d2WiqSOhxBWp6vRK
         kSv+j3VcHRlMAtnke0/vMdg6MRkmqHzYqdyS2YFAfaMFqOweKQg0Ck5kV9U8faBMc47I
         qZXs2xPzcKFExB3NvlTU2fHM/eDO0c34ah0ahWGwFCvpiXwiXqZmy8I7ANRwHZdKHAih
         FxTc1yQmrNWF1cxzjs3/YjHzVmP80wGCoOU1sSFdi52FeoWuquyHSTZvcXZ5O4xj5rW9
         pVqw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ln07TR9+b5858vTDwcY+IgAWVVagcSh8XQXqFZ788LQKIR1w+TTQB29Uyw+U0AmpA/VsuuhIOcGlQ/i1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3XxYiUgk6xxV7doQRIT5CGWhyKoA61zZhDa88UZkq1w5vNvV
	AFRpCOCQBdIzfltjmgeH3rsdNRG3t1NPVbF/mVrFRZ0LEgq/5GjlnKBSegpFxApC3rezFPJAB9+
	k6LqMNIqoA20BbovaXniHh9veVl3R8ZLbX8acaFJayGdYVReHZ0knhkkz0LHVChis66Wp
X-Gm-Gg: Acq92OGM86T4hsNAEtG1ggn/nGKrRe71SosYA3OydA80GD6rxAjB29g3ro+ELX/rV7j
	b58BYw8AF8u/FCBa5bE/0fMbXMdODK3uRjeGhBeoX5eLHoKrumK7QvUfity9C2LNN9+V1tqvZDF
	/2lM3wDEEkuUUW/NbRoUWiekuy9FVR7PLAhhu8elzEN38CPfGGfiAyG+LzMuXnIE7Jux+swqy9J
	WZZ1z5sOMqGWS7FpHHJXLerLKHoyV+SztE2opdp98UhgKVP36nyZ8sTh/msndOGg1UOUtiZtOE1
	MGBmWsCBpno/h+Vx9eBLSaK2qX4MDKmu9haRqtY/I5XaPYDTYdbjBZ81e0dgMwo2kPy1zpL50c1
	74Gu6h3jg2Awc/JoiSo1LeqJMM5nCDGq17+Zi98batO6M+R5rSuDPJpg1MagT0xGekl9KCKU5ft
	l2y4xCsBggpKFSqLEUHrVMZNmlTV4TwmiOyfnQxDrCXGs7RQ==
X-Received: by 2002:ac8:5d46:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-51795b72876mr184852171cf.10.1780864863029;
        Sun, 07 Jun 2026 13:41:03 -0700 (PDT)
X-Received: by 2002:ac8:5d46:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-51795b72876mr184851961cf.10.1780864862686;
        Sun, 07 Jun 2026 13:41:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66b1csm40909481fa.9.2026.06.07.13.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:40:59 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:40:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM
 check
Message-ID: <lg62hhytb4z47jrlpbkr5bwrxyo4cz3z3jkxf6vahuc3rxh545@kmae5ujp3xpi>
References: <v2-message-id>
 <20260604082510.45733-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604082510.45733-1-dennylin0707@gmail.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25d75f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=TPyWUj72fWjUZVaPtgwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XciNdvqr1cAlCNhhfs53R4xvSC8-mfUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNyBTYWx0ZWRfX2L9NRLJzUpXH
 Z/NaHBtYNHKA0KiUlZiIFWsAy68OCxLZwgHy1n/nJKdwvppBVyOK2O1kRxaqEqT8fwlDEEIl9qT
 t08ZYplMButgf6ndw3Ld9WHg/nNuLNfLxOUJkMpDVdRwl1GQNEL+8LxfHY1yKjFlVhkhYBhjrB7
 ViNGxUdvQcF5E3JXIOEiNPpmNBKm4+64kzX0Fbz6JOX+sTqV+gBUR6ZfOZIz+gessVQ0+hMXl+Q
 vL42hg7aGL95IHSwttob8fP0vm0IQpSJQNOcu3fCthaYirOdXoKY7ik0jMwoPIxoYvYm306JUH2
 K9ZJ3mpJsjSVtDoxA3dmTGCrNVB3XhcUyhTzo90pAHJYQgKwoWCxEumNopPbhXlc8othgrRtThN
 +kpWJYuwvEMdcz7slF/I+fuF/1+aMQCRCK4S5M5Dmnn/3e5q4T4WCx40vjQvG867QOd2E0w8HcK
 TeFcdhDJoJgpc/EurWg==
X-Proofpoint-ORIG-GUID: XciNdvqr1cAlCNhhfs53R4xvSC8-mfUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111599-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C1DB651859

On Thu, Jun 04, 2026 at 08:25:10AM +0000, Hungyu Lin wrote:
> Use pm_runtime_get_if_active() before accessing hardware
> registers in the threaded IRQ handler. Skip interrupt processing
> when the device is not active.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

From: Denny Lin <dennylin0707@gmail.com>

So, what is the correct name?


-- 
With best wishes
Dmitry

