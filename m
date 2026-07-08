Return-Path: <linux-arm-msm+bounces-117505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nmzPNc3qTWpDAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:14:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E572218D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:14:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bum+oGvf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BY0+qr/6";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDD30300CE89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F983B960F;
	Wed,  8 Jul 2026 06:14:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002693932DB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:14:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491273; cv=none; b=Hy+rBY9dBPMQYBqb7L4UWrN26Nxq6ulkNCHRT59uhvY5X/owsSQma/GBC3Cpq/3oUZ0H7ErSSFUM+Zz2zATYO0wUsVUFVyyx0ErkXZjGm/RYELBivCoeUuBd19deoQrr4b/cJmdyMuF9h6+4YoY75//+3hkMLGxVnw7DRVSrH8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491273; c=relaxed/simple;
	bh=31DBZk7X/hN3QcM58n1MVdESNXWbYEbqZnN1/A0eH2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl5x+S15kZ6vYt7nryYTScvl3k588A2IG1zj0LDNCZhDre4OHtrWvKy8oTu2DYg4bxHjpshvR34ko7v2or+fpU3ennKYQRODzXHKPvwryvObXBUakiRRPEg3+/OsAWpUzeRktNBgU89n/R80R9nNoCT7FWDxx/+WycR8HZy50EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bum+oGvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY0+qr/6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842nP11625660
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M/6QQ7WdcwGD8BB+82A2cyO4
	rDmzsYiy2RCh26HWhFU=; b=Bum+oGvflb+UYmubsBaGRYBG9/7xSd6i8R0L/tLD
	hPCBmdLRYqtPDT6AF2aRzX9ZkqInp2cZcP/otnf0ZAdlrrvBUWD7Fm1w0apRLfsL
	A1y6gY/i6sYahiI8TpWwX/YpVrzlBZbJyE4jU2DtajypoJS3BBlpkM7BDaBGlaDm
	A1MUkolRI6O5y2VLT1nT6jrz+HHypcl01sF/v7rOj3eCQN6FcHlxzCExOouIh97K
	ZRYfuroFTYOaUUNbNf81fHKpP8K3XvNso3MSi6+dweK7ECwQfA1/S8sLn/VCbsxz
	5ZrCIDJuY10OVQcLA2Cxa1xp7aUcyPVhPxJYD+7RKrsnNg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2ydu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:14:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdaa7039d7so426314e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491270; x=1784096070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/6QQ7WdcwGD8BB+82A2cyO4rDmzsYiy2RCh26HWhFU=;
        b=BY0+qr/6E+camQ4Wja1NYGP0FkMQA9PRtAzFFIkRJoM8hgrf2S+p28FwtGkodbhRzd
         7527EIlBbeM3AgQLFFeacCu78qhC1+FPoLZUsfauM9Sv2M3GWI4LgrlQ82RuN83GKkY2
         rFaYyz9vU3WK7C4UjDxWoYPMelvaJygrxBbeoHNFzty5hZdB2N4o+ao1yjBIqXe13Olh
         jn4GR0JpkEEAYGT8tI2K/VIgs8aRt8oZ7EdcNax9518AwjTnrZNcoKsF9BFGx9wVZkDa
         d51wMbwDQlpE6VP7mmzxKQIlZEXaddVAiNzZaSjmKjAFX7uaf46f6INdvsAQ65fGbUje
         lvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491270; x=1784096070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/6QQ7WdcwGD8BB+82A2cyO4rDmzsYiy2RCh26HWhFU=;
        b=Bj73L7yCL7qeZYJaoRI4Mdx5o5DNpN6B2xu7ZoCO3fhuM4F4lCCAycxo30CoXQgbCp
         5NSi3sSVw+WvJnSdv5XRcj144SZ1+f+26z6v6Gyo95c4qClPHpFUJOTFEA31pa8mhicL
         RzineO+gwyLR59XOPHa9I2LXSAfXScE9fTk3OIQChYbBqD5vzH1KBeAgthWd2Fn3Ite1
         zyk8RqEBozcOq95yKyeFyaVr+McBniLmEa7DfXn2iIQKrp8IECz+bbkg0UimiYSHIo2u
         HJ9w2/HbTmThQtpmjX1MuKSpo2W0tBvyp+MmysXtU2UiiWjUam+ltOk5kMxvT663XQF/
         p3Ig==
X-Forwarded-Encrypted: i=1; AHgh+RovJeFCsruWC1Cq5nqrrJ30806qQ8+juIUTsbFA3B23i2eP2NZCURXTh8oWcGlGGexeTI86AeyiC8wq6Lx+@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcZmK69A+wEQxU4I56k5MGr3a3B+BYqVl3j/bohU0wVlugDWL
	h6wVVIGA/QIxdhR4YIJm+uswlQTUpnrla6Wj4/AmrQXq2plfbIpzOhicnUmPwCE6hQ0Ac7VMPCw
	Guju4Ekl45v27EW8HVEp6uiQZg7vXTUG7/4dhrPnk0bzZMeCfMaIVy4A7A7nPiX7PtZIWVQ/HdH
	kB
X-Gm-Gg: AfdE7clR/gFvUVOppQe4266JGIea658i3ysrq7OIA3IgFHK4uCJRlhC3wDOfcQXyPEs
	p7b2Cw5B6h0t6SV1eCaCR6BsZ/0q84WKcyUtxQ3Gf+LXv9NYGhWs2KZozMxi2zKbv/m5pq01PQo
	v5XSfHfHIaCPvWcLHyHZ9Vk9U1idk/D3D9hBZr4uD0/2nM5tLp9Yk4X1daxZw8OmZNh5og0ILob
	6BkORYL9Z4IgFGTM8sjQEMnZNJ2TDPsIfjrQ1eEe9Ls+AntECHKfBbzwZ4MOzSmW4nMoOgRs8KX
	+b3FXJUJo4SQjswYAaYVlja90vtzAlDh1ShytKL5xpaLb8mkB75HOWhBiDobHTdz30ABHYsUXqy
	/+VIRhjv7UUQSkx/SiWNou9GmaGZM7qDEyuny4RhEHsODJkLtFywlmjf9AJzNPVfXhiVOZNdT+/
	dFxmFswv55ypDbX1LC9kccRGQh
X-Received: by 2002:a05:6102:50a3:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-744e000e620mr590841137.2.1783491270091;
        Tue, 07 Jul 2026 23:14:30 -0700 (PDT)
X-Received: by 2002:a05:6102:50a3:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-744e000e620mr590831137.2.1783491269675;
        Tue, 07 Jul 2026 23:14:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm3309301fa.40.2026.07.07.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:14:28 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:14:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <5vgaqwib25halm3akr7mnkihrz6nuvbumgd5yxtwhh5t2ahnum@m3idk5o5zxs3>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
 <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
 <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX2uKhaV/MG5Vf
 y0CfCHjFqvXDncNxhOWuVUgZ/V3g29SzFjlrBkg1wxEdoPP5cQHA3KTWdMBzr+7xVF341EHfW8K
 uA50IZsiJfgnWFMEq5Pq3fg+iAvYjLzgVfL3z652Qekgo5SvAfORoWKYS7wXNYYmT583NcyJJgz
 KOXX415ktPsysGHjrVmoOog8ex9M1iH0Hv1iwy/DudZIy30foGBWAvF8C+fuVBMgV/Ufg+pGPbD
 VBGVhRYtY+GB1FLAq1GccC4VQlRSbmL8/5WVSo8es3gSpcq8x4AaFtDAXDU/c6+n5t3Q8daTb1j
 Wb9cTNuWr8y+PmBeSP9wa1F+nCw07Ghy3sRJd+VW6bsHjdlkcIr2IXpcJSl0zOhH653zhMtt+9J
 FNz/x6XGwKg4XX16EXtYN3+cKSCipOJuzlHiyZY3Vw0w6jQnHCzZQOy7zIOt5LG8fkUSqP/1Wog
 da1gcMVattYd0GnqAUA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4deac6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qGSba57apYWIHMREK9cA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: D8L5D6mc-W9WuOL0buZjUHjDSFvLZg1A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX6pmiD+9Pgxrs
 c9HqQhIf+qVBjgmciyW8CnMWbsz5/DLH/mNL+3IyRHyOpBR2l0DlVgFIbaQRzJ0wl+9yPJEQYXu
 +ft18fwVyQQCJU/FF9u6dVmRIA+BA4Q=
X-Proofpoint-GUID: D8L5D6mc-W9WuOL0buZjUHjDSFvLZg1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117505-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 778E572218D

On Tue, Jul 07, 2026 at 04:23:03PM -0700, Elson Serrao wrote:
> 
> 
> On 7/6/2026 2:27 AM, Konrad Dybcio wrote:
> > On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
> >> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> >>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> >>> independent High-Speed UTMI paths, depending on the SoC configuration.
> >>> Each path is distinct, with its own connector/controller connection
> >>> and role-dependent UTMI routing.
> >>>
> >>> Because the EUD sits between the USB connector and the USB controller,
> >>> it must relay role changes across the UTMI path. In device role, the
> >>> EUD inserts its internal hub into the path to enable debug
> >>> functionality. In host role, the path remains directly connected
> >>> between the PHY and the USB controller, bypassing the EUD hub. These
> >>> hardware constraints require per-path role awareness, as UTMI path
> >>> roles may differ.
> >>>
> >>> The existing binding models only a single UTMI path and assumes a
> >>> uniform routing model. While sufficient for simple device-role-only
> >>> configurations, this representation does not accurately describe EUD
> >>> hardware when role switching and/or multiple UTMI paths are involved.
> >>>
> >>> To address this limitation, per-path child nodes are introduced to
> >>> describe individual UTMI paths through the EUD. Each path includes its
> >>> own ports description, allowing controller and connector associations,
> >>> as well as role-aware routing.
> >>>
> >>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> >>> ---
> > 
> > [...]
> > 
> >>> +oneOf:
> >>> +  - required:
> >>> +      - ports
> >>> +  - required:
> >>> +      - eud-path@0
> >>
> >> Do we really need a separate eud-path node? It doesn't represent any
> >> particular part of the EUD device. Can we simply add more ports to the
> >> ports list?
> >>
> >> For example:
> >>
> >> ports {
> >> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
> >> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
> >> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
> >> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
> >> };
> > 
> > I think this was originally born out of the role switch framework being
> > strongly tied to a single OF node (because the way they're found is via
> > graph traversal and not via a phandle)
> > 
> For additional context, the rationale for the path-based topology was
> previously discussed here:
> 
> https://lore.kernel.org/all/CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com/

This needs to be explained in the commit message.


-- 
With best wishes
Dmitry

