Return-Path: <linux-arm-msm+bounces-93636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPZUMsohnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:45:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0C1741F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C43E83003E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF6D1D5147;
	Mon, 23 Feb 2026 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2MBqtR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyqQbwV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A734EF02
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839889; cv=none; b=SxU7Yq8IBEvW5jgJ4KbHcDMTIGNiLxVHPyZuLDGIViyjzpj9LHcCZHcjaOF4z5i7M44Pk21whiSgkrJTOc5fHNV200Ddcnusdy0x2zLOD/SnqpycGMd6MkYFISFk9ppWJWnldC7GXWkaxxIXEv3/tg9hizebZBLyeU4DkhajN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839889; c=relaxed/simple;
	bh=iS/VY5KtURVTTjkX9EUs9Mrk/BXo67sGTVo1KhtK0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyC+IKfd6KyB3Wqxcq+qGaN2ocfppsAyeCNfbtDEFXX/Oh37uahCvDBmGemS7A/8Xx4iRNCYcVRwbWYXDK/KX05Ksj8kEkyEF0RenONL5irIAIoLJT9rKua++67EQYGFOkLzFz9yadQaKXbOvx/ajcGuXXCKZSTjymu+MpM//cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2MBqtR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyqQbwV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMs3072791963
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s5Q1vewngJBr91qKkgV5B9pJ
	GBBUeF9wD7BUkTBzUfE=; b=n2MBqtR7gZ7QAYFzUxcvE7xcMUV1W5cLFgQKuEv5
	1KDQfXbHtb35D9yelPJZHf5693s843xj8H87QMweMacHIo/3UJikgZAf53lPxm0u
	Uoj3QwgVpAzYjQh8q09VaLvcHESPeyzvQgkswD1htJ0XsC1MYTRZtVcMTGtamxK7
	2eXX5BJXYJtZGg0KyXsjcgpsarZm/ww0OsJQ+RUQJtEIp8S8T5Mjq2qoHrg6tKeH
	kyyCNKRuFNaR7LVHRvOvuItfjYsEI7O7JOXvFHjvd7kXn5TC0/2v7phbDFfP8ygD
	PXA5l8ZHheUPn17OeqJkIn8OROqOTenQScspNmE1Yrqx5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv7tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:44:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so196972315ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771839879; x=1772444679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
        b=IyqQbwV6A4MKEfg6mJKu/sGNTZtsroQeqOsbgcIuMxFlCI9Q8bsayZSgdxUzeCKI4N
         iThHT6zEeU3FTDoJeU8EQmQ92tLKIO6KPYtRVcfyTEylmWncd3ulOMsFzsYh0vnDeOXV
         cfcVbo7MuAeyJNMmlO40NNIM5rzv6lWsW0PTJfV8kjGqrqFJ3NvNSNiFasfJT38yF82N
         unv4vrwE/z2LN/4F6zGmsdS8x7VmC3Mv2hBXECVt2ak7RLF6NV6qxz9jgS6rZ+k/GAW5
         Hu9PVdpWBevmWAsGncq8IFpmiJ3RgNcFH7WJWOA+Igmii64qajSuSCelCeDZhDQeOgoR
         40Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839879; x=1772444679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
        b=P0p0iV1en8t+vNdjSF2eq6iiaooEA9GCmqReK3vafsRLrYtMyzSJWaBSjll+ZZTs7e
         6tDxKNHDAkzjPNfAmq4PHb7SyM8MqJIe0OPY8MrDffUy1LCOyz0f6p+jVItJbItMSOnW
         Pm6J4HtlPJA7nI7U+LmVlF71MRFbBECCC8z3aioVWDiyrBsujUyd8qu+ndePMEdCsyR9
         PiHZxeuB+Xu/22Cc0dehXTbKDou5Cw/5la9KB8YhKnGb+Okgxa6A6V6p1QZdsqo1mkRf
         qUF8P2DbT0aZsCihTaV86PCFH5P6PT6L/zbjcRHZ6Al3pr/2UDsfgSC5q+vsqWlUhSIn
         8LsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuSRXhlHoKyBdnI0Q+WwK80FD3NWyx6IbkUvAlqqTLX2a5ybRinYwK7G6kA+lPyLSuE7OI/ynxGTyVJVnp@vger.kernel.org
X-Gm-Message-State: AOJu0YyEw1Zl420Iupd06vYyUOtz0yq92hYG4Znj+0WGQ5wW5i++nydE
	vu8lcjlkfj7XKTTnUlIWHw6+Cg1Dn4YCsZgnrCE2ordzD/tRPhgzMPzqmA/S2b5pkNYN01swxOH
	kIGbxKKBVZAmxu56ZP//pjeX7V5FVBwV2h4IaR0+NPGmKgU/KJRW9Ee1CRo5Fq3Thkwg9
X-Gm-Gg: ATEYQzyKnETpsNTgjQGAZD5YTgVJGwmv01UICzkNqCkIrJ7/YV1zHtLWLj5dXhNQOAg
	pqhsOX63kOkkJUk+h+LpEBlXaZRVwDEfh8TchcpUO75IRJt2CG53ZBAnw9HsI2e5u+N72Jsmzef
	AfI0TpCaFc5iJukj7VtjDQ5e9MYkSd5hyjQCUrH2dUM94jK4vDzCmT209naaYl5om1qb8cju4Ma
	F9hWyhkNtCiq408/hlk4u/iJEmsPtEcAPDqJG7GlhbDSqaDK82Ep8SgjzWZp5gnR0Yck5MlXWiT
	0g4qXHmV3PqQ8NDe/36m+VYg25y7pyKdS4SoBX4WXTZvHX/n794x8cUorrGTQTKR8i8SL4nYnyZ
	lLcFPEOFr4SR63FeEH3xblWcHp/Yrg+kmuHY=
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr80693975ad.50.1771839879040;
        Mon, 23 Feb 2026 01:44:39 -0800 (PST)
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr80693685ad.50.1771839878545;
        Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34247sm63334265ad.6.2026.02.23.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Date: Mon, 23 Feb 2026 15:14:31 +0530
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
Subject: Re: [PATCH RFC net-next+ 4/9] net: stmmac: qcom-ethqos: convert to
 use phy_set_mode_ext()
Message-ID: <aZwhfzkk740kUegR@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX2yMjHbeAbmYv
 DXhPiTVtMcofahl91r2nC8UZc+6sNzK8j8FrMwYgtF+zVpithjc0DQBTfh6yIuCKv7LZsmOwZZ3
 L/X8Ew1gU47wgSe+TJ35/a31RHufnpGE3NX5quDyGrTgndVdnZ3CUcmG2U+cXxhb1sVaOVxLO+Z
 TKbCo+KQyZSjs0os0IiaD67a7uzsWRf9lbwIiYPhrrR5Ifgxsp/HfCCGCovKpLfJxLr8VuT0jbJ
 v14CeL3VL19W2u9fBqz4UyiGQi4pX1cUDluJp7JhHCLjiHVFWOfjmubtRzTyloSnkC49srojhUC
 QQEnvdX1Alsj5j2zLjgTJ4AzQ1IJ9yIwq8/LxJBWSjumk6Q8A1U7heR0+49NK4hzblLu3IPpRuQ
 zacIZEkdd1k6KaCaZi8soOxI3pm+AsxpXVCFi3f3pRakmf5GWx/1IlYLcGETesX2C6aNVQEGZUW
 x2jF6oQaQjOhi3sbxmw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c2187 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=McwRrj-fpISi4v25ROEA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kzoc9XVUiOEftRmDSSBDxXubF6lunZZG
X-Proofpoint-ORIG-GUID: kzoc9XVUiOEftRmDSSBDxXubF6lunZZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
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
	TAGGED_FROM(0.00)[bounces-93636-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 2CA0C1741F1
X-Rspamd-Action: no action

Hi Russell,
On Thu, Feb 19, 2026 at 12:50:44PM +0000, Russell King (Oracle) wrote:
> @@ -675,20 +676,16 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  				    phy_interface_t interface)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> -	int speed, ret = 0;
> +	int ret = 0;
>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);
>  
> -	speed = SPEED_UNKNOWN;
> -	if (interface == PHY_INTERFACE_MODE_SGMII)
> -		speed = SPEED_1000;
> -	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
> -		speed = SPEED_2500;
> -
> -	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
> -		ret = phy_set_speed(ethqos->serdes_phy, speed);
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX) {
> +		ret = phy_set_mode(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +				   interface);

Shouldn't this be phy_set_mode_ext()?

	Ayaan

