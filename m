Return-Path: <linux-arm-msm+bounces-89996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF79IZC6cGnwZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:37:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAC561B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E69D45E55A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBE5387348;
	Wed, 21 Jan 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdvjcH6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DICpKbCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37E3A7846
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994418; cv=none; b=BG4oBB7OMcmDKeZ2yiesCO7Sm08O/I0vkgEgI8AmLIpd0G2gZ0Rh13tmZa0lS4VA8v+PYfZpn6RQDLLgr06TaafQjbXyfk+1fioIma2zr8krLu4XWbds0mR+m/4AG9aULAsIl/XYRE2SLHVaZ7PXdVELNS/zwLBH0KfIBO+66+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994418; c=relaxed/simple;
	bh=Fe72888dx0logBUYzKY1nd2bksaj64WbdT4F2pmG5lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwDMmdW9ed/9i1qBqwB/fQFqfzhpnxzNDiWVTsXSe/JH4Rp2nSyg1GonNokE5w0Twk9mUDnLm/tnPx/qJ5CK1m42X9T6r/VXPLYu1t7k1ZN8MkUpClPU7ADQSR3ttrMSeTI9Iv82AV90VlJdVBRGm8wBaFOCqWx/2vkUcRhx0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdvjcH6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DICpKbCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8vFJD2946322
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/S/6rux+gV91qHACZNnJR3t0uoDPQWmbGPap1ljJsM=; b=LdvjcH6Ftv6af+oO
	8dvRlsl5A8eDpSs63narXOebFBEiTI4wfAIeD3djcMZZTR2F0geL/SQuym3pCg1p
	hR9di/ftZwSocAb6TsoMQm7qY5V4iWbCwIIxFVbHT1D6d/Y9gwGd6N9fFxzDDiUI
	wI98EyBmwmb1tx+odwKVVN22lFunHbce7Hp5SO8Ob21IOYtpjsU4wxWzNWpqnb+Z
	pxSdIydhVmrPif77+Z989RvD6a1k5pH6c4Zccq3BV8LWpYyFtFD1WasYCLmH+0/9
	iB190xjf28IWobf6J7KGg5GTakmI3CWhH4DfOb/bonl07d09X0A+lBi6iTmZMacH
	I3+akg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btur98qdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:20:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b137e066so82392585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768994414; x=1769599214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/S/6rux+gV91qHACZNnJR3t0uoDPQWmbGPap1ljJsM=;
        b=DICpKbCLOi3PmgYKgY+t1W2JIjMC6ljNfEYP32DsE+43wEQe5jauX2SZV1GfuGdEcL
         nCCTp41isTSLlIiAh7LXNjodJQwI9ypNlcus6KzC36sJzRb4G95S2AfDxQZHvSB8wlX5
         DXZ2JJvqm1KXGxhIHggq8FeKN2EexPe/EM5KzMmwW3Hcdwni9AcRBgfVgpQ88ClswmUt
         hsbLNtzbSdabmstrHrSZBNG94he9D50Hm2Aw5fQ0K1itHUeiopjqTlYjqfKseR51HDuI
         9qoaiWuNjprMdZ34WFjeS4ekCdv1eP9lKTN7wctpYyGhi5mbM3pbtN04cCskpu5qSG6O
         A7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768994414; x=1769599214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/S/6rux+gV91qHACZNnJR3t0uoDPQWmbGPap1ljJsM=;
        b=BdwRw+v8yZpsBUnI4xXZqHmSke93XsWevTwCkyUCoQ7yK8zRh/ivwIaLYlM4G0hQRb
         tRXS6Bspv0NVoNNa2k/QykLfrkwE1QA1nEIs5tOpwHQBlRKskJuYZvjQQZb9ln/xPECT
         GVm8IsD38rm6mi0FbAXaWwMoodCZiF2euxmjfStIJinTbJArImBYlmwhHDKHwiAm/yaG
         x29eHn4Lg+HndsRPZFaCEFlq3bm1SFNHQZr56ZoqZ0B0aJvp3GS2gcE1sMpMofJHHjN0
         S1MicHGQ1LJCo0Er9TVx0FfsAbWdjMaXuqdHZSMvA3+6HahRyzSVwe4CrPIt1hdIQbke
         7rAw==
X-Forwarded-Encrypted: i=1; AJvYcCV2EQ/Td8kt4KfQCyiyxTK7ni49+0cHbfroZ1kDHDx2WDWBizUrtup4FNzxFnU8QLXTF0quG/6umupcKtZD@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkbQ1vHrZEmH0pnZVitAez5xMTnK1w4GSZ0oJMWZ2460zyICF
	6Gs0bZyGnrGAiagu2TiAF+GQU0KC0eC0IbhcsgFMOler1m/Qoc8BLz3dZMn7xUFoz/bvCGI6a13
	ieLaX+Fl4E2ubkpbWbKeDSzAaw/RFfSsyRrbFwFmUDYnnfJIeSdcO3vruj2xhUHZJjEN4FiFtxl
	gr
X-Gm-Gg: AZuq6aK9aZIbDv+q18tI1KlcpUNfIn0t7eMR23MdJ3Kki0UAPoqjQKXanBcqLsTST1S
	zR4XQHpOXCq2rKATMxGdzBRkKmSQgWSHm2VlKrGEBMWdsQ/WtuFIJ4nXk+08i1bIniZmYkPezCT
	vZxAXWn8ufhyK5CsAAmufQTXC823ttGfaraA81UQXGXtZZz+m5lSmvhcAFo2fMJhM9xvNchbmuv
	SKDIzhsBMzXxNHZx5n8Q/meAZ1bkRRXT7c6wRKaz5L1O2Ri/CiQt2HyEffhcCYXrkew5mMU7hvp
	9VxYNuvf6DDvEEBTgDOKsGZY+A6ZKbhIHfz2CuOHTmvHh53rGfLejz0tL16WQFnR28LtIgJGPdM
	wZNZdlAGwPNyfo1kF8bXS/NF2fuYMGGrHQ8O1TJxwLxGhEeQWCwT0G+FeNouD3CYfSY4=
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr1841670185a.6.1768994413957;
        Wed, 21 Jan 2026 03:20:13 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr1841667285a.6.1768994413432;
        Wed, 21 Jan 2026 03:20:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658029e060asm2899097a12.21.2026.01.21.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:20:12 -0800 (PST)
Message-ID: <c706c227-6f3c-42a5-95bd-9ac739d2fa16@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:20:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Nikita Travkin <nikita@trvn.ru>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260120234029.419825-2-val@packett.cool>
 <20260120234029.419825-10-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120234029.419825-10-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xHi6ORKw1zjncQth-7cP1FDiU7zgFU6m
X-Proofpoint-ORIG-GUID: xHi6ORKw1zjncQth-7cP1FDiU7zgFU6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NCBTYWx0ZWRfX/s+mGp2upIJA
 PwWLa+q4PjW4Y+8VH3VU5hnJlLVSXAl9989vH9xJu+IxjHjus+zsbRFhh7U8mYwfnYxxEcsLZuz
 DbvpHUqSgN9V2V8nwS4HsfRKQiE1zLRG1E1o7+M82b1gjBHuzRJJdzIcZRC9mTRz7ZeD255+/J0
 ru3t3PPTXxyYptB5UgEPjH1BGLzaCdaZwTmWIw3nA83ghhi3Xem4YZss0ACa2Y0ih9nBNpj4V3m
 8tYRto/oEe0Of8/W8itIekXPwR6fXLn2kVWYqQqRUEe88OIkIT4KWRBXQBkZuRb4Y3WBKH2G0Fb
 3JtAJiyHNPgwRNCK284ohonH9iRWJjOpSvEFWNmsFJiPQ9l7FUDpns6Z/WrEFObT9ctefE7hbWU
 Y01uHoesZLV9DcFwD4Iu2XOc5jCDncE7yjjZI1lsbSgETL2rU0ky8FgAfXDIGCLzJC1gkJWeVHn
 RruexqQXeXcSbn7GJkw==
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=6970b66f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8Jorsjt-1VLPBPjQKnoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210094
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89996-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBBAC561B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 12:30 AM, Val Packett wrote:
> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
> 
> Working:
> - Wi-Fi (wcn3990 hw1.0)
> - Bluetooth
> - USB Type-A (USB3 and USB2)
> - Ethernet (over USB2)
> - HDMI Display
> - eMMC
> - SDHC (microSD slot)
> 
> Not included:
> - HDMI Audio
> - EC (IT8987)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]
> +&tlmm {
> +	/*
> +	 * The TZ seem to protect those because some boards can have
> +	 * fingerprint sensor connected to this range. Not connected
> +	 * on this board
> +	 */
> +	gpio-reserved-ranges = <58 5>;

Would it still work with <59 4>? 58 seems to not be related to a QUP,
rather as an audio MCLK output (would that be why +Nikita couldn't get
some sort of audio working on his aspire1? That DT has it reserved too)

[...]

> +		data-pins {
> +			pins = "sdc1_data";
> +			drive-strength = <2>;
> +			bias-pull-up;

here you do:

drive-strength
bias-

[...]

> +	sdc2_default: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};

here you do the inverse

(the former is preferred/more common)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


