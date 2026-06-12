Return-Path: <linux-arm-msm+bounces-112828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VDUgGghSK2ri6gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:25:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98D675EBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:25:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FawRp0tw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LuWW1NSk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCD2B309003C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5512D661C;
	Fri, 12 Jun 2026 00:25:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B62D77E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223941; cv=none; b=ocLDBSDtQiOziVtZw/U3e5YYORyrAtquaxzbW9khkkNvR84Er/tyNUvbplenDdEaGQ7x1V92hb3AAYI5uLMwoHGNqq9XekeILv6Jw5cWt6kJ1tenfyr/CCZzYLb9UW+Ems4Z5CraDCKyZukJIz7eBv8zJPg9FUbTqnRJwCpN2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223941; c=relaxed/simple;
	bh=ps7Pt4xseZYFFr2fzgHdw4o9c1eHy32wy2QzTrkSobI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUv274Iep60JbehQAmrhwY0nhUifTrzbzzQ6n+LTsyOFsEP3KqBOgSHzPWLpu2eyDlFX4UyPYoJiD+lWPwmuQK/eh/epjwoVvgQlo4QIO5DAJuWEYIfyFzdJ4WYfHtHLqqP1A68jdr7fFW3r9+Y0Lsfun91bW+HMis/yYiHYMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FawRp0tw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuWW1NSk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMTJvR1917871
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=; b=FawRp0twJnaY8fg6
	9OpnSaqjKR3DLTIdP176OUIRxkykpEwlEOscVfLvKOJ3VPdDoaSxkUA6UgfdD8Xb
	zBYmu49Pa24KeadEBv10bX+tzTEIfIvWDV3NKOeaihdQ8xr/shprTIbqWM7sGm88
	DbgG8Dx70YOYtq5NFyI9DxV3HYFPDMhYox+8GqXoYh4cmxxLWEWpAcrUxO1Sj/HN
	61/Jzd9zVfKsZDN2zZWpHRtlUxfRrlupuFU3AG+ByD8Et7qCit8HnM6medvxD3xp
	rbn2J1eNPKXqtS709tPr0kcg7mLhxJBgxVBIqQxLSdtlV1hIoVnmDvJt/IQ5GphJ
	GpIGBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd1nyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:25:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b8df670so7016121cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781223938; x=1781828738; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=;
        b=LuWW1NSkceuculxUlUNcX5/NO/qDXw+X4pNh1v1pATZYTlr02PW+cPLnzxMDmG6IQo
         fjSvztFzZ1Ft6TyUpLm+ArH2wMJUEX62uRWJ/rJtKelrfxls5JhxztnJ8W9l6mD3dRIt
         w8qTB8GKlhcG2PemHAeu1yQbsoOI4zMvv82RS18TAvGWJoRftw4q0HZQxnyZ0PnHf7XZ
         r97BdN0580nA5rVTZBjWGmfaTcE4MrOl62we9F1KvQn3e0txM+bOnXbIBCtjECMpBqaj
         e/OOhOZ1yDM1cX3miTYZLbPpODN/n/PLt+ncxw+6+02bY0cQWJRRyjkoSg+7kpjDhRxN
         gD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781223938; x=1781828738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=;
        b=aVJT78p+HslVbPO9p8WrpGDoq/BgaZTxC0wH2L9Q4hGuhiQsy0B5uV8fx+SljXtGt+
         Q84RHggPUFmtjfIHt5UCRl4wLFP3IVKKGIV9x7pyjU9W4jn2icAM8zYSJQYx4i1bt3SN
         YQbGy+8lt4J8dCvWzwgIgTvUs7Z50d0W+vfPow9WC/43SWt8yLwycu1WUIfC9aLmzFRo
         fGq7QVgL8ve/ssLP1ftvsvt1b/s9jwZaotZ7S+mpCW8xGPbAynfUsV99moq2+H/7y7bX
         +ReghUmFboKXdTNh4Yuf+w78wdsNwNKV1KvRDIROCZ69kBH6BiKP+zM59ZmblMvF3+ux
         xR0g==
X-Forwarded-Encrypted: i=1; AFNElJ/xBNwxkZkwrUKzBNVvo4yJbkfX/FtUUTTelj1a4sRGFrBax3JlGYlMk1Y4EeQci5lrSRbt3vLt1RuYz/qh@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwqpdXY+CZy23HU490hKztOmgCkyCa75rjObmNl0HeMtCfsKJ
	pJPGdE5DOiMPqELpdtJAIRHbV7uliM1v6ipT+fnm+iPnrwrKciH7s3G3s8H34lzy0qaLwRkusuz
	wWaBRUidBuF8wHKJgpvQ7FBjLn4jMLBDNn0UaLAYTrHOkIxsMqErkQwOlXiRloxxIRZpg
X-Gm-Gg: Acq92OHJT2MDxIBNr1qG66WR4SrqJm2fY5sg3Y1oUgDW6dDyoVcmKJQGHKBtQgG4e9u
	DNIfPg/SFU6LVULgvCbpEshD7uWtCBHYQO4xzk+qdQ7g5sfMalbb1MvsQbv1r2p+p7Cv4rMgBko
	Q1GNWQC+NEfxnoSw4bCUd7yevFnzaPu8hR5E0QeqCi36nP7uM/u2lIAfvkKPy6lBivBKTNXKCAX
	wCk2QN6CAMqAsBbi0Pkt4+0VFRuVXuefOhdTWXISmndzyt0ONzaARVfk/THa4bc6dQij5t+9IgL
	41mTOtStHP/1HnYEHr3q9ckpPYMW8y3Oi/p0IF0/D7L+RNOyiuTtyaABhpsABkk2xaGcXAQLAzL
	cpITGetDGhXl2ljqSexchCmfoj9pl0tR2CahC/xvOW9OOOAhCdF0XX0+YTXQTLm3HppWWelxvy0
	JO1bqYYb8IxJYcsAHLDeJU/bn+k3CdlDNeMGM=
X-Received: by 2002:ac8:5a95:0:b0:517:7ed5:b56a with SMTP id d75a77b69052e-517fe1d9786mr7577891cf.15.1781223937809;
        Thu, 11 Jun 2026 17:25:37 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:517:7ed5:b56a with SMTP id d75a77b69052e-517fe1d9786mr7577381cf.15.1781223937289;
        Thu, 11 Jun 2026 17:25:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162013sm57653e87.10.2026.06.11.17.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:25:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: github.com@herrie.org, me@herrie.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
 <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PH4D_g8lEmrRYgR40jHfWogf1k0xN-xz
X-Proofpoint-GUID: PH4D_g8lEmrRYgR40jHfWogf1k0xN-xz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfXy9LImdIxfLmj
 j7g53YMDqIcJbVqktwi1bFeYISstE+X9ptuRa4sdbNx36nzc3Jkr2wT3uFeUsqfzgiJUUfg4CYn
 DFtlX+/GworCBOz2bGAV6wnsX/j5ePD3Gr3PhhIoSlzovPdQl5Y48x6Ro6yTTet3IzfAH/6Pd40
 4UD6f6QzISOctmtAefRaCffZhiSOtclN+gJutwUDPMHkjFgKlnmQfAiGcW6iXps6Rf6T1L6hnfq
 ip0v2dv/UOhH/fK4UdDd48gWfrZDD9b5hRnj/2XRqSAHWt3AB3y2CtZ5aNFC7Dz10zaWsgBgiMa
 D/0hAtPrmk9KxbVNV5/g8PlmJ9gmQwjUCzYEXkxmVxfOgKgg3D/SlB5xiC5BT8G6ynT/OQtkdfB
 +6r+7vDSpQ69OIJ0ZF5yDLUfOMnktFGhsp0cEYmf8GnUJeADREpiZ/Kwvuz/ETbBWdwWO+nQ/8O
 U6mIr+ri5REN09VCipw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX1O2wSEgpjFFi
 PMJAdkCUlnqJq7pd7LWlqrqnyZoxMpTrA2hcLIv55H/LfpxEbgEKNJ0gcUJYEEoQ3zCir2IkS8P
 5vJc8kYj9fwMT3mcwZMb/QVgwtfHqcs=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b5203 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cTwmTnRGAAAA:8
 a=zUIbg9vhP_L5b9AsXv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112828-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:me@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,bp3z46gsfvlk:mid,herrie.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF98D675EBB

On Thu, Jun 11, 2026 at 12:39:45PM +0200, Konrad Dybcio wrote:
> On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> > On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
> >> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> >>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> >>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> >>>> (address, value) pairs that are written after PHY reset.
> >>>>
> >>>> Unlike the existing "qcom,init-seq" property, the address field is
> >>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> >>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> >>>> class hardware needs this range to programme pre-emphasis, HS driver
> >>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> >>>> via platform data.
> >>>
> >>> Are those register writes specific to the device or to the whole
> >>> platform? In the latter case please extend the driver to write them.
> >>
> >> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
> >> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
> >> devices), the writes split into two groups:
> >>
> >> Platform-level (same across all MSM8x60 hardware):
> >>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
> >>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
> >>
> >> Board-specific:
> >>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
> >>    devices use 1. This clearly depends on board layout (trace length,
> >>    connector loading, etc.).
> >>
> >> So the platform-level writes should move unconditionally into the driver
> >> behind a match-data flag for the MSM8x60-class compatible, and only the
> >> HS driver slope value belongs in DT.
> > 
> > Looks like it. Please hardcode the value for your platform in the driver
> > (with the comment), meanwhile we can try looking up the actual values.
> 
> Do we have the values for a MTP/QRD (or whatever they used to be called
> back then..), like we would usually put in there?

As far as I can understand msm-3.0 and msm-3.4 most of the boards were
writing 0 here (although it might have been unexpected). None of the
board files set the hsdrvslope value (which means 0).

Please correct me if I'm wrong. I see that for tenderloin kernels change
that to 0x5, but I can't find a sensible commit message.

I could not find the documentation for vendor ULPI registers for those
chips, so I don't think we can identify, how to make sense of those
values. In such a case and having different board-specific values, we
don't have a better option than having a qcom,hsdrvslope (or similarly
named) property in DT.

-- 
With best wishes
Dmitry

