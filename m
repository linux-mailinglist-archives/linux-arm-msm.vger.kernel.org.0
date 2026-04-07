Return-Path: <linux-arm-msm+bounces-102181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHmlHgwe1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:09:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E180F3B0A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E0BB3104D08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF32A35970F;
	Tue,  7 Apr 2026 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzGfZ2EU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgxRqW1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B0C359A8E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574105; cv=none; b=SD3Dkioj8RvMEX69nmC6H/TeGkR6jx2fIdW9m9plBLo41kJ4FZqA2FAwz3T/3FwhOmC8RCVubmAsGzygFU4HNwz5PuxKGAGqP/3T7499mzitFUJtB7s9oVpBTmi14TLOONEvZ/ho/Iig4mfVZok2JNR/eD8xDGdFkT7HS2xB/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574105; c=relaxed/simple;
	bh=3X/OR1OHtg1qOzUM4YQAcooeFQasEO+hUsaJ77clL9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOTTo1A+uIGiOWbabsmmnDgU1BJKdiAdXV94Sk0Mu5sVeqfFW7easFA+NQ21FnuHcksfNuNz4VGzLIeiHamyV896Fr6eIH/bUpDkreTl6umwK1I3/UH70mM+KbCj5CdktK/GDd8rss2qc+NELv+zu3xl7QfCWQZxQl1MuI+zXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzGfZ2EU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgxRqW1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DjWM04008704
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 15:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GsM5S9NSNnQPcjnljHAvVjf0
	eRrRjyuwS++Io9AFOUI=; b=JzGfZ2EUxm+UeQC2dhrsMl23HJeEiSYpbYlsUtDR
	Ag2b3+uqRMcBI1zkHcggNLjxJ6jx/MnsLydmkgjqTWt9h9B3SZSzkOkIlwrJ6m8b
	rM/LniYjh38/ZEu7DObb+epkHHyqiZJPqXZO8cnArjGxtueUZYKd2sCQsUN7BP1p
	DnlP0SRuStCrAks39NSa4yEfZxpKhoFjFPh0uGGoDKpPFzuhkzGWsJoM4JqQKzOA
	WzlfQdYzWgGAQgJ5jBnhOyTy9QeKYYIo61p75FykL6Ujr4QAUMBoL9aUhuTrGd7o
	5GPfD9dPzXCdX+p5NMCYXBEwemjcB7x3RNu38cIsDBxwxQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrku78q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 15:01:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46f85ce99f8so2207068b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775574102; x=1776178902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GsM5S9NSNnQPcjnljHAvVjf0eRrRjyuwS++Io9AFOUI=;
        b=jgxRqW1C0ZfXbOXIVRlqm/3Iluz0Pj0XQWgG890tezroZcrLrVaWs91+DtXIuHL1a7
         sNRK82oavcOVLa3bthADg9MjXOwNUQfdxyVBkL7ikvT7iqd5SBvlVAh7UUSoWrFqbrvx
         hGQFiGbYTjAaxQfQSPmR2yoFigCPASfC0JJ23qMPJ2zw+yAh8sv+6dxTbEfP3/978oWI
         AdU7AMlj5v8hSasmUI9XCKxjKRJAhY/CHjHfOuKB32btc5JHDddYVFZr5+HLXsEXG8E+
         ZQuFeBZkReP7nA59TpDVVHAbKNGzECk5MLwxhDw/Ol6pr6Jog0pt75+rquHLzpPkwVVy
         02Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574102; x=1776178902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsM5S9NSNnQPcjnljHAvVjf0eRrRjyuwS++Io9AFOUI=;
        b=JLDPtTU7HyVOk8CFOOtX2QFCBqFs3aD/rHvuiHoKWvMPNp3bI5mO2a0Vx5afLvYMof
         U02XhCR8VApiyZmtAVX7JHuBO3zp5TCQp4WvjASS6P0kxpyc4pxO4nPNjcbGgcyrlo1k
         +GwXTnY8xRQ5Pw3Dt/CRlG9ZypAA/icDi/AS7AEX3bA4wZZlGFnTst7I+YrrzIMEDRI2
         fXtrOoRDJNpvU5+3VVzDJkJRssgE+xXMR0TdF72GU8NNRot4B4wEtrnYUrCFKDAc2L/e
         S/VfEBnvFHv5XvIb7eb8jcwNp2oZ2az85Fyc+TrnMRUDlf6K1rutmoI3rjSWgDNkKmca
         XroA==
X-Forwarded-Encrypted: i=1; AJvYcCXbXVHvmmjBAX2D3pRHgymzWCimywiCq8qsj7Yd8SF9AXIyCiV0dqWLP6fEibspm9PihvfZOEWGshjQUwD4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99bUtlAo6HnG5oEDG+cyllNR0VrVPqUHItcU531P3cwHMYW3g
	dXEZytHqjbgyxHUZjGd7Pu132hysCGLlXFta7Tk761roRYgIaUUp+mW8SLWcIH+xCOpMzcZUDVJ
	N/2qyxoJ/U0ULLkFu/Pp1mhAnSuLcGiz3R7S7wxSpmilcnMTdNklqPZbJAOGHMQjS1JHB
X-Gm-Gg: AeBDievQduRwgg0fjIFKJ3H/buUd+LxRQLlbF+h+G5pz67vk9HHJoPhuvL8qYWL/M3T
	mRqCO+tVZBFCI4S3i+kil5zYSj76mWhWrYWoc9c/Ax3mi0Rj6LyOlC9hr+tIGIP51J1OH3dWAeg
	kb0uZVa+dWj41FDgAV6Xbl3rJUQJz1Llkctz06lQfxvlO5Gt3wwBxQDSOarRQKTd3qdpAP4lD9l
	+22WTa4emrkcCAotQFv8pVc0neDL4IwRIZThtd8F45JiRFzuGymlTw4Rw+Ylxz0xEnMWPhiwoJf
	HsQu0wKjOFcB5NqggQQDeUHLnZWX00vTCbYZ/+UBe/IcMQhsz5R5sscQTGHCXIjpUALkRxsI6ie
	aiaC3r9fGMCT064TbNbm/UqPo44mLElubQMUFggwXnbMCv76M2/k+bnBClIjSsRHlblwl4qW+nv
	y60sIY3KIjuG9rwE9Sst/a32weIf7Oeifmwi4=
X-Received: by 2002:a05:6808:f8e:b0:467:e80b:d5ea with SMTP id 5614622812f47-46ef8a3fccamr9503441b6e.49.1775574101248;
        Tue, 07 Apr 2026 08:01:41 -0700 (PDT)
X-Received: by 2002:a05:6808:f8e:b0:467:e80b:d5ea with SMTP id 5614622812f47-46ef8a3fccamr9503084b6e.49.1775574098252;
        Tue, 07 Apr 2026 08:01:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc96fsm4075762e87.59.2026.04.07.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:01:36 -0700 (PDT)
Date: Tue, 7 Apr 2026 18:01:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <s4g54pra266y6p2j3f4fps56naw4hm4vzuai5sgpf7sdbbewj2@3j2tkqd3qgdn>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407113925.4imd3lxkcrq47pu3@linaro>
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d51c56 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=F2SXJ95XJyWdONsWzOMA:9
 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: qlB7B0EoKd5EKFzc9jrCUo3Z4uifeKEQ
X-Proofpoint-GUID: qlB7B0EoKd5EKFzc9jrCUo3Z4uifeKEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEzNyBTYWx0ZWRfX0igfKtOIPDB6
 SCvJk7cc3zKEQqm/iJFTHpeepDBC3u8eP1pO5aJjalf5QvvWmT1xzQn6WPyWPfNE7Fhc/Mvx7X5
 Fg8uz2y+DRLqZovbp/g1x9xwMUlZ7lic/WkpAKYR7JDdjP1ZCgeV6Eh+03JAA0fmvxKvau0KayX
 50yjnhOdxkBQVOD1nDnK6rPAN1PMpZRTOiXorW4nj/0LdASpz5XQHJOigmR2Zzw+eFaCYW2j0Fk
 EjO+OoWmmjsOBtjjW0uvogF0fo7yHkMQLdpO+r3lPG75LTS2HdthWoU1cUZFUzV8ES8b1dlsGJl
 m+sfnsVHIYM+rxYMuoF5UdFsLFSWFaubTZ2cuxzUEWv0UWJKmCQ56YVjCQIiHgL9xK2cWnFyi7K
 MM0TrHMLVeZcLwaQS9xYMW8mcqLn+Ki8Vyg/Gq3duvd9EC8LMgYU6q+NqKDqGM+QOuvGGajI8G3
 kUgkyVjo7oCurFMm15g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070137
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102181-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E180F3B0A9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> On Sun, Apr 05, 2026 at 12:20:23AM +0300, Dmitry Baryshkov wrote:
> > On Sat, Apr 04, 2026 at 10:50:58AM +0100, Joe Sandom via B4 Relay wrote:
> > > +
> > > +	wcn7850-pmu {
> > > +		compatible = "qcom,wcn7850-pmu";
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> > 
> > swctrl?
> Bundled into bt_default since it's tied to BT

It's not. It's either WiFi or BT.

> > 
> > > +
> > > +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > > +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> > 

[...]

> > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > +
> > > +	/delete-property/ msi-map;
> > 
> > Why?
> I tried extending the msi-map to cover the RIDs from the QPS615
> PCIe switch (matching the iommu-map entries), but this caused
> ITS MAPD command timeouts. From what I could gather, deleting
> msi-map forces the PCIe controller to fall back to the internal
> iMSI-RX module, where this worked properly.
> 
> For reference, I checked the RB3gen2 since it also uses a QPS615
> and there doesn't seem to be any msi-map defined (in kodiak.dtsi).
> 
> Any recommendations to resolve this properly?

Maybe Mani knows. Please mention this in the commit message at least.

> > 
> > > +
> > > +	status = "okay";
> > > +};
> > > +

-- 
With best wishes
Dmitry

