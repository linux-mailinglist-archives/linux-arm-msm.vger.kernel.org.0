Return-Path: <linux-arm-msm+bounces-99964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAoBFghlxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:43:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F632D279
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F13A302A529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1219388E63;
	Wed, 25 Mar 2026 22:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01125Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMYiB+qQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CE37F731
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478497; cv=none; b=XtppN94dRkXA5FyjJfMnV9fzngDVk8qzFxBx/3C8I6d4HvsSPP8k5FEK3P9X8iH0Ca5J1uOnBmmABWdgVQmXlEnLVw2rkM3MP6nees1ieaeNhiDF+qstrPl+KoTfJf49d4SqJDp2hd0wfrZkaC83rFmZdpI9d6I4xCD0iNrxVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478497; c=relaxed/simple;
	bh=reMknFJoiqNp4mtflM/9KnhX9fgjE3GRwZFkcGD+Fb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQIlTdhMDvOFI02MaXK//KFUoQ7/bdn3bmvns7aEUKaK9m9r/XJhUz8YLSJ6p6+jxp+XIIFvdO/m2E/nvXKKVeob4TrvQzMiuo2YK7VIF+Bur9crp8T/r/4yqp0/9T0DhNStFgcvmLdD+o1z87vhc8it19QXFqpuWjMFdd9FgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01125Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMYiB+qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH92C2737626
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MskXGsEUY9X26Q4Lhi8JX7q2
	GLBZq1hRtzx+iwBExXA=; b=n01125ZbN+KnMlSr+OetFhmadiRmMt0bJWr64P00
	89KrmUqKceQyI3RUVdKojgF+ZgDVUui7OcFniBTrtD+Iz24GdHc7doAns7E9CiTk
	nt/KhkxExEhNozicRlFIC0CrkSuqG8Gsu7vWOUNpLejYRkOOmTQrdLwkDjN9igap
	iJK37cBClmOt7kgs6JvhImYfbIWAulo3li7Ybuh/sIlHxHs4gyz6n5zgGuu1kVTn
	hLC9y5iz2PoEWn5HEijPeBZTfS6P2YtgW2wAjE1zvAFpQAo+/++1MHyWBeDAvDP8
	+igEx5FTlJV9i26rCyMGYf8/R4y9/FH9XL6UIe5uJjmAfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859bvjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50937cf66b5so19016511cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478494; x=1775083294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=IMYiB+qQ57eoKocLtiELbbp4jGW/ZGRka0bjB2CRoh093YghlQKq2cWOgmtlhLQE9Y
         kdmREAF3W+iigqOvD+RzUc87L6GIJ0W8IWSN6YyOz+yCm3qJVyEBDMpCpMorqG45kIrx
         pUYcZq/w5EIO3dmlXipZwBJOFG0OC8DAW87EEB3pZ52CA1kwmsxQl6D+VkaXyRpDBw/9
         b82EJEtvBlQ3Pom64I/my7z/UCvSN5vC/RHlZi2Nw8Kiyi82D1yvT88yA9GgfKSo8FXw
         S5HE+TvQ1Qgd6SQ/Es90ncOGcLPwUDdPw5e65uMLEeovMHs2K6PmuVD9xF3VLXOxxhJN
         ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478494; x=1775083294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=XLJgjmV+E5XbATkh7bbFrUmEWNJo2g2X/MYqDXTTUIYPbCIXbGyRw8kFwecBQ02ES5
         Hd9p41lhI5OkxEX7+GCWgpXA2rNJpHLZ5tEVJE2iAH6Zjxscn1MazCPHJI2zFETHzIpK
         LUPbSwL7gs7wPvu3jwyk6OpCdBLel5PiUAk9kIdEiCHn+itul1zbhr5bAtGoDcS7sqfd
         gRhV8Yfc2vNbyg0CWUYkE9treRpuAPpD3Ieb5zzWvZmIeStlXMShH2Qg1fQJPPeVTve+
         YiKSaQFd/g1e9+VTN2n0PXojHoV0x9voy1Tp0mEHsRpQlXVnBShU2gd5+X6Hjh8C52Q2
         vcNw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/6fVqMDLK5SKAGt3scJBB/F6gfohng9UG2L8wvGkeEqX9BIFhxL3uvLc5gwIX6ESHdeLOjVk51ezpYew@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0aNTKkOlZqey4OMN5gdpNF0VSyh4NcXkMklihjA8GK+qycrH
	URa2lTvPZZgh+NBpol2MWEfITw+zpW+qJu71B8iq5mAg7G2L6iV+6yDRnvYoV+3M6GZshvpiLIu
	MeizRv+iUsff1Cq4OCLNl0Q6bd8SFYqwxdPZN4zNuGEuDnIwD2oF0kwErNg8H1bh/ZdIy
X-Gm-Gg: ATEYQzz8ud6didDdM2EjGeIuBHo5FIc00nYSB28U7Ff8jJkuwzUgiLajx4Nz6eWwY8K
	KMI0g89phvsJB7jPlkNpqq34DD8B/RcdukJhbOQga77x+AsW9d70L9wsV6VSIXFvgyVdfsIaFHx
	7VV0G4E9bgQDSstGZ5CdC+glrDDaQ4Xe/q0WQ1tE9guNcOLHHz7Be+zyMycO37BwwOIeWpBpW1U
	LfRGYwDQVkSoG7G2gtfppQQ1gakUzI43AkKw/lZUwlY1gQEr0CRxO/vpLRmSne/vupVumLB8saZ
	tvPKaiKLvPZx55uhOK8DkgKpn5Gcr0KkOCLmdhSya13I/RoKLPXTs/5WI5H+tXagwengmk7FclS
	8SN304s5cpz1jo8B8+IZSWIQ7oFaNPVNQKD/DaLXFtxNiqtpHDDTVOhQNPDm+YMGIjL+YTVCeMD
	T6JaUwmXRI4UVXn6yiRLtfaXTqvRfVGGk5/LE=
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553921cf.16.1774478494526;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553741cf.16.1774478494141;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064534dsm171727e87.18.2026.03.25.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:41:31 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:41:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Message-ID: <yfm36fgq3muz6cw2bizgg3h7bejq2tj7sxjeorhoi7tafbnnjl@qeipinzvbpkv>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfXxGKMN1YF/KS6
 Xx7rPok1n+GERjBrQ6Bj25c4lbdIyzP0V/wM77efVobMMT342fslQQAHC8LlsVjITlKTksBzzPF
 CLpN7GajkUazgo35PDnZ4298vwfkUCPVTXUAarN/jFK7/a6thQG7+NJB2JtPb2eYeifG9vFvOzx
 RCQnnkQ+ANxCrSFoitrjuAdoM4XLdyXTWeSxrIsJuO6Cko21vLpl/dKOgfWgsylVFB5TGVWKsjY
 U8T3rkVjBL0gTtcN9rv3NP33KODqBE9fsV+77lqD0SFjyWCl2siCu0rwXkyF6FmDAshm3azfLhK
 PIIOwpwPO9qoV07ECnEJyFgJEmbcUf/Us0X0lj8MsRrbIitXTJPV3cMi8JlgFyU6lnOlBX4FV4z
 9GlkEpSrKcd/9dDGraBk4fPuVXJRYjvXi95jDqMXcY523m5Cc0IvN9y7TcyTwMNx4+o4kO9xnRD
 77T4gQuhL5TWXT087Kg==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c4649f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=3mFuQuvshfmmPt20Ni8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zRF_B9FQ7Ia7xAKHtwrNQUU-PgP1HEnl
X-Proofpoint-ORIG-GUID: zRF_B9FQ7Ia7xAKHtwrNQUU-PgP1HEnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99964-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B05F632D279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:29PM +0000, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

Missing Fixes, cc:stable. Also please pull to the first place in the
series.

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 75 deletions(-)
> 

-- 
With best wishes
Dmitry

