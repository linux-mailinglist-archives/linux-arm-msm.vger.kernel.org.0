Return-Path: <linux-arm-msm+bounces-114937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdHZJho9Qmru2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D046D84FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:38:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SYtP6Ywf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cU+Ns3/l";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114937-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114937-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF0F303903B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C8A3F9294;
	Mon, 29 Jun 2026 09:33:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E213F9F5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:33:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725597; cv=none; b=BANDTBJw0JoQK9SNGFJ6ZNi4DDQaRrsjhsS8zz0Rqo18ns4X/88Be8m0KapaU+D8yCbx7nFzkzM6w0mkn1oS0hIHRkbLI7+BBKCVjgMZOylo19VGSKw/82HawaI7suSv0bq+QQUb8UWY3fhxcKU9Jrqe+k+UpA8rQCFWS77Rs+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725597; c=relaxed/simple;
	bh=IlpjCZRCdbVo7YPpGA1N3P03RLxx45CqmKYQek3qI2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC6cqIs8WvqmzfnkY+lc2B9HInRh8hHhqcSwGY0ttV+AP2EcM5eO6Kj8a83LJ42wwTv4/aiGpyfQERCLe9a+IgmFmJu9yhlSgIcXYoWdRNLBCu+BDi6J0O8GPG9kL2/EAOXCGwodGvDPWDgQ5dFx6T4oFSvWqSInMaaMljYEL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYtP6Ywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cU+Ns3/l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rU3U2115993
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=; b=SYtP6YwfzpxMokjB
	+1TYOaUWRBGQoqltDuhXiJsa2qKmnd/RueKNdBNMcQ9KL8LtyWQIbD/KrGHH4TzY
	cKQVjK11ysFgz5FGwEze6LKun7RNJAiEIGfK3QEFhO6WEfw/UPZQlL/RVG9HBN8r
	TPnEhakvSg0edhj50HkWjI0KDP/gta5NJMY0NLCToIBMVLl7XG8eRjm90PYBoVgH
	RAczWZl5lCqouVQI92cgcTVf3ovClpTKsVmCrbjiD+PUWYtONtVOE7WQ8X/rOW83
	MZR7Vi3LG4XbgQQFhcRVSBN9Ej/sen+S446AZTHR6R2jBSHVeegAsaSBLOeTRUZo
	TDFoxw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dtv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:33:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73761f92dd1so43705137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725591; x=1783330391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=;
        b=cU+Ns3/lxu48zs6tcDSp4zbc+7NvUGwabxxa6urJKvl3yi4mPs+rAW/fgnsCMwmA7Z
         fdEy/HvitfcqdjaV4NNiLEOV6pZjUvOLMJNX9cogMontN4PI5slhT0+kuUI0qwVqt8r0
         hrDxDCAxlu/crobt6EKPqkY58SqwxHUcahcedNL+M/cihlSi/vN+wJp+M+77XCkyg11L
         dxgvavb4vNMGk96lhfklc6HYt5mdfdAD7j/Qx6iA9a3jworOB6LIU4zHW5ZtKGha0oBH
         2dijWirJkuWJEf1S2jkf6CELTtrjkzyQpmckQUCLBcKf6R5fGi//Ky3+g5VbZEIwSc9f
         uZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725591; x=1783330391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=;
        b=q0YIZ6gV9bWAFDHDANA24CjPU2n1d1zTgd2hgEi+f/d9Hu5GXO5gMpTJZuOhSWhVo9
         KEZNtTc/j9oiPUWfsQkHfrI3hiLSX8WhjASY5qK+V+M9m4NJ9IdPG28BFEUVR2i+4PA8
         tk+YgTmdOUgEXRLmBsX/+CnDAjY9Yd75fbn6k5OXIEMTFlimJzJ+DSHQ+cxpFtj+slWs
         5LczHpZNQ9qaN4kQ74MOwiumWmebbKJWvIeHztat3cimAId1z0gJRRj4DoHh18JEA+Yq
         sJY9QwXrnTobwCuYTiz8yCfZZbC17Z/E8VZRJX5bDZLGketi7syRcMCscYOYhqkVZ35s
         b0gg==
X-Gm-Message-State: AOJu0Yx9c5BAVESritWnTitJzfiPKqldoOUp/UluRap9pZRc8AftLmKU
	NBxTwDDsW6CphLtxMgLGOlR2r0ha9Jpzwb//beMOwuvCRbj4SnPVPNXPyVDMKrffp4anv0rcPdR
	OS5OlVHJsn7/1zA4oMULHYppdFzatKyBmY/XglxJVbDK+lbwePXC2PmHnjt7Cb8uMJNGm
X-Gm-Gg: AfdE7cmmxNQPEMVEB91+XvVzGMqc2X7qgRtEOYd6FqeJPNbsH8qixoFzIAVTPaKCiAr
	YrghLNtyn3LYHPoiY8itdsASKBtjy0UsTD0HccSB3oU9ReuUJl1jSNxuZAAE4fp81d7v6qVpHnm
	rzUxrMBom6HvrX4yGe+/5gVkRFybdUZZzf/ncD+QHHFi5ysDP3pVVL2L7SgS71zAcf6zEOeCzIL
	IxqtnOmSVB2HSKoExZwBAbDLmKCqgV7ZZ0nL1wKbd0uNM1MBQmcpWjL7wZ2Zwlk8ggFbRVqqy3J
	XgntzeHfYvPDGCEkFxuYL8TjtEbZaclqvSkTLJHiqomyetOjcrcf/po/bsbzt3S8g1CIky/ybxk
	OmoIB9FsZxCO5hgIVSvMikZA9tw73yxK7z/I=
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr159433137.7.1782725591291;
        Mon, 29 Jun 2026 02:33:11 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr159426137.7.1782725590811;
        Mon, 29 Jun 2026 02:33:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ae59f1sm6605839a12.8.2026.06.29.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:33:09 -0700 (PDT)
Message-ID: <b652b6ef-9f37-4b1b-a590-864c78bb5c20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, valentin.manea@mrs.ro
References: <20260628172640.23167-1-mail@etehtsea.me>
 <20260628172640.23167-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628172640.23167-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JeJfbr33SzjZkKps704MBfD0LO5G4HNr
X-Proofpoint-ORIG-GUID: JeJfbr33SzjZkKps704MBfD0LO5G4HNr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfX+Ondj0xaAJwr
 z5emb2xtMlCDD6uMKtizcqzrS3jA4jzBvPfd5a9ESoEFbEowvjtDiUYcOAf6tzQt+RJHzZg4bl7
 XH2KOYqyJbeh1MIPdWoclsVNNiIoFUk=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a423bd7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4Qiz8VOyNOBCKGrP_ZoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfX3zQ7tq+0rZT+
 69sWA4M+oCk220AOkpcPnPDb/bkS4BScLYpp2BJsMQzwboZ7SCEJRgbgYbXdXKq0RXicIawqDUi
 2R5iBmI9NeQnNiWKIHR/muM4ZoHdMjmY/0utsTyusfC4cIVSQancc+ugIx4gVi32Vbxyf1p77MW
 4DNv9A+1UeUcVhFUmiUb6YRb8RklOWk1PYTkSuHytv0+K2H0LTXR3xW7DxGTvi6rbkb9ELFBSiI
 mBXR1EPwJj74G1b3dAKmdELma8EBN9J+8kq/etccK36+guBth0GT8v7eI9WghlA8xvkRa1y55Fl
 8yKG4/AU3ooRZegXxmk8nfgMnlzuJLIqsqgqSRVYEG/qdQw33LSPDLDwZf0bA3m7o2czeeXBLUt
 7MwhDphXjMaWUFCeM0VUvq7TAJkYWT4JivY6zMj90sf4Rgjn4SwLSQ/pzFFGiy18DvPoIN6jOZo
 DzV5ItnZIA+nSjsB8Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114937-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5D046D84FD

On 6/28/26 7:26 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";
> +
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcdxkmsuc8380.mbn";
> +	};
> +};

'gp'u < 'i2'c < 'ir'is

[...]

> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +  wcd_default: wcd-reset-n-active-state {

Seems like your editor played a trick on you here!

[...]

> +/* MP0 goes to the USB-A port (USB3) and FPC */
> +&usb_mp {
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";

https://lore.kernel.org/linux-arm-msm/5b3559ba-7c69-4418-a0a4-c5fa614830c4@oss.qualcomm.com/

I would assume that UEFI powers up all the PHYs - then, Linux
(effectively) doesn't know they exist, so they keep hogging power.

You can copy-paste the supplies from another laptop, as they are
dedicated to that usecase anyway

Konrad

