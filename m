Return-Path: <linux-arm-msm+bounces-104171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKhzCvEY6WmcUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:52:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A21A449E1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48546300D4C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD51F2DC789;
	Wed, 22 Apr 2026 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJfFq0zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3ockSxw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B142DCF67
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883945; cv=none; b=qCMGhzsHIRwoHSNBxm58sEUH5Iz7cWx6IQjZ6VT55cMaZse6Rb0hKCzLwttRrvFVdcLL9GhDGbvukl+xSlUN4DSydyKoGF5+RRo3tKXuR0xBU00DjWLNjy8qCaPuescDqlqEg3mjBzljcUkpw3geu9zs8XkzQodq3VcjU4gpQsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883945; c=relaxed/simple;
	bh=Q8s8HLfNZMNG3AkuzxK5uKeoajf3h+3aKwK+66dmIAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5HMSBcbxSIa0QtRH4ANdZD8m/92M5h3DdOHUzGLbtysjpO0ZiPmscUG/WmmbwUv8UJIkDr0mFVO1UM+1HSKSeoPPHOCQ5GWvFqnJq+MjA/4g5T5ioIV/TMWXbZUjlwP+wtCtm3BUKJt1PGpfPR1an+FjDkwb+W2BK8ikbfhcIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJfFq0zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3ockSxw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG43oA122915
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wotz04H8l5tgEEsb1NU3qjTk
	74Z9j+pDdwYuMESGV4w=; b=jJfFq0zdZy9ICHfrkQe/sXmomxTWDzPHZ4u4KnUZ
	3oh4PgAAn3MQFDjtXs3g5lFj/raVAAfcKw9RZhObgTW539TD4NAAngbB3beQm3Q/
	zgJgVQo5cEwac491XG+iYAqlyJMzRWIeb05E5x5IbXu8iV0X9XjHcTp+3E7fQFm7
	ch2yT5FSKeRX2f7JqARtAWA4Y/wfHzdhWk/s4ZIZlj9Rq/QfskVgCjWR71qFRQc9
	kWeh8gNpPKmx06CEmNOLKye+MAD4037Swbj6XggBcfGhAkk2xJEKzfpKg22/PuLJ
	+smX/Ebe9BOuvNuXKAgvqOCzYFwCHMUiAwmbSqEbWWRY4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80jms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:52:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso157548061cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776883943; x=1777488743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wotz04H8l5tgEEsb1NU3qjTk74Z9j+pDdwYuMESGV4w=;
        b=B3ockSxwRxgJ6ASFuMTjxjXjxOSwK/Me/KgfvEbGad7YN9JKdvB981Qk2LsCtt/0DZ
         SJOqbD/6enxvaRDyheD/1XSugYSXSJwNM7C6XGJN+MK/GUPTc15Oq02BZemeEC8W6uCf
         P3WQ1bUB8TTzaQjCA1C02pI7CY68buogooxWECZMNmkbQRfcC8rSe9CEPHAQflXeCjH3
         KVT3ZVZJqBP9jkuFo4LS/DSLJ76B0qC8EInKUJj3dkEs9P/m0+w8lKDMQcu5dVidWkM5
         4KzntR0qUySNHKz0wdoNaYnBXiVe4MpYncSelZUJw0YsfRAstPoVrCL+TQ5wMJJkd1qa
         M9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883943; x=1777488743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wotz04H8l5tgEEsb1NU3qjTk74Z9j+pDdwYuMESGV4w=;
        b=N+PyN3psDDN+LzPT/HaLAtJnlSNCsSrRUTj76+062tAfoZoEIgCRpwGgu1HNTESDK8
         GPsfegY5S4out870Spq1dj1YNxsr7CNQDNxa/2DFxwRIwDOIZkhbWqtJKlwt0HHecaQZ
         oIF12f/Jnb+ZG02e2xKHCBuGH6zo61XOgPORcG+JB2YjwasGdR86QoDgXDX6Ec3saYHL
         oApxEWfO2rbRoGjGDc4U9ErHfqx/QDHc5braLcymgZdJ+r9RW1gn2weAHl3bnPmdnnDs
         3TUPxnK88OotY/WslPBDLofYRd+0z8E3XaxkhoHJo2s5s7W71faYNF3rlOSPAV0AwcjC
         GwCw==
X-Forwarded-Encrypted: i=1; AFNElJ/eUTibWGo/SvZB/kGHHeBfQNhh1UN/EJK5ATULH62jw+73CEIzyBYOHVHc1s9ln1cpiUnsH+6aij3VINiw@vger.kernel.org
X-Gm-Message-State: AOJu0YwjI4HvYG3yg2iQAywq3oLc04oJDphfjk37/OvrbI7UuuQeTlc8
	A5MROLhrJjO3gi3OE20fevChGoZN2qAVKcArGg2RJmVk1ObXw/v/sPJpHY4k7LNlGqVAtNZj0FG
	mZ8E/tK0rOKyWMYfakQ1MdaXwvhXnHJvJxSPWAgv5S1h9/guQCRRv/Z7SMcM+PUAvZ1W/
X-Gm-Gg: AeBDievyYDHoMqAtl5g7BxMKJfRjvP6TLQEdCeEJoz6y457dqbeD5rnFkZNkWZW2pbZ
	EfWBjp96GVNcvx0KiANlF93kUnuHVK9doQEAH42uFUcznVEjGFRQHkYP1LpfCS8hvnvWK/CH5HW
	TpsWtuYtOfQkgBhDqq33+ehOLLgMoZwxUU9GAoIMD6wJQh04bcHrYj+yoCxaTq4gUZtuamacngk
	9EoECYcDvkxvrsw2naj4q60dw/rCLQeYBaSycRwdt22opJ1IMPOxRN4WZWkJrynARkwdExRP9yT
	2a9e3bdLNlokgy3yD1VdJUYlVKPbviITexP9HyA9fMlc/ZaJ4dJwHo0GKf0XGUP1tgs11tcixOI
	brN3qc5sf8UrRJvLp/LyLHdzfrIUMAEpMf9XVXAGri76KdCsShKV2Y4/P3UPuoNRjiS0vWo/tcE
	0LsmBxJSTxU+wuK7ly8PegEbWD6n6GjsgwoW9fWgqO1s1omg==
X-Received: by 2002:ac8:5749:0:b0:50f:c36a:3828 with SMTP id d75a77b69052e-50fc36a3c77mr44950751cf.58.1776883942678;
        Wed, 22 Apr 2026 11:52:22 -0700 (PDT)
X-Received: by 2002:ac8:5749:0:b0:50f:c36a:3828 with SMTP id d75a77b69052e-50fc36a3c77mr44950111cf.58.1776883942194;
        Wed, 22 Apr 2026 11:52:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm4584470e87.71.2026.04.22.11.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:52:21 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:52:19 +0300
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
Message-ID: <cdhqirgdwr6mfwqlhyq7apem4tfuu45adejqg5hse5bvte3vqe@i4uoqa5rpfv2>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
 <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
 <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
 <077a99c2-c954-c5e6-3699-cd0360e8b9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <077a99c2-c954-c5e6-3699-cd0360e8b9f6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MyBTYWx0ZWRfX996jYOmQTEDL
 xFrPw9iP+bBxQhiwSxTpAi4312if435p93Rhc4eNypXt2MsQQ+3Og7kEY9z2pVZskIijaH9jyq3
 o+kpDWpy/vA0+Kgr1NNjwjouUy2l+geX7crmGYM9F7+CpUWhiG5OIJlf8DvnBkz/ihlJoF4GhGh
 L3hVy7nmoYCV/WEf3tEzvVwTCI2WQUGdKoJZ4X8PhzAF98siuWZIn+whJ/I5v5IpDpgWsJIaCor
 b2q1NWHi0sXdmTRxL49bIvDnxuBuOqkbelq9mypZVnQyKxxpEBjChTvn2rE4wC8Z9mnUzPWO7uT
 ogiNLTxwTDufcf+vybFbtp+u6qAprArxSGdsO9/0qza8DCzxD1SQSfDiLW1QIrleue2+JVFpG6l
 yVQ+W0W4s3jhAXYW6bLmTkegP6N1qkE2/x7xlRC72grn/I8r/dZXMU2lquhknrJmDWf36sM866W
 Cb5l+nJMi8Nqojxy8nw==
X-Proofpoint-GUID: c6HL8hiSZdjz7NWmh-4wHP5WFLKT5_nU
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e918e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Dnkel8P2kxSv_apQI-kA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: c6HL8hiSZdjz7NWmh-4wHP5WFLKT5_nU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220183
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104171-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A21A449E1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 12:31:18PM +0530, Vishnu Reddy wrote:
> 
> On 4/19/2026 5:46 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 15, 2026 at 09:35:47PM +0530, Vishnu Reddy wrote:
> >>
> >> On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
> >>> Replace the platform driver approach for compute bank (CB) devices
> >>> with the generic context_device_bus_type. Compute bank devices are
> >>> synthetic IOMMU context banks, not real platform devices, so using
> >>> the context device bus provides a more accurate representation in
> >>> the device model.
> >>>
> >>> Currently, fastrpc used of_platform_populate() to create platform
> >>> devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
> >>> driver (fastrpc_cb_driver) to handle probe/remove. This approach
> >>> had a race condition: device nodes were created before channel
> >>> resources (like spin_lock) were initialized, and probe was async,
> >>> so applications could open the device before sessions were available.
> >>>
> >>> This patch addresses the race by manually creating and configuring
> >>> CB devices synchronously during fastrpc_rpmsg_probe(), after all
> >>> channel resources are initialized. The approach follows the pattern
> >>> used in host1x_memory_context_list_init().
> >>>
> >>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>> ---
> >>>   drivers/misc/Kconfig   |   1 +
> >>>   drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
> >>>   2 files changed, 125 insertions(+), 56 deletions(-)
> >>>
> >>>   	}
> >>>   	dma_bits = cctx->soc_data->dma_addr_bits_default;
> >>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> >>> +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> >>> +
> >>>   	sess = &cctx->session[cctx->sesscount++];
> >>>   	sess->used = false;
> >>>   	sess->valid = true;
> >>> -	sess->dev = dev;
> >>> -	dev_set_drvdata(dev, sess);
> >>> +	sess->sid = sid;
> >>> +	spin_unlock_irqrestore(&cctx->lock, flags);
> >>> -	if (cctx->domain_id == CDSP_DOMAIN_ID)
> >>> -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
> >>> +	cb_dev = kzalloc_obj(*cb_dev);
> >>> +	if (!cb_dev)
> >>> +		return -ENOMEM;
> >>> -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> >>> -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> >>> +	cb_dev->sess = sess;
> >>> -	if (sessions > 0) {
> >>> -		struct fastrpc_session_ctx *dup_sess;
> >>> +	device_initialize(&cb_dev->dev);
> >>> +	cb_dev->dev.parent = parent;
> >>> +	cb_dev->dev.bus = &context_device_bus_type;
> >>> +	cb_dev->dev.release = fastrpc_cb_dev_release;
> >>> +	cb_dev->dev.of_node = of_node_get(cb_node);
> >>> +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
> >>> +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> >>> +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);
> >>> +	rc = device_add(&cb_dev->dev);
> >> device_initialize() and device_add() can be replaced with single
> >> device_register() call. You can refer the below patch,
> > Keep in mind that for several arches device_initialize() sets the
> > coherent_dma_mask. So one should set coherent_dma_mask (as it's done
> > here) after calling device_initialize().
> 
> I can see that device_initialize() sets dma_coherent flag for several arches,
> not the coherent_dma_mask. The final dma_coherent flag value is updated later
> in of_dma_configure_id() based on the dt dma-coherent property.
> 
> Setting the coherent_dma_mask here and calling device_register() which will
> call the device_initialize() won't change the coherent_dma_mask value.
> Please correct me if I'm wrong?

I should get better glasses. I agree with you here.

> 
> >> https://lore.kernel.org/all/20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com/
> >>

-- 
With best wishes
Dmitry

