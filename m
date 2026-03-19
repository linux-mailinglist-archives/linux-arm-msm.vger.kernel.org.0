Return-Path: <linux-arm-msm+bounces-98607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGlMItZyu2kdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:51:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB02C5B55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BBC0307D4EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00F930E0F2;
	Thu, 19 Mar 2026 03:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSToykMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jARyPCdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E741E1C11
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892307; cv=none; b=bNL2PF6SbJMFjIrzfq1pK0Y38Nv8piwwzV8v8yw1NPPTRq431C5whsM4a9VRknrx06eEkLBLs3w5WYLOb3t5amypS1mvrbLe2zvM6+nTAdVE+bm4gWcgCXXHXNBaJ7yBLmdXpFOIy1n5J/0do8zoohbyqY4w3LAzOaiq/0T2Sk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892307; c=relaxed/simple;
	bh=+Aqfr2g3kKk+EnLVyITE8EbVgWCth8DpoXrPuCPoS6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rm9ceTBlH/6bm9j0/mgMB2SSvEZcuf08qyBiN+irWy+XzLY0WKg0qTTNuY6sdpEK6P0uEbEg51Hqjos4WdHC/PpUm+sjFwNnZl5mT3O8405VOehYA563WTnsuufIpOWj256xYJ9KVeC2igRgIUDtpd81U5UmcFTImzm1tlW+kQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSToykMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jARyPCdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J1pfDj004821
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3W/YkzyHPozK/274pAC+gmeA
	pA7r7BpU9l9L27ky92w=; b=OSToykMkuC+7d2raqw3FkQ1pyF/0XqVRBavO7tMP
	X/jiwtfeYcw7rg8JHZddSPv8jDAqr8Gtuft/hnk3eV+o2rShaUApxF74ELE9TEFv
	mO6G65hSSIZ6/3awFoUgngBrRCnXzeCehbl63qk6fXct0363fYzKqjKX6JpGIUO6
	Ap57gnSNPHHwpUzYd1fz5HPlVpktjd0cCehlTxF+C4tgIxmrbhO+s8iqGtFBeWLM
	kem49VXFxz+B+zFwzjbPBCnM6hUeF03UitAxhtF7g4vgRjMWR7QqmFozVbocKCqJ
	D/f0LQaCZLzR3KMyH4AQn30GoqVBclHDakaKILEuJOnt+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhg9x3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:51:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50937c5b742so25869131cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 20:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773892305; x=1774497105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3W/YkzyHPozK/274pAC+gmeApA7r7BpU9l9L27ky92w=;
        b=jARyPCdHOx+o4jwh3aB7X4a/J8xjLSPufWXhfaFMmluGMj1N/SbaK1CMwKKYWKpo7l
         hCuc9aYopotcvBf+HJguon+/9KoB6kVLXG2Pl4I1SOheNBGL6VDzD9QAjAKBCL688j9C
         PZWyBKRomIYxkCEixYT9YCMfgIUpGir6cohESQmpQCJNtfjN7cpY1MrPy8KAMbApTJng
         NdZaoQgejN9Cno1Ift/vP0EmD4VZRhufTuznmgH5nVBgw4sCY/3jCDWQwhvCUTkuNhKJ
         3Dbme1HdFSBPLlam5IOK8Hx85IEV64HnVGJGsfzx56WonjXSSNFJCYVf3CYQwjh+hxE5
         LHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892305; x=1774497105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W/YkzyHPozK/274pAC+gmeApA7r7BpU9l9L27ky92w=;
        b=VxVGkSbC5ttC0ai6AGHQ1tY8AYoBojcnik7nfaAARyIb7NS0gXLN0Lku1oCjhd0deJ
         8J8TohMPd0JqE1hQcIT+61CfkkpVYSmmFH0ChZ/hikU45VU3wKnEtU3BqqfhtKwnjznD
         3BUCWQVVqqZyD/jV8/Yh5maMqteRfYNtb6G3r6Dcz0opt6dmMwwbmF1+ut57pWDeC0dr
         9aDzXFvC4cnMTVd3t+ACF/oXtkBdaNvhL69wkRrQtRq9BbpNry/IAjLvIoUXXjonLeMC
         nVw/yolMwSvAexd9hvTnYDJfYAxp7Ag51W8mvf9AhjVtJcS5tMqMNIv0TOK5wbML+qhu
         slyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQm6d8bq8te+oJqywJQI7ARlNwBDaJYsXGHKBMPABGtD443sFbw+Tzzs12NlrywQUEuPctuLduFHTInyFB@vger.kernel.org
X-Gm-Message-State: AOJu0YwjT1SjkmbThrFuiCRpTpVIyE9U/+XGSmRhorTPSienjPckh83t
	cyD6LlAB88E7AMQ6u7ZjQOInFgeuc2TrqGfRm2AOjZuxA4z9OAFfVtt2PFs9k2R2jpPBGsQ9BYT
	xgdZk8fhzj7X2q2A4eOTmmBAz5ZfD4JB89WVecFbK19cFpYnQLuChnalgU1hUj+YisWac
X-Gm-Gg: ATEYQzzkpZC4QG934mF2jnO995V3CvRoOX5+/xQ5HRxNA+8JI6Vsnk9J9MmOA/ZRndk
	Y7/hyFwuHgYfqrzgv8klxiJ7bXTkA+pUkOwr3dVnOpZcTxXS1j+FVTPG04jyuKXX6w++ZcQIHp5
	Q3LWzCHb1aiwhtpGXwA9456HX7zkWDX8URBemUwz9a7dlIJEJVbUkyiuQQxuEND9A+dhtUmk54O
	uGBathtfVCdW9MSdbDiFi62asgVjrUi0wAULrkIcBhx/FFThlyKG2R41xIF9gfIkXFMPY4sL8ta
	J+zZlx0BQwTqkIhFwVYWFh5fNvk+O8jvQIo6HX1AsbXYeFZfeE37bvsBlPCs/VHxfupg1svU4i/
	T536SjDBsIbaonTjy5WuqPNoBRgH5dCrR35AKeNpxJHw3FHv7hcFw35T9V2uTxn4dTfohUrfb39
	90j70LtRmlWupnBy/MGhSR4+teiDALxxRsKfg=
X-Received: by 2002:a05:622a:1448:b0:509:1d55:6367 with SMTP id d75a77b69052e-50b1485e83amr74788651cf.36.1773892304798;
        Wed, 18 Mar 2026 20:51:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:509:1d55:6367 with SMTP id d75a77b69052e-50b1485e83amr74788451cf.36.1773892304269;
        Wed, 18 Mar 2026 20:51:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e471sm948514e87.40.2026.03.18.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:51:41 -0700 (PDT)
Date: Thu, 19 Mar 2026 05:51:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
Message-ID: <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNyBTYWx0ZWRfXzniqs3a8Ly08
 zipwRDE6eaO0NcxhEiEexeuHIhnjio8Hl9gBxfIl8JCpVX21TbRhe+A4KMtMuRSITz69ANV4L7/
 /HR9LSClfE4PT704cQ0Nt/nWyMDQyGNNcxFAI0/u+poloeHSj7hLtlunCnEbhgO/lvMG65waevM
 qpnIo/t9XT5XhuRJ9iTMvPAbOCqFpnzo2O4XxJVt2DMPTzi4TKeIXH42POBZHf5HF6+RGR5dcPM
 rljjLeh9yMU9bQSj0DpdpGw+d1FbEYqt//xSzQ3FsF2JD/JEzYTUASOdrz4k90Tsp6TnED8V5Es
 h5xaFLQ59YaVdH0ZlLEORj/u5GuXGTDLsCu777KB1XNfxJ9Ms4x20bNR2y+FiTO2sAyVCoaUKOv
 G4QKpzO2kRZ6S97zQUpccu3NtBOXKU4McftepIHSHFKoXa5piy7TY65mHfcosiwklsckclkT/rS
 JC5sINg4GdnlUF7wKBQ==
X-Proofpoint-ORIG-GUID: ToOfwXGMYumMUC0iOHGOjPjp318-5PaE
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb72d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GxE_oxOnowU2S2JLwIsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ToOfwXGMYumMUC0iOHGOjPjp318-5PaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190027
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98607-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.966];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9FB02C5B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
> For platforms where the bt_en GPIO is not defined, software-based power
> control should be disabled when power is managed by hardware.

What does it mean for this chip, managing the power in hardware?

> 
> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> cleared when bt_en is absent, aligning its behavior with WCN6750 and
> WCN6855.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index c17a462aef55..4512ff7cd0c0 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  
>  		if (!qcadev->bt_en &&
>  		    (data->soc_type == QCA_WCN6750 ||
> -		     data->soc_type == QCA_WCN6855))
> +		     data->soc_type == QCA_WCN6855 ||
> +		     data->soc_type == QCA_WCN7850))
>  			power_ctrl_enabled = false;
>  
>  		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

