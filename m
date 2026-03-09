Return-Path: <linux-arm-msm+bounces-96218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PVlLj6rrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:13:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 146DF237ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C8930A4ACF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CC4396B8F;
	Mon,  9 Mar 2026 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub24Gv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/IEdR+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C1396D30
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054506; cv=none; b=L6wttMmGhmHWeQudBSp8bhpkSUM7xXGAdmXikiNIo7WJnMdyxXiedHiqM03Un7XjfdNpg7qShTlxLAklBw+19MKqDbbWewM16OiMQQlb78uSXFnHtwFeIVUtZJRI6Qey1ZvT88FBSEespths6vNvlCyQPW9KvF3XS4o/QMr5SNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054506; c=relaxed/simple;
	bh=haZYw/rVRG4cTY6XlUED1nGXUhf7pYB6b6bzXHZlX40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyJEYROLrXPInH1XQdvgRNQbsdLrX+u3FlH7IPYSmPw8hdmSiybQd05Mk0cvjYpP/fqSoMnECPqDWfTxZWRrMId+KaHBgryVvzkT7K02Iizi3jnB+VHL7KEyiNUKpj6KDHsLnLOwzo8b27Snqx1K4GObojdRbrvqfp0JCSOtuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub24Gv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/IEdR+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298A6G33089238
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxw4us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73b1376f98so4640088a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=i/IEdR+bcJoT4s1jMvcducB1mjixJC0TpvNWdGyRYiktxJLfrf4kRAkqWtEweAJIWq
         9fGYoNwMFcmJuiwo4mDDVUl5RDVU7EZWx49EmUutOBksKIhBg0adBpVLDnQTpIfteqX+
         vJoGDt+mnQuOV3/q89PXuyt8WLWKud08IOSarX+GNdu9qq4DLXVs2D9N1dcxBdA4MZAp
         vPvl10hDOGhyj9UNxqPsqQsb8gW+3xnoFeFoLg/k348d6kS9eQeitndVvAEDieFFbO1j
         8NhMHoVcXEQ/S6ROTcHrctKIpUI0R094TqxpkpZDIaPjZAbiFBV5tQx1XMy24NnYbmgd
         9Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=Q7N3ZYHjW8rBms/qECkYtIGhTgQy7+Xwk4rFK7bvow51tfyezX0VBleXhX+NC2YOJJ
         +1+jLaeyDzqNGjKtwSr5V99ia+XBwKgCaR9VutUl+L9ltpRkeRkHxibW6uk5C/QrK5vf
         +WJXNhd4WCcP2x2hhkheodnMUjZnpFy24R1CvGVwKS/pimIHoyLn61zeBek5CH2hsgxg
         xCAyLwhoIJciueeEf9JViw7dS/fQUoAwzh60HwOoTWVKHmio/dpMwXcGYjh+DC514sQK
         0Hdms9Imf84uEr+LXTWFOnywP4C0vtSbzBKAYn2tBuR3PCqFNYxbv42ivNy4GZVbzWyA
         5ZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP6XIH5YjTmaidDLZjsWrEbNE+FEHSynHiL+J0k+SiLEL6z0izaZ1BWplKvWAKxuSf6r4GmNSr1/2i5/VJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/W2YsiO8S9USzaWZJfsY3RkIYKWk3HhsJmz4GgcQThO1KWW9
	ABnczMRBK+vYMBPh0N4j/eTb6Z+VIvlptvqq9xMBpDPicTs7BgcUI3ucd+wC+J24CAfm2vw1y4d
	FDhbRZIeWGbpBloDZvi7Heei77CZb2d1lImFILdZuU3ggS0q5fZO2Lz5Vi4cTWCyqg7v3
X-Gm-Gg: ATEYQzzM/7RqZe/zaygk7FBHB4DOSTQYJiOKNYmYzTlxz9oM9fNg9qRAuBH7emvSRPI
	6nGQ5L7w6xwxBkjCI+hcxS+Bch30H4jXZ2hmTNDbOVZFymFFwvsPg/ukb7Y+4iPoxfI1NM+3rBF
	ueqMc9iCFxHXmTXvU6gz2Zx+wXZzSZXxNkiw5mnFfgfyIbw915avqs21OSaDzua5VATTrEYisVU
	MZ2gzTeoUv5YuRNwpDjXfcBOqv+0iCZxJZdNi7p5lalvQqAyeaV/I2UCS2xQluq9uA6/AH95VRB
	qo1OC76+x4xrrXvuV3dl2khW3Q3MAIDpTf9imlzPxeArR26FUCA2i4f28ZhbheB9sm0l6L0VCX1
	cC9LczXLwe9AJWFyK2aq9YRIUPdXBkTPmlhw=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232877b3a.34.1773054503060;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX5NEQZaM5fQVy
 kVaKhzFLfo7P9crwvAd2suR1XFy2mbbiOwWLK2C6Sg+LwUTvU9YjIpGICj6+Us/DBgv6isDriIZ
 Qz1CXaLWgrqkq7n/EkWiuvFCeu6fMVfVmhqoP/dbbyEvX6IK/BkOGFb+zyHF5GdxSvfCOBH1nUK
 nWxXc06nztdqXpZCByh55H2x95nJyO2l1WpKr4wqYMCxmeIFXjuXrr0iSGB0Evu87OFGtlAvQ3c
 hA+RiZROq9zKpn4rpJbU19Zz+IaGvT+tiBzM7Dky3XpESvoC8FTS75rdy1VKJ/j52NyVzcxH9Zl
 UtybAgoX7wcjE147qTthqGAVGbjLgFhqT4bzR7z8LsJ9+4Duxs3yvMGNkks9IYrf5uCmQuHBZMF
 OPvxgZxPpfVvRyib2X5PNzPUJKvmRLiBxp+ks4Uak/I0Kb7Xp5EfvbkthJKFfuAVk08I7HPbEKG
 aArgZZk9t3EcF/XWdpA==
X-Proofpoint-ORIG-GUID: MDSSZN3YixBicQxetrpv_YkiSXlazZXj
X-Proofpoint-GUID: MDSSZN3YixBicQxetrpv_YkiSXlazZXj
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-Rspamd-Queue-Id: 146DF237ADD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96218-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

