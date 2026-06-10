Return-Path: <linux-arm-msm+bounces-112461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id liJSHVtgKWrWVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF78669896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jE7mQZsb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MBRlKt0F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112461-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112461-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 524B6329FB9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E07B175A68;
	Wed, 10 Jun 2026 12:57:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5437DADD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096249; cv=none; b=bahP8602/gIuHuSsHsN8tLYfrSfOqekUR5fSPW/bUWFK3fo0HzXvSl1L4lmzQTyEjHNve0WzduQyCct/Xq0gGGU1rsoAFFK1IrSUGJQ3V3z7ndoh7sxoZCETya9EelTd7TOJd8WPX1ILBfaf2V+FwxRQwdHVqnl3bcNFJWEjYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096249; c=relaxed/simple;
	bh=QD3WnmuLmGukCoKcO04lglZG5Y1ZJY1GKUTjmFFLudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvSB/QhfYgpSFqAplzFkfpeiW7GDL6Ve9SaccuU9fu9ZzNPDA68YVsEeGWviWo2P2IUqZWISw64x22pryk6oaaEh3hRdbhPpdGq6GZgqOvVSzACMNTbd/ooc1+vfDZNYDZTlucM52Gj15DYMmHaxhYJ0zYIQ80QRuUmTWVZw1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE7mQZsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBRlKt0F; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCLZR1554772
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uOrsbaLMHqJWodEJznlZ6hZw
	bpwVVgA011Bf8C5Tqrc=; b=jE7mQZsbQzcbu8dgTrMBDso/VAZe9hU8xLajFkLE
	OPRJ21TbJhUpKrF8UcU4pHbsB6OW+ugaSHUMYMDqbUyOzRdR/Zimd+LI/sWOSgbr
	3Ngm5RJ8x3m9b2XtmBneIsocS4ZgSGOwWU07hkch7AlYQW11MHdLQnCEsYnuRb/p
	+0lxB2fzJ/Lw7n3nGqkPWe+u3MFp+adR0pxo3CEp9geWvvU0NVuzuG/d+T1Cdv3R
	bCUZT/lxRhvOp75gZVIybzvD+MAT2xDFoj5m0fY28/Bu/bew9N4J4v9WfNVdpM+X
	CqJ7DrTtjvhYgjLnvquxvNMrVT5DjdX0TU1yXv5iwefcNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnthjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768072950so93217811cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096246; x=1781701046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uOrsbaLMHqJWodEJznlZ6hZwbpwVVgA011Bf8C5Tqrc=;
        b=MBRlKt0FN10u5sa5sdz1japd/fwUdjrUqXRncGfRgZ+SVz0mWj60qZ8jGZlathPP88
         /OZmN6QyRdlmCN84qC0wP1dJvFaOZNVS/WybZ7xedkbm2WEbok4MPukVvXoItdWAaNuo
         f4JiMS3NhBkzUpx+9UbfDVaE+z2jsroq+adm+QNHYT/Rv+kWg2Bg42XILx+lCH7gFVOe
         kCPpSZnDHYAfEGtNBpe83qgvmgWdcP99nC0bt5iNDUR4xXiDTWWBMlcpKnABKGlVsZVr
         1epX7u6i04OCCD7KyHtcYdJbIxtGWW5vDPKTQnZhg+AUp8PYJLkFFJ2Q3D3Xxmd2Xnc0
         sxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096246; x=1781701046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOrsbaLMHqJWodEJznlZ6hZwbpwVVgA011Bf8C5Tqrc=;
        b=VIMJmQjq3Ce+7Rx6tOk35wa/0d6XYDPmw9w0U6AJw2LN8LlFFyICmrta8CpBGBj0WM
         gbwxc0Lp0cWSp1vh3VpruBLCkkXuQJ7U3/BIiD213PFPIhOHPJAaytENK1gPc74/Whua
         45+0uuVp3G+lynwxVGNU/7AYVw9zglfMd1uPIdMobSd6I+RaWqOj+zhzN6SA/ncJGuSy
         nmZNiFliL6uZsYp4fQpaYCenjSVF/xK/6GEMvgd2wCpowSCpAxikDiSt8HK8b7Ic3aTg
         HJRSnsMJfZeY1U4UBMDltENmeuhd+QxVCE8hcPuCcZ8ZUClFrJxFL+v1WHGU8KWkXPdv
         jZSA==
X-Forwarded-Encrypted: i=1; AFNElJ8sbUqmDYUDukAfo3K4F/Vcogz79z9Xe+YtEzHVHvl3pLFR2VcXlu3PK/bTDfgyHftSPDXp1v6brKfoqxPN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ArZeyOOjv3iAK1Z6nR1Uyy8WPygmARCnGKec0357iZoXXx/s
	bTIJi2w1Nor1sTVbF/StCS2jZbUQpb2Zp8TdPYq3x2vHnpDjHOlxx1goHwILXXfKAtY8NQgNV2T
	D6RadaFVtKGBBkQHPpG5x5m1BG4c9gwmenKKNkqO93PG0St3GgX30b6ygCxm9XO4pIO7d
X-Gm-Gg: Acq92OEPxYzZ0U7bksFmoRaDmfN9b9a4AfXUk0Rv6IlCMA6Ijms05f/joKlNfXvUZDX
	yM2vFew5p0W6fX+JBJuvwecDryz/yUcPWuPef3Wg5Vk3qqZzZp+qy/r+hXTP3TXMlJ2bGv7wBXd
	/vVcFqCWkw13YESrX2lD0q5b0BdrJblETXs8d/C3JkKm9Pa9F1X7l9ynBuz9FP9f1PtEtGyISgz
	CEwV1Hdwc/ErSVYX8COTptwnv1bVsEW8xLVUX0x3s4HzUm8wycoE1Xn2qlChmqbe48qhcuyDSWa
	mMQFwM9+d9l0NoLvMuIC4McUJCZLcdw/v3AprAhQAMd1aAMiA0QJmqCPFE4t05kCCP30nMCn9Le
	Nz3Pu2ytESDy7lyj5/bFw8aIN5o7ppYh1/tBozFetaug=
X-Received: by 2002:a05:622a:1b10:b0:517:9206:10fd with SMTP id d75a77b69052e-51795aebe0dmr347346691cf.16.1781096245696;
        Wed, 10 Jun 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1b10:b0:517:9206:10fd with SMTP id d75a77b69052e-51795aebe0dmr347346101cf.16.1781096245170;
        Wed, 10 Jun 2026 05:57:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm56210283f8f.14.2026.06.10.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:24 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:57:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
Message-ID: <r3gwpggirf76rlvk3eulctsvw54ae5a3znbi5czwacd5ftwajp@tkv7axgtle3x>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-GUID: sgePr6E4dO4hzjUvLNVV51o9qrbCaDjY
X-Proofpoint-ORIG-GUID: sgePr6E4dO4hzjUvLNVV51o9qrbCaDjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX6CK7aEc53Mh3
 Zxbz8pEq8ccRtatfDyJYujD1WB6uAqWBjfYTX2Bmet5LWl7CTYdQcOdXJcu42r/82mAcSJtdTgj
 kiVGT5VMFxoKFndpoVAKbXLbSUPph2kddwiIftj4K3vuR05syTmynTsLIg/MkK5M4X2Nahma2rk
 M/ACVd2gOQbfEtInZoFfFgJRHjnV/QJaOy+OvfTRSxY6dbl/IzAL9gDRSNw8gjPht+v18LSaSHh
 EdLERDist2pdDq+V/Bf9t897HKBIe9C8b5MmGzI5oKSoCyoyAuNAvyivgFXLHkEPXk+iZihqubJ
 Gavpsudu6mrqv/K2YZ0LAKqpEdYSstcMnsfzObSwUQNuiZKoV6XDGFbymah0MP6EJqF7aRFw1Xh
 ff5UZxz2VPvj81Gn50LBCuqs8Q1q+JVWDMz/dBFiLUxCocJ20YpxnDWCPQwzA87wJyGT4ZWr1O1
 G6jC0ZKwwPjI4/jTsUQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a295f36 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8 a=SC11PsEEbJH5d9KfBicA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112461-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[tkv7axgtle3x:query timed out,googlesource.com:query timed out];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,googlesource.com:url];
	RSPAMD_EMAILBL_FAIL(0.00)[abel.vesa@oss.qualcomm.com:query timed out,abel.vesa.oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BF78669896

On 26-06-10 14:04:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

