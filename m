Return-Path: <linux-arm-msm+bounces-118904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rMCQOj2rVWo2rgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:21:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFCB7509C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VMwPAdvv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AWyOggLB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2798D3025E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A00425783C;
	Tue, 14 Jul 2026 03:20:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8F3A254C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999208; cv=none; b=l1mH7cP2HEil5/926UsA8Vn2/S4WDOE8wf/JaBqO9DkKEYtVJ77WtBN4xdfs5uE1wfuvKtrznF7ioPniIINPcb27PkT283vZh/g0H6osr9xrN6ztN93LhS9YY10smJvWjOfpxEBUygBoUaXzY4FzAejEdtNUz7ykfMqQpe3FT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999208; c=relaxed/simple;
	bh=+/S22kMW7/+loIW+zeguuEGkg/5tPuwQR//oJwuZZDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLHIJY7Ilt8ukRXHTUx/3fUEJKtbkKheUaayap071KCrpfnoneIhvYxqydQTr/dzeFY7XDTAodKY1jaUH7bycjCD4LC4GTJYlW60YTautEDefIf6xxH6+7hlcB01g46f9uHjD+yW4xrmciUZzfhVNjzZXaT6eL2q277topNINNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMwPAdvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWyOggLB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38OHi3303111
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k1pfnEfNlNBd0jQCJ7S2U+7u
	jH/MbH8zaxCRpzdA+NA=; b=VMwPAdvvVMfJ+AsseZ0Nu/0saPAXow4gekEybIYD
	+YtfmrktsBe4i1yQnvvMLSgqA3rVI+MeeurYBLeSkxZsH8G8mkWr+ROveFA8g07Y
	bvziEsgIkmZj+gUh1TEsXNkq17A1yvHAtG199iB8l/Jp+kh+FGjqPRH3X0STSp9X
	N959GfKaFgMdLr3CRqOeZqeFSWIL0AqU5cY3+1OyxDg5rh2BvYxk0IMk+ep2rbjz
	Z15EhMM8rjqgtNkRkSinzK1jDLScPzHk1+FoiBe9Uhvx3W1FRey1T0u1L12AN6Qw
	Q0Xl8vogrK58XkVkL7gHR6eF1GuCVX8T5qepb4HKOpFxlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1q2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso1156095a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783999205; x=1784604005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=AWyOggLBxkza49SU/mqHXt4XY9swP2ZZj2mQrVGR7QoywUaRYrGISMs9Sy8d+px3kv
         OdGW+TehAYTo/i2iUrP+zoH9DitDUk8cm8a3l//d53CrXhSNve1GTxlx/ZL9QO9XXWRG
         UY5UxAveAFfM0yx2ruaCJfQxTE+8bb4HS8fn87oOTboo3fYdr01OOsHkZSb7GtUHBBoT
         eDS2qoCwiDuzg4b/7INdtn/7Egsa/VkmKCChWMc6kfaDZNI5N3h8E2LGcxUkNduxdWsH
         Cf+Gvrw+A1wrTNLrMKwuB0ExsZTUIwkt0WKCF21o5LLB7D5vXKZDxQagNmiFCfc08tWt
         mHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999205; x=1784604005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=W/JQvU7AC0iMQKMRwY6ZPpiQHD3P1GzbTG/b52BuFouEsZiC3GJx/E3A0eWwy2ZQIQ
         iUgZXCUYrHfgBxtq7DAVtDIxWJlKSIuKQKk8ZM57CbNtj3redgyiAmsEwe8H3OYnyG+d
         Cl72BMM63ruIxH7nK4v3dUua2RP4SR+J06GOUK+w6XD8ypoWPvYObf6k+4+3imy6Gt0K
         GQollvQT1aCTKgrt2D+2/Qk/mMvPYfg1YerdTAelB4/BXnR63HKxQR7MBJTIaB28Vj5w
         QKaPOUTou397t5E9VuCqUN1lhgmobIEHUo6D0+XW3tmcvCpZXBXwuZB/OmsyfHdtKCGr
         T4qw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu/VJTfVtMxnzTvSm9MyeZYCPCglPnD9YdNQNHGpXNWn6V08OTauys0ltbIkDzX0UCGrNFsjxoZmKvKPS2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7NYNGNRJbAtF+eBMr+OJD9y4QiGzn/WWjPN2shD/KRuFOObwt
	BN9e/CvJjzpsq+595NeyMaXOwhTlr+uAsA11DskqWHo0vyz7I1YPdH25NBYLkMmwie24o92ox3A
	E7Dtl/VSPqUlCzgSAbBifg3GnmbWzp/0IFPLZ5Jet4Zs7rkKEi3pdvj8VTnCeyKlv2S3d
X-Gm-Gg: AfdE7cl2NYex73MBD6GRTa5LWU5cePVI9YS3B85zxvOUUG1sV5kFsSuTtmp2j9UfR5I
	N+LIp+e+sXRGWyfOuo6xgXLDEMk0/F9EwB4h0YOtZEpYMg0AA71u+UZCVTpSOYSpIMlz2gkipHW
	oXbPuT0uxMv5HAbE6gIwK61erUJdxnqIyeAR8mbhfhqHeHtnt9RLjrX9XRF2JqaFVTKDWwJTWvx
	QzK7pYhR+W4U763dBg2J1MgmLFRCoRFBfFcUiuwQsO1AAPebkufXKXvN71v3Nx3szcSCOasFmUY
	LIQOX4AuOWlAA9tJbBts1JlRmBJBCCLveU73Uvmi4MtGGBCJhxrqY6aoc/KCwDZIaWNii6NGUMl
	ETpvBN2dpTyuKfMuXL56IYCXFCsc0OWv1XGA25FxFSGZ2FhBjiCokQRqNMBdB
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341079637.26.1783999205434;
        Mon, 13 Jul 2026 20:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341043637.26.1783999204930;
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm81154981eec.0.2026.07.13.20.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 20:20:02 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alV0_DHvBFpzDumP@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAzMSBTYWx0ZWRfX7elilcO49gl1
 xxeo3J5SoM8FtGBiNnqqpqSKf1lwKCUUe/o4hbytX8M6JNXjELwN0yWTJ7W3sE2WGrfpgrlZ0vB
 iV6yQRwPmKJrEnhO2pOrM3FZ9QSo35k=
X-Proofpoint-GUID: Yo9tiGjj2DXGbVEt0mTjYBtHoFgoXbGo
X-Proofpoint-ORIG-GUID: Yo9tiGjj2DXGbVEt0mTjYBtHoFgoXbGo
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55aae6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=G0XHSz-fAAAA:8 a=9s4_ODXOAMUL3Z7cIVoA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=9GzJQMQvVMogKS571uVa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAzMSBTYWx0ZWRfX/VIUseDLmztz
 7641Xvim3HAv+wGHFgnmoxUhf9cUJhMnb64jUqNiI+xHqH61gVFzRw9jnqVce4YaOCuGJopJFQ/
 6EJaItXA/D2XgDRkOYmDf15ickpKGq3DQIgrQeo8INplyBBNX4MNMRHqEvxvkYjAgo1h7aDLY4r
 qktmeFyNmjfts4vh2SZLOZqou64LylaHT2M6lUh7VpcyWEi7Obn5dmIx9RKIryfaofk0Tc1xS3p
 pjzSCNdYlPczILdeJaBdk5BdcJVhkVu9fyceHPKB4SshFJ9LZkxIjYDB0A31HyRHXNtzdm/al/S
 HlihjXsqOxvNpBIPyJF4BqzXh/dShPHfKQkPA0jCLHGzCKxaGt5R/49vXtKI1n5W2nwSWbMXxHD
 1vS/IraiClB+Uh5N9UKRevpqMW+2Ke5YwdzseInS6w/PmbsOEWHa4ixpVXdrWyT50dqQgiYceiL
 tszgMKJ5uu4KLJ3ejdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140031
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Thinh.Nguyen@synopsys.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FFCB7509C2

On 26-07-13 23:41:14, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
> > On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> > > >> And Dmitry already said this at v3.
> > > > 
> > > > And I've already responded to his comment in v3:
> > > > https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$ 
> > > 
> > > It does not change the fact that type of phy is implied by compatible,
> > > thus you do not get a new property.
> > > 
> > > 
> > 
> > For USB2 PHY, it has property "phy_type" already, it could extend support
> > list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
> > or re-use dwc3->hsphy_mode depends on where it needs to use.
> > 
> > diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
> > index 1ab134f45d67..5cbf17d493ad 100644
> > --- a/drivers/usb/phy/of.c
> > +++ b/drivers/usb/phy/of.c
> > @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
> >  	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
> >  	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
> >  	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
> > +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
> >  };
> > 
> > 
> 
> eusb2 uses utmi, so it doesn't fit here as a separate mode.
> 

Hi Thinh

Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
Features.


> To go this route properly, we'd need to introduce a new phy type
> attribute in the phy framework, which will be a bigger change that may
> impact more than this driver.
> 

It is not at generic PHY framework, it is just for USB PHY dedicated.

I do not see big changes, it only needs to change above files and related
dt-binding files, and other users may leverage it if the controller
has special sequence or settings for eUSB2.


[1] https://usb.org/sites/default/files/eUSB2_1p2_20211217.pdf
-- 

Thanks,
Peter Chen

