Return-Path: <linux-arm-msm+bounces-93641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKVWDFYjnGn4/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:52:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 839781743E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C063007C96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC1C34FF50;
	Mon, 23 Feb 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmD/ngZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIS4JLf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C93502AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840339; cv=none; b=NTH5G7wfUiaUUsS3MqezqFvA4G+iEZHRPEjZiqEbNG3S2xr3KAJcO3MwDsYW/DF+6aFGUT7oH6MWU4H4WFVF5pkDGEaJAsdrqJdb6wiHgyqlRuQCeEKN/xzToKrSpcQsZlVW7UxztWiOHxp4VAPQMrcXtWm2LMgN6MVxLVcH4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840339; c=relaxed/simple;
	bh=NC8c2KvYVsHDNf0i1l9nwpNQ3EDyGkN49jJW0VSEurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbH7ksOhMJ0RtyJRBSfEfCgLZ9ACidiAvIugYKxL9QVlOpM6LesfLTIF6kOphWTsS8wsrYewZ6LIVrnh++SYJZ861E0zFptlJrNp5ViUgK+7dP5hLJfVimlePkgKVPOT+ro37mojaw8RGy/lnMTk/6tBQu0sGfBMs4RGvGS3des=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmD/ngZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIS4JLf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9bTwr1262788
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoHMTBb8IpVzr1yOCWWsa13m
	cN23kWHrFMIDsOYWxZQ=; b=PmD/ngZdTMeiHW3/nGgDiCP5TsITHRVqW170k49n
	qWSXXuUYbS8lzGkkHqw9bgWAqISRDGuhZhQoyRZv1qTDjQUUbYzzqt59myo/93GF
	onCixjAKIX8+8sySzi5VattQbfqINFnRRgLHUNx7clQMLpdaK/nQaQ7P9gY3U52y
	grodMrdOfHlwAVjWtcYHxbciZlYTMjr5Tl3NkKC6V1gr4Br6JIw6nFrUPcTdBHuk
	34McvIGWFAyqHrShfNLOXeCuEeUSi2HiZvPJsuW1tRuNXkuS3P/f1BFW92t5EIAJ
	PE4x30UCIh3SEUWArj5TSV5HlG7TtyeyJjOhX6xC/NDI8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m91h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:52:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e78c4aa50so2754060a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840337; x=1772445137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
        b=XIS4JLf0lIvGD3+HLoNhPahoBGPidiF00OdJhfGm6/nPXk/3UnR3YEk/99QQAcYizw
         5TtcU8pWqTQGp/CVjBXHKHVcRjoYAS9paQ5ivjnZUoI28SBv+ywyBo19Uio53Bo7MAga
         +gFfJ8/i2Na03HiqE2MZp98y7hs04CFuO3qPtxLCcUAwM1soXPyo4bU7VduDqTyB/2R5
         6WUU5dNOY+uKO5BxU5XtLHAyED01h2pJLgK9xGlD+jlSHuDsIzdWBr9Skp7w3PUZ2Wzo
         osjeKNcFfg0kCjieBc0KyeEHH+yREn3ct9ZFXeKwij9k5RcZlnCnYxCRP4GKzHzWoG5t
         EDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840337; x=1772445137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
        b=LEbqJ/0UEX3FPL7ePzhHq//1O0ijk1KPuEJLNKLQ/xHKJ32cmJ1z/y/tMAjstTWDSG
         pFA52QZ1xkmXn5XuUYuPZKO7/6Phwg4h7u8P0lQW76vFLSxmYicttYpoNxzGgV6d1/vN
         v0ExWI7F8nC1oTzj9vs6zctGXpzmXFivdo+q3/eNcj3ohI4reINFCiCJEqPQH5E3jWek
         Y4iMbdTymqNJ0OWGc9YO1nqRqgJOSS7JnF2ZEhOqcJ9ydr+DmbnaIkOfpaEi9FP9AkQM
         5RLKnGX5xC4hzLQn1nAEbZKEL333GsXx7v4TNbUpZi7ej/aq2PR8D8Ve9i8kyNhKjrnX
         xLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv6N+fLjiI0vUxpn5lfRbfJyTx1HH9l0o4jzZ5DA6SrzehtfcqpKo98iUYs0EjBUW7KLbwLK8mGGl4jPaC@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWWxRGO7TQHt9LQZXRBxtf9tzWkhhSo/kxHGnlIWaBMS0ubCs
	1/c27Saskc6utULDHSe6C/UIa1MBTuc4fqtDDdc9wGvaQv1XMKPqR4CidLkGzaJKk/8Tg0iaZHa
	srDlsTSqBIY3tTPsCecu+wSzwZc6m7sSurMo+SPk7H0NNAQsbw8BVsMNaBctSZagvuzdQ
X-Gm-Gg: AZuq6aJQ3Ic+dHpDslP50rIPB1PkMq4WdOdDyxn0qFB8mg+jV9V0AA/H6brpfIp73Vs
	LeBZWQEgipIVCvGNL9NsEgTU6olPHoiM1nlRsQH5yAjBCW9aq6+f2zT3Xl4aTLtfQL6knijQtsa
	uNLngFGbgU17QP8dLkQUqRV+0wXzTvYSY2eypdRVJ139Lzdp4DoWgH6xjF3RBGVh3aMKXP/hubZ
	0yRFqYkxlg1ZZQ2o7OsCBT5c/tSY8A33W37yq8TS/0kgyEHclLrPg1MkVC1VR4ujwoIIgVowJRl
	X9/tMz90ZEp/1+ijcrRgkJFnvIktInOoKQCO6wDQ5oRnk3Rk8ZAIft3pdSqFV5y2YpDCv02x4t8
	832jke4UhxIhEOWnde2byeh7F4zYQwoMO8VM=
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id adf61e73a8af0-39545ec839bmr6508773637.25.1771840337210;
        Mon, 23 Feb 2026 01:52:17 -0800 (PST)
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id adf61e73a8af0-39545ec839bmr6508755637.25.1771840336687;
        Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a735csm6444453a12.12.2026.02.23.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Date: Mon, 23 Feb 2026 15:22:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+ 2/9] net: stmmac: qcom-ethqos: move
 ethqos_set_serdes_speed()
Message-ID: <aZwjSe5zF1+fKoGa@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c2351 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=4YUTyhlxiuLjCXpWR_UA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX7jxKavOiY2Iu
 fia6k7tp+l3KPvc3cuZwdKDpyg1I7xzFD98Y1JYl5A6undZWroZOfzCh+cj+EO+7OBOTX4Z39bZ
 O2Fvt4EyU4zGW/J8QzouykjcAIC+j1He3KyDkl/araatrZ55Vx0369OjUJJuxqaiRCezznUH71P
 uPyo/PsLk4JCaUBSBa//11t00ZEBnp9zaC6t80pzI8O7W00peehYrSVhQG25EQn7y0pFiqBm/sa
 QVeuLfyJSnvD5Zn1NrJB7+XNj25NGfGL42jRnKFN0ogvubMYQeJ3LC7d7UNn9pia2wKxm1yoo0I
 K0h213Mg3a9P2tzdtb4sG63CkNa+XOMgFTOb3pwUlzD2A+k8oogKfpwMNDjb0332NJcjvoYJ9rj
 gxalJAwifG5TOmUwuzqfYL4w6XgRS8fc5WsHBCw5TlQ6j2tPEnqHBZGEJJnA2j73ATHugoT8g0j
 kRj64Oht6Db6czCTx5g==
X-Proofpoint-ORIG-GUID: jsdH_-LVzHdWugrLwQBSzJyuVlIN7ynA
X-Proofpoint-GUID: jsdH_-LVzHdWugrLwQBSzJyuVlIN7ynA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084
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
	TAGGED_FROM(0.00)[bounces-93641-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 839781743E8
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:50:34PM +0000, Russell King (Oracle) wrote:
> Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
> simplify the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

