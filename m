Return-Path: <linux-arm-msm+bounces-93474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOqPHfUpmGlqBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:31:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC516644C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D343B304D956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33868320CCF;
	Fri, 20 Feb 2026 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSlr6yVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI+fSqCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13671320CB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579691; cv=none; b=bJn+6+r5C6Eoe1HOHhvbH6zMu4fZN5hchoRvY9F4Bjh65DKNhHLo6pW80LxeNqXy1ogu2d7w5phlQIMs6Mm+HS/BRi1IlIPUi7F8LzLkrrDEwnzp8+e4pMQ7z8agqTda8IshtXJDUyxt5Xl2fPf1ADYz5sEo1GKz8F/gKJsMKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579691; c=relaxed/simple;
	bh=Mny7DvO3pjMJl9m4SnZNIDEgtp2kvk35DD6rw6sNch8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBZVG3pB3+Fe4e9pbjlYFXg8vNTz9ak6o+mEX5eyH7viG3djRNvqN5Rcv73GnV+W/SK40PoJR8T+m1si3cJyTrPbS7oilQjrXUoaiMrksxsbdtMiF36xp8UsBklSKnvVZtx0Vw6TlSuBRklWMolew378phmkKaHyoTAzKjJDjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSlr6yVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI+fSqCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rpdv2552606
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QXUd8ePgFxsCGMYbec6JSFZ54mAXJqBd7zxuxypo8Uk=; b=OSlr6yVA6CdA5oAU
	/ugX08Gs1pEPgyc6p9Ai/g8oXNV6c0aIpjlk+BgLVZMgU9INPr6wDVHRtrhDSTZ8
	HANd1VLDRFW/N8TcxIvE0L0M/Ax5swpQIQfsAxE7krhqUwnYX1yVtsnO7/SUB5t0
	R/g74U7r7mcOIGE3I6ddYcP4BUJDQDTmu4FHh4FrDQfI2iamdEkidnHB2JExB13s
	PxOnb5GYbV7hV/lJGGZeYH8ljbo2pn4FVG2sFrOWf3OiDZQJcjdeTAdFy9r1of5e
	yjtmp7B/WCXjnGJ4q63yzgeZhsGgblxh+7gj6PBDQ2BZVQVAMVuq579ZqbS4ue35
	GgsENA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t0jwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:28:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so179687685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771579688; x=1772184488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXUd8ePgFxsCGMYbec6JSFZ54mAXJqBd7zxuxypo8Uk=;
        b=ZI+fSqCRzrs/WpY4bBebbLhsFX5P9r4jSI7ecNuuI6kFhbf5fItJ1Zloklf2PcXjap
         6v09CUPr/hLkI8xmtTlzC9hiEQ2EfkZdjV6oJ40uucBsW+fJTHUC6AfY0s+TnqimY+AZ
         4/ZXpPdYYtD1bLg8L+vueZnG5oI3Nk4QdLSdZHoMm7AD67emtq6IoPaUr/nD0aZ6pny5
         TVcOMhABVZRp1hs+e2Ev7a6+XJ8EZ6nZAQmvpJpoJQ3LYQ2OpS8DTkdpXEqgRY9Cbo65
         K+CeelQQ25hBIzNF6+ltddBWqvc97Ohs6seSSCk56a5newIRL7sXnh7wmmggkJIXs1tv
         0cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579688; x=1772184488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXUd8ePgFxsCGMYbec6JSFZ54mAXJqBd7zxuxypo8Uk=;
        b=d++/nwF/GoW54Ox/iZuIul1AxxwzVjRaGRjPhdtSBeucxYk6q6gKar+TuXCysC+BpJ
         0/cJ0hJeDveGSow8au54xKr0NdVX8i3y9buA5oOsSPATD6V0nGG3uYGqI9F0ynPINFwo
         qatsLn4C5h34CMrQAyV5KTLjppfXi3XYMATO8tvPUrKmbB1sUkNqiOP06R8c61m86SLF
         PYwTn3xyOfaviSOi0qams3T3uigII2gFenicN1cuA5ZvxqHWiY54NJX1+bF2UDSOBpQv
         MTZ8Rt18NkZIIEh08a/s0lS3NZPIGO8CWka6E0FSil9zSmQo9os5y8E74xkfuMe/kULx
         xyUA==
X-Gm-Message-State: AOJu0YxDt+TJH9S6MJ+Q4joRm7lop2jegpY21D+4eoDQiUazDtV/FmLF
	fniOYhOgf58gqO1oLipZVCsdwxanrM9/YHay2B67XM7RX8Tjl1GbI8iVW59JlAQUURRQZD5/Icp
	gIbD6wnV2wylMJGzx5i/skLiMfksxiFPNR+Z5qi3bcGIEl/scCcLqaxZgt7Vq6OUZMSRV
X-Gm-Gg: AZuq6aJbwzeDYVtnwUn2b50tikqGlhMAp7bccaJD+Mp2htiHTbyMwkYfsBqyYRS4MxO
	EHI2V9wAW98Lf6u58Jy5aViZq2LS6zlVvsKX2knwkKJ/q9LeA4xRQtHPs/CZcN+QaOlx88mqueU
	v8bGTooKb93xHsLevLGREurhgQeO2CrmfOAqBPHK254LTN+AFKfjjWMLFPwqe8b4NhKASsJLbpQ
	ruce9QXeAWuyHQbIMwbFAJ6gf9oVpZ2utAS1npnbXaL2eu8vxrINQ3roO/bIlEG8JG6R6UXBZhq
	TRknnif3ETzCuXXCnYTXgWiMDbOE6vdUJnAWYo0D4mi2Jewboj76ohvdvTqR/UyciHL8RWNQB7q
	ZTjL0DU+23w4Zt/+CtKSv/6wa0AMp8KpJkyRR23mX8HbbKSw/TwS/QOJPO3wzj6L+PGkyJcmWqa
	n3zxI=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr2339871585a.4.1771579688481;
        Fri, 20 Feb 2026 01:28:08 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr2339868285a.4.1771579688042;
        Fri, 20 Feb 2026 01:28:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d571sm4484618a12.11.2026.02.20.01.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:28:06 -0800 (PST)
Message-ID: <9cc8dee3-fc39-40ca-9d89-44cf6ace8f40@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:28:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO
 polarity
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mE9QQEs_HQ9L53HdK4o1ARBC7TaIyZon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4MCBTYWx0ZWRfX+djLh7eiZatc
 7w7K/70N1uaRXoWWaVMn6QS/xO4k8ueqfeZrPqtGDH0pDz1E7PAKIzRDLXz1dJSCChQfHgL2e+R
 zLvIc15r+KVN0qg++syeo0UEoRsdDKWbBr6rfkRNTZkYgmPQGeP7enax3M/XxULi1mBVpK7hzJh
 wLxltvKnTQ/8YlTCo/ErtHamx4wouSi1u3UlhmvAYiBBP/Dz9ec+Y7RIoAVka+72tqmyHogTHdY
 Ew58wOLbKgsValSj9+pJSO0yaQAv+hy+ViyXwEsIMf+FrWTxOu0mHPZeAgAobontGbMxBR/Oznn
 EEOFMO+gbR56iTF38O238Xx4+x3Y6JLrQKGYBwyzzd+e7bK+3AmbBDmjgKgqAhbZfyuuFPmqLnX
 waUhSQg3GdDD77Nom9KyCjAUO9R2ghozbQLhl33OKlagfAOMc7gDYeXpV1xVMBYmOkihc+PwsHx
 PxJubIdoxjh+E13XxZQ==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=69982929 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gcfP45G4B4qNUzTtpgkA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mE9QQEs_HQ9L53HdK4o1ARBC7TaIyZon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93474-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3AC516644C
X-Rspamd-Action: no action

On 2/20/26 10:02 AM, Ravi Hothi wrote:
> The WCD9370 audio codec reset line on QCM6490 IDP should be active-low, but
> the device tree described it as active-high. As a result, the codec is
> kept in reset and fails to reset the SoundWire, leading to timeouts
> and ASoC card probe failure (-ETIMEDOUT).
> 
> Fix the reset GPIO polarity to GPIO_ACTIVE_LOW so the codec can properly
> initialize.
> 
> Fixes: aa04c298619f ("arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec")
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

