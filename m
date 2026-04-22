Return-Path: <linux-arm-msm+bounces-104167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFMkC5oR6WneTwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:21:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D24449AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72D8830CB5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53D63CD8D4;
	Wed, 22 Apr 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRPn90qy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ms//ljRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FD3A5E62
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881829; cv=none; b=N17ZiG0d4BJ57Hue0NUN0QxL/rewCcMkJqCuuXo2RyCPOvKCEEOv/jwA7kAVs9MbxwkFw9X/YhqsSq1c5cta7y8/+UrXbbchTrMTzVz0CM+kOo7b+OQjvYOsq7Mi3LrXPV1Lwgtef46TULNqyRdxgqQuTvEvdINyD+7Ds9i/jrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881829; c=relaxed/simple;
	bh=QyxMpCXkdpo86Mw+3CM5Tn7kWJdhDyrON+s2e71h77s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv//l9713Kf5Hhbefmw+IOZCR49G3vWM4ZP+kTG/pqNKzUek/mJpP10Yx2L8FX7P6zu+69E5VzdZep9kshvcCfZKb7MhrB+qBUDAKkWdABT9AMryyfvoJjs/qpTsKz4c1SHT7qGoSmemUREEAtMEYtZv1ktQJjKO8woSTRs48Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRPn90qy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ms//ljRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG4l7d1587834
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3YNyozOmqbEWs49NxHPxfWO/
	ujoEQ7C37uXS00Jnihw=; b=VRPn90qytWGlVt/ltNShAODhvWuMMc6rebbTc+/T
	213b1Jj66nBkjNuGs1RRre26wsGSO5BKyTjoGKv0+SHJlR+ZEl971rD35F8xl5j6
	ppbg7QFNWmmEPLY8KQHRqzfIpMSmwXDnRSl2yslXlks4sOSaStpRSTKMW94htIDT
	W96igmX3GHpKRYxpnyiPy46dnJ6hWXJVPSnPRo9Y/NT3RjNv7yv/aFB3Ytm+r0od
	MLNJH/Q/wjdHLx2aOjqRJolgsin34NDFCXVAXg8vl5pOvt26nUcREux2bKJKBY2i
	nfl28ABWPjVnLdzsj5hprWg0BVmmo0mmrJRGYfuJu2J7fw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq0fbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:17:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6059d4c73d5so2468256137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881827; x=1777486627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3YNyozOmqbEWs49NxHPxfWO/ujoEQ7C37uXS00Jnihw=;
        b=Ms//ljRj0x2kWiqNFWeZfJMRuHokAizED/0QQUs/jUFfdALossGjMBpTdRXyhEc1ur
         BuqV4jsETs2ibie2KOUNE5NHlAZT5p45m6YMb+4dHHsAR0Rcbbcl8RF7zlMxKTl/87II
         OmWV34iS89+1S23cXKiQ65y0q5ZNJ3Wl6uA7RSu4qGshp4Fi9VxwTi/srRSz5woF8fyp
         IBa2iPkeauaRYNivtHJwcFuuyieUA38BMruHrhGUAg2zE09Y3pjkFLWEA7JPo8zJiv16
         KSzX0poCRteAEs/9Vgpm+3G7aodgRLl/A5O+ZaB3G5PI4XTOZOTBdABQmGMbG9j6iaUO
         QDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881827; x=1777486627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YNyozOmqbEWs49NxHPxfWO/ujoEQ7C37uXS00Jnihw=;
        b=f+pE1LmnjK5DwA5pC8XRxVn0/2PjP2sPVSpoULh6UH90V1fO6aAyB+BSbWCliZJ1xc
         pFiBOf9cIRcMEiXygVoey2nNnh0w9ofb5lzGxx0jte7IGqBGCrp8OV6jD+agdiusWQSn
         g7aBFj83RVeIp2Jz29m3zGDQkF7Ue5bxbScryIqRmSMvp2PQgyRxERK2vW3OoG2YUu/N
         4iYDTkgkdhEdhVfTgC32rWRSRMI5MxSKLl3m84od9m5ojiYorY58PSd38gADaEeB4Tql
         jXq/up5A7lmrxU01L2hsTwaC3WPcvHCPpeeed6aSpsIsGA8IvohAuQk92Gyh4rFYXZV4
         mMGg==
X-Forwarded-Encrypted: i=1; AFNElJ9UuuMnWwjaKB1L+wYBpIJ5BmXn0Fkeg0s1iwd9yiNeKZily7asrkmH8m0vc3OK/FTmzUqsBSB3f0l5BS7r@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZ8mncnFV/TddArzTMFj1XbUCm2m7rxPDuqtbsweqKZ1bTGI5
	1soAgb4YD7RsZFlI8UQQH9RgkkizTWc25qk71Yl9USrsxHSP8GbVLS0GxrkcDCgfQ6zlXLvAnrD
	SlefeCCcDWq6cy/G0tX8NmkqEya1L0lkAvGYOFVGzV7OdQc5TGHqEEXAbWjppReumeLt7
X-Gm-Gg: AeBDies30vpNIJ5rvLlcvbDtO1K1gjLWfxOtdurXmaHbI/AkBQAnQEGJQK11JCqZnla
	qeqKWTsuIP/dx7OntZZXEfHzfMA3rEAMFnXH206iWJ7OccGuI1Jhz0kY80VAFFtt+fR3o8r3uf5
	XHrPeZ05UUljO+YuCFFT0RCtXSeabGtVoWAQP8vkv6L9T1L6BsB4eJ1fL8qAhlo9vandM3UOctz
	Iic/9QlODy5QrhZg9bD2GZPLlJTvN6UI0nFxYMuX5B+HD2H7OxMDxQJYkZRGhy9OGf04rjC4Sgy
	gAFZ/PmDCrNa6tF8JcrnWKhTw+syZ0E6ZZzAzmS+fCLZUs6EIoikePvKNmh/BqBbjeVy3D7UJ3D
	rtQoTce2jx6OoyA9aV6uYKKvGFxfA7b5E5UaiLSOiBkkFNCr20xftxg8itOFiQgl1GOKEgic09V
	HowzRUX2psgVIstNr0yUTuJqKJeju5tyNiCMfh0nEEWRcOEg==
X-Received: by 2002:a05:6102:3a11:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-616f5eb9cd4mr10922061137.1.1776881826258;
        Wed, 22 Apr 2026 11:17:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3a11:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-616f5eb9cd4mr10921842137.1.1776881824146;
        Wed, 22 Apr 2026 11:17:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f51a7sm37631051fa.7.2026.04.22.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:17:03 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:17:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: Re: [PATCH 11/12] Bluetooth: hci_qca: Check whether the M.2 UART
 interface is fixed or not
Message-ID: <e4h36co4ein4mqvqempmrvjhfbgx6cxwjvdcsfhkz73qnkw75j@dceeamd65gl5>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-11-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-pwrseq-m2-bt-v1-11-720d02545a64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NyBTYWx0ZWRfXzLSvmECAlYwS
 4YYuLFPdWuq+00mFCdTLzj00sxpnQvfea+e8oMK2cOXEVOESJM6Os5G+Ow+LWmZvmiQwxETkpi6
 eI/zof8BCR/p4cjwClNEcraGXxFIIPYRgpBOVNZX0nysrD8InkF5IjnCyQlFf5LCY4bl9MKypai
 s2cPRYAkLhQNu2sS2CnrCijKNBqG7zxi/7SmvyU4rnx+x0SeIz1Az5T/CoAsqd+b+VCzOOual4c
 Vn7b6dcbR7IeoDZAeFVz1pK1oJBuOgVIRneeyK2clzKjwAddSzGXbxO6kHKtDpblv0/jjeUXSna
 F+ck9BcB+I5zwNEF885yGWg8R7kG3AXM7Vq3W6zCPPyK9oH8lZOm1hKwCj7R3nprlAq4DQ9QZev
 DZ11zWu+Fs6H5/biJtQgoJbYrgjhPKvPn6hyUiW/BvdkFn20vrbx5fh2gPsys1wot8js00Mgg50
 knTYVSkdZRmOkGyjOgg==
X-Proofpoint-ORIG-GUID: V8sfBB-I30HZcTV5q8CqAXe6maItWx9A
X-Proofpoint-GUID: V8sfBB-I30HZcTV5q8CqAXe6maItWx9A
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e910a3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rMrwSXHligAysd2ZAJkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220177
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
	TAGGED_FROM(0.00)[bounces-104167-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,oss.qualcomm.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85D24449AD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:54:52PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> In the M.2 connector, the UART interface is controlled through the
> W_DISABLE2# signal. But the BT driver cannot know directly whether this
> signal is available or not.
> 
> Hence, use the new pwrseq API 'pwrseq_is_fixed()' to check whether the UART
> interface on the M.2 connector is fixed or controllable and set the
> 'bt_en_available' flag accordingly.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

