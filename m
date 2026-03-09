Return-Path: <linux-arm-msm+bounces-96217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHWaMN2qrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:11:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D243237A86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08566301952D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C736C395263;
	Mon,  9 Mar 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT5pkRzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSeTBr5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159C39527B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054418; cv=none; b=F5L29RmKc112/2IAHzSt1TxY7fw3s/KE26gl03XBiQEEwk6UUfoARiwmVo5yAtFx4dzxqStRK/l/IYnqen4z2u/vgAVNZu/rqTCxbdh7Vb7UwZ3h5Z/DPVf26uENikjdturTj+UWAafFH0uG4CjG0x/fW841kzZ4Md4hIjA2Cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054418; c=relaxed/simple;
	bh=7jFrjfVpNEF7+5pofyTW+BP7utiTtPBz1JY9cb1Gn74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvUPXkVX4K8tl7OA4/3O01T3ai29Pp6AZVcmQaKlxmFFK6A+GBfD2UwU3u+C9ghGW3Mk07wKJbBtFAoBDImlZOH3LimU9bcb/XH0Y1/KIVkLcsh/iRndyyyZA9Rg2lIMyYrYGt4d0uLIrukISjaNBJr8i5ZS3Y6l68vBJ06KwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT5pkRzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSeTBr5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6hB22195230
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
	7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
	xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
	tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
	EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
	O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
	Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u866u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7387c70046so2219519a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054415; x=1773659215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=FSeTBr5ept85WxlDxOhu1F2+OSu4YmlaDD9bdIBjQPKHyL7sAd4Pm1KtOtBJGkYFgH
         vE5fA/MYTaF8X1e1o/5GTRsfYSIdCO7A0UfOMBQ70/DXFwpPo6SgXGKhnd0ru53ZW47I
         YMyMgNIycwfPlw1mR48soKXvSSLo6q9y9iaDjX4o5JKCZSkIpdKCjN0T2ozV33a8oyVB
         xH8QYudpgX0AwkanoXCEYlyI/X6Uu0GTUIW9pJkUaj6ij7ssXJ6ZjCXiae7CelMjsdTm
         +r9moat5F4nQWgw61W+wRbBZ5FwqALXWctcjUr/CHszQnvY8frFucoZST64EAUFrMin3
         UVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054415; x=1773659215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=Z/tUPPXFq7ThG7IpQQ6VXFuM0Sspv1iWgQTQYHobZ48TYUzDM56P/WdZqBZ54cn8kT
         I0E6aVM0pwFBd2OhD9WUHOOLep4BrP1zp2YQT0bO942hLT8d8MSihPd5PXb9Z4KpHKzt
         xm+SL60RQdVSpv0aAS8TndCDUFMy77EmKv/8CugVxj7hclWCIrnG8tc+ZKIhR0wGEpEV
         oBwQo3TKopZxhBgoMAMEffEOnaTbAsptE40x7DxFHKfY0fV5j1sJQPMxtJnyGPVF2hZi
         2aaHsYXUwG2bPHM/GCCE4vphpDvAFvbvpCYcE17dqrgolkOFH9lwMUsjmlPTjtWKged7
         jfEA==
X-Forwarded-Encrypted: i=1; AJvYcCVQOLF2TIXDyNBYLWtKE+sEptb5ZFdtur0nHXnzD9XHaLisvxOaDyJwfADtIiGidxFbmKHUPLAnihM8ZBJx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28h7I1edF71F2b7ioTgBIFWc/ISQfWU44PlTJAKSRUDZikMB5
	5To+uzIIwjZVfE2QGXy1e7m/ZPKVyIQtsiz3LHL0yLArwNMc7dGo9Gx2nJz2Y6xLB2Q3Gwbk2Xk
	MrvmlbO9E+AdSJVHoFlZSoUluG/J/xGw3jwnWd805T7VAwhPgOXunT4/qFm1alL/zXPxR
X-Gm-Gg: ATEYQzzW4iUj0rp7imySAxXzRSlai5AzZ/uduJjzD4yctZZS3aKm1ejritx1j/W/a4N
	Pmu5ycBSL0rYzAhrNRgN9v1b0rl0/MjRsg52LNCBjD0KBQD6aNvxzhTgmsIKHIwEpHGtoAEFQpq
	ElZuYUsvmn1JmkEWvduwKH1BeUlEfjqd1HvkBZ5t9oFyiD4BygSVlxeSa8xiEf/neGvhLJfLdM+
	FhgTBh+XhcjW7n87NkUKdeOw4iLVF+k9KACNmJIgvuUt1PzYrn63nWdjnxf2v+51ZIFRGFFU2Du
	mdhR9Yj57RgoNGqmG2W7YWM0Du0Cbjj95A94+SWkxZLMscVIs6HsPJKUF1a7xYKc69Hh8Ng+SMe
	W00n6A5dVmh+B8PYEyjn6kFqnjHdVC49Y/Oc=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443419a91.34.1773054415395;
        Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906;
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Proofpoint-GUID: jUaOD8IdJNRJjrtWbzXyo6TCQ2jy9Mar
X-Proofpoint-ORIG-GUID: jUaOD8IdJNRJjrtWbzXyo6TCQ2jy9Mar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX+gRuqwdZj07V
 SpG9mJzhQB6jq8Lf87uYN08l8B1z3l/RtaYlKfe3qkgYIBoSnZzjpOwhBxTSs4ce9dYKb81C/f/
 KjilEZbaxwiQcnhwepFv1ZFNrlcsJCI//2XB7PHYJXNL6tJS8rV3gAI0mE35PkVNjejl+2kk/P/
 JEJIX1pwFu7QhZ8WOuD+bKRf1PJm+//tnwMfkeM0SZvHb0LhODXnRv8QAKb1VA05zEkUbu6veSP
 VDBmDRyZQg9ORjUmPuttmYffL8hQtbHXiHh95RKtoCpBPNP0xolZvM1MwdHaieuvtV5TOHaCmlY
 CyilWzUUUDwskf1heVlOA0ftAFq4gLeFO+kJU6cM+Nd2nJPTH880F1+SDfkSJIsjj/oKjFZrmsq
 TSepxc34fSx3ebY568pKB96S/+td3ppipqwz0+pMU0cIArRnHw4Bkvp3OIJD474wvi+vadzu58r
 t8RtgajVEEHX0EkGpYA==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: 2D243237A86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96217-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

