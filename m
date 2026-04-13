Return-Path: <linux-arm-msm+bounces-102897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIMdO8Os3GlfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7E3E93D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD6BC30191B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEFB3AC0C4;
	Mon, 13 Apr 2026 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTctrGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fo13N3h8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48753AB285
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069608; cv=none; b=VLCC/DN/hPCU3K6b2bfiLRAG33xLSN+aUaWFLRkHA4MKrxUxaAkb2hFxfGefoY2zZ6UGkdIdV/Ld0hWeJo4X5IX7hd5pMt0xVvVs+ntWPuheHdnB+YmrIKzG8TtC2LmNk4bM/+V+fXyrxFlp1DovuvGC92XFNHoNhMCFqwp1s+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069608; c=relaxed/simple;
	bh=DgO/mdro07DduzQOos3CDaqYUgHX8fPBAAE/vUl0MlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGIJIhizp/eHI0ynqjf38uS09VxqCGnJYEc3YE/hpwKDOtEMTv1GKYT8yaFKuj5P2eWPXrDyoGoLNDOHBa8J5l0dJe5qMKoHL23wzwFHdtV6WM0Rz2zR3SNbnwD0LVZupQODDyPFXBAN4qw7JrLOpEU6qEE7a8+mr7BTTNh3j2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTctrGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fo13N3h8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7jqsZ813162
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=; b=GTctrGjFdjF8mN2O
	1XfUBK1TXbJAlYrF9v/Wi2dZCHBl3GqGrQqdFrkcA2oCwGXVi4xGAn7dG49ElLYm
	r+n0MNjjl7nPRpxK54KmapYsgaOon938GPUBDWEmSJgTyXr1SIf+14afYQLn+5sp
	CzzAYw7sFBTS40wM9ej75XXJlxFK32VCiXaCxI1/BMYA9mJtaSeyQwDQ0Av9P+xj
	Z0qbKRH83Zx5Y83IOlH4me2jrNHvLbqk8uV091O4Fy5cxQtGLK7SnzwFAuiZICld
	TxDNpAMwnQnSuxaYeT1VxMsAI6vtw3KPi76NpXVweMKbb3WAygRL+Ywfj9VeJJYA
	EXtoEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04g91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:40:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd003bfe2so66061285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069605; x=1776674405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=fo13N3h8/OwhleGFUNQ0kVYJxDfrgLEfwly7G+gp/rMkFJKRf/aFmE5I1IJu52qBI+
         MJNKwnHqMqlBP9s7mhXDH/dvSCZWkzkxurRqjuV3wowBNnWvVhnF4aYuz2RzQw05jpTF
         c96EpsT3UGLldeWndMyGqoSkaumf706TR1DL+WDsLX6jERWb1Waa4ItpYDaObIMc1XI4
         55d386zmjXzFQ7EtwUcXSSdp9eVY4RxRtbbN1FVfxc5PDoHJinyCAJhJjqawwpvkaJWh
         Gg+uX77RpDmVhXJmn82RKp6vj5tpp5qFQKJ+jVPQV7iS0GJo7mxUZMfLgToHbDVJh3Xa
         L2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069605; x=1776674405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=J4+FV+c4SdgkzsItgq3g/jvqbTeW/XZvn1tfmnno/sAdJ8bOaGH+N6qHzQTNH5tO3x
         ZlMus4NusEFvJJ8vQCQ5ZwcZ3jp7URifHP2eCarlmb8TcPIxoRTy9yj49CUYtzUCatqB
         /isoDyayJuHmm4yUacXKmOS8j3ovBnKCvhxLBDaxLqYdUWo/hlBWzQls0CKgxyhk4sl2
         fdt5L80x241dT9edsplCX+EmgFWbQH6yD8YSu2+3R/lCXuOsHWkKB8HM48fn9k5igC6F
         u2feHj2p5rtSIgZp20tnmK3OjjVJ3pOo1SeWrYrKhWxKn+MwTG6qBzzqoWba5BhlW1Tq
         sFPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yWYoCnpys1Fn9BSjl//3Y/qP6od9zpesAWguwFdpkflfgm679knwc5nilu0ZMnxvKGDerCkNsoEFv/AZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YyEmqrXij0ik6MF+NFZcaxmfzhsYu9Ra4E8iNV6+Y3AkdZia/rn
	zfpRq+SMAqPGro/S1fyErIVVvO7Uq3LcPe+YLoyVWxKEnd9y/GLY8JNQr31BNkllL7G7ogztEnM
	qfxw30N6QsD4wMv2+w5JGmrhG13vU2liXXX/fNBwhZdydCvskDwSl10ExwAj5abIW4wwl
X-Gm-Gg: AeBDiev68Dku/ssxXnAORG8U6B3L6toBc8G9+9eXUoyCCll2B72SSzv5q+H1y8jPOFr
	Cp2yw3wblVDPvj6JMJoc5zoLLCFRdWDxasRmBn90h70rDPFiXPfirM1paPox+QPw1RYNOqGk73e
	2X7ukK7D72qeHct4Cmw88pFgzlZ17AAYAtyGgv49aga7kgPVE6/azXA6DbrGaUkk1sNbGgVaXnP
	0X2K9WBp5K0z6iApHWApbuiqNbZgWsYkq8TotNHndJ3dmxNchNBSwUXsT/iVtqfZOzwacJi9BkL
	rF1A4h9rCqqKlJ+SeciRnEvoT/+24lwXaz/BxK9ju9JDzdD9Xgw1Pm1oN4fG25s5slbkU6gcoVt
	662EdIN2Sg2GmOaFbkdM6QvWnNIlDcbgqSPr/SdevbmjHuJB4vIj+2xU4L1KRx+/dp6DjSnZbyT
	lRJIU=
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196528585a.5.1776069605153;
        Mon, 13 Apr 2026 01:40:05 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196526485a.5.1776069604710;
        Mon, 13 Apr 2026 01:40:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a5c6583bsm164932a12.31.2026.04.13.01.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:40:03 -0700 (PDT)
Message-ID: <786bd762-bb58-4ea6-9493-f89868ed80bb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:40:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfXx9cKVAGa7cJS
 K8KCJAbyjR2HsVkCJPITNc+iA1/CVuZ34+LSOyeBfAXt4CV1+4UWZ8RV3QWcuumdnfllEuuj4nw
 c6iBaBkMZP/KJDZtPx2NY7g8gp7o5LeVZ8RBK1F1Ocr2yMuhnr07vve9hlumIC73SgDfUVocfY/
 SXxXsz7phGml8HHbqpifWvhVh9ZSMMWyhn2hsBk2pbYwe0s4VFvoh/VcYpsRRuaAH0V+hg2ShMa
 AmatwFVdLAfnZVZSTK9rg2pbR7zn06I+juO2GLa0xxTD7czCdSTPzE3zhXI/z5oc/MDTw3C9a97
 3xM64P4v00m+KA9Y10KivP94jggjRXnhXV39NFIDCbUQYkJwtCY0KxS5+08P6gdWnaq+S8f+/Z8
 vBna41VCQP8t/OkHy/2Y+uhnKxhtVupkHf9gqbdQSlKKeXaYWlipUD5ZuMpGjjiaatfb1fWYICL
 lI3U4HkutHOcIfQyqiw==
X-Proofpoint-GUID: 5laDciMHr3Qz1TeFoAa0cbSXdjBwNU6x
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dcabe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ppaLKjd6v6Z26LEkUYwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5laDciMHr3Qz1TeFoAa0cbSXdjBwNU6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-102897-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,ixit.cz:email,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CC7E3E93D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).

Fancy. Some Sony phone had a dual-focal-length lens on the back,
which IIUC involved some pretty heavy engineering


> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +			camss_endpoint1: endpoint {

\n before child nodes, please


> @@ -459,6 +618,38 @@ &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	cam_front_avdd_default_pin: cam-avdd-default-pins {

I believe this may fail dtbs check

> +		pins = "gpio8";
> +		function = "gpio";
> +
> +		bias-disable;
> +		drive-strength = <2>;

Please don't add \n between these properties and align them in common order
(i.e. pins/func/drive-strength/bias), matching the rest of the file

Konrad


