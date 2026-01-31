Return-Path: <linux-arm-msm+bounces-91366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FCNH5bjfWkgUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:12:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E1C1AC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E23630067A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFB62AEE4;
	Sat, 31 Jan 2026 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSBQ51Wl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3wZQybZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8F2E6CC0
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857927; cv=none; b=JABF81ocKsKCax62tayrdSq/5yKxS3nMbJN6JS7/xZez+cO/JoOfCKFf7EQ5Dz0Nc9NTsSvZ6dq6wGpvEBtejQ/6w1DZLoQ9smUAAaK6dAXo3Z8NosWpjMfwJf2f/WBN/wS5n5JaR189eCL4FWzjW7e3jsalWqonCSroI//XQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857927; c=relaxed/simple;
	bh=hEGQeJLc9snxgQZrvlOkd2u1HNhX5oDOZXveo7AXrPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFm09EAAJS+rOFAAJ8a4MoM+hVPxUHG2uVEcBi76zOElrUvUaMP+tH86VOKrbyOlBRXUJtwOMfUM2d9bni0+6K7/9EJpsBakKujG2aGXW1o24I7xsdmqErkyGPSQemb0dsLLSuliV/m+l8Vi8OYWyw2JkkPpkPRMkDk/8/0EWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSBQ51Wl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3wZQybZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4lfLC4058344
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OoZ8n+DyPxsq2VPklZMA/BOv
	eui80D5NC/TA0egNhEU=; b=QSBQ51Wlr5tmJDn1xAYzBXtat/18Ievd/Df9C6Bv
	5npFlt7E+91F/wR34qfNS4Df0OCRI40vzSzPQbDI58VeVEqAhf5NJc3yQrhJ1AsX
	XzfBsvQaQ12I4LooLY89+4FolmZgwmK/jKrd9DSFsoFFwHHQ78NEZw/vXPJ042jC
	yHs3t0ujp3xFm5l2HSiRnwd9FWpEYa4Xm3WfSj4z9la6kyMg9Y391JrrtkAw3aKm
	97ITA1nf2IMTVnOXZoSrJ2e/boc2YutEUhi0UVL5Y5PJ4iTXfvF/vj+w747/vgzr
	ERWQ9p1uT+LlWTzeRL5sOATVSLKhBf8DH6wDgxtQq+38FA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17rmdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:12:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f5409de680so3526901137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 03:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769857924; x=1770462724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoZ8n+DyPxsq2VPklZMA/BOveui80D5NC/TA0egNhEU=;
        b=J3wZQybZf89+7mzQDSpsA/6NtxkyfHALjZwY04dt5QqCrgwL9eTDWOu3sjFAfI1vtd
         KXMSm0LH4rap8rw8kXR72wZ5K4U4VwmLrPjsxpKvJm/FXdC0ypYyZjtqcfgp81/EMhUD
         moYab5w5g02cPT1P2HJkV4jiCnKYMLf559GiH9GDCMgDzQISCox1/6nxS9I9aUhqpffC
         APQMzMlGurDg+H3OhsfYheWfwsgpwCFXKW2B7hC5H2+pfZZu5GQk8PlyiN599EhMp92y
         SRGu1jHIlvZuQgXtxhz7rRxXfeDI/fd2K72JTb0yApBHOgYnn6xyHyow89Xi2BQ7WPOg
         YH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857924; x=1770462724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoZ8n+DyPxsq2VPklZMA/BOveui80D5NC/TA0egNhEU=;
        b=EcJfKPTJvf4ponfyVOwO1LWjFE4a7L2NhPji2RpurJKX2W/vLhEQngEpjaZArwJWiw
         lymzrL4LLHNfMG0uGLKGrXuuNcbRnDQt8bHSpE3QntIm6daTP6U90mYWq665pQ756l6M
         TxSjxlUMkuwk6mEzUckSrrE20gDycLK7ctlwXMrgUzZxPNTQ6wn+trAC5iNF2wbqlZT3
         RzYam7nxbDG/eSEscFqqIIPNyTxgCftp8NbDjzsP7niut4NKhBiZpHZjr9eTkPpLPx7n
         tfRYtzagwkYMvfjNP2Wi+5ExSt585I6+Uye44JZsMIWcfHWBTmeWrJ6Cbh2HNBadG9HA
         Y0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcCAZnxRi40qttLYzx5xSypF0ezNAV1JkKRzCIvPyuivLiotuFqyBkPpKdOVMe8O5ad13EHXYKY0CgyqqW@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVcd4sfCeIS3iO1J8Ylq7juSIFk7prQNjc8NYTuxINkNcUU27
	USJaOnlSeKLA+1++7B1NCJOaiUWCTIFJWPkpdR9Nl+2c/ALYvBAdoqMW7rY2AH3sJHO0SbHyFnV
	eaO/h99VziOLWUAQZE34hGZKyGRctycqu3z0PxBoBjni5neb7PUXR4SjPABXrzixb1IOU
X-Gm-Gg: AZuq6aIMj6ArwJriVyOqCtYLjHNoUyzkIlZ1SdwLmrKDGbYK03QISuKFOMMCt+01iFu
	xyVKAAfQQb/6AixVoIP4IxKolrIlufoiAYCLDMJ/tN4OD+HpsImoRD0QsgS11S3DOmO5XHw/6oq
	eAeEPFeq5hR7HpgSVUZMP04LWTsQaytYL8v2ox1PLejkl5qtWvbgeGy+46Xi2Kw0yEGxFVxqhfB
	25IEtMX6MgMODrTmp6wt6M4F3c38nleTnZUFIHhltz0HVNptPycB5CgKJH6+fYtLQLFeot0yW7l
	l+Bx+9yyRcpSFeNorhh0rdHlx4Lyommk0wqpFrgwKEFGpMH35ER+D0BLAQm6Pj8/Mk7eriZIHKJ
	3Nplf7ayBj/7Y1faj3Ef/+hZKq4SeXif1+KrsV5h0pOoIXtN3DtX68HEKtP9Jx/YmkRvLvXsmT4
	Jz2IEKWL1PLkrl8QIzN3T81MU=
X-Received: by 2002:a05:6102:a48:b0:5de:93bb:c53f with SMTP id ada2fe7eead31-5f8e26024damr1588875137.25.1769857923751;
        Sat, 31 Jan 2026 03:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:a48:b0:5de:93bb:c53f with SMTP id ada2fe7eead31-5f8e26024damr1588862137.25.1769857923275;
        Sat, 31 Jan 2026 03:12:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bc9b0sm2320056e87.91.2026.01.31.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 03:12:02 -0800 (PST)
Date: Sat, 31 Jan 2026 13:12:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] media: qcom: venus: flip the venus/iris switch
Message-ID: <le6ji6czj7z7z4tfyzrjjr2yei6cf6ilj45poi5gccj7fpocmm@gbbb6t5lw5yb>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
 <4257fb6f-280d-1866-b531-c25efe155d04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4257fb6f-280d-1866-b531-c25efe155d04@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=697de385 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mVD6tqMxNuARRlaT7CQA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: xuc01eMID-35snmjgMv01K8NfaWwMaAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA5MyBTYWx0ZWRfX65fnTMjrXpqd
 se2NILN0HtVdfGAuoio42kKcO9HNP5Nt+/D48BRqEL1crM7bEQoCyfD9fr+PZmm7Jk27BuVO72t
 VRlYj3lTCXeCtcIX7R3lX87Cx7MTNQGnhedg/u6Nufh8AdxJC/umQT5nQ0dkbtFZ5FVTRrIBAhM
 0FKr8madVIuZ1V37zIMLGiRSOAP/NiyHee36F7XgMinr5LKQaSxM2phNQ6cTtaYRX3Iuh+ImW/j
 ezOkBKYnJK75QM/I92cwMcusrXIOo1fPOMDxO1tnt2nYvnRZ2WrmnaHCZLQVGc+PisM7Ej12uN/
 WEEzkSWEjMZ6CnU+2foP45En/9cVIreYPUuIJSM5e8qsI57AQatmDwh3hZAxUgQ1vmh93s+9f8s
 HaZ/OD2Zh8T4ZI62dliwIvOY4XkaG73sVnPUPc4zLia9aPXgA2zt+T82LYcnQQGbrKL07O7/RYo
 7g8MJ0JBW3onWkZCrow==
X-Proofpoint-GUID: xuc01eMID-35snmjgMv01K8NfaWwMaAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.30:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E11E1C1AC1
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:20:06AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/27/2026 5:53 PM, Dmitry Baryshkov wrote:
> > With the Iris and Venus driver having more or less feature parity for
> > "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> > switch. Use Iris by default for SM8250 and SC7280, the platforms which
> > are supported by both drivers, and use Venus only if Iris is not
> > compiled at all. Use IS_ENABLED to strip out the code and data
> > structures which are used by the disabled platforms.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_probe.c |  2 --
> >  drivers/media/platform/qcom/venus/core.c      |  6 ++++++
> >  drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
> >  3 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index ddaacda523ec..7b612ad37e4f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
> >  		.compatible = "qcom,qcs8300-iris",
> >  		.data = &qcs8300_data,
> >  	},
> > -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> >  	{
> >  		.compatible = "qcom,sc7280-venus",
> >  		.data = &sc7280_data,
> > @@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
> >  		.compatible = "qcom,sm8250-venus",
> >  		.data = &sm8250_data,
> >  	},
> > -#endif
> >  	{
> >  		.compatible = "qcom,sm8550-iris",
> >  		.data = &sm8550_data,
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 24d2b2fd0340..646dae3407b4 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
> >  	.enc_nodename = "video-encoder",
> >  };
> >  
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  static const struct freq_tbl sm8250_freq_table[] = {
> >  	{ 0, 444000000 },
> >  	{ 0, 366000000 },
> > @@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
> >  	.dec_nodename = "video-decoder",
> >  	.enc_nodename = "video-encoder",
> >  };
> > +#endif
> >  
> >  static const struct bw_tbl qcm2290_bw_table_dec[] = {
> >  	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > @@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> >  	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
> >  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> > +#endif
> >  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
> >  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
> >  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> > +#endif
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, venus_dt_match);
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 7506f5d0f609..c7acacaa53b8 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -54,8 +54,10 @@ enum vpu_version {
> >  	VPU_VERSION_AR50,
> >  	VPU_VERSION_AR50_LITE,
> >  	VPU_VERSION_IRIS1,
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  	VPU_VERSION_IRIS2,
> >  	VPU_VERSION_IRIS2_1,
> > +#endif
> >  };
> >  
> >  struct firmware_version {
> > @@ -525,13 +527,22 @@ struct venus_inst {
> >  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> >  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> >  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> > +#else
> > +#define IS_V6(core)	(0)
> > +#endif
> >  
> >  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> >  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> >  #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
> > +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
> >  #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
> >  #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
> > +#else
> > +#define IS_IRIS2(core)		(0)
> > +#define IS_IRIS2_1(core)	(0)
> > +#endif
> >  
> >  static inline bool is_lite(struct venus_core *core)
> >  {
> > 
> 
> compilation fails with this change.
> ERROR: modpost: "sm8250_data"
> [drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!
> ERROR: modpost: "sc7280_data"
> [drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!
> 
> to fix this:
> ==============================================
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_gen1.o \
>               iris_platform_gen2.o \
>               iris_power.o \
>               iris_probe.o \
> @@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
> 
> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_gen1.o
> -endif
> -
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> 
> ==================================================

Argh, this was a part of the other series (the sc8280xp) and it got lost
in rebase to next/master.

-- 
With best wishes
Dmitry

