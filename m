Return-Path: <linux-arm-msm+bounces-95463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM2XGe+zqGliwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 23:36:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A91208B56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 23:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D813022619
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 22:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4283976B3;
	Wed,  4 Mar 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL3Kxza5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvyB7tlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452526CE11
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663701; cv=pass; b=PDXZ/kuUGuMvg5oLwOB0cyOcO7E6ZxiPMmIXrJuO1a3h5Y1OO64PvePlzWp7X2NzpneOOGsex3oYmILsM01EycFlRZUcV/MotRgOYU2N3JxGFFTaN42WwUsDc8qXSkDdr75uFAkkhWUSxEmc0X2UVcx4zGqTNEI3rbW4E6zkIMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663701; c=relaxed/simple;
	bh=qP8kdQVtQzT2qYDL6gfTLbdxGRpIBJRAUZCwIBNREQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4hGbwyZyg4lx2OIaVv7W+uwG6FZPRPqdwdGngdLlVFFRE6o3xPvuI2dRXfv0mlUhWUD1znHw3AIfcyNiOfB/cvnJwNcmYs6figRkttJZVog1WU6jcqDAH8DTrhl4Nv/AqK7cspMVMPd529yiTrOIhr1pk0PpZq/j/67YBBpMTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL3Kxza5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvyB7tlj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHjTV2494780
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 22:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q3kw8hXwTJj79fdkUH7EbtWj
	4/71ysEafkLCAulJP2Q=; b=JL3Kxza55K+oBfCNM8bskFIQhJvjIyjUbx5xkMh2
	QTillC4TjKWfJT9vxqblICGSoWTT3JZ/payC0YmCClyGEnUIaPBlkFaxuvS7v54B
	9GkNjHrjMWBgOZkYlhxjJWcHL1HaVqq8todMuLgf1E5EaaA56WTb9JSKhtA/opO+
	X9ZVLPfWLFdi+45pyWe3oKxr/AZy41irSefAB6mbrlSYbrZOBPvVawe3RGEH4BOH
	XgFsdm4ITY0BFW09okvIPN0vcgIWMqm3LSbb8QrUxBUBYxFJErm7QY2x8Bt34s1+
	Lw3mCezjcIsoJSu6Rs+pfHQOrUEE291Eywav0+vbQIi4tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wgvn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:34:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so5922012a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772663699; cv=none;
        d=google.com; s=arc-20240605;
        b=F4BlSHyz3Kf73jNXaP97fuTNJr9yZw4tn6gg5rpPmPWGiG2NQaDqvFmBu3b2V5kcQ/
         KbEM45IQBSY79gyBKD5E12cOLP736tAAoyH5s2YGjBNdm8WSThSWqjMXjjXSQgm01AeS
         Qqdo2E4S4rIIaXuaW/eBfvDITro0XRft3oz7ESX3cmkOJWnXS01YybFRaJgnI5VidiU5
         tyFCVJbA8hwzgZyFzWU+gIyADGuguFk2uU5k7vasf8kO/P9QxJGJiDK8cXFF7gnsvJaz
         lxsdzvpGYshxuiCaU14l78qI6l/pExPjUYicGNRqk/hFwb1yfMp1tRK2yWJylcgZcHYD
         P6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
        fh=fWdLCBL1vcxnJEteyMIvJqoB+Mi/hsUV487p/2Y9NuQ=;
        b=Od3odyAJhm/4t4tksNmEfA7mFXYUdB1FpAF/LjPze6GMjEhR4+clGRwcXmNic4m/jk
         HVbb/CaZPO3NsWQk/lvAwwyL8QQyzcPZBpq0PWz9/gM9oAOQ8ohGq7CBi/vZHMYVZPXb
         bjRWgLGPw70iBtNUIGzKZzCjqu68TOUtCNnx5KmG+AuxwzxCeiu5optaEnQjg1PzX8pv
         h6I71q08aAea07uz6Nr19HJuz26/oZsBlRbJ1PhHwIse31w1GrPIlZ8pfzIRgp8oLaev
         oMrz9Lcm3cchtKEWjlysUkiYzjhtXq0yzHe1tq/00rqSaufcPUT5O++2aW4oEQ6pdIGU
         6bkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772663699; x=1773268499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
        b=hvyB7tljh1g9USj99nRkY/EGqojfhoEnFZ+No78K+/+W2VsPxivmeX+IYeT94JHVfE
         CEf4hqZD0MfzT7Uz1Tnjxa+BGf2KkN9YIDCncAwkMw3QJMTF6xc5irZP5i+IqO8GUoyP
         +5iNc+3G4XyMhKduq3Z3DXM+22qaCg5TiCt7ho02QnpDptNI81Af+az8nouFP0StYBJ1
         UUGCpVNThqsfuGa4ArpSihPAjEBXp0VBAew6MssWPioirarXCnLQVWJ3WspFwms8pIPt
         rsLMH+OzpaI271nmOIINnSZPPznW/sK8WJbdFn7ZBajIRzf3dHs0IN93Ik7boz7Z3Lct
         kDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772663699; x=1773268499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
        b=ArmyzUiXzded97Niji4sNFokOYCmrJ639j99yROijdTzFVBzggniM4M2Xn4BvLkZkP
         EDyVsPDpg9hSkystTzyMMhF+Vy5YATEO8jastobqmbmXxhFDax1eVw0EFeZuCI5CAcxK
         /6sGmE0ZX+fCLjOxjtT2dPWMdbCMGuqzPYOdR0Z+fEVuKI0qem9txiGXjIxJPOXdJIzR
         Z8iHiWUHeQuawiyrmG1SmGu4BayYfZA5haTAABdoyYe7BJ0WUUR46Fx/xTRhQbRsbYpZ
         52BaIAZotHp6B1kh+wk8wjama3c/C46mbajh2vC2KQVjMAIPXdR+7tbJoMppfcgyCTcR
         vFMw==
X-Forwarded-Encrypted: i=1; AJvYcCUu2GverfL8OIl5tYMTxDMox+0WNDmeKdUsOBzmDpGnI4Fq4qTtBZUqBrZMDtS/5099lma0i7Ditd5Ht/N9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQC1kfuHyoGVXTN7FxO2XjhY5fjj06J2IqpRLHMmVOykc6XgFo
	mBzVNnsEOL4hqbGLkpfEPMeW8/x8wzArpW3dRZ/PeaSb5mGzOVnb+iWI4X2QMNlQOckOXSwKx7w
	ZhJS+/Yqgt8C/nr1wsG0DcM6OnyfZZWedMZ3pl10455V0qGr36F6vbBRVg04NemkmRaLxyllWXy
	b7EnhLhQDM+9OC++WCgtz3+3a+Duv6ussjgGxY29o57T4=
X-Gm-Gg: ATEYQzxY/D86MIMfxX6xVT9uVDAWnGoQMX8BGifVyNu1rXwEJw2ZGRXwb+uGIkKflL7
	z9yQfqnHFMQ1gHTxoJUritw0LyquQAyZJT2zJas2fqKuYVaIbul5Y4oqEoKfg86/gKZEUYv7HE5
	M5e5CDWX5H9lvFuAmsigV450oznXd9tPhs9XrCTDVKvHn9wNqFHFzLO/75lPC8PRaPKdjABZ4Gk
	RvffVnhDV/AkmOoA14M
X-Received: by 2002:a17:90b:3d05:b0:359:8d0d:5905 with SMTP id 98e67ed59e1d1-359a69bde00mr3337294a91.9.1772663698569;
        Wed, 04 Mar 2026 14:34:58 -0800 (PST)
X-Received: by 2002:a17:90b:3d05:b0:359:8d0d:5905 with SMTP id
 98e67ed59e1d1-359a69bde00mr3337272a91.9.1772663698091; Wed, 04 Mar 2026
 14:34:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com> <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
 <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
In-Reply-To: <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 00:34:47 +0200
X-Gm-Features: AaiRm536OywcYBuxo9AVuL0yS1b3mC74MFjTluSvJIMSZmnE4Apm4Yr4rK9zJ5s
Message-ID: <CAO9ioeWCLeF5rD8=WVbyKBD=azFZ5=Ee=BH9209Rw6kd5EOJug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: wptTN_mnPkrQwY4lCj4Dhwc_kW1-5LXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE4NiBTYWx0ZWRfX5sFTXJws2eM2
 CaSR228dxAP3uB36fKknlvZO73hDGEzzvUtixGEUaA4EBAU/45S8CX737jBDlkidcv6WlgbrjQy
 u8l72rDMelDLWKyLZWJgjlWLaYZSSxyGvGN1+eURXhs7JeRFjRiGYWGASOOp4IARsDsRNcLa/vW
 ICRCwEBTqCg7Xx8K9cN12/Q0Z27galXOQkxtz69ycMPcyyGg5L6/GzgqZb0DEZjstWgAZbEjtYf
 YoEeTQxPyuajuisraD8BwgUT/fc7HdlKrc0bRf1CBKW/Ia7sc5mkwzcsf1oVejjbAw13yDnpbth
 9znDK5fMKN5kjg1lX97lq0vdt8yG9nJm0tBDfWV2wW/ivQTq7yKKUJbula7v69bSwW1wigleQYh
 n2RTiEcmn9W9b4GeLaz7gjUpA00A2UYTV//gIBKPtwBxUIlYUU1pSUh4Xps0ni2HNJnH3XLhV3t
 2JBKW3Gi5rwx2fbIyUA==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a8b393 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=rmZjoFom7a3_dF09p14A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: wptTN_mnPkrQwY4lCj4Dhwc_kW1-5LXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040186
X-Rspamd-Queue-Id: D3A91208B56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95463-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 20:04, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
>
> On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> <snip>
> > > +

> > > +&mdss_dsi0_phy {
> > > +     status = "okay";
> >
> > Missing vdds-supply.
> >
> Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
> vdds-supply property. Do you think it needs it?

14nm PHYs have vcca-supply. Anyway, the PHY needs to be supplied by something.


-- 
With best wishes
Dmitry

