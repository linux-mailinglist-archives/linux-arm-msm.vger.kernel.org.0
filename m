Return-Path: <linux-arm-msm+bounces-86490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 767ADCDB836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE800306C2B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23E32826B;
	Wed, 24 Dec 2025 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrDFoehr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JipPlQyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA92C0F8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557845; cv=none; b=tVXpTG41kvXJGDPCijv7MQYu3w2U93RlBLAkFGRc9SMUZGy9IXolZaYV9eGjgBeuCeG8HTowftyV4xItWy4meAmiUt4xee7NAf6kgBraRhO+/Ut8X+eTaTTkzCFKngT425m1rz7AZyFBvVvbNoNpSzIsahcunN3bGvbt9ZJkrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557845; c=relaxed/simple;
	bh=eaaCpyMI5gJRIY0y8iNjNydTK5JRo+vQyoZhOeho9zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7nUosJMqeynUCMNfe+qHZeJiko9VYGEepPYYDpUqwNSKsP/k03XrC20dx0SeCUgPc2de7Np/5vmA+pBnHCx7ki0GrXNjuSUE2b8bRgUc0yeKywrnkU9kuvValYZeB8A75dt3Qj1XD7WCByTv1atAHGQrl8LwJFb/8we+IQpisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrDFoehr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JipPlQyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLwe83700449
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
	/Sb7eB2QeGBD5SBBMi4=; b=XrDFoehrzciAgNzkDzThZtCrvgFQ/QAl79gnSPO2
	D5uKOt92DLBoGZ2Xt+Ttz1rUtFzEZYJy0xwTYSjvyXuw2LD4BNkj2w45mWzqVX6q
	JbftIL3H2Cjw8VWn9g8jod0eLhc4luczrqjH355srPEhLeZ3Hpl4kRrUBgo/kxjp
	EgBx6JD5BLO4MehVoRoBOGac9La2/273gDxnpDjP8n1ST7cVw36/0BZt4ERP87s1
	ITE+0KSBk+ApXq8VJqXkSP3RBgWRBgfll+bi1IZCsxL6afaZaXTtDlBfUqTU6Bvs
	VB975/nV2WuXfsDS4lpMBZPg40Np4ggN2pxm8KjizhS9tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jtuq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:30:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so154016721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557842; x=1767162642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
        b=JipPlQyZK9kEd2jJdOwXrQWco3drCyLrSel+t4CPfk94c0z4sBFVALI+FrBZmNE12d
         H6XNlSkNfvOOEFUJR8K/K3NZOyCffWFb4yqcxNeC8UAxWPOMwIYdbi0YxtSOnGz51n24
         7doAinTN2AGkSbNiLmh1JJJ2GsYhPo8xKD8hxrjEN7ng/A6JcyA7Yew8fH7Eo1H96CdO
         4W2vzpTpV357V2Bi/Th38hf4mPyXml8r+oQAB2n8v+AdUuUcVDAumm5WaWwcajfpKG1B
         xChphqj3130/f/hR8/c2WSch7+97jL3XMpZqdn5k5Ov/KkZLkZUbS4SM1CMjOO5RbJ88
         7ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557842; x=1767162642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
        b=mhZu8rDM8OLg4KCv/4h8vIG5DES9bZ7j6/9ddm3zjNr14DyHGqd4sNZzTw3bYlc+Fe
         XieoXuT37PzhhuedlKHmBtnhaM42f0swIJRIV1geBw+/AdFPPcpy47avLTlp1wEXvbNI
         qzIHM5KSrYMAFYUwWtiOSYQaZjusIJEuyhsWmaAO996QQnezsQwcr8k9Jf1Q0098YQBk
         yy2pVsIVO1KOkmHtqZh938X3PchZ0ZjoREhKNV2vB73eMJusRGUGdpXsOS7w1lyouiNu
         86wC4iWdsEaqzdk8KT4UB7c1xEVBc/6oUvtd59f53LGJABu1S4ekFh6cJ83XIimRTjsO
         AfiA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9+KEq58Ue0vnHa4+uUXDLNXpr1E75a4s4adX2K4My/kLiYNHczZkSO0+5cjNlbrf5G4L27bRR8Elmc0Z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkj6jqTKGBTxBkE8MKkKtZwh18Y+RYcd35GY42cXLxlnvpmp6J
	DzRYi8Cb7BCT6BLU6qBVXetXNKHMMBeL55U0x+rn1BGuTWKmWqqA8fOmrqVKdpy52jENFpQjzha
	7fEGPJWAxNz3ht4ArYCuWvhpUVYfAF4nA5CHpn2VLxZLpdl4sSMuieEe8dXfijyWhHrTM
X-Gm-Gg: AY/fxX6uRKlCZE8lHv3/Gx0CbnoCDSBIpVhQvhY3mcFHbMg851Dq7KCX4zzZSuV99tA
	QeAEIoXRTUBIDz+zEO+BQ/sICkVrT+OEgTjm+D+gpcM+MiCHtOIREJdh2ceUqxy+s7ZxoQCNXxb
	rHtFVuykw9ADbziuLqGz4QFqBOYWDyWlEqzqzyeCMRzMkQ8fgn0u2RFhRLnyJ3UEmoIvytiTUUX
	ZT/HcNd4kuifKAJZGU8BKzTRldblqYWYq7NYYQCF5+TPOM8r8mvqg2pxGYXBzvdADo5fWJNFO2n
	ehD1+puKRSblQCdn/tawHHNE1n/1oh6Yqy9RRz6TpJRNYq/yWXFsC7UGmadiRdIhJZrnwNl9dEA
	GmZa0QvsYZvhXaGMwNWnTGdoBWO4ieV+hk8aHLp2R6YC2z7DxFkM3X2RFZsE9T6hxrE49lH4pvz
	dsh7CaH959OKUp3V9WoI673dc=
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr271860061cf.63.1766557842513;
        Tue, 23 Dec 2025 22:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs8OTLRrX7w+WgO9mKTBEV/5O6XcUqQZtImlGkrnAnKULcRdKtjdo/2z5FmNuRMxsq5DzMQg==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr271859751cf.63.1766557842139;
        Tue, 23 Dec 2025 22:30:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd7c8sm4580330e87.26.2025.12.23.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:30:41 -0800 (PST)
Date: Wed, 24 Dec 2025 08:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <bphspkokcyfzd4v3sqdkq2xwyfahoi45zxcdhugewuxzaymgsl@wkpbbbdcm4x7>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NCBTYWx0ZWRfXxy8OtiAmx0Ya
 esog9bIzKYhY3Kz7NcqkS8lBAd/XES1yXwwSmriRX4MpZW43X0RCKZB8IbegtlanlgZt5bwu9sP
 N7OFBqDDD5o36rCcSRyT23k9goOpDcXoMC00IJFRQsitpCqPidpgfmKW/m/Vur2w+8Nm2ntF3Ma
 Ve4h6CPikvVkxdBgClfrHMNZ7bi/o8zs3VgGdA/iZe2v0StH/LWNYZ31T3HHo2sc5m+1zqWtN4c
 HVCUv4aXJe8yNOFnp9XLPEAUNrR2zdbVwfOUiZR2/IziJxhrUKx7tZslPz14N9s1SPschNU7+lz
 Xq0y0kyAGj7V95EsLKpX6lN2qo2QF5oyt/D0aH+aoS6tHJ51JCoNYzd3zBYvBOn9CH1QWRHeBvK
 66qQ19nyAcjz7ZcBwVBK6zwYEgVr9JwmpBVBjRf+wtILwFV28ZGZxnwbOfrC9iZZ74lif+pIjeY
 pUYJ+vyj1VJ/1Pw+sDA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b8893 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-GUID: Z6Vv7OuV0nxgoNdK7hMGuwsezRfcjHSp
X-Proofpoint-ORIG-GUID: Z6Vv7OuV0nxgoNdK7hMGuwsezRfcjHSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240054

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

