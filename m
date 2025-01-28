Return-Path: <linux-arm-msm+bounces-46389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20AA20ADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154A43A7E85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F81B1C683;
	Tue, 28 Jan 2025 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWClaKH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A3342A92
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069356; cv=none; b=YEgZTeOh9uuzedc7/m/Qo4qH+nyq2ZNL20D2yWRmVO7QFpV3bWQrBDYQBOqBooqkVHy5IhdB9XlTuryWaE6DFWfUS13AWUzVDNWpsA7ECl2YTIto1QQPxgJSkrz2BKQfDW7UYAU8OFP28YLOOxh7EAO4bC4Js3sFETMgNedHN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069356; c=relaxed/simple;
	bh=eul7OSgl7lWGUq+8FLZcyH4sOLaRf5Ciw++Y6vhmfns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8Tohc3lAZjjIbyRUn9k0kw4KA5GGvpzEqHAgzoZZuqkgMzCU54sEj0VnF97bTxqSTsbyV1QPTrgL/JhPdD7mj0tA6M4+T3JNQRw1HT7XDbUusD+js7Epw0AVjMJwe/pC1NZrTw6Ce9eLxtqpnJ74uMj0YsVoDLUurrjAi2FNGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWClaKH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S4uwNS000465
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QElHZpsqHaqu8pHwEaG/i/0egJwiOljuXuahr7b3iW8=; b=kWClaKH9aiOh0C+k
	10Qk9KE8g2W7jBzC5ske+zmGxRH40FlujRmA1Np9zcytiWJoceud8dOVazyw3uQl
	jLGQfJlDz8Gvl8ac73ItlSQV8Ljsi/qn03/uL6vaki040ymGFDZM6itsscDoAvQ1
	lxQcG4GExCPWGruxiyQandKacseSrzV4pNFfyGHYgc/Qw0p9oEPQyir8x/QD6UMl
	8QrPoWiMb0V5G1kbMwoLGi1vO05azo4Z1Mty3ScWfVPMpxcHnGZchAzNkf8j+MHo
	YdqGlRK4h784MTY/4C0Tb0gzEGppFjbFgswZ1TwHKpKKxDF2I/9x7ySBfnaiA4Is
	S9szbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ernks1va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:02:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6faf8b78aso115473985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069352; x=1738674152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QElHZpsqHaqu8pHwEaG/i/0egJwiOljuXuahr7b3iW8=;
        b=qUHal9HwO7VWRPfQWaVrlnL2yYU0cX2Ndgm2cWJ7VY+yEdpZIupYvhK5Gn5udZ7rGR
         PrFsglCKKb+qltgByc6cbKsV9OAwEoUY2FoMHtEARNhWiS0bHoloaKHSSw2PYMfmPfIT
         CoBFSVA9MFZ06uIFmo9OUMscL6U6l/5AtyrdomVrM7ztq0wcm+9knb/ZWxJuQzBq/30E
         wDzBUEdkguhDnft93XCdBqALuRj1yLgurvzZXvBdVmuZUAauBfgBrd/dxjg92ukrmLCw
         N9jgQxdc3UNE3zUnwy6QqRQNlD09TFEE2mIzSvRz93YTmAo6tHTJ0VDEnH9Dme45cMrz
         +qWg==
X-Gm-Message-State: AOJu0YxXJ0SqEKIIozR5KHfvAAz3VcSb7b4f9weVo76B0LpWqRQ+6Td1
	34kKC1NSgDZ7ZEhFYaFkV0oMKI0SJT8t08MJFkOqCTX7RbWRHFSCgcBkxgwlv2WRB0rxzHH0SWa
	wqh/NUzERzrwc7b6fFibKgi9d/nhwWqfPecoxfDrlEaBEoikD4jHpQSxZvkAwD/Qb
X-Gm-Gg: ASbGncv3SNwE+8OeRzaEiUF9/yq/b8dMQ7MxavemmmnUNSvY870NfyXdezsCDThLAVt
	x5Ml0Hj0pFRdw7qwG2HYDJrpBvHjkWMTyLgDUPCzuWAnjdbT/GzbltCfQ55atCE8RGRiitAQZYm
	UYjZGrqpcJyD/bXxutQlJLbN5MnEd5fn8lTiwLqmCP6dug4YkAmh+f6PbcsoNWNUKOkma3fR5p3
	ALCzGJDQhnNOn3tstPRp1wdOKGNFmRdAFFRiAp+Ni7hFnZlhV7yZwQfkXvAiSIpJdtDsMGtfSWA
	/qtHsQL6VQ0dJ3kNPyvMs2+0lZVgWmNSWRtEXWp3fg+qEUKFEbi5SOGLm9o=
X-Received: by 2002:a05:620a:25d1:b0:7b6:d870:ca43 with SMTP id af79cd13be357-7be631581dfmr2612380585a.0.1738069352099;
        Tue, 28 Jan 2025 05:02:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw+tgVVWbH4jwLZWP5i3Iy1ohxnNN8A+BTUcrPf77QP0hpY6THNyCUiC8Z2d+su8sHsfMAGw==
X-Received: by 2002:a05:620a:25d1:b0:7b6:d870:ca43 with SMTP id af79cd13be357-7be631581dfmr2612377685a.0.1738069351452;
        Tue, 28 Jan 2025 05:02:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6a11eaf8csm417749166b.133.2025.01.28.05.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:02:30 -0800 (PST)
Message-ID: <ed948c5a-1d53-4113-a571-daf144e6d476@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:02:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sm8550: set CPU interconnect
 paths as ACTIVE_ONLY
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-2-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-2-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8msV3h0CGB6-iWMH6_YcPYNvXhDX5mcS
X-Proofpoint-ORIG-GUID: 8msV3h0CGB6-iWMH6_YcPYNvXhDX5mcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=941 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280099

On 15.01.2025 2:43 PM, Neil Armstrong wrote:
> In all interconnect paths involving the cpu (MASTER_APPSS_PROC), use
> the QCOM_ICC_TAG_ACTIVE_ONLY which will only retain the vote if
> the CPU is online, leaving the firmware disabling the path when the
> CPUs goes in suspend-idle.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

