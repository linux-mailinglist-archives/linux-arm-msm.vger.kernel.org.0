Return-Path: <linux-arm-msm+bounces-91225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOZyCYAXfGk/KgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:29:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF1B66C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 280853005A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E307D329C57;
	Fri, 30 Jan 2026 02:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWfpbihE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Po/oPwKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87168230D0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740156; cv=none; b=jbD1pN18mHtW03CobQPw/wVaxyZ6BA776DSn9GYKzk0cM3yHn77nZsXTsevEW3KE8HKf8Ih3IU8qVARUoK2P7qu4HKBOiekFIUmpL0p/+dleREuGTvOEh/4dEROWOVvsvOxddsU1yeA5PkSxNApwdWMhPQwCRBDKBdgOyVg5d04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740156; c=relaxed/simple;
	bh=uNVFQUDsVy/6f9BLr6lD6HsjDUCJvLbfZ1pp8x9YWtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKu+1HeSxnboe3ny7sL1NCYVDbASry6fvjKfpS4g0vkpdpCA/LG/EYv9OaABvA33ZqYBLc/2Ngmr80WkIn7wv3r9ln86yKCzy0CE4Cq+mjSKeE17tWz3UfTz9vPL//ihK4IQhrHreJKXP0D26dHKQ84Y14omXPI+7ncsWWv8Sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWfpbihE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Po/oPwKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH7cFH179612
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpSG24Ae5cKV0szq3BxpaOqq
	p0fLm2M1wQhoDW4ZBFk=; b=CWfpbihEx54Q/yXbnDPFh8y34GPVbCkmiqaN3ngQ
	u8Bfm7VLXAn8X+X7Vi6NBD7ExXyWbqh3i5+3iyW2dQSuBDgdWk83XS7n5uG5nlfT
	J0rU4usCNKEXgw4Y/OOK4itYsaNnJFg3vgud3DI+tzDKVnORFlv6vExup6LqXOXo
	xn0yP5J63gs8xGRjpuKibo0sVlvuBQO2tQ1PFKMZfGiUCjwpte48F7EB7QzzxT3W
	RiM/uz7dOMbKRxcwDMM9JYG46BOwOCTIJbxUDidYdw2k83i+pfXJvw00KivEPPpL
	eqAskDj82VGOfmqsm+ENPXa8yh0GPTAA3GXH7ijTkGYAtA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3sfs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:29:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f54c51ec03so1360463137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 18:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769740154; x=1770344954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpSG24Ae5cKV0szq3BxpaOqqp0fLm2M1wQhoDW4ZBFk=;
        b=Po/oPwKIcAJC7MIXk3smMy/IZ6WyjqreklIKMLbq2Z4juBwHOC4qh6+g+cBMoVUJlu
         A6PDHJ3d1H1vw73Oq0EjdJykN60ywg7t+rTvpI+Gv4rE1TgzhWhNUCfB9OIOpH27AkNV
         fKSUdbV9r6xMIsog29gn2wj+RNf3L3KZ5NQ9pCFJZujnYvJMUiXKtrPI921y2Epfb2iu
         VEiTzBTVkaz1CFO6Z2PZp7N+AzLOs4hDkbBWvA+P5+kRLeWl6lErecUW9vIB9HPEs80/
         fP/H0fwUBkuPHRSOdq31N1C58YBqMb1XVDe+HUfT+TVkxvXmbDGxWw3udn/q6yLDcEB3
         3T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740154; x=1770344954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpSG24Ae5cKV0szq3BxpaOqqp0fLm2M1wQhoDW4ZBFk=;
        b=I35WUAXZ/2XdSzWy52Naafsyy4S4OKF67Pd+cxc4VBS+3bYTU4kl4vp4w0HQDcgEw7
         BUzaIdOhsO5uGh995vSYbQB60Kqbsm9kK6y9tUxYd66sBvg5QXksFv1GOpmhUWDGszlL
         KM3no4f1AzSq3ASjDTSZXZ+ljBUpJ4R7WtfRj2rpgbOv65VN4Aek++OoQXtmBXY/2dy7
         nMqvQq6ur+eDymXmKnDK3FEvHIPxWrA1tWTpzcz1qa3yJZxJzprTw9ZpMALwIrYn9Hcd
         RhdwW5SlwUqcZiURzUEOFNdKwnLDiug+xw+uao4kDB5rGWV8vwni4aGBfifMrYA37nK3
         vYLA==
X-Forwarded-Encrypted: i=1; AJvYcCWUdCpkC/69UsgRj89K6y7H3wfD/m70Ucp4otuR2PFldsAxwiXSbhz9IwBJhN8zwo7GP0/W9M5LFrww+fPP@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpbHhVSfS1Nnyad3t4Ub/bSTU0fuCb2gtgSS8gHSToWx+v4DC
	qvp6WcINtl2HbdX6rTMTxM9CLpyHFW2aAVE2bCjvNqinBUwN0E3xILWLsfK7LyoZ3IPZUgRWoS5
	rPcoacgQ6iw/jmzr2P5pAMhqaioAoEpjyqq7bhCEFdmTA7b15ZJyJ0tldG7j0fekL2rLu
X-Gm-Gg: AZuq6aKx6dObU7ArdJbJHYRVQ5RVVXXEht2zqMKScjulguDVZB3Ax7h96L7j/3mNfcJ
	C3lmaN57E6J9F9+7AI+hruCZs38g2GPZcRnLSPkUcBzfYh83shVDcUh9Wz46r0vmA98YELP5dHl
	ok2ZBBSKNvpSfdh+RdhYH62a5FzJRHyY18CJkTGKrbJYdLBau51c0kvz+Fxhw3nhjRY1eDO5rLF
	UUFwOGtyJ6V08dovdQOIs6wRXeGx/tiOPo3j6L0BZZ4213a1ME6Nv1b489O/TDNmqZ56GypLLQS
	j5oEMgatloj4xzxfSazkMGfTNY1SnMaNWi1jZFTop9z+hSmKeuWjd/tNm/DhUR0w3jWHb2WZYv6
	POXuyNVMFbmXxouehpRXA79tYdJYeLG5vUGhTBmcp/jFDTIbVZIJ/oQwyIkm4q3/S0402GtBz/h
	BoG8Fy3EVLxdDCPVjUutAqdok=
X-Received: by 2002:a05:6102:2909:b0:5f5:7791:c2cb with SMTP id ada2fe7eead31-5f8e272c0a1mr436146137.41.1769740153747;
        Thu, 29 Jan 2026 18:29:13 -0800 (PST)
X-Received: by 2002:a05:6102:2909:b0:5f5:7791:c2cb with SMTP id ada2fe7eead31-5f8e272c0a1mr436139137.41.1769740153306;
        Thu, 29 Jan 2026 18:29:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2e8fsm1444402e87.48.2026.01.29.18.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:29:12 -0800 (PST)
Date: Fri, 30 Jan 2026 04:29:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
X-Proofpoint-GUID: vsNxJtgpSZSk9MU7SgwxP3XCRTvaaL3Z
X-Proofpoint-ORIG-GUID: vsNxJtgpSZSk9MU7SgwxP3XCRTvaaL3Z
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697c177a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uw1HqZhSIWayQixwtEoA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOCBTYWx0ZWRfXxkwa168ZtDE6
 6ZBoKYEmZnV7BlC3Tske+aJWWEHiyiu+XngYcNCNgd9IdzMqQ1yHLalNp+gwcLojxeSjXhET7dH
 Xy7kt9AWEmG4p5uRtXmhQSpriHU0fDKkW8e49ZlQqttqgDkiy2Ms9qB7FsjErxrcsSuNbXAXImL
 6+X/pIc7ngElPifPI3aX5eHCAjXWU3cpd+RYlhAQlfpixli599VHCoC6Rz0G4h5zGmI6Ys4DrSQ
 h4TsnalHt2odEkELdPTbnVtQv79eXFY+ijEQme9QLnX3l9+3+tEsbJNyTOL1q+1+QYDMIj8mbBI
 nEK0q+PPi4U1gKb1zsqhT+KnQ+iaezQAy4d86sffp+K7Rf8vnAGD7X+rizw56W8shupOhQo9iUc
 22MyzxgsUPpndJMrPJog39NUVxKe3xI5z/vkGAEQ2RroUEtrvskn4KdE26EIJKXUXtBFjYXM7T2
 7rj0pkUHv4T4T+KIPGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91225-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCAF1B66C6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >> Currently, FastRPC only supports mapping buffers allocated by the
> >> kernel. This limits flexibility for applications that allocate memory
> >> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> > Hmm, for DMABUF we need _import_ support rather than support for mapping
> > of userspace-allocated buffers.
> >
> >> Add support for mapping and unmapping userspace-allocated buffers to
> >> the DSP through SMMU. This includes handling map requests for rpcmem
> >> and DMABUF-backed memory and providing corresponding unmap
> >> functionality.
> > For me this definitely looks like a step back. For drm/accel we are
> > going to have GEM-managed buffers only. Why do we need to handle
> > userspace-allocated buffers here?
> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
> change is to enable routing of DSP logs to HLOS which is done by using a shared
> buffer between userspace process and DSP PD. The buffer can be allocated from
> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
> 
> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
> with this change.

So, you have the DMA-BUF buffer. Instead of mapping it from userspace
with unclean semantics, please import the buffer.

> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
> >>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>

-- 
With best wishes
Dmitry

