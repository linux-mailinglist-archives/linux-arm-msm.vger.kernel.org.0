Return-Path: <linux-arm-msm+bounces-95482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFcMD2vQqGlOxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:38:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2F209881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E708B303AA8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A930288D2;
	Thu,  5 Mar 2026 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtefTEkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iN2BPlF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B231E5207
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671081; cv=none; b=lKXn3YMUudPWcdBGGiHqLC+ypeAv0YQtmHEFOrga6rMWuECoWTwHhaj1+BPnkEZXnXRzu2svpCYFsMnWZC8M5vhmQruZqbujyf5JHFArGSsrfEtkljxVJbrP0NCnGiitxyZGhS3k7VBaO/IvV3wym4JsfZKaLtRhOZ2lr622zGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671081; c=relaxed/simple;
	bh=4+vWxMJd1O34QrWMR+ILXdzNPJ+4ADrlmcyWETV+LDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtL/fUYD/7AbdeiZOcr77jEsWsvNB0Gm771t0kknq5ngmLmxRUEC427W6SzBFZgPH/dQhCQkZvgxoFcxJvd05dPva5KlcmT6AMlf/WNPx2Rzzb3wZGwEFs/VPjUlBTL0rNunnMIQpAb/4JOiVMo8bRlt/f5lVKW3gU1jzijIwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtefTEkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iN2BPlF+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624MXonf2277038
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 00:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jLY9eq+S/NrCuCoxTxD+AvwW
	gjngPpP6tRbAaqDxCI0=; b=OtefTEkFnfiWSnL8bK4cktb9KIMRYMPj9ebk7LYG
	nhTmpElFGqJ9bmmtcv4HldqY5SK6De1jExvDJTyLm2z3xrZ1t6uKEpXt2wanLMM1
	UsQP7Go6q9yFJqW9IHQ4QOnFRQmfEkfDhpdXAumpTqGDaIz/aUDJI+/bpjuEOit0
	l1Kt+xh/f+4r5MiFVJ11N2bVy09aB++EN5XaKhjHUAX2o0CypVswBfkyT8H0t2+a
	H5ElJtS4u1XqRbDcJCs8/GUGobZZycigbO56U8rXmJJygY8HBiUa4TY3kP+NyTDM
	CVqtEKSaKNSc/927X3sOVZD6jWsn3T3hFOgEyMNfjEqIFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mut76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:37:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5051014285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772671078; x=1773275878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jLY9eq+S/NrCuCoxTxD+AvwWgjngPpP6tRbAaqDxCI0=;
        b=iN2BPlF+J/uSCBel7dTd4izl38bPAoX5zK00jpwEx8cAoX55jcMJ5+500NbYAVbk5r
         ozhmWtMAB+cMVWemx7RUkt97KDBLjK+YSMRwO0NFJAV6FId77DkHtJ04vcNXMQhq0HII
         4SqpbjauQzv4t9cDOKQf79kLPvGj4auG4qSl6HAT9iSuF1VZv3vHUwabc3fImAeL4eZW
         fuXwcAit40NtQQUSYXNAuXy3U78zfe7K7Xe8E6AZXLhskFQcePR81TRFQ0AZWDF/CQS2
         8YHpIqnzQz4Ju5QjdDBtCyY5Tyi78BCs/XGHtpCcxT4NbmMM9Fjy/JrvAf0aNKm68emS
         Ym8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772671078; x=1773275878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLY9eq+S/NrCuCoxTxD+AvwWgjngPpP6tRbAaqDxCI0=;
        b=Lvo1IG8rHdFp0bqrj9cDg3QmNnZMcZOBmxMwQ9QcYlZFQ+0numSnom36xmg4GVK8b0
         Mu2nacoV3Afdm2YMtDqSaAN5NwiSSKOI5sQmpUP2Z8MM195tAxcqLbbW+ymyM6RLcDSe
         jUCP1D2LuF2NsQxFI8d8eTqxtiKIbIgT10s4x/EC9I+3Q1sqBzT7EaxPrHdyHx3V+ZMA
         jQ4+oTI7/PEyLrt45WSgyTePvvBzCYpNLXYt/UyBAM3LtVLAFjdUjKqcTIGyRQ2xMDjj
         7uEP0mLzGajIJNsyYxfK8wG+xk9sGdEnp0bF3WP+JeOKdsRkbDO/D/w5ndm3ueBpW08b
         BBGg==
X-Forwarded-Encrypted: i=1; AJvYcCWE8yVBy8KTj8nvjTAr+ue3tlKmxk5N4nyN/PbmSwwqNYB9FPYWjDVpqev4xtqZovRDdViX7ovUjI9xgWWN@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMr76xA/IT1e9a3DEXCbSwxD05nT3ajptjZsodFlHsR3a8IjA
	Qfd345JnBnFc3b8JzxC0zqDtjJUegVj84tVLQrHkM+5HqiOES0QC96im85iqnyx9zbvGzUGKbcy
	WJeSlWTSlP9khMj6jKpZXb7iU7NFZSgQxpoTbj4lM8SpOiT2k0CTIU/HZtJVzr1VkhWHm
X-Gm-Gg: ATEYQzwteNrLjSQR0UES8yfDrF9AaWIHpdE8TCXjpfK9PSb7+QP/gsI1OGKGfbBA7LW
	Qjb+gbMliEa1sSBZQed9bR5JOUCBWuGiTB1YtMaOc2f3GNSfqU66QqlemsBszdPliq+esLdSwQ8
	CR0GhbnffPUN6jdk+4QVAPHX9vIh3dJA4mqZ1ZiKMh4kBgVA/3gSzHR1fe7EtCOaG0yLfJnNgjF
	ciI9E5y00SrpUmIrKmkC8Q8lOgjL10KRuCUMtNeYMBEx+gQtoMX4DSoTMUuzZkgWsax9dYTOiNI
	5phyIe+iLDId0cqcCN1lEwsFTz/Q7MDscpcAOZ2vIj3MrtAdyiyZ8MrlrSf9yDKyf16YgYmMmwN
	fCfxe7HlgZTmzB+nXmuvmvuYFtR9Wxl4YcfN1Rhjf18wKPeq7szMz4gvkY44LbJwo58pG4b35LF
	1TNjWA8P0q76XrDVZDwOFKBQOaO4pEfvBXiFw=
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cd6340944dmr65267985a.6.1772671078334;
        Wed, 04 Mar 2026 16:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cd6340944dmr65264885a.6.1772671077878;
        Wed, 04 Mar 2026 16:37:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12e0c8f27sm559529e87.70.2026.03.04.16.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:37:55 -0800 (PST)
Date: Thu, 5 Mar 2026 02:37:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: lemans-evk: Add IFP Mezzanine
Message-ID: <nhhfkly3iql6ehvglj4pfbddrkpnqc45k6arztbvre7fpuab3w@ejtafo5ka4jb>
References: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
 <20260304165925.1535938-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304165925.1535938-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DYkvlj4JCDnDm9TKEXpMv0__ik2Kzgpq
X-Proofpoint-GUID: DYkvlj4JCDnDm9TKEXpMv0__ik2Kzgpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMyBTYWx0ZWRfX6nS+jTIosjuV
 K9+3DgO8qAreVOn/zTWgaa4oB9d5hn0f4EOcd8q6W5iwzA/jF1U5gG0CRKh+8gsFZZ5oYfdrsDu
 +ijJRjmO79T5jsRgPUNuiXhJZpLxXCIvoEJSXPO1p4x09hhzGkhJbuMSNMo1UnZrSl4tsRkstQm
 ijmxOZxSLVyi/F2nKu13gZdOlhpRWr1lC1AGoJCu5LI5FuMSYFYqbZAiOLLSEuPu7/5rAj+WDI2
 LR2+4pIFVkJXuVuDyewcemibNH92uYmijrStAtj85OCuc0MNq8B/qyqoGJYMr/EqYotPLQOGu1C
 qCr6wyF6ULR82N/lZTkcMYUd09x0JCRISdeku8qaHm4nM6Cmd5RWjkYX8jfYi2wvX78f4toho2F
 FsJDoKLPLHI/FmL4xgk9C10uzkBQT6e5nCndySzwYrKUZeBErbncCdCRL8rsmgU53B3LdqnkDCL
 IB/kffKvwmQSzz/VSZQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a8d066 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=l294Hz_FD5paY8OFZukA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050003
X-Rspamd-Queue-Id: D2A2F209881
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95482-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:29:25PM +0530, Umang Chheda wrote:
> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> board designed to be stacked on top of Lemans EVK.
> 
> It has following peripherals :
> 
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP is routed to an M.2 E-key connector, intended for
>      WLAN modules.
>    - 2nd DSP is routed to an M.2 B-key connector, intended for
>      cellular modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - eMMC.
> - Additional 2.5GbE Ethernet PHY connected to native EMAC with support for
>   MAC Address configuration via NVMEM.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - Additional 2.5GbE Ethernet Port.
> - EEPROM.
> 
> Enable support for USB hub, LVDS display and mini-DP later once
> dependent changes are available in lemans-evk core-kit.
> 
> Written with inputs from :
>     Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 263 ++++++++++++++++++
>  2 files changed, 267 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

