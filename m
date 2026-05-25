Return-Path: <linux-arm-msm+bounces-109636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOf+LfQuFGqUKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:13:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9B5C9CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C81304CE88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB61337DAC0;
	Mon, 25 May 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVS+dLy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtblI8Ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484443112AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707284; cv=none; b=pviKYUFoYTb4ShwPyonQKjPpJgt+IDPyoYnaMdcCry0zjuKQ6VPfIMNDW4SEnfNQF4VRXOtYYLrU5FPGzzL7cPgull9KCDnY/ehCf7aYsF5eW/0QDhRFMmd2X5yNXv37mMZt8LrA8aXgFUbQfLOnMCCnccPXEsc9gcSKt/c1Azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707284; c=relaxed/simple;
	bh=SRrxAHl1aPSl0RA0gCDQFT+KIos9pY4JXr0PnQa3AZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea/i28A3NuY5B1ZLbklUKnxEc/mKeORSK7L6obe7ZvCpsC0EEgg8EfnfuVRMAfAVieA3HuSEe5Y7ACPzD2WbLBTYeibtxXKVSFZnw9gdL+3cJrAQ8pAFyl8WKABrza1A62TD0CIx7xoqf5r+O/QJ1KdUY2ap/4nL25QNeYsPS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVS+dLy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtblI8Ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EKEA079206
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BQBUQK+ERcgosuGR7NTC0wOZ
	R9xugN2ow/YBjTyK1Iw=; b=XVS+dLy/RFtu826qPtQMuxk+BHyD5ZXsASq4GYvG
	1UhkAaRZLGsZS1qqo60dlz+3TKh0TzAi0METbxd8pdlrtVv+XkxXo9f5XgSGEp33
	PQGy8s0G436YEymGx7nlWEQhA7U+E7r/zybdER/dTe/2pZCzf7KNSXOxQZl4uKVN
	xJDF6xqEXG5+TL8fkr8lfDSkl+DF7E2ZEie2mV261jkg9ZPZ9rIofjtsvYNYlr8y
	E8l0tHGmzbyVD+jAGNRwMc633sdcFVgqL0l77S8ZkdEtcWyrwwepctsdTGCdcHSD
	lCq4ZOYOv8UvfWLcXDDVr7mZapD3d47NCnF9OO1wxVLdxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8ct0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:08:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6322654bb6eso13920587137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707282; x=1780312082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=GtblI8IkDl1TuCiBeqtqTyzjvXdgwL3DUGXglqIGRleIDxHtRKr4S8CMMZMkEch6lG
         o9Z79etXmPudfx7rouYI97NgW3nbidNUNrRWisZ6rW6BYxqsHnM9NKv60QpgauZyjPan
         c1WCygQj0LOM/h6p08Qhw9FiUn//Wh6jW55mjbIUN1YyogamaFrw+z2GnoxexeJQyg0e
         ppfxpjD1yOsvtj18AcD3ita/4zpfZQ3TzRlg4N1/lsO6Bl56k+O1l14AS0W+74jJYfYv
         iZp63ioVQJOjBqpH5KQdoXxcnejiKJ6DCiSthoiFAZCxReepKt4OyQKHPMUGVKhjh4kc
         DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707282; x=1780312082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=mvAjWRtczqKOC5GfeiNES1j1WVl4cibXHm95ccF4T5F6QV87szJJBDS9w7wgKulf9d
         c97K3gtxgxf6Q6B5SRm336JAOBx9y1HrldvYvjVwWKVLIxhmmyn0fSgIjrIknRfpxSkx
         HX1PP33O8utPDmubgHDsM00EFWylX5R4Ip2H5kUPZ38clsRfADgxSNWWpHuRrZzORLGu
         j4eUpYCxOH0+Ah7VN51SK66qMgX6J3KkDkqqqj02RMRtK+F3EPcKSHI53B9Fr9DjucOE
         rpwHF61RfXh0q9n9BvvDzC3+iZa5wNezT7FZNVh0APsYMLvLhZAC4Jf7v0gQsZiahZN3
         8eqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u+qS6LQAS2VOgsXNRle15qX2z6uWgeoQoOCAK2c+mc9LWmMNORIpN34sWWvYoFVAaJQyNh2tQeKDX2ozH@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1jL3FOy26dYBIhyY+j8azhjxzQSxR0/WM79q6z3QX3aNbjIY
	msulUGQYAQcqrLY7kdM3MxPjX7OwEWYBH9JYIwFCkEfPv5j7wmSlXfNfkY4s/fh3V51EBY4pIw1
	X8JFPZAQDY/ntn/3D3lEi809KeES0Ii3hEJ46eC7kg8fVDEBhVAfcxvofACeQRA5LI/4S
X-Gm-Gg: Acq92OFjI28Mda0m9TVDp0tfG0L8j3GdB5W0SciUSdNSmsFZLRX58la2YesH+JNofod
	+pnuiPEinHANYu7p+at57kvMMsx7mHz+ZR6fYOeO+VvC0DZ88jD6WPZMeFaLNq9OyP8lXQeVeMC
	xEh4TixKTGCYzTjqXPGJhKd9X37O8Rh3bf4mNNHq0rypzIOuTQnBUmeUXFZcvrG9fYyk8yri9cQ
	LySBId8ifCzgyXMSNuXfSAgnlluyLE9n5BOMFa+UZbWGM8hlYFd+4CRbx3GoTrS5WAmKAL2B8Fy
	4DXUwI+68s9GAf62ltAiLuAM0TVCpxJsoYSpFM8/2gxiub7aY+t2MzKkUFjqqls82TxurTriOEQ
	H/34itCP/sKtqbL+83Cun6+0oHB0Z9mAS8cu9gLNtF0eMTAwFUzUI9grSEocIK/Il9uOebSerZW
	T0uFqIQc1Q5NU5iCbxsthrTRqEsG//bmqWfsY=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416032137.30.1779707281660;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416011137.30.1779707281261;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f1csm2578738e87.70.2026.05.25.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:08:00 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
Message-ID: <kmscrht56ljnkntponlvzuumxgdm3d5s6ttye4hwtq3uaykwsj@z3pyzcib7pk6>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a142d92 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: knDRBRosvHCnWGlQL5BXHcxb00hkHIN9
X-Proofpoint-GUID: knDRBRosvHCnWGlQL5BXHcxb00hkHIN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX1axPmxfn6KHs
 brHbyy+kNvg0QQ1fu5lIVqLmn4+cwPfKep7vo+sOSapPSxf0smT0cl3UoC7B21aiDWIlJGUZhpX
 DxDyZ40lnjnM4zNAlCMUBUaJr/xUb/PX9sDqV9hiZas2X0w0sYmvF9MxTENBv9II9Us0pgQwEaF
 6yyK0X31DWswVIGy6L4sp2be4ColzvlkD2PgPYWK3zX9lj3ER8JoH2pjEDnBfMRLhISCFbkr/3F
 x6eKnlE7ufk0kgspXH86kp5RKARjkpugaav/xBzwMEr9QYndGVpHZRMfo8K0+kAY77HCRkRVAsj
 LjCMQMqPEZiCZ5mCXnqOnNywA5Hgu0KL57fQCRXQCu1nDgzXFQNxs7tf9LkmxLLRRKMF9IdBaoI
 F6KTCYUV/iK6bT9LeKsVwZS/Ii/fl/xK0cm3kmRSIaKcpmb/5z11e+LJJuz6I7Jb7Ohef4Z+6Hy
 X71q18E78gUM541edWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
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
	TAGGED_FROM(0.00)[bounces-109636-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 2BF9B5C9CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:07PM +0530, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  10 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-eliza.c | 607 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

