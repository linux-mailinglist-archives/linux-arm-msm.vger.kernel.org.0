Return-Path: <linux-arm-msm+bounces-113531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MU2/NnFyMmp10AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:09:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5696984E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:09:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TzyDBHuG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YvnwrA6w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2782E3141EF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B023D3001;
	Wed, 17 Jun 2026 10:05:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC63D6470
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:05:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690725; cv=none; b=pGArjPuZJXDGVi1YbVP7uXUH7/XGpmo67MmTFXWXv28SaVnpRoLak2Bi1r+5uSurmMJQSH3Z/kG+fBuqYXaRqKRJgtIbfH+S1nfvbPV5UBWAEp2+gf0msqBxIG/VnMxef+NyGJpd2+8wFIY1LRaJu0o6WMJ2Qcofr24Sj+Jimf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690725; c=relaxed/simple;
	bh=5TxvZppIuVK4IbjAthVhCxutkqy3HZ+yhexbIYSVtPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPTeiRaIOtt3f1mAEI3ab3ejeOSt8fC50nKpbxyLGzkw0dup3r2DSBZCuP9opluRglBdA7EHJ+rNrKL4VLxoKMr36gsAIYIz54Z58zme8Xf3X1tF6W5MUrZGqFmrIDMuNplEoDBapN1CMprgJ6TqdCMcEwWwQiOWAsJQRd7xV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzyDBHuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvnwrA6w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ui342219929
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=; b=TzyDBHuGE0f1IEdm
	9V9NIeNbNQDb/0iqMZTyuniZC+ryNCgg1zPpFpCJCj/bTaVZhjC4IJAratuOuCJy
	ku9yMUEKH0bBi/jozOQUqItvOty3CIJwa7uxyN0UIe06CDzjCtkTI5pRk0WS7bOh
	ZfpvcKAaFXyPIKVs01ZjzNfp3HnlNGV9Aw7fGKr0a8Grg9L8gnmI9BWsI22e1JmD
	aScaO19J7tLldH4liU1GeFxHsgqws5ZV8ODpQJoGDSHZcUdKn/cbF5oH6PZaXh2T
	aP+BNQ8KBtOi7TpFmNeB9S/amPwszcJaSd1aKJdKAvdezqlkagqgaeBMc+6gYrMU
	kvHVRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerakt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:05:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517741bcc53so13614731cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781690712; x=1782295512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=YvnwrA6wN0QbP1JS6MwoZKMlQMqcuJWg9yQxBiHoeooMle6T2HRAQc37SVauKe5iG9
         0RoPpQ1ubXcnYUYEQuOn/KX4etcMD0WOoUQfn5rF4rs+4HKJsopRNIN3VT8mVpzEe4HT
         BkN5xBujcut5smLgsHqwfznYOglfnWAlbUnzNaSBkVEOwmMYW/r11whYxj5kZGbHNRuS
         nMe+PVvajju9XGjW6D1s5vyHNJuSJw4e50kn5GkFNChfngQK8r7CVV0eE0SJBYg5coGI
         mZ0pFgf/5HSIoXAMv3ua1IFEV38k/CKJTXbWTHUPQqjlIVx8MwMREt5dOfmSYcSkBw8K
         NGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690712; x=1782295512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=iIgXb8OX13N8bmnGvr4B2N5kgwx0HRJvaXYkx/AYOlquH8VqWISJgI214Ox+sD0326
         7YM975Djnf0otqboM+10Yk1U3o0PLvAu7POaDb38rYQ6V4L5cXTAZ/+N9nvC9PfEvmMY
         hMi6O1dj4wd7n5/7rHLBfK8ZXN07Pa7BZswghcuO7fnEqdtPmysqclduiS0Ws3fcT0D8
         zLhBxhiksgVTBzdD48wIDYf6QaRRF9prCJ7xTN7L9Bnq+UhI88k+shS8xVu2iWiBi8yI
         dNyyQa4FJ/7gcJ31xGUrMnk9c751Xx81hv6YrlcCt6FlcNRjwXOsrRdUbgYPykDePYRa
         KOSg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ev1NF5VkBH6ZyY+krNv4mi7FVuVc+3MYi1T2LUafuhiuqQSOS3Krzj/ppKNYsm/K1NfLkXqyoL7cLi5Zz@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYXpz288AKeHQEorETeUy20EUNG1mvNSTAKHyv84o5A3BZK5k
	QkwAwkyS5wcjMh+ERBC/r2aFnwteBIK0OcML6Hw2pvvJ5KJrkLlSbTQgaOmz/CbsvDTuvhvr5kL
	0oDsRaZXqaW73jMbdw3WC753qLeLpOZXUR0q0MbVcAIpFfNv8l28ja10nIzvGxv2cmkai
X-Gm-Gg: Acq92OFuChdEtqj8B86xoW3xBp/6aLEHHXXXRq3FaftUYmgJAdssCGneoQ+SRupDHJN
	+mbpUefKa3BsB9BJzwjsVmBx8EcYF6Vn/C5VVzKK/bv3ZqwVz6aXZKlRpD6iEdPFHQlV2gB/s1S
	E7HFn85LmH13xo809eltN1DKCpHhHHqE8H6uxz0oETusD0ATmwlbu3Jei9A3pT16kFkf0cWLDnv
	w6Vdr/yfiefqR61cVOutJYUdVnXvU9hwTcy7eY2HRby7FTKpKMEQB/zsp2taZYfuZhS+4zYTOG3
	KV7jv95DJXRmFAEmWh5IQfLshpfoUtypkiFFkvDyy7JbQZqidE9Kh+MFmXNyhtkaUl0RVYfnpRm
	/EVr+loJi0mMNkehfuKn8ICWTEAaMprUJnCc=
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095931cf.5.1781690712300;
        Wed, 17 Jun 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095711cf.5.1781690711861;
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm484557866b.5.2026.06.17.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Message-ID: <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfXw7FfP4x0STrT
 K5iMMoyjC+07IkRAgsjV7nuvtyLUgXQ+0OX4vwAV+xEY3Rc8s6ooYcM3aCfPINKcJiEvHg2+Z39
 hCxT9O+wBybf14q+wC+0pwSCSwun4fY=
X-Proofpoint-GUID: aCT6wWamtbPe2Ye-L8WlGMbfUsD9iZhN
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a32715f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UVdh9-GTA9LMwvOUMncA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfX00tDGBHcv3LS
 XElpCoxMOpHqS1ljfJJ8MM7zCBxWJKMor1BRirMArw/y1SppbB9UhfqkEqMHacjTNjgyf1+/ZGf
 juV9Gs+AGIdYG0SZD0eWhZvzE4dubEWRb1DOWAMwm26tM2gGH+xV6rdG4uvZb/PwaLPK5nZUXTW
 FJFYptG2obYr6Mdqxi7mwmoGwuNbzVTTnMCBSFtyZVQrOGJMxA0ES3hI85GXI4CDdLF87VSKDgg
 27sRlen5lXTAKfVTna9wb+Nz0MxcHHhlT4YfRdxKOi8SNbO7ZkEyYNDUkp5cvffkmtJMOWlknjJ
 E3WghvhDL/J9b9KC7woFeRkroE60xqf3iPN+4pjMKCXUArXY3Cd09sFtG/6uDoZrc4fq/QSxKWS
 5UJVBxAK6BF0oV4OvCfwNpVF22mUNcpD4+iRodki3kN0ExZV7MSDNcProvEwnoWr/Re2zU11TVK
 1KxNQw4c/t9ytnBl7hw==
X-Proofpoint-ORIG-GUID: aCT6wWamtbPe2Ye-L8WlGMbfUsD9iZhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113531-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E5696984E0

On 5/22/26 4:46 PM, Luca Weiss wrote:
> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
> and power-domains for the LPASS RX/TX/WSA/VA macros.
> 
> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
> equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
> deletion of power-domains properties then.
> 
> This follows previous commits moving Chrome-specific configuration to
> the correct file, leaving kodiak.dtsi for Elite and
> qcs6490-audioreach.dtsi for AudioReach.
> 
> No functional change intended. The clock-output-names property will now
> exist for both Chrome and AudioReach devices but this shouldn't have any
> relevant effect. And WSA macro clocks weren't added to Chrome because I
> don't believe this would've ever worked given it already referenced
> q6afecc and the nodes were originally added during AudioReach bringup.

I think it's better to keep them, if only to make sure that the result
of dtx_diff isn't outside the expectation of a commit that claims to
only reshuffle data for these platforms

It looks OK as-is for Elite and Audioreach platforms (for the record, I
checked rb3gen2 and FP5)

Konrad

