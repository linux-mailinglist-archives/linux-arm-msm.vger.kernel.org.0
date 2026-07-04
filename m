Return-Path: <linux-arm-msm+bounces-116436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxZvCdlPSGpeowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:12:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8170706362
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jqH/gDDg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CsMR5P8g;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B829C302769C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250F642A96;
	Sat,  4 Jul 2026 00:11:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB417262B
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123889; cv=none; b=PXkY3Sfj2sS/ZrYkI5MYRTJu57lthHXgiBtKuqHV5Uzw+6Kj0bmBDtjKbkvoNk8xn2e8oXQcwyasDaytvZ9cg5MRyZeo9LVbmER0ghfZlV3hhjwptuLVNP0t+OgqjiWQVtbIRzsBIYapM0ndbRAcvImsniVHwLCerGZsVLJQ15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123889; c=relaxed/simple;
	bh=EFAk6omUFHjXLhMkrfuSYGKNX01S2aDtdDFlhsFz0BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3gHw3rzLCPF3Q7SEzX9iDvkjjYLR41Hpo3fFmsGE5yrCuAtW5ZrsxxJwroO/11scndn7urBMUTyvhFXR8b27V4YF8mEL4wOrUMBfpvzLJ0VIKUrIQdZUQVHIbfITksXRwfXoAZu5q9Tq3YHk7PT4KCqztkMyxnXlOWi0TnsVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqH/gDDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsMR5P8g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPqQx1029609
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SS9o9JjJa9J8UmJUhMCdC3pi
	ejIqkiHZHZsGM8TZo4I=; b=jqH/gDDgQpSmr0oiD7c2B7+Uy/u2O2xzv1nDwpCb
	u/muolKwjlloLviJwSabzZkVEbbNbPCFvkXNCtpIn5kvtOI7352zMtt/Y9veMXp3
	EanpFIr47wfSD64Kn5k1RoFrMe41SqBclav/V7v/VKtkxIajCg634wltUnAZLOBA
	JlB3gGld8AWZGaQtX/eUd9U46dDHBgNDruWhnXh/hcDI/lq6MT+C6RY54HGSIBCq
	zOKeIUbSht+CGJ4SzzgSpwepcvLnjUpgSCSgGBxqOqbxFDz8ZLCsrP5u1f6KEDlG
	z3CDSefoiJJZF8QjXDgerPmnLl9RMd47IQ3EXrwthch7ww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm1mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:11:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso9291191cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123879; x=1783728679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SS9o9JjJa9J8UmJUhMCdC3piejIqkiHZHZsGM8TZo4I=;
        b=CsMR5P8gy53vwTnWTTETcFSxzb6tCzdEHyCIvxaH6bfvqwOoJaLvR7FgthR8wlzYKd
         im1na3qnqcbolD5WowtpuYT+BKfpIfPIxMGEzcFYFeaUWpUQae3td/Jg5IAAn0GEzwrq
         X459DWAGFIAxCUK0beLd++UbQtL3kdYf0ANlE2lpdpPQHI8Vjb6WYoRktqGrqeVT5DMS
         3VFmxhqbl9UwD79ovzNJdSW/G5qvtMtgZzovLC6vbzs4w4avlFmIjxIvNR7LLmVCAhdQ
         1XO7jqC2N4TgjTWapqTuOBXz8IApUz9NNZZG4o/e/MhtW3NVYjsDBhr2LIz0r9+9Neh8
         LJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123879; x=1783728679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS9o9JjJa9J8UmJUhMCdC3piejIqkiHZHZsGM8TZo4I=;
        b=PLmWj9EGRajytWHbyDycUHxMQdbaAqC9sQ9RzEhuvbYrEhLSCZpYICYulSe2SE2T+5
         lPUtmGw1cG+cXSWX2Llr/9cvvTlMozK/fRjXG0uiALauBrQIm9bAFIsOomTAU/b/uvpB
         vH/zENUC2a1YSBVzYVL9wnaH9gSc6QYccW/pBb7AryX3/kQV0NRjdrtlu8hkE5M7lbKg
         z42Jz5FlOBqqK7xPkZ6AEa8EH/4O4Pp8mcWoKbI+I5nMNm3p2MROBYWEYiQ+7mecxUjn
         9Zv8PL7R/2mTASERwQbn9BeclSsQ+r0ORNHk59XW3E39SGtnTMzk7CNX4/Dmv7M254Qq
         ruPw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ejs0PnpwlOHbYt8c25lYZT+b916lTARi/AB0z8shWQwT/TUpRj+AoGBGM7DRnDIF6rWsXV3aWQuuzHxX7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPVopwteT18n+3Tcj2YUwUEyJJNB1oJsz1rgFFai12hiaK4Fv
	IahRaXWJIs7FmXrPIR4vlNZ+1ehyyMVZ4+lMG5dk214zghj5qU7fjfxnocfD/R+VjKyizu8vMEj
	31tyhrWh1g3Q+v72tXsFlz3FS6DPaEyzXc214jFZa6J4etH7LvXOipPzgPCX3B9m/F1HW
X-Gm-Gg: AfdE7cnYRm1/KCGmbxpWu1GGH6WGSovxCGB6RiIHFCMds9OEAeuADuHGPOYLnYyETuq
	vhVIToRwMY8DuCScWpZFtLbg9NV+tOumIcu3ytcwV171iqhO8tgaWaxkY53NhTP8ayc1mRqI5u4
	cA0SaHi+NNQdeiTAdQU8J96pSmD2OzUh/FLBDwkiCLPgtZ+azT/xfoO/nhj+Zl1UwH+ch3rHgfI
	FoBvlf4XzsLNgK0K/B4ESO8gnea8dfjEm8zqq+w2/PTjD+hQPTziaGdA370HUUTeS0BEDC/udAz
	dAicZv47tmh1uZw6uU5SI1Duc/q6r0Ua5FBVTpLuEbFkBWKBaM2ywE6DDr2Q39eJSwyu9zbwZPq
	g4hOfCGUOdFVPaB2a5IwubyBXwcXw3ApEqwnrXa+kFmCRjeoNzwpC9XIh7dZGnyaBiwBAcV6R/c
	gUb81VGLAWT8luzh9aehEmyyQh
X-Received: by 2002:ac8:58d0:0:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c4d14ac8fmr17562781cf.19.1783123878999;
        Fri, 03 Jul 2026 17:11:18 -0700 (PDT)
X-Received: by 2002:ac8:58d0:0:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c4d14ac8fmr17562351cf.19.1783123878517;
        Fri, 03 Jul 2026 17:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad39f41sm5309571fa.15.2026.07.03.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:11:16 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:11:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <ynhos7h4x3kbqbio2gkigoo5rqbwogrzihkylxv5pqjtqpqmnq@rlyjaiopx74a>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
 <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r>
 <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
X-Proofpoint-GUID: girZuXHgaUjjx9lRK4GOTf2sdzcRwF-3
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a484fa7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ngL9UUSe-LbVx-9XVVoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: girZuXHgaUjjx9lRK4GOTf2sdzcRwF-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfX73N7vXbuwHeN
 NgnurR7+p4CvES6vjnbeFa5JZq2ChTUog6MuwhHpY3O1tqqX4Jp1B+WfQ4c05/uGorbZmhPcrHF
 40yG/3xjbcyOUw4Uo2LPxNNsu/9ML34LH/mLdZjfpjte7gr41ecQHCcsSD8kyOwFqm5NU0fH21p
 JZ7jiRhTlzFuByUrt6afWX4T5e4qQx70eK8fB19A2eYIhkAJLZoMeKwiUzS61sAS6ItI84nNxxI
 ULd7/sYPR9rQDYnRuJMvIP2Tg4UytFBDdwWg+VlDW9tlycxUtZ/uTohFie375VhrdU/36FMNS6J
 5TMTZ7AlXaFEGnu79muRitQA372c0OjaJ2U22q2VoAbz090uonRSW/emeTpezh5j5ssDFZcWSzl
 XgZ3j2cc6f60GtFiGwYHdm0cSEA0fyfijrxaSdYnHJP7n+8W3PINZ+45QF1DmZAEzylFqmySAk9
 lVUMGhTUH3DS1oCGRXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0NCBTYWx0ZWRfX94dmsRNd2LTC
 eooUSmq2xn8bHHtkeB2X2YTwDMsRetkIWONeS1aYbRRPrwUoZIM9k9ZTvJRhigjCssl8c82m+9Q
 rdgdSX44eVPmZuvrqa25mR2F/XgDRi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116436-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:loic.poulain@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8170706362

On Thu, Jul 02, 2026 at 05:08:56PM +0200, Manivannan Sadhasivam wrote:
> On Thu, Jul 02, 2026 at 05:34:31PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> > > > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > > > > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > > > > sequencer rather than a dedicated BT enable GPIO.
> > > > > 
> > > > > When the serdev controller has an OF graph (indicating it is connected
> > > > > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > > > > connector's power sequencer and use it to control BT power instead of
> > > > > the bt-enable GPIO.
> > > > > 
> > > > > Also allocate bt_power unconditionally for all SOC types since the
> > > > 
> > > > Can we just fold it into the main struct?
> > > > 
> > > > > pwrseq path is independent of the SOC type switch.
> > > > > 
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
> > > > >  1 file changed, 43 insertions(+), 38 deletions(-)
> > > > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +/*
> > > > > + * Acquire the M.2 connector power sequencer.
> > > > > + *
> > > > > + * An OF graph link on the serdev controller is only present when the BT
> > > > > + * device is attached through an M.2 Key E connector. In that case the UART
> > > > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
> > > > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
> > > > > + *
> > > > > + * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
> > > > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
> > > > > + */
> > > > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
> > > > > +{
> > > > > +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> > > > > +	struct device *dev;
> > > > > +
> > > > > +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > > > > +		return 0;
> > > > > +
> > > > > +	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> > > > > +	if (IS_ERR(qcadev->bt_power->pwrseq))
> > > > > +		return PTR_ERR(qcadev->bt_power->pwrseq);
> > > > > +
> > > > > +	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> > > > > +	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
> > > > 
> > > > I think here you are looking into the exact details of the other of the
> > > > graph. There might be other devices on that side, while the code now
> > > > assumes M.2. Or, consider having an M.2 controller which handles
> > > > W_DISABLE2# internally rather than through the GPIO.
> > > > 
> > > 
> > > This code only deals with M.2 connector in specific, so I'm not sure why we need
> > > to worry about *other* kind of devices. Let's worry about them when they show up
> > > (with graph interface ofc).
> > 
> > I don't think we want to go through the drivers using M.2 connectors in
> > such a case. In the end, the contract should be that there is a power
> > sequencer on the other side of the graph, but the specifics of the
> > connector should be abstracted out. Do you know, if in the x86 world the
> > W_DISABLE2# is a GPIO or is controleed by the hub.
> > 
> 
> I tried to abstract out, but Bartosz didn't want pwrctrl APIs to do that level
> of abstraction as pwrctrl APIs should be generic and should not be bind to a
> specific connector and exposing its internals.
> 
> That's why we ended up having pwrctrl core exposing the 'struct dev' using
> pwrseq_to_device() and letting the consumer extracting whatever information it
> needs.

Do we have other ways to control M.2? For example on the x86 systems,
are those signals controlled via GPIOs (or GPIO-like registers) or are
they controlled separately by something like M.2 controller? Or do you
have an idea about other non-x86 systems?


-- 
With best wishes
Dmitry

