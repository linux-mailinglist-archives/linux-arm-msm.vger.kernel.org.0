Return-Path: <linux-arm-msm+bounces-116831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XwnSOXWxS2p9YgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:45:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D067116D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:45:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pVuAKBEs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pce54f2G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A51E300B9DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C210A416129;
	Mon,  6 Jul 2026 13:01:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0D416119
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:01:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342878; cv=none; b=YrDofsLOXsW9BtlXcJg/w4UiOjMANzA4Pxl6KDB+piXM6lIisyqrPYDKznILp7NwmnssEfI71cPrEJ5A/TPK0Rr42EZxtNYXu88LnCYsIIJq8rAPwsSQVIJU2kd+s5zgiB789o5SqWgvYW/ZoBEurrVpdLUydoCFV19NXQce1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342878; c=relaxed/simple;
	bh=gIulxm52U2pGH7kvolaopSeoZ7amTnOimNMWFMqAX/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ul0BoLYWpJrKWNUUgOPh4iYOxzNOjFi5rFJffFJCwcEub+/OsIt6meWGTQiiBKkb5HNl9iV6VZpOkkLaIAQ8HcFWjA8nunNlql1RVdBKauEE5FGEPNdB4T76yylsT1NETcNxFimoFUp5tucpgsKguAh2eUD23q0O2pdrT/l/nvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVuAKBEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pce54f2G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxIAr387415
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=; b=pVuAKBEsXh9VJCHv
	ATzGsSA6zapipBOe4XLjPWRJjFlkUy236PEPtQo6HJlZKeAWq9yXmKNLI/IJmjkc
	faXxxc2y9wSvzBdHF49kk/shCzNMb9anqzGynlyL3WcZ9WpKCOUAAjFsMENFUeIG
	fFDrOMBjSadfLBiNx5YnDbQvlwQ6xkSEOHgiYTQJQ+91++IdoYzMuQHWjAa+Hjjr
	lY4ulTkLgSbFPSPtju8t/leMk9HGjqUh+3HExQqURoBL0+Y1B6rVekyzRwZElX3E
	e4FlXqmYn8vvng3SNjil6fWu8VdArxdgMLtLRYMZboqX9A7DXzr3MtjItH4wpCnZ
	1RC88Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0pkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:01:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73966c839bfso103259137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342871; x=1783947671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=Pce54f2GnvozNqHgh+zKiLBOG4gCKmKmPb17etLx0utb3rUKVwPw59U+5mfkBPwJZ8
         C1n1Ab2Q65soCnWO/zKgKt8k45WxiXqKtF5jSxeqookgxh2L4dA/DDUy6fLH4ljz8d84
         AHsg+CbD+v1R0cYZ3knEREBg6jslOj+ZlozoAc89SRk0j2LaQlNdynSO/e6CAnvof5Y7
         7bIYzH/PqE1xVfk/iEFA5Z+eo9koEKcNn3Do+WRMTcyUkgHygMDnoSA5E+OosMMfkjwH
         lU1GNNE8wo4MXYPcygm7PcZMlS/Yo+R5Ud1XNokUkqQ7hEyhxSJ7zV+dBbmc2xXLa7PR
         RQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342871; x=1783947671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=Nopa499fx21wPwX9EraRcCCrJF7bNBSYb8iuU+F7LEvVWhDEf2NnHPB8NDIDC6U8ur
         MmqRp3Rt1BArN0h2q2Gzf0s+K0zfrGAo07yxoXE145YluBK/6NjZDgx3klqQmEGpNsZx
         Yl6DwdkRxHdE0qWidi2rStUJjFDtjaaGnAMg7erzHmudjD3geW9EadseuQK6WreOm2x1
         0XESZdxFgYDci82dFMMvu5IFjFUhM1WyjZSmJlZiWrMkL4PGBEYYVStdIsTCkz1d5wWT
         J77Fnki1PhwqiNuJ38D5kRAbIob+uTd4Ds1JOtT0C1McEq3C+u2PkQEin7El6S/HJFUb
         AHOA==
X-Forwarded-Encrypted: i=1; AHgh+RoXLLA2oIEyJKFXX5T5wOYVQ6GTRP9yQQnInBtybKthTMgff1P6vsdODwm78DtdD0DImTIr21W0jd3Tscjd@vger.kernel.org
X-Gm-Message-State: AOJu0YxFF4PP6s7uQH7f0QdUoRJGuyXBbVy454yNYyqcsruTAwDf9sfm
	sk6N0g3eLEbKS756BXWOYbgfJmAXf+UsD1waqI3+ZNupcyenvxC3J/NG1Tj8xtonpIEPnv+A5Bi
	7G1noJyeikGFIC2CFR45m1xXpmiB9aT6cZ60AZGem8SUu0BlIii/wTuHKNca5gUgGi/JP
X-Gm-Gg: AfdE7cmpgpTzJkbmJ8Avyjnfh5htBxNFxek6RclKwkaLYK+apl44hdrrNsQD9jJ4HYP
	UvUaEAaY6Ygh3YXDMcxK8LBgebesTSx1bqeuuYHZ7V3+Uw5hGn0JAzYJC+Ge9qcWWzUVTbWYM/I
	BL0NBaNXcA2m2moELx8QBwrJYn8MjEvfGxGMaW01XidhiJMignvBC0UJNSkndKPTLD8gUFJWF/h
	wCZHzAEsi5IxkcAdJZ9kITWRjUSkKdBJnpP7QG82DUxjwtwx227EzytfIY5FvUF1knu6z5CukyH
	29qq3/vQldO1ip8I95vKDDpiCmxVArMRRFMu2HTs3IZymEqb4+ZgvdrDHQ6VqfnDBz2OlltsZJ8
	Sj7C4aS7qWFGpAdXCQ2WEBEJlbbYFQqEWGi4=
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283862137.0.1783342870544;
        Mon, 06 Jul 2026 06:01:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283786137.0.1783342869189;
        Mon, 06 Jul 2026 06:01:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm4282774a12.21.2026.07.06.06.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:01:08 -0700 (PDT)
Message-ID: <bb789efe-efbf-4212-934d-a02913dbbdcf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:01:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX+JLOdJeBPMjL
 GWVbWLA9y2iTXmWhVakLrqxUQo8xE9hBRakSUGUI5wd7sQqK9A/B/mGsm/akBKe9Q2VWL/H9Fa5
 d3On5rXmS9hCW8GSVGffceefr6Vek19/b4Zf5xFRFAbit8mU2QwiUsh5eHY03iCQJDfQS70AxjN
 bxPN1aQpKSQ+GIKRc2uinpJPQxW2z3RKOktY2lyNBu3WTI/0B3MyEIWPNT/QqVDjfat4b6bdplZ
 5S00IrQ/DWH6iJKYygaN09TTzo3+7/9Un7SPe7aRWR6lPdB6KsuoZeGSRJfw9vrcqPYVLewoTy0
 rF9Mpjyt5/p0/2P6yf5BBJSEbLbMy/qwX0lUUuwGc9CB1aOXua5HeikhSyU2V725MY4F3Te7Aan
 7+DZ2k4xPgcOX7DbVXBR47SYbcQz+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX/SpxzsvioGSz
 rM4Mor/i/xtecTzgzvozjByXUfz1TRj9rMcauQj4nTqafRbIZcn+2hGSMfEU/tIVIDpb8b6rnHs
 uSOFhFUqc4TrSv3trcBsjZ4OLKrEZOk=
X-Proofpoint-GUID: cPtoZLtGAVD5dQbuM3X-y_Czp8STAgfF
X-Proofpoint-ORIG-GUID: cPtoZLtGAVD5dQbuM3X-y_Czp8STAgfF
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba718 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: E2D067116D3

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

