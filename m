Return-Path: <linux-arm-msm+bounces-111596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kZMhBYHTJWqlMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:24:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 126306517C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aMikmOvN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="W4+DTs7/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111596-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111596-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 242033001F92
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DCF32D0E3;
	Sun,  7 Jun 2026 20:24:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FF158DCF
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863863; cv=none; b=g+cTIYgF2l2jMOBtEY80OZO0YYCykxx1Jj3vOLqklhnA3SHOluf/crXCIBh2oXE6rFR4+d2v0Q8Y/fXAOGPSjmPnxhqJ8qZhVdXwyyiwSK9iOKiB8kevg0X8AYDmp8myfEsA3AzAHSwXPBA2QF+Z5/LyicfZLhZIbRH4rhV4PLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863863; c=relaxed/simple;
	bh=k15IyViioH3QB3wZb52xqHZ5IxctPdPprDkOecNrQWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQvL/wEFOcamPtAKpkQrtXxp+muyBCaj9VZxkzwrZN+LsUEkd2gbaNVCsPVV400x8La1RPdjML7ldYG6gL45DApyzbPcelPu+d98ev6oSQUAh3xoiyZ87PtduHrWqScTby5YFirIc8T1gEZvh0pDmRcmuJKnG+532Wzq1nQg5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMikmOvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4+DTs7/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JMCvp927092
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVAaAzQaWD4IAXLEaWPxT2zg
	M46jAQrvtC4X4hMGQz8=; b=aMikmOvNnfYcwjfWNW/YFDmHBIGNcly2DO6UEUFP
	svOwiDbPudAmi38KZn2mMv2m3yZmznfWLBGH5Tf25KWBr1Dh5CI3ZSlmoTsxbC65
	IIxZzbJ1now6n6fqs7JRtrKefOq95GMMHJylK7HYuCSWnv28berKRVRsD+OS5gG/
	Q2GcF00Fx1zObBsgPBtDFqwshkWtvX+evPNjNGMTwI8WKnnMl6PGUigpxSzY/oDd
	560oZhBuYA3VWANNAD3AQ8q2fMLoywUO+b5+FVuP4YkGDlnsC/1gQEZb3vhZMB3H
	+ORZfRQ1YrSY08I7xAKj2EPIX3sEQbP18uCNnZpx6MuOdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadve2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:24:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178aed25baso78389601cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863860; x=1781468660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVAaAzQaWD4IAXLEaWPxT2zgM46jAQrvtC4X4hMGQz8=;
        b=W4+DTs7/fe/IxzimA2q/829D5bvCvGcfpaH85CX1AghB1Fvkq8v6kxXCkpWWt89i35
         t0v7HnigOwbDJ+/yHuIkXZAQaqze/9IVR/f4y5DkYwJCFopMenVvnCoYe2f8xfb6zTCm
         PVinY1Ia41w3DNeEA2CGVpMdV6JX8/znl6Kjd1wWdwcdH6c+wCtc/KbXdAK8Y7/JNIhe
         97zVhO4ijCvIjp1H0SKg3DrzMk5UV5ntyTVIimW0Np4nSapvMbKxqmG3or7e28FfxTxg
         pFwZ0ZOYGdDcEJVDT2lRBgBkqrbuKTSxRSxIFoUYjC5CyroXK1/1dKLTgmpiyTQ51Y+x
         dEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863860; x=1781468660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVAaAzQaWD4IAXLEaWPxT2zgM46jAQrvtC4X4hMGQz8=;
        b=KG4YdRKjgusK3SKHCVzgwRbRuwdfHQxXwW0g5AAdDLAfTZa3nAqyPR+cUNPd+SudnL
         CqPAn/E2sx0/44wCoWLynf0EGCZrflwnfHJtevomfR14Fi540IMSsF8Lc/s+RKP4EUPz
         tD0eEB7OzGGoSGZG/O07RLMOWSw+NkazvwwKBgeo/EbVNOnHoz1X+m4NeIkyo9lxU0/0
         ztCbs5yQsfLTe4NikaRcrBB+LT+mxu8mhW8cijrY6anOBFkEWHoZcX9JElVzbr+gApRC
         7au2Rq7XS8mzqPz4PcwXcyvCr6E4xN9gq8tzx8DpXDC2W5TFvgP+FJAvugYUxmZYy7Hp
         Tv8A==
X-Gm-Message-State: AOJu0Yy0n+H98f0zO+n4xVtTBpR6LXVTzjsFESXnPDU/3AJTG060Upnb
	9k1auGEj2mytdRpY7w9rjpWAjM3iO4gAePbahfA1Ko/vA4RFjiSlM2oY0DUsLXBbAoQ+nF4QDXs
	FoY7Aeth0wWBO65/jzQl+SlkSc6QdTlPSR48kmSAEAZn8PEugyn4C2Q4gD3nd++9w1YU63SJYkH
	hD
X-Gm-Gg: Acq92OHp277q59OAJWsesTAD4mHARJ55oRCaXwWDysrd4wHzKHJ69WY2tmB4l1lozLZ
	oCPYah6ejC+Qx+MibuA7s0/K9f5suSr/nJdk/of3ZXeeFyxvzu7TQsvyU/CYNpS6mbnF0E6NGyF
	7H9ssSnv4vwKMWhkKvFBXBkee+TT4yxCubqIUfiNeoFoW1Y35AAhRrBsC8u8hga4rFkdvb2g1cw
	B/rpNhtl0vJEosi3wZIjMluuv316ncvrCrATlhyMNl/MQLrBMKvlCgjdFjCiPDyTZWuODaGyk9M
	Xi6PrGoFoma72VB0jLwX+oU72vBiytw+TaOsfK3z9VeUdHLEuSgENOZlPuSU76OZPb9CIbYWOOR
	lpl17r/ZrzAGSGQSzgRqOUhKws3RJ3qyMXylrCRj64uVzX25pva/frjKStJ9dxbPMZYcrDHOmQO
	HKx7NihnAZ/rbh6vnHLFU8pVm0pXBKRc/uF5gXbcReiGOd5Q==
X-Received: by 2002:a05:622a:1896:b0:517:203b:e636 with SMTP id d75a77b69052e-51795a08ad9mr186591071cf.6.1780863859752;
        Sun, 07 Jun 2026 13:24:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1896:b0:517:203b:e636 with SMTP id d75a77b69052e-51795a08ad9mr186590611cf.6.1780863859129;
        Sun, 07 Jun 2026 13:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm41683801fa.18.2026.06.07.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:24:17 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:24:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Message-ID: <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
References: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25d374 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lMQ6dCxS1d9JuM4dYfAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2u-ym9YyzT5loOjNFTeGmaVLVU2lXFtZ
X-Proofpoint-ORIG-GUID: 2u-ym9YyzT5loOjNFTeGmaVLVU2lXFtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMyBTYWx0ZWRfX6MaWt9t0Kh8D
 09h5OLGk04fSKSoHpAm7XaiSBFWnDiOPLWMFHshc2w8Bcp5FVJAQlhc7EHB5j8v1r/wVDIUeiBI
 zfM8+y+8SQCM4MtoGiRZnmqTEiWM44poED7KpcWTivmJjbQaxJZr5DgO50gE8Exje2DA9byqW97
 bFD+Hlv6kHjNI9ZD9FaPT+l48yzfsIVKMEnKF8yGyEDjB84nunmZLC7jlxZ/X6AYbppWOCFz8Z5
 i/oxJ0CIy1c1jRDDvSNbtHSH6THmGQ2oV+rh7X34/JMcTgEqJ0ajzULmOezoMPLbn7/0dXphaAt
 8otgWDzqZkDujcsdEnbOG56Bt671KYFez4sOB6rSaQ78U+0rWQbxmGNgW5kKHHl30Uxb+6zbHi5
 1yD8nDkODAz9JQhiQypbdYTilX5mVkiGyOr/yXuUFUx8S6hgKYtPdRpTONEfg3CkMmb4RakJSN7
 k6MUqTDh5xG/Hutg29A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111596-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qeau2jz6ihu6:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 126306517C9

On Fri, Jun 05, 2026 at 01:18:24AM -0700, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 174 +++++++++++++++++++++++++++++++--------
>  1 file changed, 141 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index d7d6518de30f..ca84da563e09 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -148,6 +148,24 @@ struct lpg_channel {
>  	unsigned int pattern_hi_idx;
>  };
>  
> +/**
> + * struct lpg_pattern - The LPG pattern normalized from the LED pattern
> + * @data:       The pattern data array (caller must kfree)
> + * @len:	number of entries to write to the LUT
> + * @delta_t:    common step duration in ms
> + * @lo_pause:   low-pause duration in ms
> + * @hi_pause:   high-pause duration in ms
> + * @ping_pong:  true if the pattern support reverse
> + */
> +struct lpg_pattern {
> +	struct led_pattern *data;

This looks like an overkill. Can you embed the struct here instead of
embedding a pointer?

> +	unsigned int len;
> +	unsigned int delta_t;
> +	unsigned int lo_pause;
> +	unsigned int hi_pause;
> +	bool ping_pong;
> +};
> +
>  /**
>   * struct lpg_led - logical LED object
>   * @lpg:		lpg context reference

-- 
With best wishes
Dmitry

