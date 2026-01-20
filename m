Return-Path: <linux-arm-msm+bounces-89913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJZPNEoVcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:52:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4C4E263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BF9D88F665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031433D4103;
	Tue, 20 Jan 2026 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0B5kD7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEkNbdcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865C3A8FE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950511; cv=none; b=CWeTL3XHChY5F8lnitpXN4eEBPW5s41yuCQ+1IAxn8zQPgUaN8yw+U5KNv6uap+LFKm0m34uCFejLsC66zlyTUZEV3bZl89C7xpV+SZC148mJt8I6TscdMEm2TDw1N67UNIwVE/6ikSjSe7GFvT3kXvpERIiNIlEXf5m2iwR0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950511; c=relaxed/simple;
	bh=uee/c8hGQmUEMEsglQ4pfz4tBNsSFvW/JoG+vtVkY7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKPEe2gpp1iHJjSRB+l6u2W31uf7upu2jMiZX6rP3shIQiOFi/3ooQO7ExP08Pnl8oZhizt/z66G0SUXaO/s5TRL10vj5tfPSHJ4grq8+PeHbTeVXIJUB8C6+bR9O1xm+dNm32nzwkR1rqUsKI+NVnSk+5rRf2zXwCr+zaniKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0B5kD7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEkNbdcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL81Ic877870
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bPoWw3jrSB4sufzDTe3r+Tk3
	qxkR/xWPrmc8ND4ZI7w=; b=h0B5kD7HN4kFRYOVBsS+nSPJ1OyK8xXU4foNMiUb
	hYL0abEnRS99Dwqav6+sSYozHBwVrKQOV7w4CeC4I8tyVFh42hT/GOXQEyv2EH2O
	yK0jEk56c0sG/gZBPCU9NsXUUQ+H/kacvW5ZobucggG5JjCxvw253/k/IuM6kwfG
	yP2W6yLoqUIKXh5bmxuhJ3jqNrNXQqzMtV8azNihJBS3TALgb/CQfYbyR1f9YJnZ
	eDkzloCD7gnSN9hKq1U1gpEDLAGqEy79birQ+0twpNpmlckx+v4mJyBOak26Qbdx
	Otttl9w4qLBjG+c7pD39jAWG2BNTy7XOLuHzaG3AS82/pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42hyg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:08:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd47227so1033358985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950508; x=1769555308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPoWw3jrSB4sufzDTe3r+Tk3qxkR/xWPrmc8ND4ZI7w=;
        b=bEkNbdcYctxbZLBgltWvoQBkcnS3Uhn635d67EsxkrapaSAZEg/lRBlPhhNcfNqcTa
         gttUmlXGOL4b7vrzWaay4DDTwSnEvkDchWpZrBeY+nCwH8Py56MR6YG5KJQUJxlw5bv1
         Rvnd6JgPmQl2likLT8ECDj5DVadXFa7wLpw9Rt3enKT8HaJgFEAcAifg/X9r3QLaZnBe
         GUizSiDqt1EB/Slm/ERxuyIrr6+70ug8dW0YBzQNWC9/VVi32HF1tAst7GhJNwB/IEzo
         xXEGGQ0RIOgN4+V8TZF6G962Yst3y7ABb4C7DZhjqQiA33dmYWCZl6AJRWtk0eCMIlXm
         TmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950508; x=1769555308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPoWw3jrSB4sufzDTe3r+Tk3qxkR/xWPrmc8ND4ZI7w=;
        b=kYh1sNt9Gy5kOD7hHEfFwkYp8E0jl1k1mhEK37xAm/C24RWbMdEH4A4/O6tawW3FDB
         OayxzV1Ctj7WDTi8RYfvuQl4EckC/pwdv6FrywJTeSg+tQvapyS20OLwwbfpz7ecpnlP
         oxbBh3Kv1IAMftzHa/0/UBCLQQIMkhUNv26u1FR3HiLaiLdVFtCliF/wuvHSKljGnMBt
         PGzgaqdNhOPgBWY1mbaSy09iAe/yYeX8DGT+LqihD90+xpxQDIz8dXb6XO0zIiRPnU5x
         0rfOO+bCp9XnLAhaoBypHfDbVEDGf7QHWWRIPlEIvY96nH9HbElF6o31KG/hsdU8ezE6
         jF6g==
X-Forwarded-Encrypted: i=1; AJvYcCVjUnPnfosyJ/a8Pyer2OJMM5LpPegRKf98zagQVLIrTOV+ERYUwek88FUU7gmFTq7iy0NpKwzbXyo8rbdS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfz2t6HhUfe4bbHb+IIsQE6s7o6lhvHfl+/tv8TQ+/Ejz6LUFm
	WHO/u4pXCRawikHFzAVMINX6M4RL4EvZqaaEIhXbxzVqEZC9uMkqNeaJoEP/IBh2HLbd0lUMsUj
	IXnDKqoQAnjoP++zHK3zctTXWIA/9+E2pv/0J+BhvmTW+fuhx+x5a2FxbR1J+9PmvnTDz
X-Gm-Gg: AZuq6aLpnfabzxO4lkXzHfLHWDFQafJV9Bd2WVGukX2GqhTXFbDtbNwl6kdSoPcoKI9
	4agVwKbBxzAui+jHvNFzN6a7e1rFiBYxsKFMGWpjIRo4h7uBdLJe0JGyYkFJJ2zW5kpeDkHkzrB
	SYVMh090+6srOyn3ZSStwqe/lC25AwrvK0nsw1fanQLzC6qo5ZvCjVhdSX/dSTsjBlXOnHvuX9q
	L38amDwHRzwdhMSJXB19cum+UJQr/FeJnF4piFHN/CSL666EKvXsyY6Sdov/PU5Db97/thafsaF
	XTHb/VuSXP1zOJT92B6AUk8RSbpQ7/kagLeMK6oj3wJ4ISvW6FbUcaPP45KbYFFp6cT/5haSh3q
	5GDjZiKnSlFaOS0ZkjsqzrBm9W52st4fLeD5wK0whVbcihXoEOWGMEfXE3Lk8xIEE5yrth2Gt97
	CxeV+47zfaaYMASgz0eX7OPO4=
X-Received: by 2002:a05:620a:400c:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8c6a68ef9edmr2120660685a.39.1768950508464;
        Tue, 20 Jan 2026 15:08:28 -0800 (PST)
X-Received: by 2002:a05:620a:400c:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8c6a68ef9edmr2120656985a.39.1768950508016;
        Tue, 20 Jan 2026 15:08:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397684sm4451161e87.58.2026.01.20.15.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:08:27 -0800 (PST)
Date: Wed, 21 Jan 2026 01:08:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable Qualcomm Eliza pinctrl
Message-ID: <ywpmgdcnvkttwpnxwjk4oqw7k3nqniornlijyimrt2efifpjoo@wv737kyzzurs>
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-3-b31c3f85a5d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-eliza-pinctrl-v1-3-b31c3f85a5d5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MiBTYWx0ZWRfX3IzbKMdVya24
 00HWFWBtBlG1aJrQd8MaU8Mpdb4FiTkE+kWsxz83pMKFhcnwvmXH2j0zKWuTnIIBHYvh4w3oijN
 o2vE0DoNhIz+gD7+krirBlbMNHheVNojreF0b+4g+z2BREh3/TTYSmfGpw9sJj4DnR1tAGf1EkO
 MAiA2iA5ipWMKEgyyYO/552LtcJGSlnbEx9Ri2HivbFUrMBjs0A/dlsJaBqAGJXv6nrl4edRslI
 glxLSSMixEuXS28wElVwJDREVCSGAxwVg4gRbkQr+0Td49cEXIJSX8+uFnvnxqLflpRl/CDLqCX
 0RLgm1QGsEPxu3jVjbAhaEnQDK6t1CpvUrz9G2MTWTUk7mtQbgdPl0hwgMDoE7rsfw2GjGtWpZR
 GSJyOov8cRuPUH6Dw+NwYLYr2xeJTB3o2BjPFFNBebSy4nmGd1q2rPwvd0b97nP3n6AgxCo3HcB
 7JeSuVsLrnyQg4mftqg==
X-Proofpoint-GUID: 78HY6TI_FIUCCmNGJFiGwQfGIpXl5Y7R
X-Proofpoint-ORIG-GUID: 78HY6TI_FIUCCmNGJFiGwQfGIpXl5Y7R
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=69700aed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ibwh0kRmhpwBd6XjUaMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200192
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9E4C4E263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:56:42AM +0200, Abel Vesa wrote:
> The Qualcomm Eliza SoC needs the pinctrl build-in in order to boot.
> So enable it.

defconfig changelogs talk about the boards, not about the SoCs.

> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7a6d7e70d383..7c100e51af88 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
>  CONFIG_PINCTRL_IMX93=y
>  CONFIG_PINCTRL_IMX_SCMI=y
>  CONFIG_PINCTRL_MSM=y
> +CONFIG_PINCTRL_ELIZA=y
>  CONFIG_PINCTRL_IPQ5018=y
>  CONFIG_PINCTRL_IPQ5332=y
>  CONFIG_PINCTRL_IPQ5424=y
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

