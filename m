Return-Path: <linux-arm-msm+bounces-114880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id erVINgsrQmoH1QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:21:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AC6D772B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PKYIA4K8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ib9Z28Uw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114880-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114880-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E6F43008C83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B423EA97A;
	Mon, 29 Jun 2026 08:21:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DE3C343C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721274; cv=none; b=HLP+GB01/Tw8GaaE3dJlWjfT/QTwylhXz34BM1iwU1VKNr36gV8ePs9CiM9n2jdoezrHMfdOoo39rXCuR0c4BGZb4Hy9T1if8AZCh+KpCEXb/cJZUtIkBt1M5JKTje/cOWsGhgrxXFFYAl92p5o71oObjI61S4CcAn2pkLJLdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721274; c=relaxed/simple;
	bh=19bsCcsmbWBA2J5T8belQs5CPNmzQymzeF4aAeBu0f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+9SZISF7lm7wtu0vYBgERMxD59oaaFGNQ6GJt17p0/rOYIRzRCIeQYH1kJf8GW6aFZLDeiGbB+JB1XJtuIhDBIB57xqLTDjTupDQ/YGgZw+3ksBSl7/0NVxkxWZ4uPGLhKwISBpYMi7/4CRRFRRhlwqBm5bsHT00GXLQxZF26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKYIA4K8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ib9Z28Uw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DqjZ2188726
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWxO6LQZLUQAJzOYM2xHkVek
	pymet/2dgmsuICKY63M=; b=PKYIA4K8AS48AQLbJX82jzM2q+/PzW26RkGFM6r+
	AQK6x5yVZSMCT7lg1wMRPm2xQowK86BmvpNE+6Lvw/J01DgD+jKRGL8ou9+PPNkS
	hA8gp7GOZH+l/8J1d3jxHpTnKC3I9sQtHCOfAtVUBYQyN+XHJ8zSVnh0l73suzpU
	6gI/72pk4TPIcHJKvjBtvfHfjqL3tY3eVfOwJgRfBXaIn86MrGdd86TUiNfXRdTb
	6MTZcj9a1wPOEcYq3bo/x9hxyp8bdqqy6JN3yUydo5nYodSQ0mQJ0cGqyHeGPjy7
	9oA1SB7qcKA5fpNft1sH9mwZmDo4Cnyj92m0BmJCnLMivg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tr8ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b8fc5cc89so417236285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721271; x=1783326071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=ib9Z28UwkcvLqI44pcSlr3979ojkhZewIZGz6XtEZa9DRuWLJDy4VTy02prQ0ViqvM
         EsGuH4Li0e4/1eymaq8qtMGWA310yI7MOzJ3SBRiiqLi6L++nmuxNqPVhd1fVatemd0R
         eRVzjh8IpILvdjpYvpPhVFT4t2pq/tuRg1HncmtFd1pfjz7Iq+wzcicm/xvV9VlZHABG
         cjXFvrYxom7DclShFBciNpBT0HPe9LYUK2D5ulDrUjjlRArJYBzMqmuciv+4YzuTneZ7
         PULK4DVHOnZgErswBdj/9TWXZhmnZ33fFv3+uus8tWIVrmR9hkCel2hOvK9KM7B3iExX
         LdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721271; x=1783326071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=S9lb2p5fXVe0iX2X8FmjouLykzQhGQz9IyrQC3Vac3M02Qv5WOywvwlBPXfQS8XXLP
         MILEb7GM62owv7WwziXOaJ0+pFVE2RN5zpIJSVfGunDeZPITu19hF5YaBndbFY0RdRM+
         L35DWllip2xgbqFxKD5Ym9i4buLIZE/CA/hCzjGTEv+jrHb6a4hR3M0laq56xbCM62NE
         7aePdjP/P8EmcfBEW1lIlUNFOQ50uLvcFx4syOSWpAQB43kO7PyUah9mtSjIJCzcthcC
         0Aq+KLt0N8UrcbYbsR/L9CKTD7lEsokZTgVa7d1TsuVfyskigZJc9O5nexV9Vtay3TO+
         kkdA==
X-Forwarded-Encrypted: i=1; AFNElJ9WGbrrsP4Kl2P2BwJ100tkCARaW0dkHVt8qr8OhYJMd2z0SnLEQGq2KYnuIWujIDhxeQb65UMvqtk8JRdq@vger.kernel.org
X-Gm-Message-State: AOJu0YzldGpXPjM5vxs8d8MFcVyKbsTUsLhImqFKDKXar+mi4x5NsfEB
	+CU+WK6VxYP46DbTYtltnN76nbhkgB9mwff0zw2NibvIxKRc3y7xjdB1qtGtS9cH2bPicOO8o2t
	1Dp6/EFXnRn9YuNWDhivr3As1HXmmsbdwcd9VR3w470dEXIDpyOTVIodt6APVM20vhn6t
X-Gm-Gg: AfdE7cl91eqPzppo8gKnjM8wo5vIDs39uTvKzg6qTAPqTVPD7Q/V+IdD/P48nD2daHs
	d0WA95DZfWGJDo0Zg6VoRKCpP9paD0759MNx3EqT6Fm1HDVDjEFwEAS3olbFj47JR8LVFY5NbY1
	AU5TkVrsXq+Dz00Mis5csviy5enKOm8ScabslrbY8X490F8j6Lh+h59wCsorqiTODtNGdoVleiK
	0VwBM6NbMHNKZnyyBFQKWPT1BHWm4suD7JRHidHFxBbUwliop9ls9SrT5YqevcQohH6aQD9VANg
	+MIQFQW0AaMFB4ahVaWDCnepYn8Vy9p98bdEyeum/ZiZ5NVv58/DrqHKQTjcDAqS0Vd866I4oi3
	EHEhSb/AEr3PSCPkp37tlfm6SLfV52gedX5nFGFFgDKUrqFmVhRwYHp/oC25OZW/oZ31Nl3n6pm
	gW1YgOPbD77hh9QRF92U8GOFll
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275004785a.8.1782721270753;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275000685a.8.1782721270097;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39aee2d65d4sm16765571fa.41.2026.06.29.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:21:09 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:21:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Message-ID: <7smlazccqigokclnnbwl7alqgqfi4dgbaqlpygg3db23yyvxtz@eaed2ucv7v2b>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX6ZyokhlL1EZl
 V3fj0vfPJv2wbKWmmcFCIRogKm4EuH9R73sd20/p+agzwh2B1l3AvTuouDJ7X7V5OGz6kl3UzFE
 a214I3RXoZ055ewDHTGpy3YDSdbo7HUtYJ/K87tOpG6ovTJ6i/iEWOHGie1B27OmWRlxkqKGVnz
 l7bnV6NApFhC8K6wxl9XVTghr3XmgN+Vy5DM2iXiAqT0Oa12/BwZS5R6v13q7yePWzad5M6Em2l
 SYdAoiDFTSLoMtc8OMocqTgTgjl+ye3q6jYzU1O2xzZMiEl5IzJFelXcrU4HczKDvPeWNcBLnLq
 y78fcEY2f2XPmXgyrw+SvIISBygC4YbwZnImvJujm+0AJissZThXr7kvZU/crZUAj/GgSqqRlZt
 yyPCFpgtIh7X/j1AxrKd15euP95H6Esztbm5WTg0Malir1nRCDVlGgYnR1IR4Snk6SVFrDLp248
 xfWMLVDnQL5EUK6ZB3w==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a422af7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vcd5Yh-9S4NXlGS7D9AA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX7YbMZGzjZ/vP
 aEImTamn7LtrcI7N2rrxg+2si/ShjqFY/JoBI48A+Np0jp5G5ZvtyDO+Py+V7WhrqkiLUhHl2at
 D9SeIZsd0k+N1h9zFbKsoEH7pDmKeN0=
X-Proofpoint-ORIG-GUID: AX0gi7H35wgGAxyTtVLhaP4C3MebOp43
X-Proofpoint-GUID: AX0gi7H35wgGAxyTtVLhaP4C3MebOp43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114880-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60AC6D772B

On Mon, Jun 29, 2026 at 10:08:43AM +0530, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

