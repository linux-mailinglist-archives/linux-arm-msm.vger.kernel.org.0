Return-Path: <linux-arm-msm+bounces-100885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XfsIASXHymn+/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 865BB360042
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8063C3014507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595573D6664;
	Mon, 30 Mar 2026 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9g2ffJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtCXWk30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FDB3C3426
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896930; cv=none; b=SC1YAuwk7CZjNy4vi1vQ5TLsOPAU1aoVm6KmuuH12zV3LSFRGG/usUFhncBc2C1gnGi38otL6vdlhfJNDmaDcp9vm4ROs/KWm7ydNJ+3lAhtFKmrjNYJHXtaf5mYnKqPoJ2fglt2XNyTfoF6HsVGlGUsjrAhB29vpcMXvXA0YPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896930; c=relaxed/simple;
	bh=lGafHO/0r8WWuHXe/cXHLeBbaM19s3GZJJKUga4SWRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em3M1a4G5SyhitVhjsuY+QcCAEIAYYtR53gZd6VJDdzTNuxs/6PVCXXfjYpDphRxyObF3Gttml0z702+Zj4QPqbtP1WtpQ4mwStl8W7t6SnBQWWmvFIzU0E2kpqOy7JWwRHrB6qCzy5o5yFut3o9IBDmcGdGLVV9eybEUBHoPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9g2ffJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtCXWk30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF8YFn3539578
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j0H9FaWAU93pFITtwnjoYm1P
	ksncwdbCPSGTYYrDU6M=; b=S9g2ffJN07rxfiBSAuPyINoDRi41z3+uf5HL/fLT
	LdXcTsi0p0YeGGCzNlfMXKO/0fUWi0G009ec3cKgPDUZ9YSk11mvB+ha8H9/9l2U
	WZq3od3gACQ2+DTc8mM7Bjsj+S3+q3+cewvAjaf4p4yADJUlXdfYnw4349NyjSya
	xP2kJkkk45dCOfeJzX8RL6pcx2JAH0uA+jN6sRhw8OJHM/eUqTq445MBuxwfU7yO
	iNwi/CdYuB5qgNUEXt0vGaNeOBa+Farp2Fw++MZV7IK9QbCtsy4coZAFMBq4QD74
	hrXbb7JBB9/0bqFERsvCYCb/g1momcwzdCGM5S7N5TZDqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59t3j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso65219081cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896927; x=1775501727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=NtCXWk30mLkQaKm/9v0RRoRQlZ3ERswghlP2/7hd2J8gLsxJHhjImIzRFu4Kx6KLLH
         5FnHZgp0WuarePAieJfGmbb3QHFRh18S57m9VChU0HpdQdjKdKZYUHWYOXyNUR309xNb
         Sa2WD83898892P3yYkKW0u3KaSFzZprdD1iLB+XuRd/0mn9asNyP4UGt5jad5obhevIn
         o0fHlYsJuQqe28JZ3gB0oHiFNbJKqelmG5vUZ89ta/uFtjaKG0etCTTdclNFlHvaOlEE
         mc1UuofBdMDPpY4qHPgq4D6JKJFU7CT+ixUck2yLjW/ZylS9uSalqtmSuJBNzhQ4mUay
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896927; x=1775501727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=FYUJW8v+OMwySxvPJYo5/+H9Iwv8vCE5SZ1yLuELfymU7wBwOB3/cXEbc1DbNmTo8t
         hppkiIQLVicG1rsHiGVrj2uXpkj/xVmQFlA4oaXu/sIOMHnTl4YSHwQ+43iYPwIzX+2C
         GSGE61IBwrDwPHMh0k6Mooxpt3EGQoJ9XpmTyakG6RF3waqDuuBRFjvqmv5DovJg6lWr
         PUAGKqR091NXhMLFOVlhNp002OLO+jeUd7bH135ow6BfCn0177YRhYZrziBvb44VXYU6
         1m2IYihbjGNIQOVfO4ny6GjSv0iWXSvAkbamyBSO0Jko8r42zUusygkbU2kI2AlaVJ95
         opbA==
X-Forwarded-Encrypted: i=1; AJvYcCVpiRw/ve0l6trVBRhRN825Fg1FVtwcFRKxqVIfBT0trdE6SXmpn+U+fLfRe6/e/YJjkPJ/4BJIbPPrnq2i@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKDhCC447hHsqqvQ+pfHZiMpCPO+1VtyJZ052t0cpvg1mMM+1
	PhO1psohZ9bmb80bRgr6W050TwiC0aY6mq1QruVx3deZCH9gm83v+wlugM4HZUHcnXMa/sq+h0l
	5EYAmnm0UM2vVtbXuH42c/fHubgQYqmar8FeS+gsaH2DS4cbI+8yM3KelNh3gBY6dhCab
X-Gm-Gg: ATEYQzw19AOdHoqHk03C5nOhrBV52lJPmVhtx8WPfyEZIvJEVLObJ/snKAEVJnG4OKA
	kpv2AEOno7lUDYrKaZk9OpjvvbnaDmd50WRQOMYJBPuzFih9TKBQr6XUFCFVMs5sdXrjec202XG
	0R3y3Hw+n394/17QkMhLy03ct34adxXS023XtXhWfJcGljFlVwcTZs4tBZLUV4PEQ4lfin1sNl6
	czlytlJ/+5OjYkgmpge2gAASn922D3yorV4CWICVuyKIu3UiY8IbnP8Z9gWpewwOD9+wy4RqFxI
	wnCHkA7W2EyyvcFH01ivCFXojOWfU11vaXW7p5wbNUa553pyI8o9z1BRVirjvUFPfwD82NShVyH
	kS0cDLqzFBBrwclDfBqgMRBSP/Gj+LOsxe1hNXC7p3az3w65PmSCK9ohbF0PRqDBE1yd0ucXY7O
	ieCiB157FhB26NogWMjsCL4egu0omxcduoUB4=
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510691cf.41.1774896927322;
        Mon, 30 Mar 2026 11:55:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510091cf.41.1774896926744;
        Mon, 30 Mar 2026 11:55:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145de35sm1839702e87.74.2026.03.30.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:55:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:55:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
X-Proofpoint-ORIG-GUID: FH0QUG8VqxlYgmP5lSGYioCTACiJsfUm
X-Proofpoint-GUID: FH0QUG8VqxlYgmP5lSGYioCTACiJsfUm
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cac720 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Lj28aCL1S1MqH9smhIUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfXxrMBUq/2kkhQ
 ZugxaAsbgWW0Sz/YXj5AgI/9kG09HzLRAkQ3lFufe9kMTEkPofZVE1XyZHFoz8XbMcUc607B1lo
 Tv6joiKoplfcVflOg7/e021W/hsHA3CkaFMMrcbgyBJJ4Y++0wqIFV9uUGBZJn6gO8WMgTylVdq
 vNj1iZQNil+bNiKP5+A/PmcoxQdVU0KXncvPBgQHmcFRnIh4J3xxfGnrp/KpLDNCI0qswFmGHFe
 eHMoJOKohTCW3rO2I4jVRc+f0nc598hHlUcEjD1EnkmjE2pXaraQu23lFF1DQQ2htlTqtw011Gy
 d6pmuUm/thAtfxXppWnzLdSbcQ/EskQCcdbMuWEeIqFtNsFn2wbZvKLDr2lZc2zmdubQsPcqMDf
 DAqDUv4W1V65NCJ0F5Ofi7ALdqDMvRrAhoWiZnjEGcxPNAYQg82JUgpbUytkMDPjBPfonLoGUfu
 DCFnjd8KczRsxMaH2OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100885-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 865BB360042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:11:58PM +0100, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
> > > > And then your CCMv1 or CCMv2 helper will get called with
> > > > the matching parameter-data.
> > > This leads to userspace having to know exact format for each hardware
> > > version, which is not nice. At the very least it should be possible to
> > > accept CCMv1 buffers and covert them to CCMv2 when required.
> > Yes, but a new ISP may also have a different pipeline altogether
> > with e.g. more then one preview/viewfinder output vs one viewfinder
> > output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later
> versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those
> structures.
> 
> I keep mentioning CDM. Its also possible to construct the buffer in the
> format the CDM would require and hand that from user-space into the kernel.
> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want
> to fix to the wrong format for OPE, introduce the CDM and then find we have
> to map from one format to another for large and complex data over and over
> again for each frame or every N frames.
> 
> TBH I think the CDM should happen for this system and in that vein is there
> any reason not to pack the data in the order the CDM will want ?

This sounds like the most horrible idea: letting userspace directly
program any registers in a way that is not visible to the kernel.

> 
> So probably in fact IQ structs are not the right thing for OPE+IFE.
> 
> ---
> bod

-- 
With best wishes
Dmitry

