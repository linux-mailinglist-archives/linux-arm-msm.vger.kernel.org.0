Return-Path: <linux-arm-msm+bounces-107154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEByAuJpA2rF5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:56:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C85264FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A09AD3090778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC74F3DD84D;
	Tue, 12 May 2026 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBiZKzkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhQYbwqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35513DD84A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608112; cv=none; b=PB0aA3vmd9GFQQWKuSyaR3LiMIhqLaiEP6GAd48INxIi5kAc18vBYO6c3V/sg1ifE2ye8DiFiu1zLxQgNB+25AzNYy7h5rOg2Ad4DNmMsGXzrrQTjfeAlX254JoYULGDGyToGqis4GXFKpg2L8+dteidYYAUfXs/EZmT6ok6JH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608112; c=relaxed/simple;
	bh=q6deaHyTznLflz0PRZrxBlNsspIS0OUKdiX8b3/AF3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD/SqQlAm5Nw46sOi8G4L94wnYWBWUZTV4gwIQadwxJBI7DjdHASicQemIj5CE3gU/YgBgfNjmonb8Od8LKVHxFOVEYW82EINuzN6U/hfqC1zgayPpK1nJomlmYYVGB9Z8MupuOd1wuWroelC7uVW5egCtgA3BvzT8wCHXxLEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBiZKzkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhQYbwqB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEJLYP424410
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mDUyhDo/sco/C9b0xflaG8pr
	Jp8RrHZVIReC2Jh7DAM=; b=bBiZKzkg62ZXiofPWc/6PkVMMDruHlkVczMOvSB5
	imyxjKue6myBUZc9GOrOg28KlOF+bOAfR9jwidKy2hbhQIf/D5lxQ8Hz0o5+4deO
	lDOVSFcGRB4mq8b1m4W4GcP10d/k4x03KyYsRvDvRlH8g8PXn0SLktKFTo2W44r5
	btw/vE18+x+FREJX91zvOXMcLCujqdnNEMFkzMVYQzR1DfMCK+pgK+BJn/MpMMDA
	ncztieUH84AWYNN2vV+89+EaK38MCm2Nqq9FOtfKzd7MDD1fR9+TFgpxTjrshS7a
	ljeXMyUeygwlVRt3HHmQoB1e3Oz3LFMTgzxShksjuNammA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45v58ufx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:48:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so91149231cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608110; x=1779212910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDUyhDo/sco/C9b0xflaG8prJp8RrHZVIReC2Jh7DAM=;
        b=QhQYbwqBbbh0ZwWDEVZvgETnreCNsmQjke7gf/jZfWfp/1Lkm5P/dspJM4c7OsrLdQ
         GcEZ8N72hfGWlciul6EokiNqrHOzJbaPZ6KEpBRm/e0EwqaDp/XRI1zjO5mRnSdboIPE
         EqxM8JHOnsUrroK+MtgSBMHU/c6OkSPXoF97IuRY2RJ1gRTaLlLCmygaiI2E1FN4C9w1
         LYhYMFZx+F1+lcdd8kVMewYsFBwd7HCZCAeaIw5ZfXTsnbnYQwI1WZUqjzLhf5NitBXU
         MsDOGVRvtc7f3NMomHNkms12y8TcncrveaBWv7pQYNOOxxA8IzmUEZPeIoUT6l7WXFQX
         MnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608110; x=1779212910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDUyhDo/sco/C9b0xflaG8prJp8RrHZVIReC2Jh7DAM=;
        b=hIS3iUp4clX4n4RXBXFW3tCc5bz49BtX2PC4Zy0MSFDyr2hfWCTfa3kv2i3l03H4g6
         bq0WUYNhPJqu2gFcIMRPAYhq7N4eYRuTI3IW4Dvw2MYVYkDHV8kgYWAnWpSxouocYL3j
         tc+OcDw6vr6p76QEFKbRZhv+Fmz/nOqCOk4OHvWQZ+38zQBbyhA4znoTBQGURkPWaqRh
         EZOA32J9QT7Zks1sRF745TR+CxBHSeh4zsYYrA1jjFsqZMIhmb2HaMdKQyBRHtM7+5Uk
         snBu+K4wrEfUicZsz+UKw75V+p5Q0x1LUI2fRnpsX3y0K/DDFIIRKPud2qdh/JH6SZMU
         WNEw==
X-Forwarded-Encrypted: i=1; AFNElJ9AkaVw4FPOoK3iCyzcOP2EBfqYE611Bv1XLci49A3KlM3zO5CyyRUmoD8PMBW2zHrI7rpBs1aR+rtrtTxV@vger.kernel.org
X-Gm-Message-State: AOJu0YxTldd++dK/iMxGTwlNI6WleJtmXYE6d2rf4QOwR22x8vMIFx9s
	SDs8yXJBXWjewOT+DG92vhbJeKn3HwRVPnqkurXZJUl5lqOBqF0jmjAXmWDWiCItD8Kh2yzDLAd
	xA9f+mQPxWPwQFYL4vRmWEYYxmSr65QMddJvsgv8SYOy1q9hZa1+Sw3zTWCShnAwJa5Eb
X-Gm-Gg: Acq92OGgw2Q9I02nTAf5Ltg+/SCH0hglReBvjvsBp3fa9YNvNEJhaBrt4cmrlU1We21
	TDQYZAeg6rLKk78zZZCNm9w+TW+hBi4zYYRguOHpJ53/YEdVcKUM5/1bJmbgFNvKhf87UwqZuFs
	WUAZG86Q6KBH/Syn9BERFdafkWNNFFSVCYgxyQoF9/cl1+V8VgJl/DnRv5iKzml8acNhE+eHvGn
	/t4ARL1FwlF1ZgW2bn50GRp2F74iOFEJ97mCylOL2Mr0U+7kis139LmED8N3qZIy3Li9aXiPidU
	e3W8mHSqs9b2FTt46K/aF6HtNmm8q+C89fpgEND1mOo0AucDFPLrNg50wtcToTPtumWal3HPizp
	J1Hm2tYPh9oB3H5r+QGjnHPeeHL5EUJXpaiJs2U0g1KqJ4solTRGi0MOP+RUUK4NzGa14axjGL2
	/D0ztc15VCAWX7h51U0m2WOgUO7N6zeTexhOA=
X-Received: by 2002:a05:622a:17c5:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-5148e894a4amr284066991cf.26.1778608109799;
        Tue, 12 May 2026 10:48:29 -0700 (PDT)
X-Received: by 2002:a05:622a:17c5:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-5148e894a4amr284066611cf.26.1778608109246;
        Tue, 12 May 2026 10:48:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm34666791fa.24.2026.05.12.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:48:28 -0700 (PDT)
Date: Tue, 12 May 2026 20:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v6 5/6] media: qcom: iris: Add flip support for encoder
Message-ID: <qc4kxovb27ymjsk5mbim4g3vgg6y3q4vi45tpcnfjd4gnbvser@mwadgrokcomw>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-5-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-5-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX5l2Me43awtFy
 J6qAlNTUsbWiUH+siw2gJYPZdS8E5H5u7S5eVyjMt+pwAKE/uxqIGAsu/u8KOiCCpXadSzneaXj
 MmisJkR6eiPBQDElZSJ366IRXjFuTYwXcQQMhgVqxub4gC1OjkaQKG8YCPYuKVvesUv8U/6DcAd
 HyQZZrobVQrdPXEFqS4qwfMdUfiO1mXhHFnmvpbnxWALW3Ag7yV5UFta+b0KeeMqREvyJfxpqyh
 g/VyVWiZiP+uRJT8R1Jq3WIND/wYWyTJpKpM+b/01H6XuPzy1Rj/IhOOPFuKndJpYwNUU0X9M3E
 lANRMM/fyZZ5IdWIfqUF/8jQQ1og6nn+kiaCyXKBkBWDsfb7qfwIVuJePqx1sIrJzxVOp/ohFj0
 uiP56PoDeNNjGPlNn4inyc6HcK1UOJNx2ttfj2v96FTIEl1jTfEkmFUf9fgxsP5kFMc8ATMeAiL
 im9X/486yj1pE6TID4A==
X-Authority-Analysis: v=2.4 cv=GZ8nWwXL c=1 sm=1 tr=0 ts=6a0367ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=m-et6-tnyGGeQiwqTYsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CP2o59zvdtPLjwJ0-5Nv6RtoHP6LycLY
X-Proofpoint-ORIG-GUID: CP2o59zvdtPLjwJ0-5Nv6RtoHP6LycLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120185
X-Rspamd-Queue-Id: 5B4C85264FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107154-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:09:02AM +0800, Wangao Wang wrote:
> Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 27 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  8 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++++++++++++++++++
>  5 files changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

