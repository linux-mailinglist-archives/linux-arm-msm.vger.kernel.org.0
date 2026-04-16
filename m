Return-Path: <linux-arm-msm+bounces-103385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHd+NzPJ4GkdmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C55440D733
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D5A6301324D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10578344DAD;
	Thu, 16 Apr 2026 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQti7CYW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTU50n5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3423A9BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338796; cv=none; b=i+io0P3LVJHGAKqrtGMGj+8IEVXOIKioc4hdzyxm48iSaI3WW5XRDv7OqVLnHY0DpG01P6uAqKUGNvxJZit4R5RrvUCBjn7fT2Vd1qU7llHzkGbcyKD2XfioJ9EeNL2dwsdmSOdy21itPdY6eR3f6/9REdsXvtWLHFP1IsYjYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338796; c=relaxed/simple;
	bh=q0+y33Hh4TD4SaaRWbh2wYNaf0WjSgdYdUnpWPlfah8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPtIAeob2W4FAs4KhLITunD6p4K9SVmeQT9spNFtIdWWs2wf8eriR0VL/l/Utvrv8pFiRRa/Ec8c1z+UIa+HSZzYkXmH6aI+2rTpU/O6zLPa06FauZYtS/PMiHAAca/4OQuLfxM5Swc0Qy5lsTIUonsjIPmitSmhjpLJFMbZSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQti7CYW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTU50n5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8VVu6862263
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKL3L0XkFJrjV8Cp1bcdi/Q3
	KrqtkofJoOm2RAC2cTw=; b=YQti7CYW/gJaJXc0L7SXwUciwn71kiIwWBJm6YMY
	pWR1fgdL3yD+aolzlOAaRPTBi3PCPibERW/ixrAQ242XdDFWqmlA5prE7uuGqYEB
	nJ25D8Ia/5EOtOzERKxWVFE6M+DLVYVAYfuFwLbYUEI2u89WzyVvYqyAAnpDppiq
	dMV5BHpP4YTMK+btFmxcvNNN3fI/nR/z71BlH0d70p4IhJLTOGYivZKIgq2952Xf
	B/nIDquXavphms25JnbYVG16Ta5pg/n+q/A06qDhcSr0yBaMINc6zb+jtTlXtxKh
	RrAyEOPm4LbIUhlzWM67KWz7ipnSi8LnNEjPBtprscMU9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ebntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:26:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so154748021cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776338793; x=1776943593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKL3L0XkFJrjV8Cp1bcdi/Q3KrqtkofJoOm2RAC2cTw=;
        b=BTU50n5X9jCfCnQbobxkBw6nSvQAXY1P0ExukdvzyNIm8Oe6ASrROlBaP4kISWAxZi
         0fIermKaPo24W0uakEW94o14Yhe39maqk4nu5RMROOdRqhj5Ohreu3At7W5om2Bjhupo
         iZ/fARshowGo7WyY5BvFj2be0GAYBi2Mca3CIN8l3NW+En2rMZMOW9VRypDIeLqz7jnt
         wnr7M9Jz8Qnhf8j+2PTfRwXtxMyCGxQq7O/oR6EWkJRew4wr2YqyZ34FpKmwGSgNevXf
         k2t6SiFf2nPTH3kLwGAAIRgQIMLaPAHKssx9Vhr/Ke9usdKM0A7uDPIoJWJYMwmGkTcy
         +hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338793; x=1776943593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKL3L0XkFJrjV8Cp1bcdi/Q3KrqtkofJoOm2RAC2cTw=;
        b=MK24VhBeqd7dHTmrAP+R9MlBU6OV1cKC3WENH5PjK4FA31I4po7xlezWmgN6Mjybr6
         2W+p7pa9tQXuj3fAsLLsA+qlSPrAAlNd2JwyFmRYf9lTP2EpgZqdoXDQYdprpfZmcGrF
         rB6k/qtNhZJgkDMLotg1Dw4A93At11TpVXCF+o9NDzg+kbbXxZArFhmEn9E8BNoYSuet
         Uy0At9rb1tYIR4j5qtI4Er1/dkGtUxR0DbUomCfg7clwpoWCO+iFIN7NgUDqJbhfcR92
         MwbJsVDFBd+vbKRhikOasKH5o0WifHy8RHj0NVP2g32yiK0HU6eEcEEXQgisikm/gO1r
         +8jw==
X-Forwarded-Encrypted: i=1; AFNElJ+jS1mHTVhanwMUHpajSBbUTz3awbA7NHDmuPYCGVpGOi2ShERYwM4RPa2r6SifarQ3lUEU//9wz1GZu1Ta@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTfKDjhEPbjuHJzg4rHx7tSFUxEdBKRoE8bLDPvAlwIDkAWp0
	jsujJjk6fgNx5j++gqGLvspE36Eidz7C5dew70YmkT1BG7Mcbd40SwLJBJVYynWJilZJ1R5ErEq
	EWYT1qK0QV1VEqe7wU6pPO/uf4eCEdpqubk44Q92aVj4C55g2VRvp5xXNNz0nEdNB0ALg
X-Gm-Gg: AeBDievSxH13ESmw2j2ZB8capg1V5gaDp3UwySP6NcvS1x4SphOyWbXn7KlMA2NqWdx
	yecxG3hjFcrOuF8zA3ApjLtnQD1PQxgpvsNfXqOt4jWhqOhNshJshxQ73I1lHQ0nbVyEvOI/tqB
	7A3sl9lOxrZvCxDUTyuD/rN/3KgsLnmUmH4AuZ4uphSvM9AtXhaZnbFb9p3kj86V8/ZrA5i5h06
	YfjC1E0M33TW74BIAwiiLUKUUI3qcUMFPDZcyzNs6nJq6TybtKUVi1hBKQZ6NrTlAMx/IO+kPVO
	wvwDO4eEXSlq4lNKz3kvlIJ1aXk7THiiroSpizL0rQZhdvHhiQWzu1bfQZHAeP5NFsVd+VDpoqo
	kQUihewGJeOGEViS/IDOSAZS18a/pFAo2ZOXmN7yS1HaClEkpeJQJbwlqvSviy3jGH/MxJ1RwVL
	r7bTVqo/zcuREbU0e41lZPyPvrNZUFyWEGc9QmOO5fUnjZPg==
X-Received: by 2002:ac8:5889:0:b0:50d:a8f5:1bff with SMTP id d75a77b69052e-50dd5b30fb6mr376511721cf.9.1776338793075;
        Thu, 16 Apr 2026 04:26:33 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:50d:a8f5:1bff with SMTP id d75a77b69052e-50dd5b30fb6mr376511431cf.9.1776338792630;
        Thu, 16 Apr 2026 04:26:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm1220326e87.10.2026.04.16.04.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:26:31 -0700 (PDT)
Date: Thu, 16 Apr 2026 14:26:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <czcgifek5luglduvk25u3d2kltwis56333icdvol2vh7dvhgta@3qfddjrsvmte>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
 <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: O-V9_SpmXfg9TVIPWkOeB_SsqCAJhL4n
X-Proofpoint-ORIG-GUID: O-V9_SpmXfg9TVIPWkOeB_SsqCAJhL4n
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0c769 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qAkFtAADdWEuSrs4xykA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwOCBTYWx0ZWRfX6vbiaz2HrV4N
 kGXEE9qDb9LOpVMQBlRSfi6I5vlTihJeVLxM/4O5phoa5i29TmWsj+6o4hclxMlXZBRC/HccsTs
 MwtFtRaEt/05zDvo34EwjfDHG2Ckz1sQFjAMQeVYBGYiTnqYb/z3C2BVAs/Zp+tpKmGZPkBZa0l
 6aHqGk8vc9y0MYtN5xyG/KIHgdylwawDwnp8c0KfxrAPIKM4MjwedGfJpgX1UnsEyMWIMFEwrKW
 zcp7QGWPZjAPFC4E3gwhNJ6MqIQK9M7PJn65xhJLp/4zmc5vLxJpkZ1E27kH5c0qOANOhADpJzz
 lB3i2WzXnit95QbMXsHCC0w33c5yKRC/0XEqcIzHK/41sSYg4wZ07pgNujtLmKLzX6Dhswhe/il
 0boechOButOJQwb7r+pefcsBRHmYGsTLs1AjgIFSyw08oFlKa8wKGrzt+eVF+my/Ia5SPfgtQxc
 Z57LtfbT0DQ9yYaVuNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160108
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103385-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C55440D733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:26:16PM +0800, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> controlled alloc/free and ensures memory is reclaimed only when the DSP
> shuts down.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
>  1 file changed, 53 insertions(+), 51 deletions(-)
> 

This patch applies neither to linux-next nor to the 7.0 branch. What was
the base for this series?

-- 
With best wishes
Dmitry

