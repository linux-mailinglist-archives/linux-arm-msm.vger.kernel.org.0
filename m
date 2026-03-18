Return-Path: <linux-arm-msm+bounces-98517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCoHBrq6umk4bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:46:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02E2BD77B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2D6431315C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1B53DC4D6;
	Wed, 18 Mar 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwH0apbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdNmYkcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5A3DC4B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844899; cv=none; b=UTH/6imuR8EIvLaYtvynnu4cbmLqUXjIPpZYeTV7POdN5C+imHOfo3p+c7Tw5Uf5+O78S3uzWXMfOKSQDOZOwdwnXjixC88QgAUXyqXaYfsobnnbef77abuVrcovvSytXsM/AimQO7UdCN/rYIxJi0fs/IZM4vW0Uq3GyTmzphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844899; c=relaxed/simple;
	bh=zHb3ug56yZU73Rkgye6tWFqmIizXoa0cJ4zJJ1kdtvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teakirMcoHqYOB4Z9B58yS7mpiz8sH537Se/nDcBIThFRibhGwWFUWhQL6I2EqPWE1IFG73YKM++kyBcCkKHTIaJ5mrfDrjt1BOWIv5lohUHKcKBTCx7QKe3yROS+cbaI2mOHK1We2PvK8IM8t8qFvFqrsM3PPb2REX0xQ6moDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwH0apbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdNmYkcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I932gu402533
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oZ2ZDPsufRW4dhlt63DbVB9l
	96Wxnp3DFYqHb0H8STw=; b=BwH0apbN2Gs16TLoHjhsKUuI6hR5HPcsS4dUKjSt
	bFpevIdMrDvVag3Z/61AkghHoS3DJmZpGe3mOuf36XekOiAgJkqsKkpbLC/NiSDe
	SSRzXN8QFbcG5xcvzG/uBAVWf0M764frMiQxQWtvQXcv5080qUxmm29cVDOPhESe
	HZAFK8pf5YbCIu7EWioZCh2r94lj7yFx533QlCeU/Ew2BFt7vCltCfJw6xIRlE2Z
	HjjxkSCXazniN+o5P3kEGfHwjLrvB0aghVLfvXuB7uvIL+MDiHD6X3d65eP104n+
	Gwg6iFYf+3Kqblgem+4E3AFEq9F763pek2gSaLEoltgKFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dv81e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:41:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso18213981cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844896; x=1774449696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ2ZDPsufRW4dhlt63DbVB9l96Wxnp3DFYqHb0H8STw=;
        b=kdNmYkcX3Jdz+IcepMt/732kdBCCFTv8PYIiyLCxXJlZfGGiaHuWJ4noenXnhzoOV6
         mZFL328e4zPduAtfcvQcjDJ18G29z8Fs4LyIVEQTwtG6Q9hstr/sWOT/hND+JCkr8Hu5
         xc/i4um4SlUs3lXMAFyZkL6kfDfBVDmkh39g/TdgYhx6v0nPYukgvtKFHgqh2wg0I376
         sHjHTC+wogN2Z7Ma4pP0c/Cna3Jo35a1sqPzXtXxjbRFrufrPP8MaZuho1IdjPxDzG59
         E1TE7MXaJjWXNjtmaMUYcawB3HwUyWCwyPJWyDrDigYR42jDXoMn0qGI9WcCOb7ZI5Dy
         fxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844896; x=1774449696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ2ZDPsufRW4dhlt63DbVB9l96Wxnp3DFYqHb0H8STw=;
        b=nAY+HW2SeD1KSlI1GCaUCzvWxTSzoIYV8+u0uRJvql41ChVRsQhZobUlxYa4XuhpE9
         qbV9bdgtIhjdtFFkjdhD8TfU8/jkK18vQIjsjlfAGonXRNEGcauGPRAFbDKElsCi71xP
         M1G995lSMeqd9C+H9gyL7QeLt4BA52YEZyBxOo1SQSh9+fD6KFuY6UsSZgacMhoaFDAO
         1HLbRcVIP11ydtKRVCJMEdTjPxkZ7GXKzRfBpZF8LzAqgOGWZw2vAVS9znEWQNQAtfm4
         sYGbekHJrNhsczchd4B6FhELLyaDAQSmPhtEuFLXxRVWntNGpLqVrVLcOkYJWnomjGCd
         k8XA==
X-Forwarded-Encrypted: i=1; AJvYcCV0KgdfOaNWZoec57ZMi9liqv2/vTESY1sRRqInGTvWGS3RZf4nifYtKzVN+D66DuP2jL2U+JapI02uDuA1@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqJ/akr3Xab4FYGT2UPbMqNsRfW4lQx64lS0Xv0uXBUwMyJS2
	QOyKq8KEZIvxNCgx7JI6Fc2QQvPMCr3twMKpFoUC3nBs38pkXW4wGj14jYxWazdO6DYJWSJ1WZ8
	k3LJdF0T104kEuoDZCHPha1HM4Duz0Q2f++Fo2Q2pt6kN5w1uvus8hp5PjiCFtd7c6JVi
X-Gm-Gg: ATEYQzx0XOVNno8fd2rhIldfwaXPAwK+wAJp7M8bYQ9Xd3lD3oFf/eUr7UfDMakPzEZ
	18q7DRhI555PuVaTDKdcWe/vED1lVMQ02urXWT7pfQsrCIDj5Gf8MFWNWCn8ciUymTHEOE9mv9u
	P1Tg64HfmfWHsfbEbXx/OGHAI1NGHoYD1Jioo//ysKHhqnTS7mCF2MQ7IQ5a5GlFRjDyvt9HAVd
	pGsUOtRgD90JWLrf5alaDJUws0fcisMR+G9BH9CKiViZJksyHrgZeviWGK6+dViUnVW5+GeL6i0
	4InxkuLVlh/e5RkI+aXSlZKf9h4tj694XXg9t5L/I4ZlZja6WE3MM+MB+BlwUr1s9S26ToDHiYA
	8HHdjGggLWicGu9ZXzAs8xIdHPUOXqRrCo6ubHZjqWrcP/1opi9DMorQ4i3MfqHjdCUpYPbI0ZA
	7nbt8KxKyYTrY+bL2pyG0b7a8j4u9LXkH3dP4=
X-Received: by 2002:ac8:1205:0:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b1ecb3a94mr12584841cf.49.1773844896376;
        Wed, 18 Mar 2026 07:41:36 -0700 (PDT)
X-Received: by 2002:ac8:1205:0:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b1ecb3a94mr12584581cf.49.1773844895890;
        Wed, 18 Mar 2026 07:41:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54dbf75sm6008391fa.37.2026.03.18.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:41:34 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:41:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sdm845-oneplus: Drop address
 from framebuffer node
Message-ID: <rkbfjg77rrz4nfjxlx5tmqh7tdy6l7s7i63puwk6x27s6c54x3@ryid5gnvodrk>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-2-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-2-36b69dfb760c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfXzULEfepjwsXA
 APElOSOSKWZRqYePOPm4r31oE95Op0mCY3TRhfcgLYSZ5gMn1bncH+aMGCkCv3/hnRmcFvsGtTf
 nTV8ocF37imXv2KQiyP9dPYK7ZJx6evwuYfuldP8gEGHFe2WrgXkfy4tpCRWX7bAe3SwOsE64w6
 4KyQCxRm5Uk7V6pRI/dDaoC6p84AfOflShhmjqGzwdhi+semUUgk8SPlUNhHwMt7u9bWGnSWR1n
 Px6hU0kO5Mgca9OXEcNBECcBlSYXnvd3rfbsI3ozW0vSgXdcHKs1yZpJSJUzeVSf1YAl0t/v/dX
 JHrEPH8dxlhuIFi1wqtIKKlwwskpI7DEu1wbAoADAA/5UbqCvH8r0AOJM04gD4kiPqc4HihHd6s
 RFlfETH9LP4RbWLvvrwL6o+2vmGwj6ZeQfxMoOs9QzRuX9vO/XtcVahygrB64Q9aXQQkat98UDF
 l3YicEFVIRnYbu3LXYw==
X-Proofpoint-GUID: 0UcEfgVpANDTukvdPBZk1iBfn0wRfefQ
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69bab9a1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m8ah2Tg14k2Pfi5VopQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0UcEfgVpANDTukvdPBZk1iBfn0wRfefQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180125
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
	TAGGED_FROM(0.00)[bounces-98517-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samcday.com,vger.kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.966];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D02E2BD77B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:12:32PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This node has no 'reg' property, so it shouldn't have a unit address
> (after '@') either
> 
> Fixes: b0d5c96e860c ("arm64: dts: qcom: sdm845-oneplus: Add framebuffer")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

