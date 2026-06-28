Return-Path: <linux-arm-msm+bounces-114805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q78fFx2lQWrlswkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:50:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E416D52CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TNgb6CGJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gblIouv7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114805-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114805-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E727F300764C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 22:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191F0371D1D;
	Sun, 28 Jun 2026 22:50:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9D36827E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687002; cv=none; b=YbLRTD7INNX41nlk35T202Zu07QohycbkqNNXyqsh1uWYyE1G/X99Ox8mWgUJD4kjVIsnDl7ZcUzDmxeIAhNEwc5heD2wp/e4luHTmljzNTZNTTF/zYWrKFf36j0V9GMkxXHlzkDHr/4H3AVGnob4xUYFUef7Py+JR+/eqXBik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687002; c=relaxed/simple;
	bh=GZxYSfE4fIDtRxdjBvmjABfjxCxc7sJWSoAYjE6KcOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC/y++Wzk4Hb9I9nFDbipn5ZEnL0kO+myXmYNWDRcaz32KwYtv/dqvtHyrFBVkboCRXKciJc/91pJUrWuKCgwFAh9lQzSL5RynS0GzlJcMiJbAqnxte1IcIZkTd74YQeVaMOEUs+yhi04G2gF2A2VNeS3wUQFoFHOwbh0sIFMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNgb6CGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gblIouv7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMA4Xv939455
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JYOeB9wXREvb/kPXlH/uSBNj
	P/9Wet3bk3Yudk2xHjY=; b=TNgb6CGJ1Q0zM/RkqqlO050O65PgXwERKDt8KdQH
	HG2zEfeMv9xdcLl4NAknubrRRPHSLUzNmEP9U6pqJ95hCaHPyjibqiXsSKOo5sbL
	cGdaN+Z4bq+WYnT/zT3immPtN4qTYkqW/luUFJJQ3kBb3rSfgGL9X8uEtX7UaNJF
	zAzt4+8XMg/2tFwVnZaqyq6WgnbNRvf928hV1p0g45fP/Xaf9+nty0xC0UdVtEQP
	xi2MX8a+zibiz7K82RGUnvX/LoVPSeQFvhzoQExiVTCFc5uI1Yq8c9luG6lcyqFa
	QbmXJCb8wV+D400Pli12Cku4keg5bts2SAbjDXLjqJFQZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf3knq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e0df2461fdso87445536d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782686999; x=1783291799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=gblIouv7fLs8xlJc9GyzdJE7plsmwDKoXMdyLwv8NJkSdfaJV4PJ50R0Vs1ryoxO73
         E26kL6bbMKNLV3kMrsFwM5tdgrTGp78xZRu79ORb9hFmfbumNpT0NKdVrHS8Brwj/p6+
         nzZ2HBG88h1NzUUKnbZ+pvqBG6YepQT8SNKIFIvzdc26XWxOTgGOIIxuvbrPJxnWvfX/
         q2Efiur62SM3dwxQ6hTpSOmICjqGwUOZGHyhmiPnTyOgwHFZuGrmZndv8gEG3Fhj+YXi
         JA6ROWfcS80bxaLYCWsslBCLgOLIEzoMBFkgMtc/SDeG8TdKf7kE5kWxnPo2XC9m7Xck
         8vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782686999; x=1783291799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=dtkIDYlVdIT/gLOl1vlwOCoh5sP4MjVrrHjhhinEuBpcbqYmj+2+Bth8asgSyy3Bif
         DpVw4LSgTzUwNkM904yupejcXUmdpJiRzBqlXerzTDgoSTO9rxMsau8kRvNf8JWAFffA
         YCiNn6l0SS8sl+WgI8lhbDX5gUUBqoWHyCK4wMaHbLVW/ggX8grAY4zYFEV4506Z2W/X
         ARzeEgZ2mq+IB6lRDgTcfGRMNHu4vIcDZ2i5G8e2iCKdx2TEKKZAmWP+od4/eT9+U2tf
         kNsLfacn8+QgJhoAx342tEz4dAyJOezvWqfuWOPufHKEbGK3MyIo7ygOalNhBPzrZAa2
         KRnA==
X-Forwarded-Encrypted: i=1; AFNElJ/75nbcZEWxvStGoyRARYTz9uM6f1tAugiLQm+0L5MzQEjqmLUX7kRUb2FZNXErNnriJSiK6ELrs+LEgpGO@vger.kernel.org
X-Gm-Message-State: AOJu0YxexCyfnfU5eP09Q5vpO3/sfXz5s/v6Z8n/m8BTzvPZhSNfWNx+
	wxUEFxYW9KnOqaCqfYy7JOIhChLYmxGEjzjpjun3934ZJh6PX4HdCYwvU++WWHcM8s3/RWFsmeB
	FcvPFnm0NPBlWwejHcXQo21qC6NPwHSYm+LXqDYuJYv1ZTCWQjJ1IzFNJO6lOe6+0GzGO
X-Gm-Gg: AfdE7clBMk78/zOOYbu51DZSD36yr0u3VFX1lTzm1DtRjs2eFEzh77lSJ8O701AKOVh
	Ueoxv9dfoqeXLMCfwjbBLkEl3TJJCn2Rrp0XU2xDc+pHdgUW3EnPpQ8lAyh1gplKtzVictxtDTj
	nlsI/MvVb4OtRoDT8nR7guSn4bGm+Pgb8CUl+rMJXif+KdzncGdte6TUnSzLYggE+DqZ/Y7+4qv
	ddAcqUavCU73SUkpLHQh5AgNuCb14mQHMln1GF+jvqe9WksQiNwWK9jcS3G2gagWVVJZnig7wQE
	dAeX9ZofALAgGD1Au0dY6p2/m9hDiEU6z4XvD2e5enTh+gcRQvoigvBDo9QNxzekSx4Xjt3H6Dz
	qc6Zk3KSMoz8LCm3YihZgVIVKPAC/mi7iyYPp86pDMx7mUXIQY5xpOxIHd818QBK0Tc5CgH9SZM
	oG5iNxRTePIRitEMvNE+APFsph
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205794685a.35.1782686999086;
        Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205791185a.35.1782686998633;
        Sun, 28 Jun 2026 15:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afc749csm74899421fa.12.2026.06.28.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:49:56 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:49:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
Message-ID: <ilwsmzpebxsobixd6xwgkr2dajsza3dr2ghcxfig2m6vhcamj4@but7o2rxmmrr>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX5qF8ADXpm0PK
 3mnmuGMZft5YMIkviPT33xgGLcS+m3BB+sl8F0L18aVSQp5gSDMiGG2o1dIh/oWX5LvJiz6zyzH
 HRYOQsdHNtTe32LjigPPvPxQ8o21pvA=
X-Proofpoint-GUID: 92e5ReW8CwQsoI70PbNEswyxhJtE3zTL
X-Proofpoint-ORIG-GUID: 92e5ReW8CwQsoI70PbNEswyxhJtE3zTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfXxZ07DIODjKuE
 pxqfZzumuVkAF2vCCoI0JlshCQpReZKwQySixYEi9XLmoaNuUj5mQgkPrFSuv/7bDL/SmUjcCrQ
 zfDYVin0JFK/rgrwECqyERSIyLu0296VqoEvSi+G0BNcoLv1FRpekP/G9tXKaFHXQLZBOH6c9D9
 qYXYzEtLb652f53i/AuBWXt/+h9vRk6k/IU7XpeqB28hHSNO8ro1eb3j4DrBgtE2BqM4tZhFsyQ
 Z61Rkod/uRjegx69Ne3LgGJu1QR2/am9sBABWkucJiFXwT9J7qk2Qr5mJf9wxvTHUfUlDmrjeE2
 2Yuc/zOlE7fp3YOIHq8pYZi7mubwfExnplgxvlxlsihPqyJ3hZSAxVYdIIooAiiaMpvh3HYKgHv
 O34cqIxid/buVNglGIrIJCCkAc/eh8JWz5EYL+RhaN1cV4mM/vdyI+lrLoKEhLnfBaLnwL9v7bw
 xPdSuKSvEn2TjffKPIw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41a518 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:imran.shaik@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,but7o2rxmmrr:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6E416D52CD

On Sun, Jun 28, 2026 at 11:53:57PM +0530, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

