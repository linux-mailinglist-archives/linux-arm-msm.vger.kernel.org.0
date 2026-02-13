Return-Path: <linux-arm-msm+bounces-92806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKw6DZBNj2nnPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:13:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F9137DA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81FA30382B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6673563C3;
	Fri, 13 Feb 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhjJRlmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RO2jMVFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371533D4F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999179; cv=none; b=B7nGeKRDaCrE2/uHtQ9n5+aQmw8B+guLMZ9ZFl4L+QclPkasx1R8AshwlnI3NRoGmDkVHYYlxRJqQ2x4MMpcM2asrZKZxRudPvQTbhuOMBQALY2BtkJqv9hRocVjzkTP8XTqOnXARCq6kOedJtRYTwH3h+wvtRGncR01sPiMG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999179; c=relaxed/simple;
	bh=hOw0tFe/vYPmszKkb8UhFx7m6gXpo9/GDrXf1qYDhNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5PbAOqdxzpnHTeJ+9AxBDsXaLNz3rQM4kMlhAONProeLqhYRzXH0ZWYwIFalreC8aBLcUVbM6d5lqa/VVR3ZdZwsHWYuJ5F1FfmgWU8+0DAa7+RUyhjiRm764cioBG/wEXkZN/qnjPEsCdyVsDGLB/75SBWRYBxlqUWnaJqUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhjJRlmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO2jMVFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEOBL03272512
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RBbL1ZaH2jaZTM7DN7aadixw
	p6/N4RRiyy58A0ZG8bs=; b=GhjJRlmKtWlG1z6qVQHWATkEGZzC3HOdy8MZEVVX
	3Rz5JZrcIwz9ZKjrLJ8qShFIJn1qtKGzAhYjGSZnjUr2nr5Zg0HK2juE5zr6Jl7a
	4882uhb916YbPgM1rk77P+kKlYGf8Woc5bIKi7dduyGY2nhWHf5V7g4A+ZFtaTEo
	NIYAHa6WmGhMrcljfACI9jbtazRj2UVUfRClaGXJn98H823YRpMddohw7KS0X9YA
	5ZZj+obHM5S20hcs2EqtpezPoGf1iWcO3mSRF9Ehx7YXkgDt4DfowybsYp5ype9I
	PCTfgXlJZBBetM3A/DkublMsAuM/9wWzkdlQ9M7eoknwrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca5pd8h2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:12:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so444634385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770999176; x=1771603976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RBbL1ZaH2jaZTM7DN7aadixwp6/N4RRiyy58A0ZG8bs=;
        b=RO2jMVFe578yzfjzCGJNRqM2Lq4CmX2hhfrV8FRYYvIeAl1wDrN+9d44SdgXGKJy8S
         WMe1loZ8LrV04l2g8ejCsusyM9e+aUTARvHoWYUfi/z2gSI2dKLn7Gs14ZrZy/Dg+E7y
         qgDylvNI0m82JQuXLECcP5DCxlrsDIECNZHjP2rcLaFufcMqj+yBDBvO5qFx+DsH5QcU
         dCqNuKLyslU0DhOuGWNAR7FEui7jimV4A8qwZcdv9xtnk09pfpAWLc9iCwNyxiCTnAXS
         mYtuBzd9nAOdED+4xeLF0o1FXUjyDOmTzxUkxXik+B30DXqfo/TBoKHIhAz5hWWMy5+/
         MyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770999176; x=1771603976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBbL1ZaH2jaZTM7DN7aadixwp6/N4RRiyy58A0ZG8bs=;
        b=Ar8TfL435Ru7h9QYOsscGLuHKDh1iWb+hfjNnBuPIS84D9SuZgVgxigqQyBvg0UQle
         gi5gKsgFoq/6//IVpgCs2Bdi+gqutHuIHKhiYJ76dLvael+uHPOSGAJlIphFV1dHa/jk
         cWjW1hkdlkpTelNuhpfkRzjhMw6kr+Bo44MnqAfd31nVCJ9QggZCN32jRHFDANH0eKL3
         HNPBCd6ZKf6whN2YwodOQ4rVw9akW9vOJ3wXdsFIcGucjTzdpROaIzii9WGL9EmJsOJw
         5SqlZAoAQirdTkK0/+DNLqZL+eVtwHdds5KYfKSCxIEx8350lG+jNGQ1MfkXcIOCA2Vp
         dkgg==
X-Forwarded-Encrypted: i=1; AJvYcCWivbIifpoRZYmCaoTbPMUeHRl80QNCSr2QpsQBqqAItVMu/EyQSiV+it5WpS3ao/57x+9dbjCqNCdajlcG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8C125F53SnfKKcrlTByydV0tsqh55DihOxUtBb8BguaNta4l
	BhcGKPhrjQjEj+ie6swjdBQND6GI5oQ2do9EArGIrPx287ChtyYmqenMzD6lRAO3W7+nmLWCGnk
	m0LJB4sgHbbF+ilFHvv+uBz7Iqq4KfhNQv97QmVtc018fnp6ftWUEdinoFNguGbZVGsFk
X-Gm-Gg: AZuq6aIXvVDoaQl3x4qACUyIV/xJGaNKNfyueu/bhy4DuC0cYfEcYr6MwTa3L4dhqQr
	dumZ/tOkEpqT4mXLBVg4TJS0Oln9eB05MFTT2wADND8XBOOX3LpzHtE6odyF7CI3WPhEgy+64OH
	vI/leuNjI3dmGFzAGea8SX8mPGxMS5Ao5/N0ruXxdOX9suhLuoBwyEejN3aBSXRAaqRnHCPWh1v
	tdQ+dZ6Mzbu1buweVwTcLcw00R6x1SZNdKbqEVti5BUqXm956myZynpmBuCvJ9eaEZwCb/UqkuW
	Dud7MM6VtJpn9LQV2PeMNZRsy2acw3LNic5fzvnNRy6kFVzyanlDHzR6L2weOm+tgNqXHEuOb0T
	jYQRUqbTTp/dDRaeW8wEOykXDl3wTa7NvSAag2uwMGN1MVEUQVAVhBGaMYjHfSdI6yXBKIS6BoS
	bVK42snt95orU38MWZgBSwulaAcsCOoZkOP1s=
X-Received: by 2002:a05:620a:1725:b0:8c5:1f9a:6b52 with SMTP id af79cd13be357-8cb422a39camr285068385a.28.1770999175747;
        Fri, 13 Feb 2026 08:12:55 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:8c5:1f9a:6b52 with SMTP id af79cd13be357-8cb422a39camr285063185a.28.1770999175156;
        Fri, 13 Feb 2026 08:12:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f8dsm1658696e87.49.2026.02.13.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:12:54 -0800 (PST)
Date: Fri, 13 Feb 2026 18:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: qcom: edp: Add DP/eDP switch for phys
Message-ID: <lvau2mmymqiczih5dkhgd4vrx6x5tn4tdp5wfaddkkrakdjajq@soihplbnfgzy>
References: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rp7I7SmK c=1 sm=1 tr=0 ts=698f4d88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AGCe1-UCTpjO--lCauQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XFrmQVK5iedRF5na6JGJzjUJQSfSrrrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyNCBTYWx0ZWRfX0iF37jEBJwSb
 eX6fOlVG8FPp1VZRF56Bx/Tx12GR3eeZd3widYnpZwg3RgvksSwpNQ0eXRkxfzoaHTyMJ3B5ueH
 vdHOu8SPlr4hMyIrxRFZXJsUSPO1+J1aRVAdYSBdyD8l3VN2LXkVZsEIFehNe0eqC3yGea9Q68j
 BhWofFFefDCZiD9cnacPOVbKwwRGcO5icHjy8mX++6/GlTwAN9tL39QfIdhyxzplZQv7kxrvpWY
 n/V2ZokFsEcBDCapze/cneIFmapPi61Bv2O3Kf8MFS+r/sAYqfBIMMbIobdlWodzuwSxtrs5WNJ
 Np+HCfnXcRu3C/1geC0oNv4bP1ZJ9M9YHuTqs0rDNfg0khU2iP8VClA+pD5yBWoz6idxbb8Y0mo
 N2y4ScTDJHuh0Fd7rO9/SC3wGTaU/j/LTSuJKTN6TRYqedWHumbDZzm6q4X4CVwtWplO7qvQ+Nq
 BfHWRP2BLWQ3kX0hySQ==
X-Proofpoint-ORIG-GUID: XFrmQVK5iedRF5na6JGJzjUJQSfSrrrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92806-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A84F9137DA4
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 03:31:41PM +0800, Yongxing Mou wrote:
> Currently the PHY selects the DP/eDP configuration tables in a fixed way,
> choosing the table when enable. This driver has known issues:
> 1. The selected table does not match the actual platform mode.
> 2. It cannot support both modes at the same time.
> 
> As discussed here[1], this series:
> 1. Cleans up duplicated and incorrect tables based on the HPG.
> 2. Fixes the LDO programming error in eDP mode.
> 3. Adds DP/eDP mode switching support.
> 
> Note: x1e80100/sa8775p/sc7280 have been tested, while glymur/sc8280xp
> have not been tested.
> 
> [1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v2:
> - Combine the third patch with the first one.[Dmitry]
> - Fix code formatting issues.[Konrad][Dmitry]
> - Update the commit message description.[Dmitry][Konrad]
> - Fix kodiak swing/pre_emp table values.[Konrad]
> - Link to v1: https://lore.kernel.org/r/20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com
> 
> ---
> Yongxing Mou (2):
>       phy: qcom: edp: Add eDP/DP mode switch support
>       phy: qcom: edp: Add per-version LDO configuration callback
> 
>  drivers/phy/qualcomm/phy-qcom-edp.c | 176 ++++++++++++++++++++++++++----------
>  1 file changed, 129 insertions(+), 47 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a

20260108 is very old. Your second patch doesn't apply anymore.

> change-id: 20260205-edp_phy-1eca3ed074c0
> 
> Best regards,
> -- 
> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

