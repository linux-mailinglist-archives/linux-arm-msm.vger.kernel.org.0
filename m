Return-Path: <linux-arm-msm+bounces-117632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3h5+OUNNTmrFKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8039726B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:14:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ePiF3qFg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YHtEsS9+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117632-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117632-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D8643018619
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034912F3C13;
	Wed,  8 Jul 2026 13:11:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C07279DCC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:11:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516281; cv=none; b=qf/vpPhbYy7fMwksehTbXxwa15WPl/wedcZKzdFyBQrybDvfTIYS0v0U3lK2JUfCYQEXmZ2ilf7GAs1XzQtzda0dgvfCv7Jvcm+hxEFU8jVNK+1sHlaMwbg8LX2QvflQKljmvKxIPv5Nv7fUhW5vj4k7vLnrxXCewKE24XUPfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516281; c=relaxed/simple;
	bh=DDt6TtWG0hhG2DtiJdfpnQsKiVKhcaQ8v89xQeqKKGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd940JSDtcQFPAbWGAjm+GfJXOroA0scNWLrKoLWB89mYmEIs9gYfQdXYfZywsHfY1TjbE3XTu2ED/bvNSuyUzlKk6YCpXs2HTVirqzClpZPEqZoKSDxCdWvW8BNvcsGtz+cAgXUmi14DlUNTTXnhVOD4JfZu/qc3l9Z70Mw1aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePiF3qFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHtEsS9+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3sEP2751523
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h/wmzSE05/8DzDlkm10pYIDL
	wkWRETXjBMhZD4v55iE=; b=ePiF3qFg1F4kqF818XnVQCwMT3fzwf4QIm1Cc2XY
	Rr4fnHtwwOZPTifzmLlTTKH3rb7W/ZLok4x/woxxbHO4YcZan/E3P0k3F+fQm9bh
	gY1/X/cdJxKml6pwguLmFsE/edgNu49rOdjn73Fy2FyZB9nT+6QrN7ZFEimXAJds
	7xJYEf1zVY0ZVMC2LOMfmNYQr1euTGIq+0OTnxyG9c/xm9sa2s8C7bIbgkdLqtTi
	GM7/e6dIFKze9/KPOAhh+eZLsqd6p1++gOu+8HkH6IfGbO+B0AiykQmbzUr2gPeY
	7s3FcXbOS3t+bY4/yDRcQZSUijwfD3KXB9B3HuYjsGGqdg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstjd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:11:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692595fe97so203081241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516279; x=1784121079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/wmzSE05/8DzDlkm10pYIDLwkWRETXjBMhZD4v55iE=;
        b=YHtEsS9+SqpL8UpDHpxac95I0GaWNQYmgePDqN5bRHG1Bjg1zlrkQCoQx/eKaE1Cg3
         eOTlhuW9VxuN+hAtZwFqv1iYfBsQXU8fKFS1uwZrx8abQfhPvo7mXpbBSg0LCMWqP3mD
         DX4BhzUGr0DMQMj6sh4H8F9vqXkvI20jRExNhjmFQSupndNa/8O6I90HQPpFfWwvjxWW
         Qgs0MtLpmMr05azZz4Zg1zxRlWlEHGoUQFCoAU0XiJULrSkAYcxNZVo7McJqF3DVhuyq
         MWHFtzQT+/1xjimetAeProXuooZPfrKkMrnIhiXog4Mwy3MxfbrxQaDaVFM7XlMNj3Lw
         4OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516279; x=1784121079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/wmzSE05/8DzDlkm10pYIDLwkWRETXjBMhZD4v55iE=;
        b=q9UgNINCqcWwlbi2kHTJkxOIyE2BU+kVlilRjXcdDiVjdP7ErMMEMZgHcBV+zJYQmu
         QItaRagbszjCk4D9av3B7oHveLd4N3z014SSe1f6ih0KDLoPLlsRBLSFBiDxaW2Ff43C
         ydA6vXnbQOnRbsdi9cP2yVwFv2B0+mKgdaxjmIeObVfzJyeihJ41XrMHNczJU+ULP1cj
         tR21LrvRwhygazxKSYdKbY/hVsGLxBTcrKeHhx0n1nu7PXFfqKGu+cJHTxbLJHCv1PKx
         TSfe9YlttwJSB65CjpPFxZEJPuTfsWGEk0ZaYgKAQPyZ++iQnkQm4Xfyymqqkg0Snz1j
         h1SQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyNMaeUEM43fXBjCXRWHBWpV9CWzyfy4Sh7z+6VZtuK0ZOKfH0qc46QLLxg2bsQJCga2O3o2qQVPTGY9xy@vger.kernel.org
X-Gm-Message-State: AOJu0YylOxeGLIWyI/SxRYew+SPhdXcBURlgs9VHVmVU2BZuWLlHliYc
	fxIkFEGhPgw0A85GJyanomujptFDKwgUUezJHseLovAeQpmBi90N6u4tnTLI95nmCqI9iTklPyz
	1bo+LxtTS0k9cbjzBmb3ByefAeg82+76tpl1Jo5rS2MNUL/PqGcLduH8lA5rxJtl1Sn4/
X-Gm-Gg: AfdE7cmhZLQVP+q9wc583pAS1E5buClkswwGtbs+A5Q637aTvYBwQGqa9c6x5pYM7Zf
	H9RwZeO5DLkdkX8HUGOKDajWLHY9O6fH922K1Eq8+6ZD8HpYtvmeQ/q+D6DbzCoNNkHzgcmpLCd
	iByC7o8eX7vBcv8mZu/NmN/qe7scrxEAet1QGQ4sikYfkO0mDUXPH9q7BEZfT67146eRGavJvnE
	4iwwLxylQtlWgBlCF/XzqEd+oSZIEvgd64REettNWcxfbsE3D42x20sQP4yIBc0J5Wgz3KgpYL4
	uhTpiqoCcBY0A7K1VRSpjeyII1OIqG7Q9NvK9wzfGRSX/yXguDJTt4vRFj05ouhLSIoLxx6QkOA
	rRy6adHMHDpbVyFlceBojbDbqXhxpnsJ4AS6A8SeU10LAy6/FLj9yUfqmz2ZsRcfM6fCbkqHXrG
	aQv8mEdidBQQSF0L6qnbdm9dus
X-Received: by 2002:a05:6102:c4d:b0:744:d5f9:ffb1 with SMTP id ada2fe7eead31-744e010f965mr1025637137.16.1783516278849;
        Wed, 08 Jul 2026 06:11:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c4d:b0:744:d5f9:ffb1 with SMTP id ada2fe7eead31-744e010f965mr1025601137.16.1783516278020;
        Wed, 08 Jul 2026 06:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c0117sm4528573e87.62.2026.07.08.06.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:11:16 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:11:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: qcom-qmp: Add v10.60 register offsets
Message-ID: <fonaxuf2jc2lpzf66vwwudtjjy3fy42aizuju55wpu5tr4xbun@o7yth44bfgdr>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-3-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-3-8d9cc6324947@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e4c77 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX8J4ntT7fm9JH
 Q2dyVfa5NciR0u3dCAzrsAMHdDz22cCEFoJwLE2rq85mCMMtjRadvPoKnVoiJsWL8BQl5qrJTbT
 cmB9AZs/vO+Z3KViM11cfOlc1VjJecY/mH+pNr/VGu26EbbzLymKVyOO3keQPzgOhqgyK+a46s8
 VQsNtjbyOGkHnOFs/crmAcBKp85Ky1IM4/WSkGP91rBvcD8FIeRsDBEuMUItQ+rxtV7rJaWRX9u
 Z7cGLuWfEMpoGB7outCwTKrJJ/VanACySkvpJOAGcE/M3DhojY61owBy/6hw4hqPy+iOsbJuWLz
 wpPJZyyo3rZPOFqW7yyKg6cwGHt7ACp2F8Y1/5TrRv98RRaFib6QGlwBMt+lOFzOPYtgyjkNy4b
 IlXl/Uj7DcUOBjhqCMmP2a1fleBTAzUSC3XRdkieC90nBYFxr5LBkK5mmR1oU3JrdOzywULuqY4
 bUhGodPdI0vRaff2Rdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX/XNlgxcMLpMF
 mCH5fNfqAVGidCIHWObPv9SiPswOKFRqq4LsNyujRuKvNlhozG81K1UEeqQjRTT5giRCKZUs3ej
 l/CrGnNy/F2B0d0qLOgy2qpnVPmuUYg=
X-Proofpoint-GUID: HfS_u6sOQQ0YkL9ALtiGTm23fIXwMpBJ
X-Proofpoint-ORIG-GUID: HfS_u6sOQQ0YkL9ALtiGTm23fIXwMpBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117632-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8039726B01

On Tue, Jul 07, 2026 at 08:32:48PM +0000, Matthew Leung wrote:
> Hawi SoC uses v10.60 register definitions for PCIe Gen4 x1. Add the new
> register offset headers for all four sub-blocks:
> 
>  - QSERDES-COM offsets
>  - QSERDES TX/RX offsets
>  - PCS offsets
>  - PCS PCIe-specific offsets
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   1 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 +++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++++++++++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 219 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

