Return-Path: <linux-arm-msm+bounces-97888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHyvEFzVt2kwWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:03:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B832979B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73CDD302256C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A211346E57;
	Mon, 16 Mar 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grssDVon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY7Y7jru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D237BE6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654891; cv=none; b=nkEfe4uHylPfxxQ7VSwJrw6Jg7EpATsoepC/KwT6BU3OQlpmnk/I8z0LCyo0WA5gUgZHGxvzGlipDW690tdXeJCk4QAZvGK17siIBQYC5d82+VqAdqN7bFeKXJ28gAEKncktyaxVcA4/QER6IYiy1qdfVSdmXDM2Rt5u8S4lgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654891; c=relaxed/simple;
	bh=x36Pf7vElbRsW42CTmbTmfaBoVMvQ9EKr11WIULr0uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUIaTd4PxIa51QYHT2xsoRaVqykQ0IJcXC0eM1Z6F+oAGNP9YeFHV889htjplC6EOITchP4/PgFz6rKWf0kcQNGUmafNmCGH9l2kyEEMSOx0PzwwKJQmHRQ6lmQzUltoNU5c35xH4lrL7qtkqxauiifpTCmY70Iok2+4fXxmPxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grssDVon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY7Y7jru; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gcr2128555
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=; b=grssDVonOuuas069
	ZQMjYtOaqoe/WkYbmB9D7tRmyT4HO/U/RW7DU/BQn+7USUNYjPZIHZm1FT+NnJLV
	rtjkW8EScvGl/jjLfmB5ncJurIlSVWJjQnMR7mBkKYsYCdGgo2YJ1OCYfOnJEnr5
	BwXh8Rk1hxk7B8o6ayK6xdbwOqDGN6f6MuPuJobiWnBXGadfyeZ3vAERXDV1er9g
	3DILPs1h36HMoU0OtjKraQTn6lAuimzOdQnfvIaM+uoQCcEh51AjneNOK2tRV2H+
	TISprTVQbU9nPHYqeCd21svGUCRxpnKDFP3RpEe284DhJ5XP2VjTVUMxrXpQIYx9
	RfweLg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00an6gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:54:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a04e9d4faso35494686d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654889; x=1774259689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=;
        b=TY7Y7jru/XMvSPVvetWy1rnNRzsSQ48WBWp7kR24F59P5fcuoOQPyKWA6q11gR68RK
         3JbvA3qsZ7p8J9d1OF1z7vO/h3We5rioiLIcslAVfneEDpwBfITu06pHe667iZzXusmp
         TN4noMbM0DpmC1FHnQGHOIaatf16W0NLDkW8mTPIAVGX+lZ0Pmb6XaiBLxSjQUcvSnxZ
         xiZSjQ49vyunoJrhuN86G8tzI4luAev7J827YKPMkQj6RYPCzF2q8ZgzfRZR4QT8uIt2
         lKoLBiJfV4cU6g3JOxIBJgPcGPBnIfGycUmXuKaxJSr19Xi3aorXwYzGxtsfJAhlHfkh
         Q7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654889; x=1774259689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=;
        b=EoqgFx/YfdX0kY/YOQO8dkc7aVkRcNdzdYvWca4F/p079TbIckAQjP80WALxHu1u/b
         xeGtpcHkyLDkajYrQpxD+kIzXnJjpn0jskEmnoJacZprmDCrLljberw+LzYXXomEr6q4
         mLvFLMvThGhe0K5PLdaGPaWj0YK2RGAL/tDtM6SI2BEEJ3SU54LCpHAVmJTej/I1y1BG
         Vd9CpnF5xG6dr3zQcnbULAnfWuC17umuSxLfpPepKRRyhVzDpJgU1s/A3wFjoBmv8vTw
         6trZwVZCV7WgO38/aSrTApikiskKOdbZuD91gFhUomy5t1XZo2SCS0nEuJTs/iDFWR3s
         lmEQ==
X-Gm-Message-State: AOJu0Yzaeo+jyfun3GCHIN8MZp9XgRpaGITcG9OJfZ012tEDPeMHRFIv
	rlHEjsvVuOt0jNfUZM4VDZxR5mFITSyGZI7w/yj29MIRaIxLMFd/l9p5auB4LiNtVR/n1Y7RCWF
	WEE/Nn+st4dKNjF7OrLmTNBzpUeTeRJ8cBMZm/M+fyUqdXTfQXfHG93LdvqeL9x9ok+ib
X-Gm-Gg: ATEYQzwaYWaVpcziQ0pNas7Ih1zFlJAo6Vif9Lyi76z5k3cokii6OrKGDvkX7rkCNB4
	KhTzTSwI9fOYkrd72M/qytNsJ5e1+FkFmY6jZcsks96gXEtwx3jEtTO5iFc5x58yaFQvdCvksUo
	OJ4z/edKcTvIbnDBIDOgGk+lLsJ7NvOgGMqoGd0kRVU/5c/FDURa7Ti40tgEuw2rU1/863fO1lT
	ZDsUUai4HYZxs/h8ccOMmnY8L8nCvTkmUxU9o/w2vZLMFQXUC4/PokUwCMieV4VINh6ODfCQS4f
	eCAxpBzPmScwb6Imm+374SMH+hwKnBO0tGNLR+SWMSWO8DJkHjzC+dxTlLVkLKjkqHYVnIbqdcl
	mZdJgoYx6W9P6pvWbJEMF+454w0l5C6wRik8cHcPRH2JYsqKLB6Xmi9hVGK7MpAYTHb2Q81x+XU
	it39Q=
X-Received: by 2002:a0c:c350:0:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89c47e44552mr40701246d6.6.1773654888704;
        Mon, 16 Mar 2026 02:54:48 -0700 (PDT)
X-Received: by 2002:a0c:c350:0:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89c47e44552mr40701036d6.6.1773654888233;
        Mon, 16 Mar 2026 02:54:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc19b84sm532803166b.21.2026.03.16.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:54:47 -0700 (PDT)
Message-ID: <df8751b2-0546-4d66-ba13-b16f8c0ae595@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:54:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: Make a common base from Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mHwtd7faMpWUxia8qODB4qt2yp87Dy_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXxvh4qcciWeKZ
 OeCRjLqU2lnYTNLRgV0+igqZ/m8d+pa07ejJPFFdo6SqE9ylxRdmL+ovei8poKa3yJzSdn9mxTg
 Jow+IMi4m9iyzET9r+vN+Q0bzM5F1aSsOU/WpqKkpqm20WwHt95TBTAa3RIpJYLu9IkXSEu5+L+
 pZ0wQS1N/iRr8bZm10keNpMXPmLr07gfq2run/8+OywFL9dtQiSkUO37xLWaco4B2NiVdz65CRH
 mrhZEAYsjgSFvTKhT+iexA+ruhvmAbLaCuurVpOet/QzQraDvxhXLwPeAharCoXXkCdmFGUQFon
 0/ajPRFb7+7ltxlFdMTgfaCdp7nH9YIplFuePN6nNdnB/2hRtV83VaJDp47xB3//QONbsn6jxVf
 eFsXY+Q3PTMbcNFn9OOFc3GiXZcvv1uVmPhpLMYYmHRFnUM5eLKKo2DppUJgUqL6H2q0/Bk81cp
 9uolDAQvyJIbwydHT3A==
X-Proofpoint-ORIG-GUID: mHwtd7faMpWUxia8qODB4qt2yp87Dy_r
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7d369 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=hBsfu5BoBQgbZ9FLN5YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-0.05 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.61)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97888-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9B832979B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 5:26 PM, Barnabás Czémán wrote:
> Redmi 5A was made by wingtech like Redmi 4A (rolex) and Redmi GO (tiare).
> They are very similar, make a common base from riva for avoid
> unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

