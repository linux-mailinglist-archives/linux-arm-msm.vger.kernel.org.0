Return-Path: <linux-arm-msm+bounces-93204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBH5JRaWlGneFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:23:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA614E1DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E7A6303338D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B778936E495;
	Tue, 17 Feb 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0S7QHZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5rSGT8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5286936D510
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345417; cv=none; b=LW9yGnIpNBzcW0ZJp/6BVfgS7hN9TdCeIm9u0jPWEJz/4+hL3CgPM7zPxnugcA1oaf4N+yuMwEjmVkta5YJ5opIiDL47NqZCaXTMus8qGbKlqlAXDtbEVNCBYO+Boedw4kLVXGE2+oPGag7YLdbaROnXpZeX5CMkO+kEBjn3BsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345417; c=relaxed/simple;
	bh=MZgfISmNtKRd0DeJegvUbp3K2YqJ4nDQ20AQ+rfElTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPZQCKSbPsCPhSecEwPM8ss6v0xvdTnIvAgvsv+0uIi0yTXX7WpvOuqs7bwZTTCzjl8oClIAKwlQLDkKvELcckZGFCBC3qNwLqBWC2XWNyeGzNZL+YWYijaJIcChmPLOiJqFNSN4LKdWvxr/yOXAIc8yDntXFTFatV2tyW7qOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0S7QHZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5rSGT8g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFZapT982132
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WVLp6F42vh8XKq8PDwrm7Fs3
	8/i5i/QAF9Oiq/UTNvA=; b=G0S7QHZ/8Eh8IhBBjMq3+AQu+CqsB5+SIUogcOuI
	VRDHNso4PfF4IfNgt27SPIAgySxHCFkOvvpVZUTX5O+1b1qUpyK3gnpYpcSYvvVG
	w0BWreXfLTm1nRkBHTb/2CX+UpjyUecJ59+xlQNatrYhR2SiLrhBO5FpFZ+i8Xb8
	8rHqr3iiPCA9ynDsH/nuqeQerf6xBNZGdcH+dC1Xf7e9a5zofYH/Sl4fwQJyNXYK
	cpj1hlCAq8g61CwditqlQCQgRf5ktj6snyquECSNxbJGzVYgCImgbWhi0l4ZNOvU
	zn7hEbd7OAli081HUHjiQPNDlfxeowqj2a56lF72nKqAzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662u3xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033b62efa7so350382451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771345414; x=1771950214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVLp6F42vh8XKq8PDwrm7Fs38/i5i/QAF9Oiq/UTNvA=;
        b=i5rSGT8gviwAtYba4qh3tEgkANEfityb6WwgMjkcKtgPxIxHka8RZJeE7hhkclob8b
         9beip7/ReUhYUCRBJ9bMG8DfxZ3rmyOzLHArSDPnIEb+jjgY872rua7w+p9JDMfTAsy4
         ZF+3HS5wSuYWx+wz8+0SKxRdtWdZKvjGSM5wMLKZxbZe7wP4yBG40krJnygs4s/k+Cek
         A1PkIFysdD69Uhvy/vm+G2NKWwRCVvq+fEMwWpOaGJIIOyxDr7tAKgMboazyfXj2g89Q
         /KtzaZ60sYU2Mb1uhF62I/1zLpq6h8zNbjkwE59+4RxvYq9M2+3VnVbAWxY90NAL6H1l
         Gz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345414; x=1771950214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVLp6F42vh8XKq8PDwrm7Fs38/i5i/QAF9Oiq/UTNvA=;
        b=O4TS8dunuYhDojYFLPMi5qBfHp874/9w+VfqB/4ANbSXld9fy2ziJQ2GVeTTU5DyFm
         hIsCCOayAAHwEA0vtQ3Y+xcSEcstH/WjOvfsr30EDQxNNzcOrxXS0SYlQJnZ8hLclF2W
         p6P3m1O4tFfEsq7bj2HlF2/3rUg11omvQvSQgd5jUSR3GoAtMs2OCN38aWTjbu3U7hzE
         pB1PJXLiYJ8/xXQgyQiFC9hyWGaXeVQGif5CXaKQDcJgAVOGhtrivdsrLaVOgE5ZOONR
         i9pT+mO6Smk8lbuXrfLcBRpGqawmzxXv9AY94ZFQJBFVRRlRjrZR2lxlkLRqpbCkcebj
         deSw==
X-Forwarded-Encrypted: i=1; AJvYcCWBHBXQDxCNHV5BP7+xh2FkYVPV365bDcV5tZ2HfLaxtj+NsV/fFVvu34aOfbNBx2V4N3mC/fF5hSsNPYHq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0mtJDEHDm6NhgNDlsxbH3zRvdlYtj30UmJ/xX9CNHo6aFs8Lb
	BND0ep/16KxlWjmym2XcdtcjP8Xan0wuo5nSEIIMAq3jzuTN7lvN2ezf2YsdDh5EmpEwY4w+kYL
	GL4KpoNfhTIQg+b41hCn0chxEXROYxCVzil+ibZERoJy+PxRSSSBukJ8PgmhAEfUMml5I
X-Gm-Gg: AZuq6aJL+3qsr5FsIo6HHK+ZYFnS0rmMmu0s9pEMmJMxTNaeXN5uijIHw5BzJfGQ+Vv
	fEQdPExGU3iwTpTcBNk4VSCOnd9vKih20iRbHW8wWwoAfs+FamIgDRzvK9Q4wKoHzimfA7ZjMxl
	UljlD/0JbrpmyjU6DlD0m6vGN/EyXnE5i3J+DxbmDH7peCkGBcFWc8X0tbSbYOOXoiqqZ0C2nW3
	uZEpe41SpTN9yhLZsh9Hzlg8EyU66Fq3kS1cRc8SHFy1FBNNUKHMuqrvhAI8Zhm9ovy+jz+Up1f
	E7S1yvoahDFsWHMKkKF8sgC4sFVfKtkmjJb+BVZ/y+D4GlbPbH2MIYo+o2IZWq9FND53TL2nAOr
	OksVWW6Mcp203UhoIiBBBEjSDYQlnQUkbenuSFqjQxUp0B361rGalNCj3cVqZKLcJ28dapkwDQ7
	I5YzjxmvesQkCXP0PPVObgVhtnmgUx9hD4VyY=
X-Received: by 2002:a05:620a:468b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb424bafc7mr1605744185a.79.1771345413713;
        Tue, 17 Feb 2026 08:23:33 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb424bafc7mr1605740785a.79.1771345413240;
        Tue, 17 Feb 2026 08:23:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f5fsm3969811e87.56.2026.02.17.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:23:32 -0800 (PST)
Date: Tue, 17 Feb 2026 18:23:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] interconnect: qcom: De-acronymize SoC names
Message-ID: <fepfcyqpc7h2nopqbtjfmaejhtb5m2hrfrruzf355n4wc7zwyd@qek476ayuvzx>
References: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130035.281752-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217130035.281752-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzMyBTYWx0ZWRfX+YFQt+H9YOXo
 yhfrarJjyLoH1qXS5pOfN2B6ykoBBPgtWKRzfusr1cFQUz98lfBgc3/SkqW5Od+W1ue2MoXJl6J
 AoTzh4wSx7UoabvoJrAiv//NUieWdN3527jCbwY/QJRni10lQ4E0eG4WqOe0/w7O8Sot/zjVMGv
 yBC4al96KORSlaWr8fnZ3ww6+07aSvxhUQG5P/6lXTz1YgOMGS6emX13pkf4zVi3JBgZC40d0bO
 CzQxV2OPKrOdP52U90QgPc7x4M28KiN2p1X6hNB21BNbpDCLs2X+SeIVXe6YE+inTEcvct/xFUE
 QwBUAqiGqRn/ap6x9+olYqdtZ8toidmjGB3dalJqIfhSOdMG0eHehl43vFZLzotImHHXYT7LNhM
 tuDnbRXhWD7ttNhc4AbPWfn7gumgP/kz+7ypg8ZurA8MK4TOBQE2K8c4jfNgD4Fh9snBhh5VN5U
 gzzhflOnUM8R5vztTHg==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69949606 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=FlZS5g-ABFJi0eqNzBkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DT92KNTc2XPwt7QpvUDhvkbbfKMnclE7
X-Proofpoint-ORIG-GUID: DT92KNTc2XPwt7QpvUDhvkbbfKMnclE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93204-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FEA614E1DD
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 02:00:37PM +0100, Krzysztof Kozlowski wrote:
> Glymur and Kaanapali are codenames of Qualcomm SoCs, not acronyms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  | 4 ++--
>  drivers/interconnect/qcom/glymur.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

