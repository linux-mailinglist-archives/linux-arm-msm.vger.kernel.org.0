Return-Path: <linux-arm-msm+bounces-92298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNw6NULfiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:21:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95D10F95D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C81B6301F993
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D87377566;
	Mon,  9 Feb 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbhTnLfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TohL1qBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FE2040B6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643125; cv=none; b=PSIoU7swNALX8SplR1cwgfBBewkAXf6NZeFNlirOW8cZADwDZXShuVaC4NnaP8AZ+hi/hWCfKczgzNg4gVCdBMoAbXKOVuuLrk9ZsymU89lY1uvXGXS3plgq2ApM5NvwJL+lKXfophDaE/CPsVkhzpP28qv5ZrqNQgbiGPKS28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643125; c=relaxed/simple;
	bh=2wGaSgCEMzomA5U2T0JBuPxk3wuNYkNG/dIxKfbJs3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDe89hsM3beUJPH27+VrWTAUJhZePYe6Y0lwaWl5X4km2Z/RkxZ9bubmn4XiGX6VrJU/iiuM/q8WykGyw2SVDwwNQCYMA7L5Ohpjjsvwtwh9rDOMa+bMxz5JsW6Zze46UROCDNRUX4s2xXRWMEzF6yV7ePqKuJU5UEmdyFycQHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbhTnLfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TohL1qBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BZELj1922817
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGL63U2cmrlbgRnfDZftDDih
	rdoHz8cdVKu4FeYkZ2k=; b=pbhTnLfwfqe6lW4nm9byVy7dBLyLy/HoD7WaRuTb
	+s2KCFFgCnsFsK7wkskJPFYpU+rPOEVIIcdl8colQN3rGnFQYRMc8mokeGEQBsns
	PkzspdJS/kXQOI/jJC/c0vEdO/3shwmLP2srwV1ZUuSX+b3cj3KxVDMEpXyn1IrK
	+l1J+URbSx7zyTkN6XikWDz4Ym3EbkPc/hQ3lrbWk7LReECyiUX9tBY+s9+qTpQD
	Lwg5uGOkLprAHouix0/e7EIK3tKrGdQxxjcFUDJqHS8tJg5K2Mg6Dvqa3oQIjvrx
	T2pr82l3opQX2DGnslc6N3YNFg2TZb9OJcotaQ/nS/vL1Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ksj3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:18:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948d05765c1so12660421241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643123; x=1771247923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGL63U2cmrlbgRnfDZftDDihrdoHz8cdVKu4FeYkZ2k=;
        b=TohL1qBF9RqPwWi1OyKZuy/ClVnetT59A3ttfgWQtQ05G5h7kB7Hnke8yzPSvOpYLf
         BU8DpXK/ZyYXVMma2kXZliZOzS6FxXurND7ihiBLtH45/9tIKxXguzkR10lh+ynErJ+v
         8uLu3ZRDmqY1leM1O+lee1yOBpPytnED6+YSU027FTH5gDhpQxOoIY5B4ywAwGe5dPTo
         A9g+tZ9IhRu9MAmdQQNGAvqvTgWXLZ/YtumB7yiOKCFx0rX09pnpbQQxBI6QkeQyPLuW
         kPT3FJLy/yotvThqydSbEPETqgh1P8U/T8D4B+H9Ta1NyDOAOt5WzeqAXvB+bl+Wk/84
         5ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643123; x=1771247923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGL63U2cmrlbgRnfDZftDDihrdoHz8cdVKu4FeYkZ2k=;
        b=lpr1GDuL2t5g+4qj167rrAEuMg2YDD8LfoUzgsy7bJj5i9fUlf11XtY/xMMmz1214n
         5hGq3FdZzBaO68kQO8X+7IR21Rm0X9N/5pe789kE4iSz9fndL6+4nucH15adZtqF5ECw
         NGx+A5hSii1wluH3M5QkWG69K0RBRmsjpDksp1H4Ef+qNleAnXbKrapXxmBpglFzGR5M
         m5VmuXZy4H6XgIJdXjh/E9+w9Hxxp6Y/D5N7ozNUNsmqpj5BeYl2CB1DUxJpEd8IJJib
         d96KVwo+AVTwxUM6UUVDK4k9wICEL0T0W4j1VhYjT3Cntcoq3PcP3r8ZC6STFr+M6Qvo
         gHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDNqzTEGsD7xKESMcL7Esqz5go7Nt7bwWr2ytDkpcqbyOKu5/c0Rp9hIzVdAflefarUw+BA5dQKsa7LkFd@vger.kernel.org
X-Gm-Message-State: AOJu0YypY0S+G9JdscrQzxKN0+55+Ium4kYtOPr3zM+N2BCamJMgh8u0
	l19D+Ecq4NbcnZDGo9cZQNejX7WDLi2eK/X9KvVzdkdK3wQsU60cLtOl/AMpNMFZim6+z1AZE8m
	V2mMvrY/hbKTbpnEQJSUPqf9+9QIOlEqvebymN6QYsBJQkhl9HtInkE/I/PGO8Kwwu8+karOT35
	G/
X-Gm-Gg: AZuq6aJaxETYHloqX+gOB1KD+a7+bqblp5/OYKz+/OIw6s2OJDkrME2oZlvoOZUKHcH
	P1qUoSzSZWUtLnY80vS3WmGCrAtmaGojijt8nmDLmemrigj3/b20CkGLE8O8QvaC9kJADGPsGbj
	c8kHnkej97FJMHSr6zVL4nJxsHPaDEigNa0V0F+3JCeIfXUWbfpYt0XruX9H6BqHmxY2YyVPmmK
	xu5MKluZCjNUBvu6jNAY9Z5p+HzYyuLPhPVpormZuYQhHvCylyftR0o3tp8rphSnCurKgJ3dN8l
	dZTsicMw+6ux0jzedmbcLNrdZNaZj6pmr21sc8SmNMooJBVYO+JHds+OOLV/3QwMsy8tSzOY22B
	7+qzvXSQ1o8UWrB05kMQ/1Zcec2IPKcWXFAuXlwFZWuo9I4sPqiyZ+BERK/yEKwwAMdG+4aH9RL
	Cmom4EACXBC7RW+m/8VsEpF0A=
X-Received: by 2002:a05:6102:3a0f:b0:5f9:39e7:29d with SMTP id ada2fe7eead31-5fae8a256b3mr3217630137.8.1770643123032;
        Mon, 09 Feb 2026 05:18:43 -0800 (PST)
X-Received: by 2002:a05:6102:3a0f:b0:5f9:39e7:29d with SMTP id ada2fe7eead31-5fae8a256b3mr3217625137.8.1770643122571;
        Mon, 09 Feb 2026 05:18:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e4673a2basm2474515e87.47.2026.02.09.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:18:41 -0800 (PST)
Date: Mon, 9 Feb 2026 15:18:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] phy: qcom: qmp-usb-legacy: Fix possible
 NULL-deref on early runtime suspend
Message-ID: <frzod5mzv4cjbu7s34u7w3nt2rv3fn76ikcmnd5zsrt6b2yhec@n7d745h56xbk>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-4-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-4-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989deb4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=JrZo24E52nylh-zEmEsA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: rJMrybcV3cBTZ2J-riTbYOGAjJi1SMi2
X-Proofpoint-GUID: rJMrybcV3cBTZ2J-riTbYOGAjJi1SMi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfXx4aAFRgkCpa2
 FWFqaS3Z/U2U6p3GYmCkG6QDJ8OQFFyooOYG3MngwXRwviiDtuyfbn3BxAxYQ0HWDUQcHwcHMdl
 MuMLFEHFE9wqdmzTJ6EAC6eTi13aw0i7/CZyQHh2mWfv6AeO1Tw0TkoCv/rIRFYIzrOViEhYkdx
 THfdCd/pgks/h6fGpjA0hh203hGm+A0aR7Qy4GVuAGxoEeY+5P0IzsBjiMCSaXImS0WIeRCB0zM
 F/2tU5i37mxjdADrB2wDQPXOXEMqFO4lIepb+vCD65G7LJTmT9RT6wrZFqASNMKZxk6ADvy3Yi/
 iM/SMqmCmgxlQrSqjMKcb7sXXILIzV6JM+Jnne+RsxqH78WgLlB8H3/HYBZmOgVrgN8lZtjP1zc
 YXPRfgDgvdeX3gdFQhUa4ke8ZxTTODAty9GIr+hXDqrhR+qpCb6edkO/zwCf+sq8/h0iuGKTa+i
 JRmEUjBbYUTVnyN3tyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92298-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F95D10F95D
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:38PM +0100, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>         `if (!qmp->phy->init_count) {`
> 
> This can also happen if user re-enables runtime-pm via the sysfs
> attribute before qmp phy is initialized.
> 
> Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
> variable that can be used to avoid relying on the possibly uninitialized
> phy pointer.
> 
> Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

