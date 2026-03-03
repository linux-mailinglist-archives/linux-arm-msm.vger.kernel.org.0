Return-Path: <linux-arm-msm+bounces-95148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPmBKizopmlWZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:54:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1102B1F0CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A60830AC495
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB406258EE0;
	Tue,  3 Mar 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljCTyQ3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNoqyk+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC631D86DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545687; cv=none; b=aoKfpd8f7v8LcOFKuXTZAQDBTS585ZfKED7CC+1/RKMiB7uj1M2h5Fh0QnX7W058iHktLhDb7/m77FmrxbW7HknlNKGu2zh4f2e0+PqVdnzk5qSRKccuZ/eruOQ8skGPq1Cpi6/zlzb+AJqVxobGSy9GJXQ/oP2uGzK+FkBxKWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545687; c=relaxed/simple;
	bh=Ma91qlkiQBUMARLiy5SwMU+LDdnpFWZ7LsQRpcvmyE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb4Mm/B7Rc0tnQ9iFQuqG5KQxD/A0fr/APaEtVc2BQVYYq4T7AvNsHh52kkMDfbPoTSqGMJuAr2AV3VqDy4EMJ3EtfZvkb69OfyUq08qcJHEZmVtbfE72BxVefQjJzd7zLX7iWN7Gy74Q1QwyQKu/oO//UdGpUM4FFRix4msTZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljCTyQ3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNoqyk+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mf5M2307427
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2eWWjGPyBnebc1FydoyAZxwZ
	ES4AvXrNNkhP2BxgHh0=; b=ljCTyQ3SB11zQhOOc2FSe7OrQR+Pmqpy9ik6jcnS
	MPIAD6wvdCb+dNxdlXx4mjTmbw3Ulskx34qFNcFl+m6EWDxupfN4RcoiCceNB50u
	z7pqzit8hrOoGGHRbe5nkaBBVQPJjIAOFwlSyHd4HsDgQ6L4MCfFt4U5tTGrPZPE
	rAYOdZCajwz0FJ6teZzSW4+ReUunH+auLxxi/ogDuFDWlzh4a6QIlGglVcNwmImM
	4G2xX0bLbiJF4QiEEefbmSKjVugnFjOeHScq7HHgtsVMUtc8YQCu04nWJa4Iq98U
	q0SQikTBI0QHa1nDr2tEdkhWOFIEaI5oaSFbdbm53lW0Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8smp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:48:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so4545182085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772545685; x=1773150485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
        b=RNoqyk+UUr+AHqDtFWVViCXIxrtqL+iI/0sv1NJ6T3SUgQDbfBZVooR0vqAu9IwGei
         PSTiKRDSqapv6k775jriLpRD2AXlEpbmZwmxpw9tYoFiJMwJ5HqrHLOwnZD2CH0+jh4b
         tras/Wgi9DrVt29uRIWwiyi/4k+IiymOMJtxYkTAAhLngU+UT8nXcJ9RZ2Am15ITXGdO
         ZYvNRd0L89c5BQ/P5tRQsl6eWbhAo0Kj/8z/DdBeJxDb2rYgTes4EYxNcmZJJKTUOtQc
         TFh79DGpwuJRO35xILjVthwLsZ7wQNaOVZVPJfXn7ADs/+gEJxGYLYOiMq5p43X4KyzK
         GaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545685; x=1773150485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
        b=WeAV1bTuc9dKLF2PW+EEkO9xxOV6ec7aJx5rCj/kVuaeVwc9N38dM6kqo3oavoA7fT
         U3r14MWyhdaFabkHzox+WP31hzgFA2iabwvjx8CUlJkPg9M0mS6No0eVD0AWtQv+sGqA
         owMdtBHH0amZbnAwgAsGxsGvWlP+4KVXrIIvxNRPgv2Vwm/Q/A9ssVw5lUEos6CKIfQ+
         mdJhlCxaJAk3g4Vb36GGesVonf1HQ7ki4JGV+PsOUZtfDV5uaP/lMrBX7y1seVAf4AaS
         fYsUvcLwceAYQjluyRxkpmrCwr/Jx/ADo/F0BP02IVLkhWc31JswzcuFUnkhaER6Id+7
         xguA==
X-Forwarded-Encrypted: i=1; AJvYcCWimBgd9JbAlp3jWlIwwPd5PYkJuAnHYySK/0WWZhVJsXohnk1V//eRtq1omYzPIA6X4fVWmjMgu6nXrrwa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx8OdAnz2PbcI4zCR0e4zQ4ukjvJ79IYyFD2aBWpNb4aMPAMrH
	+zfUeStRaK25CWvC+Cw5ixi6xMN1U/X8uCqX2rWVAuaLmHeBeZHSvuANV5FWo8aZCaSGK3wBsDJ
	qKqAL2iMT0NArwxVRu1l7knOeXluQJnang1jcw4W4t8qyLEq0cggeKQ12Iu15G7k+vom4
X-Gm-Gg: ATEYQzwIgxP2B8ZGTOkwy1p938SBOeqF3dE+0ya2IOBUnUpUMzftMGsTvr0OJzY0Dge
	I8rbx7Epvz2oH8m62NSFH60E1LjZZQZ5AmRX85WsBgyQMOVx0t1hriadPR/ngIu1dy9tt2vdJXg
	HAT9SC0relYwZhJwxvgJeoFCIvxEEuJ+VeIFmCgNSCB8CWq4T11s9FHWBwHEfzHPOsdQABN1/xa
	bo2LhgQKIS02R10S2/L8ygpY55lRaS0jtWJnvfR1IROCfLdq2wmIVdPrG/B0aVe3NB6MaqtehyS
	DznjH41nNi1T6Tt0893fX3tF69tw2M4iUyNcnZaifjzn+2DhMDSSpQa+R5RuBevknheQwVB6fgX
	nG+A57aDv0VbKyswiw1zZ0J6vhfAjf2yzkElH5XcAv/moUfVLyZwntgvrtRxMdHKSzYpMgWWFXp
	EuZa1tCZJN+lE3P8xUBDFx7/VpppLVRvf28q4=
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cd50bc2911mr203051085a.31.1772545684693;
        Tue, 03 Mar 2026 05:48:04 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cd50bc2911mr203046185a.31.1772545684050;
        Tue, 03 Mar 2026 05:48:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1273cf021sm94913e87.4.2026.03.03.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:48:03 -0800 (PST)
Date: Tue, 3 Mar 2026 15:48:01 +0200
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
Subject: Re: [PATCH 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Message-ID: <ym4nzlar5tgu3pzaotucg4sd4gcapprl2i2jrfop6hcj4mrezf@5irva5crbxxf>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-GUID: HZeTWhJzkhpy82mTTuKylvXzYqtx8iWI
X-Proofpoint-ORIG-GUID: HZeTWhJzkhpy82mTTuKylvXzYqtx8iWI
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6e695 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hxgsInd8paV07mNIhWkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX8amOX6KbazEi
 vc7KlxzzuP1+1w58Bp5J+jmUPuDAfKe4Bapzg8qLTplN0XTOV72U3xGOmf14OwuT44HtWzwkp4J
 ZKrb8fCzXDU1q/WHZp8DfZsgNJhfwZAxcLI6uG4ugq6in5XC/xICPmSeJIQzwaQLfzV86HnzAOn
 dArh+hcjoGU1+UTFJ6CqtYc9PH6XrXjip6RB9NHJO0kdR/QTXngIFPefNGYMBDqPMSLWUMw6944
 yUtP5dISx+YavR0UlC3p7egc7zfE06sCMJEn1DIxukxd91Jzl1Pgf8qGngtHiV+r4u9/5UIBply
 bU1bB0fqz9Z78LauZxF0ftatCaEtu8Wf1hrsresmjUJz8DpuXLUMVaGx10wTTThZFs6/F9rUgrr
 bq12xghG4cWAM6QVAH0ktpiUjbXlSYtJGWiK5J6jDmK7vNqdR3S9Vsyzu3HQ1++T1r9nPzgIfxr
 zOFOkDBD6/UqgK5ycLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
X-Rspamd-Queue-Id: 1102B1F0CFC
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
	TAGGED_FROM(0.00)[bounces-95148-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:53PM +0100, Krzysztof Kozlowski wrote:
> Add DSI controller Qualcomm Eliza SoC using exactly the same block as
> SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

