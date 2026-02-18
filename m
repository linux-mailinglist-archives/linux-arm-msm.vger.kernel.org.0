Return-Path: <linux-arm-msm+bounces-93256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGjdFvOWlWk1SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:39:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E61558CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C813024978
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF06D15C14F;
	Wed, 18 Feb 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="by5wXyGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krexp60q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32832989B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410665; cv=none; b=rqSMbGHI5gmKSWJRotPNQilemCQTrKiVcjb/nqluNKhwoxp1OA6Cg3kz39hHiB9J4Ilb3dtCLK+D6epF+OhUfd9SB5/XKXUC94+e6iVpaG70vcegjCLbIIgs3c7FaSdDkcCvS4zmlPvSahOvl3ipTY1wgTvjoEfmTxRoTfCptss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410665; c=relaxed/simple;
	bh=auC0xueomOl931O/vRZPwJNkFbOzIwy/JN2zSPgyKrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uI6t5uvyKFlk0VdSY8yUIWZjHRFJ1c9bdxW5Le61kCxlPAiR77hygeJcLr0Lst6Sk3YVOgGrN1JpKQKoP/lDuMh5Fj0qit8rAmJUEXgimAS3sb50oGi9O6deoKZfh2fS+YWLp2hnbybVB+5MHS0XN0Pix3n6wJkBuMi1aJcVl7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=by5wXyGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krexp60q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5KAuR422183
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=; b=by5wXyGDNLBs5+wO
	azx6ljfB4zNb/4aewMncPNuuJ8Gf6Bje2JmaJ36lTKUkI4pkc7I92cu8YrovLq59
	Bty4gWm2DP0Vmb3eJ6X3lLs0XeYA2H7OWnlCdVCFUyUMcROTuiyAX73oFqJjO2Z/
	I9XyoSEDkFj5wv8ALbKNxQBTQp77YJs7rhXNOfgeVZ2ub45wYTfxKrOjb0GTmPi3
	aPcLDDqKxKTWkvyCy9P16cX2Qfg5iN1bHclqlTXxMCQRBXpBoLBtB0sjB1ouQV6S
	w9tCzbuNjEWgLI4D1VSPHp79Rlamx4clml5b2QKii/21kUqhFjGpfaRPEuQRsAnn
	bhsJhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e0r5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:31:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so385818585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 02:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771410663; x=1772015463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=;
        b=krexp60qWw4iHcAC5EHET1j34dixokPauYNhUdIFzMu5/YiUhRVaKZxUv0okcYdtHM
         qN/ySwscEFcVK1AiuofTLV3U76I+24ZK6jn2RetZoJB6SGCVLDoTWG4aQ9wpeaxlT8pA
         WwpYbj1mT0Myl7QhZfY5A9FwitJnDLhdGWzr0wqXv8Mqfyhh2zWuvldIyjgmlme22Ujv
         SbNlkU2iwCW5BCSIJ1aS3Co8uATNWtTh9qolShLXlzi0mRe47i5Qztd3vv2LP1TmLt1T
         t4KiVx1l4YyrfpOegie1TalnIRRVDJaup66ANJI+mBXdoHNrMuBcas0+1A4D62YsViGZ
         yAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771410663; x=1772015463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=;
        b=RGWSg1y5l0O36j0MpdQFsPCwKeA0Ae2TjefVhoau7Smrv073e2mA3e1pQQFR6lbeIT
         cj8aiQMt76Wx6Q2sS7ka2QSVNbLU6OvH47DeO7VswfjCc9ShxvFM9fm9NHK8ALBEI7la
         gDIartztwSbIdxTIhCNgzprjWgxuerDceD7yIjUl0Nq4OicrAZ5TWAoDB2yd65NXdZht
         tWWVGM7Adj2FiWOTV1NjIB5Ck0Y+pHNBCYSagp5Qvm0iArH2POhgrJ2xaIUAAlQ/So+a
         LXzgrJWuX5HBNEDanuomtmd1f9UsQLKFGN+F2hNSNhaHvg5k3m+3h4zogk9NFxcnqGrR
         jUgg==
X-Gm-Message-State: AOJu0Yyg+z8aHkvpjAt2eA3nO5S82tGKnIM0b7JMEl4obH0ahBewrp2B
	qFxB5pW91tR0ugU2CccVmNNTTlZe0O3+ru6srC6zBn/0DDpF5J7tWwCV7d/aDUv8f8I7xvieEYN
	VRvUi1BwfOdkuLhyVsoixe34Aky8iwlj7KCMnwnITI2jE4vweM2X2g8gj+6givwWUB91q
X-Gm-Gg: AZuq6aJVX1/5dVwjqNk3g0HDjIJ/bV2CDJhtxpETp5xvNMV/zxCqwVxBm8aXew05A38
	LFyJDYuIZUEF9UkV7rS/o1fvyMEn1V2bezDM8iyuT1l5Bx0tfaAo83CHFcJWspOQJORFYpQSIiE
	+GaUV2wvGjga5LTaNYhUibf/i14PyysZVpwAam0c4UPikXxerqZZm/92mpWcVtCH2hZMY4r+ean
	wKjbaM/YCwCuo+89irqD0rNr8Vq2iPWXBf9gA68zFT+1Os85fj/OCHCtSMwQVY07L2WPtF/8Xy6
	dqi3nRJlVmtyqoq+hUEY0CrxEzdXMCabMOiAEpVGa8czpbIs7NEi32kYW8hEaYDoCntKRzMypip
	OkAXEeF0iWXAVzYrQ8w1EVQQFZR3dx25KmTQuuQggYx+iRF3XgBrVhXEaCktgi4+pdonXkIsu98
	mMxUs=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1548290085a.7.1771410663114;
        Wed, 18 Feb 2026 02:31:03 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1548288485a.7.1771410662668;
        Wed, 18 Feb 2026 02:31:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm446322266b.30.2026.02.18.02.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:31:01 -0800 (PST)
Message-ID: <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=699594e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=SvsOOShjqf7P06K1ulcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5MyBTYWx0ZWRfXwNDlg3e/kno9
 CsESAqrk3R1qIW24IQ7mNWABuC2vNdZN6Kah2bTqSVgi1A/mpzflTbX5BEUixftVgctE3yoqS+l
 X3/w6IxJohRqRiFhDo5tDwxX/StrRC3Ezvl/mUYxRv+92x+1pw1RXnwiSwAkcDvc/qoeHNSSocW
 fpKYrtNY6ny1yhSXRX4d5SuW9PycnjFI4huc+6Qv7HtE0ouWjECyaQx0p899Ym27d8m9rjEB+Eh
 CUcbaAy9pF7q61+UA+hDb8I2FHPmgZmFx93jAWIJXCWfEGGyUcXDzVg66MlF+C4RtKWcPdN+6xh
 3scHTw31sR8Bcl3vrp8hFekwPEfnYbOo8OF8lg0TuDuaD1qlVbqSt/+0XatqS5sRSJOKi4tCgUz
 nlJJAfeYEGylYd+tyoWIQOKEWRribEzdcSFr+QsuV464d+OfYKevChm/mZRXkNP6SwNHp13ESWN
 81dtdeG+rQnQ0Q1bJEw==
X-Proofpoint-GUID: BKn1hcMnnS_PQ2ohBlfoO10Wt3KoSE6z
X-Proofpoint-ORIG-GUID: BKn1hcMnnS_PQ2ohBlfoO10Wt3KoSE6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93256-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ae00000:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B04E61558CA
X-Rspamd-Action: no action

On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.

This is not the relevant reset

You want MDSS_CORE_BCR @ 0xaf0_2000

Konrad

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bf2f9c04adba..75c192eddc57 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
>  			reg-names = "mdss";
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
> +			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> 

