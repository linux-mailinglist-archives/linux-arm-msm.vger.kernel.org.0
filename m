Return-Path: <linux-arm-msm+bounces-116319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7309GOu7R2qdeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01555702FA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AN60XDbp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kRMUoTfI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116319-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116319-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0477B308948B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83833D9030;
	Fri,  3 Jul 2026 13:31:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402313D75C6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:31:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085493; cv=none; b=pxiOoFGEfnlzlibmOgWvnQR6LN8cj123exUSa9vKMUPdj8aLpehx2ytoOCHodvmCRKULG6zNO6of/blymfpWYiTlzllFHN/WiKnyXhVqn6Al2FbLOkTK9DCqVtpS9cVMhM74f+43SD1IAs7PoMkvHW/3GmJWEkyHibitqfeew1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085493; c=relaxed/simple;
	bh=vAT1lNSIa/PrMnhwIJYzBDd3jyA6FVn2AwWFXgDKoMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFPO9k/vL94ntBUlSYescLqAiTi+jlx4NWlINmZRaYY5CtgdDs6MC6oAIsut84s+XY0PUDAwCuvw8q3ChB4r622bxvdXZGWd5wijRCLqXgPjSg83rUvGWek6EzirSaq7pqcndJBLpf3B+PpfUjspQ1MfHG24Atw0sQvtzgrkFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN60XDbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRMUoTfI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BrNFs4091822
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=; b=AN60XDbpjhkXSQzi
	ujOiH8Ua/axnEYIpjmylkBhFMJs10MVOJgfpAsvW26HxIm0q6exCqcCbeTQfJjuJ
	KCY5q/6Ws7IUFevmP6oM9a/1widCprfM16S1Dqk0Y2H+ffhz9EcbbsUG49oXVjTI
	LuqxFol3o5PHGoCIT/IhLFXwMr96Xyv/8s/DKfC6iWurEMri9dbmUMKLGNMU5krp
	y2HHYTJqAlKK+E4CT/Xs+ULZIsJTevsDFGo7EFrzeh5X3/wzOleysBgUSej0AJuN
	sMbXT0rckSFjD2u9h8UFrrokXch72TLy24//2PlAPWwgFhtPrdpAP+dyiOeuJvte
	fzDvyg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj0b7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:31:31 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e5fb37ac4bso56844a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783085490; x=1783690290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=kRMUoTfI+wXHofkIYYSOsIIfsmwicfOPmAg8SlK7FjYsOpiaBZyyZo2nPGeUA0d8vu
         4PCFxwSplDbE4tLICzTpOhG0+Ef10nY0UdibCZK9siBGyVro/2KzTB9k31y5HVCdBFx5
         098NBPPSgOwSUw3wuqnAaQKLF4jWQSr19XtpmuZMwqyteIgrwT/DiNm+NuKZuVlATXq7
         s2VkJDDxMF0PZBIlrgY8yfHFJktEutP0/CVqu7Do375QsZblD09AJRjGDpow7k4sTBqx
         4BdxUKPqxJ0lwqDEhR45RIfSJDrxZpTNh5eJF6O1kVw4/jLR6CCD082h0eQFv1KMdYE6
         Auyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085490; x=1783690290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=WxdZirtCEpzqibLWK5k2C0uSecOACa1fL4ScdlHAy0NZita8iNxV3+YitxB+J53tNo
         Ov+dbYu54ZqKpUjKjuVcqlW4TetQZHE30g7EL1/U6gAa/vWqjsc/Ln2EsuYeGEEjBmPq
         XQ2mPtG6Y+7Fs2o6nnpEJRP9aJuowo1TgWvHKtnnjQ1bdNXBWGYlBsVLYt3WFIZUSzKN
         9zXzJ5rvh8UImVl2ITArbFH4t08tFC6XhyqAfVtFm+fkOkZag8nHE8h3Ji5vLJqaNB9D
         ab7h9NijuFAgTMHKlWsUAuTND4bQUGXeI6/4oOz7Z9DNquxtw8iD1k+O2VV4Y0Z5BpTm
         T4eQ==
X-Gm-Message-State: AOJu0YzEVX95VG/K7+rIAGIp6Jfk3jokVaaHCJEr8z9y7EJMyDgGe5gj
	znwLI5Ws5q5USWPqdIwGKePylbZ9+taU2Y/AcGGM8Ni/GN5EnWr8tz8OHfUNLqxkI7r6TADHqPp
	S9XlGc64hhg/9FtnTIvvBe+t5K+mvRxo4kGYR0ABWGf2g2sAM7agvkXKho+1fJ7I7Bvmy
X-Gm-Gg: AfdE7ckwLQEaOY71KF6FQytngIF8UzycfhS9ZZNwkObyJyCjNw3A+WpVQ4LiPiS4Pom
	cj3axGLMCSJT2XtquIoTPeTsnTpcG7Yw0sLUlFLzZxDQU6qLl7rnW9NRn9SxZZNA9BspV7e2nCj
	OBjkMDQtevmUkmXmhIN9vBcQHogD/TjZ2c6aHa45obn8CE99GkpZkoKGMZNoglHBxgeI3Ig4TYI
	NpFBVecs4r7QWKdIfmfxKk0yz/6scbaUvhOCGnF8W7nF6UPNoC7okFy15b5urxdzcWXKYwvq55e
	ulRpRDbOSuAO354vheckwJqNVMgSHVx9zCET55+lLu7msWawsZA4n731JOsDMFfrH7gTb3efNVn
	QSv78jbw8EvMQbtcjhcNc5KsCzAq9VJvVEqs=
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643675a34.4.1783085490472;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643659a34.4.1783085490043;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c134sm277001666b.36.2026.07.03.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:31:29 -0700 (PDT)
Message-ID: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX+tE5yPnHhES5
 ZWXwU2sGUiph8phGZDFtk/hVmoc5nfRlK3ZR65J9PUeTD9YHqfS0F37ZTK1tPGldzAC01q24ONu
 Ek3FoNdTaW11rAQ5JbGEt+CW2nljuI4=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47b9b3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=h45PUBSeg-F0hSU9p9MA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: qHdgnezBTh4oAdah_MJ1dvhayh-okjoY
X-Proofpoint-GUID: qHdgnezBTh4oAdah_MJ1dvhayh-okjoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX3t8uAMXTY7Ny
 UVAakJGzZwroJ5nt5NpXtZm+y81WkBqSibk0JIDnyYunynbuCZjOHyfQQQToUDkD5TbZ3v4N6YY
 Mcpub5nOyzRTB6s1BCIO31xZg6DPhcWQMDIiawp8oYPPYdPPak9WonHR76VFGM7FbJ+fal8qjRP
 /hxE3cHmB4mY5ZuFavcFfNQ8RImfLgOXplB6453xcoqacOnbBqvUuk1zydA232EdKGuIXp8mN8a
 SBQNLq5kwXFBUTolRFkUKznJKldyoTkppOR9xL784wzeCf4eKfEoIXw0Y59n7FRGSAbmVekoCsG
 FJmx3lrCisgJprYyBIN6e/9c4w6Q1SFEflz63OFbDaT0BysIHG7ApoJbX18b3rf+brdkOYtWGj+
 jq45H7we2GGnjVhe6TUaDgjNQRKLTHrJm3R89/5KgeiiPZTbx+XK9S8sWl5dZBDzFtWzpy1juRi
 1xhhIYm51+xHW7KZgDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116319-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,igalia.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01555702FA3

On 7/3/26 9:59 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

hello, mainly just style nits

> +		rmtfs_mem: memory@f4f01000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf4f01000 0 0x200000>;

0 -> 0x0 (also in all similar cases)

[...]


> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_vol_up_default>, <&hall_sensor_default>;

property-n
property-names

[...]

> +&apps_rsc {
> +	pm6150-rpmh-regulators {
> +		compatible = "qcom,pm6150-rpmh-regulators";
> +		qcom,pmic-id = "a";

have vou verified your reg settings? incorrect ones may lead to
hw damage

[...]


> +&pm6150_pon {
> +	/* LinuxLoader fastboot implementation has most of it's commands removed
> +	 * by Samsung, making it useless. So reboot to Odin download mode instead.
> +	 */

/*
 * foo
 */


> +	mode-bootloader = <0x15>;
> +};
> +
> +&pm6150_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

let's keep an \n before 'status'

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <59 4>;

Do we know what they're connected to? If so, please add a comment, like
in glymur-crd.dtsi

[...]

> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";

Does super-speed not work (if you also remove the qcom,select... above)?

Konrad

