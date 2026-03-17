Return-Path: <linux-arm-msm+bounces-98224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCPqFf5wuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8F2ACDDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 146F9302DABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1713E3EB7FC;
	Tue, 17 Mar 2026 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkyePkpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIeP/h3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E033E8675
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760760; cv=none; b=fsZhR3VZe4QalMcThOLIG1HqY81507PWKUSwHdrr4icEZV+Zz7NXLwH2hIIBRDEIGIh55ZdCkof+2DId2tJL886voKiqZqPuxmXZIO/MtvDx7XoCV5Cel9qHJWsN5sqk6R0+1ILsK/70l+c17F+D1t1wLV1D7jTCfu4o8g5hT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760760; c=relaxed/simple;
	bh=ekOYh+oD1LzaEfo7kIb7moaX8C4Am7vnNruZN9qf7mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAFiqc7Sk1825nOsGDgcvzXwXUFCBsDAoViUfHfd0jafyByMPi0OPP40jNMhunz2EKQn932ajz4kxZF4XnCFWnviXdjNHTWKulUYpJlVkg2ZBtRAC8WafgEqMFhyWJQvNAw7wn+Zw0DE0sPtal+fo8cyd4fT1pI1KYdpwE0OZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkyePkpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIeP/h3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBlegd1025576
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWXj7T4wDw/b5twPTd2WmgoUQYkMAG8/8IF1ZsIHLuE=; b=bkyePkpDxiwlhJCc
	Nf/okQ3nD/zm3vvtzkb1b6vDw0k088Nya+RKoMg1a7XKqHkxHAESJdMwkumvM8+R
	j+RHn6/NbwOIYiwOYdMyIPW+8uSMHlvK7iyvI/0VgYxe9gWhtBoTJf+rxHkJlh6i
	mKdG/Iv+00VBo/ps2ttgTUMMNob9yaU7wq0tNjcJBozoHUJE/W9N3g9jNWco9+VZ
	3LvFaXqKjSWUfcgr/Xi+UClZf2lQ/4bmJA5RRPC9q3cT0oGLV9sb4aHbzr2YsIGn
	HoQiZxNufI4K1CuGRxIxELbZI4EoKsxLsVTj+FmG4tmSr50MGQ2da6oZ2+mNqP5/
	S4sBcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6grjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:19:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad9f2ee27dso30615625ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773760757; x=1774365557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWXj7T4wDw/b5twPTd2WmgoUQYkMAG8/8IF1ZsIHLuE=;
        b=bIeP/h3K5vNH7/Foe9puYsfmX6sDWvyE6AAUpudCgSW0lhBQ4G/TfEw2oGgvRgg9qO
         vD8vhIORoGg/B8tSaWFZoNX7nrp4bIawhm7nplZBSU9pFbhUDqCOmkMezafDYGXkWaoB
         pKC/4/3O3OoAZoCmICO90H0jo1PsDQHJiln4BYzsaOvr/unKE1LRDeDgSYXuyU+UXydL
         4M7MjdLJfMlyFzOq8S9HLoyGjQNxclVc+If7bSUeVckyCsKYowgbH6iA6Khd3ttnJccz
         y4bnlZe1LUTHugqAkvQ25h8wBsoLzZqNeHYf2iI/r2A9RB19CVlxkcZxRDViqFGz5Kqo
         2C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760757; x=1774365557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWXj7T4wDw/b5twPTd2WmgoUQYkMAG8/8IF1ZsIHLuE=;
        b=H2r2YY/8v4MPbD0ARnNuug5Q/Caqx/++La7tQPGpDunDuFfMbYFg5VkRw0b90RyHrZ
         lJ7lj9a9UvGe5wGmkqONcNGmeDLCgnnDfb+Hw/HBfMS7Dch1Wxb6TeJUmM2Y/TW/BAn2
         PrwjaxeeFXpw+2mHQwM+H7WHq3WMheZmI3Tld4AFkLUcoYU3hBr9Pt0I/laOnj4I1VuD
         NSeYLT7t0guWKY8sxFw2IMwK4yU+lTCtQoaO/GgeXkA5Gb2dMGfH0QLYQbwMICvBDA2Y
         iCKkEb6JOILkcEf6HswmeLCebkCv1Yki6W62fTvXmO9jkc61t4MkMZmqX/b01Ab64NgL
         zrdw==
X-Forwarded-Encrypted: i=1; AJvYcCVgPbHfxROwNxx6f8/gmr6spBXxbD1zQc/svV95czaDJaXKSojqtJAurCIhg/hv70ehlvydaLVSIDMedpAj@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqzJWvtVK339SCMDA0+DOuzVoOqhG1/9whBtQOmwSyMbven1M
	vADsk/QbDN1GB53qv8JVg1ZCr3eAo2F4stt6bjIEmyCMvRr9RomZ+7YE85n4h0AGrhnW8+Ylbr9
	fCIkVAz0+5CTUDvRlCxT61g7ha2Y7IQbgqaOMYlFxN1cubJfRCPwRRXCDUvb+bYnz+DWiNySsVM
	/z
X-Gm-Gg: ATEYQzx/av/MRDqH/Xb578zUVAP6criS+0RNby8D8ntbisCNEOroP0uJqMSnquSodwP
	LvBsBjouD6qjia9PBZ+inXTtg4EVaZop48RRPVkC/PGUtnP3UTS9CrhxddlLbO7zt88TlzFJq+E
	UdxyjRv26XYsMlAejGaXNeDAIHtNW3y9e9rqvvDKvtWh4JMsFjE8Bem8hGN8g9ID8EI3Ax55lBV
	1zla6wPXlKvPuV8DHwcKOB5ZLjKEt/JKb7RRjiasGLlUM5Nd5LPPnG9NyA80S3H5j227Wp/h6MG
	0E4bhhbdcSit+93Kk7U0sBXkBmxjZyRD8lUmJiQBKVKmuLyYDDdXd351/ZcXsrpPAAIpGdQrLLi
	awbq1SP4QWNwjMiqTkqlD0cvPSi58K/umXRz2TXMl6trLC25c7enKhcRlIl5G1xe16LzUv5GL2C
	HGqVRliTvSx50TLGkOkZrIXH3S5Af8yd8A9xcLT0wZFg==
X-Received: by 2002:a17:903:4b43:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2aecaaf6b20mr132981285ad.6.1773760757273;
        Tue, 17 Mar 2026 08:19:17 -0700 (PDT)
X-Received: by 2002:a17:903:4b43:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2aecaaf6b20mr132980895ad.6.1773760756725;
        Tue, 17 Mar 2026 08:19:16 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b062b8d3c7sm37503895ad.5.2026.03.17.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:19:16 -0700 (PDT)
Date: Tue, 17 Mar 2026 20:49:10 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <ablw7hS8OyvlQ/IF@hu-vishsain-blr.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-2-8195fa931ff1@oss.qualcomm.com>
 <56829589-1c56-4c96-a9de-505058467867@kernel.org>
 <ablZcxUIJDrrs9Vb@hu-vishsain-blr.qualcomm.com>
 <ba22ae2a-06d4-41c3-920a-f1fd589a2111@kernel.org>
 <ablj7R79VjE5Kb2s@hu-vishsain-blr.qualcomm.com>
 <260c3c17-0d90-4253-84b2-5d53ae4ca975@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <260c3c17-0d90-4253-84b2-5d53ae4ca975@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNCBTYWx0ZWRfXzdeKoI7u3DhS
 T/lRy7avkv6mYuL15YmHXjSns+FExfBkFbaFrHWo3ObNhgr39HZKCE85L1J8zQNl88OzYubiPpt
 fWRzrNg1RIvg6mGO1CeC3fZFUBT4a3u/UN/c//TBlgwKPdsUVQf9K0139DVh2zQkdE7fRRfTdfh
 A+K1d1en2C/DeBFBOE7ebB+sNAHqx/uXVC/4Lyaw4AXkDb8tr3EMJRKTIY37MQdeaykooq1a3Rg
 97242hig/4y71cLD695Q6a1smGaX6JTmcCEOcwIlMGp0K/NEzvHzcYc3CwN6F0ObegRBd9irnlG
 7bxSFMTkI/NzQygLSvkH1PxjF1yMeuE8j2Zcgcz19XKUdYx++nQsn9LpvHeEtfaXscRPLVel7iV
 22adR9XOSbtOPRzwGRUPhHL6bjBflAGaVTra6emmwgXQmENGBtcVR0aYSPfemScxhmC7gY7b8St
 GOI4mvqaJXbJsktqk7w==
X-Proofpoint-GUID: d_I_cjnH9XZvQ3ZKLS2qj6PS0YTlxPZB
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b970f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NnatKhEaoW9bbCzLYh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: d_I_cjnH9XZvQ3ZKLS2qj6PS0YTlxPZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-vishsain-blr.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98224-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41D8F2ACDDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:40:54PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2026 15:23, Vishnu Saini wrote:
> > On Tue, Mar 17, 2026 at 02:49:56PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/03/2026 14:38, Vishnu Saini wrote:
> >>> On Tue, Mar 17, 2026 at 12:44:05PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 17/03/2026 07:03, Vishnu Saini wrote:
> >>>>> Lontium LT8713sx DP bridge hub can be found on a Qualcomm
> >>>>> Monaco EVK board for converting 1 DP to 3 DP outputs.
> >>>>>
> >>>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/configs/defconfig | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >>>>> index 1d967a81b82a..c8f89c87672b 100644
> >>>>> --- a/arch/arm64/configs/defconfig
> >>>>> +++ b/arch/arm64/configs/defconfig
> >>>>> @@ -1002,6 +1002,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> >>>>>  CONFIG_DRM_DISPLAY_CONNECTOR=m
> >>>>>  CONFIG_DRM_FSL_LDB=m
> >>>>>  CONFIG_DRM_ITE_IT6263=m
> >>>>> +CONFIG_DRM_LONTIUM_LT8713SX=m
> >>>>
> >>>> Wrongly placed, at least at next I am checking now. Look at Kconfig or
> >>>> just run savedefconfig.
> >>>
> >>> Cross checked this few rescent changes were added configs in same file.
> >>> verified added config is present in generated .config file and lt8713sx driver is compiled with it.
> >>> Let me know if need to add this config is another file or at different place.
> >>
> >> So did you run `make savedefconfig`? If you do not understand review
> >> then at least follow what I asked for...
> > Yes, 'make savedefconfig' executed as below, sorry i did not mention about this earlier.
> > make savedefconfig
> 
> And? What is the point of savedefconfig?
This generate a minimal defconfig containing only non‑default options.
A defconfig file is generated in my root dir, CONFIG_DRM_LONTIUM_LT8713SX is part of this generated defconfig.
shall i update arch/arm64/configs/defconfig with generated defconfig and verify ?
> Best regards,
> Krzysztof

