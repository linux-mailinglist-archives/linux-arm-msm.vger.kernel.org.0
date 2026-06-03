Return-Path: <linux-arm-msm+bounces-110959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FLpKBy4cIGoUwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:21:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194A6376FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RX0i2Hu1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pl4Xg2A0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110959-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110959-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC1535315E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A71846AF35;
	Wed,  3 Jun 2026 12:11:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16D477982
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488703; cv=none; b=ZHTujJ5KQK5pS5JDjJOUgjoxECgP0j7DPrSmkSOQZk+/yb7LS7jkb23vDBfQ0W6GmSqBwnT0+FLapDRpZ7/KyyiQwn29ipBIBPOhljCTRT9qO62yQp5fX16RaVUDk4Ahg7cBJ/Zon/a2WbC/lxuko7zXM1RhflPqaWeBEcm01w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488703; c=relaxed/simple;
	bh=iEuZt0PELRvOLSZnoy3MivGwi/DQL6MCve315+aITS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItybWFbLu6rcyJ1JOvZHdnPdKZXi0DzAE7L2W512YlSky91Or2wdCsNVXmeIhjUFr31GZRHaKtAlvw0MQgb3hof6QISdegZZoL+Yga1yLlAFxI9YaleWBNYBUmcgNzQrE20fqq5WVi3juJaICbjlRyhW25txqhB9MCAm8nL96JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX0i2Hu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pl4Xg2A0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395rGH780730
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=; b=RX0i2Hu14Z6G/nYV
	llUN5ypYsyHNPLreImPDfjN2eiGdjbi0nd7FFBpSgq9qSu5gLRabRJ/pW/Uh6qEH
	ZyBXxR3Phuc6JsYJAiTjSfpF6Q5xsIcgfl652hYFkyLjwK9ZxxFC2GZMPazZPwPa
	HZV2l2i5/aH/HWnqW90I+raV7Kn4Su9+hdqRqhYpoKFP1Jes9ebb0t+L4fuG/WlY
	EcMwjEUtkB0Sk2YvrKqKGEphL5U6ZYVhsCqdYfK4gzM+zaTVHbU0C6FnIBpMWwUd
	E9qbCSlg8UgzIZfoiqotFy1hlANEPbT4qpt6eupp6D5BCu7SyqyrE3ES5hSVbpnI
	pPgQNw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0qcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:11:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so4803816e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488698; x=1781093498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=;
        b=Pl4Xg2A0e/O7/r36NbMHhAV5f648vBie0lWR+i6ObeBiJ+3b+s1Z98+YnEu+JX72ym
         gZqcffvZwc7zrSNNXSVS5Y0cku1LuhqBahDWifTN61E148K6zNij164r+BBnRbiskuEB
         iBkaEfN83uHVjJMNBhCO5WsHn7xE/DgaRbOjRCb/EGcupflzF2MvbN+g1aDT1AXD/uFF
         B+iFNxHORQizXIir9L6+BDTt76RRpKdySp048VLycTA+S1TsRR/JR8qYCcJVfjd3UeVb
         fCKvT6KI4JbNopq6lre7Gqvca1sMNNR1lN0yZI7uVJQ+dCzb4amFWeZoyENES3P8ex1V
         Lhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488698; x=1781093498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rH7jaaUAkMdsadi5LkmVJE+Xx13HgQWJkgJsQc8hK/M=;
        b=YXHFlv+emfE40kYzi+JmUfV0mjNzQSEgQlLyCdq2zk/f0vD80hu4tZCFrqSQeEAqvJ
         yDnX+VQ8M8sYQ+jcHVsvwU46SpZaCDTwFJYmrtCEU4OIoUNYieAb0/C0SqbdoypCCfLo
         xhl7jL6eiI6n2NPdrmYwRIrgcmCx0wWBu58inmhkbjX9mabA4TePktQdTct4WQMZ36rO
         uAX86Gms/HFgfX5ufLEQhtXYbqO4oEngVly1vMKrSlKnXYkdtbBjxy2GTK8hSoPUFQva
         7NTHdmcxibPaLCw4WCR7/X3ejhZhfAB2HY7yX0LzfR1ofvATfVBxy8Rc1A3Q7MPJfOpX
         DQJA==
X-Forwarded-Encrypted: i=1; AFNElJ/vWE/KIkYVtIg5rM+s5x1dnVK5OEIr122Zk+6AT9T847IawuldTCnHDhQul6ez66JythaxZRngs0At3sOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tuYhNObgtm8AU17rI0xAhxMZzVoSMXnIH9P64/tZFGuhYCoA
	49kIDNl3Ce0kSLieLsTQWJG83IoSCq3UXUxuBdeCVE4tqHJXxnfSTRSZjzuWpt1fnpInRMIrRM/
	JUqyu6KgvbmOSORgOw8Nu2aEg5bRaLz32Xqd4oGEa4liNJ0rDKE4EgnXnZSQNCsyypY7Z
X-Gm-Gg: Acq92OEpr7j/uUO84As1fxK1PW0+JUxBW59Y+k/z15QXtPH59MpYXPNBGHRX9wlj30e
	fy6bLYoJ7ckaWn/5qz9NM3A6atOcrXfQLhzhLG/cIrg3CUfi6m20zH/zO38qoLVrRqEPFwuAq2W
	UnifEF1e6bAFowUGR706TrnXZofUH0zznDh5m3382kZefZos67nXrF7+WCNr3CHGF62HmTL7jtR
	9d37f+5E7g4a+1SAc0nb2Ft/7gzJOEBgDXlPgKXzPobr9Hwpe0IDcNDH8vc6sRbR6v0D0Hud/fV
	YrxeMK1bWxo5F02LdB1VxJDshBADT1RKzqLGTbfZerW0f8MUSxFgjyo5hKx1W5XD4/eDe92wHNP
	KBwPpwzgFbRIvlST2JABWiLnOPbDOUO8E80vj/iD+7gH8Eezw67ITsfweHr6q9X0la0PQyFbGua
	UfDeGYJc9nwGwu0JgwxAxH8r/Xccg1wbhpzHJZ5XdRYkix4g==
X-Received: by 2002:a05:6122:4b81:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6e9aa38d3mr1534859e0c.13.1780488698085;
        Wed, 03 Jun 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6122:4b81:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6e9aa38d3mr1534817e0c.13.1780488697683;
        Wed, 03 Jun 2026 05:11:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm616108e87.23.2026.06.03.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:11:36 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:11:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: neil.armstrong@linaro.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
X-Proofpoint-GUID: oeUqZ-Gc_t9GIoPLpnuvsQCTiB6wo3HD
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a2019fa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=kGZGFaQSV3qHyNJQVSEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: oeUqZ-Gc_t9GIoPLpnuvsQCTiB6wo3HD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNiBTYWx0ZWRfX4UNFZoLnEXgS
 Ph9tSdSN6K3EcCOwtGM06VOkyGIbIns2n+WdSiZhjA3JRU8mwz7hfQwJQaRh5yxgeuJHCJCaRfp
 6hNI6Is0yGc910fbJzGuiOFYPDEPxiGGqcFsMphUw5YDtdD+uUTBf6GhPUrsvBxhohjYrf/LMd7
 taY5nyGQLI613w49deJVpiNW0WTH0+9JbhSGKhMoT1ILD+1vm4NYwEUBLgzrk3UBr2LXADlJxl6
 6KPbfoX2qZ7l4k337oTQ8Z1Mrisd6UApPfhFVdP6Dl5k4alu2hzD3qbWKTXoLwFG83gg71eURck
 PBwW7G3vJCjodvYiKU79gB/16N5xB5eAm5R9b38/c9U55rcEtG7sCPbbgxMfUxJXE+nC+FxkM4g
 E1tPf551xmp65R4v/qyrzj/mJbbExLdv9l/Tc6kjqQML1QQxK+9ZgUrzkxe7wqDncFhp64keO4R
 PrgVMtMq63UW0YdOrIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,6o6kokszvng7:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:neil.armstrong@linaro.org,m:mohit.dsor@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@qualcomm.oss.com,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6194A6376FF

On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> On 5/4/26 22:09, Mohit Dsor wrote:
> > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > working and non working case. Lilliput is just a normal display working
> > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > Gen2 only.
> 
> Neil, Dmitry, and Mohit: what's the status here? From the outside it
> looks like this regression is still unfixed with nothing happening for
> weeks now. Or has progress been made and I just missed it?

Thanks as a reminder. Unfortunately, it takes some more time (and I've
been a bit overloaded lately). Worst case I will send a revert soon.

> 

-- 
With best wishes
Dmitry

