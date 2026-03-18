Return-Path: <linux-arm-msm+bounces-98402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKs4CpN/ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E33AB2B9F84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C95B30010D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FB5346E51;
	Wed, 18 Mar 2026 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo+ZxrQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JX8cEdI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76B31987D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830031; cv=none; b=kXip8Y4VswA1NNJmqOxfyMfaf1UR/ccrIKqSJITxQsbSOy1wJgSqXU+T//QIfU8U1zP82sr9WGj4GBqG5SHthggojxXpcRzxzWakNpWHy1Xm6EwrR2+bHLBDZrIzf96WOHFeLm//owMTIBE1Xt9+ERvtRlfMUO0efUUdNPRgm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830031; c=relaxed/simple;
	bh=ERlnUCxgmHITysIxRpC52pmGEdsYSIefrupc3rtlbd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSdjkXGVBL7WwhLSVDwjh1oqDM4efXIth+IRwSM41i3H8Rp4IcSnWsXvT5nhjB5ofVPoywL8tQoYe9vSfRXtBpvOvUYGbIXHfhAZLR0NyXImTIu8/c0uFOcEGEouASAp6AHFYn0CMQoGXixA4KzAL9AELwX0vcO6Ra+aXMXoMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo+ZxrQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JX8cEdI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8HE0X1050213
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jTjgKhjwSus3+BKmKZjdNd7q
	Hwr7M6jiBm+FHwhdlrM=; b=Wo+ZxrQoRLfmgVM/YUIpe4YItA9s6T1TXNqGQQ66
	clFUWiI5c3IzQ9KveoHB7KlzAqK/x2458g1qjzgcNTRZqn9cWRA73aX3jeEbh3C8
	BBZoaSN8AC//eGgHKGUZK0B3L1DS9rcaHSOlZD290PZay0/QcRtkdIQJ7sCFI742
	dCfKdz/Orx5QvHbcPi0jqDbJbSjButghbdIrrYsn6TEHlbrcrhAANPlAISMX62mg
	ohBIkYFu1ZoJKAKB5DM7UXmEv8NvJbTb2/rakDlLFUVAkX7rhp9vxSrlqw/5N/BN
	NckPJLiBS0aZZ1CovJNlVIxwuvCA5hDgKj4Fv2kM7vpVGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej3a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so56766311cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830029; x=1774434829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTjgKhjwSus3+BKmKZjdNd7qHwr7M6jiBm+FHwhdlrM=;
        b=JX8cEdI58Ba9xefSqvFJLoAJJ2xD06R391qXceOy6hhwj/38z3ToAsIyIV2ErRERRK
         q8ND7C0eVh8bMnvugu0XwmXjX4KhQGUvHDL5F19G0b/bucHWPAje+X+z3/ltGsZZzqwp
         h91rkaUv4fB7PdMAAh2puSef3+q6fJDG3ssZuv6+EuQXeiKCV4oXIRj1TZDfWhb/w1E3
         lvR46EIpEGcJAPi+mJgaMVCVwXaHt0rVLFB3jSLTcr7NgfBHu7hmsYDgAIhiMYJcBXTc
         g+cOjFK0dKEIPq8p+UppNh7aD1qYMFqZjpTJj5i6ZdMhxHIIWA5vbXYHjKnzIBlA45cM
         pE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830029; x=1774434829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTjgKhjwSus3+BKmKZjdNd7qHwr7M6jiBm+FHwhdlrM=;
        b=H4+D2/4fYzJxnE0S1zizIciFPZtcvTsUC6sjxDi8OM6gwRZ8UEm2y4sG0/dcl6ChC0
         UxqBxxf1ngRUAi5DU3niVy1DG8HRJmCH1wLDaLDFfBs3PWv5qeauA7SuCnzpOlpTnNS4
         5ok4X4vJwpsYaw9Bj85RWKrA4WMRCsJ5Mo7hHqnnz4WLMH0gqSJvJt6yYO2sC8unoWXf
         UeuTUJ/CjhBF9AogmgKSSSfM5l1d+HU7G3Ok840lEgQh2nN3dNWOQqH8d0avTqbEFa/m
         Db3+LuEE1+bJjpPX0iKzS2dzu1wlQexcdpvObGnzSM6i/BOU617T4TkrxOfzhFlVZI8u
         lhmg==
X-Forwarded-Encrypted: i=1; AJvYcCV6mJFhdAzadhhMuIMNh/5+es8My/c/OeisJT3LEWsFXC+m3UNiojNLQtzCXCWExh2wlcqiGrQeSIeGnsfI@vger.kernel.org
X-Gm-Message-State: AOJu0YxURD1hN2tz+XRkosiK8jADfdLiGpp+utMeF+kED5G8Oszlnrl+
	pxoeCJPyA3V0EHbWD3Lxz723qFnQdPIRwMWZg7HEomwT9JBCWmRqz4KHSHsvJpC9uTBneSZuHBq
	ttP55F+5Iiole/n8UxNkEBHsUNv8Ove3ktpTJYl1dfRyPXEcEuNn3Jjcj9Gsya4PmL+OF
X-Gm-Gg: ATEYQzzIdiP0Vy9M+3j8QPxvJKJ9PYS9s9kLIfdDNu34R8+m+XO/QQmGW5UeBQ+KHiV
	zDNCHb3Cni4aCCs+ui3r28iIhWJIKrxhfUK6ZvGcx8zvSsudxR+l9mgx66USBVUEWN6qkU0ETMc
	Q/+dzz9iIc+6Y9ZOiGtVk2SX0fd59spQozMrcjrhRUmrAEsgdbPZigpW+hqpmxluo+3wGEtpeC8
	jzdKT6lFIpoJibXrAycVDrosmWmHFnVOIoQoHJms2ZGWhJI2NhazPxWwS+Z7hlJERshMsguOcAk
	dWQIVRO8EkCoIXQYADB+DHgUGNK7GwkYqn6omqFv2nV4wFaPFlginRFgEbUEhmEiZpty/NzY933
	vHRtge+6r2KkbKdt2Sk5h7wEFBcK4nPlIetaCKipl5zN+P1FqUn6+5mpAq3C31i0gRvl3UO2LJW
	MHeuJB6xHOH37Sr10IDHX/0pJdNGb9EWTNDLc=
X-Received: by 2002:a05:622a:146:b0:509:2222:4202 with SMTP id d75a77b69052e-50b149046demr30799291cf.71.1773830028949;
        Wed, 18 Mar 2026 03:33:48 -0700 (PDT)
X-Received: by 2002:a05:622a:146:b0:509:2222:4202 with SMTP id d75a77b69052e-50b149046demr30799101cf.71.1773830028499;
        Wed, 18 Mar 2026 03:33:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5157429sm5139301fa.2.2026.03.18.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:33:47 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:33:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices
 in one packet
Message-ID: <rrgnyzpxo6g3ufjcnxnshexjotyq3riruc6wqjhirmcjo4qdta@gmwhs3mu2xld>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba7f8d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=T2ZltfVFVEVyCiQaPD4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfXyKleX1RoQKPY
 mqwc8J7vl8assxORH0YwA7Xk+06RcuzvWHQqsV4ZwhwGLSGiPbtQUzdJ/IqxJQfRNV8rv6OqaBn
 vHGgpqby9tFIvDmQ/QI0LmEk7/U769cs3P2on1lteKErYik3QqjxyYHEj4szX76HPAmSyVW9LA1
 1Ej1itgBRnQSRDJJglWvPMy+Iz6Qa9DhHvaVTfoe5xGJpkvyaLd3hQ+NFbPhGpV5iZeQJiwzCOP
 1CW9QCfZt1EMgLpjw87WT4/cQMsH/9edj5eLQcnIaR04rKjnfpOtjESPJgWPqUr0erHqZqeGJPp
 6tdH57ECKDgyfY5tOVB9oafM64dj5xcXp6Gk8v+R++ECF1upUTocf306FJP3ZheMJ3Crc36Unzn
 TLzC6Q+SrVfLsxwZFVlEZyrAS1gD0nx9pfagjQGABsu36o5+iDfsiKECd6R7sHkx5QvL78TMU4f
 HaJAlnfta2MrkPo0FlA==
X-Proofpoint-GUID: sbeDHtTrCb-ZK2hfhge9GhF1aKdWtlZW
X-Proofpoint-ORIG-GUID: sbeDHtTrCb-ZK2hfhge9GhF1aKdWtlZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98402-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:email,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E33AB2B9F84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:54:04AM +0000, Alexander Koskovich wrote:
> The MIPI DSI v1.3 spec defines two modes for transporting compressed
> pixel data: one slice per packet or multiple slice widths in a single
> packet (Section 8.8.24 Figure 40).
> 
> Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
> set to indicate that all DSC slices for a line should be packed into a
> single packet. When unset should default to 1 slice per packet.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As I wrote for v1, I'd prefer to get more opinions before applying

> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry

