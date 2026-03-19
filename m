Return-Path: <linux-arm-msm+bounces-98706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A0hJBbOu2mXogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:21:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 692742C9635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 421F2302F176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA223C457B;
	Thu, 19 Mar 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pL/WoztI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewpiowIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEB3C3451
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915639; cv=none; b=XQYPZGixLR0xxp3gthsA0CCbXt2RL9JlFo8ZiUBKZRvFaE/U+tpWzsLg8IjycTu0O6zfKoCMenAQ8MEqFF6KojykPNBQnnMjA1bFwgMZWunXlomzHq6pU7wmtb/tuDRMEs/31Pwn14HAiznqGVQ8nR/CYkwvCURd2nTbiK5hS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915639; c=relaxed/simple;
	bh=wXrgYmmBOOLY+uN7MnvVeB22AOEm7KnmaCtsSI6mCu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAKYI/O/y1a1ZWch5docyeBN71JZttoPCQmhBhN3MkX2k+1l0XaZ2u7esb9FUGQvoVmkPL4nqWaYcxAzuSTqf8dD8Rii8zs9GkyT2Qr4Y4K+eOExMeB3QqXHbJ2mCMK6f+HlpfZhSYyiOsXUbijOm7K3iQQgaQMHD4tUX4yibG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pL/WoztI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewpiowIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J742ga1770897
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F14dYmtwhWNDhnCsov2s0WNK
	ZiUjjbCXBkIPyd2HLL0=; b=pL/WoztIQJeL374qJ9fx4yztaFXlaCFYhg2PxPtu
	8DJx3CcSuIGnpjmHNmTEaqmZhG9f/pWo4XZOPofPguiO5ztlrjaDECP0qOJHvNEy
	YtyGV8Ayk8xgVadB4RCPe2tYkbBz6ta7w7PPtRsXFo2u4LYtu3ph4BI4ouU/fVGV
	QbKP8rPfgJWwJTg1Lwr3DL2dx6hWMeeXKblryHAObEWHrSaMZ7DjqnYNmlCzGyYF
	coJoGhLf3WukWOCBI94Jg/F1UTjMLOqhw45WHkEURZ+Sd9LzvZ7BUlyk19KOnood
	MIbK+jxBAlJqiGfFA4dS2l5q9lfKpNs0ouNuR6beLz2VUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75u2yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso113085281cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915631; x=1774520431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F14dYmtwhWNDhnCsov2s0WNKZiUjjbCXBkIPyd2HLL0=;
        b=ewpiowIk5h798emm/szxjIta96YKrzCVjlMtdQBL23I2OoUheUayYc6TrfGOK6P9ot
         LTDmZQNHIeU4/SvBcHr9nNxwNnCTXwDElKhQ+doIsDNL16sZnd4Qr5VcWPm0QKCEYl/i
         l78CnrgbhH4T+gobvQ4fJXHLz1tnXnczT3L/VL2mK4/zwyvqP6xa03Ud5j/ulO05vbWt
         m9rHEa3oiEwmNeizy/LYxbGWag/bxWXltCU4k2ZjWnywyOK8vFI8L4gaWxc1Pv6i2T/V
         ptnB7K/YbMU7xJpkqWNFEvuxruMaIy6YJ2TBVQ5wgK3B61FxZV+0xkIECzwHx6/EqkeM
         VVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915631; x=1774520431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F14dYmtwhWNDhnCsov2s0WNKZiUjjbCXBkIPyd2HLL0=;
        b=Oyqif/gP4hpWyqzDYJYtxQkEzGaikqEq1px1HEEC/7w9555/YXjvooyb9UhEgTjvLh
         iFaoVorV1j5B7nGe4WvIauBeKjBDNtioT/jhqk5yJirR1SMyPdVEEmYxmutfF5EP6sJq
         7SzvxHeW3NOZyG3kiM8+nxINgaOBD23ITH/lFVBBwL3khJcJyrqgCBOqbwta6UOsYawV
         leAPrswRZeDkMnD+ASaVdvuYy8eYZRYLoO1lk0b28r7yxDle1EWWoPjr3cU80/E6XMi+
         bcbjT11LvJ3xu1SNHcsyUFY0dpWlBY21ZDRl5BHgSetPeB1tDRUslY8sLYOQy+2aE1qC
         b/xA==
X-Forwarded-Encrypted: i=1; AJvYcCW8xvcDe98f9qTe0bQ+ZNeoduEPG4kxVF+YI0chECdz2mcx3NbpWzCZ+8Ngap0QLxOIVfviHAFolI9WgNwY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kvImCoF5uUiEwsuqwFCGjQs3fcNOtwHwDpG+wzxUB2o+Efbc
	x8t5HabJbPseqaMLjE1sPFJuza10xIZ9fLkO65bBZ77oLbmZwsLcSIg+JCOtA9ZtNvAesd0adff
	Kg1g7dmsyvJo0COBzlXIIdQkyzcD58vXBx4gynYiL097K2OkIJIaauFJkWMqO+91c3E56
X-Gm-Gg: ATEYQzzW9gywpEPjlJ2xCFmCbRphEKWoUVWCiLXDE9crPtkHWYT7QCo2CjT50kHrUJy
	fsAtRZ7TpiHY/iVHD3pKvwk/lB66sv+ow8sID9Jv9EfLFLh8qyvBrH3l7YY284DpGCjntYduol6
	4HsWP7s1N3Ohli0EQgS0GvujD38RkINk4LJn8CoQ8AZxFezfQyNyktgAujHJxJhemxX8qHkduwK
	L9wE79vW6IIE3nnZilM376Uy/diaidvPLqR2rB++PkUmqplX7Id2HGjNaY1OVy3XJ9mterVBRU3
	sRRX8P+4nscvlcmIyciCkIgueDzgY9m1KLZY/IXGFX0KITUX4XNbAbd4t/9Hi688d6f1xL5kD3J
	7rmTB7C2BcoIe5EG+g5RF4eDXdXZXRp1NSZVouQPMY8UFdt4fIeCRH85kJ9bV4A1fBacQDnVcbY
	iUHT7a21WE4jvp3FcO0nLkpiYw+0vNDyC/h/w=
X-Received: by 2002:a05:622a:154:b0:509:37b0:7b06 with SMTP id d75a77b69052e-50b14745065mr87141891cf.11.1773915631482;
        Thu, 19 Mar 2026 03:20:31 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:509:37b0:7b06 with SMTP id d75a77b69052e-50b14745065mr87141621cf.11.1773915631057;
        Thu, 19 Mar 2026 03:20:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e4c0sm1118102e87.39.2026.03.19.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:20:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:20:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Message-ID: <cp4ge2f3cocjkk4dj473jggs3wto6gjuxgeorthup3kse26eaf@y66beakv36qe>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MiBTYWx0ZWRfX5v1t00UMiQqv
 grfhby+m49r9ampFRfX0HU3AgiIRAxnMKQHB/thtDKsvD8RqeAFEdjpByvq6QngbKkwZ8RqhE3e
 HQhCFeGaKvkBi9mgAQmybZMGMzxB+W0Mch/H9h8YlSf7fJl/Chjn5Fx8CA1R5LyQ8L+WAjCp1x2
 LxGToKbXdiUpXYirL1cWnzM1+daQS7FoTZ/jBucRSGGOlUNAcPArjPP7ctIjs5ngfgKjbgg6g8K
 bvUYVM8c5jRcYI1yG8nTKN9w79+n+Nm1zfUERBzlZspFNnSMEuU8L7JG7bcvv/u3obIGYRwQnQ/
 9QCMZ0UPslqVIwQD3iVU4ASRZz4SxfV/lE1zIaOqz27LgTrwGlX/s8zbJdHnUkzc20M88/oW+kf
 VYTmEDDnhJ6bMDvo9ofetKi7KL5o0idzV3eaa2jEKNsoAJ4eZs/+HMX0aIvWIXEpBgEXKwnv0ZE
 jNcDDyog3wg8MzrR3/w==
X-Proofpoint-ORIG-GUID: lBYP_rGGNeKwDSWwCEcjG6muXlMQMjri
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbcdf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SiDv6NLMiRjB6r0vW5IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: lBYP_rGGNeKwDSWwCEcjG6muXlMQMjri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98706-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 692742C9635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:23:57PM +0800, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

