Return-Path: <linux-arm-msm+bounces-33357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F3F992B44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89CE01C22CAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66BA1D2215;
	Mon,  7 Oct 2024 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrE2Txgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD11D2710
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303230; cv=none; b=X0axea3pgQc5sp/5cN8VxKjXHRv8gZIV28lwfVxgVvtXKAePQ/oPkfqxNDQ7O7MtK4W9W2m5g0R92rQlKxOn5AZc+wyHzvgAynYEiXpBMTlzNQ+b5Z591pUA9z3qy9uXFapM9xuriuyepbbtW4Gnw30X5CQXhVkgQvYO9Cvza8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303230; c=relaxed/simple;
	bh=Rl4liUaRxBnouuBBvvdQT4+sWNCg42lUfKgcu3cLD94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dj9anjKaciOLrweTPSIg5+iguiuxa8v+YL9kJ7n9dwivH1kq+mOU3RmkODX4WMvaXW92I73TdkcUw9JKlzjr79V2l13gHQoTrXL7O7FjikVF0Or6/EzMu4sqznS1If726YwLvyFCItthJGQ5SKo/kiYIOS3ZKtMzD9vGW5AqTOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrE2Txgy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TAh1027163
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Oct 2024 12:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsTKeE4kFG92QsawTQvpbz6F1lqWQVaJIVgDGfIY4DA=; b=PrE2Txgyttu6ZGXv
	GbQnczqCZJy+IL/g3I2PFTk8wq/PlzFaRX4RgeCx82nKAPbYMbRDM0OBeqbibVZ5
	qzQqqMkQKWl85s2sfILsvTjUPTNItRlkrIh8+nBiW7sBek07a9HE3rosZhKfda/Z
	28ZrH8NiUikdvvBWbwOjZ8fOFDV8pcn86yS5qIJhHxfQtLUM1YkiLStD6jxfK+S8
	bkc+n9C5iLOTi7DAOiOfOG56O1k5yxZq3lxU713OSKgyTDQTExn8hpbqUsQ0dogT
	wmOEFxX8FYGOMMQ2jF48yyOzrwadpcZWYqssqn9QMkzAseEzUQGk+vzCeucg+cCW
	mHJMNw==
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9v2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 12:13:48 +0000 (GMT)
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b2so1032428a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 05:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303226; x=1728908026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsTKeE4kFG92QsawTQvpbz6F1lqWQVaJIVgDGfIY4DA=;
        b=VTFOO4kKem6JM+1MFmdfz/SrXgKmorHs8eYjy7rQqICYT2h4ccx7RC+fWe7NSR470u
         q4HRJbor/JiiGKIDIiYhGO6WQV1IEMetK10KRbX/P4XewkRf8K1rG/plxLunzEKZ0kuR
         uZunbEkXJ1UGP2bnFL6AzmUTGQSwRA2+bU+xIrPY2xdkrqbL61rXi40PvPaQKvpTfhNm
         /LsyJppQjvJGPtNBc2jEJlVRGXagqO3Vlq4nrciro6bMFsuhqc1B3a7HVNEspQ0wx4k0
         zXkE9bGLCFiDTVwlvEzEz4TMN5/rugnH0qocXrIGvVqXzXxGdJCUQOSfOBx3ZmlosVOQ
         yI8w==
X-Gm-Message-State: AOJu0YyEQX4muP0kMZCqryi7C5v6p3HnZasC8pu7PuUArTNTzGQFwrdK
	M0XTQk6G9CCKoDDytO/c+3+16ux/tsCXgrwa/j7RF6YbRPNvJAA3z10I+f2jy8X4twDb75B1zj2
	8Blf0xF9EoC6zONwxKTbzwa6tLPkqBUyYv5fRk9BUKxV96g6TGLJOHCKPwWWR/9/A
X-Received: by 2002:a05:6402:3593:b0:5c3:ca96:3cb1 with SMTP id 4fb4d7f45d1cf-5c8d2e98986mr4454209a12.6.1728303226164;
        Mon, 07 Oct 2024 05:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEUHy1e1GVRjag7W+sF/FYdwN1bMc8bFNqWZQqVx29m/yszefcmjKsr1aF9Spv+mpfIt4T5g==
X-Received: by 2002:a05:6402:3593:b0:5c3:ca96:3cb1 with SMTP id 4fb4d7f45d1cf-5c8d2e98986mr4454190a12.6.1728303225414;
        Mon, 07 Oct 2024 05:13:45 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eba16sm3140682a12.77.2024.10.07.05.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:13:45 -0700 (PDT)
Message-ID: <55d1a79b-0220-4b13-b1dd-0b34eb1ddb94@oss.qualcomm.com>
Date: Mon, 7 Oct 2024 14:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8450 fix PIPE clock specification for
 pcie1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: klMWajW3Eu2vHWh6M45acPx5JDRXasVp
X-Proofpoint-GUID: klMWajW3Eu2vHWh6M45acPx5JDRXasVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070086

On 6.10.2024 6:47 PM, Dmitry Baryshkov wrote:
> For historical reasons on SM8450 the second PCIe host (pcie1) also keeps
> a reference to the PIPE clock coming from the PHY. Commit e76862840660
> ("arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc") has
> updated the PHY to use #clock-cells = <1>, making just <&pcie1_phy>
> clock specification invalid. Update corresponding clock entry in the
> PCIe1 host node.
> 
>  /soc@0/pcie@1c08000: Failed to get clk index: 2 ret: -22
>  qcom-pcie 1c08000.pcie: Failed to get clocks
>  qcom-pcie 1c08000.pcie: probe with driver qcom-pcie failed with error -22
> 
> Fixes: e76862840660 ("arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

