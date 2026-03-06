Return-Path: <linux-arm-msm+bounces-95923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G62HBxTq2n3cAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:20:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43B22849D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C3993006B79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 22:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CB234F27D;
	Fri,  6 Mar 2026 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrQL+KnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8OWCSSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0934F486
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772835609; cv=pass; b=XQVTLnibrVpfFQSvecGywQzIgKUZzmeHkjjNmfJ1LuzFUaT6ZDuxPSV/TGzs1nKZKPS2RACIGf+KkJdjLza8CnTFspXTEgcWdo0jX49E02kKz2lIzR8B86v7wE1t/Fv/O0+jm08qAOtdE9wkiOQUCBREga/gqC9IquouvT7LK24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772835609; c=relaxed/simple;
	bh=k4yyQSgZOwHRTDR5PiH+YAXfxNtxPmLaJ52mF2Wg4do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyc4+BBehJha4PnPE+6L3wR5mt5f2lmhfgewKJ43B9a7mQt0CIZBFBT8bJlqPg/c40fmMItWweTSltD4XboK8+r1lZ3xn8DqG4H9e6aOgz+Ma3Ir1cXkrmtAVhGra9mBrmwIvkcJlP8u1+MvXfvwwFceC1X82V+Iev0RVjTLYFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrQL+KnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8OWCSSx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWWKp2623887
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 22:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=k0v7F9tG9GQhyYi+5dM9Rs8gch3gN+kv0wGFb2O4AP0=; b=Yr
	QL+KnCyhYERsCSLSG8Z751DhYzHwXtVjcqP6xF2kT0BpGTInSsUC9O7Mpka1h/rL
	/cS+nySalersURXWRJVHlmPx30kOIH6TPs+1Dbo8V2+t98I+nGZ8wlhd8D/jEF7w
	sC6gMxfNITJuInmJeEAxHQy4IgqNDhXoWPSXJHbhXUSD8PtB3+lNzwYnPazwRKQS
	Mmn11UuIvNYV4eYhtwsW7Z8oRxjx25Iaxa7JdkjqTLxpniDGzO+uIPnK1T2SYp3J
	4IFiJ41xyfvvkBaR8EX5kuonf6c7QugwL+Em3wpbB5SKHt1w8BAiX7mJQrNhwcW1
	XCw0SK0rLmWyVnAsmyzA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ajda7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:20:07 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4c27c728eso89202940a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772835607; cv=none;
        d=google.com; s=arc-20240605;
        b=gY7v3m4P2ouunieM/68+3jYDrjnwQtl4l7G1tHfqxgasFqUKPUmGLd8qU8eFLRqWPt
         Pjg8iOqMQP473Y+xv65gskMcbzjxrvXS4M0D8RKMCCSC8nDT2CxaUHYe2Vd/oGS2w2dy
         WkqzKZo+kRNJpy7a/EX2Ck+zGPj0Ot5airZIDEXyakH6rUaUznsDrFjlTYgZb8D3CgsI
         1n6L/N4DP6apDzTCjRh/8Kc9GoaVfj0zjwSNg95wSzTKrWT6847Dm2z45/v+KRu58wDO
         VxMePnZ6t/9C2Hublmugi3C7imkfE+a/51z6tQvdyHw3+yiGgR8DMoHhOLCZaSzRSwvx
         ZL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=k0v7F9tG9GQhyYi+5dM9Rs8gch3gN+kv0wGFb2O4AP0=;
        fh=9TfQGcDoNfIzUdV7GvJceaAhEfjAZqqfbDG9UdTn/do=;
        b=XoGq2WySR2miFEkJxIZIhfTlog7B2VX+ZPO/ItgrrmBpQCvUBzixIa+u13K+tOfIzY
         Y+D3zfwoHynKjvyfNrKh8szaPjnfM2jI8EShef5IzilaZRLuFDp1OwDZNTyUFmDH+0gi
         P21V/0OGFqm1WUr+KdndRLFv4Ypdf85WH032EzGaemP8HFY2oi9Bk2cAGKvsIDsUmUD+
         IlFuX6S20yDmlFsLzophzfTT8Dhs/5U0kvGHVNLPYH+/2I037LjGIIpigesI/HghqG7X
         8oZczPCk8yvZ985nZa9o6eZDZJjeZvVHvMxlqjAGDjY+x7G+UjdU0DrO4FPTlfv60mB8
         nN3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772835607; x=1773440407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k0v7F9tG9GQhyYi+5dM9Rs8gch3gN+kv0wGFb2O4AP0=;
        b=g8OWCSSxGu0X0u8QpJey10HjOqGPSRmZs0ZRXgsjkyHge66it6fqTMzYSwexp/KNa4
         wpPofcQjPchfcJ6sTMrdhYVNWJMh28p7jqa3L8BmCRhs3ULihBWI+P8qAthnXEUwMhhL
         7nQAxX/czQBo67KjUrlzXpLxRlqLjszdX7uAEPdsu1ImPkAHgjGcQqgZONFo5m2ddnsY
         DszMRRIdxFRv2kZGEC1mzNz8UsZpeW0hpQ9PEv/woJzXQfChxpasrpl3MM/8pEkVwgBi
         QE8uG38hKeyWiuGrv3sreXhHMcoo1ATywbH2qjWJvYKQMZ7zHtTgaEJ6YaWpVxm1Woev
         6Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835607; x=1773440407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0v7F9tG9GQhyYi+5dM9Rs8gch3gN+kv0wGFb2O4AP0=;
        b=sMRRpx+oivpPlb+ccX11V3k461JtqkP2tM2S0MA4vBCzvc12RLyiYh3AuWyuHngdv6
         7zbJAE7rJYo/sy+QDlxQLIcHrFybQqCT3cyR8mdkbvPDxmK55CqMMbvOk1sOzjbkiotL
         ay5WfPKlHHdbCkMUFuLrEt/iboO934jFeC6iVQHqfvpDiAb8W/k2v/0lc7iTXAwBgaSB
         smHFJdChiXhbg5SMEoPNa3A0oeJ4M6eI5SybODrGy7LnYwn96M+KioAdqiuazYoM2yys
         9mtAxdHuCw3l0zICJhvRKbKuPGrnnr5Yy0P16Mby1A2RdNYdmsqHvcjnE237Aq5AsMHZ
         SgCg==
X-Forwarded-Encrypted: i=1; AJvYcCUxNaqbOLoDcwwymjw9RWc+76PXA2yaVBYdrqyyldabl5ZX23lI9yAfufZf/VTeRDY1bBxIwfSf3w3fPd2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6tTVSSy/Oal0sHIcOmYS/IFnX/thgL33CwURKw3iqyCCgMqZ
	ZZpC3BmkhxRqI1bcY4t7YZFPW/M8fvHzPcYmgwgjhiG5c/RSooIHqOsQYy8pLAwChXbP6LFS5CL
	mSSyhR1Q6Q7mTPQYaZCzD2VznD5OtN5Nd2az3XE8umpJzY60xNuWCI6ah/StKMBAPsJtYz54bwK
	FFU8gvGms4Fv15I11czXI/xLMVpIEZUn1PXNbQR5ZEK1k=
X-Gm-Gg: ATEYQzzzHGB20OO2Z3R1iqlIOt4ZgG8B0Q8hE7X8HLMmyASWzWCyZQfW3poFDApidbe
	JGEGnqh6MyaxcP9EKg/bDUJDwd+dyxIepP6y60ev8g3piTPz4gi1EQbYWec7RYpFeD1pjABJf5X
	z0uk8Y+xfCZpcHd+clAPulg2dBE9RzFur8AqHUJfG1OzmEe5xJJEbov0oT1py+/pUG8WBseJzDO
	4T1Sax3ZHpzm00ltb84hg7SkWrrXNfnCMDRXw==
X-Received: by 2002:a05:6820:4888:b0:67a:48f1:e3e6 with SMTP id 006d021491bc7-67b9c42385fmr1573897eaf.31.1772835606682;
        Fri, 06 Mar 2026 14:20:06 -0800 (PST)
X-Received: by 2002:a05:6820:4888:b0:67a:48f1:e3e6 with SMTP id
 006d021491bc7-67b9c42385fmr1573885eaf.31.1772835606282; Fri, 06 Mar 2026
 14:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
In-Reply-To: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:19:55 -0800
X-Gm-Features: AaiRm53Z0WUO-nb7JeIAgwaqRojIUerkz9uC7OS4Xek0E9mdcS1b19qyG6JXR1o
Message-ID: <CACSVV00BZzFnLAD=y6=qFUHG3KmRXwefdeH-7zSeg=jMNW2-bQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bLk_Uj5U9bVe8sO2x0aiOjz595c4wq0z
X-Proofpoint-ORIG-GUID: bLk_Uj5U9bVe8sO2x0aiOjz595c4wq0z
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab5317 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IkhWcgckFE4J5cQLOdQA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxMSBTYWx0ZWRfX8JHCM01833IV
 /Wz1EUoPpPJ20XO9HDOBA3gYUBqY5pxJjPFDjCYyEHrr3WvQPi8bUildhkeDihOf6ZzXUSqpZKj
 pxNLboXyffto+EWjFsy/kRFRgpYn2tqhEZM1hcQ8yPtsVei2uK8inpC50JbHNotDAicZR9ZVOPx
 gHlmh2OFIp5Qi3LblRwBvQdY22kkoszahBAG9iJJxpbX9ODJt9Z9j/q0d2vTBcOIaHOdl+3lTqa
 vwy4UKWI3kaWXpe4PRhn4eKLH5uuJ9qvd+niVgzf3a1psSCxS+wBE6R9RwnJw9lt+tSOB1SUj6o
 bpQsMyx0HuHfLQpNWKLG9pPK8Ax2UU/BPqOiWgaLZ0dc6cMEJYRdQcoLeYR4Z+9oW9ioIJbDrK8
 p1RSGJ35608dW+cA2Hh/ynM0FAO1HNRQjtuJ4CAtXAbhHV9eK3NBU/QMP9BlhTY705CTkL6RuNu
 HVn1+zQMDoy4LzylTZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060211
X-Rspamd-Queue-Id: 1B43B22849D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95923-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
>
> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform"=
)
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix the syntax error...
> - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80=
e3fe0dcc7@oss.qualcomm.com
> ---
>  drivers/soc/qcom/ubwc_config.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index 1c25aaf55e52..8304463f238a 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data =
=3D {
>  static const struct qcom_ubwc_cfg_data glymur_data =3D {
>         .ubwc_enc_version =3D UBWC_5_0,
>         .ubwc_dec_version =3D UBWC_5_0,
> -       .ubwc_swizzle =3D UBWC_SWIZZLE_ENABLE_LVL2 |
> -                       UBWC_SWIZZLE_ENABLE_LVL3,
> +       .ubwc_swizzle =3D 0,
>         .ubwc_bank_spread =3D true,
>         /* TODO: highest_bank_bit =3D 15 for LP_DDR4 */
>         .highest_bank_bit =3D 16,

dEQP-VK.image.host_image_copy.* is happy with this plus Akhil's patch
(drm/msm/a8xx: Fix ubwc config related to swizzling) in msm-fixes

Acked-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260228-fix-glymur-ubwc-f673d5ca0581
>
> Best regards,
> --
> With best wishes
> Dmitry
>

