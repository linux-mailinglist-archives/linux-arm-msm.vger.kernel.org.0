Return-Path: <linux-arm-msm+bounces-111216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aqKNJJiAIWo2HgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4686406C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:41:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NcgNgSMd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MSuc6LPg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E61E30512E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B10647DD65;
	Thu,  4 Jun 2026 13:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263174014A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580459; cv=none; b=QTbMnfpFqbyYkQUXcjEF/TZC4l0c/x7FyDhK5jDDU7liJ/Z2PY+/Xw74U0W7APpbeHhE80WtBFq+uojjdxiPiZ5HybM+InyfmUE7eBXqDIU8NrmLjvGlMjlFrbbXWFCqiiqIgP5WFT0hbDeZTPtC19pZXx9U9roE9TBIaJTv96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580459; c=relaxed/simple;
	bh=quBVvb2w/+UeEv8xEzFTwWL9UUha74VGxSG5qfpE5so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEd9qfTEFtpBO6/4V+Bv+2VRrsrALL/vtgOS8QUIXXUSpCO3Mq81mKP0vFXgzjhgqEzWp3oaNa3MrDaQv/zdiBrbaFjwCfMl+WZRK9wHZo3G7alLLiyLpqFjsQ2lZ86wv+joTCLEfLCsel39VD2nW6whA0BZmvZEDi2cJYyHhUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcgNgSMd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSuc6LPg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJofS944403
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMSSOk9m2Wl04LyAsEWMrBFk
	eOKrvo/jDJnE41Px/X4=; b=NcgNgSMdQfeNpPoJuFUiafKc2FZ3uiR6QQyQfcFC
	bQlLrWjGuu4V2bQZpFzZn2QdaTsc70V5U/aerfMlcXNDdj7hWVIoSiZdZNL0Rbgd
	vlbsc47zNt9Ft9VRnYrbsBw+RjT3W89s18xoDvlTPC7i1TxCSF1sztj9jLeNsiD6
	/cEVHA615T7Q9gX/foiuEl0cthNTtmY9FIS7jNadFZ9oP1kfIDqFgxJN5ThEGzf5
	d+bHpHkY8mB3dFgW3wzX+umX5wYPmGhCb0gLhbbtMiMfAWr52zxJ/M5PJohQtthW
	z4RQd/DP4pIQkBYzDya51WyVbrnySGZUpTDrLy14WOO9Ww==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d50jh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:40:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b2863d62so181767241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780580456; x=1781185256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMSSOk9m2Wl04LyAsEWMrBFkeOKrvo/jDJnE41Px/X4=;
        b=MSuc6LPgtXHNpSlWiMEb4JOuM4nM1rhOarO+5tgQj3t31aKUWPSxBVLfGE1BQ3NPpO
         k9lBxlqDrDncCcv/ez5gurb9ck77sCP70ksbJYQK3MxzZo7uDMaFecuTxksV+bIAfUZt
         3mk98LB2COzej+lT4HOMgo6Swo8b5coChmtE5FmTIVcE9TkCfA/2iJU8ECtxHKYW2Jtk
         yx95TAr0btYFppGEwp0D750gsU79K/BgvMWam6ow9WDrymZ6FW1DmBuPUBYnQN0aFGAN
         Zobr7fos5yS9VdLRmHEoWN7qsJHQqKmb9TRRkZZMxHXdoa2YhmKqF+MDjBLwnngn7i3Q
         x36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580456; x=1781185256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMSSOk9m2Wl04LyAsEWMrBFkeOKrvo/jDJnE41Px/X4=;
        b=es8/GlEoUwkcwFPbB/dAoJwZlJ3l1tvP9x2Cn4um3LaIp2Sh03LRgZKzai1cznGejh
         uCLRpkiPkWy19Ppl8sg1GZayrQx1/h+fI6u7OaMo2V0rJoAYrWofM+wjJrGnw4xx0rU1
         WfzZJSClcy5OyxinhYiTvU/R3a0QgYpaGszBIA4fqPFDveQ09dSo5uN/13Z9La1ALW3q
         dBW821ei+AojpGs1TH04kmjYgKhVxbZ9B0fiapx4fLR2nIMq3BobHtmKJrBDfesb2NjQ
         I84pJ4hw3Y3DtRLKr2NbIliyup1TwPY/mN1fFsiOjK+nH5QcmPSwurNMWfD4KpGxc6PY
         YnfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rqPVQqq4lFKJMTmbDjsyspYc3/bc+MAsMIZcULGsL7zaJKzGzumu8EPbZAQX8hbh36dxSEs7BI/jXN1gP@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXFhTpG6WCAJg6IZ3smalUi7w9WILnrrymoFtyqe3UOswY/GT
	WjtqiksgdZYjHgmsHMi27q+Qn0dIc30wAZ7A6orTwrVRK9OF46IQLPRm8Y792vhcSTJgqQ6XXkR
	hYFn2wV5x9TiAxI74qfJfbKGpzfloqclstnWX+K9RlB+kRmZFWBGQWoeUcoJl0Mn+f5CL
X-Gm-Gg: Acq92OHd1q6vcGkkLYU7s8ZKVsINQVQQqu9qxqOPfA3hBG+SyXj5ZBm+ctdzSPvaGBN
	iB/EUfYoZw5dvjYDnjFCddmN6w9Z9jC6mDrU6Y8UlZerccsyVlaI5XMVmq54jyRdo2yEbCIH2rr
	HpAqlmKedoKY1aOwW21AvROdQusZv582U1lnDplSXomfNws8jSG4lYzcQG1Q0TmHzX1/CO0Kj2N
	gUrtP56EYXVDy5EcC72VTXxOGe/0LpqmafruCkwdOgNKOGnAzHB/YTdpwaPvSltsaCQ0nzFVBUz
	WIGjxVvGgbuBHcnrqYY8uDhDm7eWx1DzYHDLriQtyvRLSFTy5eFarvDAZkIc+YiSUdctLmA6PhH
	XG4iX+oEk9KO+YjOXjAkQ8acZQyR1O7tSf+PoW0p70QtlZQ6w4f9Z4+fLSDzlOvj3WXN/LgYi/A
	mZ6floHaighl6vy7hOuu0Om+WMN72Uj+S3z3tof1JkddatVA==
X-Received: by 2002:a05:6102:3910:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-6ec28b175b3mr4344025137.1.1780580456151;
        Thu, 04 Jun 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-6ec28b175b3mr4344009137.1.1780580455735;
        Thu, 04 Jun 2026 06:40:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm1228864e87.71.2026.06.04.06.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:40:54 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Message-ID: <d2s6nvknjlmwhnfoizhnafbjzgwofnqbg7pcyoeit7hbznes7s@pijbxqls4sc4>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sVSeGY5dWaq2dowKSkbivucPRaPfROOa
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a218069 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RNZNEj0NQT9gpfWmR7IA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMiBTYWx0ZWRfXzqhnfaPRika6
 aB9KmXGievA4d4ESWc3si3z+9r+tdVc22UvkH2hp5s+aUMrS9lX59L/uwu5ad9iMl6Rsitj3skR
 /TwVzjuefEKIGzgxzUso5Kyi7+6ip8cG80gOjgLfxGopclLcxszW61ldw4SErZnPckFeInEMLK0
 dkv0qopbY46dhoos9rTcDPvUl4LJkJNAzwCCaP3sVsRHGJfo4+y9Wz2AtqNMYct/lO4CRabbpv8
 mvywnejE5IRQMnvY3BXpoGbAo9QTJ9uCrTKnCA99+HiGsI31vdQWPEqR4UPmyn7sva6uz3G8I5H
 qD7wVNBOuznidtacnqKbpbf9x4mM747EVdukYMwlBsM+mEKmqwPU0O4K/m1SRaFwAKlbBkqZyoN
 CazZzzh8z9c+h5zuT4vxonCSqGnGzOeWOuK3WrAkiGDgNK6AYiRCTTJo7SQG5YlkMGuSwV9qi0P
 lKWRCFopE52OfiqlPog==
X-Proofpoint-GUID: sVSeGY5dWaq2dowKSkbivucPRaPfROOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E4686406C2

On Thu, Jun 04, 2026 at 10:06:57AM +0200, Konrad Dybcio wrote:
> Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
> as there seem to be no issues with the firmware that would mandate
> disabling it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

