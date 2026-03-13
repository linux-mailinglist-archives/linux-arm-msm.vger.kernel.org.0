Return-Path: <linux-arm-msm+bounces-97532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIrqIf0ftGnahgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:32:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8628508C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D57731BD10A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C6130EF7F;
	Fri, 13 Mar 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcWSI0h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy7vhkwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465019006B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412007; cv=none; b=mHoVKCIyB51oIF3fXviua0Xn0xn6iAffoBiyuJth4SVRKRTckxdm0Auhi2uicgAe3TGdEXccYwZYT0OkXbqXa8ny0z6wkUpZni4kV2ZkM3py+Bnqm83CpE/VTQq0cCr2sHIeybP+bRlqVh/QQhM+5pm/ioQfzzCmmgiezwQh4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412007; c=relaxed/simple;
	bh=b6L55q+simwqKUBuVT4YuZKWpCXeMFFp70IonpvxZUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3UMeZgepo4X3TRte2+YKjGjUrzayz8G5v6Eu5PkXIAGp+Ad30mqqONj9ouUwMPVWZzdVGR6a2mHK2ZYziF49bfzTwhD3lHyrN7yD3pxHI9E+qVRXJOLN8gmDtrEy/AB4a8INHIGdWuswOV2vmITCDK6ZgIu3Kdb/N2yUMHTOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcWSI0h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy7vhkwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDX4t7792852
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UrKQhgpAedlMnHwgHifVtQ34
	FWYLdmDi753Ssg/d0SE=; b=mcWSI0h5FfX6Ja2d2EHxMhok+LBJr0zCglH0omCw
	Zx2YlhXSPI9GoW6P3A5pEOmIpruxiI6H2UIcFJ9TZ8QC8WFMOHLwMwc2QQuRjDAk
	bkiOmOaSEfaH7K2wI76AyORfszEwgslCFEDiL6ykZo3hq7DA8fOIwK06PRASNarJ
	Qnc7M58ICSjogKoHQ2zEw6cxr0FmqiWcUkG+AUycj9N5shshppyXsBBihzQ1AWSf
	Cid9lQ36qBOiGgAvIYYWQyN++3HE9IgtgSIRibmPReBZjrAchWZm5QdSSS1CICO6
	wlmJ0WYIVJt1K90LP6BEslNC89z9j6pIVQUQrLlFEWKHaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1ks6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:26:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7774be64so1272662985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773412005; x=1774016805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrKQhgpAedlMnHwgHifVtQ34FWYLdmDi753Ssg/d0SE=;
        b=dy7vhkwDPA+PjOWJmM4J+ffbmxRVf5Hu4GO/PhUdJKDjg+oN8maMN3iXQxxneHSIvE
         nTViS1oyuiIXEplXw9iNjDsA2caj2jnIPE5v6Jpgsq8w3HFiIcbPue/z9Bkki/hNJj/z
         YNJkRzXAGUnUsTPJRPsILwRyCcC6Uw/WSkrPqIIBx3qpixueVV3jlRvWSau7rNAsP9Lh
         sSa7J9ogvcqpZ6C4TLXbNMpzApIYLpQKDaBkFdllCgtzjCEJiXaqdNg9k7Bq36y8XM/7
         OWQpYjgeqGgMJ1yqjTofYKrC2jDH9tyd8v8SkICRI/Q9d10V7xoowL8qZvTXUA6s2Zlp
         CUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412005; x=1774016805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrKQhgpAedlMnHwgHifVtQ34FWYLdmDi753Ssg/d0SE=;
        b=b4T8tXeK/7C7u2ZUWJp02G6rdZLbQE0v6iDkZ+4haNwjcsDxZvUXBxDHVQ2mKQDS+0
         pAdImjLutFDKKcFdc9AtZr0/C0GmDGlmzF9UD9YeUQi7apWJ6NKoMr5okDB+WGnPgKZg
         Lt9/Y6v2HdBALRNHagPxc8r4BDR5joWuZ6uxm0DL8isb/enZFMAfJ3deoUX3SNrEIFMe
         NxLreLUYpk8Cjq7cB0eI4wJKOzAfiRNtVleK6XZbXihVc2mCd2PesXojQE5F0T2Nd+ZC
         qXNu6QlWaFrjGYGYOp2adYY+MpMD+F4DffnQvGU13fEk/U/SSsing/vrjkc4Pv32u2Aq
         D8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxuyS8nHCL3t/qi0qYJqs9T8Lz2fVL1GtQaQHRzYc7Z73u6uBQpiySKxd+ZB2HwRm9akD2xImxUOW/Baz/@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcmcDfE721titqZyz8Ao5dsbgvSgb7LlgrJsZf/dTXplZVpbt
	m7IUYFw7W4WPAoieGm2XTb0ns7B1ypUTiKG9IBeKcVL0DWDlsmdgM+K6E6wplFCAzcfmHOjv8Bq
	EaCJiufJMUbEXj+PJhZBugPUfOr88lEPUJmKb7CZq2tN9le383E8+uH+dXqMThUWyz3fJ
X-Gm-Gg: ATEYQzzU7F8kbcNNI63s7MhEgxvIrQ3MEl+F6jj8ehtkFHX2CzEy8lAWFCGGeqoHzTz
	RrdED1DI1CA/ogWAITXbaqCj2z/IPQj40MTT7qUcIYJkwxBTbC294XLZfT65nUf2dm5a3qs+t0d
	FGfU/gmoyKdi28SRtI0Y9m5YIjzlSW+PrhHczBRHsREpiApUBOCB6p0Mggti0VIMT+885zcWmSU
	2hihuTRNNl06+k+rTDHJuvjyrcSJ93/dK3FVph1Fa4cngb5xsRj/+ei9NyfHc7yNKSk2svj51AY
	fKsEHKldbf3jxNdfBNqK5gf74zHS21jzgavUGF3/ba5F4dJNQR4T9DU0q/w+6X7p5TqvjReahho
	JRHptE68Y/cHUgyGQTdjyT08IUtjVt+qFIr/7yj2VpmIbU0qW/1izeGU5ZzTfIJyaunoouCMVri
	6N/go/bZoTK1l/C1Aw0p1CY/KQv5SHICDlsjQ=
X-Received: by 2002:a05:620a:2954:b0:8ca:7b14:16d2 with SMTP id af79cd13be357-8cdb5b25e8dmr454963885a.50.1773412005071;
        Fri, 13 Mar 2026 07:26:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:8ca:7b14:16d2 with SMTP id af79cd13be357-8cdb5b25e8dmr454958885a.50.1773412004447;
        Fri, 13 Mar 2026 07:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a96565ecbsm1001551fa.41.2026.03.13.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:26:43 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:26:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
Message-ID: <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
 <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b41ea6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ffw7P2BtgO-SoTFsxwAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9tZogrTKTQRY731DdwU5scTicvah_jff
X-Proofpoint-ORIG-GUID: 9tZogrTKTQRY731DdwU5scTicvah_jff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNCBTYWx0ZWRfX48Tq8rsoxR8A
 r3nHjFxj5AVIQTaIdMIE14zs6vPdDXW6Wg2uVNmYy5GmnpDIVaEObeoK9lRoamZ77dGb72D4B4d
 I/uZ5BMtvrNWNkmr8PwuKW2dyvp0QpudAKyopFDwxnGNgkOGGTO8J+R5Wa/JQ2DXPzXttAB6WdG
 wlTk/65/oKXWB+sKtA6VuDJNob5tf0Xp554MzgytOlQjhXKiLyyT1LGclyQv/ZZKncrqkwoph3i
 jt9CFBcjHAd2vSvbmkp9r4DF9QSznc9kbS+eBKZhCuLeCNGIxD7cvBg0zMTEzRLDB8H9SrlvVZ9
 m6WJP2qR0FsMfacnw9VTnNG5aYsNLjIjLoZUhhPutXDu4KNemk76wUQm2VydYxGgTdkWQekOBXH
 9uO1boc0+gxp2gI5wiGSb2GojfJoMlNLPt/ZIMbkK39NEiarf04+fJ9akNLqkqXFX+yR5Y5Rt0j
 HS6mjik6K5gMpDDyzDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97532-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03D8628508C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:19:59AM +0100, Konrad Dybcio wrote:
> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> > Use freshly defined helper instead of checking the UBWC version
> > directly.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index ca59bcdde7b2..04efc29f38cd 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
> >  	if (qcom_ubwc_macrotile_mode(data))
> >  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> >  
> > -	if (data->ubwc_enc_version == UBWC_3_0)
> > +	if (qcom_ubwc_enable_amsbc(data))
> >  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
> 
> I know it's already there, but fwiw downstream doesn't seem to be
> concerned with toggling AMSBC in MDSS (perhaps incorrectly?)

Downstream enables it only for the cases where encoder and decoder
use exactly UBWC 3.0. This is not completely correct as the bit doesn't
exist for MDSS 6.x+. For 5.x this is equivalent to the code from the
patch: enable AMSBC if targeting UBWC >= 3.0 (because MDSS 5.x don't
support UBWC 4.0 or higher).

> 
> Konrad

-- 
With best wishes
Dmitry

