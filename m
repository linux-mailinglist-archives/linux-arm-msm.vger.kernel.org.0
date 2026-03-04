Return-Path: <linux-arm-msm+bounces-95249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMReD3qzp2k6jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:22:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3941FAAA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB2C93036762
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2692237F73B;
	Wed,  4 Mar 2026 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Z5n66U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVwFXDr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5837F013
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598135; cv=none; b=Fq+JxYLJQQGtsa7Uai74ZYpUEs7YKTXDyjcKWW+rihkmIVY9k0uuc1KC3rI0iRib3KzPZDRFhqgZPmpUaDP2xZtmFmY3V1hlyvamhC+kl1z13ppWg9siRs/oPoY2bWt9zYBqVPAOHngZw+Q9VAVHXkPofEmQJ8gsQyUsx83BMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598135; c=relaxed/simple;
	bh=vfZ4Fm1illYeYZxI8bJ8e1HWahncA/1F2Qj57ZqkvyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMjPqYC39dO28I9XtdwO/kptnDiFFeODZJZ6PLGsi/BOzCSeHhhGQH9rxjxJ5XMfNA7V7YctURv1Z3TXTzJ8KDh9bi9sPxibvWmhZeTAGr3Hn9lyg1XoVq//KVIvTLz0Rsxls0lyDM08UhpW+pIEzXOluatkuWZ+eTvbNBZF+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Z5n66U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVwFXDr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244IZrq2958542
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 04:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tlbeDGjUP0JSGoux2wklhzIf
	NMznEwVoyK8emBv6LqI=; b=c/Z5n66UUeyIGhW6V3AS80qPffCne7OeN24B8uqj
	dnBn9Vc/Kq1CVFKJFUDn9HSKvsrJUA+EOnZV179NYpUMjZECKSE8wvJzsJKVB7XH
	K4EPD3iBaCNSxGR9t/QtdYgR7U/L9GtcpsonFi0FGsWk9PYuirNMLIQXIM5Y2gv4
	PKJjYeF58AYRdVqSOSu5nbb2syGAGqCyLhceytWPICAby7BPXIN4ujlNNd994q4k
	4Iai0zouxtO767KHYoRxXctKM1sAoOyoKg8n7filX7iHVT3tKkCRTGFX72Eva6ka
	m5n++swUkhl0cSLxAYG6RIDoiNNZmkJ2PYJvof08wJHT9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h29m29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:22:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so809827585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772598132; x=1773202932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=iVwFXDr28B+dHTgHu6ymmd1jkyis9H/i0a/+MV2C53gZGLKDhs72hcdTbFS2RACpXF
         UV3TnnfhAxQlYSA0usQu6Xc1oXA2M1rY5pmnBi44U2XZoFCzAoINhCJQD9ltvuVgInC+
         hVnvUZ0uhFzGfN+VTIoYc21HOHUIdf5oqbrkBGJUSmqz9ch2b4PR2Zfa40Jqovrao6aS
         9W0sOPns8Xd02gXUUwDSbRRViCzuyy3z04YYlm1cZuLGxXp2/LCYnsLuK5yaLW2l+FAs
         c6tgqal9ycCrn3ieBN2apsqO/PCSvU91P8H9SDHKYRqc/c58C+x7SqlJ1M+Hiv9kPPRX
         XsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772598132; x=1773202932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=cojLhEXFIdtT8cFEdv7yGGN5kgCsRRqm6ply/1yDBEDVf2kEeNQSfzD+/QPCS/U63h
         I5WD4khbxAd8LZwjftplOXU1/AYPapKyMzYIxc9QSL7rCHyqpZwEjdGsbk3p0+mTCU8p
         FthJaB/b9qoOvagd9EHlZcEhcP11iW37k9KPmJPaPdnQFEf6PUfAPlfBC+y7V6GIaT97
         ELUn+/gHwW5HaLdU+V5bcsNiyFMpmuqk3nK3VqBJWpJ2l2FXW2PQXP5fEtsLMj8PrGk7
         7J4KDRlTm7he8ER96oIGwW2lV0Rxrq8zM/uk38tFmPN3vCafvUuYPgVWYcmrsg4MkxH5
         f1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVjCFtOtkQcFl2X40gcnOUCkuPpWVdFsuHPplsl2fHtJlR/jzaLoQl+Cnept8nyAdGmfPnHN4Im2dvXDD7T@vger.kernel.org
X-Gm-Message-State: AOJu0YyB48T8b8AaUvUpTjujaQPEyoUsIwr2XYv1Onw0QUeM2rKKYhOB
	VmowLU5KSane1BL4vIiBqPyaszV10MiFR3cuG1V6UpTVB94EGsvK3reoqymHyq7Ci4xIAi87QH7
	i0KJCsUR6kbUSZ70n1Uz9NyhLyj+xiCRBcIKLw+CU+p7gP7uYZdElVtJadpKn02RPZUU2
X-Gm-Gg: ATEYQzwfL1os4iP/usvUoKE0Ha7bPaCaCYDDuBT+X7McEOex7MoGcErvur5eCRuJr1p
	U2P0toQI/v6/oWc+Nl2joGp4Hq8roxzGFzdKl17d2bb9MIsqXUaocp0LEEfZNYmBH5sjuAq4W5H
	WLf2Fa0k/7DirFuba9hytnJvCE33rYERyrGrzJwYuz7IRDXj+Nl5hCqMkVxxXHy+qxwXxIi8Wxd
	NOvXz5Dm9wP/A76URmb5JcBipwaAP56icRIdSBgF7eGKZ5gvAEVQi/5zxFEcL8dMqdxakyIgsGX
	jckqUCTBTjrGfinXcpy5bRVWEQlNQSSCnD5Vfx928GmcwijUtfaQ3AzdOSuYx/U1b+R/cRWckR+
	N+XTTWNGi9vVKyk9QJZtLFKZDKqaOPmnreZvV8biV5ddNOWf/JphDdKfc1TOXRfonpwgAWV2H19
	yZhqePPb8a6NyPRHBhnWlJT4AGMjViB8Ac9IY=
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91775585a.71.1772598132171;
        Tue, 03 Mar 2026 20:22:12 -0800 (PST)
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91772185a.71.1772598131614;
        Tue, 03 Mar 2026 20:22:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c0csm227636e87.2.2026.03.03.20.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:22:10 -0800 (PST)
Date: Wed, 4 Mar 2026 06:22:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <wubjsfz2ijtqvwwqc6y2bawinpdwvvke6vh4owytcxjdmbfjji@ybmz23zic5dn>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
 <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7b375 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LbhuFg2odiTRP-zraWgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WwzR3Or1JslesNV6MkoctNKKm4ljVcEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzMyBTYWx0ZWRfX5jEomsY0NtNQ
 WPJCcBhLZcAAs35uWshPTLM0IAwHQj/+6mTKC+qD2711H9gewzYcfaRcTsfkLvyN2br9wiplRfX
 CJM3xohJNwGSd5R8j3xfylYOMCLpKFKUdl+zKGWC46JUNNcbW008fv1p4m120e5Q3852x+dAIvu
 YhlqPSOQzy9t7PUVUtuI53/g8cvNX3k38YPyJ6XD1T+FJ7iS10WMIfi/3+hYV/TenH6b0na9PeA
 ZPwM8onxIDpc12DnC0c8Sn7+9gJES0XsNvRFui5TKewlkfMM7Mjiu2wy0VQdoj0z3QCkQQGxljS
 2fPhhZ4vvzZw15pbSBz3JAMgj0vGZOy0qk4AjmAYxtxC7myyY7wAjo7qjI0Tw8/AsRSOm5Wi3RX
 YNjUIAAPORxrmQeT3oWfG6pGnKw2edRNmY6Bl2jofT9Yqz2q705Ag3RVwX6sWnNkih67+x+/XFn
 CFdWdhBDAO/Y8iY7+Gg==
X-Proofpoint-GUID: WwzR3Or1JslesNV6MkoctNKKm4ljVcEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040033
X-Rspamd-Queue-Id: 8D3941FAAA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95249-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:45:09PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> >> Introduce a per-device memory manager for the QDA driver that tracks
> >> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> >> represented by a qda_iommu_device and registered with a central
> >> qda_memory_manager instance owned by qda_dev.
> >>
> >> The memory manager maintains an xarray of devices and assigns a
> >> unique ID to each CB. It also provides basic lifetime management
> > Sounds like IDR.
> I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.

Ack.

> >
> >> and a workqueue for deferred device removal. qda_cb_setup_device()
> > What is deferred device removal? Why do you need it?
> This is not needed, I was trying some experiment in my initial design(CB aggregation),
> but it's not needed now, I'll remove this.

Ack

> >
> >> now allocates a qda_iommu_device for each CB and registers it with
> >> the memory manager after DMA configuration succeeds.
> >>
> >> qda_init_device() is extended to allocate and initialize the memory
> >> manager, while qda_deinit_device() will tear it down in later
> >> patches. This prepares the QDA driver for fine-grained memory and
> >> IOMMU domain management tied to individual CB devices.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile             |   1 +
> >>  drivers/accel/qda/qda_cb.c             |  32 +++++++
> >>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
> >>  drivers/accel/qda/qda_drv.h            |   3 +
> >>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
> >>  6 files changed, 335 insertions(+)
> >>
> 

-- 
With best wishes
Dmitry

