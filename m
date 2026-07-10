Return-Path: <linux-arm-msm+bounces-118279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1VDwOajrUGrT8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:55:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74F73AF3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:55:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DFk5905b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DJM89Nct;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118279-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118279-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6DE53037475
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DC0428492;
	Fri, 10 Jul 2026 12:49:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BC427A05
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:49:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687789; cv=none; b=EOyN0fwoVxb/CpP2xnMdHBGfy+fjldCUAi/3rvTNdOp6FhLYKfLz9zijl+cWpWuvsuP1+OblUOH7nC5jq6o0d4AhJEG3O9ktNpnZ/2yzz1BURYm/azfQ6HkZnNyc9F7ZRXtlM2/W8u51oNDRTBuhYKnlqEHHXth9zaq3F1Xv7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687789; c=relaxed/simple;
	bh=vWIXDi7EN7g1RYhBdEX5hlBl5+pnybc5iWRcU1wS4c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzKFJvvZcRJ5yLmzYznImHl8Q86EUPJT1hz8/PnhDo/jPXJ+DwURr+tbkIbd61Euryr7kdlMP1Pby+N7mMUNhWjNxYH7hp80xc4HCaiMRDRTsB3OXyNVpcRrjwnludKsuWyGSD3SkMUte7tXXCmcLVua4xKmd0DuVyfLFQJLKbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFk5905b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJM89Nct; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnIQr429845
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=de+6A6LUYB7HR+bg4pqaC1QP
	O+x/CpPRoPe7ww1CV+k=; b=DFk5905bj0/uFYu0OCqRd6KolTShPnMct5O85a/p
	ogv0fkd0OZ2Kf4zBlrQZomH44cUGNVaU0AEFMDjgvReEeMwPA/0ckTkveakUQji2
	exr8Uy6VBGJHE/sD2/xDcSd0fz3oZETcB+lkQthZl/34HFfZRauUWZD1z4IKREHZ
	2GSk3DH/U2Kue4b3b5wy5zHydY5FNcB1uv3j0LVGf71nPmm5R8rIJbbQy9C29zz2
	APc+foscIooaI4VfGqHTLvU52SoeYiL7suBrlXJce7YPyKytqWMn/E9u6ulM02lM
	V578iUT3vFnkRI5uBukfGUQakgs6FDhTW/yqUuPwLxK4Xg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24v954-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:49:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73850dfc198so239822137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687782; x=1784292582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=de+6A6LUYB7HR+bg4pqaC1QPO+x/CpPRoPe7ww1CV+k=;
        b=DJM89NctKYxNghJnO/LKqM43IxXzRKkKa5LZ+rcY8dwb4thUx9rhgUOin5cac0lsKi
         gtyjk8ARxbx7vCbZGRsux38i7h1vfTxpdh0qykApaihVdbpZPN9TVxLEtg3MfiINpnw9
         bzybDgRsPqByyLmRI6/MEkl3K0+c3pKa0yyR/wa0A3hKyZ1VCIMz8B6gvMdEXwhbjN+B
         kJIJRiSbgux/ruM+1rHBHRxDaQpKCpwzXvIN3kVffTvH8wcMP0y9WnD5RTIyPhF9wzE9
         4o/OrIqXGZOakJMZNVnThfKCUtpDMWv59W998M8Rv31hXXPknTYttbWitVocpCcJUN49
         CCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687782; x=1784292582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=de+6A6LUYB7HR+bg4pqaC1QPO+x/CpPRoPe7ww1CV+k=;
        b=svlToPCIExW2vXMgERIK+AZB/9HN9qhIRB4MpNaFkUUIp8pdIroxP+b3IrQ+88Tw4H
         t0ZPH88GQl+OD/uFkpiws1oLfl1Mq1azytvOwXwvatD9cD9p5RiywZVLBxfBj1dW3smp
         upgVBo2lzgQwh6W1pnhdxrJFgLc4S/o3udR5KL++5ie1MkHgUChWGJYqhDgmAhmDtjXz
         ZEQ+NsBa9YxCoZVZTO3QV4hIZd2Qq4QcqYN1LZT7rrNgAalS8YpriMgYuNVF5PBMycjU
         eCbCChvDEgK9lmcAdZpzsn0KF3lPBUMJSTDiDu08D0gbrFr/wX5aBdMKOq3qYEf3pL3V
         hB0Q==
X-Forwarded-Encrypted: i=1; AHgh+Roj0m9gs+RkVYzrXe3JFsMTy7Dq6ckLBDF/jeHWWhUfhozrtMYe8iKNSTLz4wv3Ydyc1FNgpPmCcOGRIUmL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp4mK8SU44ICEVL4/G/IuQMAGZAj1vcYpyIZ3lUavQ/LRnIUQ4
	PEREe9SFAP1SlzR4oYkHS4s8mWkz0pksxhtnDrg57IBBwetJi02T1t/+NisO6C9DP3zI29rg2CZ
	GpDmvMSnLIdPdlxzpYNdgzALZNlU4xHu3AU4TnfTdZ0IYlf9k1uYuUt2JRhRTnsGE9mAS
X-Gm-Gg: AfdE7cnovOY3pWaeJTx+guIHmjLArj7gQMOWENqrFUW4A3E5PKc0oSsxLci9xP6Ey5K
	vp11H+s8OJAJNQ+akW0CUwoZ5VCPohHMDc9GZwHl08NKHIBXcjdpwq7MxGwEV1rPEkCOKECArWD
	FAU2+qQ0T1Jn+TG8hZbmFcGHgtQRO9pWOddxLP320wZmia97snN7lkrti0cDO28VuhEg0wDrI+u
	/3+wUvOO+lDml7PacweOcReJZl5m57x7SfGVqEXgwVR/Ec1CR1Nhm9kGuFk9Bd6OFNXRoKDYq0X
	aQm/JhiKyUxDYuXyVBAwruIlXErEGJWd4fjfWVPWdpJV7Pda4rm0RU6kUbaVTPkV47Gw58wOHFO
	4qq9u2zzWTeHlohrXzw7L5LF4UjABD+FUbi0wHPHd84DxHW1INd0CbVuV30+rb9qHFFydP5sISN
	bWlxoTOtmvV7iuaPDaa8rBr5+/
X-Received: by 2002:a05:6102:1620:b0:738:9c30:2bab with SMTP id ada2fe7eead31-744dff0aa7cmr6816367137.24.1783687782107;
        Fri, 10 Jul 2026 05:49:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:738:9c30:2bab with SMTP id ada2fe7eead31-744dff0aa7cmr6816350137.24.1783687781672;
        Fri, 10 Jul 2026 05:49:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849174ebsm8983181fa.7.2026.07.10.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:49:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:49:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
X-Proofpoint-GUID: uLrBuipqO-IEQn07uPkFnMDUL_RXls5y
X-Proofpoint-ORIG-GUID: uLrBuipqO-IEQn07uPkFnMDUL_RXls5y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX9qazzNnMZ6Zz
 NAFV6Y+ceD1ULHsj0RIhMECjgtGFAJQFmFIv19T2l6DEkhS4mf0zlWKfCwfLOQSTjSENHkZeZAE
 ZB24Chz9uF6PFd5ExHu79auLojgvX48=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50ea69 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1PiqmVFGVEL_F1alYJkA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX+rQq4iNdldPO
 w41KoS+IkGDhaCLGFzS2p4OlZl2IrPaTN4u482XcgAcL+Q83bbT9phjbRZwkr2uNDJ1ZHE8MANP
 sZlVdH0DRkrmU1i4OpQI1Dyw6IBvJu7+dsPhdZD4qzYlY5Rbn/onv8GJ/CR2YfdcdDYTkebChR/
 Zx4pGmv3YdNRCqQl7ijLonWv3/uK26hjUmIrsaNcvGtU8LSPucGPHEppHtCw3tYBDysa+Vx9EbX
 lYgtI4C/QKDgSsGudy2Gb64PpDuUtf5a6B34nQEVKzAxjbG0AZ4Up/5Mb1DsmqbudP0MTFd7ubx
 wqeJLGAzK16MvjE79abpHmaOVPgLwH6QLd9LMsLWk8xNb9OSrG4YzJEwtCG+5dl+DNItSMuRHxZ
 jyUGOZ3gxqAwOlTd3iNQF57K6vfQU4xHrr5RjzK9UWNldG1mfromDP4/FA3tnJBU8nj0j1qJVPr
 CnJWgYr6Uz/J50vTytw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5y46ajm2iyuj:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE74F73AF3E

On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> +
> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

Is it an actual GPIO going to the panel or is it a regulator on one of
the daughter / whatever cards?


-- 
With best wishes
Dmitry

