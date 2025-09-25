Return-Path: <linux-arm-msm+bounces-75017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5CB9E216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E847B15DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2D927814A;
	Thu, 25 Sep 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIVJqFuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3A25DD0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790328; cv=none; b=gXsAKISO9RAEIzDjF8/od8wQOHy2sbcd3xzQ/MK2bH6UJqGCcOL62i3qF+IsY9ry7JVfT5t4oGmaBKszG1btuzLBPQ2iasqcIQ3z9+nnprY0rEci7FXLXullfgodZ7wASKCDp6vUh5pxKt7OGiYMEs3WoXVCDaD3YmyQZlHCNGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790328; c=relaxed/simple;
	bh=5CdlDKUVB9QrsAnAjhap+yjft9sOIESYZShJnxZLofw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvgvHPIofuXFY4gz9ox/vgMaKAD2RyyvyW0DI0vkG3WveZVNS1ZTNdoFua+nu04INWkDqtnuMg+32H7MMBWNaelGAmtxq7wB3plnRF78woz1S/jtCpmMr7AIc3LWyTrlFy1D2FqZQBWkwWb5fNLlpHEPguc/WT/B51meVNTfwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIVJqFuO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONvtxC018678
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6q9KyeGlZiO6mOJ2YIcgCuXOHQCn7ZmtQY52fCnxgn8=; b=cIVJqFuOnXUcLd6l
	n86bvykbaZgQPMr6vlv5CEeqeGmR16EFmbuo5Ewo7P6AzVVOYiWTDEarsgT6EAm3
	ECJGUnoO5MQOhz14j0pee5KyhzxGEnZphUCfluVrTyVBKFoZUA0wFUA+ehLSsbKl
	NmWgLlbiRi2OvfTd32w55QjXVQNBgINCp6ERWc2o0P8GkhAzCVCo/HOWERoBWeOE
	ozGmZ2/rJEp4dH2geNFsuXaV0GtpXSoT5OwfXR0051YcZrIAVC6kBO05aIRL5lPh
	v2pa4men/Zh/rChylItKVu/DeTlVtpCUPzDiFfPo4YQE0meVsvUW6f5kyLWPdPzV
	5SafRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbdby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:52:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85db8cb38ccso5431285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790325; x=1759395125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6q9KyeGlZiO6mOJ2YIcgCuXOHQCn7ZmtQY52fCnxgn8=;
        b=Pd/FMyTe0rJzT4y0FkJ8e98C9uNaYQFZa202OtcgjhYhiIhVHeYgft2IHYSYszOjMl
         dyLUZZsYW8CIehzYAoiyAcQKdIb/BNsJp467vzxk5YNW6GICCDiQJ05BRb1gNQ4iwCLt
         p0eFZZIKyIPCvFqz9sDFDsTVP5h4tJUsHlNVf1Sfc3GDSRhSVfUb35zL96g1B0fspMSE
         4pQr96/TwpY3QK4OT/2fT5Jjp3bMuXhPG5AZJRUJgWUxo82FFNFCYu5yabJQAs0i+W9u
         fxaB+Z5KEST6GesOgCrYU92S3CcANdZc4jsyb3bD4u+ht7xcrLiiYCs/tVj57/xuaczT
         mR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhKfURUpf7HxibJR14SFX+X+WxnLzNpYwTJWBwZ2wcZQSgO+ljMUVXa74zPvdiwVBNcpfI50eYqxVOP8o8@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxgK7BNr0xUI1nY6tcX0rS+7XvXFhHOXqmsmDR/n4ezM/txe+
	5UGRJqsynwE+lHtvon+3BTyujZtNP6HrYPnEJVuty249RyuSasBPe+VJR6TldhCUfJDA3nQ13xZ
	zUD8RCWokcCBajHYs8qyIQpLMiujEMV0XQcUNkQhYM1zwK2FOoU/pyvR7kFQbN9f1y244
X-Gm-Gg: ASbGncuRcB0N5sdAmRP2wtA4ycZoYqO7NrjUYPURikrhGZ6cKUGeKaCwUgj4mGo/YQ7
	R6B0c1/5l/abH9FXdUGtxPndUle2eO/DUmEm4KIFSfoZAizcb3qrdmm/N9Z7s/jn/L2R8IlMSq3
	2M0fuvqpCN0iLca9mM0cUvaHiSvXCVFWvp6zBKPuWfp8uKYF5aXmvH3ehagNDsIlJ5t2k6GYYLP
	kZF2kKUNcihjKJ65q/ynEG3tDtc4PxupAZc5wqkXgO2id6lVMS7dgYowgAnRYUUkbC58xo7ZivJ
	F3ke8PiUjHA7CVlYWP2r8lCrFKZfbW2e0ELFAKSo52mCW7/vzRc2Qq3OFXelKszFkigntdADj68
	RP97VRcwBnyybp3IY3lRbYQ==
X-Received: by 2002:a05:620a:19a5:b0:834:bb79:1d71 with SMTP id af79cd13be357-85adeb4da12mr213158785a.2.1758790324957;
        Thu, 25 Sep 2025 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNp/joGufj4XiUUg2TcpZE2WBMvPXFR7485Ym+rBlkUiNYfsas6rWCqt0HnxYFW+HuQ8foyQ==
X-Received: by 2002:a05:620a:19a5:b0:834:bb79:1d71 with SMTP id af79cd13be357-85adeb4da12mr213157085a.2.1758790324466;
        Thu, 25 Sep 2025 01:52:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f586161sm123061566b.36.2025.09.25.01.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:52:03 -0700 (PDT)
Message-ID: <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dc3e0S16YZjMQqhCImnesWsNFToAGleT
X-Proofpoint-ORIG-GUID: dc3e0S16YZjMQqhCImnesWsNFToAGleT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX/kt4E+FIaiQQ
 DMYbsTczJjcz6M4VCbpsE6rc1IbKG4ZRxKu/s32G3KruDCd5dn5+bK+qaQMcpLs3bqDlaxfKJxl
 Eb3m+rxZv6vqBVWbO7YFPaYSkR5Su1qUTu6U0sjsbjbKqRlpElEJhSRYCTwLBd00bLrbldgUosQ
 L39xlyQ/KBeH0G6n6Gwb1bKligCi9Z5kxU/D+RU6dqiI4OcgjakjjFpTw34Ivo8yyFxaqQhPtUs
 3gbtuKDwTwFls2UShlGmV2sz+V7KweC2Vxiif/js9gfccryXd+p+cvCim2B5q7dibu11MXG/BLq
 Aoi9SGc6jGx0ZuVjKmx5Qc+Oc0VAmo63oXgY+xGPxfFHu4vutWnQ4LgYdSA7s27bHN2c4OMLGQo
 jYTQFVAI
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d502b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 6:26 AM, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Viken, you've posted a lot of patches like these lately for
specific boards.

Should we instead push this to the SoC DTSI, to limit the boilerplate?

If I recall correctly, you said these ELFs are not vendor-signed, so
it should be OK to have them be assigned globally

Konrad

