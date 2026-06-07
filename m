Return-Path: <linux-arm-msm+bounces-111602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7GaTKffZJWrXMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:52:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E096518E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z0U4/Rem";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WbvTFWqF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDC3430097D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2501C3128CC;
	Sun,  7 Jun 2026 20:52:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02143224D6
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:52:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865525; cv=none; b=rWZ5ygWeknuO7Z9BKA9NJL+eb209HYwQyMqKIYsK8hxvM+gIdvYSJAMfgMnFkfI21xyd+Oo9lZN1Dw2pJoatMOWxy+1foNpTOR/Qj33IKute1ztYSOpiP57mW2Zm01lapy+g0m4VlDv2xWG3s6r+jCAeGyzRcw85hwhTgFg3EJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865525; c=relaxed/simple;
	bh=BjkvTCRYz0fa8976imPRZK+W4llqBkazHf7ThLm7PCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cz7wTmbdh9LxYgwEEZjsTBHPRkXwPZsUE0ryH7RywjT0qykrl4+RfAdate8KTZ1SesxS8O0M84nQFKIu9awz4Hs/3VLDgi5TK4idU+163W2YsL88Fmimc3UWpqJxaFuo9QoWimHvcWHBPq2HYtbS3luAfaDjsETNqyA05L9oTso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0U4/Rem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbvTFWqF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El9Se443064
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+pIB02ijY13PTRTW3b1mGVCc
	zD2F0d4S/o/0/235A1c=; b=Z0U4/Rem0CA/ZN9xGxn11yk9brb6N3/rIDnleJ+J
	5FoB/O3jx5GHCTkyLhKhl+63GMWpjpTL09GuBLtv6JOLgXS7vNxklZ50H12Xg7aB
	EsFOXB7AK9oi8I+PYwLU0CwMyR7zlksRmplvAi8dQak+puVi8A5tC3X7LCqPYSh4
	cyPaMoGlAvDEI3LKuq+HEXLL67WAS6/yBLpahA1ScMV6E8HCaJiAwY34ILrz2+RZ
	+yXSEQnUM90ErccGQHlcC8IS5hCCGGRtgeDqedezIlVEm0XB8HdgNNMinND6YBH5
	Iu04MJohkySzLkOHjz8YUyCd+yf+xiz1zYCZWOoFUenA0w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cmy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:52:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c5794db0eeso4330848137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780865522; x=1781470322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pIB02ijY13PTRTW3b1mGVCczD2F0d4S/o/0/235A1c=;
        b=WbvTFWqFEyuq7+zZSR6ew6K2qq6SPVL2N90XpQudI2Dlt8LPrmRt0NcxV4pdLVdWNm
         l/Vt2X6FCUlhm92TsiQLl26nTFk2Ell7AzQb1hE2eIonHd3GSTpEsLG4rEPlxMuccsRu
         1S2zVDwfkFZuUr/zxj3YOVV2VxzaKmgoXl0Ewi3N5O4qnXp64sfoDY9FViFUdeIcpCuF
         1f9+5eiBEhBMwwxs/0LAZHGFYc+lg6NpYw3stKyLk9WLhTFriffV9vhjclLDbQtlpzLv
         kvfPjUKb9S39OU+xSajKZvCF72O4CGmIN4mkCaY11/NXb6WU2J79mLPXZv1pvD35haMN
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780865522; x=1781470322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pIB02ijY13PTRTW3b1mGVCczD2F0d4S/o/0/235A1c=;
        b=VGbbWlbV/g1qUyF8QIPEmR5VxQv6vYlr78duBL5fHpbzUyLixvnWIt1E9BDd2RFvwD
         RfSuPu1VharEKCwUU4ouOOKtL/w27Ty1+F8VVGe/LD9twCVOPUqw5Sb6vX15jOgsw+68
         Q20E/HPXl+FZulud0iYNkBcGh64SADGqGyHzqjl7h4/X/5tc1AD64oIuL9FiZ8o61QMq
         SWuNvDqaYp68iVWySxzIML5DSPXf+qJoyb6elNcCI1Yl6aQKFHs2wdg4hE8JSIbIpTaV
         VdKUZfp3l2vLYK3bKoPjjxT7fWPQe0Al8ehAeE3R2CdiUEfdbElYDmsVXCVCKr7lpBjr
         3uWA==
X-Forwarded-Encrypted: i=1; AFNElJ+VfanQwP8ExtHw5q2j8lX2QzpDH6YxTcWCNg8VADZ5NKsfBAztnYTDDoA9wYKmvzYE2V9QSGrMBMX9fnrc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIG/7RhhA0Vy3/nS60MQGbJy6b+xPsCBaEvGFfFSKvOV67IraR
	JUB0TA7WhZT6uROED1NKATiCRNzIB4yypU+icc9FhH+u4Q+oBv4Vh79BoMtWBV1q1Fxgnxrjz8o
	aLfDNC45Zp4xjSnPrHR+eClVJYfImexROpLe7wW8Dr7I6MDBcrVKO3iAhqAXK7nAp2EpNqaAP7h
	gF
X-Gm-Gg: Acq92OHMJ0ngf+A3hIUlZajpdJxm1VOkjMroMJhvNOw2BzrzrvsDe2UkPbwhat59SeS
	JrjY+81fh2NobYmQcVfycO25rGyCbVIZibh0F6ghzOlfazfFa15bfOrIFmCrvu2RN4yLJ/VCF/6
	3axWZYSHFLkHLzoQqj2Lq2hjyOztoOkbCGifvE7kfx/gT4wxoSV5it88j5rA9yBgD0EN8Z7F2yi
	Rbf4HYaK4VP7pu93dmVyZNakSIbS6I/hwxG3TRA1xyB5xWWR71gr8zMUuJejTZF7vFOB+FPC+vs
	fil8iw01QzmrNnpwIKfeUf+AOEAE+Ap0iEVRlJ4XoQVkgHbcw6dd5zlAmsLvTep0Ts1jjaZSfnL
	d0b1y8BrEVij9hCeB9g0qwwL2cgsU2KjmY0D0B2+xkqmkKoOkvkbMRLT25InMrUkzghaaXUDMtu
	SfbezfKygTMIlI7dCCmNsarBEqA0T/3fq/RCeNqm1nV0VrRA==
X-Received: by 2002:a05:6102:548c:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6fefa23308cmr5994404137.20.1780865522384;
        Sun, 07 Jun 2026 13:52:02 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6fefa23308cmr5994394137.20.1780865522035;
        Sun, 07 Jun 2026 13:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9eesm41476591fa.40.2026.06.07.13.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:52:00 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:51:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/4] crypto: qcom-rng - Enable clock in hwrng case
Message-ID: <ldquuwgt3ktbpsnrvgg3ld7lzt2gebvoyzw42jji3xmj6vm35g@myeavdjxraii>
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-2-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530020332.143058-2-ebiggers@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwOSBTYWx0ZWRfX7pXJPIfGjR01
 p/9fjZ4u/7T5Q4c9EDvK2dilWAqvrcRYA2OcjxfvAxzryNqZjrN9DIKsDiX0S82p44I94x0BTgC
 wEax7q6/OWCKaJCAkD6YcXArQ98F3N0gvyrzFa2NhTWMDleZ4FKdGKdvQGmACUFm1X9u/twb1NF
 juLIhqCdpGBw8qLuQMGtdObA+qvd8CVnKjTATuXZCtOBWM+TDmJpgT5ifbavzBGYGqOLLqfIEFH
 rBKPKBz4TyGDLcfFlbsrVIvD/7rWfKcJKJFD6QSSBaTP8hZElUs8rw9Pak3k0oar6TxnZWI0gII
 Lh0zvBt6jmccFS+AzGolh0QznTJHvWy4V2t7DCXiK1Qbw4NHLYu82s8i+oaUWj11hlRmY2dMFkg
 PP/FsL+O10JDoMEdLWCj/LaljRiI0oBtbxrWxYCNlw+KLICCImLS9AcIEHrNM1aoUMmf+q7A2wM
 URSLMSOirKHWDOVYNsw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25d9f3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tI4jJ0bUc5TXO7XjffgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: NCM1viPHWW2pylC80G5Hn3jQLFupKoel
X-Proofpoint-GUID: NCM1viPHWW2pylC80G5Hn3jQLFupKoel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070209
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2E096518E0

On Fri, May 29, 2026 at 07:03:29PM -0700, Eric Biggers wrote:
> Fix qcom-rng.c to enable the clock before accessing the hardware.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/qcom-rng.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

