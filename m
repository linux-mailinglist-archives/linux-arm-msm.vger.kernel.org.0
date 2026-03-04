Return-Path: <linux-arm-msm+bounces-95350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEgFDWBHqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:53:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA0201F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D869328A91E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AD83AE18C;
	Wed,  4 Mar 2026 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWC9Fw28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLFKEktL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF93A8747
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634604; cv=none; b=LZQTE6MTTdxL0ODXByDnSher/3/gMdyi5Xh8bvysPzDB4B/L18UtMDoulNoRYrViTw0R6Y5o7UAdAKXWBfZtd2KU+KsxAwwJ9Vhju4+RHGqXVfbQJrKyjFB6fQSWMlYARf5VQjx7YSTUViR/9hUjJaL1DA+Z3410uNizY00OF0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634604; c=relaxed/simple;
	bh=pAGcftUkpOuwxz+hiLLDH+0kPM8pD+6clRxQbpPNsI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/71WfkNj2nB6S/rbDhKlQTzbnphBKwlUCejd5WN47Q9jQwqo/d0arFQUkuSD+Dlp5zX1twXZoo20IhOFHZjj2Zk0cFMS9ebyQxo+PqTa3usAJieMXwQJvALlH//m+g0JPLSjKWnHYjEHdGzAEdxvO10GpnjC8KPXp+ngwMApr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWC9Fw28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLFKEktL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249sw3U1213795
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rh3ft9edmIR3MH+5987NLl83
	siXGjWWNjpTNPh6s+MA=; b=XWC9Fw28jkxty6vemT/FJ/4YZ03XfmeBOQrvZz3v
	aAUSKjC4LZbsJ2/k+YxEob9ZBzRyWQYZQgnH7+p3osyok8nabJdWaxbobYUJCQ/b
	CbZ4E/haNGWtWUQ1kdGCMcv2cnCumrb5UPf4U6psywT9Z0KvGuuGe9rSzv4ufcPf
	xG52Hx5ZxIkkdOxhGHImh6HbqZpj2LzrgkvvjJ3Bd4ilcqb45MhWD/kyN7ugdP5k
	whPGNvYZuCgDalh3Lvwm8Q7y18ehxpD52skdUW4Chep+L2OEGySN88IYdmyAOq9R
	qLL9+WGk4UpcjU9O29R9rXpeNd1E5S+yDHM1PVENzantuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rrxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:30:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so4005469985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634602; x=1773239402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
        b=WLFKEktLhe5DttgmrhLsdI9QIjriWLn8/oQfXjoUu54azZ8OEPAhvwAQVNKXVrz3A+
         3zqi9TQInPSIMRtsya3+v5+GYz3tvp1/SUkVov1ok/wjXpi5u+q2HOFa61Xpm+DmTzdI
         8l2pJtGm6oNDI1HeNFFYF8AywuHUD1UZcmKNNkA4dyCBAB+XgOW427lay1tSr7Xv0PYI
         KLtcdj8E1JNE0fn0aTU88J8+q3JX/Ax5TGESFeKJP9lWnV6UrMRz/mxRpVy9LhGyTWnN
         86ISxsl8izTCraBdKT9HjFyHk3JASFmtKuOZt9EBon2ckhEJ7E6NXeMlGXzZLjHGhBx7
         VUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634602; x=1773239402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
        b=BbUBDd2D9aOcoN/iJoVbJJENvnYOtVDeqBXnHmF6OZ0NMl55RSN1vbj694vjZmOfIj
         nzhH/b82kAC8zLKEOY8Lc0+oGIn63eip+pWPZC5VkiswwkdveFNIyOb0jZBeIFTN6TC/
         mYuRi96n21FXOP+JOiPcFxln8pD9csG6eBM8KX6puisUTJHqrJN4SXUrKb0DSOockTCR
         MD/rUBLenN/aqAgyMW/QqaXGdhOucgFz/Dgfp8pNNzgxEs0AKhwkGGbBgD62euB6yjGC
         h4pIhs7oUfQr98pxluB4MNaZtbH/F7IxzXzNdJgjaAcRGrJAFDjZAQG6rzpaifg7x1Dd
         37wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh2KGPBk5OMZaSCUgVigwDWtdLRkZv1D66TQ0zg6yeiwHtmboZBxXk8Nszsg4zZ6BYCdUP2EpdygukQ9FZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJdSsHeBZ0dBquL7jI4wXxg/nQuKXp8S7NC1LVrUbNp9v6EUn
	L4M2k7yVmlt/4g7uoDZYBLzRIFAahCA2Z5I2eYVFaxfSxbEe+Nm2e0JrV2X5D45T8zvGphP/iva
	4vcWf4pALlg5Y0X8aIWdVRETiJcK+P/VGG5G2yefcHQYXaPPizVOrM/8DmiSPdszbjWar
X-Gm-Gg: ATEYQzxIOOFz/QFnjnn3iPUFXXbc8ZWDQah29MV1OV16E/6JnUNzU+ule2a1ojsPXdw
	XxkE4pB240meypNMMXdjM56KdsnwcpCDseWx2LqUE7593p0AbuWt3pYNqZq1iUEHXfB3C9Trm21
	lC617GNolKGspl6ifSeHs+BoE22rBx1gynHqEiWtWyhDspkFKg+dssWPPLTTHjb/Od95WlqbZXX
	ec9DreSifALLWKDsmSDN01Ou7VbCh1ggVv8JCXixUxWC7LqOUIMLZiKdMQgLMGCzT6UdP4mwGVB
	AZiI8Y7VaMQGFIdy7hqv1S5px3c3nKExAls/2AV2ZK5H5UxCkEKkyUTRbpVYLtodKe+E5qcHMwg
	N8xb+fFRYzhy40MeChbVeN5Bt2ZcilfALOzqz75fEV1aWnNKDt+nJlwr9DzxZDEDdyE1ba/ZOam
	ECJG4dQqObUPIYCOdCotm7Xr3JI4botr8XHH8=
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id af79cd13be357-8cd5aec695dmr274568185a.16.1772634601924;
        Wed, 04 Mar 2026 06:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id af79cd13be357-8cd5aec695dmr274560685a.16.1772634601387;
        Wed, 04 Mar 2026 06:30:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12e9d091csm186828e87.42.2026.03.04.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:30:00 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add
 Eliza SoC
Message-ID: <mru6szaucuqii2n5nhg3kg5kcppzhubu7xggzjwu4vzrx7nnbz@u4f53kr7tcqc>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-GUID: UPRBhkzhINw6hkvZf7JmAdjes9E1Bzxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfX2sxX/Ml8k8T2
 7oQjIoCrkT9mzWLKdJ8e53VS0Fd0ShpEqt6ROP3yAwepY+dKEYif4BNxTm/b1o6toCeEq5MfVi0
 pifOHTJ71+lVb1uGav1In6rpog4kn+G+HE2F6HSMRKaTpBvuA7OjcmRRQKJm4GbkswltnhEpKM9
 0w0y/mjAQlAfaRGPTAmwTA/hAKWsjq0Zr3FsyfeYNMPUM3+D8cg5SanzZSrWsPscS/NFK+3Ivzt
 NyzUlqDoJH3s0q0f9YdCX6/ah5Fen6O9Qt27z29zQ4j9W0sYKvgsPd8tkBRA9gbnR7esZCF7/d7
 hMaX6XfqlejseevfVVtLV635QkjqbWx4h1xxTLAiQUmEr8yvzVUQ8kB6teVxNT3t4hcTwsKDzgd
 FbHfQJbMHbtEaeCWLQ6bgeJQ6A+WjP/kDeCaXPsdqvLqXCRot+jqEQ5I5KZfFKOgNwbaT3bHyxF
 jseS7UTNHF4OtT8ya/A==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a841ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wa0heElAoa-4UX5PAWMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UPRBhkzhINw6hkvZf7JmAdjes9E1Bzxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040117
X-Rspamd-Queue-Id: CEDA0201F80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95350-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:43PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
> 4nm v7.0, SM8750 uses 3nm v8.0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

