Return-Path: <linux-arm-msm+bounces-97562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IbBDpgztGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:56:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E502866F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26A2D32240FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6870035E92C;
	Fri, 13 Mar 2026 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOF7wVz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9qZZQ/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D8635CB6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417103; cv=none; b=h998h2GsdGQwiBbuX8gaXs47HKT+roP4WqysNgmW41yapdUSX5akJ+TrtkkbF6LTsUGiYx1iID/Q9CYodpyNC3qffTt2nHSdT69NKpi1yE923iGQ+5ecxSiLqBX8+14FLZx9w84P7mx6hiZ98pf1fx/wqtBfulT8EMFC9Nsn8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417103; c=relaxed/simple;
	bh=F9f9KePH80kSBIUcTn2iCdOlP19qAWALfWYnXK3xzNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKQ5Yj3pazVRSE3Al4ia5AC9BMSM4XQICtThg00k+Zrvp8DutPrrknUxCl7C7vdgpFyC3xZ6NACitaRBK1vGyCMxzbp1kTewbKa6alhE8KY/Hqg+1RJiwzmX2/R74+Bb5wfebZ9cZF2lpeUSlVm0oxgbvLwGo4cm7YS1/xaK1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOF7wVz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9qZZQ/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCkXhW4140672
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiLmq1wwIot6pMpIDx87cpRI
	y+uDiLPXKMUJWppQYzI=; b=hOF7wVz4rPZT/3W3ohVgJEa3BcM3Czp7CKDSa+/5
	/cgUEy43qx91K4fh1KJyHEtaCH82sW6aD5Vb573aaBW3fs4CCHtEQaNtvrc8pzRx
	hzSNRmJoHGpv3ritxPJdBH8vG4P+kZG3e7mMBcrzutruOp37iSQ9BGZ7La2Ng/g+
	vmkU7xnJVfOtuBSSQd5bgw71mwcrHe+erBKW+92WH1z2woBUVKq6du9BIoQ7A2sw
	wHaiobEtMWognL0NAjamipVmBiU65nprTimd5pL5vBIuxMO3Jw5OcQ87R8YqoutJ
	Q0axXvJ11wmrMF5g+b50MIJBnyHTmCvY0RjzWpwuoLsUCg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2a892-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:51:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so3180136137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417101; x=1774021901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiLmq1wwIot6pMpIDx87cpRIy+uDiLPXKMUJWppQYzI=;
        b=X9qZZQ/c6vc3eJxAo91J/NFJe0KqMHJ6Bj56INjH2qJo3RtZ41BpIcfRZGb0CqP7ze
         BTkZw4/M58fXgCjOlkziqFZHo39YqGhCp25GMuh07stbub6v83twruxx+18SIcrEwowT
         qmt+sM7ocgtTGJCT+ntb8HxdpexACdTvTMdViaV70xkCeDitQ5bKdZUAtyuV30YlVE9J
         bhCECCOtL/eTl8CZUCakMZjze9X4CeWN5EXpM5L2CbAWbbNMQLcBO0BEij6lWMUjY71W
         F2BNSl/QundOSKmuFdD8Y+bcWEXhCv/qqghL9lBHrcXA109L8qFO5XmBnqFjjaKa8j6b
         ahVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417101; x=1774021901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiLmq1wwIot6pMpIDx87cpRIy+uDiLPXKMUJWppQYzI=;
        b=EcT034kU6GIPBcWuN7N6kYaPvBzyVzvJsZdbcblRAijwyFRKH2fjjEYQPYnB3/oGan
         2k/iw1jZTOcdGvHY5ibT5KNo3G+5crTMkASEs2apM9qFILgqmfIHJlMTG9qEZgTyjN5w
         9ESOibc7Ik8LDKZYxdBtDxWgSUIIIRs9ezKQQZRMaxItB+Ho4IRy+ENjpEwbBqpXyBJz
         i0x60QT7NKkPQg0LFJ++2vQYuR3pd+kisqR95R4wVq2K48rGDZuGTnSI9W7pk2pjt5ZJ
         ZMcwo4TjEFUkKZMq6aRzlZL5Ehj9U/i66C7Uq9cDwrEQsLVVwU8k7doqFmsmkyB1DmCZ
         2a2g==
X-Forwarded-Encrypted: i=1; AJvYcCWGcxLotcD8HMmSf3oQQgfqcYW3a+hrGvgDw7qrb75YdMRbuUP+vAAquf74Vkv/nc8h4XB4JDY3lz4Pw642@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFCow9bx2DHbXqLSQQBPspwmaRDb2+oobhPnfRzVKgkuj5Tde
	dum6zoWEtuCqdUszh5OpgB2gKcUu05UrIwRmxotzcOg1CT0fhDSDfRihl/lmr9VavAq+Qau4LX7
	iyR7waUuaSngv4shokx9CMU9yfwrHBRhpQ3dRPoiu4T02FfXhFO5qETuG3b84F1fRc+6K
X-Gm-Gg: ATEYQzxILJjNoh3rO291IR47kgc3yTbFjPdOKiqhCs1TX+nyFNNOFXI8ZggdV4Q0ZUy
	dTGQ/q31sd0pFaY1ExBBiWtiTt3ax3vUZLkiF8foEPI1K5rpkHPxQE6A737oSTV3DfNrCsevn2D
	dqbLeLpUFS31G/442X5lgf/FP5ossWcYC+5Dbblc+Si+VhHv7MjEdiAib4uzkRN75iFp05rqkDw
	HzbWZSpmmDfvgM8B+Q7yQuDXfVdmOxpIwj9mtgpKae7A5jPAlumb0qW1lBolykxiS30vfhw62j+
	AKaSaLLwJHJbdMog61N9LDVOvtZUAk/zkiV14u4Rc04Xq4oFdkdHnB65cc4xD4HAFsBmeAd2O5/
	MDJzc+n03Mke8EXepLwBHB9Tb50ky56RxEmvyZUmZmDS2GTy+zvf5398f0djcWXFS6iMiCvZVrZ
	fI3jPoAIzAPjwN68UHtk1tUTmoL7s/pbuMF7w=
X-Received: by 2002:a05:6102:512c:b0:5fe:159f:2ca1 with SMTP id ada2fe7eead31-6020e223118mr1374565137.13.1773417100615;
        Fri, 13 Mar 2026 08:51:40 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:5fe:159f:2ca1 with SMTP id ada2fe7eead31-6020e223118mr1374558137.13.1773417100188;
        Fri, 13 Mar 2026 08:51:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a8c8979cdsm4263801fa.38.2026.03.13.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:51:38 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:51:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Message-ID: <sf2e5rld6oiv7piqq277ppe3xqrh7q6bz2qntekzusq6w56rr5@tc2kdlnocul4>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
 <20260313-eliza-base-dt-v2-3-bd91367d860d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-eliza-base-dt-v2-3-bd91367d860d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X7cRPC2dVZsYlJQgeG6-xLA7Dx2-ef-A
X-Proofpoint-GUID: X7cRPC2dVZsYlJQgeG6-xLA7Dx2-ef-A
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b4328d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dn1uUJcRrVR9k03n-jwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfXwX5qioCz2W0r
 OBVLssYo2lYncGHYL+xg7NyGkGF/mjG9hTxm3qbdK0szAeeplXcq0CU+Jpsk3TxZT6Z9wIBHi/q
 l627OmfbHvSJ338H+6Ueu6gMkTgrrV3DZrnckAqc5RZYiAmRZlp8wT+ge15bG/fRq40P7qhDf6g
 HP2qjo5Oy4jriyBg1AbdTaA+ps7yQnckjAOkb+Oh8Z9QFH5X8Mi2NR14Pk/xuMOxnqNkT0MJvtw
 aGD/LP6iDkkgxfi8DxSJY4KRTdq/Rr2tH52YAd92SHNa+e4J6cB0GenlmhZ/xpHPt0WNoypbanZ
 LN2tSOC/WYzO/DHdpAq8vtUNTZljEpjeaCcHjLiu1ynkQQyQFALITsTsZMOn/CvxqvW0GmK+MHT
 eFSemTIWbD9ImeMWRoVtJBdheegHiAkpXr23C2TYN03NzqHslAAz1PXImnRCWJfrGu4eFSt6vSd
 GstZEz69s3AAzStQMLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126
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
	TAGGED_FROM(0.00)[bounces-97562-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1E502866F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:23:52PM +0200, Abel Vesa wrote:
> The MTP is a one of the boards that comes with the Eliza SoC.
> So add dedicated board dts for it.
> 
> The initial support enables:
> - UART debug console
> - Ob-board UFS storage
> - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> - board specific clocks & reserved GPIO ranges
> 
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile      |   1 +
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 407 +++++++++++++++++++++++++++++++++
>  2 files changed, 408 insertions(+)
> 
> +
> +		vreg_l12b: ldo12 {
> +			regulator-name = "vreg_l12b";
> +			/*
> +			 * Skip voltage voting for UFS VCC.

Please continue with 'why?'

> +			 */
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +

-- 
With best wishes
Dmitry

