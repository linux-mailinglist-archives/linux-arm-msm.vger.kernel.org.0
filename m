Return-Path: <linux-arm-msm+bounces-114807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TGC8Dt2lQWoJtAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 319736D530A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pvl7WW3d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=La1KSvc+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114807-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114807-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F2483002912
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 22:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E58372691;
	Sun, 28 Jun 2026 22:53:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763513644BE
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687189; cv=none; b=dI6LqXeNmp/6jCvec4gjLXbYECZIFq2q5EHVCwYDVwc9ygKnRcvH15PtzfUS4gCGJ5VIeH5Zys2B3HeH/cplrXSjyEEsLC+NpA/JXYEKkIIt6bz52VB/d3uYyfBMujPgC03dESmTU1dqTnWiTcgUUOWgB7Et1LJgZLB2MbpE5yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687189; c=relaxed/simple;
	bh=HNBGEhE75qHKo9m4HubnNX79t3k9BMJ4QWwlRdp5z7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoLTOu3fTjtFgbr81tT3Uu6+LsCNNDpFG3uVBVXLrHsHb5e22aowcLTAw1fwU5DU1+peQ1gFQ+HNyARU+hHLrUNzPbN1QVTEVrrXgkNnBXsH3mu8mtlRT6lVxiX/hJM+o0S0xm6y6FErw+4dxYdH2AiMmgmMAvLmtjTmVCMGZ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvl7WW3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=La1KSvc+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9GHA998161
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08I0qAKNeZ3YtOQJRXgtfOdK
	vyOV10uVclmPREP6adU=; b=Pvl7WW3dnynCredS2uHbctPhs2ZIcn/foX1a5uxN
	zcZHYX+eSKnoreYOzg6p2aFMO0S//CDSm32s8rFWce47yEUHLRJlb+hAsq9D93Kf
	+iNcyG+eJSdIkCnoINhR4J17Es4oWxM8grbCLY9tfO552TGnref0Zd2lUub7vdYP
	/8GQAH3IMA0TKPyW7Ks700CYqm5t9Dz0haO6q8w1eNm1W+vZMCV5PdU9h/UR5NKZ
	ukWrE9kBz4x9OoEDpulG2AjHkNm6NLwPi3xYMphAvhBW56U6PyDj2EXAb+9lfZrY
	0LFQDrk7FlUHB1sMDphSHYUg3lP/0DveF6UR97jSvzug7Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuus1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f08f19552aso647806d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687187; x=1783291987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=La1KSvc+jFy7p2tDVYRH+FfsnwjuEjHSbaYFWuQnXFnn/BHkEVftzAUQ7LtKocrh7A
         Ofb45FP7N/9jSzrBuWbhF4xr8vWhchbOgNP+YhVYvqXjwtJ8FWOP2yu5HdegIPjd9fDZ
         6mm7IKtLhiC0cT2gegvDQmo2zoscWnVuIBUdn7nfAeNf8UhmZeNydRihSp5zdq0pa3iB
         7RNhgAGLNeqxxv2a3tXPwkX1Um5T+W/4nr1JwqzH9Ggw3gB7IQYvLDkhi4iaVs1oiv66
         YcjQlfEQcLFwdQRZENahW3ckBldQ8H/1ULzK+WxSRqQYQH2av0YF3NQwLfvXXoxro5Ey
         rP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687187; x=1783291987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=J/69fvAwSnDxa2VSS2ykhosjMCVv6e6gg8japQLUDAujeC6c3h5wc9Cm4hp3A/SmI/
         0LaQ/kRhpeS+EVIhQ0zgTkuoz9+lMSOy9j2CqPygj1m5y1n5Hk5wV9PldCLMUN/kJR6W
         IPr/ggdfNlEI2qW2bLb9mZFQLZ2lk8fcIKz3TYZJbcr/+uxLfCk8ifxVH9W/8Xtsjlg9
         5W5f9Kis2Siu20FneRSqZ0szZgvUnBxjaG6Rm+r1XQI5y7MDu3LFIiu4WEKWWn/L/y5p
         xx5DNd3+0lMeniNoM4YAKuL9Xou2EvWsKbQjr3z0Ye6uCVGUqGxF1cOlfs7z0JJ9ECkb
         QDRA==
X-Forwarded-Encrypted: i=1; AFNElJ8X0nhBvQ20EtaadyWotIeuzKmLbHuT1RFTdBSVPxxOyNqFgIHj72Oj+xY2UU+SCOPvZ7ZZGcivbgICVkjW@vger.kernel.org
X-Gm-Message-State: AOJu0YydhaSncm+gCT94SucxbecLUJ0Br2EdfnRiqjPQyFrJwtd8C7ml
	8hIYTpax737Ga+fhJDLWnXbBMCXnr5vHb1UddJ5o0nglhDBmWGH78z0YasnGryqYk1BUxeVF+GM
	DOs15DAgZw1vwbGHBWIoEeVzuM0g8njLVX8YMjtS0DSBGKRxSRgtllyg+tBqAPYvIsoGp
X-Gm-Gg: AfdE7clVYgMXy9ejIAY7j8SNY8ff46ek+QTp1ICeq/8tGDuGIbNGMc6Fnnsmgx+/O4I
	Pa0k3r6vRjEe1NTc0IzMmCh3Jvgr2lWM7PAJ+kyX3fbBRYN+zG1Tca/Ug0K71RjxtP3ggqosVLw
	TTqdQ7uaHgD2D9z+IAPHNtbA1enWtRROIwKWBJFHLdUwvK1dHkU4RsaqXyxZ78+KBnml+hXjNvu
	0bc9Ro1gJduTxhyUvMTfktXFxYwUMmABx8DBQHp4DGuTP/H/VW9PQcNkCdSt/poepjtqfJmQ0QQ
	D10KKR9fOUxXJOeTmZf39TFY6ny9Wnk7gltTFMh9F23NRQQUYS/jdjDhFHiv90Zg84AYjDIp4W4
	BwGBodeUtB4sRekOhK6kf7V8n1JS2FRpejKyEPmf5UULwwgiKpm1FcWG8EhOS46PdD6oNvznDgL
	38DlijpqQ7tVHj4LPWYW2Ni/Ar
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010754985a.32.1782687186693;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010751585a.32.1782687186041;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b18370fsm68823601fa.36.2026.06.28.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:03 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
Message-ID: <ga2yyuoob5jcseb5xeeumbnlvsxdhmnrioymbd2bgskpuy5min@miczr3mmgyay>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX0g8lM5AT0j3P
 LeWsFfqnBQPgDWxXRE3G8pGy1ap/KlX8EN4RX096Oz1TfS8eocR5h7ECLIGvkzGK0Be9AVd6QaO
 hylBxY/gHzlhToFvBIGYn+WsKNFqYQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfXyU4zedruMy3Y
 OLQKC47647pKR1fSYyJDfhl7Y3LhpQENs2xwG/nEsCP4wgstjoaYpmV7RccQ1tJk1zt+NEBKMOz
 23hMTK1eCKoY79naqd1fhVZ4ayH/07Mb+plaEYwBw+NfynrGsBlCyIzH/oCzTRBShVQDdK7J7hE
 /x99xoPkXQpdmwi/Toe0d+B9xy5QXtXR0k7toeZRVfbO1aGfoPAwMaBCMjwxzjtvpYL+eFpnS1n
 NrzrwKooSMoLv8L+BD/GyZzAMRCCSnCG/4yIDXbzKwJ78R3siZtzxJYq31oRNO5T2AyH4uhCT9d
 ty/cLLfTGrPoZq37B8vUWKQT9i/dyjMoOigqvbhtxZ/3/EhrDZFVQKVnJBxtpie/ldRrb2BiqZz
 d5IFicalOkEAHpw7Z3xJub2vS1Q6SEUe2WJAmOKjmTbRt4tT+AHTjSHsurLdVg/GxoxEErXU8mO
 ULhc2gv5nCiD26t6OBA==
X-Proofpoint-GUID: U673XI_PwdO4AxkFXsDyT4Vp-HcHzjAt
X-Proofpoint-ORIG-GUID: U673XI_PwdO4AxkFXsDyT4Vp-HcHzjAt
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a41a5d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,miczr3mmgyay:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 319736D530A

On Sun, Jun 28, 2026 at 11:53:59PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

