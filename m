Return-Path: <linux-arm-msm+bounces-35957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E591E9B0D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610BF286F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFA418C01F;
	Fri, 25 Oct 2024 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVS1VXkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED420D50C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881639; cv=none; b=SiJ++r2e3NoaGXHaKbD08gdvMPhPapzatdu4yXz2akF2hou/nTRi6cJwOcWu/bz4ffNYn2rQEUSDZPws5bC/B6wcyymiyCy7QeghyfvP+ze792x4+hvbaLxvd06x0jpoojhSAOf5kTL/tTMU9cLD01Qq6Fv3koVi9kwUSvSJPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881639; c=relaxed/simple;
	bh=pHSh3XPSaFVV84kA7tilhdhkPW5JX36He6gVwTk2sUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgV6uYHLzTzskh89PP+zqGx/8OlupnQw47ab8Hy6uObN+Xjo1rT7Z8kywOp1nkiiLQcLnLRlYkOsnJ9xfhQM7dl5Q+cQNlRf5DAFuPT4Pl3K8XepTo1xIEyt/+ewYSY5Mtcpgm/b3CATiq97efwaTCYHYET2DgOFeBdlw574JYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVS1VXkm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PCJhp2026346
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVvgWoKlcV9LtUsUs6yWkyXRhBCiJ5gKYOTtTqqtPO8=; b=kVS1VXkmNnXzZMXO
	RB96+9SH3GtfraqsLuzYUkLUGIGlGiZbu1jkPwiAFiyHPSv5YUs8L9BLxA28bAIx
	vyxVRwKHa3G1ptCi9MnKnvcGe8ZYL1E72zpkRvfaWGLMt+UCf1IISoMHly0RLDk2
	+su8DJr8YA1P0YoWd6D0tlT/lQbiNRH7F40s24miM7hlNQkQwinjvg67ndtATaCx
	xc+dyeVsqgHbNC4jCeHgMieMq9sBkGIIZMoM5U7bMklfp98weGHF0Ta7n+tSd8BA
	Iswx6CsLF9TwZus82XfgwGxgkYGicL7eueSSqDUIZTxiDHkQg/sUhgCo19bGVtIi
	8m5drQ==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wt51t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:40:37 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a39c1b88abso3941935ab.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729881632; x=1730486432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVvgWoKlcV9LtUsUs6yWkyXRhBCiJ5gKYOTtTqqtPO8=;
        b=Xhu5kvGY5WAXRyaE/DzYHYQqP2Pin/xC5EsXC2VTrgbeQLd/VYkdlDEL39bJuqVL5F
         yGnNqTtK2RYBwdA1W8e7iByXrMy+wim0f6OU2N5Ly+c1sn/aV1WIMQYK6a/7dPlqnl61
         UbqN2RD1dSzApsputFejnhXnKBhUxdoz2gHZGzQBBzECTW0Xk8NObXa0IJnb5O2peyHz
         0ze61vBTidXaPb/vBxTWW7yQ2VK+XnvnZ5t9jhLvQ3XD17wIyDfWQBIXMnv+yaeJz4N1
         qHxBIRorTKc9/xQWCsrnSQJSLCwCjNLRvDTxKAQGThYQ7qcoB96Cz6mmxkEAfuNqb1y6
         n1fg==
X-Forwarded-Encrypted: i=1; AJvYcCXU+fGyE3pSThC8vnHD39QYCAUIQ8UTXv2Cmdv9DBz5PKTVbZeZeWqcKJ+ed2OINMEnuW6+w8FxaGhXPWVJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28eqOOGxF1ph/p9vVd1restp+UXXoQy7nw7ybtZyZfDY1QwtZ
	FfWrf0Izz/S0KRC/EfhTU0AaLZwmt9NNkiueXG5mTfcLsEx40f0YlvlFxtzTe9UJiXCF0C3Fw5Y
	LRvpsvTTB95RdL+lLc0HTyAiZ/AV1w4SsF1Pl9UDf8erJkQZ4gXcUUsHJGI393dUE
X-Received: by 2002:a05:6e02:1566:b0:3a1:a227:c8a5 with SMTP id e9e14a558f8ab-3a4ed31fea8mr360475ab.5.1729881631805;
        Fri, 25 Oct 2024 11:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjSzBGiWU/ckW48xJT/7uhrcEOsittz0zEh+q6ENMSKuiPW4j11zulREu0udCO3SUIwIwiUw==
X-Received: by 2002:a05:6e02:1566:b0:3a1:a227:c8a5 with SMTP id e9e14a558f8ab-3a4ed31fea8mr360375ab.5.1729881631352;
        Fri, 25 Oct 2024 11:40:31 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631b0bcsm861369a12.60.2024.10.25.11.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:40:29 -0700 (PDT)
Message-ID: <fae33f7a-aa29-4254-a846-cf90d49e0193@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-qcp: Enable SD card
 support
To: Abel Vesa <abel.vesa@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-3-46c401e32cbf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241022-x1e80100-qcp-sdhc-v3-3-46c401e32cbf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Jeyfd8l0W7buZReFDD7-EYdhojxNwOT
X-Proofpoint-ORIG-GUID: 6Jeyfd8l0W7buZReFDD7-EYdhojxNwOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=695 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250142

On 22.10.2024 12:46 PM, Abel Vesa wrote:
> One of the SD card slots found on the X Elite QCP board is
> controlled by the SDC2. Enable it and describe the board
> specific resources.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

