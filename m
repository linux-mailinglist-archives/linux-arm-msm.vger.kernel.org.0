Return-Path: <linux-arm-msm+bounces-43132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3489FAE22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 13:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AB1718815B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E51A8F7E;
	Mon, 23 Dec 2024 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCZPUfWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3001A8F73
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734955783; cv=none; b=sDrD70cuCWo3Zqe2L1leWymLudHzf/ZM9RSnXBJznK3d5pudIGQlws7kVBxLJHYigKe3khIrWpiE1S8eQ0N20MSCeOw/6rsblK30NeUmyzMGV/eeTxrOTl5q87ai3SXYuljIao/iXcvT2ybcTkaZoeAIzdAsJo+THnJP057WMqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734955783; c=relaxed/simple;
	bh=tcmvcK8tgvefKsps6FzdnOdxtsWbEvB3UCIW57E+5zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duixUA7sXOgipcfFXjGGBjPg0sROUWVo2yQUriv+DA5uhkAnHvCJbqETvz45TxRuEcCRHp7anMLevooY1quuCFNAw92GKAd6YGh6nL8GaRy1i37WwlAORlMS+M72HiA/I9JuhlswuNDaiHQBtHE1FWh+ZquGhdCOyQDr5DtIuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCZPUfWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN86SZ8015938
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r929DbCHRihEB+OW5i57mR0uTG1mxigmUV2XT8SL+W8=; b=RCZPUfWmhnlBQQef
	IA7D0cUVFyHqdOM4eDS/ZdFikBqfe0Bea8qAnrSVzscy2C2MHFrL7zx8CW43tSCR
	qfhZBl+GIBZNfTXpFF7rv3vpQ5LrA4WYjr1zIo1JaGHfr0TAUNsAF6Nw1D8JkG/0
	nE/hAiC5wNO6P3dvJXfH8wkAzGNiULR0A1MwkZSwnNJup8rwTxcE6UY/IBZPRb9u
	CtdoRYrLWjFjkbst6JwT2Mc+rt+i6Ah0JmJJF86nWtA3g09LY8V/vIfnoN3PPba8
	gUGX94f/YGycL6A9AOawLSCsJ6GgQE9cvF8EkoO1aK6WaPNxC5mWfxklM2oiuMK2
	PNuhAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q42g0njx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88fe63f21so10393566d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 04:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734955780; x=1735560580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r929DbCHRihEB+OW5i57mR0uTG1mxigmUV2XT8SL+W8=;
        b=RiiMCl3nI8k0dEgXb6eK9PgU2rohU/N8tx2n4VTulNMuM7WNO9NLAxL4wyxK8dS/r1
         ANS06ruFYjrTvs0o3wSzwVVmcqU0vg4eP9z8HRg2+lFdoTOS22ih2l/5aZsLwjZPm2V2
         5dl8hFx/x2q458sZWRizoQxGTFKmYQxyhd6+QvjjGrVM+Wx495ka+sDjCTblOLG3oAUV
         CBFRZYgPRYbzF1mjFxg9SO6lO6KF/L/tby1rxBSscIcl4dga6oKccAXU0Zjo9EjC0AEv
         xkwwwXFCAVef1PP+s9de7t5SVdx1usbSoPLa5NRQCd1abMQ7VR8ZIvUzEesaVefX41+L
         N0mA==
X-Forwarded-Encrypted: i=1; AJvYcCWsNz+ZGnCmsDRYmfbB/rXDr+z4TXPF6VH2IsX0pyGNqzNLbSiKZBdBAqnoPDnMA/MVd5gstZ8s1ygqcWT0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrUUmjfGT3YelkNeRZtTf2Xq3eZdSyUsygKgNwQ3GKBzuu4Ot
	5Dbfd1/GqM6v7CGW+n8uw54xNMuUeNQjQVPKoliEB02xKRRbEgFyFzTg+qd/T1DnGxyZchQn880
	xxOLcf0wqqaXLKEQYw8Qi+vM7KMUFBaTa1QKOn+3+pmDBx3eVWDL6Jv2OnIoVfA+G
X-Gm-Gg: ASbGncvMth2hg9ipTMVHDLyFAkWdfapzRXnhdsFr9GoAVzEGT9GyEGmMAd9qewPeQ4t
	I0ANCQ9H630/Bz8iw+G7nSEr7b6bUZGEaJweb4IhSG6Gj91RxsuofU2tma0Pwf7SsDIhupl4zBK
	e3O32jzduTrcPAFoUWnSFXxFjP+fvzSCvHYc/EyloK81hdGnpCQrJEX2K+Uw6GBMetrZqEXTcFr
	iXq1b1pN43YYeTFYOZjd4Hem4xPBbVlRkC9RXK4VTKBrHzt5YWqc1gqFlbHmYy/EDfyYTsWnmQR
	6EN52txjh6Et/fLJcxHpJpl/v41rGzrJMLM=
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr718505585a.8.1734955779914;
        Mon, 23 Dec 2024 04:09:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhGMuPXNgl8KWNVqUOywwV6OUHhYbRzVm+R6ExhUqI+M0K+BDgx9nh/gjBxYSkaWBokx9iEQ==
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr718503585a.8.1734955779526;
        Mon, 23 Dec 2024 04:09:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895366sm506493266b.73.2024.12.23.04.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 04:09:39 -0800 (PST)
Message-ID: <11a47f97-b1f3-4401-950e-5fbf6c5e1c50@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 13:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] arm64: dts: qcom: sdm670: add camcc
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241218231729.270137-7-mailingradian@gmail.com>
 <20241218231729.270137-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241218231729.270137-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bHBnzUYADP4nq8QEREYHpO_7_yWrZLQo
X-Proofpoint-GUID: bHBnzUYADP4nq8QEREYHpO_7_yWrZLQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=744
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230109

On 19.12.2024 12:17 AM, Richard Acayan wrote:
> The camera clock controller on SDM670 controls the clocks that drive the
> camera subsystem. The clocks are the same as on SDM845. Add the camera
> clock controller for SDM670.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

