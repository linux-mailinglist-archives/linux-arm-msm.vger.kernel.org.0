Return-Path: <linux-arm-msm+bounces-73937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECEB7FA0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F1C1BC18E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868A5332A50;
	Wed, 17 Sep 2025 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoCueL3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676932899F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116817; cv=none; b=aavsKHK13Q+AhxEDkQQKASHcEbe7IlSL7KWNVSBT99lxEDURPOmbSafAfT1ZkmT7Ha5froqXOtsuCoqSwZbhOZ1WsKRBU4iSsiVl06vfedoyzHYQl+eXB7qHSwleUporNLGn6cWz3SR2L6iA4as6shBHWuXdDyG+vXSUXutOXTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116817; c=relaxed/simple;
	bh=RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDXc5nhi3bv6I6KTXmuaaxiYOVOZytowqMN8148GmKP0k2YAem545J5jobLnRwCU4UhDaKVE+Fn0hUb0pVJsulhPNxuiDpRSEkkLO3NlN8my3JSAiUJ0p/FOGC9SyLLsgkgCpcmkh4Fq1KA+Ajfp+4LvArplzBviOFpvz8et/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoCueL3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZ8b021414
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=; b=IoCueL3bfrp2DYCi
	vLUHwjwAW+ntbPQ/dCh2L0sSb9z8DxcyJXIYgHEgzZHBLwwVEwK/D7Zsf3pj++5k
	vPN/2xVzXQV13yjg7Hz6S0k4Y2CDvcDt47xz6WU1BNZ7IcZFDBGewM1UK7aJS2lt
	+wcPzJBZaFx4Y/PKif3vb2H/2TEAUUNcqsPDNuM5Bsf8Mj1kMs4S05C8PwcZbgQV
	YEk8bband0KNIvovShfngB9UvD8AEQCH7j1RNsnYrVLhv5CDuF8wuX5GN71Usm7z
	r3ggXbv3bgZCtlFBy+kP6nMQpk9rPKbHoqRZRonK8SclnzkQK7yLFA6eSEBuIM3S
	T616oA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ahj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:46:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so4667111cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116814; x=1758721614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=;
        b=hOhScuwyWUsR2yOHyXyK5rsHPYucaBJXOcY8Io7I75tko0wQ7mjdeQNgaspTxyUvTC
         nYVb6DuZeZpo40R9JLK1JtAxdD5mOgv0ouBlpyxA4BcmE4/wjSVctMR9drBkHEIIux3/
         vDSaAgouY9SpeyXRGQ6xCh7sALZuCQGGe2PcEVidykTMb2lMeQDTzmo9aymPhCN7hgYe
         Oi04nj2Gf9FxpsYb3jZmYs3fIm1rouI/5AS+ld0ZMK5R6WrPjzEcrPU/FiDWDPUIlyY0
         xyvsOusgP5JogVUtvFer3So1R0rwuZrhAMosXU1xg6HoJc9dHWrLwCekTRZTQqf/ywZX
         JHVg==
X-Gm-Message-State: AOJu0YzrPiOvXBbKVX6NZSvK/lVc26fJeRcqaT22K/tYQ0meK/QiSBrS
	vzmAMJiAYDSv+U+ViyuKC4XrLhBSqj5LbeD40MCyO1OVAPzmj+zPcFXIMFMvD+aPiaJKEjw8BGY
	UhJVgS0f3YwfM/UFeRKcH6eO6m86gFOROULo7vNdfvPXmXTAceqXRp+qRG9hui1Y7rct7
X-Gm-Gg: ASbGnctDfmOANXQPHSIAotgfbP/NVVATXwWHSrPFCtJ5EnR+9FzpCDBENHaj2LMqjXM
	9GKivqaCZRSFZCSDt79+d7aC0c/l52uLpKf+C3oO/HiXHjVFk/BzIGAurcsji3z7K/m2VJdC+k+
	k/WtX+dsyn5NxGAmkUPaCLi5UARZuqW8Fy+ruCqoM0VjYDPE5EPB5SZ8Qms31DayRTJ6YD+KlPI
	eMQjiPtoc5M52wTLFxerC8nqOc3KXN0gQJAbUcTLBkYBFvBeRKHjNn0S4X70x8bygDJePLoEAI0
	UaMwrTFKRCUsALzmViOicsVY25Tjik+/w5dhDL1pD5PSGMkMOwg/sVv5cV8vlxa4jETK4/zPkB7
	VSZEi1R5mYXlm9v+1mSwq5A==
X-Received: by 2002:a05:622a:1a9d:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4ba65bc2015mr14609961cf.1.1758116814194;
        Wed, 17 Sep 2025 06:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGU9SK9QoEi4qqIyWuOLrD+1Koi2QQZhObu9zrUg9uyVY24N4I01Bsoa7ag79322ufzX+ZsQ==
X-Received: by 2002:a05:622a:1a9d:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4ba65bc2015mr14609671cf.1.1758116813649;
        Wed, 17 Sep 2025 06:46:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec551bf13sm13031804a12.53.2025.09.17.06.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:46:53 -0700 (PDT)
Message-ID: <adbbc9cd-dfe7-4983-865d-d311cddbdbf1@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-13-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-13-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z6NQh8uyLuIrs3KgWz16Jv3YzLCPi4yN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1mTf4wbeyBQG
 7xmbKR0oh59M8zIivVWb2oFSLK4HJthW8OcoxeV4p+QIXJHWsKTuiZiReFmtEH8ZvuyP9mCqJP1
 2oN4qpSxKgjDE2lo1lGrkpRw4YTfReuZarIrNjs0w1QZfFcU6U5o/Ldq1P0BroL5LyrnZfFvfUn
 8Sj9FjDVQ/NzSQPAcmOEiXNISHWN3wXByV0wfgIlAVPRAqWJH4+G+WceLVgJw4liyZ01Xo18ibv
 uP25keXIEaLTQOMjaFaY+dT2b2b5hxCBc1BglJpXT0WwjkbrcUX3y25AoEq071b4lj4T77NR/MK
 +sotV6USbmy4QbXiXB5vLsbUJmG5tGiXDNYNZiciPBvx8mqBGyq1U0RG+GOiZ2DX67uMe8MA0AS
 Jj5RkQGm
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cabbcf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cdr5l01el_-Pmc56AxUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: z6NQh8uyLuIrs3KgWz16Jv3YzLCPi4yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> `regulator-always-on;` in ibb improves display blanking issue

..but doesn't let you save power when the display is not in use

That suggests your panel driver may not be sequencing the supplies
properly (or maybe the reset pin/commands may be misplaced)

Konrad

