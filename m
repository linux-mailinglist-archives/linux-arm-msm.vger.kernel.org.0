Return-Path: <linux-arm-msm+bounces-118669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xk8QHE6ZVGphoAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:52:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C2748643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oxl7nkcm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bv74hf/q";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3455C300B5AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24AF396D28;
	Mon, 13 Jul 2026 07:52:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50F395D9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929159; cv=none; b=u1EeYYWZ3s//hIoPCZG40U3o5mocUUnrt3krfWW0bE3lulPXPLYPXOaxL4qnQgPJpuWVqvehdF67dikdDFphJN43nKWagOR980gv2aj45VPBWDUMo4zT/oE1ilaZ7IbRRRXJYdebrZ/zBnsZeYTeesoovX/a7Iy16l1n3ePOrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929159; c=relaxed/simple;
	bh=NpBVJ1ObbAHtpKXjNp7Ma+WB/fNqPGXMGPs4snuzUkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3GIb22WM46qBGIGAotSB91ZReyZh0bHZtmsw5J5tn7XpmvAQT4Osx2JGs4/vSTvyrUSA4HllyWuPc+tmn5GzF+SdekP5Nd8qyNBIZnLkBUW1gUfDWXzF5hbcgqN3yLBtXpZ8xtCOH0oPAh4oYM/B6XfjZR9Inm5MUTVFgpCwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxl7nkcm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv74hf/q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NfB9731614
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=; b=oxl7nkcmCHy5JSc8
	+m/E1g03HVa8CqIjCrqCHTyyDUWuDnm1wHEtUq3OVtdgmBpCnzHdx2m8ZqPaykaA
	ta1jahEGADCZ7PSnjx/rx8OXVVuqWgiSYgFGlnmmBfnlD/r9rFaRZwwNBCyB6+oV
	UYi8vldWlwosEccfCbmU+kE4nivTNYJQ7wSYltohnd8G+DkfBeKb4zgjnIAg373G
	unO2s2qkh0qCpM15rmj2T9F0h+Xufe4MxH3dwRNJLKDU/OxWiHWThm85E055Hv/y
	CGHTIycUIGuga3sGbviTAgIVKx/IwvakoNt61lNGSeAofly04xxMnFq7IXHRkYSI
	IP0l8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39gaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:52:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso6288101cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929154; x=1784533954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=;
        b=bv74hf/qvdzaaK7mgt+tm9jSuRPny/pmZkAnI6kuPulR/HTD6Cd+ki4iMg8/kXGs51
         G2N5PzlYZdIVQ3gsUXSkqVXibnhQu5k08AtO/9T56vhKtvg1W+YcgQLDRPghGkmzMPNs
         sFTffN9lGx+ljWxj2z2dQvDbc8gJgdhzyvyoq/La7cepnns+CqxbZ93eq6Se0uT9G9tG
         tsAmLpkIGU/HEAAPopKWLo3Zzce5pgEZarUHQrVvzZ669w60ZMx6jdRFSsAUsl29ChJ4
         pE1Ba2QS0F317vIpyWRZubb6nemW81+S1InLmEBiupmYQeY/4/lD8EMsXHxqcMnp+ukU
         X1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929154; x=1784533954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=;
        b=SaOurNNfbn9J9U/VyIjxQ6eeeT6n1QqqJk4qNMFc2TsSN7A3RFwQB4mhbmaIMIX8IB
         lasKFUM3rfmKNPJgsGh0P8scsEbxCUPcoAAqkVclBR7OMFyHJLE46U/trR6vwV+IS3QH
         HCrTjU9SdQ6hXuag5Hafb07+uwsM7OZ9ebw+Q0HyBEiNlnD1tSmTPPQ7x1rb8Yb/fAh5
         cjBM9yGoR2WGE7H+UDG9WGHJH1QfNe91ukmGfJkpnarDl49MCoupAMVvf1GTRkIYna66
         OzJsIHa8x0bhD+agd8t/w2jBtv0ZNw+1dkpyyYkx1f4bxtKBqgiaEX7krJcGnMzbgqNA
         8R0g==
X-Forwarded-Encrypted: i=1; AHgh+Rq2sHCtB1s2Di8Td0WzjwvtqHPdGMLSrGupgkOfvlMT4KzgZwGOMC2PZTZRAG8PWpcsYfxhOkfJDHD6Z+y7@vger.kernel.org
X-Gm-Message-State: AOJu0YxmniydlryJxuGVazg0Awbt/ZaVuCFbYtm69CbyNsueEnw2qf4r
	mftWAhbHytSmu2vJwhSq92BXfwX4oBcYxAQUacrDDDXxu7XVvIl4hqUPFps/0zTj3RyA0kU9Zjz
	hEESG2TiMZlB9HN89F/OTXzj9eMf6cwgLp9j34CDcBIds7Ab9uxc1hBfJb2JzwylJvAj/
X-Gm-Gg: AfdE7ckiAp/pvyRgUaKyzAn7tuqqaNnKvrMQs6GomCUf+KW8cz94JfqrB2qCXhH8eFu
	yV8wTBlwxrVfmajqjwY7TOM0ffoSxE7PQSvkKDc16ci5i+b6/6iRxuows+RXRsOzQkaJ0h4m0B7
	Mb05Z1FukNWzEaJpjU94n8E1D/FXCC9QMXol6+MSG9sf6jT+GkLpRIKBBBNlycqjBdBLiAcVkGn
	gUaYKnExHZ5zXiV0y+mi0xFfsqmOKYQ/GHPfHP/Fr0B5b4vPTxsJclMdtDTcVT82FX4xRVBIMq5
	tukOxqbSzXrmWr+FeOhXSr27mxVSA7D7IshnAaP6nF0wIyTtoJkfcSc8vf5IdtjzV2wITEOIJl/
	YQhnTOUIxjCBcjPZ7tr5MIMceTDccdgGgQJQ=
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr58881211cf.9.1783929153699;
        Mon, 13 Jul 2026 00:52:33 -0700 (PDT)
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr58881011cf.9.1783929153206;
        Mon, 13 Jul 2026 00:52:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm942161566b.5.2026.07.13.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:52:32 -0700 (PDT)
Message-ID: <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:52:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711184934.55701-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX5+4TsS5iy1rO
 PjSTpDEH4HrFpHMk7nerCtK9q5MANctulp+i9oPM4Djz5PC+Ic/z9qCyo7hi5RpWF37z3EREZ7r
 QoGnTumUctOCt32z2xiPbBW/45W3PjR6UaGVB47NA/teCuRDo7S7tJ0s2S0GJ+TmVIwgz76GME0
 vIn6NTPoINSxfsRfYMJ9TtiddcW/XphWO2qFU1LE+HKkt8bOQC1b1JaFC+PzVRX269wpguExK32
 H6/VzgPd3S6dvTeDuXOna/PUnKwWvo2e1s7ys5rXMnZz9u3I4u4IlWL+tu+3N1pDyXNil+yICeK
 9jj8BpuT4kVKkbCPWbxJLJ2vh2f5KFymS8Qk34e+BJ9SQ+lcAkE/S1f5wBa7Zl5iuNVF+Ym0p/I
 zUDaOMhKeo2QuAawmFav1WlblEsticCihbSfzybOqKYlcpYp8TRYHhWomS/OQr2jiTa7VCmfHj+
 v3bu06/6YFFO0jL+iJQ==
X-Proofpoint-ORIG-GUID: AxwUHab8B-YqmpN6v7JfvELtKYzNT-I7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX60U0L50i57XC
 xUD8lEnT0y4190UOeg+Q2QxubOKtd5hrq9ECVoX+CNW6wDGJ1+teaWVAYNM2deTcRfNnSm7rgTI
 sokbdKP4WKJuEb+ENnN1Rkxxg7otBzs=
X-Proofpoint-GUID: AxwUHab8B-YqmpN6v7JfvELtKYzNT-I7
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a549945 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=JiISQnV02i8F_HGE5KwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksiionchul@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 258C2748643

On 7/11/26 8:49 PM, Oleksii Onchul wrote:
> Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.
> 
> The supported hardware includes regulators, UFS, SD card, USB, GPU,
> remote processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal
> sensors and the hardware buttons.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Please use memory-region instead

[...]

> +		ramoops@a9000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xa9000000 0x0 0x200000>;
> +			pmsg-size = <0x200000>;
> +			mem-type = <0x02>;

Let's make mem-type decimal. Don't you need ecc-size for reliability?

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;

Many/all of these shouldn't be always on. This PMIC normally only
powers cameras, so dropping this should be fine

[...]

> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two fill be folded into the SoC DTSI soon

https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/


[...]

> +&tlmm {
> +	/*
> +	 * 32-33: SMB1394 (SPMI)
> +	 * 56-59: fingerprint reader (SPI)
> +	 */
> +	gpio-reserved-ranges = <32 2>, <48 4>, <56 4>;

What about the <48 4> range?

as a nit, other files place the comments inline with the ranges:

gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
                               <10 2>, /* OOB UART */
                               <44 4>; /* Security SPI (TPM) */


[...]

> +&usb_1 {
> +	/* USB 2.0 only */

Did you test that (with an actual USB3 cable)?

Konrad

