Return-Path: <linux-arm-msm+bounces-109661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJpnJsJLFGpeMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:16:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9125CAF6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE12530059A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902C8383C84;
	Mon, 25 May 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGUebKqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q49zbmVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885F37F758
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715005; cv=none; b=sh1tty3MVjkumC4q+AtN6xjvW1xiD9S2gDizkFIrIwBHmua0O4HBr5KogUcjEyqhvZvDQdWVZPFZmgyl0vS1XKjfGukV9Pnlki9gx5F4eCEVdMruyYDlCFRi9CR8Hy5zcWRkp9q4BwTNuhUmc9cKAcVR3AIgTAL22C+qHM3pe0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715005; c=relaxed/simple;
	bh=S852ehqBfb0/5Ul5U+y7lcBRcWUwtf9wkT0ZuTEZgNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjMOEabGin/OXdoL8qFiWOOQP9U8BJzzgsWsO4sfD20ckwDgL6NLF2qjg57i7uREyvXkYXvQEIQe5TgkgBunzdSF8X2V4rCJy6xWhGXc3Xjw2NT1QuOOPr+dJL5WvNyE6XVev5YYVPM96UrVnpQgPm9UMjJWvtXpaX7wo9J3PqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGUebKqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q49zbmVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QOF03063427
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=; b=pGUebKqhpMtm76GN
	PkCzhsWW3B2/l2VJDFTjuneFWyarLhRaSyY8PP8GOiFzGcR8v7mn4M6SbCBDo6sX
	vvFrQ425kV/00V/BOLOLaZbqeObzbbm/xImzFRc+mECF1ygDNcvMh6Tpta2KLxsi
	BpWTVMQDHTJpDpmUSLvCJ3+InbnTMy9kWHP7ByoU3lkFFo0oWpik7kPmneIkIZnh
	xQrcpO+eysQcryLvMjnvKw46BEQ2MHiJcVy11s17VksXFOUKONQC/adETAtVKhpW
	p2opz1ulAE5ley0WGUObrVekuyuEYJA42q6doNi0TfAENVzwxAGLSNM3L35WZjq2
	oOY+mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gh7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:16:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b56f450aso82482185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715002; x=1780319802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=;
        b=Q49zbmVjjxplv6t6Yfm55bJgRLAeAzsCJqqb/MFQ8YJD0JFA5RzpdQDX169r4L0DUi
         lMTjAeWznlCyYZFqQicN4gPb2jUHPkDgAsw4j41Sqp7ll6GyXmPyAb3wqh0INWPnHvp3
         By5Dm8RjjTPhNb/5TUTWkk+FTHaA4r1aFTd/I7WmnSVWPm/Dqgy89+u+TPM4NL+z4kTV
         3k5vMO/+NkEahHpnt8ZxKyIbFncgyYSggXc5q4olr/iaZvWrB6SZt09qEF01a2cWd7XB
         hG5YOfFT0MQGdxJnlrJuXbQ6fJZE/zIJ+VjzzISrhZMuPfwFaCGW5iF2STxnFqw6MGe8
         5d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715002; x=1780319802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=;
        b=LZwRDmX5phJouyjzfP4VdVmukRDTRdOMVb1MhBsW9ilj70CWtqbK4LXHuLq1oKqtb5
         JsbsAwUC/mw0ESvqS7u/Y0Zofgb03uBZFYd6RcJOKX9NpuDZ8P9oht5mVzDVGfz/Nrqy
         4XxHLPz6WGuZG2uhd4KWwGR3mMSK5pqR+UZwTS+/GB4Jt8TiDMpZKReu2tKe+ETv0Pip
         15AR96EVN4UTUQJAxd3HUxH9NUbpGwm8+nDIGX4yLdM2akGxOQypKnA/QHITqD2A8nuA
         Qcfg7XozZE0i6rVtmb7JKA7a8o58PCpehEaNG/5jx18qdCchERUMk9dAjwme/W0qaFrj
         Orpg==
X-Gm-Message-State: AOJu0YzSIt4iu44Gw4h9Lv2DaChQcvfi12T53sAI8RJi2rehMdkOnF3N
	BZ/I9ngpFJ93j1zm7I/yxpKtosCMip7gIInHGyLer+8/rRtAjjfSX825hO7TmXt8R073/TjLJJC
	ABh0J1TkERasfrD/5QeiSWj9lo6nB7U0U32p90GTcS7adslLmCke2CEXblmheE545dwmR
X-Gm-Gg: Acq92OE3e0Z6PpEBYz+7hfJA/lnzbh90eYlEeOSQnM/nKcrnPWwgoc5OZkooVuVdest
	5LzrGf5RoUFEYNrOBXlCFBOdnir20qKGoKQf3y1LJ3RufHTkBTOqjtfF6tRqqSEM5uiU2sx7mjS
	jykd2yu4F18uMkSe7fJekohBm5zCHLpYvRZGPWOuzS+g6e/ae9xg6pH9hpONK90jNfeJ3AqMMwF
	840EGhIKTWuTCVC4hAld7R+FPy1XijKV2rfzhRgC7FY0hZj8FpahBVyGkeBsKwAr5ftgd8UW9M3
	MmmPpTG3gRCuJm8fhl6/5qim9sG/HX77u7xShSHVguxjHWYakvoJfyUEUPUzGW5wOvOHCZFcu66
	9CK747IIjz6Kav3L956/ZSFz5NJbwW/4Gn++JHyxPutYZvQ==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr1377839385a.6.1779715002362;
        Mon, 25 May 2026 06:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr1377837285a.6.1779715001935;
        Mon, 25 May 2026 06:16:41 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3903115a12.0.2026.05.25.06.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:16:40 -0700 (PDT)
Message-ID: <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PyDNK3seCyQQ9zzC9L3R8n8gvU0BxZyN
X-Proofpoint-GUID: PyDNK3seCyQQ9zzC9L3R8n8gvU0BxZyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX/Ylh60yp5ZZa
 rcZMsSHC4vsOFvx0aQcldOkhfJ4ih6StRxsv56OKRP4QdpsIRLDQgOPp+FCHXrYTZysSiKOOrF8
 ds80SOLfLuC3suQzZdE3NxHPguBVyDviqg8O4fzMb8+zuDWvNK2ZL6B4loXZRkgc5y5BqJVW7fY
 5FPBQP7DkdTl+Vb2g9K2lCH0ABqIH5FqQxIsDcwCj5fCjAypVSWwKRKUn9hYErBBaWQWt29kk6O
 DB3IpGgMT1NiSYaxXtSLUY5ao6zEBlaOgfuT71pupaXa7ZV00X8XfwhMf1URb+ED0hTqPfvyjhV
 gzTQ9q8wX5y8LjTHQ9Wf+gb/nEaobUqe6Y2C2IDvxo5S1JDKW/GJyz4ARzH4LRELEfWAF3E+dM9
 lsMIR9G9vR8rMW96fS4TyXX+vcwxhEu1lRiIaHJk0HhqfibHIJuG3XeLLFYAjPAJ05UCYEZ3txW
 qr9n4plLg1apxXmtd/g==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a144bbb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I9A3L-BP1q0m1wO2EfQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109661-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C9125CAF6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 8:02 PM, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> regulator definitions specific to this variant.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +/ {
> +	gpio-key {

This is usually 'gpio-keys', reglardless of the amount

> +		compatible = "gpio-keys";
> +		label = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;

property-n
property-names

in this order, please

[...]

> +&pm4125_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

A \n before 'status' is customary

> +};
> +
> +&pm8005_regulators {
> +	status = "disabled";
> +};

?

(also double \n below)

Konrad

