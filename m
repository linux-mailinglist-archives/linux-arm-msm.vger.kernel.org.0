Return-Path: <linux-arm-msm+bounces-93218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJtoLJy1lGlbGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:38:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1C14F3AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C12D03003D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C27C374165;
	Tue, 17 Feb 2026 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiBXBHMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etOSi1Wg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BED37417C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353499; cv=none; b=E32HxpJ6pm3yszhhnQzMveZZAozub/MwDJw8vh9C9fnuv8TkM/RPJcG6sBP3UzQd8eIiBvarSJk+eNlWqm1nCWWTAycKjDVucfxFyddZ19LVIDQCzgEbumyuHU715iE8Kzi5s3uP3PVek6dkO5zrbsn7s2JUU1d0C9vd0RGGbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353499; c=relaxed/simple;
	bh=qq2b2UMHOMaxSGt6ntKxefg6mDqRsZciJsCkvSTWNIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9LEDGhoR1CcAd+zdVwVwT0o1fJF1QXWP2MYYD7j1mTQgKUUikiVT9AD2+GuB0O345Ej3xWxV/w54dPEbvT8LWWZVaMNvj3HFskN3+IKwVBBJC5gxEYnEZ9peDCrXVNBpCOmRPkiUGEjvwYQc333UFSDt/qczMJ8Cf86ls/wlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiBXBHMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etOSi1Wg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFZa7D982132
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Khu6RsTg2hdw2N3mhPZSZ9W
	t5OAieYqZleD6YS06YA=; b=PiBXBHMSNCqQwgLRnydrG3YVTrHMg3v9Dt5jPg4T
	HIN+9sJM3DnR7cIZR8VrhYuaZDNqANZcm9Wkw6R+ko33mqs8RgzahmSeZSYLkc8s
	ZPIM1oalh1dcL5dKZNPSeArk7U3iDcfgjswXPl82oe4WI8GEJS3NzVt74ct7D4mT
	923Agy7keBPoncdbs0sMwNdbBsYnu7P9gtZykcMeTNVc3BdBp8fF7ERrApkjklms
	egYhRZRZ1zTJqcBhqHbnm1YXMd7R13I6l/VxnUwVr2eVcIkA5pQzq/lYE01rZx0z
	V8moE+VUhnCub9TvxjO2xLAmebp6FpY5dvUkcZ77wUC4lA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662uk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:38:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a784b2234dso249768485ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353496; x=1771958296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=etOSi1WgyjBiV9M9nFh5VQUFQ06pYfDojsI2pLGFHPNNu8t17VjRiRITdHWHTgOufS
         8GpCIV/52ah09QOxOsH0ijNYuQYEmIDSKeSWXUxWb2nu/d5uZ5PCTCtiyTO7S1kVeAVZ
         QSZavkUirYmQ8P7miaxbltBGnoKdWOvv8l6RXtvFMJDeGmkNr+vut/U121llUOwmIMHP
         z2n7Ko+SeGwzcIxEWshJiMnOz6LU05PImr8uB9CMRIWgBqUhJMVP6DY8hfIKvg3z8xVw
         N7vp4o7BP88qHzSGedQW0rVkOjbenCZDB98bsivl1pJavat1WI4i2DEfrw+S6Q3o0Wv+
         oCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353496; x=1771958296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=h8tfs2hE4sIQBfrCVMpOSmlAHksXkuq/7XWc/qJY4cZ6b04YLGwi+IvAtqBDT11j97
         792M8fXcv9bS192m1Ev4SNbItjgRSGJV2mk9meJlz7nuAPFRS4q9yvtPbiEi90g5c+Ms
         7T+5J+itESOoyPTNXwxcAqcbho3OAS6r9vrOxgWVRoFk1VdsHh6ffXiqmzX7lhVGV3zf
         /VFnRICarrLozhrQBNQzwWDwSkVJOh+41iawKBW2YWgjBDdrbgb7hdToB6zAWXzDSkuJ
         t2SeOdaGO173v7U3EVJpWMZH/moTmgTwhz8hzRVzmzzwbx3F/7VF8R5OU0OQBojAswuw
         e7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu2MSFp8uHAFhgTx8LF3xjeez2rtVmDS2xgyvsdUI5TnwOYaxYJGkeOwQVmG94hJINUuD+2AegM6jXsoXR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5MsUOl/je1wmkw0NBWfKY46P6QT4jqn1+V2sA5QeinTUsi6P9
	0Qh7vKI7qvMVT6l/KHqdqeo0hGz+2WStbaqX77oUT4R7Pur7ufTdQrYn0ZflrVHRnsdNXLul9Wz
	rENIB3u2P8vsIHnLgwNauvT3YotGUiwYaD8OCIK41b3V2KZkVxM9n1nbJw0Lq8bon4b5p
X-Gm-Gg: AZuq6aK7HlW6sBrWXFGwv1u5CwpMH+OmWnRrOwqtkiPFZpzi5jYuCR2XtvtXeBVPpIL
	RTqzJQE+0ylqB7vnIcZF66V88V0QoEbmdbGcZ3yXBUNKE+LX7l30n+n6BBwKnlUzxMa3lqetLs7
	C7IOuPaTReycohCCaxDhjfwmT0UmvgHijQ+zYUmLj5T9De88nQMryrxCt2UzTDElgj62AsxMEtL
	oKU2gkz/51DPs52gQy6BFVi6TRoHfcy6MIhMa2E2qrSdhENI+l4PCVok/e7GFfffFt1QzvipvZ0
	qYjfAz8/J/aU53oYsYKD2jHlrCQYIU05dPQK074Bp+nJ5hWXYHILVciVonxv3Er/guahJ2mPyWH
	rGkS+w9w/oRti9FccmHr4dbxzPRn4fYoQ6kU=
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154967995ad.17.1771353495763;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154967765ad.17.1771353495260;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaf4b31sm100667375ad.86.2026.02.17.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:38:14 -0800 (PST)
Date: Wed, 18 Feb 2026 00:08:08 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 5/9] net: stmmac: qcom-ethqos: move loopback
 disable to .mac_finish()
Message-ID: <aZS1kIrwBFdwH8Zw@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX1S6w3TYEtRqv
 shK07kn73UvkBzC2qEPt3eBalbfW2cDcr6mL7fnONy/zOj2YEArSRJX9HTPyZwAITv2rQxRpX9S
 RnSUBldx0DQHCJFagUBsvpl4ds7rjCngX6ro7acN8UaWZDBTvmk+/30+6V4Q5j9c9FcOKYw6ahx
 K1PkxE7jfbr9fo0WQmj2HTrETqYBdU97eR61IqE2/v5HHtAFF6Gs7fH1gbV3TnEO8w8O3yz86P0
 7QUzebyMOzupiTmE/kIWiwtmPyJbcb/UVqBu9ZO2TmRk9dGMrj+Ag6qsdyxpG5e3d/dU9cbkT7n
 i5+iGrtJWRFfBw83S5RD3nwXxB3MQ+TbuXAVZETipAgtNhuW/h7JcbXt1UOZDcA9fAcWKRdGCOB
 KBiooTql8ooKEAzfnMCFIRhnBZRoujqkuisULxcIP2ddf7uE2eH5ljIEoI8FBY6pUmUPJQNnKQl
 RTYSGaDLVCq34StaFoA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b598 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=wi4T-LJhgm9Wf8MEqCEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: pGUaW7V_njEmLXfetL1a-3eZ1Dl_yk5c
X-Proofpoint-ORIG-GUID: pGUaW7V_njEmLXfetL1a-3eZ1Dl_yk5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93218-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58D1C14F3AF
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:06AM +0000, Russell King (Oracle) wrote:
> Loopback is enabled to allow the dwmac soft reset to succeed. This
> is enabled when clocks are enabled in ethqos_clks_config(), which
> happens at driver probe and runtime PM resume - e.g. when the
> network device is administratively brought up.
> 
> Currently, the loopback is disabled when the link comes up (via
> .mac_link_up() calling this driver's .fix_mac_speed().)
> 
> Move the qcom_ethqos_set_sgmii_loopback() call which disables
> loopback from ethqos_fix_mac_speed() into ethqos' SerDes specific
> .mac_finish() method so that loopback is disabled a little earlier
> after reset has completed, and dwmac setup has completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

