Return-Path: <linux-arm-msm+bounces-118276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1NHXG33pUGpS8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:45:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A273AE21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:45:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ohYG6GKg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d31KKnR4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C243300DDDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FFC31D372;
	Fri, 10 Jul 2026 12:39:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201B408624
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:39:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687187; cv=none; b=lNlhM1MLDziyI5plaO3ubx+5BRuqeLJsHWBsYXG/FedS+Nwu7dF0YXlxAmSl2zrrGFtvZEWyG2/aPzlgvw4XdvFsqSo/IkgDQXmtaDyMi2D2DoLQqGeiH9te6CdoeQMaqKwwsbsVOuTjWlYVH0O55wyxN7ahIkFQh/xS0//3qhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687187; c=relaxed/simple;
	bh=yv4vyEzhqyD0fyzec18PVIDdtQdUC2k8Cxa4DnzfS0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyj5yZigzuVEQDiSB2E2wjQOjIzfnMB1d8opJKrKYgo5Qnueeg+MMw+vHGHSpfRpXz++uYoRAVx0Uk+mH1uVKACGtepnO6fQM47x4DwMLIRgbCDFgjKpADhyWRK4KKWutXE7B/H8/KP/QhBhwRRnOZ83kKRjwpO1IrvgNz8ScPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohYG6GKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d31KKnR4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmTbS471825
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=; b=ohYG6GKg9OBURWb/
	HXIyWkS17P/usfLwVzP5BSHljAtW5LP7nrN5MdQS1W2rwj8khWqdoFc6r/gECRWF
	qPaINKdhAjOchPrciJik/89sSsN9WnUZR8WfmpYB+MhPhTt834GKE4xauZ8W7QRY
	96G4S/wPaMxQ6pa5oks9smIMMH2TN25dEek/c69IJcM7ieP9swb4LxbvYo9Jbo7A
	DSkpOG5UCFaJeroGQU0Nxf79QBWwEk56szHyrur/sa/VrTj9A0l1yRxCbEFhYSo6
	y3CxbFtMawGPcDEfUtmHzldBucWzHpaQCQwrk0jWX4AL7IqahdeEs/kB3ZHN8hIC
	ZXcVIQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgn5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:39:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96910ded42cso272986241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687185; x=1784291985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=;
        b=d31KKnR4HjZcn4xNFUCoMP7v3tj8DQbMmCBnhT3C4U0U+Q2YOc7pioZ4+Z02cXbE2j
         ZhT4+elAa9LqUr06Y43oLMr2s3GJhbNWpsQ/bl3NMMb2J9knCpqwssiZ/D5V0S3vtDcF
         FyYorzD0I+iXTVN9l4ctiQLP1ubQdBMv2wQ1LVbpKo/TFwprFNMJipnTESs2k3ZAwFlH
         43i8vjPyuQTJawN5q2jSkRBd2uwdIww87rBBToLvU79qNZeZJshjPb/UB62sBCAK7U/1
         Ze/ftse8vqgShy4+CaD9k1P/EhutyF096OWcJYRAKhmZ8tk7kLGfFyhwjGU/NqodMPKd
         DM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687185; x=1784291985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=;
        b=eSoQbguMBM1d/+4QqhHLV6qTaXMPaqayd9CFHMHBVGJz1bUigwPFLLgoneb2LBAjoQ
         zDR4FvXvYAEnQW2T7t1l2xl8RjH6QXAo/ODTCdk6qClptQFBgQL+XRvCuTRCj+iRroBd
         QQmKn60s1otuSJDVpWtW2dP4aF4zvvH07p1apakpvzlGktiXD/XCOHJ4bX6wceL9oGC3
         rri6KnUKDt9MV9hSfsSyxhOG5zU0/R71uwWtex93ylHZB7Hjwj6TXppTxx+TWTP4GH2j
         K6dzeZ6MUVs6f73EXZPGY6NWgWOkcg59HF020iem6HGQqbt2CH8wKSRZNGmutnDrIf1T
         Fejw==
X-Forwarded-Encrypted: i=1; AHgh+RrHx6IP/tzVP0zCyd1jv2ydlRAdeOKgflXH7X5NoIfdNdyDyT7G2KZbNqPERiEemJkF6olev53aUw6OtJ2K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kf0Uqzor66geJbDx112slWgFObU5vKolM5P3aEE5MyJCl4jK
	wk56lTOb2v8LzK88vFOuTiGAAvpYjKNfnU9sPVPhbvIsMaZnsKo8lyloUI2BJZTw5DOWrpbiMxz
	4BHXB3k/GMs+J486VmIVhAQbX53xxy5GJ/MJQ6M9rN7kj8jDlYo6jXLzQ7vTaKlUSngGM
X-Gm-Gg: AfdE7clmfsiIhFhDVRGiYbI8gaIfzZwnXsFCxkNHJLkoW4EQ5VFclYtMVtYywOWhieM
	bhnJNBoyYNl48K4qIh0DFRQr84Ie0OJ6L1z23f2m6RBOM4V2kdG4w8AFzXDsYGIAwg58zJQqT/L
	UbVRcb113+8OBTES4HtuHLD9iDvNA8TmhyZUke8H8tosTfKlrDK1umSDQtrPipGA5FmHr6KsqUE
	lcbiXHFxEDxfCCbcjDUKvZwppbrNyQQr7r3/HG5AAj+bjDxzyNrHIYcT/jquPb5ta7rYcCZYypi
	J3J7ZLBX6Q9j5F3q8A/lQRBAoRIl2wPf+dwBeBIEGAM+y2bjA9JxJmF0kC/ggTRYY/Mj5HD2a86
	sa7Sf6jarrrgkVuL3SCTlLGuZnfTrRiNBsg2FL6F1HLBC4gmBkYjzU9VgVV4E4wNdRGGZGIEm8L
	VfpEMhM0UYJZz15jFFmm08m2ax
X-Received: by 2002:a05:6102:580a:b0:740:1df0:6ce1 with SMTP id ada2fe7eead31-744dfed34f0mr6277797137.2.1783687184714;
        Fri, 10 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:a05:6102:580a:b0:740:1df0:6ce1 with SMTP id ada2fe7eead31-744dfed34f0mr6277775137.2.1783687184201;
        Fri, 10 Jul 2026 05:39:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b83a93sm9981421fa.24.2026.07.10.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:39:43 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:39:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX2M8tcPqLNswQ
 404EcW1DFuDiXUAMCrnDGCqTH/4YlgKG78n6gghx+HmUyenAOxtky6NcHK0OLOO+KVp9vjDO5g5
 0bGNMz6V+W99/bLesOO8JoiSkXMI4YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfXx446GMDmKmgl
 u03OjcI1JL16gUXStHgewsWsfnrZjp+PtuhI3zQosxPmjkHZdIaRoPFXFQJVwLTV3i+fqnBQ9Hv
 CuXupKu1LbMAa5p1Ud22JtKtT2T5iXn9abYXUyjV+IWu4csgZKjWIPc89qYLHzSx1oCzw+O6Imh
 WA3zDoWovVMtqYDy/z7JP2b6B4crpMEj9tAiXRdNolHCcPyhT5DtPK6IxHyDFrRsfklF5P6+NsX
 vfnOcIQjRPulkCltj317ob5MxO8RUTKWPSQm7+8ECGWB9n7/KlImSClcs7BGY6rTF0b5YDrthCS
 n0b2Wk4eNYan476zVeIKbV/sVTlVqN/ILfpVT3G0sO8WlbOeGm71Csv3Vq5tTBr8EO4mNARqWGR
 8vnOQbvvMCRw06MTHS0VRZRgz0y5+Av/MfadRJ2nJZs7tTt5lP/MfAmg546c1h/p8FW+26OoIYP
 yiRWvbjIAqKIP7UUhYg==
X-Proofpoint-GUID: af8XMA4Qi_RgaiHyxCXUN3ZYwZXSxWtA
X-Proofpoint-ORIG-GUID: af8XMA4Qi_RgaiHyxCXUN3ZYwZXSxWtA
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50e811 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XgB7ONbkh5Cc0Rj1ql0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100125
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
	TAGGED_FROM(0.00)[bounces-118276-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ohjpgawid6jf:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC7A273AE21

On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> > Hi Konrad,
> > 
> > On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> > > On 7/6/26 8:04 AM, Nabige Aala wrote:
> > > > From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > > 
> > > > Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> > > > board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> > > > to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> > > > 
> > > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > > ---
> > > [...]
> > > 
> > > > +    panel_bl_en: panel-bl-en-state {
> > > > +        pins = "gpio91";
> > > > +        function = "gpio";
> > > > +        drive-strength = <2>;
> > > > +        bias-disable;
> > > > +        output-high;
> > > > +    };
> > > > +
> > > > +    panel_bl_en_suspend: panel-bl-en-suspend-state {
> > > > +        pins = "gpio91";
> > > > +        function = "gpio";
> > > > +        drive-strength = <2>;
> > > > +        bias-pull-down;
> > > > +        output-low;
> > > > +    };
> > > output-foo isn't necessary, the panel driver will assert it as
> > > necessary
> > > 
> > > Konrad
> > 
> > Ack, thanks for pointing out.
> > 
> > Arpit
> > 
> I just checked,
> 
> Normally the backlight EN pin is controlled by a backlight driver.
> 
> However, this panel uses MIPI DCS based backlight control with no
> 
> separate backlight driver. Since there is no driver to assert gpio91,
> 
> we control it via the panel's pinctrl default state..
> 
> So this is platform specific pin , we need this to enable/disable
> 
> the backlight.

Handle it from the panel driver. Also please fix your editor to prevent
it from inserting extra empty lines.

-- 
With best wishes
Dmitry

