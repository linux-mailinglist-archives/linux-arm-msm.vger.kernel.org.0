Return-Path: <linux-arm-msm+bounces-39088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE89D8562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD8E287767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E2B199947;
	Mon, 25 Nov 2024 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNLquEGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4A18872F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537362; cv=none; b=NkmBGqbGhENuVsegL1otzrfYVdTYqDp1at7DVHH8ON7to/ztXqUPLlznPeEu2ZPvHv/DlKCWT4JTENRSMHgfMfcdAV8Xy8P5pC8UZADkv+KU8YT3SAgDg1gClmdrnKDu0k91dvYl49RROd0YcZS2rSc0qtndy19GFOVUoIRoFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537362; c=relaxed/simple;
	bh=bf/hjz99DiiGbSoXbH318dR4pv+yRnk7jBkL5BZdmrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PaP7hEWDA4pS+rjSqu7NoHFnrbql32Es0o3G/SRYrD+5i2OeroDGHazb11I9Gq1d6YQBNSeQmO2ALTCUR+CMSiLBUkoeAaNHvR0KCU2p1vt2oTvBlsDOaa3sZLicjXGmTkOmdGHRnnQV7R6sb4ObczOpBmR38OzugCLeqiu/LDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNLquEGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAsCBr004853
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lGsgBh8DX/jnU4tUYXMAAVV50pnLwHeeReg1oTVAlu4=; b=UNLquEGoHdX7qF5a
	BpFSsqJ0XeN5kVIEySitp2WQ9UBVp/BFZX9eUrU5HbMPs+f8dg1HLl71sO6yqajS
	ZvfA3cjoGkb5KdooWlqkZ64kMSAN9RH8D8gBuL/9w0MB/cyTBHGIUoKmyI20GLJl
	y7N4Yeo2gzdb8ymmnm/yWLCVhmOWMwlR0enKkSDvcTAIz78g8eAb1OA4J8kdCSk7
	syajxlatH9wixOkEooQOSW//s7etUl4LjZdypeXozwqG4UoQgmbXD7wB6+BxqI4x
	afHIR6A0S5/tdwqL/QIE9HhhpKh8zCtSdO9TcL9lLU5KC5VhzDBZdM6cJxgthWHf
	at2fdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626cp7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:22:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46680667b3aso2698521cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 04:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537359; x=1733142159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsgBh8DX/jnU4tUYXMAAVV50pnLwHeeReg1oTVAlu4=;
        b=Y7MV12XVrSnT4tFXN6hLwyJdXIqrzE/uyE5t2fYY3uRzgARgjvEpoQIpjk6YRepCZl
         YQI8tu6sraeTx1plBBwOug7qH9FZS5DCsGDT5sxYyMXqKIqblDmalV/xAbf6vxPKBgEK
         hudySEtfXM2i6Cn8/+5ttEniwvUwlVMdxFWpRrxZoDga075iGmhgaPGzN7naI9evo4u+
         YRaTtGY7mDA/5+sugew0Z0bli3ZfZ5kai51GXDsFrbYsotVopuv8dYg6jIKOAqSD7Kqc
         IyocxI/CupBBKOBrUpb1gv44e+7z34dgv/KYAVDN7Wo13J1UQnv5RT03ZX8XEKb0/1lo
         xycQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosJhgoHxCGDhfXilnJnB6bc+Ab6u919k+5SP2+oFiTa/k9vHE0Q7mPRZd29uMO9pT66mx8hxZG/bptpjY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qi29EsSN5csB9L+8ultSsB2m86AyHw2J19wE3ybPD0ZkWCFl
	BLdiK2ftXBtWUMBhPJ99oJfzGhaQHCx7+eSe++IfHAKwnmgtV8ROqjfe4xml0gWcNkF9+oROjzm
	qYwh7f4xABs3FvXrqqZPEpHJ4CJ5M+r/u4Cy8TCeMHuMmlx5vQiiZiGmJh7b4wdgy3T5eKcNQ
X-Gm-Gg: ASbGncvqMBZwnMo7ytup9Kqqm1MLmbKvXjsjdVzzmNqZWX0iKUrv1rBfN7CKOgeyb7k
	i5P5XL0nSzGIConypOrpLLRvoXfih/JWydLb0YYA/rmy2Afzyo+69n9NtkpLvIgKtv1JIN9D7vw
	wagbFpAnPKRRcNmsz5VaeYnebH7Pms3WBzkbyHTY0tvE5ycA4evQo4XPrFPlGy2zibS22GAIhkW
	T199j2n5r1v/v8hQvUVnzAYq/ID22+tA/mEJjFOJhl0sphulmET0f3uUsKAXwph61xr+FTullb5
	d8QZQTYMXKxz3Ud3M7sr4Zo7B0fV1sY=
X-Received: by 2002:ac8:1246:0:b0:466:88ba:2031 with SMTP id d75a77b69052e-46688ba2359mr24593421cf.13.1732537359001;
        Mon, 25 Nov 2024 04:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp3cHKk6o39VMe0fU98GsfCHedykBDk3Eeru+jtD6QzHbQvQ5UtCYJJftsXO/hkoFpN8NJWQ==
X-Received: by 2002:ac8:1246:0:b0:466:88ba:2031 with SMTP id d75a77b69052e-46688ba2359mr24593201cf.13.1732537358419;
        Mon, 25 Nov 2024 04:22:38 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41ae1fsm4042118a12.79.2024.11.25.04.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:22:38 -0800 (PST)
Message-ID: <b13f35be-eeb8-4e29-965e-a7ac3cc4d3bc@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 13:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-3-002b723b1920@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241124-asus_qcom_display-v3-3-002b723b1920@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wlTtPtCXlUHSVkT9Ij2kJnAGFvkdFyE-
X-Proofpoint-ORIG-GUID: wlTtPtCXlUHSVkT9Ij2kJnAGFvkdFyE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=740
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250106

On 24.11.2024 11:00 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add the lid switch for the Asus vivobook s15
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

