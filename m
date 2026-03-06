Return-Path: <linux-arm-msm+bounces-95728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNEhKFiTqml0TQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:42:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AF21D384
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA74303FF22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61CE37AA76;
	Fri,  6 Mar 2026 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1tOPCek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKFXh+DF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385EC3793A9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786487; cv=pass; b=pEDqRl71w5O42mEU682V9yLXS17Oh7F1KM2uObHOuyyCEptDbIwqtuC7bTYz2IiuA3LAbxEi9OTloA3uK9gmU4yAzj5yOy43TNzOHfgck4zHT4GwhWzs5qwLJtxuKIyZBtbmBKdpGC+jVQZ+3pR490knCTjdnwuT1ZoewPFAzLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786487; c=relaxed/simple;
	bh=YVPiTvc8HSEbsl+v0TAOxckYPX6yDiMrRYbqiKFL+bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElOQZAu3NLFj5ZdbKKS1ffcGvGVoAjWWyIK6AJRIWQNS704pDF02J9Rfu1f9s9DS9dnJjqBqTwcEuO8B8sL65505yNQ4WuO9O0MRZAIHl+T3kNcUM0pYuVRT90lJulrmvKUrcszCK9cggkpdrLnWEYliMno16/lejfn7c1S9FQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1tOPCek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKFXh+DF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aKXR265468
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=; b=g1tOPCek5pHSdOg4
	2QNQ2ucWEMZcs57rrHH+mTWLXiNqclEI6liaAmPV0w+STL86Ny9HWKp4NIYKSVw0
	FZ/UiyJMutkzifp9iZdT44Ue//MuhU3hUXl35rSar/RkfMGyaA02ZSwseDx+jxjb
	M3fUjK+0jrE/tkYHxZ54cA91mo+ynlYh3r28J0zsoSBG0M2aMT8TmifwLG9Eyb2j
	2vc01YfYS6gq+kyq9kK3e+YAnT1yQCJeTd07Z2P8ppo/H537jwm/JDIUnxeSF9pu
	JPu0yGAx0T/BXHf9gDrr282caSu5BpR0VrfpgwVSgL+K75lCOUi/xlqR0KZMeoc3
	qYdDcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvktt05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:41:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso1141689585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772786483; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/IVSDt5qxDNc6Bx399LieKYpsTeaFNvbjlg23qEe26jRO43utZjZtgHmOanNLikAp
         NLqxOxImkMkBIzfntXBi2JF1XQQi3yvakklg7aG8u+V5Xk7WcDqSraRdY0UknsA2ZyAs
         7m+42SjWxlGDW0+W3myfNSkt8ivRmWvHF7QPSLYX660Um2R9KthMVGHKlpXpvSJAD9Bw
         8BIxEaxcbsnJpAhithpWt7UKaTBlVzBMxZBjudpP+p4uRAAvXpYUXDAJX3XJSv9pyZh7
         0RrzZ5ER+TvRBqyTnVmRElFXzoihL/3Wzf9sNGFOqRBfgA/wabjF5UGZo2Wqs8uld343
         pt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        fh=QegCAurmrpVUo3OT/PUw7ONDmh0Da9eYPP37MMUXsl8=;
        b=dhKb51woVBS7zS2dLUy+1z6JGC6GDxGG0AkWYgxOuADLuAbhHajfjyeFnclhkvd7gl
         tlZfDzg3IVedIUb5JQ/S7cWBOfGq1oc2iUCRntVb1t8pAFyDs1oK4rn3P5NmxUoxPutM
         wVVHG4ssaCRJ7y7QJ0LofQ+G4a5ebfXGFhqy4rjwrZbptTkEigc8Q7LyPGPVzD98k1tR
         aAwfoOILIMFlR9q3YJ6IZglfeI6zrIcFQUYyH0IVqh4HiLZR4umACPXu6qJ8y2m7kl+E
         ZpvCEKIZ2DaP69kLLpXZOAVLFwZJvoYWbrZH3jaSAkzMUJqhyK9BCJSTE/DYJYE6fbHE
         csXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786483; x=1773391283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        b=OKFXh+DF384LeuZtat3m7W7zdf0e/WXA/TB2uzD2h91XwXSKre5Ud0eGOwZih2zN/J
         6a5dYwFSkWDrTV3T0Jn6vgckmBMbt6U4tebYm6Sg2bmjaefG/aKuptHYs5A/VWYzgIFo
         oQo6evZ3BRHBdXpB3bO8hKcMRMuA/AtHC3n/y8xXcoxdigsJz6oTIO5fRmNcA9qpwDbJ
         yM3KQp0WB+jYVcqepI+qvOLAxAj4sYOEpzw2w+yc3FSmtmpj4sTi/7WgkxJusbgQGaaC
         Ce9lDzjK2hfF5jSGRbD78/8sfCLoj0Lb6Ty9kW3nPAOav6RMhW54+9TZ6XdcT6rUx8G2
         32Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786483; x=1773391283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        b=IzvD1hXdbzHj6Ch6+dyXdoBxRw/65903Y7cwcpkFUQ8TIUNQxfoNlyjQ93IJY7Fyok
         Sst1v6ZXzHRcDCG3bbWcvSGgqe9KLBP+ujbRVdMbg8m0G7YHEL5H82hqfEYLaahXJiml
         /wPtkz9w3kpaY6TCbnM9UuKgdgOeHJtcJOktEMtv0UCL4X09rMloWKerYavTiFMjN+VZ
         jBtf32zafv26Uggy69dFaiH6kgJprHCsU/XrqLr28HJaKkcUK2heL+wOjGYAJ/mIVxCb
         gs0GkIuSWbpmNy1YPADl5jk/XAcKH3smAzmxRL6QY7TyYhjMRW/Ao/oHns8WgWdHRDRM
         9i6w==
X-Forwarded-Encrypted: i=1; AJvYcCVeW3BVBXMDjiHccMhZ1SySCsQ3nyIwq/wbwGJd8CwepeoY3z+PpQ5mKCjTr0N6IorORwH2kxit0bsAcnoj@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFGd9KNrtcN1PcZ4uQpfvlbcp5tWsLIqrxA/CyxX6rnkPZ5e1
	LWn/Yshlx++cPq69t+434tBEXLpY0wEDL5PVpd/J30a68c3LWgNTHI2GY7gd2jZbW9ZEOMAgxk/
	QiT1FV0efEFAmMEdvd5pw4etLfMNqiPDQ/XRl+6zU7I6VY21CWMOgndUMtEUqCO4ODV6I3rzbJr
	tAXCmsRkeUKp3sq68uN5cx8oeQL/HIwt/w5jMF0LWDAU0=
X-Gm-Gg: ATEYQzzc/ObGQVOElJK53A7YA/IeXehUeKTlh/3IslDjDKGSn3Pnuyz9imvx9+ahjIA
	Wj8EWs9EpYNquEKwH4IY/NTaqMlQMSYSLREdl0WOPlcJp9awgV3aBBlBRySgsO8cHZRI3rjhi5c
	H16tCFSBmVnD7Oss+E9DS/AE/IYO0WUlUoukav1XkGXS7VatOHbGQH0mSYzq9XxWe7Ny/8IvwfV
	raxoTjBcjwgAA9+ASiBxQb/m9SVV0lk2NaGxA==
X-Received: by 2002:a05:620a:bd5:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cd6d38ed0bmr156599585a.33.1772786483291;
        Fri, 06 Mar 2026 00:41:23 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8cd6d38ed0bmr156597685a.33.1772786482792; Fri, 06 Mar 2026
 00:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306004344.10968-1-kerigancreighton@gmail.com> <20260306004344.10968-4-kerigancreighton@gmail.com>
In-Reply-To: <20260306004344.10968-4-kerigancreighton@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 09:41:10 +0100
X-Gm-Features: AaiRm50ityeSqNbLbi_vlqBFaxP1tMie2ALHub6uuVR7TUiuZkBUrj9KPTvuhPs
Message-ID: <CAFEp6-2MVFXfz4=_Em7YkH_Vx5VcryWMdDnrwe8C0=TnBmknZA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] wifi: wcn36xx: Add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>
Cc: linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69aa9334 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hsp69BweicYqoijZIzwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MCBTYWx0ZWRfX8l5J4YfOXD00
 ig1oVVe9/RcuA6dFrjKQC0PbGqJIWEntqO0hc0qXKP5WDporuYDxl50j0j79ooEqaSfE/Cc3kUw
 uP/aP/1I5rDJcu91z5YdeFO+vsha4yBnn470ZEUQkvO1sIfArchbccBvDwaEbrEKcf6fx66utGU
 PZW6Il2c3LP2shn15zwd6my3PClYPatF/LD5Lv3CTiZWkqxGsc9NZrshvZ0liuGEoIUfH486OWt
 3xUv7l2HB3HQ6d2qySSLaA9JwrHJ1fnlfoLtS11lJtT5tqcyFnbZQ6SkKf1Yq9lVOvVQFaNtUkv
 yFD+JrKnVukOzLndr1M5gcJA4GpONEfrabcgW6P4sVFvVLQ/bvmbgKxLSg4x25KlTGDX+lWOx/c
 lxI9cICzoyRjEs1EHG/pD6vQ0HqP3EBMKIEZNuHPA8l8BpztmB2a6ZWiF2fUQzWSCOnjba4TrJY
 m0T/nU5EqBTTi/EUw/Q==
X-Proofpoint-GUID: 7KU4A_8D1H0eq0AVXeg2XiJuBVPSCxKE
X-Proofpoint-ORIG-GUID: 7KU4A_8D1H0eq0AVXeg2XiJuBVPSCxKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060080
X-Rspamd-Queue-Id: 0A7AF21D384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95728-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 1:44=E2=80=AFAM Kerigan Creighton
<kerigancreighton@gmail.com> wrote:
>
> The WCN3610 has a lot in common with the other wcn36xx
> chips, so much of that code was reused.
>
> The WCN3610 requires specific configuration values for
> stable Wi-Fi. Without these values, there's packet loss.
> An extra CFG table was made so other chips are not affected.
>
> ENABLE_DYNAMIC_RA_START_RATE=3D0 was discovered from the
> downstream prima driver. That brought it from 95% to 5%
> packet loss. The rest of the CFG values came from my own
> observations and experimentation. The current settings
> allow for 0% packet loss.
>
> STA_POWERSAVE resulted in BMPS errors and unstable
> functionality, thus it has been disabled for just this
> chip.
>
> Tested on an Anki Vector 1.0 and 2.0 robot with 3
> different APs. Support for other WCN36xx chips has not
> been affected.
>
> Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>

STA_POWERSAVE is disabled, but the interface still enters BMPS mode as
controlled by mac80211. If you get the opportunity, It would be useful
to air-capture the power=E2=80=91save entry and exit events when this occur=
s,
so we can verify that the transitions behave as expected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>



> ---
> Changes in v2:
>  - Move wcn36xx driver changes to the end of the patch set.
>
> Changes in v3:
>  - Describe where the CFG values came from in the wcn36xx
>    driver patch [Konrad].
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    |  4 +-
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 61 +++++++++++++++++++++-
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  1 +
>  3 files changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index c3f0860873..6c90c13251 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1438,7 +1438,7 @@ static int wcn36xx_init_ieee80211(struct wcn36xx *w=
cn)
>                 BIT(NL80211_IFTYPE_MESH_POINT);
>
>         wcn->hw->wiphy->bands[NL80211_BAND_2GHZ] =3D &wcn_band_2ghz;
> -       if (wcn->rf_id !=3D RF_IRIS_WCN3620)
> +       if (wcn->rf_id !=3D RF_IRIS_WCN3620 && wcn->rf_id !=3D RF_IRIS_WC=
N3610)
>                 wcn->hw->wiphy->bands[NL80211_BAND_5GHZ] =3D &wcn_band_5g=
hz;
>
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680)
> @@ -1535,6 +1535,8 @@ static int wcn36xx_platform_get_resources(struct wc=
n36xx *wcn,
>         /* External RF module */
>         iris_node =3D of_get_child_by_name(mmio_node, "iris");
>         if (iris_node) {
> +               if (of_device_is_compatible(iris_node, "qcom,wcn3610"))
> +                       wcn->rf_id =3D RF_IRIS_WCN3610;
>                 if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
>                         wcn->rf_id =3D RF_IRIS_WCN3620;
>                 if (of_device_is_compatible(iris_node, "qcom,wcn3660") ||
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index 813553edcb..8d5a746de7 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -83,6 +83,61 @@ static struct wcn36xx_cfg_val wcn36xx_cfg_vals[] =3D {
>         WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
>  };
>
> +static struct wcn36xx_cfg_val wcn3610_cfg_vals[] =3D {
> +       WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
> +       WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> +       WCN36XX_CFG_VAL(LOW_GAIN_OVERRIDE, 0),
> +       WCN36XX_CFG_VAL(POWER_STATE_PER_CHAIN, 785),
> +       WCN36XX_CFG_VAL(CAL_PERIOD, 5),
> +       WCN36XX_CFG_VAL(CAL_CONTROL, 1),
> +       WCN36XX_CFG_VAL(PROXIMITY, 0),
> +       WCN36XX_CFG_VAL(NETWORK_DENSITY, 3),
> +       WCN36XX_CFG_VAL(MAX_MEDIUM_TIME, 6000),
> +       WCN36XX_CFG_VAL(MAX_MPDUS_IN_AMPDU, 64),
> +       WCN36XX_CFG_VAL(RTS_THRESHOLD, 2347),
> +       WCN36XX_CFG_VAL(SHORT_RETRY_LIMIT, 15),
> +       WCN36XX_CFG_VAL(LONG_RETRY_LIMIT, 15),
> +       WCN36XX_CFG_VAL(FRAGMENTATION_THRESHOLD, 8000),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ZERO, 5),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ONE, 10),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_TWO, 15),
> +       WCN36XX_CFG_VAL(FIXED_RATE, 0),
> +       WCN36XX_CFG_VAL(RETRYRATE_POLICY, 4),
> +       WCN36XX_CFG_VAL(RETRYRATE_SECONDARY, 131),
> +       WCN36XX_CFG_VAL(RETRYRATE_TERTIARY, 129),
> +       WCN36XX_CFG_VAL(FORCE_POLICY_PROTECTION, 5),
> +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_24GHZ, 1),
> +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_5GHZ, 5),
> +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_5GHZ, 5),
> +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_24GHZ, 6),
> +       WCN36XX_CFG_VAL(MAX_BA_SESSIONS, 40),
> +       WCN36XX_CFG_VAL(PS_DATA_INACTIVITY_TIMEOUT, 200),
> +       WCN36XX_CFG_VAL(PS_ENABLE_BCN_FILTER, 1),
> +       WCN36XX_CFG_VAL(PS_ENABLE_RSSI_MONITOR, 1),
> +       WCN36XX_CFG_VAL(NUM_BEACON_PER_RSSI_AVERAGE, 20),
> +       WCN36XX_CFG_VAL(STATS_PERIOD, 10),
> +       WCN36XX_CFG_VAL(CFP_MAX_DURATION, 30000),
> +       WCN36XX_CFG_VAL(FRAME_TRANS_ENABLED, 0),
> +       WCN36XX_CFG_VAL(BA_THRESHOLD_HIGH, 128),
> +       WCN36XX_CFG_VAL(MAX_BA_BUFFERS, 2560),
> +       WCN36XX_CFG_VAL(DYNAMIC_PS_POLL_VALUE, 0),
> +       WCN36XX_CFG_VAL(TX_PWR_CTRL_ENABLE, 1),
> +       WCN36XX_CFG_VAL(ENABLE_CLOSE_LOOP, 1),
> +       WCN36XX_CFG_VAL(ENABLE_LPWR_IMG_TRANSITION, 0),
> +       WCN36XX_CFG_VAL(BTC_EXECUTION_MODE, 2),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_WLAN_LEN, 90000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_BT_LEN, 60000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_WLAN_LEN, 30000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_BT_LEN, 120000),
> +       WCN36XX_CFG_VAL(BTC_FAST_WLAN_CONN_PREF, 1),
> +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_BT, 120000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_WLAN, 30000),
> +       WCN36XX_CFG_VAL(MAX_ASSOC_LIMIT, 10),
> +       WCN36XX_CFG_VAL(ENABLE_MCC_ADAPTIVE_SCHEDULER, 0),
> +       WCN36XX_CFG_VAL(ENABLE_DYNAMIC_RA_START_RATE, 0),
> +       WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
> +};
> +
>  static struct wcn36xx_cfg_val wcn3680_cfg_vals[] =3D {
>         WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
>         WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> @@ -632,6 +687,9 @@ int wcn36xx_smd_start(struct wcn36xx *wcn)
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
>                 cfg_vals =3D wcn3680_cfg_vals;
>                 cfg_elements =3D ARRAY_SIZE(wcn3680_cfg_vals);
> +       } else if (wcn->rf_id =3D=3D RF_IRIS_WCN3610) {
> +               cfg_vals =3D wcn3610_cfg_vals;
> +               cfg_elements =3D ARRAY_SIZE(wcn3610_cfg_vals);
>         } else {
>                 cfg_vals =3D wcn36xx_cfg_vals;
>                 cfg_elements =3D ARRAY_SIZE(wcn36xx_cfg_vals);
> @@ -2380,7 +2438,8 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36x=
x *wcn)
>         mutex_lock(&wcn->hal_mutex);
>         INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
>
> -       wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE)=
;
> +       if (wcn->rf_id !=3D RF_IRIS_WCN3610)
> +               wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_PO=
WERSAVE);
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
>                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, DOT11A=
C);
>                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, WLAN_C=
H144);
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 7ee79593cd..cb409d48f7 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -96,6 +96,7 @@ enum wcn36xx_ampdu_state {
>  #define WCN36XX_MAX_POWER(__wcn) (__wcn->hw->conf.chandef.chan->max_powe=
r)
>
>  #define RF_UNKNOWN     0x0000
> +#define RF_IRIS_WCN3610        0x3610
>  #define RF_IRIS_WCN3620        0x3620
>  #define RF_IRIS_WCN3660        0x3660
>  #define RF_IRIS_WCN3680        0x3680
> --
> 2.53.0
>

