Return-Path: <linux-arm-msm+bounces-101815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9vFZNjKG0Wk2KwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:44:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2039CA07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1B79300A4DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BAC346FC0;
	Sat,  4 Apr 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6MeK2c6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkXPF1tn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42422777FC
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339056; cv=none; b=QvHb6+eQ9z3oGKCrGyIRaGUAS3Fb37txi36DHNBSTOHFouQtGBnJqs3zEoHNWoUQuI7CAZUAa4Ubo2Fkf441FZuMcW5LgJKoeg0kJyr/QKoQY/SSpIMLL1V2p3Rp9FKuMKIKJ8l4wsrD5vGT0sb6Y4zqNUQ9ns5e2t/V9aGezn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339056; c=relaxed/simple;
	bh=Wq9Npxav3ojT30mc/0QFoOV8vT0/M/+4DnebIc8PfbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy0wTS9eU6PM+jx+R44Gj8HC784qpAN6fKRyTV+WpiZ3xo3OA/2myVpiAHLdgMKg5g1XHfUxSoakDgGb3fEUipVPFaGwYwKeQB+Z8kbfDE52UsBWoYZSh/mfCxRAw+j5ho3qhR/CsN7GsiQb/prXE5SQhIIycc2oC7/xIHkCZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6MeK2c6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkXPF1tn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428cCM2408301
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1lqoTHHtvZmQw4ap8o2vp4C
	/j3uIcLBtxHCYWfV8yo=; b=J6MeK2c6jho5YyWLXnStUGAJCHSAIxta/xj1C1K8
	t8gyifGHUO4sj3l8R+9ExHrIrzRowGUgtstKJMdbGw0Bv7v3KW0dxTv/89NBSDc1
	eFsImhTW/Ckuj1b64mSD5p1vgZjtA7J3OArELnTsL1hERrkTG3jXmq83h37RaLH4
	T2ksbub0Q+8Yle/ReJ29xJtOtZHrOJJFXGsvr0+tIoBTCZaz//+jSZB6XfXUJugK
	RV1RXdY4iy16u2EsrXUqUFaROkIU3IiKBnel7xouy61gOf9HCh8A+w7GhepMZuXD
	IkcMz+TyEMsU5jC4OJbjBf2xolr/cVGuJ+890uE40e1NfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhnhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:44:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d76f460b2so30410631cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339053; x=1775943853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M1lqoTHHtvZmQw4ap8o2vp4C/j3uIcLBtxHCYWfV8yo=;
        b=GkXPF1tn1t6dfJr5+zaO9+wyLYanpJ5klVF5T4fVKljhNDf/i/8orFiFw/eroBeyNM
         7BdebEg2f2wqpxrYDMF9Evkg/aTNnwmdBUZD9DuV+tFvWETxE6V0r3uHhNxJIjx6X0xV
         sCQDiw3N7kPl+conmFcg/FKJH++l8aV0HED2or/4RIu/ITXmY6iYhOVUyMpkbZYtMHEu
         XFw75dseECDQvwXxOvxfKz/YyOszrcQOygaIS1KIpYTfbuJ4XfJ65gwuZCSDviCO1Wjw
         +uf/9jUiGeV45+0Z4TydW5d62bT4K4fY2FEFdUz+OrgrBHaZHJonI6rdPQZt7Soqq8LH
         CGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339053; x=1775943853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1lqoTHHtvZmQw4ap8o2vp4C/j3uIcLBtxHCYWfV8yo=;
        b=VDDS6pvP2iVnYq1atVo1M/fRWFMlpqWvORK+33dO8iB3dM95n9ZSj1XIrHDBCSnWUA
         dI+Qli4KzNhqviL633lAGmr1Gf7v7Z99N2+cQ6IaJiR/KCy+5IEeKsACE7+PMsDw3Wbh
         O5k1k/PYrcCusZhFNnNNEKS6MNiDSob/3zvdTSaOa0bGpxbuWQxKNeWdsONFXRYBQzzB
         7UKr5duthKxAAERn0k78sHWJkYwICLUsUinC+m/6bvLVUiXXDzpzzO4NAlec2G32PFpB
         7DOzfglnP/s1im9bfTkkdhbaTH+Rv8VlV0Rir35bEbyvjMC7GUyAGhvf/iQ9CNiPE2TY
         KuBw==
X-Forwarded-Encrypted: i=1; AJvYcCU6nM53HRmvh7IuAArU0eYQi3Ctts12apzCwiZvaTY2/GsTaHV/v2MVC+SnghssYJChIT6VoMXWFhyYomta@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfCwBBm8INJkGDROfCdFLZYTT0Opdzq2QjKW8JLYOdpQu9ngY
	duj+Tr0cASz1hRzRusSjWvQ24Iag2I4PDeZCvsqdyYh5Wlgu3L3gDQsenyXZMQ8MukdhuMfd7ao
	F4IoUHNVVgljYlROB/LXqAEwDhLB4JY93oiOoJ8Kaxrc81YjUQaMG3siuJreSRAyTmZd/
X-Gm-Gg: AeBDiesRRz7jc6qE7tlEJruT/o0FldZ1AxsVy3Hjcq+FKlI4Yh01QSvhLYnE9DdKCRA
	YX/4PrXo3MxgR6XuI6E6LaAn3rwxTmgxGRkN+Qh7suWkEl19e94t0YD3zH7XaiUIz2na5RKyUzv
	64h5b5d3K3mi/gxYIgViQIjK2gfCrQv4fKeD3+WMjcf3rfyrw+fCNpZJyubWuTfonWv9dVx/ilV
	VyBCx7xG8QYwTp8/89K6+CsVf8htoq9FGc1Ponl3TYYHQy0Aus5MKGzUClaSw5Yr033ULNZYnHQ
	WdBQWzTx1HGCDhHfxGB/YsfPTWFkjBV8gz8d+51EciqvbIzVGVYwUFwXVMKpImiY/UcfS711MA7
	llSJIX+/v6OfW3EcTXiLisoPlmbUTgN3iMFW1l2ftWFJCenJMEWXVE7imcop3oq4Lbrv2MrIBnY
	NqFkD4Y6ueOGjebJaFew+/BoAX6le2UsFYso0=
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr118604201cf.45.1775339053267;
        Sat, 04 Apr 2026 14:44:13 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr118604001cf.45.1775339052836;
        Sat, 04 Apr 2026 14:44:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217d85asm20165011fa.41.2026.04.04.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:44:11 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:44:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
Message-ID: <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d1862e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HqnkvqIaPZsfh6_35gUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LSZSQyazNQ5QzpJW58t0eREWAlQdgHRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwNyBTYWx0ZWRfX2q7Szj3MvjVS
 lGTNTfnS1UU5VVfz54yNdvM6tBhjQFFeMrvWcQt/dOpMPQeg8H8ob6NX3ONkc/MJmyK4FXtiUwL
 sfh6lwUPU1A44YisV6abih8Pv8am1xAMzGK3PJTYr7GnRsZDxv2BMipgAO3WrRysyoWSNCHuhhx
 3LWZ6uP7XnP+Kam3XClt9KOIX5ybAlZhQwtHetDHD25M1DvppbF6p1RNs6k9WA6AcM5mEYO4eZp
 Id4fVtqhrIeRLbQpXYjFXvpDXo85zXBoavUaKtk72r7Qz3qu7vm+ptUB1E1aXQXLQqlzUj44mcO
 EZc/Ur21skTI6jjfqFtL6QFoJOTlO8NaftzidImmmwTEYkgeZTVppiHJf7iFrBsu2v4c9633CFq
 g8yrqRavDYDDr/X8fTuosbz4JsyOUqMOEArb3TODoyp4HaW8CshZFV9kQq1EXa300VORXVxqDHZ
 QI73lsRABzGv+7BuPlw==
X-Proofpoint-GUID: LSZSQyazNQ5QzpJW58t0eREWAlQdgHRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040207
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101815-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44D2039CA07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 02:33:17AM +0530, Akhil P Oommen wrote:
> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> The Glymur CRD boots Linux at EL2, which means it doesn't require the
> secure GPU firmware (zap fw).

Is this going to be a default mode for other laptops too? Otherwise it
might be better to keep ZAP node enabled by default and disable it here.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 51ea23a49b9e..a579df902323 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

