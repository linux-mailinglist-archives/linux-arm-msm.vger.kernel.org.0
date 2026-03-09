Return-Path: <linux-arm-msm+bounces-96219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COQiGXqqrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:09:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DF2379ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F2F1301F6A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E86396D22;
	Mon,  9 Mar 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqCeTolU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPh/Sy+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A9396B97
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054575; cv=none; b=RdjAmuAE47YyH1zuv8p/QhWRHYSSuBFq8kTVJ0ZUkjQJNmE5ZGE8OaR1a2izxqud6P1t5bH1+AZt5WJjGWJ5EGQ8YxhFWkaX0uNQ6rSyOlNMUdIvV+WZKjfiGgDC2TpmPVfV2SFssDOEEoVbJy/4uPpYvHm7xToUH0x3zFytmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054575; c=relaxed/simple;
	bh=kXdAlIMWwWWj8alseEzHkxCbtrX3BttbUv0wSD5JaAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5GawAEnF2aEXq7YistnOto4bwOZGHy0j7raEeVwmYrZmtujZ94um7Lzq8OyKFjycqxYt6mD5qohgc+9pnBQpxCyBH0WkfQs//ZQcmk7e4lZFErNRlFC+BaV6Pz5mNDZ2GMDyLRpJ6JsgdC3xne9CFQUWxug8OTL7OpAb7najnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqCeTolU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPh/Sy+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297E4273346668
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9GcFU1X0YgGaDvQY7T0H3DK5
	6rvaH9tLv7mLbV4BabU=; b=PqCeTolUyDUnfQtvNv37mNjqVxegnXKUYob3z2lG
	XphlgQjhQnMquTaJQt7KF2g+f5/98CZ3ail8ZOhukncqxq5WKInf2DZL9bnftxgK
	/FYGhtbpYUYQbYqm3EjwwYAMvrOu1i8U+leKtQFkxaUDN+aC1PDvV/qUzLX4k9ij
	wLYuk64n7KpwuMgkHC+219t+94GHSEewV+gh5CQRCnjiKdv0/E6b19TciOUlCtFR
	wxYLt6veXcikC7E483Dm35micc3IxfR3E46Up/kypL1+Dz4Hm2pbHv4b0uIlCnOI
	4oRIxavDO5KUbDFFXCQlzUd19z0kDB8yAeimdXmFgxkeXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn8ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:09:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8964so919128b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054573; x=1773659373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=RPh/Sy+ifsfqLxRJf1a+srvi/3adq8HtRZHwLgN8j9K9IYi3uQLLLdvXIFEqA8U8I8
         Zed0N0frCO7O8sBjVTnDyRjEySTvR7MokMEVhbDxAdeoJQZG5RaT0LX3ajMxKbF5S/Ar
         MfMaQ6XOBlhUelvcWjNquVxfIMFi3qgg5yZTvqhdsIFLnvxsdQPOy1vAQX9Ug7vcwWN3
         v1bRNe+m+FUKcgKV8mK2eaGekFC7eqz8fylyDqorN0jvIvFg8OYQvLQ7nRo4E51l/JgY
         sG5Ykyt1OndFpyffPBeMbfYGtitgcGCnh9LjKVCmrpRwnplpTNK5NPPQVZSw916gpS9v
         /z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054573; x=1773659373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=aiYseJKRNHRnjHPSE8/3vCCwLyFDnolLpPotX0/jr03++C0U27fgUKNm2Ha+TajFms
         Olc+T3+88j1ElnKihA8fQtsEm1yxuPeHY60Fz1Lxo+FC5AgClDLdM1v6b710amGTculO
         IkYo8zwsuKNasKjZYbGW9hW0lINvFrtUHyD543CRylNllPeAgy1nnMjtM+vLm6HGhpVN
         BqTrJOjpv+zuwc4iqUKXYfIIzqOqIeMl7H0koX67So01S72kCE4BTwrUVEeDYajwgXvN
         acKiFvDMRMOC9x+Qmr0meOO0HnzX0ANk4WraJbheCRcwf7/DpUgl2Yl7CNhw6mz2MkGf
         Apng==
X-Forwarded-Encrypted: i=1; AJvYcCUZMDBB6zCuQfKekMrc7B8271P1QVhDbzzdM+3nRbn5Gz0x7yTRMBOLyY+DVju5jCoH5QC6j4v+iuYAiLWc@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqGUGDizFJ3EjFmFdrJSdWI3e73L4oRYS1Lgr8apf7HlnLoSf
	XwY68j/txQLFXzYDvBOiaoFynkyyLhNLw2X51mripL/CvYURTf5QtNm8wE11gBT++ALjBFuk6nN
	g6ekBxR1dzyps0xF69IFzIiDYj3wm8Ckc3m3V5L+tCuiLXcpFUTnaPpYdKqxOtPzpuK0D
X-Gm-Gg: ATEYQzzE2lE2vBPZjfZO6SUh9P4wO0g/0jgOiIp/zn1Ri4c2y1RL6hlaN3oAZYPvXTx
	3Ildib+HVJTIFDM1x63PWqXa4pkw5AicgdqZNRyxkirBZSa26iOusXPaSJkhtRdJD2TVdLbwAFB
	3orK1XqlLRQSuP0XSrZ3kFUUWJ9FDncw5RgyN8y3TkYQw+WsSyuC9mNhIkIdG2QlrDfq6lRiyb4
	NxEDR8jq2flEJsv5XxdCXLhKExJfcYBHVco28HjqOfryR4LAxt1Ca/7LBwT6PlmAfN3vzI+vIZH
	8uzoM0o9UBojOkSx9jPX7Or3tNs9XuPqSPbnjrxNYxsgSOTDkiXZ/7RjS+X8fahZ3Tv5f1IGABo
	jy9rN0G0WX3V3ZskonY7u8qiO5VcIVTPYKHs=
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010413b3a.8.1773054573139;
        Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010380b3a.8.1773054572661;
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6f7sm11967292b3a.23.2026.03.09.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:39:22 +0530
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
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: convert
 plat_stmmacenet_data booleans to type bool
Message-ID: <aa6qYo+1san7jL/7@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aeaa6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=91TNVAZHAA1vfZ95losA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: FZ-of23O0sHlyiegdgKErxeSgKqcEX_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX9yOlv7VrXG/6
 biW0lGS85o7CXB9Zcx9RcOZMRq3tjBTzkBA3qf/IC+0ntSFN6+HkQooCg/b2DnYsM9Lwg4S623y
 +mwj/Kp4pZ738g4GVxVMlTdojXb1yIq8j82UlE5NvAX8nXAKP2iuaXNn59TFTfWllmCsIRgZf1Q
 fDMCBxd3ooRYb3tYfz9C8iJPkHupHSUmuW/bksSyOcsjfH4MAvZ2mOuRZ0ThGjKLPsjKec/hJl5
 QF1tbbsRre25JTXd2nT//MmsK+nOGx40Gzs/e3aSmbvMGBOHfzbrQU2Pry/jnj6wg5exjZ5V9PJ
 OI177uU3BXCL/8+DLW9Iw3R77YBswMTb7xt2QAQjf5NVG3zenV/zUFNUeRVew6pnry4yI6uE8qo
 nAUoVgX2FcngtM6EaSOLl7/sarNpcJVTNPn90NrK2gDIW74nw7n1wn2FS/m/CFL1hjgaFNdRiJ1
 ssOiIKrbudCerv8escQ==
X-Proofpoint-GUID: FZ-of23O0sHlyiegdgKErxeSgKqcEX_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: 0C4DF2379ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96219-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,armlinux.org.uk:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:23AM +0000, Russell King (Oracle) wrote:
> Convert members of struct plat_stmmacenet_data that are booleans to
> type 'bool' and ensure their initialisers are true/false. Move the
> has_xxx for the GMAC cores together, and move the COE members to the
> end of the list of bool to avoid unused holes in the struct.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

