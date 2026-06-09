Return-Path: <linux-arm-msm+bounces-112266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bIkVH65rKGobEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 21:38:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3415663CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 21:38:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aYrXvHwW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bpTX3QB/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5450931E7796
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 19:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1462E374A11;
	Tue,  9 Jun 2026 19:24:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620B35E1B3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 19:24:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033051; cv=none; b=CtDKgmeKeJiXu+5L+ClfEG4RavHUYZnTIQA/jGdmcgoa6bRhfIMvOXgUbNc8jRUTUAyKTjsBvCeF25I1Nb3hqADVZN5e8ol+/cHNUmZtU6ZnIHOlKvCu5Uir4JpqdjMpn5UpiX2IyZ9gr1H9+2SRfphi6YMd1disOL334YH12IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033051; c=relaxed/simple;
	bh=632XdGG0Qcm3CwM5+Nef/AUG7OBEdYAiPw86Tdaep2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbpd7/GDOy/JwSU9TV7nEWD5v7kXHNnhslSZrGi9gV5likMDP2lHjsY4lj1N2N9XErR9hA5qM7QvC3M4qsuyvRcm/PsHtVJVgUdDWdA2F8QkuxD5PSoulvjT+O7izBwOZOf9gZoGL/D1DsZ1+vsktfaAWWhOTecydjNcs2Hpd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYrXvHwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpTX3QB/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOCP82748446
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 19:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=; b=aYrXvHwWT40Wh73z
	zxScp7jVPe5x2cMmhIhA8+9nSo6AzehqBcSLiGWp7pZz7VmMdOIAIL5RVP9duPNp
	FI6gIKjoeQkv0GHL/tGsBR9biSUiXk5D37VEIuIRFE8fDE+P2GC+5Q6yXBiWvfQ3
	Y9ZFmSuncUNRVRAfrLovCtTj3cwnSR5CscP8zPVXDyuYO6fQhONL5FbgMGVqL9l+
	BXh17pFdJ48/DG4CZPtYbE8Ncs8QOpRD030C2KZDxNFeUFQjyCnR43XLgavNKtER
	fwMoJmM+f7vXWPuDFKWvJyAmN08Ufgsfbslcn8l1zHrlWOwJjyu/5buELhnMBwWg
	9NIzww==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeeuqw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 19:24:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc66167c4so2420630137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781033048; x=1781637848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=;
        b=bpTX3QB/6Has+v7zAhDXGHMHNlkUeYZEPhIFya7mrzB468Svo0Orvvis7NxAAX80Me
         VoHI3XeptlOlG30MNr7+hnM8KljQRDnLN/QERF5l/FMIduLMAHIejhexE9tzcUbCnvdi
         j+RZznJXSZu8dv+jomWhtdGzbmgIFPyI3C5xkRS0KuMYyNOmqLQjcL18yJyQbdO7redn
         fMS46643jjUTXGbO2xTReNuARQBKS8Dv/NxQsv9sAUEOKgn1xXaE9RH0PEHoXqNJzDtC
         6lcNnkU6CNLKkOob6vuBjQtx6uwZcoGXkW5zcyFAa/EU64GKOqIqqjhD0Dw3irSdPH/w
         v/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033048; x=1781637848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUx1zEZveURPND1+5TwvqA+KP0PI1rp5pjFTilrWTJY=;
        b=F3Q9Bbj+S7ZdUbh67b5Biyu7ZjNrmLj8lUvExUqu6RxddxEpFwT6uCQrYjmApryyu/
         kzz1SmujcUvkKhY4VKmPoCMvdKTxTq30+6onV17V16cJF3oLp03n1XF24JDk6dZgka0S
         U0DUBlEggdpRo8k41LgWjg1Clo6KngBPdd1Y/DxsB2J+8JutjpscIO/wNV88A//FvXj5
         RAr3RQdgTCvDOwXr0t8wGvJgV3PuRfxWAoiVypY2KytKYSi8ltEfONmOysqY0QRR6MQh
         gp2VIjULAmnas2Frvoxt8k1jnR1E/MfXhYcdJieZhTdeDsptQf01pVjRk8PN3aPRxrSv
         BMXw==
X-Forwarded-Encrypted: i=1; AFNElJ+d2L3c39dIvIyD3VVGESKrQGTpntm/XKxrwBwf/w299Quxbfa/to59lYwwbmHnTS8kD8biXvlkZ2kz4+RR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2kQ5mmu/xY+ovo9KvTNE/dClEPMRgneKUV/A/AXQ7m5OXg9Qa
	dwH7iL0GNT7XxoL7K9rKrVXvDpcvZfSM6uojRKu2MwiyZRc/cWtf/kLtOKlAr8bM2ajtcNsRPQr
	eb8thLRCClguJ5q73szGFsJWbyy/q5u2xaLvO2ZyFiKFbWbPeEJdy2OrtNGsJX5LFGhBm
X-Gm-Gg: Acq92OG8mohH5Bynx7T4ZNpdHMt5k4aygNVUR6ezXlApV0B1VRfWjikcMozii/egyTr
	hHXc/N+tg5h5xnDTfuyXce/8786K8DFgFseWjzR9r1TNF37SdbhBQJ+Iyt8yl3yZgKdAcRnoApn
	JchzOdb58EX3QGzPAk4BPbo5yZsygkt2Zg9spCLibOZLR4t8G8RvXfX6mR/STU2c8KANokcDqu4
	CeQLzVrU4CyDN6PwPgnkMmyboOtLDMdo8Ts32M990BEpTvX+1s6dDPAGGZEceZff0mF/RcOTANw
	Vftt+QuWxUACY8mnNxLQpz+gsGwkIxSzFjMZ1xKk4eQ2PhArQTMSAnSb8nBCBcoVgErSm83Tour
	HEWtpfUPkxbYIF8EC//ZGx/T+qPZWP/uioHVN5hx59vG8vs8VHhkrul/fSTf5awWfG616ljFv0F
	NWx4qgWE6V5F9D3rlYFEG3r6HLXVLQWa1mNMM0rKxBEmx+hQ==
X-Received: by 2002:a05:6102:32ce:b0:6ae:dfe4:3821 with SMTP id ada2fe7eead31-6fefc6c865emr13119145137.22.1781033048040;
        Tue, 09 Jun 2026 12:24:08 -0700 (PDT)
X-Received: by 2002:a05:6102:32ce:b0:6ae:dfe4:3821 with SMTP id ada2fe7eead31-6fefc6c865emr13119081137.22.1781033047528;
        Tue, 09 Jun 2026 12:24:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm57102761fa.29.2026.06.09.12.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:24:06 -0700 (PDT)
Date: Tue, 9 Jun 2026 22:24:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct
 Resource Voter region window size
Message-ID: <vrl6aszwe4otsgn5tgw7yrubjgi4q5g5i74y6qedme2pehsgjd@q5klliei4pcz>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a286859 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=04ycsxgslHV-TqkOUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MiBTYWx0ZWRfX2pSzbbJvjQgJ
 riNzFlDwZ9fqXTmVqCpWR4m4wZ3p+JWEM4/c1o0g0H88qVbJBG3nxxXYnxc5TaVlNr5s/xe0J/D
 VE7g2+ly6WgY0mh7XLnOY7nZHN1qvoIWbU1mUnGhWmM2N/OtEmVxlEpFA8GRggybUiXum3DqMh7
 /vbSEtifwPDcx0NkjkoELi35QmZwM+KKzbuxHmJTfk0rS2Q+ApNBUIWwFGQSgX9pIIFbRKx34WZ
 D7uehYVezbP3A41azHY/HiDnUgde4mOQHERvl9zrOxWtY7vFeCBzOXv8FTBVGbK9lsOfQafBBew
 LKnyBfO73cCkHrnN6eTUfz2MOLn6fLoWEKYV/ZtvhnXnEWeXi68Y7GBpgQFtmh5CyH5sA42IYe2
 szwoZkN9yBTydPpWPDhb7GWMd/MFxqlu1Z/M+DSzbIIzkaTSys7kYgUXFipLlDxKN4aa6lIr/qI
 w0m4WPKeXARALuAck4g==
X-Proofpoint-ORIG-GUID: t8Ig87HgFVWVMOFFdS4y88bE7_tFwsUD
X-Proofpoint-GUID: t8Ig87HgFVWVMOFFdS4y88bE7_tFwsUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,q5klliei4pcz:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3415663CE3

On Wed, May 27, 2026 at 03:13:05PM +0530, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
> Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
> each region serves a specific system client like TZ, HYP, OS etc. Linux
> only needs access to the OS DRV region.
> 
> Despite this, most platform DTS files described the PDC reg window as
> 0x30000 bytes three DRV regions which was wider than necessary and
> matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
> workaround for early sm8150 DTs that under-reported the window.
> 
> v1 of this series [1] addressed this in two parts: driver cleanup
> (tightening the ioremap clamp to 0x10000, refactoring version-specific
> interrupt enable paths, etc.) and DT corrections. The driver portion
> will be send separately depending on this series. This v2 sends the
> remaining DT-only portion.
> 
> Patch 1 corrects the binding example, which still showed the old 0x30000
> window and would mislead anyone writing a new PDC node.
> 
> Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
> sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
> sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
> talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.
> 
> The net result is that every PDC node in the tree now describes exactly
> one register region of 0x10000 bytes — the OS DRV region that the
> driver actually maps.
> 
> [1] https://lore.kernel.org/lkml/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
> 

Having the driver change merged,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

