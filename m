Return-Path: <linux-arm-msm+bounces-93840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJuOHGXYnGkFLwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:44:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D917E853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6152F3056171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2443E3EBF10;
	Mon, 23 Feb 2026 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIL0pWDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyneIuo1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420F23D2A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886434; cv=none; b=q+Fake/QslXhezhkP/L0x7W3LtQdASqsD3EYoPvlhS+92OD/yxjy6LvHxlRYaVqP8xLSAiW7eY5jBG9gbiQtBw+q5vDsm8kBcFmd+LLoCldDhgxgZSovCue/nww2Bucz3P8zeTKwrysogKYsezML6DrGidWOMPjlppzxgPTXGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886434; c=relaxed/simple;
	bh=Qih0QhTFQ3wj9ErAiKpynh4DfMe40Ro0OOLK8vFqRyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPQj3cBxduItmYC0ei2C4G6H1ZEVGcxO/rXhhkDKCeYCebJpuTgBnJpBEM4lfbti06ZhLXRHxCpG5eHGnePca+a709YG1xEU9F7azVjODZ4lIzHhszmgyWSjmbQGLe5qkudo0rTjUIo2Q+NOFjptKudGutOynFl4H5jtBFqn3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIL0pWDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyneIuo1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIeYGP3409241
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u/ELNB5NNSNmVG1lAxOxXYaU
	P/G6z2rnLtuVVe2l8Dc=; b=CIL0pWDyAHnR5vXk18SDZA7lb6nyCoTjULcjQfez
	Fd8EZfTPq5EtM25/5Al218WuFiIs1Mds6C/q0/EfPi6fYF11Kjzwx6jCUAbIgDF3
	A1rfdspmIF8aTktTYjxCTIWXiOVT49AQe6OgVD/d7sqgV9sm429j8EW2IRKZz4jR
	fB5J9wnQcdSkjZaVqOSd5qSOwTco8FKnmcALeH23N4obi36U1A7KduH1zlGlZF0v
	fzA8y6OA1hpylxOWNBU4cB3CfpjfygvgTMTuSKgbyOZQlcaUIs+2f9R6JhJfZLxW
	zAHG0AR/GsaSlxM7FdpK2WFea2c5ABblEUPd36w12xuwXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tt431-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89700915423so9096096d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886431; x=1772491231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=WyneIuo1J1f2eXXF7uTdQXyXG6wN32O+HKc1UDkmHI5EpM8f7T5n7bEGnHXQ/vUKPt
         WzcB17nSGM9jtt/hdXfw/UvMLZ234/fIAJpYpDjUZP5K/wMR3kWtqogEBN07mPWW0AX5
         XSgwQk1/7Iy/CloixO9TBbTQkkL+BnQbFN2aN0jg3sCsSuBwQU/XZbx6X8yWC5jt7YKR
         52IS3PjZFi5Kx1G/dAsuPwAbah07K5L6zLVH7ocKymB0GW5It67KZ95QTIAxb3Gffc4C
         rUgVMIpk/cC1ySB+2wOyEGrazESV8BtrEJW1uRtKKwssYVHE9Cqr8uoJHiIG1liqB8nP
         fUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886431; x=1772491231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=fw2wbEegTJHM2D/aeIx+EDLGCdWwzmM/bckVyKofFk30lBr3kGUvuwUW52Mu+/pofv
         zF20XhbujbheGMervY7lVVO5tkvonhE9udybs9hWdgQ48lHX2RjqY9I2UexTQPuQ2NK+
         l3S0RLP2VlWEcr4tdXayF63hZw1a9NnzwLR3tgReVPCbXrXFJddg5KzCIthNui1NdvTc
         XjoeE+/yhDhA+/vcpB4HJvSC+HC4lLkZApDiHWPsgzirH/un1IyaU42I+vP+i1QlbGqC
         EAe0+aFwMRKx7EDkMQ+BzX0aIDueTb+XlGCYl1D6cxbHJ9Buli0kpNziZYNkZ9vScan0
         q6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH/0fg5p+PDmLOo1MTWAZb3PIrjAz8AWhoQre1WNo9KvzqtgufeXPrdb+TNopUsdgFd2FCuZggg2K7AUvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzS9chAb4HoFyu9cL4UbhhhLOoIZjS5j41jvm4GBpZfcO5ew3
	qIVr0/EbJL4VBWstIV12BAjW6a7hVAoBYpNXprz6U/QJsMJ14sXSSQFHRKbmk/ukfpQ+oKhGbSq
	FG7bUscfTyH6RUoJBVsJzxLdjE3R8kXnmN2TXVPvs+c7LDWQx1EjhsErqxydr0qBTjs5Q
X-Gm-Gg: AZuq6aL0SHl1NrJvk6N7rRDdabFyPEtsrAyT4PxE017D+fQzKU2JAhiaQ+HlvuI8rj7
	K5Ijmq6hz2HGdbKFB9Djt7QSiNRlSqoLSJpWiICvX8YkOstX5fAX1eoTkVAs3KumY3McNgHEWL9
	ak/4R1vCTwRmo5f4aRq7frIjU8ImlNGhOihDFzn4TSQDoMRW6GIKN7p2o3aMNFLIQKCmubNna7n
	5m1bP/DNFMQ/Akn03ye023SFPhYmhrf6y+KR/NW+S+cORGp2z4mfQ3whQ92XTPkCZIinFwFawhd
	iTHij6gjifxQfoigjFqb96z0UX53bwCuPDCWsv7P0CGKCH5kWpTZaTzoLFDaFs8HYk8vWoA5fiY
	uW20qc8M7nKqaPnPt24dF5YcLwt2OZQAWVgtgG4on7ixMPSKVlv0reaZqxlgKxLZIRHwFkvHcU0
	ssw7PHZBOStyBrIJl1HOZ0ziqlpTUFnh/LRfc=
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266005585a.25.1771886431273;
        Mon, 23 Feb 2026 14:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266002285a.25.1771886430804;
        Mon, 23 Feb 2026 14:40:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm18140691fa.13.2026.02.23.14.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:40:28 -0800 (PST)
Date: Tue, 24 Feb 2026 00:40:25 +0200
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
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Message-ID: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699cd760 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=gmMn6fPPSMme9wD3190A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 8rc9cMiQrd3XfmEihWgGe8-F2II7uHGT
X-Proofpoint-GUID: 8rc9cMiQrd3XfmEihWgGe8-F2II7uHGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfXwtJLlS9kU4eW
 7W4VJxZxQSgsRKxjhG6tRjBUpOrZL0bgzSI2k2GTr54CHzfuoDPfWWI2xsAOrIUZHBjC8wzBqPQ
 qcMumGP1EyFvIQU7/SlT1sI/VlLS8S3t/ik2Wiuyx4DMKMn+Lqb/DgKfNTXDL7DLjzv0P1I3vPA
 SNucRfsijoVOLmXTAigvSJ0SIs4qclQnCzR5D6QFgPqKxVQlb2pmlYn09G5nfLpPWNlU8IBoqL/
 dO72v/MLfWOJgGVAXxzORA6k4MdBF7ugHtDrndxhfK8gTr8kD+TtJ7RXjAsnsnp4lHaLhuq6+Gu
 6ShiMloUqfbEuRQDHh5X4a0ovG4D5q5oHgChYDiEYZsk4qM10Pd6QVLyBDgx+Y7rSb6FDPInR8d
 vIxNAzpGd8XiHfElOz/6aQKZLzFOfhMIxMO90nqz7F0su5evf3Afy+a/7tNZMzRo9i/NGUhPfng
 SLHDpl4zQuF/6aPh2VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93840-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC0D917E853
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
> driver. The entry lists the primary maintainer, the linux-arm-msm and
> dri-devel mailing lists, and covers all source files under
> drivers/accel/qda, Documentation/accel/qda and the UAPI header
> include/uapi/drm/qda_accel.h.
> 
> This ensures that patches to the QDA driver and its public API are
> tracked and routed to the appropriate reviewers as the driver is
> integrated into the DRM accel subsystem.

Please add it in the first patch.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71f76fddebbf..78b8b82a6370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21691,6 +21691,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>  F:	drivers/crypto/qce/
>  
> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qda/
> +F:	drivers/accel/qda/
> +F:	include/uapi/drm/qda_accel.h
> +
>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>  M:	Timur Tabi <timur@kernel.org>
>  L:	netdev@vger.kernel.org
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

