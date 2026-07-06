Return-Path: <linux-arm-msm+bounces-116693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RDNwEKV1S2o7RwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:30:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D080670E9C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WBg5WWbV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KSNZOMPK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DF6731E1A99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA370409132;
	Mon,  6 Jul 2026 08:44:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE63BBFAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327468; cv=none; b=hMddUS8IVD0jJ+iOy/M9ppyXn23eTmkgOsFGKoQEg1gV5y9y0awmoMVRAGu46S2SnxaeC4RzpvTZe2slJKny1ALXzY8YYPjN7a8Oki0xgM7bOYDuL0U7qmtKRwGAglxPbGjiU01X0wegJgvJiMvXesw0XdMNpYTphnP6hedqC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327468; c=relaxed/simple;
	bh=oK0NQYPrvhisX4lCBFAC7QmI/WS2T6aMcGlWsYUvpP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tm0lgxQohwhH4zea6K4MywxVVJvI23Ujie5BJ/Bzyrb8ijRJVBuIgOqXE43J3sncEXznpst6a6Hrik9b7MCXjKXsNtW1Q6OrCMzmJAaY0/82c20idDCI3HIlH63V6DRE+7oeg/dCkekza1P80+7OwkMEAtdnaads+zkAxhSPxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBg5WWbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSNZOMPK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667C9Ah3845166
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=; b=WBg5WWbVCp2776Y0
	GL5MhGPOmGbuGB1bYx85IqFwSE/YFbWe0cwzCSx1i3UCsmY/uYq7VE5bvpvbuy2S
	cog0YFdB57IQ+RCJd5CjP54/2i2MDUtgcHLzY12hTt4iWBp5e7t54UzUxGucerVZ
	/OxxEHL/x2bp3DLwZLsCk4+HjNqFxcz7IPRV+cTW/6XjwnGkHpGyyCK0gAEnBlN/
	mDVZaZXzu6DT57CTUO77jc6AfsPXKofcXNOrlfdPrqpRTduzHt+66mSlxaaa9Baf
	AzjJR72lfUpiZHX1GVfYSkEUAavCp9yE/QHVdWMzPC6naR2UTdk5ArV0wpOixKxc
	ee/SAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrbv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:44:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so10811001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327454; x=1783932254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=KSNZOMPK3QNXNKfcvRpkyviMnoGleNq1xWfURObce4W8yIegjIM6eIGZ/F6FSeNVDV
         FhULOqn4g7//t7+qxscBdNDbZNHnI9aPRFpCtS2kNFWWhYjzQYYCBUL2Lr1st0mPn4Ld
         Ih3nTPOiW37eWgWreqKsIJ2UwuLD4EhWWDZLoK4Noql1jWUijZUfrWEt3EXqsH52HQy6
         IPNCpunhxbe0AhhMZVefHCLJQ7axlBmYk9QVgmX0Ci3Sv326MiP+Ya6qzVQv+zkTo7oK
         p4Bol48K3T6j5Td9lTa8a3TBCxv45BDkzapXmw5LXGHQRMSlLOeKfSwgVlpk1r+ghBe7
         E83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327454; x=1783932254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=M/NCSxOfweCC18wZctKmHhq4LhLN+X1vDnTLAvcbTDt+7qfs3iu2vIaXOmViYJAdF8
         kQYb74E7188RpVWmGhMU2mBGdy9mAz+tPnaX/tjmbF3+vuXGcqQ49Ja5zPo6WaffeyMM
         FI8/w3Cn0nz5gZofx9F74oxwD0pPnY/Be8YC13Dyh/uXFdZeCBYDWGzLVsY9yljJqtld
         h5YOGQrIXTuWjg/g5fkFrydac0XTM9MxppTCEHSH6PqGQgwPPrcIJMO9OHlH1LxNpk2i
         DBOm+qFvcBmaHyOQ3y0LEID0x3HYSJ+VjZ41PmQp+dhAC+3D/sC7ZvbIKWrB9v5BYSMy
         TU3A==
X-Forwarded-Encrypted: i=1; AHgh+RoewDKc1uU9t0MUJ59VFvMGXu7n4wSM0wX2bc0eJmvHAiZ1v2NG7eAvDOnITmFe+DCYq6dzpjR6LXc+Eg8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/LA7NdmcO70gvMdkO/Sw1dlcb6L0iGBNGqurTdzDIgKELfxh
	3QmX0JYSGeZnvUyfU9/bAE4qfNGAFQXN805DZ8wHHAdzlPMV85UyQQR8ayhOIbYcT6wxzcwhvAw
	iuDJRgUf+XR90BKMfSP6ajFgvCUJiCrvhSfz5CEevcSoaJFS3EL8grHoyTdLWzrPnJ7WC
X-Gm-Gg: AfdE7cm1vc+0VlzyjeSMdnanamCP8Rl21F5cTjBUV5ng3tAjMCNy92XBc98PLVJ7wGf
	KNyqdLtE65kDJj645oTTwn7dWbnapMxXO9OLDYVYJu3w2N9Q++mcWvouLgHoEfpY/IG0WrDEhIG
	Cj+EZ8jkbjxMk3HRz4P0hpe/pGKMWFaOTSRtjlX4KeC9l7QNcumh/QCuGEx05gcGTPeoYLXPQDE
	Rd4VX5XPeYkNnPxTkqh6i0850oQT9fmOlS6bNsCVMcIKD5cRf4FFTb75xh4+hrsVzuOt3fZmVzM
	MYjGRurXGl1X1wieMntpc2XNZp1YVI5ZBi0Z4fXUOE56Y0t24SDVVhJSRd1JbnDCFxP+biAfu1d
	lPRrkD5nGMsflHbrnfTDHhwTVVzXU4Adt7xw=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275971cf.10.1783327454511;
        Mon, 06 Jul 2026 01:44:14 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275551cf.10.1783327453661;
        Mon, 06 Jul 2026 01:44:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62fc72dsm702939866b.63.2026.07.06.01.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:44:12 -0700 (PDT)
Message-ID: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:44:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RQRBbZJ_lnuml-rSfTfxLTq5LMLsQs79
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6adf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=NiyOziKYwqrvXK6gfTIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX/c6t2TC/2Tpj
 As4WeHfXtN9ZpiIiP/psPSnwYxZXmWRl73RotWhF2Ka/wcWCAY2ydcIksrvkcV6fcrFITQeIXK2
 c2GKkL3MLapZmCDCcTR3hvyUnf/oRaA=
X-Proofpoint-GUID: RQRBbZJ_lnuml-rSfTfxLTq5LMLsQs79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX3deJbfQjCqGT
 1DrRjtk9RW/tAEqIuAgGI7pQ3y332i/TTwUAb1g40Eo7m4+w/1lOvJh9RzA0HNTrbCAXlcPX/hj
 WwLuCFSSIuPFebXfApeSUBrZTLHPUJP2zjkn8ZIe5rrar9Q3ADqqR+e1q6RRMvMrhqhed8fCQ8h
 m1YnsTPtL34d1nGYgQW+gkpcfUdtAE4PtjYtysYoKS4f7kN/c9RCdyeqQNulKGcE8mv+hxjvSH9
 62OP9SpsVIEofCkseqGl5LYyvrxwBrpd1mRQPHOtdVm1WoX7R3dYZTv2bobaL5trotLE12Elmeo
 WFg+kYu8UknstYXd9zKyPb1tQQaxmqL9Bdx3lBgljfz5lNwydomhT2DHi2vNiRpbT6yOwYQUdTl
 eSGbFThsnwdzr+jkK/FgHUFuRYIH1YS8Em8k0GbeneCEuvflHaJtWEg4SKTnX8eeCcEanQRMNTa
 Qvs/q0L23RAkV9JBrLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D080670E9C5

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

I believe some/all of these writes need to be guarded by if (has_lpac),
as many GPUs lack these registers and there may be side effects on
others


[...]

>  		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
> -						      sizeof(u32) * gpu->nr_rings,
> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),

Should we rename nr_rings to something like nr_XXX_rings
where XXX is some uarch-generic (i.e. not SQE because we also
support pre-a6xx) name for the main number cruncher?

Konrad

