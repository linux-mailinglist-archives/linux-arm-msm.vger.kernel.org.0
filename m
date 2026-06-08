Return-Path: <linux-arm-msm+bounces-111955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6faoMVwQJ2oorAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F679659E84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:56:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ve6KxcPd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hbipcLAe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A94300AB20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A001E3E3D86;
	Mon,  8 Jun 2026 18:37:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE53DD521
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:37:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943849; cv=none; b=HlkwgWnL7416KwshZQvwFIUTLIaAzr9eZ944cehrmpas2IfgbfGpbpC4xeVJXoOZ1OC2a7Y3lYL+T2yTqlmoDJvHDL8ggFytcjeSMAqLgHflGjpVK49+JfvfG34q2N/xGyY/c12jRqNSWLA3Ha2CG5y5SQRBWCsfW1fa/nqU7j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943849; c=relaxed/simple;
	bh=Gf04WEalx/FUQCjoE4Tim+odsuoobVmL7oDW5+HAgG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROUnOMtvCQ8A9xvzvgfngjyPbf77XwzM9iySI0uI7rPOGti12GtDvtLHb4FZMI6bCB8SOKjD3AI6RfnUeiYVPgZjS3i/lW7RPOBK2kZl2mfYRSJfOjm9Wjdl4MnNSrXs55VY50wqXCSR+XTtrDZPzodtROHxWaEL7yoliuZ22pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ve6KxcPd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbipcLAe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFRuX4041608
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 18:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nIZ1j2oO4hKk0sVO2Hu6TOAa
	KuhKzlRHmyJatc66WiA=; b=Ve6KxcPdZvl6B8I2F1YCoUs97rEowdCEDqmkApdl
	AvAFb+rdNQVgJrGInOIQZDLQeb0Va59EbdNWVN1qAwmswzh/aJf/LKpxZl2QHGmI
	QEUhvr/pdHKWEGtPQoQFjEeMDJTbTATeMCiYlzsxFwSu6yL5DjZ321dRKkNoQc1E
	TBLBYARUxglCCr55z7VpDZ1c857hMtwlqFYM7R6mdDY2VkDSMJpeXCl7FZf8Z0N7
	UmyIMbUTQ3bCPdh/CakIvYBSVXUtrQIsEmabCc4/XWhnb5b6SBjtMEUTbCMop8fa
	2QipVp6uHvplwQGH67lk+iAQGs/8vP4NE6nQxJElk/ggUg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9vbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:37:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963da2c73fdso1466815241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943847; x=1781548647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIZ1j2oO4hKk0sVO2Hu6TOAaKuhKzlRHmyJatc66WiA=;
        b=hbipcLAeNVhUYhaQ0hRNUtdHc69IhOJkjsg3Kf9gdgXC/oGZbs+CXUfTs0aNPop2xU
         O6ci6IOgsC6hwXe87DaRnIrn7xNULuAOfFclvyzwZ4RxPfx1ZxzBh5J1xAbeYoq25B5x
         sMPt3KXTaNqppdOeJhph00oXvN15GLKv2qT/Tm/QyQfET04taqhgKUQgw/aLSsWp624K
         xayRwvOuZz+1FFRqrSSQhZDbOqsjwknxNnpnwEyBLrKUyFGZ6sNaYHs1NRd6nxw3bDL+
         71vUnzUJwCLDYlhYarvaW4F/nXXxdjbXx0kHV2ZoFh8O6iEP4L5L+J/30U62+AbbwPpc
         lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943847; x=1781548647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIZ1j2oO4hKk0sVO2Hu6TOAaKuhKzlRHmyJatc66WiA=;
        b=cCVOi/vNDYFjWUJXuaGP06cOyWZk1xd+MaXYYf8QkpPwUkFHaYidQ1YEPkXw5JMGYI
         XEV61j79vDrlRuF7CsfRbudlVqEyRyshj7Ux0xr4pCG3RsSfi7W5r6WnRsleua+18A5Q
         3e/w3YgyXFsCPND9xmfZM0vw1r7rPDv99yBryxhU2+Ye8bDVPmKE3blV0QreSB5Oq5IR
         +IvdzFrZUIZmn/dho6Yy0mrYLpaAYDeLgUTdrj9nmOAzLU/5qgYt+4+lT4b5H0dbWaR0
         VJIvgdS8ap0UmI+RL2Z15B7BJu/Q3tZa049fNaHUWyHgMj1GP8eZOEJbQe6dL2k+y2tQ
         v1tw==
X-Forwarded-Encrypted: i=1; AFNElJ/mvbbXd74apBzLqyn5C8u4EoPZijg1YkovXc1qFdFMEpW/6sh8sPlU5j1FDk1P7KOE0votZpyjb24w4zWo@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrC4lgmZ18nW3d/uQQTDwrDNSmuRi7Qo+GBBE1LFnsj3hLwTu
	c3UejMWNBusTfAo6zb727vk22iW0w11hS9qrjg+wFgFF0T+iSfADFNv3PksggY3/Wj4XoClPelH
	puPA7OMnWLH/kxA4G4eK9X0sHQeydLLfs9xAw1BGf7yRGaALP1UhQH6S+k8UQ57F58VKk
X-Gm-Gg: Acq92OEUVBjuPms/Y8FEsbCiBPqf1f56aUpn07gu9naggIdTnM5MFnXYhze5s/ey7Hu
	AevkhXZmKE4imvbeIRbtQgOMmPKI0eAWJa1f6dxj3Py5WjIzCd0z6Y4YWIX/GGZOP0ITqtBI9tF
	+1hCqx60G0GYOtO7jf23K+9OdHteBPktgpficsbxFr5MnxArl7Bq/iiHsbFy2oDpiFCHPihxNvx
	mvRTN7p0J1nTnn8GUUcQ9JnUa4+PKoQZ9MkKvXYuv/yrdDOHKIa9FVbPezb8a5NE/X5Vqq73TJn
	URmWibXcgqw4ud03dYjmagHnNxsrgUxoN6Dk1VVBuF17Xjpgx+beg3ttFDsXAI0Vw22srHnUs7S
	FVwaLL2a6ZE/Z6mBXWqyiDnDcu9rHHJSf3NVWfeBZx1ZzomEMCaeG8XaEi3IBLG68jm7+fMPzwB
	EDxN2S0atSbLFCxNZsu0TlLCDqCZMfcJcJONHPEwH+wYpxUA==
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr7778961137.4.1780943846811;
        Mon, 08 Jun 2026 11:37:26 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr7778948137.4.1780943846371;
        Mon, 08 Jun 2026 11:37:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b992a66sm3938821e87.74.2026.06.08.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:37:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:37:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <25m2ts5lomrmmxkjc24t6ky633sb23ge5udg3z3rln2jaqrfh6@46xrntztb24p>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
X-Proofpoint-GUID: kk50P2bGuKs2dyU8U9iaxzkZm6TzGS21
X-Proofpoint-ORIG-GUID: kk50P2bGuKs2dyU8U9iaxzkZm6TzGS21
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a270be7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4nhpQrVHSdZsbWUMf4AA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfXzasI9tXxHIZF
 bHCH+9HQtCMoBfLEcfOVoQ2uXDMhmkICOXx38jRofADE0SE7y4zlwkoZlr7yNE3kwdqPjneSOlP
 myPiXPbl9N+MAw3fDKGb3PmFK9CbvKOgNAjFCASF0iKPFlqTHjcTOniLBISAAFV1wNxZPTUODFm
 vt+QYtzXdjfId2tGLvQJp0Bu79L6pPdl55b7Y4zfNtVSGN/Suo1FwOVNJGb12KE5/pqgts3yYVt
 0kv+3JphtMM3t6ajwVAC0OWHc2U+yz1JbVYjiYSwlHtLtLvweuf7lc820pzHr3qMroGXKZ0p3yj
 ZjIkmCC/yPBs5GnmZu/lNRrcm1+pD5Pg/QkUmqaajVmrctOpPoaUzqd9dEbimCWk3/I1XCY7hAD
 LqKX2Cd8ZVW/4DCGzItExw6U24DjwjBY9/xGO72cpinRWn2TDRzedMHogaGceXFDp0zMZYbZifx
 NAl8tnWnl2Uf8LppN9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111955-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,46xrntztb24p:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:palash.kambar@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F679659E84

On Tue, May 26, 2026 at 02:39:56PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

