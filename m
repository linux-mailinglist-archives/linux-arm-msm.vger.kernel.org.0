Return-Path: <linux-arm-msm+bounces-112061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EBBTBNnQJ2on2wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C88665DDC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZCovegja;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DzowZdkT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112061-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112061-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 974DB301062E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933053EDE78;
	Tue,  9 Jun 2026 08:31:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEA2F2910
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:31:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993882; cv=none; b=qGrxA4Hho9jyNgICTUvbdbCl78Eu94RV6BUL/DK2VpOWn8tEzqSXUOWKDRiHRkMK8JsFtLG85voVdW6gsnmzjIy7kYr17/ckSNy0Q4s3YCTKY4wcCsNguoTRM+6Nd0osWFcOrW2qeh2kgS3kJ9HPXDTed0qMXN6Meq6z/F7+wRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993882; c=relaxed/simple;
	bh=FupT71IspFghkCOY+MaMa8PhJF5X4yNy+GJaJOku1+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAHjDkl4jl7od7Goq2Tz5M6nvm+TC+8okKGr5RmjriW1G0Dq9X03vc5lcIMaSRoo7EdwdX8SEC+DX5LlDzr4uW0JK0H6ruLCABHQ36myRDDSnOP/RZg9Lgh/3C2ScEsnBb1VYkp4sU7CE8inYcpi6MmQ3q2hLXZKa9Axkgd16k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCovegja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzowZdkT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rKuV1585653
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=; b=ZCovegjahJgux1s7
	6smcIup0YtkKDW5d7+zwsKLMQo2fWbdcS+NOyDIrnjDE+SaUMNe5Q36ZgYHl8HO2
	uhmqCXKEkvy5o5T4XsIyTZ8l5fzoLCXAjGHq2xsTbXXC2ZiPBXPZlxT1YrC00TVb
	wxPecq24X7ktHaCW0Nbhlj8taeppcqMfY1X8lbW81AdmIKsYYylZ3LYI9qbzknbs
	i15WM2XXHLOEV0xJjAf1+t+laZKyeRNUY0Ty3CEX3LOhfh9MsPzgZzdpnzqyGNCt
	o4j2UNknZoaATzN59tO+L2cSr9hEHZXBDd8U7M1nWuuA1ibq72eMet3qBhaNsXv0
	cIo0Zg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg6q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:31:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf11699875so54378105ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993880; x=1781598680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=;
        b=DzowZdkTkm8UqIJkDVsuFUP8nr6HSPhaBF6x3GrZYlnH1CxjnO2rI6IX5DCZJxCDs8
         ozrdC+j0xU39Hx9OJsJG8WZxoQ/v1Q2EkPhGMy9GLz9bQ+El3qT0e8K0JxjfDdDSkCOP
         plJ8rIs6cqO+sZmoR7Y7eokNaiz3gXxHBUg1mY7PMJvb1ZIiVEZibtSKMZAe8UWzRWBh
         Sz/Hl/gS0rVv/xo7dpbfjeqhEbnfrfciwvRFt7z9U9eCmmmforoeuX8p+Fw3Q820NXzG
         WGqr6C+30oIk8iY4mlEpNp3WCviq4FLUkp/BmlgdpkYAkPIJuIaHw9zG2+UqvM5GT+nG
         J4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993880; x=1781598680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=;
        b=NLUJtzTrNd8d6iqqcJVNf9PDb+3a/9oc7JpQxtFXX65aiiL7eMjrCYzqXHPxJ4Vfma
         n7xAP5MtnzW5nqiwsR1mLpwGp2ovDFSJ3lw6ITjU8H2H2lz7SmOlVqbi/EqCwr5lt4Qc
         PLgR3lOVEYh6TUu4BxM//lN1HEdg5Nzdlg2aWUgzIleiOyWjK4fgzsKA7QtNC3IcHAWv
         oWTpde2r/eGoHbKBdrFUBs42MmzRLLZK9QMKUfLwCX5wL18Mp1+UZdcS8Y/fGfoSj+YO
         IILC3HBAJoeU9Sy7xmR5Mte4HbYLKZ/XKdYF5SZt3gNtoeauA1Lwtu0uJfH9iWIH2dm3
         FJcg==
X-Gm-Message-State: AOJu0YzcjUfuxtF26Bu6vI4x8gcZm2EYw+ySrldecK4sUBho9lP6C0/R
	Q4MQ2uSMeHlcZIHUj335cuZ+oPRGBTIp6l8A8fHFvC9EC3cIWIS9iVdthvdTcwJiTZ9iCUfWOsv
	xMbreH7NZoDrtGnDlNAF3ERBFas7NWUfbiliWReNfiB08T0CGXAxDEiOjL4oc+DhtZ/lk
X-Gm-Gg: Acq92OFJXn+k5n5UOkeZt551dN3s8mCYTmVLlegTETerj05vlqZ2y230ZUvcSBqWDyD
	FR8N9ss1Z6B/0pSCQU9z5paePJikEkyN6OJPoQjb66ABOy1rgMMCLxMnkASqiFMoOVFNQ2zKsO6
	RkIpeZtRvUvXC3TqHtOhfdyPvKGEn7GD3TFD60BbSTYj21MwPrXmhNhCQkUvLNqPW42ecH6dmvO
	PatdDHvJvbQrNT1775V5jIEVpt8j516UeRpKBdq7ayTq0TTx5wyM3IbssE4gojptcbT6GOSVrfm
	XCc7PxL/e7H8x9InSasEYMrfliiJtgOIUyQ/V5NCracXHQ5OHkWF0DEwTtf4zCBDnixKwQnNr2t
	mgfkQjOEk672oa/UQBnTWt5V0IzGxrjfN1JHDv7jYd4CUD6DPJpvMi0vYy6kAiA+i4U2QLz+tfm
	kSXcfGD9h05ZpsLba4+mqzFg==
X-Received: by 2002:a17:902:cf0b:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c1ec932816mr163730335ad.30.1780993880019;
        Tue, 09 Jun 2026 01:31:20 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c1ec932816mr163729965ad.30.1780993879458;
        Tue, 09 Jun 2026 01:31:19 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm196112495ad.32.2026.06.09.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:31:19 -0700 (PDT)
Message-ID: <daa47ea3-1a80-4f95-adf4-f41eaf2bb1ab@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:31:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for
 UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OCBTYWx0ZWRfX36d3hN+lyuRe
 EhRGmGHf/rmfWOecxm9/ybEaexq9bpqsmhzCznPeQzX1mtCkmgSZy16TgrzPM/0coGXuhSuS41J
 7Ke7Cs5Osvq/FiXOV0jHwAxn732gNBhH8M5oPwcST7y1x0dbuwLMD1OvXqV5XznsoWCPPIvqZzL
 6bzLEuT0IsrszQV54ZSvZMOp1nzkbgc9uTLBtoqmwKwrP052dDo+PX93tWDaF5kJe0TuhzGme3+
 7gMor3BERvtWoFcuc6zxmWcQrHOu+Fabf9oAbVulfla/e+AC3QnCEBlw3fEaolrS5VpVjsFuWZL
 BdB7UdpI3Jg2vJfF1sJ+H2BMQOuoXyyvIk7rPjx6vCdldx2RrDK9/2CIIMi/f3nM5s2fdGR6CpW
 m0Wx+aBddAFtCLj8KuJnT8nzLA7K+Hk1nktmJobcvwoMkKpGrdWtdlmOXBnGf8erYGuSJnkf9eZ
 qxUUeR0ZgUWUARIFyRA==
X-Proofpoint-ORIG-GUID: qkrEztVp7-LJOO_9XHAS4rbvrt70t9VA
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27cf58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bcY_RnAor8WR6QYpvxoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qkrEztVp7-LJOO_9XHAS4rbvrt70t9VA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112061-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:ulf.hansson@linaro.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:jsodhapa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C88665DDC8



On 6/9/2026 3:35 PM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 

Please add Fixes tag for a fix patch.

> Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>

why is there a signed-off-by tag? Does it belong to the original 
author's tag? If yes, why you are the author of the posted patch.

Thanks,
Jie

> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++--
>   arch/arm64/boot/dts/qcom/talos-evk.dts      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> index 294354c034c3..f70823b31391 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -195,8 +195,8 @@ vreg_l1a: ldo1 {
>   
>   		vreg_l2a: ldo2 {
>   			regulator-name = "vreg_l2a";
> -			regulator-min-microvolt = <1650000>;
> -			regulator-max-microvolt = <3100000>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>   			regulator-allow-set-load;
>   			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index b7f514fbc7b2..9ed48765ae6e 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -189,7 +189,7 @@ &sdhc_2 {
>   	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>   
>   	vmmc-supply = <&vreg_l10a>;
> -	vqmmc-supply = <&vreg_s4a>;
> +	vqmmc-supply = <&vreg_l2a>;
>   
>   	status = "okay";
>   };


