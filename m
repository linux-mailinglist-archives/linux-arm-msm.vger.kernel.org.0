Return-Path: <linux-arm-msm+bounces-107580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE2yCDS6BWpZaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:04:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02E5415CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF753014950
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F2325393E;
	Thu, 14 May 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiD52Zje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XbCpxlT1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB83C5DCE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760241; cv=none; b=oixcFUAZpZsT7LOp01oXVFbhBgxnTXUZXF6p8o0Sd/78cIuwNXAxyWk7piv7oFlOwPFyTqa7PArP4cYjGNemXX+yC3V6NfeV99eT7JXomNg1/XKaKETiXawrTKXaadTJvS1XaGMqblNXnUZ9LXa/RhWkVz3I28zVx6bLQuDgEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760241; c=relaxed/simple;
	bh=S8tvciwNb3UxrfHIh4lNV3EW0cewsgPN0q+Ri2zhbRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVrY1ToFGDqRNRNzxWLHmr9YchBGorauic8zgsfM5M9wNMHXaauOPOqKRfkalanbq68i8WzzyBsosGH82gSdzv2jY3jQ6/FTZ5KVfPsX+y3+BBbMVanery0EcjrF1jxKAUoMwXlzi7GCPS/oGVjpTWxEB9vaMAxtEn6hlmBxdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiD52Zje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XbCpxlT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBf8hS2242527
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reg4qcjdIp6x+0SDJUJ4n8gs
	lWAQb0+Nn0u/viW8k+g=; b=hiD52Zjex97PxmfjXjFNrgr2ZoA8rSNdyWqJv6ZV
	hFKbvC48qnEscoAu0XcvT64ZQXIlclHOtyT7/qYAXTDoQOeMsoiBrRjL+LCdzZAU
	3Ebuen8AU8JBzzbVB+xzji2Y7QmRcMLCqsVfuHuXMWbtNAkNfoFvs+gb4IO58GyG
	iGpOd2ssjDG281Eeb8KbRd/LQ7FlLmXPvHJBXvsMPvhngdEI0TXHgY5DcQVBa12d
	p3+YjkoUbiuCAaM6+rc1Zc4qfXIAFRNFH6zzrhDhNKULVfwxvaVszs0/z0LCIhzy
	cdU0Dsdyhi9lTL7YVN7Qj46ypS59gcvTnw9ODvaJizkd/w==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gah5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:03:59 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c5ed0942so11211888eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778760238; x=1779365038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=reg4qcjdIp6x+0SDJUJ4n8gslWAQb0+Nn0u/viW8k+g=;
        b=XbCpxlT1q20eSGYgc9CGSEpex5QmTtlAPLqbYllMj0utpqlLIQHoJGplbSUdJcrrRr
         ziiUP/+4cB/aOYKldgnhYtZgPgWarzeSN0xRUdhBDQyy6t1YOu84rA9e0IqqbPw07xVk
         ZZ5C9uEqrV5YvbPULDWp5ZVNXraE9PpTp7kmVnAVHQh6zt21rGNgmohv0gex2u7ZpBPF
         XYOFRYXEEcAeIFHKP5nDXGVBQ94yEeWcRzWO8itAiWmBq6fvCO5ZqhdIZRibUHSNiwAT
         ZKyZkijjVDreA4u9hSB5C7aMT33Ofvtx1K4ID331FNRTuHC3zB18Sn6H9bIHOeQwDLKZ
         wUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760238; x=1779365038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reg4qcjdIp6x+0SDJUJ4n8gslWAQb0+Nn0u/viW8k+g=;
        b=XZl74zeByZou1HgTFSrMcPEyBnHESXEhwKxMQR65+RsH7tPD/mvFBPaDn60hvaCpom
         P3G7+4T3xZKlzBH7sxI3Fs5oms2GeWxLD3SFWcYA4QW5ZN4h0uYwLwxpoGtDkysxpx0m
         IDFIuuMVJHibe6iISx6ld/OexAO+mumUUwXO+jsMmeeMsRVYuPAKvbogFan+klX764Jl
         GcsnX2ZjMgP0F068lfQopzzLp/E7nsIhpImKh70uqa0ls+Z7PLbTFZp2xv3R/evOFH2G
         KDKWSCdTkYVweY/FpGaSo+Cv2Hk8KDBr25smqYkEpi/iGmvvb5dvUFlqv46RyZSeOzz6
         pcMA==
X-Forwarded-Encrypted: i=1; AFNElJ/C6P6jNDUCS3gEZpOgsXGYo6A4RAy+Bb5pDHgtXdxvbuXElT9P5XJ9HH1vY/UYlU/jXjRDam5/nagt+oq7@vger.kernel.org
X-Gm-Message-State: AOJu0YwTj5VMxkqwh9EhEbElFw5VSgAyYQrE7Zaft+3T7GH8DSKmQvZh
	xRIXiRrxglm6Cm6vV6rBiXzRqiOAdZAG1+cK1HIv2FyA82FCIYuortnNGl6PjKBt3G706vDXnMv
	onJjETFVKn7dQyAJnQ+sIxGL644qpQzDSpqcVT3IxMoPvSSiTzUDdfyv52s80bmVVHGaD
X-Gm-Gg: Acq92OF1nFqqvVPoGDOH5NKsGS3uoe82IzmCPgpxmyRjaX3L3Qx7iqIo1l4Le2lxhkX
	JPuiXMXvHxMHYfzdnW6u8SOci76cA+9dwcMm5A/HUQMdCCzL8RDR6motQpVbT5SPC9qFstG3FVz
	UZCEBgaCs4pt/gBnP5mHgfDoHI+D6avp7oU39r6TzEX6RXBoDd+jbCEMsl8y2dDSgWNFU1AlxDs
	kH0Q/2LJPI5yMvUIM5h8GGEMg6pLShg94O4rLqkels9Yia1sKV5v5C0wS4Sbuy19bfMVlrkvjkO
	ZrbdpB4A6V4DKeMIH8JdYIVQ8gzeYlH8vGFpBYqCXe+00hRs72n8Zp2m51cA/oVC2cygwOtCpAQ
	68IzM4o1jBAcGEBbKl2hSphD3HKUtRXknGldT
X-Received: by 2002:a05:6820:4cc3:b0:67b:b8d0:a7d5 with SMTP id 006d021491bc7-69b7abc298bmr3724765eaf.53.1778760238223;
        Thu, 14 May 2026 05:03:58 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc3:b0:67b:b8d0:a7d5 with SMTP id 006d021491bc7-69b7abc298bmr3724706eaf.53.1778760237645;
        Thu, 14 May 2026 05:03:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5900114f8f.26.2026.05.14.05.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:03:56 -0700 (PDT)
Date: Thu, 14 May 2026 15:03:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add
 SDCC1 slave
Message-ID: <fexo26osrsj2t3777m6fag4nzqxgvmpvmcxcihnwffc4ehjwzl@77ynlnp2gh53>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
 <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
 <fnasmnyh7rf4wtyrv77lunx7spilgjxji3ejflvufouqrdep6n@uu7pkkfwkxyi>
 <66b3840a-390e-4135-9118-b1ca52d40026@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66b3840a-390e-4135-9118-b1ca52d40026@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyMCBTYWx0ZWRfX6LBwtyedSFjd
 3+RQEjM5HSqPElK/vYXfzDf6h1X5al9/aIl+50Y74s4+ylwWCbqHWI9W2k1Zoy4VXETsMWUJbRQ
 B4UyOqnUiRF6DLj11OCfmCMae7PPaOMuRP1bp+037o+tum2nVA6+preyhcfJpC+H08nh7FNxFeQ
 UeGYtpnbWzJ1Es3IFcg5ngVEfG+iw9xeN1PJUo9QPZbN8EfeqwIOLJMxuutW37UY5yBiAh6CYhz
 4D+WCBZz85dlEgVtlXc5bNqOPGH7MqnnZdisp7U4QethdcHbsnj1tGV1esffXo805qt4ObaJ9En
 eA4DytkW+Ft/+ZZvjRNIIXK/58MOUotBBqogBgQ5rn/9K9sO2+8RjX4VqNJvxvTrp2zo422HZPR
 GsPZEC5mkFNDD1JNZVtYoOn+/AVtIelczdNzfz3xHDq/w9o++OVi0wHPLzNRMi39fHXDqJpnogO
 j8T5Ea60bxndqUH4OdQ==
X-Proofpoint-ORIG-GUID: twHfqwrxcKmk92CUlItGOLjnjpZUzulc
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05ba2f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CVkctuRbRQ7OC4GNKrAA:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: twHfqwrxcKmk92CUlItGOLjnjpZUzulc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140120
X-Rspamd-Queue-Id: 6A02E5415CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107580-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-14 13:44:59, Krzysztof Kozlowski wrote:
> On 14/05/2026 12:46, Abel Vesa wrote:
> > On 26-05-14 07:44:12, Krzysztof Kozlowski wrote:
> >> On 12/05/2026 14:18, Abel Vesa wrote:
> >>> The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
> >>> slave ID. Add it so SDCC1 consumer can describe the corresponding
> >>> interconnect path.
> >>>
> >>> Append the new ID to preserve the existing ABI values.
> >>>
> >>> Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
> >>
> >> No bug here to be fixed. Incomplete first posting is not buggy just
> >> because it is incomplete. Otherwise please provide more details about
> >> the bug in commit msg - why initial posting could not even work
> >> (although it did work...).
> > 
> > The reason the fixes tag is added is because we want this to be
> > backported, as the id should've been there from the beginning.
> 
> We do not add Fixes or stable tags just because we want something to be
> backported. We add them because something SHOULD be backported according
> to stable kernel rules.

That was not my point, but I have no strong enough argument for backporting, I
guess.

So will respin without fixes tags, as I said.

