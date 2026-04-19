Return-Path: <linux-arm-msm+bounces-103616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLP/It8e5GndRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:16:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD35422B19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B0F430247D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CE81DDC1D;
	Sun, 19 Apr 2026 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR697kqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aobQnuWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42881D8E01
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557789; cv=none; b=CHUqkBRjbWi8z0/piuQzuhJDOIh8ffLkIlXcTkyuOiDAa6iQe9/YAcR4zinr0SaH+zsBD2FC2qalWh4rU++/xou6IAOivk1l2GF30EgCFdJZqJ/t/PMP+irD3U3//ddJWKsjGDFugny7/cyoO2yajqrums3Re/oFL5iMbP0cZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557789; c=relaxed/simple;
	bh=Us0ndhO033kkFDcL/Ol+YYJaL5GcvP1KfFlzvNH0qnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1ONqhBZGnAVDzB+KiSO0x+xcqQfn9ZbGlSDf2dpIfP58kLnUrIhrEFptZXYDkMUeq+DzE/WZam82rGBf43K3AO5mu5+mopj4KBO6S2K3Ynca5UhSsLXlq8gfNcI9yDOagqUNP/Gj33QP0GO5sM8S35PwtED7akjvs9Czk0VOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR697kqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aobQnuWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ILjNSp2379609
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krtkKxe19pMn4PJwb0xqRCTx
	s6eIr+De+hcmkYF9q48=; b=gR697kqo80AfHPSVffaSyFYnY6aqjhi5knRMEcry
	pUTuAf6jP8zXHkkY2KJEWhJfCS9zAU1Vcz86eE6qwoHoU2HtpPtG5fudRj7dOyhf
	lAiR7LAsOR5T5ankj4p4/rHYlEJIpW8iC225aFk5K5YLMBtSdpGdNwZwzGRhdQmF
	23lq2V6dzPnpj3lwWiG8sv1ULnN+bO1GLkWcM0uIED9vacHlgShdQYmSeHgvcAV+
	4f+6eBdTLlcNvwin8N9iKAePe1bjK6NqACqnfVbtT0gTjGHv2gm0cpjq0+imp05d
	COD+qz1rDaBlio8vkaV2wGdbVJpSp5CooJp2SJapHEtjnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr1t18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:16:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso17674711cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557786; x=1777162586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krtkKxe19pMn4PJwb0xqRCTxs6eIr+De+hcmkYF9q48=;
        b=aobQnuWWUk69fj85pTJW9q8A9UY1Ci6zkUA8mWXziOKRB35yW8WQa/FEYrjU4QHGMH
         L4hcXmk2w/I7El70ZMMZ573oq6dqSh39pPp4baDh0DBF4ACcwvm2hArtkAC3rXhAAY9P
         CEt0P5tPcImpZW+NJ5Ce0Y/gQQcfQ3VbgJi8JDDfiaddLBSEkN+wD2ZrfNUUYQFw5aER
         jZa7jwsxiEhwT1Kvr3LjWEOVeelCUs5WMkXbYVNXX6pe2ww5PnQ29c4pOum/AG8RyWqm
         Hk8FEOE36Sd9GP9FmaYZP/ajsTHu7IU8MQTTJSIXz1/U3O5lRRdDNBfaCyzoR1WLgIt0
         1vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557786; x=1777162586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krtkKxe19pMn4PJwb0xqRCTxs6eIr+De+hcmkYF9q48=;
        b=QtNVPuCGJhm+07cCmj9wLCAQkwVJcd4L6cmyVix2jr1djE6dZtDGLfdG1GkPXsl9KP
         PpkA7wD17IEg/i68rV6WUIgFt2ysovql9zQLIVxY1v5pY9ly7H42ZHsbjri5Of3G7M5/
         8sdiBtdYhdLESN9IzxbOAjDr+7V95V73GOefNinMfAHrxa/O3eBZzjH7Ml/YwnTX1s0b
         XGw8fLDmHj1PT1PycY3c9YgIuK5WdaanCV81HAdQwoG7wqA3XKj9xohXjq5bdJWkrsmI
         2afj32kluOUCDe7ej7bPClr4EhqktEjLJTIZpRVAloSp3RF6QEU8DBq8iObFlVb0KuKY
         QTmg==
X-Forwarded-Encrypted: i=1; AFNElJ+X6rDfSBayVh8RFC9cfJ/zGl9lbLCGyKuEe6UnL7HqkWmYGbOu7aLRpmuQm0qtFMpVm1t5slJMdr+4LXlI@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2HNlGbqhnMQQz3dbjzvJLAnq9Is2IrEOhixoREEtPOJxURnE
	tkaMOmWZx0k/qM47K8Fjg1axSaIxk4PJ0q+3pTOmbE7xvvaS4F+bV1a1tAZtjX5hXM40DHyVWkj
	TX9iuzj4JjEgSFOCGIVi0/HBGmraCgolrXrILfIYfPnMnPMzbD/lgId3zL/H3SZGMnDtO
X-Gm-Gg: AeBDietiKmqyFNFHgpXeHDYF/qdvEjYJtNdEh7VxSKgy88XCg0NMfFXD8yIJ0eQqDd1
	eZJRt4JCL9fvuxSe+hy+cG/ihtKQzYScN+F0h4g/I4Wdt0FhAKO94I3F7bzm15Zex4o1IJTjP9U
	L1LrTtAmegv75n1HHfFGAtziVHMBRd0izlihvazJNIaA3VxDVoRioXtKsK9ut0BqAQCw3nzsyDx
	nJXDO1KBEoxzZxEpT9IHsjOsT6/xmhLi2SZO3360L2eNoujK6SlKOpoBXDps+HSZVYILAKgdR4q
	TRAIiklii7z/mvRF1/5XhLwe/tlicGBK8typKWcV8xFwrtc7hBLSjm3bYs0YmZg3Jgy++RZLG1i
	Jzg0EUAVk+hloixpblidCFGpdUKm3CwJKZl/MONa3SD2vlSuJGPXyp4uN15udwrS6q2uzla63sm
	rnJULZyAqrklCZrJDmP88eVzuDmMqk6xYo+c8jO5gLKpAwJQ==
X-Received: by 2002:a05:622a:1f8a:b0:50d:9e69:8099 with SMTP id d75a77b69052e-50e36833221mr139255431cf.19.1776557785948;
        Sat, 18 Apr 2026 17:16:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:50d:9e69:8099 with SMTP id d75a77b69052e-50e36833221mr139254881cf.19.1776557785464;
        Sat, 18 Apr 2026 17:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad343sm1729076e87.2.2026.04.18.17.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:16:23 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:16:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] misc: fastrpc: Use context device bus for compute
 banks
Message-ID: <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
 <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwMSBTYWx0ZWRfX/3Imyq6XhhUj
 wsoOxyfV4eVyIi1C0FVQPnYePj8PrdGcRpEBUk3obipJVubBNGFJeYv9obW60oR2oqLvdz9uG2d
 Kja+IiTmFMH9wGNKhZZtfnZ3cOiIp5Q7UBdP4j0DjdA7Nhszwtxe1Liv8T4iLpwo0A8bzJffExl
 eUsVT/X9n+CTWcQti4gGPTGokTkZRTYw8NKfkTXrb/3f3Xvp7iWGJL0Qowy4AGgo23oJ9dTYF8h
 Xpos2DkpaxkytXPLOwDf5xjF7XKRkwGTG1Zdh7C1em67mOU34Byu9SU6NGQURI5WTLmnXXgmQxQ
 rGdKYiJATix7Oc/aVI5u9ru3qI0GKVght1JO6rANs8/QF/vi7Lx/aIiTfqSoDOGdbakUB+bNihM
 MMul6jtIUCq2xRylt2cq9wNrJtYZt/li9ooxaV6dVZiQfRlCQVZIOdaK6VtiPr+3MOFw6j/sgtP
 MG/rZPki6TWDNHDmrHw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e41eda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tB70rH4wX7YjnKcxG8sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jnEtWSES-_c_jlIZDbvtjrOQ3g07u9oM
X-Proofpoint-GUID: jnEtWSES-_c_jlIZDbvtjrOQ3g07u9oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103616-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: DFD35422B19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 09:35:47PM +0530, Vishnu Reddy wrote:
> 
> 
> On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
> > Replace the platform driver approach for compute bank (CB) devices
> > with the generic context_device_bus_type. Compute bank devices are
> > synthetic IOMMU context banks, not real platform devices, so using
> > the context device bus provides a more accurate representation in
> > the device model.
> > 
> > Currently, fastrpc used of_platform_populate() to create platform
> > devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
> > driver (fastrpc_cb_driver) to handle probe/remove. This approach
> > had a race condition: device nodes were created before channel
> > resources (like spin_lock) were initialized, and probe was async,
> > so applications could open the device before sessions were available.
> > 
> > This patch addresses the race by manually creating and configuring
> > CB devices synchronously during fastrpc_rpmsg_probe(), after all
> > channel resources are initialized. The approach follows the pattern
> > used in host1x_memory_context_list_init().
> > 
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >   drivers/misc/Kconfig   |   1 +
> >   drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
> >   2 files changed, 125 insertions(+), 56 deletions(-)
> > 
> >   	}
> >   	dma_bits = cctx->soc_data->dma_addr_bits_default;
> > +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> > +
> >   	sess = &cctx->session[cctx->sesscount++];
> >   	sess->used = false;
> >   	sess->valid = true;
> > -	sess->dev = dev;
> > -	dev_set_drvdata(dev, sess);
> > +	sess->sid = sid;
> > +	spin_unlock_irqrestore(&cctx->lock, flags);
> > -	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> > +	cb_dev = kzalloc_obj(*cb_dev);
> > +	if (!cb_dev)
> > +		return -ENOMEM;
> > -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> > -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> > +	cb_dev->sess = sess;
> > -	if (sessions > 0) {
> > -		struct fastrpc_session_ctx *dup_sess;
> > +	device_initialize(&cb_dev->dev);
> > +	cb_dev->dev.parent = parent;
> > +	cb_dev->dev.bus = &context_device_bus_type;
> > +	cb_dev->dev.release = fastrpc_cb_dev_release;
> > +	cb_dev->dev.of_node = of_node_get(cb_node);
> > +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
> > +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> > +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);
> > +	rc = device_add(&cb_dev->dev);
> 
> device_initialize() and device_add() can be replaced with single
> device_register() call. You can refer the below patch,

Keep in mind that for several arches device_initialize() sets the
coherent_dma_mask. So one should set coherent_dma_mask (as it's done
here) after calling device_initialize().

> 
> https://lore.kernel.org/all/20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com/
> 

-- 
With best wishes
Dmitry

