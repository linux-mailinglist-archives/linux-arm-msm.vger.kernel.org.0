Return-Path: <linux-arm-msm+bounces-100651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO4MGsDlyWlC3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:53:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7AA354E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53752300231A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB32C3932D8;
	Mon, 30 Mar 2026 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiVZtWd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aqjbv8jx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5CE313E05
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839228; cv=none; b=UcAJqzDXIguQaAiq3znCr7X66GLEBp/1pEp3sGIPMqAPt3Zppj0c43tpYEeS7UWr0RhldkkrNQ/FyIb+TUaYCTlU/Z1Tx/hv0WEt6XqHWk/fpsFIPmxgpqfjbe//4HHl7KovgaPdKyCSwZ3NdgCBk8d70bKZtPhUZOQJHwKtlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839228; c=relaxed/simple;
	bh=kO3eQCsk6J6Ohcop6WwGfpKcDh+Tf6GnhxsGtu2Cai8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/HxXV/tQzASxtRJ6SdKOqgpvcSr5NVIrr5lVYi5Qh2nXrOh9r2IehV7wDzdbrdyDhu3KoXt9HE1ntvUiovyiEbjPfpENLxPfKld566dUrDwRwjk3JHZ+qOgLQ5rwregw5R1Ndt+eaXWw3jd8+iNJ2qqQJTwuzyt+Ml/JxpcI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiVZtWd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aqjbv8jx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TLpmYx117364
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=; b=MiVZtWd8LKoAYq6X
	eVw6CgoG3/1Xe15H5W1SWuuFyfcKuVPriAH+7vBTe7kDSp59OkmQoMOlUlzf+RS0
	Jctj8mzo+SV2M3P1a7BOdQDaFlZMwzFky0jBLJq2l+jxNmjayWyu6ENp1dB7Fhfs
	D/40cOhoCi/LRhVeSvGmG/piMvxOA5vTwbE0DuRdymfN2cMAjXKgP3bj/5g6sEUI
	4/O+hXjVLfQit27tPeEQImowGO77B9zysBgStbkMb9ubhPX5Y+rB4wPmuLltWrqk
	mQysgfAOfbzRlyJH/F516hbq+GNbEdcIuLEfMHLCDBlZlIDKQTM/lW2NSHY/BkSF
	1yIxtw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqej1as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:53:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so4887835a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774839226; x=1775444026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=;
        b=Aqjbv8jxr3tsbKuFU5WLlbBL0LUlDhuRbjQRk/Biuw0F/eH4EMGgV9LDimuOcPaRwq
         zGckMPqufh1py6kq6rbRkHliJLU/7lqeDHTX2OziZ2maq09S3lZu1vu1qTuoRVx7/1Lc
         y5CG7k2vxOJAHGqcbQIvoQsoGq8fhBYPT4R0weMzFIYKWlc3xdL2rHVLul8z2MeU4cWQ
         6NdTo6NFNoz4UW3AuI/M+QchmywIrCgo+Md+rIJnJuTTZaJdKxpnoIghx6EihfkMJ2rv
         Y49V/VDSKOXyWP+1/s5H9qanCD3kQ0duyTYotIMbuy7sZIxN5t9Gq9+kU6jWJI/GHH5I
         fm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774839226; x=1775444026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=;
        b=Dy/E1qX/vU8LBIcn4kdZCVj4thaVJkyq/b56PFA8BQl9gyLU3IW7JxV3I9r29dy8w/
         LbC9DigL+8yzmIgEddK5Qc9ptSNW3G1b05aLW3s676aRvPO4D4dvZ+k751jCqNnmnPFF
         Neijs2E9M4rdNVlc77iShK7Gyha7lzxAY3nEyA2FdhOlhPw8kNzHPvyUSNk/6ZVzbtN5
         BMXG5R+KaLW2DAhq2svdATfTkf0XrsttSmZ6fFJUpphHI13EiU58ptPXSg2FhUv86W6O
         wjL5cw5i3eQvdKON4SGcnTUAQzOXK4cV5jfTSuRqt4uYglYPMbLnHnO0NLQWo5Eu/NGt
         ltpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVI8pdOVyRhkMLzPqev/fz86BZ7Y1W07XrnSaIN9HnKJnowtu/77g6D83aC2aypbG3J69UIJMz1W2Gzugo@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqlazPaIKdg1Xgh8eegsH67ZptGBAojE0VULV0LNHktYQxMxU
	ui67U9qBucLRUaN5S/nnHjLX3+w3H48n0rjGzckO+ocYKqZpSJoxMpxKIh/v1rUlMds+wlH8fj0
	MVfD5QvJ72eEwT+xbh6f+Je9/L4UBT/NssVxBuCb4yfpF1NOnPHZXpFdotQvntcf4fd8k
X-Gm-Gg: ATEYQzzRlF8CO5fhPk6Tc8R+hD7zJ2AyWSQlIVa1eudmXCz85w20z/3wDXuVhovC1jh
	F0vBOKBBBtMVJRUGA7pkXa/6I+OuEjEpz1cYqlDQIi4ZswOx9qqLUWxNZPCW+cP7JMK877V6Z1g
	EHovXR7tq9AFE27TESoTEoZKhvzDTi7mKOEvDv4VuUmft8xhhlVRlbBVJ0ZUeSGClUpq5Qw/p44
	ZMYGHPH3r9UnTkYayJOh22DwWniN6XUHVPGBnY64HTTLA8YoDpJ4RSxRnUHIzPEO40tKnIGekN1
	WYqug6uNowx6jIekV9QsedR0UpN1Uwt1R8vJh1MEWdWrOzn6I4yCtTfrAL/sQrQ9q1jl+kcrcub
	OyJePtO8pm3h61ZaNJUk/r04J/ThPHhrQTImh3eDYziikDc08Cj4cvaYmnJOn6KiqOVw/rTBw/J
	OmezCeL7i5z9tSg9M=
X-Received: by 2002:a17:90b:2688:b0:35c:812:612a with SMTP id 98e67ed59e1d1-35c3010ea58mr9892375a91.29.1774839226194;
        Sun, 29 Mar 2026 19:53:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:35c:812:612a with SMTP id 98e67ed59e1d1-35c3010ea58mr9892355a91.29.1774839225740;
        Sun, 29 Mar 2026 19:53:45 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dd72sm5583906a91.12.2026.03.29.19.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 19:53:45 -0700 (PDT)
Message-ID: <816ca5bd-239e-49a5-93cb-8df6521d0097@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:53:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
 <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c9e5ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=C8bOAEPEEF3gcPeAhRwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: M__QJxNEHQHMgyLNbSMwPJ15OvoKIwUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMCBTYWx0ZWRfX1HeDQLwMthg8
 KyJk6b5rBH7rJNEvV8iZhXLnx07OjWGh+/eoGvvLyaloRwBJe+38Stp/9TwIbHFP7bj/yYD/Roq
 tmOzh0U29g7YtcVWPzSATkLegzy0a4J+xqA2jwzREJThyN/D+TjsCX17Eg4QTvev6ndDauq6TXO
 yzFPiG0zlER6vKYX648jzOCi8YgK6h3uepvtd8/ohaGzDbaXmZFlFbpcpml5C/IqRIsmZ40TX6n
 RzIq2aHH1YiFxuhBHrJZXj9gmIFcGuTLqMjzSwlI7DNeQDXpyq+KMjOzrG0Cik8FLXsF2T6ylZn
 I5DqRWeWojztcX0KlOaSCympR+OzTH9Q6L8wB90HiFlpwPrNv19omR2ai2PJ9lGq7jzeIfScFSu
 cOtXchv66MtII6XkMeqbwLYjDBu6zvBwb6ZP9c3riaskHSk9WbAwcAk0SlKxpJc8k3nYAxIde4q
 qGnX9nSHSCaDrMiU7/g==
X-Proofpoint-ORIG-GUID: M__QJxNEHQHMgyLNbSMwPJ15OvoKIwUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300020
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100651-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F7AA354E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 5:52 PM, Konrad Dybcio wrote:
> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it
>> is brought up by bootloader, so set the status "okay".
> 
> Simply remove it, "okay" is the default if the property is absent
> 
> [...]
> 

well noted

>> +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> -> remoteproc@

well noted

> 
> Konrad

Thanks,
Jingyi

