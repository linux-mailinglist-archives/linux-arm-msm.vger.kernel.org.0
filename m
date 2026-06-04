Return-Path: <linux-arm-msm+bounces-111215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ak+HNj9/IWrvHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:35:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F410640637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lixbj3cc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jp8OkO0P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F21E7311306A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688AD3AA1A1;
	Thu,  4 Jun 2026 13:26:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E33C7DE8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:26:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579565; cv=none; b=d5b21HfzuTaIfj8ktrbhHXjWOEwCENzjdO2Kq2zS5JB5CJo6JC7H2WlT23IjHJu/KAcCckuWqmLnUy+3ARTAQJRx8CCa2bN7EU/5hoi0vs+WESKULRNnH1cJZeSC2dt2Is7WsoTTJMHb9O+cl5AUQ9kWRRypnji4uORU/fklHUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579565; c=relaxed/simple;
	bh=Bqp1Fmjdd+OA4loVZGKvMjBGhteeRB3CvpMJZRmvFeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1aq2Cwl4KgQYXJ31H8WHp6a2aeGRaam0VxrIhDLekldV3Cs/Rkkx/FbFMn1mD4ntXBxTBczDr7lzy+ifSLKMP9bdMN2Cm+fXD9xpvm4yHLxw4bTJuLUGqIbrhgYnwLiR1wCJ060CZPpxK7HgasuPWGqc3rc/TZK/hSpD2s+gpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lixbj3cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp8OkO0P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BKXPP011974
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WDlrN1kvsktav9PmIfA7uNaL
	lErcQ7NjVXu3Ade2t7c=; b=Lixbj3ccTkdXrf90jeQ3yheX/Vm5ztjxBc1vxbEI
	s2x1oEFNzTCFvf2wkKAlSZxRL3gvV9HC8x4rFfIR74+K3uqKyPMTGWTvYRbfrqmh
	K35T1pQaz3YoDfsOg+IWoxH0lJ25HMTzv1+mfmyujTmH3xEsY3Fqfk0gyDmJH5YH
	suGkfCpXTrSwjuI4KB1RtqQKv4p6qMBXXCz59RB0FKwwyeuOyhPpqtZPJlO3T8uP
	8EVSdAwfST2ilchi/QnozlzG3KSCLgaoGZagfZHmXynFlGVjMkapruz3GzfeuXqk
	RhmsjK/M/jUuahEJMVsjQNIkdykGSBNsvD1aRKq60u6s+g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc0fqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:26:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c69c788ce7so314252137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780579562; x=1781184362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDlrN1kvsktav9PmIfA7uNaLlErcQ7NjVXu3Ade2t7c=;
        b=Jp8OkO0PjUnbkKX6r0n88zVyB/u18LwbqBfZQrbvq1ZEBrGjC+Cu4qrSFqLmvl0P+F
         2pmrko45kbqOsdEgN2AGiS+xFM0UsyEeqeyssrVGsRixheA6LWr+ckCTHQtoesWya93m
         MJJ4O+Y5uwUJAkyA1d0Q519HJVLMMp3wbAO73ZxSaxbrhrD1gsw/4oJm7rFgUFHd9VF4
         C2AbGMZo+vPmQlXbVXZ6fpBueuBdw4rSaSkjpoeeBamqMyyADP5SInvOelavuJpBU7lh
         Y6baw7RXqVaiV97KeSww83HJVUfMmGQYNq9nuL028l8L0WtQnM4TBUrkhSdkjS1RMsAV
         +bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579562; x=1781184362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDlrN1kvsktav9PmIfA7uNaLlErcQ7NjVXu3Ade2t7c=;
        b=bIDwLZeukwd6AdPZkmaN7Dd6HJN4BtUrM1oKaT3nvuRz+8Id03zEIdqLRPDqOwfi2j
         pf6LGRtXootnTi2J32wMCyRsNPcslirdlUaPzqlr0ucYKfXh8hEh1CE/dNdEEDb2Tq2w
         u79SxGw1Iwfwn6zIJnYE3Mft/C8fp+mx1SqKm0aSXY+1NCzccaPHFBVBx86ioRgvdIAw
         LfCZ3COeD5NRHqtD6UrN4heOMJjGvaIlXOlrNJ4bteMzsC8Sbsi+8HZ/4Lb4OyDrqiAY
         xi5rPDq9egvQKAUrAzUwDjPsFeAPMp4yMIy6q5FbUsY1sxD0aNHP/70/eb0ssh8cdm43
         ozOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ItuCRxDZwafSgtZimcM+XcbptHXzXth2ThSHAxOdVeXMqXT81TQDNyh+HRwi2inPfektmmKBnTgvNxhYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXyeRsQ9s0Zvoa9VMwrE7oIlmmie2HeNKeJ1DDKQv5EJIWxGQa
	v9g3cLtcJB7vKqw1d93uGIQdOJQHgkk5Z2v/F2CvSf8R5nxXBSWjvmt5MLL5GjuOL35NtY7hqhC
	iBbpFTHX9UMvzhhUpmLKWdcXwCIZclMelpPksXSo07Vu3I/nyDtNm1R9DJDWOyNiU+Ieu1AVvbM
	gqBMW4xQ==
X-Gm-Gg: Acq92OFiJaclnylBzQI6OC/3+0RtyfcRFYw6SxfHeAbt+hFDUE3/OQxeUjyl4lFxanU
	6pt/ctuI6xPbya+d4K05Lfa2fKA4G29Ey7mAOtdf5uZaD61WBjJjfZt7DnYx6JnLY0WcsH2EBt1
	N7a0Ilj7ky1ZM55Svqwgf8Krts77du5vDNfbR/yEKUgWlGJsr9WOeT5FI3m/pEI9Ljq8ibLbKrx
	61OQYePQyMPO3DZj41n7WpY0CA2M9J9Zbe34jGpNnoxwg/P7K2iY/sxFWZmwooI8OKj3VChtPZC
	l4rC09zH0438XfLXEz7aA7xvzMwil35qbBM/lkCMtB9q2mnzNuJ/C+ftejiKs6+DNF9Z+3No4rI
	eza9PnlSW/ub8N1FoQU1/sZrZQ4qNLmJRF1ngF1/rsj4+fR0ooOtKissqB2rQy+vCAepeSbxhXw
	qbag0cfvRztsJ608WY4HC5oOzwYPbJowr4nGmK1rN33n95nw==
X-Received: by 2002:a05:6102:2ac7:b0:62f:406b:1baf with SMTP id ada2fe7eead31-6ec473f5d87mr4742983137.20.1780579562459;
        Thu, 04 Jun 2026 06:26:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac7:b0:62f:406b:1baf with SMTP id ada2fe7eead31-6ec473f5d87mr4742963137.20.1780579561950;
        Thu, 04 Jun 2026 06:26:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcdesm1217269e87.21.2026.06.04.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:26:00 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:25:58 +0300
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
Message-ID: <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
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
X-Proofpoint-ORIG-GUID: Awo_WcfKlh7k_zv9g4iQLwOHL-W5QSxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMCBTYWx0ZWRfX+x1zwqYTnYRq
 BUwYzH4HIm8ikUmSZxkGXgqxFlX7biqycfYD/IaMbYT7jTR1Qq+eJSh6zLKmUBh3z4GrZo3JO5V
 LV+bbHNTG27Gh2u0193oEPJ3Og5nEVMdgRIjkb308IKvDWZU/eokLRMeS4iIDnnzFmoS1ZUH2ZH
 Vv6+FsbCCO9vyWYZi57FWREX1Su3/M7Z2BvV/YOZePCIBb2mg3XJ+Mutv1C5A/zUjmrzFFOzO5Z
 KPg4nV6b+++4tbV4q0uImpDUr0Ml6bc/x2s0wsM/oqY4lQjWLSJo90zQlVIcELurQzz3MgzzrP7
 K3NtQsDR58lMc2gyV8zEkwHQAY22zPdHa8cYJnXNta20HnptK/nP7cuNNVhkttLOdTK/+hm8F/U
 fmCytw00n9uuvGgN9oItnMRbbr9xYWKE+BopgHkS3cZPm9fQcxUJItZWkHhDJdDa5EVO1Rai/cF
 dtSgeKJ3Zd9buJAYkJw==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a217ceb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=TPyWUj72fWjUZVaPtgwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Awo_WcfKlh7k_zv9g4iQLwOHL-W5QSxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111215-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,demyhaltbpwg:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 4F410640637

On Thu, Jun 04, 2026 at 08:25:10AM +0000, Hungyu Lin wrote:
> Use pm_runtime_get_if_active() before accessing hardware
> registers in the threaded IRQ handler. Skip interrupt processing
> when the device is not active.

Please clarfiy why you are performing the changes instead of describing
the changes on their own. There should be no IRQs coming from the device
if it is not active.

> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> v2:
> - Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use()
> - Handle negative runtime PM return values correctly
> - Return IRQ_NONE when interrupt processing is skipped
> 
> v3:
> - Remove the early enable_irq() from the PM-inactive early-return path
> - IRQ re-enablement is already handled by iris_vpu_power_on() after power-on
> 
>  drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry

