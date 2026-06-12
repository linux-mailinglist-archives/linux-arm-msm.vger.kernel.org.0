Return-Path: <linux-arm-msm+bounces-112867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZy9JQi6K2owDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:49:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF16776BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:49:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZFsBO8at;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SjFV5NwR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28137307A7CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C5B3E00A9;
	Fri, 12 Jun 2026 07:49:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EF3DE434
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:49:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250564; cv=none; b=jInaIvAc6Q7dyBZgAcv4017bODT7RhngO8KmThRdOs0EBa3A+8x6VWK0LwcHP8nBwq64RZZZKD/lDUIeEM0lqYJgaihG32rFzynjj9N8qwju30MmoG8sQFmn9k6d1RUAFREmp7YRqBKXXIuxB/ZbT5R2PRpR3J2sdCyI7LBwlwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250564; c=relaxed/simple;
	bh=oSClFw1N6Pzc5mrZzt83o6RTRpl1h132KUxpmGTz/i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3TQcy52N0P9nWOs+sgi34qz2n9fcD2/CMkoiNEEXgLMTBSFyg1HL7Ot0Bh4kNRSOuFAQCeN8vZFp4x5E9zHFq0/kS87pVfdpjkE4EfGis4dtEJg4pxYlwKJQPbyvc3N/RcM4Ydmdvr64rBggmkew43+5FaGNa55SLM8gvYjbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFsBO8at; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjFV5NwR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39WFX2502703
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=; b=ZFsBO8atIgbiQHfi
	CmpJ7BufwbkUat8DmbBUny5rzWMpaaHG9SJkuDKjGTWN9fz8I+175yEdfvVNOl3J
	Zk7S52nxRpHgRe+utf+b87quHTG2oqrVyN75D53aVcvfdPUZDHKuRr3I1jG7OBLT
	efj44OHpnd8rdUBXye49gqmLO3Z2sfW2AC7fIIjkans3ftM+BdMxt2eiY4TVCzBp
	v4raRXmY4P31oK1ejEjDo6bS7M9dONpj/jXTHKAXw4veQKi6i9G+1whZKm3wKkxS
	XwgEhRRINkPdx57os3waUm87m9TovNncbVDwSh/F1D0gdHRb9MyRg1xxw7UTPs/e
	yGqimw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2rd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963aef8124fso257385241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250561; x=1781855361; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=SjFV5NwRtOtTsbxM6IJr3ehgW1KzkT0A8qZsLC/Tw7vDHcLIk9Fb5XR4V1wTbai7Pe
         GbNGD3Zq1HlAwidHqj3mhPt27M+A7ooLkOHxkar1hm0bBgmvKoi0OjF2v5fGteqSveHQ
         Dg6TguXIAHx7ayv7to2QdFfJLKA29jdZV81hKFlBRPgfIOEfKWr4xAp+5l8bbJjK8ACV
         XiHACFHwwQluHtjcn9l+fyoIecsQ09GHSCP/BwQ5SSdR7X//ZrjfUEM6ckn1ZXk9wB38
         ZXlPjRSw25mAW/3T0peqitmVPawDkFsFUKMkPtkXhWrZnNoRoCamlZAWN2EJfmfqVIUG
         ZKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250561; x=1781855361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=p7qZ0AYtq/00xB/KIUqesqX0D6mPtev6LaRJ6ET3invnlLPJ35vAp9LeX2Zm09XKXm
         8j9Z6W98S69Q0rcK9VHpITIlABaomvXBplREyeXt8oNzuN+LTJafK0HLLRSpi9OKY8ef
         vBU9h/mrx5FMICfht2tAxvNZ6HxsgzrP2YJtz3ERhm5okKyHpXwNdE0c0wK2ujXlOgsk
         kwje1u1tCqI8kHPDvSAl6DdZE3sUi0OxgWRT267xFqTERXRAswaUjQdZ0x0lQicJC/lE
         atYAD7piY2+CbjudBosYJQrdav8wIniDK1ebXjNcj2/SkmrNxfISNDWaXRi3e1fLVClP
         9NTA==
X-Forwarded-Encrypted: i=1; AFNElJ+dktapuPOnRw/uaJKitM+2arl0cSO7B+llWkiBcqDi1xwvU9mrf+Pa50OEIJTFbb14TlRfkkj/d/BPRft5@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSQ7CcbrmvMzPIzJxaxxWKbDRxFSdxpAUZMasbybNYaZeOYsf
	+r6b+bJchrIUyydrzzunFZKsoLuihj6PGy3YDcR8Y4k9/je56lbxIQeHx7OAdmmHbs9QX4pi2rN
	OPXJzsvZH5V58QalPQPWbJ2Qj4I93zXGBS3YvfzZcSXnbrCwccGMqtZZeFa7KiwGkVlQB
X-Gm-Gg: Acq92OE0ih/VZI5+tKc3JmjTopw1O5qPMx/dGVcfW2C26paQoDqaF2jfe6vo8sPI3/V
	/UwHoYgO6YuA86n66Gl+6p26ycnPttsaKAMHzgHPWg8mHk2X1jFIdCebnT2XlQ/A2j/9DP2eMgY
	S8jxT0+YYkK36Q8RL5T/Z/Gfn2zi3HR6oaWsfR/nLy9QbH4opwq6Lmph94ODjUnd8FaKO4G/z7b
	st9mYQPe0GS/UnyKsUwf9qYlwgEz2V1TFxCiZGsyyUtWiZly+qy0rHAM4/Mo1jV5+H5NTQcUqqL
	JRY49zd3Ci9cQy/R/vRdySHUwiAVsRN7XZpKlNoHJNFMP91ahL8uBmwr5W870gf8tjthHbMJHS+
	7ov0xAUjgZkSLbo/Z24pdy8RZJvIN1MCoIUsWSBpUKI0B79BIQj36kW4yZUu34mg8Q9MwUu8cx+
	t08PZSEDOJdp3gkQE+/fZluN64mQINBwlK79E=
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544158137.13.1781250561328;
        Fri, 12 Jun 2026 00:49:21 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544139137.13.1781250560921;
        Fri, 12 Jun 2026 00:49:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c4aa1asm4324521fa.10.2026.06.12.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:49:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:49:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EP5NMR2EPl-WUDZamLvw6g8ya7zxPEg_
X-Proofpoint-GUID: EP5NMR2EPl-WUDZamLvw6g8ya7zxPEg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX0oxcGYdAJWh9
 DZl4/5jgrIpESyyCRRQKj1TDpipJzdN8T/UkBg3sJDv367Y2wm1isVHYvunNCFzNI+O2msofVSI
 ecImMM7GBN28M/KEIPeOYU2aBI7lEGleHOvnKcjZHZ1LBJL9N+jZbCgW22STNGjbFiifm9V1acs
 VRMyFqsljy39jkEF44LQ5sodFCJX+4bvJmFg5nwMle5gP0tmirgrCoJzaef1wzkpAXoiQzi+2BG
 Cd2cqjSWvnxlRTv8gQpZz1tw8lJJOOuehYbMZlU4v/E8T0xckYuwRSaWMm7tvE3Lj2OBnVRmeNO
 3Ftn8ItHcUIiZX8QeuCWe38BGNmE2fYceXf0I417WwNYhwlbHqcjcuYiGb64oa1AGV/mIwmQ42C
 YstILjC+sZbIZmDmvd+krks34wEPFcU704nmsbKbYfmblpo9JwCpqHYYvsELHsDummv7rVVM09x
 viIy4ztJqvRKy1WJ43A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX23D3aHJEBByD
 wMGQbQ5+8CAIHjxFEPiVePj1FLgSULzfcf2ZO+j3MHsyeSjKWPg/Zheyc/yvhOnZoFXh+RrfOsV
 xM4CXCHgiOzobD03zOOaP3oNoW1vdJ8=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bba02 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yW9dRt1GCuxPZAtmE0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112867-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,taadnzd2qrcu:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45FF16776BD

On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
> 
> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
> > On 09/06/2026 17:15, Vikash Garodia wrote:
> > > Document the iris video accelerator used on shikra platforms by adding
> > > the qcom,shikra-iris compatible.
> > > 
> > > Although QCM2290 and shikra share the same video hardware and overall
> > > integration, their SMMU programming differs. QCM2290 exposes separate
> > > stream IDs for the video hardware and the Xtensa path, requiring two
> > > explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> > > equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> > > and Xtensa isolation requirements, such SMR masking is not applicable on
> > > QCM2290 platforms.
> > > Since shikra uses the same video hardware as QCM2290 and shares the same
> > > programming model and capabilities, it is added as a fallback compatible
> > > to qcom,qcm2290-venus, with conditional handling to allow either one or
> > > two IOMMU entries.
> > > 
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,qcm2290-venus.yaml           | 20
> > > ++++++++++ ++++++----
> > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml
> > > index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
> > > 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -15,12 +15,27 @@ description:
> > > 
> > >   allOf:
> > >     - $ref: qcom,venus-common.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,shikra-iris
> > 
> > Should this be "iris" in a venus yaml ?
> 
> given the vpu core was first enabled on venus and now it same core on a
> different SOC being enabled on iris. There are 2 ways to do this
> 1. Add the compat to existing schema which defines the binding for that core
> i.e existing patch
> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
> hence even iris yaml would then need to carry the venus *string*.
> 
> I followed the first option.

It is a correct approach. However the block should not be called Iris.
If I remember correctly, the core is still named Venus.


-- 
With best wishes
Dmitry

