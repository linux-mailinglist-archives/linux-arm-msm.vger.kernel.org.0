Return-Path: <linux-arm-msm+bounces-97015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLMdNfOAsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:49:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AF265B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDB7831BB5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81735CB67;
	Wed, 11 Mar 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kw2J3vh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4vAyA7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D21369215
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240331; cv=none; b=tBl8g+G5nBibA5lShJ2ZmWnC0TG/O2KWpHONo5RUv2HtAOJyaAEjzhpzGtuU7wjilHHB5x3pmo/K+qRL7MChxX6IvmxkP8wmbU5brVx8DTZmc+J2FsmSZAeaVlPSITwPGv5z6wn1jO+jkSE5/gjFbjw9L59dO/qGNh7m9ZtXgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240331; c=relaxed/simple;
	bh=Pz3LSqnSgZPO+sikjWgv6OurkSgn5CfbQsARgMnvaBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlptwFoSrPR2Qs7SPb740E2RiLsVeKy4OnhrcH4EDW9Tf2jJ8cbphcgAeMngeeu1jyVVLzGvMBtou3BeFLHEmNb/pj+XxrvPPIIprZeOA0LudNH9hEEkTmHFyuDU3k4hYI89y8/MGtjunWgo/r+ZCtcxziIWEMgM98GtLh4kibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kw2J3vh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4vAyA7Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9jKc7248344
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hO8HenrdBwBFfXwe3brj0XRv
	Cy9c54B12m4F6gx96VA=; b=kw2J3vh7ymtz/kDj+rEzGHXzcJGFkEUWUPf0ur5W
	maaox5TuiYEjdMEYhxPsDWVJjVIIGGq4qgtySqX096u/zI6YkLGAnsB/EpWbaLTS
	IRjPKY/8/AKFPLIvnifmhm8HELFgKZZOgSfKFtu6OKNNXcNRruuUkUSnirZePBBA
	ejbUsKOAtg/iYkz4iTLIwGSkOtE4S624djbaY0uwbMAc1EfuyVko69zrVUnb4VMo
	ZwoPKd6BqvGv/1wV1Ls9FrrAEYoR8yTR6jMW6TLTFNdoLnxKgXYPFS5LzwssU9zi
	sJ23EtaBBIgq7TFOGJkfMB1wOehe0KK2vs0cDDfDBb9grw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv140wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9483e4a8662so19610992241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240328; x=1773845128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=B4vAyA7ZoA7/pE+dmLvo3zgv5z9j2AJPouUUs65w3nILLTlH8jui3lLQamlbzb4Wmv
         6Qto615czzbBHChDtB241kerC+WmHnQnqM4qeJyoFlQcDjdq+AT7v+/MqxtkhXRydArW
         vURqN9lIzMjEOMPX+U8oYsFbT3wvucY03X+TA/yxGQbU3CMjQWeq3qmQRYjdNB0MPxde
         R+/fqqMKw2rDmUgBegSw7lS5emUMYjFB19T4X9h0SvPv13qpVlEkPYzoQ9oWPuPso6yu
         qoPAcHmBZ52yRykuFjvnUOfnYks6EKFHjG9z5p0wdph8Vj4hIP33YHuYC60xfv7wofy6
         GXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240328; x=1773845128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=B55xrJtD1oMVSM5+1/dkdV7JUAT+4W/F3a8iFwGjT/EIOxgH5rZNcX5PQirC2zhcpI
         +yA6klvsIG+naylm3WiN5KXXpccV1w6irYID4enTX0+Sur/mdzBiCaqpehPjuOKX1680
         sPW9ZtfTiimrBtmZZ2+4mRPqGNvSgJoL04xzkNxvXCclC8pM3aSIwwD2ktlc67J155rf
         hyyAyIFrmU0H/mxAKy/+eCXJnyUSdhZrY7el+l9u3JRGaiMk5uBSY8DuSMSV53JXQK9z
         TKdjrplYJ9120AkU5PVW6yt88tKXQq9DumfJqNKfjrO8zjwfcLv5ytF6LzF4FzSx96WU
         QeMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbQLvtf8u6duoGr6g4AhZxJ6pK5J7o0kWxKrEwxPhtKJ9mOj7wJ6jFCYbGrm3n289Kyqk7yBk4/+G7EIGT@vger.kernel.org
X-Gm-Message-State: AOJu0YyKD73NzW1emHbUDGorJAdS+rNHqAmovOEpWkBlbZbihMo392sR
	UngWPuwkT2I6edubjZW64cfQwLTgvjQnrJISRz3g3CpPVFmze66Y6QyAroBHljlyqKHFsc7o9bM
	x4MVsVHyyqkSeQj1fs+wORsewHnqv/p5HKx69QzRvEdKR+rXxXZ7oKyolQ548I6n4lpQ7
X-Gm-Gg: ATEYQzwJBSqnYS8ta8/TkWIEPIG1RdIEe0tOrE+es5fswfrQmR/HSt9wBix1lEXaDop
	znLPXsFoo/m5nl8lohjKDzCm7Eu0mOm277v8I1itykONAQMHIgMbTZfYvZjHQuZGioAFB1QUGn2
	7rWV/23Jvo3QNSWhWVaZM5/1XW2BtBh9DSZpSk/fL/IwqfVWEImK4d0GFNJfRCSfIItv1pH5/uh
	qPUcombGCge/gVKuqneoI5eAnRwiBvvgy3AKtAeCx1FM+K1fZthCj3GWxJxYaryHn8rEfhnhcE4
	bP2GLcwvliz10/+mDj9HC14MD1daM2yf3GAhBRXLN3rllQVyNQRVc2nFNhsZ1DuoJn7L1wXHRQq
	D0CpisvLSvAi8izqr8RPeAAmXrwiQ3IV+wkeFdt5OZSkuhvyTSlTM6kTBxWMRHqi5Y6YQ0ZBd2R
	AsE71xmPiW+Q6DbOM0aLy/z1qu852qc8eml4A=
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821290137.8.1773240328580;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821281137.8.1773240328114;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm3872241fa.33.2026.03.11.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:45:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Message-ID: <mb5x4jspf4fwinimjnfhlf45gee2bajqxcp2nglqqkfnulnmbl@4lvhh2llnxjj>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfXxaJ/nnez63L3
 z2Olr6h9PR4jbYRwLRpQQQoY8Y27iUltt4Y6f/+PpMyzxUfHTwIx4L35RzMGRnXsDf/XZek6ZhB
 PbO8FayhIKsYfkzm3GaQtqcXyUbRCr2y8Y9FW6DkXq2l2KqBdjSTJe4eoB1RmK3pBbasz8szyDF
 wewZap44JtEofuLRL1uqC5zSjMrx7+pJjrQ2huEcOkpPuGyJ6DbB1siFZZyMj42pU5dhqnjCo02
 hmNbuVNRHbtB6GyBebv4EdkG1BlhePATEgF7ldRY9SW+uPCTFq+Fw4YXRz9FQ97bRBwla/SpiFz
 0DLiG4inXfmzt9ESXLOZbQ8u+tcvmMdVbjnUXnvLOsPi11f+6ZRZYKLSdng30xdhFURv0cTGWTz
 oFk1DnvISNmLQYy0RZejOMHWB9yikBgV6CkwC4Kdq7BfxCB+sVX6PzPs+w6NM4QFCxSPqb4Jcmn
 TCfqn6GkwaXg1c4E2Qg==
X-Proofpoint-GUID: NmvvLYOqaz5SgrkcbUYBf7YoBNQOK6jB
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b18009 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: NmvvLYOqaz5SgrkcbUYBf7YoBNQOK6jB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97015-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 467AF265B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:46PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    8 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq5210.c | 1156 ++++++++++++++++++++++++++++++++
>  3 files changed, 1165 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

