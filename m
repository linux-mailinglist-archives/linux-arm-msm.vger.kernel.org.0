Return-Path: <linux-arm-msm+bounces-93769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB/YOByjnGnqJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:57:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55117BE8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C914305D28A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE68757EA;
	Mon, 23 Feb 2026 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O464EdD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9IvyeVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A84369235
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872996; cv=none; b=EVm3YD2a5JUjCVl4Xfcw5PzyxM3QHvV8I92TNiZwB3lWJkV5hScrU3lDxl55LuBdHZKsS1HKMMJy3e95OanqSxT1Ru/1jE1aFAfvfD2cEbivWq8x1zrs8t6RLYpKYJzusOMKyt1OY1hBogF//tOFLCtb2r0dv/9hMnrAS1/zL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872996; c=relaxed/simple;
	bh=5b56lDacASiGgUnOHSgqdjRRVkfE8yl+ebI0jaiiNks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiQGPFPoz4wWEd+9x4udg3P1bLcjN8iNERFSL6slYR2hvPcLATY4kDnfcATvtvoSp9T2MuJmF4daWjY1DdA8MRN7r5XEsP/3pu4eUxDgD6D1UtQAhdE0tgjSnQg0+Vt8oL1ailKBQhqkFEOgZE9Ej0DflViIa1ioMUY7nFUJVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O464EdD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9IvyeVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2kRI3151859
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+HyAuLlmMZX5oKqom1qGaIEtsM4vcIwqAOGKYp5mT0=; b=O464EdD3vtFXL7ZB
	dNkuu3gIwpa3OBIKRWIrKIQr6GiEO5NEi447KaLkstcHP4bdNk9piXFQ4nlqoU2G
	Fm/5GRJcBZS5F/Co28jkkVDI0hpWku/LfspiJ2nVf7EQn+AI/W5XRlsGMqBWZwtt
	XF3DMZ0mzFArtJ/+VrU8w54oti2unXSTSR5a9yeZbBXbGIJG+mlCBYlwghNt/7xd
	uIVz9FKmNHAl/5j2dTa2oDLAb5g5S15pcqgSxxbyTWWNNUjCYWCud2jd9yQ+nXsx
	yQohl56/sEfFDNDEDLAItgxJxLlqbues5Ksd2ewe+oOJb3mkAaQdWhZCUdvG5/eY
	r3luVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89am6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:56:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb42f56c4aso4718146385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771872994; x=1772477794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+HyAuLlmMZX5oKqom1qGaIEtsM4vcIwqAOGKYp5mT0=;
        b=e9IvyeVIa+Yarrs50zj5NbTuzg6u3FsJOIPyur85IJyHzTzuEsOUITxdwDx/p3sjze
         dZpc6lvdvGhZgZqFPh9WOoAAETPOrcbjhNi2uT6e5BuiB0IAMJRaxJKLjrLLT9u50BUz
         SWNhIZfyUqLDx/jMw8QIy90fWjSakpKXbpSS3SI+nDzwg4H7S7bvUxZIoAaer5JXAy6K
         JyxtY5LR0WFgXpy+XMd7P7r9i1uYA3wRVsBc0JiedY7d2fbSwESnLnKzCRpQuMdXbCX8
         u5OvZaKd2mI1IvcykNegMCACnMy7Rowpjn7Qy4NEggkR9fUkI4QkMuIuOYgxg0jhyt6p
         yvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771872994; x=1772477794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+HyAuLlmMZX5oKqom1qGaIEtsM4vcIwqAOGKYp5mT0=;
        b=PPrfztuDTgjUWAAQV1xfgiqwE8VXp/eN7+lpGiTlqH1Z5txsN7EDUTB3ornWmQXPx0
         68Q77KTymO2eUxS4fwxl64AIOosUL3Q59ap9YphpVD1Z4BWSfqBij/3PbUwCMWKdYLv3
         WLVf2nvGfrebblUGFhsoKFN3FQnnmMiiFxzCZ7nOkgrM8166+LZtMKsBKDWHZb5JsBvG
         BYxZoXGk82hvn/9p1DcNp/h/opYtGSTmRZqfgSgHU5FzHz2UVcH8KDkVn5IzgVNRCxUq
         ydblBFNunbCzeQImXBORai9snWetyrFwyuP2lq/2QDsbxHZFD+I37WKATegnyZ7X54V3
         d+7A==
X-Forwarded-Encrypted: i=1; AJvYcCXGdDUiJmNVHtFrw+YxzUMlddDquykVf7CJFfv0xkU5wm75pTPTG3Ch4z0EHS9sK6jX8+4l9tuTWKf6ICWw@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNp3Q9edmIUGYL4QWaViskGIJnQ8iQs1d3RzJDVLnjuzlgTjW
	vQ4ElxAODWmk2XLb7KuugPOY72QXpzbe0tEk4tcHlkBnRp4wa7AIk/lRHNAb8Nq9WyGK5aiF3vW
	S2ebsU0dxCCjh2qyu0YvazqpGnOJ0M5a33q+KeKbzauQT56SIv2+Off0sCJg6aNGXy5AE
X-Gm-Gg: AZuq6aKOz1i7wVgjr2fv9yGaEup8QhWhhKe4n7P/zc37JBjl05VRn0ttnAnjWGlBSbx
	zQGG8UC6C89QzIjVx8wUCL2AS3HtuRt4PXZwj/vazET+4oQKxmIuHUQgYfbbPkiJjJffTkDxKw6
	oOb7TIW85oly9w93zKJC5TNxYgjYJ0YZFFqZdzT6B6XVd+9s9tIQXgo8/pSrsUb1i0ifkf3IAKP
	YfMSTkf2rqhMe+3Q1h0pF9up1CgGIt9LcE1C0jyURt4OogNmI24qrccO3rkedhZu9WMvHiYvGoQ
	Hu8PDtJzR2/PYOU9WmLxrtJqDXzUVCCANW0HTi62SAEJsZEsqXAC2J2lyo9TbYF12S2Isibfbjz
	by29PZfBGHjrXAhqyxOKX3dgG7aKET4sFKjz72KUXg7binwa34WCFjpsFpdSHLKvq8k2dlhGFZo
	VLtN84/ILlsJf6NZQAwuwqcdgdbX78hSEQ9Rw=
X-Received: by 2002:a05:620a:44ca:b0:8a3:e51d:63c9 with SMTP id af79cd13be357-8cb8ca0274amr1248484485a.25.1771872993809;
        Mon, 23 Feb 2026 10:56:33 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:8a3:e51d:63c9 with SMTP id af79cd13be357-8cb8ca0274amr1248481085a.25.1771872993356;
        Mon, 23 Feb 2026 10:56:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2c28sm17104231fa.16.2026.02.23.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:56:32 -0800 (PST)
Date: Mon, 23 Feb 2026 20:56:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <ffy7ufbwofipmctotg6l6mrtamakqc6xxrql7wqw3rslhd36uv@payikxla7pzk>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <at7j3kbdixd7aveiol37pwgudl2hcogtdrvdgcvgbbm3t5irfc@4nvv5ptoezyk>
 <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NCBTYWx0ZWRfX8BR0rAdo3kY1
 gS5UXH+s3iKP4hCaRDL0d4L/6OZk9EaNh+Lm/9DvRU4OOjRzbVOzREWSWKXoh4ODUEqNd2HealA
 Lz+PGzdSousK4L/1r1TEaszLEppOZ5j7QGzaJqeHu0zZk1OQ5bzQJG4jnbmIKZZCdDOOMzx+/Pn
 WJb/o5x0LGaU7OmGpXVX/6Mk5IKxY+dXygS923h1OG/pcgNKCBPhWzunGMg1VJ+H1HjXYyZyH6s
 1YOrWEQLphVlOod6fTNmXYgY/2wvFPDZHeNhVZ3MHaWwxjK95Dd16vTZDZbvDWumFts4pVauZeL
 Tq17MfUQp4XPw6TjNFW4aEpGwvARkcwHKcVDEZi++UvTanIq8hX58Kn+tot2K//CdI23XsSvRmT
 8Y4KPke5W+DAkudLL5/K7Ew7AWbsf372cqE8ipbYJwUuO04onWBAeHSsMVIPgz0v+skLPbtoHX3
 zv1x4R36jXI06krjwAA==
X-Proofpoint-GUID: BCBzGDo6BKCpvzgU6rI7tk9Thz3tRXcN
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ca2e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=UtARNm0GgD_E9SB-DbgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BCBzGDo6BKCpvzgU6rI7tk9Thz3tRXcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93769-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F55117BE8B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:17:11PM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 2/22/2026 11:57 PM, Dmitry Baryshkov wrote:
> > On Sun, Feb 22, 2026 at 11:05:45PM +0530, Umang Chheda wrote:
> >> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> >> board designed to be stacked on top of Monaco EVK.
> >>
> >> It has following peripherals :
> >>
> >> - 4x Type A USB ports in host mode.
> >> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
> >>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
> > Nit: routed to? Is that M.2 only suitable for WLANs? What is "WLAN
> > endpoints"?
> 
> > routed to?
> If I understand correctly - you mean change string "connects M.2 E-Key connector" to 
> "routed to M.2 E-Key connector" ?
>  
> 
> > Is that M.2 only suitable for WLANs?
> Yes, this is suitable only for the WLAN module.
> 
> > What is "WLAN endpoints"?
> 
> I Agree this is misleading - will change this to "WLAN module"
> 
> >
> >>    - 2nd DSP connects M.2 B-key connector for connecting cellular
> >>      modems.
> >>    - 3rd DSP with support for Dual Ethernet ports.
> >> - EEPROM.
> >> - LVDS Display.
> >> - 2*mini DP.
> >>
> >> Add support for following peripherals :
> >> - TC9563 PCIe Switch.
> >> - EEPROM.
> > If there is an onboard USB hub, please describe it here. Also, what is
> > the story of mini DP ports? If they are to be enabled later, please
> > mention, why.
> 
> > If there is an onboard USB hub, please describe it here.
> 
> Ack, Since there are no DT changes required to enable USB Hub I did not mention.
> 
> will mention it here in the next patch.

That's not what I meant. Please describe the USB hub in DT.

> 
> >> +
> >> +	vreg_0p9: regulator-vreg-0p9 {
> > Are all these regulators a part of the mezzanine?
> Yes, all these regulators are part of mezzanine board.
> >
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "VREG_0P9";
> >> +
> >> +		regulator-min-microvolt = <900000>;
> >> +		regulator-max-microvolt = <900000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +
> >> +		vin-supply = <&vreg_3p3>;
> >> +	};
> >> +
> >> +	vreg_1p8: regulator-vreg-1p8 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "VREG_1P8";
> >> +
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <1800000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +
> >> +		vin-supply = <&vreg_4p2>;
> >> +	};
> >> +
> >> +	vreg_3p3: regulator-vreg-3p3 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "VREG_3P3";
> >> +
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +
> >> +		vin-supply = <&vreg_4p2>;
> >> +	};
> >> +
> >> +	vreg_4p2: regulator-vreg-4p2 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "VREG_4P2";
> >> +
> >> +		regulator-min-microvolt = <4200000>;
> >> +		regulator-max-microvolt = <4200000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +
> >> +		vin-supply = <&vreg_sys_pwr>;
> >> +	};
> >> +
> >> +	vreg_sys_pwr: regulator-vreg-sys-pwr {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "VREG_SYS_PWR";
> >> +
> >> +		regulator-min-microvolt = <24000000>;
> >> +		regulator-max-microvolt = <24000000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> > ... supplied from what?
> This regulator is supplied directly from the DC Power adapter.

Is there a physical regulator which outputs to VREG_SYS_PWR? Is it a
part of the mezzanine?

> >
> >> +
> >> +&tlmm {
> >> +	tc9563_resx_n: tc9563-resx-state {
> >> +		pins = "gpio124";
> >> +		function = "gpio";
> >> +		bias-disable;
> >> +		output-high;

Please add a comment, why is it out high.

> >> +	};
> >> +};
> >> --
> >> 2.34.1
> Thanks,
> Umang

-- 
With best wishes
Dmitry

