Return-Path: <linux-arm-msm+bounces-103736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IQQJ5oE5mkJqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:48:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0940429949
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E57FF302F4BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D40339F17E;
	Mon, 20 Apr 2026 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExsZEK8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YArBiY0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E639F164
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681831; cv=none; b=N4FfzKAfZRIhAqRjOOHJzl6ieuzvm2IQuObjwEjlwcCtYmqZd2/YKwTO52+DVGew2HEUxiUra4j1scacE0yI5PSH2fxoUNTPhesi+AVIPaKxYHauuuN053t5eaim2UiHFSmINYGuC4veaKwSEBn7lZv0p+uHC+HO/gS5zTS/4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681831; c=relaxed/simple;
	bh=A/8KwbflkQboGdPx9Be7plburoC2MMh+V4Gv8+upZik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZ6/H6HwLWYMP9JdPFPIStIRApET0z7cjA1d4aSrr7IjwiXoAOz8JjCLn/l113tre3wcdCSMX02ZYVR0w/KzaTShpb49qfIiXU37XIwx0DDCKteFCtNqC/V+GfiPH1K6Qu0jeaU23+fb3spr2RKGCmNF604Y1qoKCsul0QmE7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExsZEK8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YArBiY0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97qcE1599880
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=; b=ExsZEK8y+geZAxGr
	UIO8aQbeO44tX0iTGbAFNy4yKSwvqlMnX8xZ986rOD9jsZSYCX6o74kquCaswEEx
	LATiNahkXNBhqclp054MLRG2F91a41YksN42YkldrSAEyA90Yfdb8XQ+b+f2OS8b
	PiTBNKOorPnMQXdibd0XH372b1YazyuZBSdZmuyr+AGi+JUG0cnDuvyI3A6MDzXy
	l7PoTnXfEje5w5FFG5DWl5B7E2HZ2pE3CJ+9XSmA+5AuxZiEpD1zPKrJ2RU2C02b
	DZBcv30coG3lS7cnn3FK+erEyHagKC2t/m+Lr8GjIE/HpX2C0Qvk1YP1eVeapCyl
	17HWsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898atw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:43:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso58180185ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681828; x=1777286628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=;
        b=YArBiY0OMlZezVkT1yyZAfCLK1VDHQQrGhWQ/BPZmqN26IQhHBdPnj76KMOYzEvy3a
         P0h63aXXkycVL3CRIyRtnO1WXYPqiepkvAP0dEOVJkwqDZ80oZ34ixHyYb3VaEjIynB0
         B8sf1/onKVXDSBRm0W3txTbELegsylFLPtYF13F+tH5uUlC11EdyxKPdZl1NN+8EH3QY
         JoiCx24qkjmdlOeCc59+1TparfiWlx61unqmqhOKeE8mLF63pdmJlS1tcSyNJotgiXQG
         LQDrLKmOnRr35PAZQ/Q/6b262jaJKWHcTdY+Zrgn8I+e9rL5VGAjJybd8ixaRRqHz0dm
         0KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681828; x=1777286628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=;
        b=tFigsSYpGxX+DJ05i7Z/w/PQcJW7bEFnwehODzeLg0Ks3HquOA+ymSRMKgOzTMkEaa
         +cRit8UIbmu2nzVnYuuPEQDb9SHbEJ5UJhHkBp43AOhnghgVrBthqj6pdyq2fXhySmiW
         eJnSu7g1JZGipPJGQGFDnXgZ9T7qVSi7mRQvx/IPAJUDH7+nsYrzm+8d7XSdWXonfVE/
         +XKVInSctzqVqpzBIC5IyTc3OJo2z1LkCvJDCtdyeJc6VIaE8DGk3PGFQzvC7GQH26wO
         d5vhnYDFpOky4IN/0Y9Jsk8iGgSJW4vvTu66WUCiO9ZanSC8ZNXMmHITyDfa/SiniIIf
         sn/g==
X-Gm-Message-State: AOJu0Yx6BaDrnnY5Bk5QGoFqdsuetgILaWmZms5NEdc62Ovi/NRW/7MN
	IMsR6EkGNidfeoORs7S2b/JA1pQbpXPMxaWfpCqTScOLkMpQUttx0rktVbNdRXWfLc1dItP7kUH
	rsCFJ1eDxEsKz/RY7U2ZA25ndZOhhlBq7uWj8jKYUpbKEzKrAt3NMTvfhcS3sHM1I5l/K
X-Gm-Gg: AeBDiettpLffhHCfpMZQ7WiT9skpLQlaB5dczpryKHZPRh6tA6zRVObf7MTYEJgv/3+
	jfFVPKBD6u6NpWr3i4gSFATud0iLBu3Tp7OWrQXJfdz4xBIa08WXhKJWTTHAFEfHaYHY5lx5ghm
	8pIv3XmdTKE4gnIec4+fLDuPh+6hqDVruenJZKjqdBlXkBYY41+hYuXo7PqrMMZAEyvduoGXlkZ
	yTgB/+XT+78jERhlNCrJA79Bd0hfPR2pGH4o2CExsZoxaOMEY7oMvK0D6/G54XyEeJtyOCbZCOH
	BjkChsvR1lk6H5fAoHkZ5FGvYVNIwsgfG17khp0lwnmUr+FCLKQ8h23sgRWdeoJ+IIdpRQkDD88
	YE2j3h92lLQ+SdVocuxpZwLTYi6eH+YN0ZQC3EePbbwGCd5Z5zieM+2nlg+WW
X-Received: by 2002:a17:902:e746:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b5f9ef6877mr157919155ad.14.1776681828033;
        Mon, 20 Apr 2026 03:43:48 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b5f9ef6877mr157918885ad.14.1776681827537;
        Mon, 20 Apr 2026 03:43:47 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa1739fsm102350905ad.22.2026.04.20.03.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:43:46 -0700 (PDT)
Message-ID: <94253a08-3a4d-43f1-88cb-1f3ee07e8545@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:13:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfX2bX4sN/xfHKd
 qEbxFQwUz9v419N5zhl0IOR0Y+5bNCyWvc77KxdgUCFCVCUas7DfCbduRcrRO/4GosE1zVNbJZL
 xkNTW1QRKSkpK4OfOHsZQyLY9np7AP7tCNGmDIla28/l1aDADQGF4sTy1c7HMa71co9Fqv9xx5g
 R07PGfg6yiC8DM0KhWFTDai/yWiLLqJyrbdUrkdZUbdAEZuLQtlQjlJ/boba2Mbgre3vjfrWZP/
 rRGwqNqictgZXGHlk5Yiuz92m3OV7tItld0ZHtw+/YxxuYrXgToE11mu9gQCXqQyHC1qk28Ka56
 FYQIn20neTEqGWDvSw54kTfjsJPmKrd6K7zg8WraWtMKSMO6d2tiB9iwz80qtfTfoWWvzFV46wP
 7Q2+3lvGa8vH3delm9j5G0lH+yLqvzvgZnuKdcZ9mcCz/VfslBmOc3YCLNtVj5hWzFc4hLFluKo
 9uE6EaZJLZuONhP4hpQ==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e60365 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=WObRYmeZDjoqXjhBP2wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: NH7-oOv9WVec4wZg27v5-P17uPJ2k9bR
X-Proofpoint-GUID: NH7-oOv9WVec4wZg27v5-P17uPJ2k9bR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103736-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0940429949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on CDSP
> so change FastRPC compute-cbs' reg values that way
> 
> Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 3fd6dd82a992..0fca9662c64a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -350,57 +350,57 @@ fastrpc {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> -				compute-cb@5 {
> +				compute-cb@3 {
>  					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <5>;
> +					reg = <3>;
>  					iommus = <&cdsp_smmu 3>;
>  				};
>  
> -				compute-cb@6 {
> +				compute-cb@4 {
>  					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <6>;
> +					reg = <4>;
>  					iommus = <&cdsp_smmu 4>;
>  				};
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

