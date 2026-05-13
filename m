Return-Path: <linux-arm-msm+bounces-107252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP+kMgdVBGqMHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:40:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D596E53172B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEE403007AC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59F53E5A15;
	Wed, 13 May 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9ldTnEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiqP9Ahd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803DA378812
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668801; cv=none; b=L5ZcMn09ND+jSk83DdDPZzIwGaXgg8BNzqXCFz2MpZDL8ivO6n38gkX6fEc0BULyoLuf46ldNBT/8gvtvxaW3pxfb3yOtWoupDOfXM3Bv8oIgSSoeWsSt1CsiQVc0YUi994eBIOknl1FUZcW/YqSdtq028MJM4apOtEmez1aA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668801; c=relaxed/simple;
	bh=LmMlAWfOHponJ5NadPPNi179OuVV0BnqGf+wAfktPgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2uLagV56V6VfG+VCg1gIbXd3M56+RXpkis5hOSI89+fiR5gvQT8IbAJoF3hiFWWZstB0oqZtHIaPFBMrLEKrjoSAvnKZirGqOuQKV4GrpvIZz1A7UsWKWescVp4BmD6NP0il95U+C62shl2S5dkmd19rskNTDdkprM/OaG6vFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9ldTnEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiqP9Ahd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVjg41393025
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NhziQD3I23uQmmb/464nQidA
	k5Ck271CFtU+xfIGgWw=; b=J9ldTnEuCPlz/ebQLONqlqw39oSWBFgP3x1pUC9S
	SDUBN1REBm+wA1/82WlZr3egw/d4QJyOMgJ18K2vvKaLbDEY7uuQI4WPS5jZvEA8
	0FwiJa5K29vJpb0tt1y/i2e6uBbxG+otvk/E9jeYD+ChAp30tvvOVUOuxKyf7ewR
	vNpzOzOoEzKc40PhIUbimfT/tPN3V4vBTDuEak/yo6prl3gXBKVt+ZMdtB9xhbnj
	NmCZyXsOBAXHMY3/TfDvQXZg1+62t3y0RiT6IawbduQXZJyuxxhkwQN9iOgsHpVC
	M6E2DKxKElUgkfIItmwTAEfx9H8xwy4LGocl07H+7xRcbQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26181b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:39:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so134426261cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778668799; x=1779273599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhziQD3I23uQmmb/464nQidAk5Ck271CFtU+xfIGgWw=;
        b=eiqP9AhdNgOtILfvqg3RxZT5BovFMilM7Ug5Jr3Lw8fGQNKxOxKfrYOo0sp6xnwE+a
         2Ik5rUOsq2ST+442HRcWFFe/buA2yPhMlPoeYE/GdfLlCI7sbmL/jox6AdZ0XkyIW97e
         G2+rrnPJYT84+WiHscRQx25XGVon1iBETUFoSkiCegXlavWbdEX36s5ZngMs1Nm+ZviP
         fiTnMRlgnvoZ05oeP5UNC8l8+Cva68kz/4T9/41+IJCwN8EiFc9vRGSYLEC8XKG/+yY8
         nHab7ByaNTw6EAYPnuRO5kUcm+250eC0a2WN5kSrsBdgOTXp9Uih1fp6JVaOMH1d0hdS
         skFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668799; x=1779273599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhziQD3I23uQmmb/464nQidAk5Ck271CFtU+xfIGgWw=;
        b=EdEHbRvsFEvh3n5+WnErx53fCVXvVIoxsDG2yuhu8DlTYv4im3AcGeiD4K1zLM2R/B
         KRjAkkmgsnZ/qarLE3PwoPmdhfDPjKYL4UDIxb7QRMR6ybKGLO8mODuHDQBndXRhwAxB
         U7KT6RfLDYse724micLZwNfE6TPzh9Y3Ap9sUzbtj7wQxjsKYajdWxSm/S9JwAtDyIAG
         sP7KtEyl0XJH75iF9kjSn94VX/bQ1n5/BRLsK0mMpdOsuO1ltpWbJOM9rdNuxObOc0y/
         w8Z4n3GBlzQpa9JEIO5VoNu6QvcsAb28W4a4MEw/26N/mT0u6gJrwKFin+f4M96UMxye
         f68w==
X-Forwarded-Encrypted: i=1; AFNElJ+gfR6Rb2d5xtLr01wBQX6qHxOa8cfjEYE++c7AfPssdlu5+YXluZjhFaJzdvoY9ppt86ASmtlgKeIdTohh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZDRdHWUcVlTUAR3/N0R+1G6kJg3VWp0YfTElLgJ2dLpVn+ge
	vy08P2du0Q1QS70LfCqIcq8cH3xSdVsUOusLlchwOyuK1lg2LayZhIZJezNClm3IJFauBA56DoC
	28t1KiYscmCahIofETvgsBMUkF15zxBh6RXAoL9cbzUNT+u6XOQYu0GIImCdO7IigA5hN
X-Gm-Gg: Acq92OHRHzh+c1EpegO0CIZRhFi9F1k+BYkJZRiXNz7JSm5ZzNx5GLJ0R78fKaE1Xb8
	aA9+CW1k4A+PvVges3YzlgAGHaeaPgTn2BVd8EVsXuHdTkkssCF0vv1fD718Ub54v+RnfyQVICz
	rvcgGyl17YX/upF4zddaqkkBCfsXIovrjzWXBhQM7ulOWuP6wANBctrETq+0MKLze3NSYqRMGiY
	p1inuSKgAd9N4dgeghOTosHYntK8dUeuxQvSsptLW97NVrzoGEb2FHpIpK+5Hh93p8MaOKx6+Rp
	XV7EjTJI4FE9SBk57AVzRYJnTJ0wUd651Y0SMkxpnZfs409aDTKvSey/NWVSfKnGX3brUyrvDaZ
	/tz7PQ77Ez2flCu8PJZZkB2z7g4WHoDbPrAVwaen8e0Y1+Ac8kEzu14iMJ5wTNK2bfZBi7PJW7D
	MF+vwgYE0LQOHIAbCaNGr3gWqxAK9MjDowt9I=
X-Received: by 2002:a05:622a:1906:b0:50e:5acc:e792 with SMTP id d75a77b69052e-5162f4c06d6mr34020731cf.14.1778668798651;
        Wed, 13 May 2026 03:39:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1906:b0:50e:5acc:e792 with SMTP id d75a77b69052e-5162f4c06d6mr34020501cf.14.1778668798233;
        Wed, 13 May 2026 03:39:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4fcsm40450251fa.19.2026.05.13.03.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:39:57 -0700 (PDT)
Date: Wed, 13 May 2026 13:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Message-ID: <hzmcaxuajqvfo5pidetcplhe52e5cmppecy5tm5dx232cgv2ik@36shiw2kqfvz>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0454ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=70vGjhv6m2chQG9CenAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMSBTYWx0ZWRfX9AzqinExqiUe
 Ms4pwp/NelFHEAJDo1Y/1eF41JpdbB7LXcRiwNTQMufbAkxsuWQy/MwUnz7devI5V0ntoGqKRVp
 RfHl6mRRVScTO66n3/g2APmMiwchr/OXC6ifRVo3NJCUbu8625HkumxWtmj32NJckT/hES2xhMR
 Z4qvbUjbQZ6BeHFyNlUenChbgf/npC6q4Dlst/KUevJ6wZ6WvYQsaKbZcr/cq7/5yibByz5bBaC
 p7odPndYpa54RojwA3rY8W6L5ahLhn3XSnhSUYk/aHsvmUkXIkDeW0dS5KK0Ax+HiGByrVn9IMP
 wLh0iA+VAa4DS86o1skX22YAlfyVtSkJvoc1dJ/cGkUk69CiLi+xM6kYzcBUmtDWZZSFxOsODTg
 m8hXP++6sV9yvKUji/40CndSnScHockHnT0zEJnjALq+Podu58m/lLToqIHtqNQgwQ2sPdU+y+u
 uIwjPEv68bx/MdXlwFg==
X-Proofpoint-ORIG-GUID: zIaehgRVQ65KMsbz3urlWholD8Ch-aFk
X-Proofpoint-GUID: zIaehgRVQ65KMsbz3urlWholD8Ch-aFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130111
X-Rspamd-Queue-Id: D596E53172B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107252-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:29AM +0200, Neil Armstrong wrote:
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
>  2 files changed, 39 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

