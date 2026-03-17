Return-Path: <linux-arm-msm+bounces-98266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FnCM6iluWlILgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:04:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2608D2B155B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED6930B7AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F253F87F5;
	Tue, 17 Mar 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWoBdv1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blg9jKKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8493F87F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774200; cv=none; b=l/mvhRF3SLlej7xxX6fiuXqEDxDdw2xsMQTcoA+zc+uf2G331EOTRnfp9jdahS0InLPnXcAwgYouBwGMJFRYTWgSYEsygAYnNRh2V+gHmXICxuHe/Bp7rkhHHlZ+MzhlZOIuC/Nqm3q4ExulWviDooN8B4NQ1DOIa+k9QE8qugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774200; c=relaxed/simple;
	bh=iae9mYcjuBJiJBnv2oDFqr1DfI9EZ6tqxCZwHROXunc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s67FX/y0Qc7WLPGfIIttj9J59ZNVldCvbwscSKiF3f4wiDn3ikGp0eZyUfR+WBcgrccIXkrnSDCfm9gZiFM55CPAGYYsPfHw8goNEOCICIStmx/fE6O7XKIHcLtIGnl/gPIkhqQ9ezS4rhENo50xasdglioC8f+6XGi7YqrhG9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWoBdv1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blg9jKKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJufI3165279
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbHaPYngv8BidsgWeU7loEwZH/8crwX7MRyXOSpew4Q=; b=eWoBdv1YcRhow1ah
	vvc49ylbHL6KBa95eQ8lOhPy7jRikt/rGBNIqWN1GhT+ZaY9Dm8ODOelChGWaCQU
	Xs6cZfhqcaj+rk4zm8MU3WaFagnzpNL6/KpdyTnhmnykb6jBP5dgtltdrGm9d+Tq
	7jwwb3CoyGTuxWQwHT2rV5yHJCEgQ5eF1t7u4rWdkk5lVJaApYC7sdVJYHXoQt8J
	QlmWTxI+YG4rM6Nxrhm23ZbPanjQ+UAcK4c4DYPWX2VCkjMtNRwbQRv59Z+ZtCqa
	xbRJN8OEMHGsPSt6D/VRmyJrr4pmBAutVZqeRCoHpCcsm5azUUfVdgZQ6cyVYuZd
	IXH1kw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6t09t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:03:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a1ee2a528so3201447a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773774197; x=1774378997; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NbHaPYngv8BidsgWeU7loEwZH/8crwX7MRyXOSpew4Q=;
        b=blg9jKKbVBJDNvIeUuLy5x+bRGdVDlCJ2dpVMYnzpqgDaMch00OyNQ6LAgrXz4n9vG
         2yE0XhdFSjm20OaEz1XzmFKLDH5gTMWxxynZG9oHuK0DFbsrV+cdsqlA/NjYUz1V3+Ab
         0yBu7wxi5lzCD1mUr89FMPMSZKzbJFXehlHgahtBOgSXR6opHzhxOqncphPYKJk4ArOR
         XrQrzUoRkOBlPeEEO8owEG7b5441Hy5z6dMo/0jXGQEp+4O220lL0bjeo8fPu9Kq2KAX
         BXYbithhCtOqJwLRg8JZ4FSu9xW6QheS95zPvpeKYNk0Q8I2JN5mv/IkjWVA00BxvNHW
         0eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774197; x=1774378997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbHaPYngv8BidsgWeU7loEwZH/8crwX7MRyXOSpew4Q=;
        b=EpwOvu4GdiCnkk2Nqi6An+o0epkPJsTPlelwjjNdWS4NIopdZu369M1IuLZ3uAlrDZ
         dGVD7yiH0wRFHKB8pV1v9ivlQY8RwIQJojsMfadYQksYZmmdEPDhxw3LoNYijEXpljYw
         jxxPJL4hpb7IcBf5hxWvof5w0HXlQkQsPXvgsMlgw2B4sJ0VDjA/AkT7iLezLq1+I02q
         oJ2yzRvWmPf+DQHflfD2Uxk21o+29Z8W01KffDYDLh6fihRLYolUZYfqsArqAhB/IDCE
         jr79npJ/4e3cqw3M5FDyTKHr/iOrDTGU5J21HCv6JCps36k6HqIYJ7H03uWrLGocHDrY
         7c6w==
X-Forwarded-Encrypted: i=1; AJvYcCWX7Wg8MdYXYF2bhgsQ+H4Q4npYTIuWBKDO6Yr0AuoNMaeTHh1MuqxvB9fEl4E8QlI+xpnwVVBkVSOFsUYq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1D0DxVZmm2dYKgimEjcqR5fmWTA3cV2cvJsfCHp9mcqK9Qpi
	tOgZolHn1Ai3QKibgbR/z3f2rKIvsOEKYCha0c2SYTsx3qZzi4OyQoUSHU9u7SDTtmeXFSWygKj
	aar9TLELp2zLJiLEOLQ+DvwVHPTjqRiD6IESqQYEPkt9xgqsgseWafQbFw8omiqQoR+xq
X-Gm-Gg: ATEYQzxI6LnHqr4wY10RckCrFVVv10El73qRVqNA2ODQt8xpItCFZq1BUzw7mAzLxdA
	BQjd9zEyQ+hGB8pC+6gcmeI/Eg5z3ChJwGKTQc57rPQYtsBh0yYM3gUyjIOP/hP7015OwvRCUd/
	DKXubRH+o9LPSOsPjhzC38HOQUaTNUm7lChvCO+vdyMTiQHCq1qxJr5ag16cj3vevu7h3GqjXVS
	Db6v0Yh2rvoIhfjTdP7FkR7GPYq0Z/NtsSUMAUos7PTFDIo4vuofRJQTHCQh4Xt9KA82/L6IBmA
	briaEB3GGpEI6pGGEvO0bvo3zfgfWvw7fyiZwavenJ5Uvr0j3KcwrIL+1+kzu+jXgDXMmbjtKSl
	yw1YqZtuYroowGvqUeLXDnBeWkpRyLN875ImlMWSI4xOEVEu4J0IvNgykfBXwZmfEuTjp/NBy/e
	kWxJIrW8esxLbh/JjHGTkly9kX82wpuK5fuW7Ok/raLg==
X-Received: by 2002:a17:90b:5306:b0:35a:329:73c7 with SMTP id 98e67ed59e1d1-35bb9e4cc49mr360078a91.2.1773774196958;
        Tue, 17 Mar 2026 12:03:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5306:b0:35a:329:73c7 with SMTP id 98e67ed59e1d1-35bb9e4cc49mr360043a91.2.1773774196345;
        Tue, 17 Mar 2026 12:03:16 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5c3eaasm185079a91.16.2026.03.17.12.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:03:15 -0700 (PDT)
Date: Wed, 18 Mar 2026 00:33:10 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <abmlbp4l/J0hkdRS@hu-vishsain-blr.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-2-8195fa931ff1@oss.qualcomm.com>
 <56829589-1c56-4c96-a9de-505058467867@kernel.org>
 <ablZcxUIJDrrs9Vb@hu-vishsain-blr.qualcomm.com>
 <ba22ae2a-06d4-41c3-920a-f1fd589a2111@kernel.org>
 <ablj7R79VjE5Kb2s@hu-vishsain-blr.qualcomm.com>
 <260c3c17-0d90-4253-84b2-5d53ae4ca975@kernel.org>
 <ablw7hS8OyvlQ/IF@hu-vishsain-blr.qualcomm.com>
 <gg5q3cke2asq47vlnek3b3qyqu6kzn43qjhwko7k4gks474rbt@sf5icldil2ci>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gg5q3cke2asq47vlnek3b3qyqu6kzn43qjhwko7k4gks474rbt@sf5icldil2ci>
X-Proofpoint-ORIG-GUID: Vfwq9whStWj-g6SbEY6LZIZb7OsYgTZ0
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9a575 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h1la_D7stzfHr5kcB0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Vfwq9whStWj-g6SbEY6LZIZb7OsYgTZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE2OCBTYWx0ZWRfX/wSjzrDnyfsT
 njovHTlY2gosE6Se/ec0RtqvXruH4mvZlmYiK7AECO3SzZTmAk4rYKmnBWL6iDRgk9jdvJGrYph
 8IEIkvjUa/Etai7WN7qMBXm1ElyS7V9OGYZ2BkdsL3ywJ07yQRaWk9x3YD3x7EnDZ+hOPigPDtH
 tXfmM4PDzg1zgGXwjfYUsPvYYfANGTYUQxCiLCEDN1WMJ6Vqcq7FKxDIegsIuwCchz7Ym3ZSfsI
 2BZ/kzCLzYthH5CYSICR+WV1y1I0NPVDTS9yn589FhmVBal4oMxZAveesKmYA1fFmvugZgZMc3K
 jQihxHVT1guxerfuHToZ23GjaQJQfPAZYlniNIYBpjXXZ/2rpfHthSriPM/emkc0rhAQupNnDAt
 cJqzGWYx017Oxc/wdwJ9rAbS60D6yTmFz8YJSlID2whJyI9mIo9FdBzatDyc6QEq37bxNc2bClt
 jYFXF4ane341vwA3exw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170168
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-vishsain-blr.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98266-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2608D2B155B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 07:51:36PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 08:49:10PM +0530, Vishnu Saini wrote:
> > On Tue, Mar 17, 2026 at 03:40:54PM +0100, Krzysztof Kozlowski wrote:
> > > On 17/03/2026 15:23, Vishnu Saini wrote:
> > > > On Tue, Mar 17, 2026 at 02:49:56PM +0100, Krzysztof Kozlowski wrote:
> > > >> On 17/03/2026 14:38, Vishnu Saini wrote:
> > > >>> On Tue, Mar 17, 2026 at 12:44:05PM +0100, Krzysztof Kozlowski wrote:
> > > >>>> On 17/03/2026 07:03, Vishnu Saini wrote:
> > > >>>>> Lontium LT8713sx DP bridge hub can be found on a Qualcomm
> > > >>>>> Monaco EVK board for converting 1 DP to 3 DP outputs.
> > > >>>>>
> > > >>>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > >>>>> ---
> > > >>>>>  arch/arm64/configs/defconfig | 1 +
> > > >>>>>  1 file changed, 1 insertion(+)
> > > >>>>>
> > > >>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > >>>>> index 1d967a81b82a..c8f89c87672b 100644
> > > >>>>> --- a/arch/arm64/configs/defconfig
> > > >>>>> +++ b/arch/arm64/configs/defconfig
> > > >>>>> @@ -1002,6 +1002,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> > > >>>>>  CONFIG_DRM_DISPLAY_CONNECTOR=m
> > > >>>>>  CONFIG_DRM_FSL_LDB=m
> > > >>>>>  CONFIG_DRM_ITE_IT6263=m
> > > >>>>> +CONFIG_DRM_LONTIUM_LT8713SX=m
> > > >>>>
> > > >>>> Wrongly placed, at least at next I am checking now. Look at Kconfig or
> > > >>>> just run savedefconfig.
> > > >>>
> > > >>> Cross checked this few rescent changes were added configs in same file.
> > > >>> verified added config is present in generated .config file and lt8713sx driver is compiled with it.
> > > >>> Let me know if need to add this config is another file or at different place.
> > > >>
> > > >> So did you run `make savedefconfig`? If you do not understand review
> > > >> then at least follow what I asked for...
> > > > Yes, 'make savedefconfig' executed as below, sorry i did not mention about this earlier.
> > > > make savedefconfig
> > > 
> > > And? What is the point of savedefconfig?
> > This generate a minimal defconfig containing only non‑default options.
> > A defconfig file is generated in my root dir, CONFIG_DRM_LONTIUM_LT8713SX is part of this generated defconfig.
> > shall i update arch/arm64/configs/defconfig with generated defconfig and verify ?
> 
> In which place is the config entry present in defconfig and is it the
> same as the one in your patch? That was the question that Krzysztof
> asked in the first email, which you seem to ignore.

Thank you for the clarity, I thought lexicographical order is followed here.
savedefconfig generated in below order, i will follow same in v4 patch.
Sorry Krzysztof i completely misunderstood the question.

CONFIG_DRM_LONTIUM_LT8912B=m
CONFIG_DRM_LONTIUM_LT9611=m
CONFIG_DRM_LONTIUM_LT9611UXC=m
CONFIG_DRM_LONTIUM_LT8713SX=m
CONFIG_DRM_ITE_IT66121=m
CONFIG_DRM_NWL_MIPI_DSI=m
 
> -- 
> With best wishes
> Dmitry

