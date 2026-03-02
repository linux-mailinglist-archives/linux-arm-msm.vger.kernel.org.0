Return-Path: <linux-arm-msm+bounces-94965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD7SJ7igpWmuCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:37:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BF1DAFAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A32E3004F03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FC73FFAB5;
	Mon,  2 Mar 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKIVQpJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8RbTne+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9A3FFAB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462254; cv=none; b=Du4jBzYzKBNExvmNL6vVF0NutMAsGrMZhgxb6DkPO5ytcYxJ6eCQsIGz+WPqnNFLdw/rrLsbwcZ1hqzwED6yyKbrLMz2dwKiUaG3QALO7z88nphAJ2I4jTcXvn0ZWNVZkhuugPJ+sND67jE4Ejcf8cBiX6657aRH3VDAw9MRokw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462254; c=relaxed/simple;
	bh=uhmZOAonJxvgIVsaIjWMu5kW5c56z8Y/QRgKebmd5CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiePmHkMAr5tqzjJMK5KbMa5cWLV7wFRivdxw/MW+ib4HvGvVRUO8Y6ByotLIsiC7Nvwzf4A4q4t5ONZ/IUl70R1Qai6XaxBsUV0FoPEArbBQrIrCW4N4LXT0zfRyTuEKOi+b2H/QY42FjSPuymcR8dyQcKClv+4aL8TAKqyY3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKIVQpJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8RbTne+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622D7QwX2159953
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OMzhOSPZAkPm6DsCJVirv509
	Szfr1rXCfmzumJhk5v4=; b=SKIVQpJ7tT+ky/J4IcQs3/qpR8VFrt+ykzEUiGpB
	PVrCHN8UoLhk1deP5TEv9HBbKn70fMFXQUbvZ8TFUHIARL0QU/N0jZyufyH14rYG
	p2wnz6LAiJYCqCmzQKKVurQ90+hmm62GVfxh+jX4uozhOKZFjvAZwzV276Hwho1m
	qYlj+MV9Qi1AAVQamvZFw5gcozzUqTDqnFL6t0CLBqUOhrhnb/ZDiHq0tCaLcqEl
	Bvf/HGmpIuYe7+XC05FQhb3EwnkOdkl42qNFXFYLQ9MFFBHknkio8gZrneYtY1an
	PIVwqODXGNtGI/r5p1s/hAiyIETg1BEZUy1j1gl4BQq+YA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbauqm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:37:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35980a994d6so9251058a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462251; x=1773067051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OMzhOSPZAkPm6DsCJVirv509Szfr1rXCfmzumJhk5v4=;
        b=I8RbTne+D66PSCv9kx6YbAUbGZMW9ZqWKGDcIhEQRgKBzXmN4C33PxRnohIXG4oEEC
         1/hTV6bHHnlOfXe8FL7q2J2jZMnrRFRialbcZ4WukYaB1p3VcFDgDM1DkHcYdJP1sJVx
         Pj0WpNRnpGy1FVkUeOj4Jf0bSpLIAoKV52ExM4VijIzOBZWB9JnhZv4ewXhM5zB3VwuJ
         EKCknb+CF6HQvu47qdOaSdvht+9Zkfwt9zgqx1lClAf7n6eJWdF3KvbdLfvrAlaF+cg2
         fUxFwRaH8TZip1QJB16DARHT7hFXkRd1hQpObql2XfnC8fov5l3J0fWA/DuD/AzrKd5X
         lo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462251; x=1773067051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMzhOSPZAkPm6DsCJVirv509Szfr1rXCfmzumJhk5v4=;
        b=hR3hbbr75qExk7So7mVEPA7BDPnkxHH5MVt20jR3BCIe7OYYrXVffrftHAGczZl3z4
         LedmCS5l0pcZkAfLLK1t23XDUAJQcePCRKB3B77sdgVlVgjSubYCiYmvc/BX/gNVVd1s
         rzDamyu+gCVQoMiPEy7c8U0Ph4NhGMh+aK4XJfSjNk6eMgYAjzLiqeirZxcQ/hi8BBse
         5xDEqU8c7pMQmW/DeFKHueUPbu/hLLaumSyfanxIuk2ZL6HwP8s//01zo4DDWyHgd0OA
         igaNFsTY567XHSgBs51Yi/0DRGv6zVgTHkCUGktRhi5hzGULB6IWNLnUeClAfl2UL0Lg
         o70w==
X-Forwarded-Encrypted: i=1; AJvYcCXqUZlWgJ/pls/OOOBOx7LdmYYTuCgnRgv6AbONwVd3OQLvDqi0WlTBetCjVq9uIydnDLb6ozjUBlJ2vzaN@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLsuCFM+mbEewWdQtELPxGS2XKBLbyTl6k2JfpqRtxIjSClDY
	gXa8grborfJf/tpUaELOQ95ton+CMdWad1hWkemkedpawEefJpFAFtGnb3gu2e0rxt4dYQoSfsd
	YfNt5jlnU8OhgpdflOXUPDZ9dQu8zFPINq7H+OqpJSUEVYHN6wYmh2To+xsj9IM+K3zZI
X-Gm-Gg: ATEYQzx8S/xsO1+P6oBB04BDKaeuHD71EXHcaxLeJ/BRrkuj1AyflPYE0vV7rW1W7K0
	dtieY3NTDE3WD4twYnc5ngjevVqbsyT/kyXuJ/d4dHTKpWSYo4fxLdNUOpHQs4XrxjdxYnCR7tW
	4Me4lXPLPCHhbQE2xjBnpNIrf3Cv5Ivlc3VTJuCXxlYr+IhBhXRfuwcpE6lK9ZtKbLHfFXsTxQH
	TeNpMgTnIeRQtID0UQcNiAu7Dpi9sbHdQumnHmoYnx2zDISBQxD5gY1iF0DIXceU+WFqsjNkuWR
	uKldldvl2oDVEEAEX3gkEZiD7eacEzfwQYtybLIGHFxOL9z1rz5fZMRYfTK15zbni0anHMPTWCa
	3yV28rRdbPnoqy3FNV2JH/7Weyu7L458o9UIHKn+tiUCMUTlGnEnFP0bo
X-Received: by 2002:a17:90b:4b50:b0:354:a662:47ff with SMTP id 98e67ed59e1d1-35965d188d6mr10849593a91.35.1772462251256;
        Mon, 02 Mar 2026 06:37:31 -0800 (PST)
X-Received: by 2002:a17:90b:4b50:b0:354:a662:47ff with SMTP id 98e67ed59e1d1-35965d188d6mr10849565a91.35.1772462250634;
        Mon, 02 Mar 2026 06:37:30 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3598ef9177dsm2870948a91.12.2026.03.02.06.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:37:29 -0800 (PST)
Date: Mon, 2 Mar 2026 20:07:23 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMiBTYWx0ZWRfXz7kfkNSkiUcY
 IdIFtflnmjzqHaNSj/JFhQ038YlSQQrUPlxLll7+0zZPPMu2Yw4+Ig4eEVzdloJoGr+avUU42BW
 9Afad3y3BFecdUa0DbO2nSEIhHwqKQjz8KE2sHJYF2lrtVK9cTFy+gQbCTG90FGdZj7Ocng84T2
 jk+hWlGz6aHeU/ur5xGPH/3ELr4pX7eK5VjvW+iWypvZUhqa9LCMymcFZxyXRsCp/KP9N8j2KGG
 c7hyTV3Hn1KNxjt2MGdfxG7czkoBmqC7fq8j9b/a9w3wHG2bqu4UpLeJ0z70Nn76mCstqXqAaFN
 8raGyiOt1T/hVotrmH7Cvv7Z4EZC/GA/u3NWRhU89ld8VHNMPR7cSMqmbPq2/+W3mJgGwQMx3Mj
 77e+FKQVaQZLA7O43wlHBZ+WBN3uJTwHVpwCta4KmvtGWTQDgEkq1+N0jdHhNbQzQtnuZ/Bihj5
 vzkpN0F61vgJ/0VKcIg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5a0ac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=U2YZr0DjLyW8uJ9i07MA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bl69dHyrQeg6p1qwOTIFHghT1Vi5sYDv
X-Proofpoint-GUID: bl69dHyrQeg6p1qwOTIFHghT1Vi5sYDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020122
X-Rspamd-Queue-Id: 4D6BF1DAFAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > This series enables SDHCI storage support for both SD Card and eMMC on the
> > Qualcomm Monaco EVK platform.
> > 
> > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > cases. Previously, the common SoC dtsi unconditionally enabled the
> > 'supports-cqe' property. This causes regression for SD cards, resulting
> > in timeouts and initialization failures during the probe sequence, as
> > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > with the SD protocol.
> > 
> > To resolve this and enable full storage support, this series:
> > 
> > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> >    now only enabled in the specific eMMC configuration where it is
> >    supported.
> > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > 3. Adds a device tree overlay to enable eMMC support. This configuration
> >    also explicitly disables the UFS controller to prevent power leakage,
> >    as the VCC regulator is shared between the UFS and eMMC rails on this
> >    platform.
> > 
> > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > 
> > Monish Chunara (3):
> >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> 
> You are adding two overlays. But what does it mean? Does EVK has no uSD
> / eMMC at all, having both attachable via some kind of mezzanine? Is one
> of them attachable? Or are both cases present onboard with the correct
> one being selected by the DIP switch?
> 

The monaco EVK has both storage devices present onboard and the desired one is
selected via a DIP switch. The overlay selection logic would be based on a
fitImage metadata entry that gets populated at UEFI level by determining the
currently selected storage device (eMMC/SD) on the device.

Hence, this approach becomes robust to enable the user for using either of the
two mediums, without any additional requirement of reflashing any images.

Regards,
Monish

