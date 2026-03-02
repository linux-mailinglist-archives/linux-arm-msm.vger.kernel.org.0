Return-Path: <linux-arm-msm+bounces-94909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPlbJ72FpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:42:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 089341D8DF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F113067A32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A521836D512;
	Mon,  2 Mar 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCBt9oSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXLa0zgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D8366DAE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454801; cv=none; b=O4r3s1IZQ7WduSZZOP2bRjZIuyLiaxcJ3hlhQ0vAvEldkBr/h2xkTLJ+xKy6R+akByWocjq4jhSNnKSMPLT81KgXqWfmxijafXYp5n9JgYQHezpwH8sa7/t8S0rSxh+yMPMUMHyjWKysUA7Pd/S/d1WWjD8ZJy5EuE+dhmHMtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454801; c=relaxed/simple;
	bh=nblU/gvZJ1hYtVhuLA4FijY3pZR4ZxrHQTsovSOQYio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un67KuNm2olMqKuxshQC6qpLWpICoy4Ujg8FpzUxyYrVOU9VUvrApeDryJSJbRLRq7867bumUXxfmylYrfSYVtTnVyNLnbhEvEB9LhHTeuOPlZBiChsiKHhgWe4kwq8bwTDGbng36IGiiYcot/9uVm66hefOPw82FsDV1oVw6Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCBt9oSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXLa0zgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EwOs3630902
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AHg8RT610JbVn0w1EKQT8kZU
	r3JvP/ohxZA8ve4jZUQ=; b=YCBt9oSL5zoZj0C0T9YxAN1+fOrGFZuoPcCH4Tb2
	FsC6K8v2e/QXbrSAktn7xXGnKbC5YttPcdGBZUb+gwmoZXq5GPMz+HRXB/X//lBC
	Q7mf4EOxQPty977WjuqcWHuojmdga0XOkk3wHc95Jax72Di2gjHcjCgyP69hd72N
	8Utp2cMxNeXoTeblvwvQDpN/73emTsEsLLetq1AaE6/el/4WhJgCfP60ToxxwoGo
	0cgPrkGeWfxTE1gMFvHDJdnVJz/P6Dri4b/Vmyt6XNojKBoXYe1hqJX7hh4RUzC6
	RhwUqRAokh8AXuqDq+GnT+UMWpNxjNzL4qHPeILZtjLOng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrn08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:33:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so4058139485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454799; x=1773059599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
        b=kXLa0zgEmGcxMXJD3fbr5v80EfoH5QxTmd7cSkTGrwuhxBKV5X9NklhpH/qI4J0Lhg
         vz2vheM3RFpLAFcZ50a+gX6QuNdaJt57MBqYOr/o1wT4Nzyc34KlguwgnE4KP0DXyx/T
         UYLqNw+E8qMxdpWD8+l55iZmnN321JPRm1DSxAZk8GqP8/TwDH8IYBKAJCdB8jO7Oglp
         ul3iU1PGnaLQw5e5X3UWgU3ulyvNdp4YoB4Mcf9F+QzAZAQGY3dOPJZ++d36SV//X9qC
         z9vuqzD6WYQnrETcir6+4lf+yG7s+TUM/1529L/zjm8yiDPA5ieVNu49slP0fTLGdOay
         3wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454799; x=1773059599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
        b=OLYezA7SvqCLNMf1jYwZf1dbUEX6EVwHa3Hkye6UL/ak7QHNDfJTm5IW5QvZGdmFia
         KCO+BZ/+DpKVW5AyNv9xmeTuLXR9jR2IWAvOOn24sU5V0N7GzZ5paYU4XnV+jIx0c7Bv
         CpzO2UAYW/OG3Kq76Ks5gGVwDi2i2OBIXIib/GPJZ60mOyBcaZYBesGiGB4d9ZHzgG5l
         YPPonJzg0bhLFr7bC1NACugx0ZbcEolB6UZgRfJcwMSC2CB4sgXr4RXCOFUD4TshVZZh
         VhMXvG9BHfNvidN+GVcwQJ/9Vg1YlUdeMuA7PGzcvFDkmeG9Q+mysiV1XxX3KLV217ly
         rgqA==
X-Forwarded-Encrypted: i=1; AJvYcCVx7yGWMYB+0lwUyxGJkbbg0DtVoxVmN41BXN7+ar543br5yVVRHxv62tM8uIBUDagoD45PjOUL7qnMDKwo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyvw73dLF071AsIBkvN8vReucz3UKSmAXhLVe3IKWslg6Rp/8y
	LX8yHX81gRSFfJw1h4uYJuFQYMDSsjJK9H8GBb/L7T0/tpJkbrr0jy2j8Nx5NipCo+85uuOsRX3
	WiIc8RGwP6TF9m4SSiFIHVqozDR8/2Dk5SaTzeGOJmVkJj6toUEXa3y7jXtSittWKK9Ik
X-Gm-Gg: ATEYQzyKONJlg8X6vpNg/z3dCdkE5RzNCcwxbEOLFXlMJy8/SftRjTK87T8kt0MYip7
	fF2tUpoabrp/7Qv97vzaGsNKMc/R2kV/7sjra3woq1i2sp9rud8hxM5tZmym8T/WRGFrpC5x2sC
	iJOjc/9YbTg7LqABlhk8j/lPaOcxGecgxMjOZmuYoMpoo31ink4hgJDmKFsqU6yet7qtilm+Csa
	P318u2tdxa/SzcilBPzPY67IrLWTqtp2nC6SZyKcNwNHu1ZKAWbJnEpRu7808hNEIomfPhLAKvB
	Df3nreNa53HBvVP8n9ISINTlpMYTNLvbOXTyGMD3731GfhxTulfiPgHjV2Rc/wczoeF4qmxf4nX
	v11yi0MeQ18/N6Yi33DtGdnWOcNg+GqR3fVr35u49pXUY7BIBjMxEcJi5AJgQQO0BCEdtwmIN/q
	UH0QOD+2apKSEN+X4wr6JdHasuI7Okm3gq0zw=
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cbbf4042cdmr1777238085a.39.1772454798581;
        Mon, 02 Mar 2026 04:33:18 -0800 (PST)
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cbbf4042cdmr1777235185a.39.1772454798099;
        Mon, 02 Mar 2026 04:33:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0dbsm1696744e87.41.2026.03.02.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:33:17 -0800 (PST)
Date: Mon, 2 Mar 2026 14:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iNCBb4c_XPp5_JA6BXHi650i_C2kvBYY
X-Proofpoint-GUID: iNCBb4c_XPp5_JA6BXHi650i_C2kvBYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNSBTYWx0ZWRfX693bofXePiCV
 vjBmkenzWwMTIbx6RIXmgRH5cbr9g1BC7YMZZpd0DMb5QsNfMFm6shXEqUWcVI7N1gsrCEw3WkI
 CG9LpcJYmtjumRRnauF+1jhKHbE+EohN9f4vC8gquO1rYzN93DIPfIT1u/UgTdHkXt6dc+ow/7H
 LCHZIpYE1Z0fgnZXQtxf5mIDTjsdkwbpcer0NV3IzIv+4Syu58m2Eck+G62yz5L+NM3a4iYrQsB
 brSahAvcjkFwU1VYUuYJuRl0FLvbheNdltVCi4g44mECpAVGs5gAsBpVXiWzMn+owoufu091Oup
 pomoM3U8A4r5WwUbReM+NdLPt3AFEz/cguHRS5/KayDvoh/7Qa0n+V44m6EOATla1Lu45jk+CuP
 KA/OOdG7um9K5Hs9irnRAIQKBoZayXfvLIhGCoLM4S8aO74scUQKgOa5ry3pz5f+CvQIgLnDXFU
 x4H+BavgJSZp0YaXq9g==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5838f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=_P5vsXOTX-fIJvdZQ7wA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020105
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
	TAGGED_FROM(0.00)[bounces-94909-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 089341D8DF1
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:58:42PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> 
> (in case someone interested is reading this - patches welcome!)
> 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> 
> Unfortunately, it seems that way. Fortunately, it seems like it's indeed
> isolated to MSM8996.
> 
> This patchset is tearing out a lot of abstraction (which would only be
> useful for that SoC though) - if someone decides to work on it, do you
> think this should be effectively reverted, or should the NRT VBIF be
> instantiated in some other, more locallized way?

I think it should be added as a separate vbif_nrt, added and handled
without touching the main catalog. The main difference point, xin_id, is
still in place, it will be easy to add dpu_kms->vbif_nrt as a
first-class object (instead of forcing the complexity of
vbif[VBIF_MAX]). In such a case I'd prefer if calling code passes VBIF
directly to dpu_vbif_set_*() functions instead of passing the index (or
it might be easier to have a separate wrapper around those functions).

My opinion is that if something isn't applicable to 99% of cases, those
99% should not care about the remaining 1% usecase.

-- 
With best wishes
Dmitry

