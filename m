Return-Path: <linux-arm-msm+bounces-80685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D7C3E509
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B56D23AD657
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9002F60D1;
	Fri,  7 Nov 2025 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXgVXgTj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECuRFRJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42D2ECE97
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 03:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485239; cv=none; b=iNR/5nWJ9gBo5pILMlk+md920rXySE/SbnKQFZjwMOXyN06k7f73zNU3oSXmiPurlWDtE8+UAZOlUoy/qWnggwqalfYkOFQcmn8tD9egU6qklmXnTLv0wxg6SV8WlvqpVEggnS5AGdOL7+l0NyLVhLW/WxE7hiwkoNSXN4nKD+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485239; c=relaxed/simple;
	bh=1qMF7nlKbcQyP3hFkm2Yom7lAyH0NJ2FKvArrMUXsTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkKBZEJC5v1NvhE1jNXRY7DZXi4jlgShHntJ+GdC5pkrzVt+8SuKuSL36JX9Y0pmxrtgLXflUw9KizRZ0bPM7Zzyw/Bbro0yZ7qPOF+mokCuCnKzYm4H/CHZW52QXTp28Goj+MluMHWcPW+fygiyNEiWGVUFWY78VyGqt3UmMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXgVXgTj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECuRFRJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A72VTcL3155965
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 03:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ulkyrEbi8OnMoUGToNxsPYw
	iMFv+TZXN3Zpai6wGaM=; b=cXgVXgTjAJloHyXh2XZUR4c4wnZphLV+Knql7lBs
	m5JLwEiHlNAaiCe8wGdPSXQsJ8yLthEJiiDJ698KMVSSYu4UXbR/kDVF/HXonwkk
	AT/PZDykrU/ZrIffmNpZKDfw9E3EIjAR+SH/HRf6kEAI1yTTT/erCFR4z8xDSuEe
	sa/05Dt9mT7cqbym84w2slLBJMaUF22ZMiI6GMIGzVFJ0maQ9rGLWTbWia5cMsno
	eKC6v/ldHUgBBm+9BqX8aXZ9ygivcWAYxoLaN16D/TE4SeVIiaDSVr6jg9mCB2DR
	RzpkdQEbMPz2aq8iO4HyidaoUFZPSgStPfzyVgpiV1iCGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pu0kckn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:13:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so4032371cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 19:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485236; x=1763090036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ulkyrEbi8OnMoUGToNxsPYwiMFv+TZXN3Zpai6wGaM=;
        b=ECuRFRJMsbXCxcBH4ncmFOAiBEe+xK2bS6T56lXsL9SUEXhuryoM2HAHPnT+frEHw9
         RkPisOd0el5dzamF5oZjDdJZC4vT25qRB1N1DFuXKQxSaZ/Q44TxrWyx7X3hJ47vmAfW
         7BpTRw3SFkxh/2kBmUNw0+UJuSC8VjKkyKQe1wesbZdA7LyU/xKCMTRuYbc1ZEDIdELF
         znjlMu5wTk57bWdEKws9CJL7dVeG98B8yTep1m2NuJHzdD4zspCZx9pXxtFDcVbr0Stq
         +qywjO3EcuNarMZskpN+GjkmIY1iBky54sl8YTf4U8Mfc1DH1S/4b/wu4QrlxZFl0EsC
         B50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485236; x=1763090036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ulkyrEbi8OnMoUGToNxsPYwiMFv+TZXN3Zpai6wGaM=;
        b=cvDRXoQ1dFjpKnQAYm6wQNxCCfjOXC3gbNecEUuCBBQloVuyKpR8a0/PG3pc3nn/Qt
         wIdcK8zDCX+9l95KJE/CrBrBsAnYbJ0Erw9M1yo5xtWNtwmYEEMSEKFvuJ/qZkqKnYOv
         6yP7Tg0FMeg2pH1XjzSbMqw810ZRC5i8DJtqMh0hAEMwBZnrwClgQTItShlY8nyLFcqZ
         e725c++CQEatpjkdX9lKAJuZrTfnjD8iwutZ8eAmtcfEHaZBzjidfq144hpR3PIVbatf
         cfXqcDYJEYvF1Rok+WTFs6KRZo+qQ8/QA+BiKIZKPG04gxM5OfqKy59Om9wnkOSXlmk7
         2JLg==
X-Forwarded-Encrypted: i=1; AJvYcCWt+3EB0s/NDiwF7Z6+ki9+1juiR84KTSMn+3M4yXZwyT3EuJIanapTSqZEqQ/kgqDOu4v8pPIfunTOkWle@vger.kernel.org
X-Gm-Message-State: AOJu0YyYvFHomoIsWVK5ItaDAVMLnfW9+Rx3PCwuUo5TTiwoVBdHBsCN
	dMN6hI7D03Ow2wmJ1ckVcBU96Dnc/4NgDF6frLQTqgnoFc1OgK/vDeCrmoeXANkttGpdBvdWNUl
	ZXfhl7zewrMA2IIA4k1zKdXoiXElQ/Sd2VVAQYeIdTeX6ZYskO7i/IVG4leKmfYYaWrY8
X-Gm-Gg: ASbGncsyKs7pfEuuqKYnQ6JUJvWHMuNN0lvrzS0nKblssiyFs5EoqShGGsrqaFqHxPi
	YDMvodJdCZsOXlRsjm6/A3g+n0kSsedCCehav8hJNi9TjEOHdcUcHLDh8fphziZgwfpvmyjZ62N
	7E9iIEDI9PzqCZF3/RuF5bUYyZSrGgc9dae0B8lZ5DtErMTEVAtxsIJUt/zEKtBowPAPUsN+69B
	hwzs5Z4sWgYtB8naj0cqfGwrgqyQ4CF/kDxr/rVlGTfWxyIJQpI915VLU+7P+XJT/6144IEhXxL
	SrGVKR6bnkz3hZoLhhRaCX73RNa+B2poRMsfRYjgnHM97j2vdfI5V5KrOFK6PXAo2rMp4wAHNVN
	Nw+3Jvuw9GnZCEFhMuARaH64y7nsXbkknOBcrpIlM06wDsbOI9uJDQP36RNmsc+MQUiE4Kjf6ke
	SLqBX866VqNkRQ
X-Received: by 2002:a05:622a:738a:b0:4ec:f26f:5aea with SMTP id d75a77b69052e-4ed94a8e321mr15222031cf.68.1762485236152;
        Thu, 06 Nov 2025 19:13:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED1oCM5bH6C0iTYRHg+jtwwgcsfQV0Yto6qRZJZKP6JFon9v0IgWDdEwixPFVo/5Mx6jkNww==
X-Received: by 2002:a05:622a:738a:b0:4ec:f26f:5aea with SMTP id d75a77b69052e-4ed94a8e321mr15221901cf.68.1762485235727;
        Thu, 06 Nov 2025 19:13:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a3a1a71sm1158846e87.83.2025.11.06.19.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:13:54 -0800 (PST)
Date: Fri, 7 Nov 2025 05:13:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com
Subject: Re: [PATCH v1] Bluetooth: btusb: add new custom firmwares
Message-ID: <jztfgic2kbziqradykdmyqv6st3lue23snweawlxtmprqd3ifu@t3gw2o4g5qfx>
References: <20251107021345.2759890-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107021345.2759890-1-quic_shuaz@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyMyBTYWx0ZWRfX/IPjaAOu2qsg
 cVdiGvwlYYGPyAR4P2WXhjweQzyAzejmYLGKWwtMpGDSiicdEtqrvaOVoVtABd3R0LnkS5iJIgi
 BPuSwedReDSEOq+oZM/ZQmf/jCfzXZ7cpuDdoN2Aa2BAjgP7ni63fZuhgJmR5BsJEAF1YAbf4Kn
 XoEpROoCCqFb3QkBO6uwGKFCn+jFMAy9hnZoPRwL2MYMzXdYxjrPRBuPlTse/ULVHElyXuA/qqd
 Mu9BG0Jpj08UGKR8mg49tsRA9tD4KeHVVqPK7pCPDMSU2AoEhzjGt+CnVKTrD1Uv1DFR+Wb2wPX
 kVM2p6lmVgEDOV1t7a90BZskc4Uv+LkrjKqDnq8jhxybaSWHXMXjDfYipG8Bmttrpj/Cpq8BWra
 ulVSX2IJ5/jPEOR5id+xaQHRo1hcFw==
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=690d63f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3m3fJbb2j65Qt_-WAq4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BzCv8k8enYabYUFgd5EC45Gz1DcxxiOP
X-Proofpoint-GUID: BzCv8k8enYabYUFgd5EC45Gz1DcxxiOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070023

On Fri, Nov 07, 2025 at 10:13:45AM +0800, Shuai Zhang wrote:
> There are custom-made firmwares based on board ID for a given QCA BT
> chip sometimes, and they are different with existing firmwares and put
> in a separate subdirectory to avoid conflict, for example:
> QCA2066, as a variant of WCN6855, has firmwares under 'qca/QCA2066/'
> of linux-firmware repository.

These are generic phrases regarding QCA2066. Describe why and what is
done in the patch (e.g. why do you add new entry to that table).

> 
> Cc: stable@vger.kernel.org

There is little point for CC'ing stable if this is not a fix (and it's
not, it lacks a corresponding tag).

> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>

Please migrate to the @oss.qualcomm.com address.

> ---
>  drivers/bluetooth/btusb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dcbff7641..7175e9b2d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3273,6 +3273,7 @@ static const struct qca_device_info qca_devices_table[] = {
>  
>  static const struct qca_custom_firmware qca_custom_btfws[] = {
>  	{ 0x00130201, 0x030A, "QCA2066" },
> +	{ 0x00130201, 0x030B, "QCA2066" },
>  	{ },
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

