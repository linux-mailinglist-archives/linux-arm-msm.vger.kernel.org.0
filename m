Return-Path: <linux-arm-msm+bounces-50708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD78A57B86
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35ECD16CF88
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D98F1DE884;
	Sat,  8 Mar 2025 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LesB243q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795334D8CE
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741447039; cv=none; b=t05WIVK0EFNbz8HYx0dEfrN5Y9Udq7DGG9wLL6d+O7V0S8YIx0I30vuHRbPAh8xvN7EWnt+VUsuBbhmieQx2k37+ulg6JVQo2mYAu4OOU/5lsRCt8+Gklx/U2ifyww4WL9cNffXZBH3ffhUL+VrPChMMW0JQgvVgRXnbo6/Kfc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741447039; c=relaxed/simple;
	bh=eHD1UOflqnibS+rNcgWGWII/4Eeo/dKZHtQqL98tyoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie0+5BHGv8fZOivbadKql/ZZr3ZXDnDcZ6e4foCr8KDAG5zSpM3kLbh2dqVRgfew0l3VaKR59cSKakmGjl34bHmH3nVnuCpPryr6lspJsWaE55tQXc5m7mw7CG/uOUsYBAFNDFgvGatn/hcLtE/dxlKa9X1lg/ZhE76pmkl9/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LesB243q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5289HKm9009065
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 15:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	re5UzEZ5K6uVdro9hKWQbaz4oQpEoaV0Io0NxF4iFsE=; b=LesB243qK1RsT5R4
	qtOpimO+KyBkph3WmQMTmzJm5TbTR9+OibF+k3U0vlCO7/lYGdK7sArDnvMuOX1F
	chf3D2u3lQpgSco5/qniT6N9hskJm362Hf3IYxb2JrLMjO9qM0Mk2y8FZfzkJCVx
	3JgnYwXpd3njrVtqnSpyoSYjhgMPN3B0HXOZlMvcZj1M0vFyuNvK/oAFQHzDmG1j
	VEjhU3KdpWPQB8j874vNBYAhmX5SHihBFicDSOsB8Pl+6Z48l5Wmt/PYfGriVhUI
	i7hv5YwSNvC8ujULTkCvNH4RilaHDuY16md4xiSSKPcBFs9vVai3ikXfty6qirmw
	wSn8OA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpgr5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 15:17:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so14968685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741447035; x=1742051835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=re5UzEZ5K6uVdro9hKWQbaz4oQpEoaV0Io0NxF4iFsE=;
        b=SwhcK4cfsBGTn2aJe8SUEbOpoHy8f3aNVwEuhRJe2JvDeESh7U0F9rX9uN4OLVyH3r
         Duh38X5Tmr7vYFyAYLdhawAsRNGZ6E8YT5wHVRBYS7O78Xbfks7EDQxOKbRb4VWfcENO
         k73BlATHX3YPVykeDSUPPQCZW8eCXIdbNarM/6Nu/T8WUExgVOhNKT8PecGq7UiKHg7e
         zuPrOCNmynVRiooemdm8h2C28T9/NWNNukQPm0L/Mj11pJvf3uDDMeuo+s/VTCdEb8BO
         R9wDhjnQ80ZWKmtlFF6F/gver34p4U+Na4f5yJjIlYWjl/BeEJkpEY+mKp5QHHL0aK3Y
         JV8A==
X-Gm-Message-State: AOJu0Yx4Fb9J2Hdu9mN5r/LQesNWOolb5GvkwnmJ5KlVJvMsk7rQeBMy
	iyKFGGd2Y9fwQzeIoSOP2KSJOYKggqmHmgvFFMsSZGjGk2+hukDKhEhctpONF/kwLjFmC6h6bO2
	akBfoHECUgUaQBnOInWjyfUrtsGaertIegCCt7Rqgq/Z/ONc0U6OHxriuEB6UMAEV
X-Gm-Gg: ASbGncu7tPzdfIu9BZhjVUXl5gHNaqcQZkZ/ENUwXIZWly/y/bAlujFmb1oLfULkTnE
	tuaUVs3X2nYvoNINHfF+X4cHqFwPGiuVsMX3u2RNEbtDmkvnJNU+7iklryKgTSdxRVFmAVXCzs/
	wnkiIShyRf58KEnss5rZEG+yCiHYrP4/Aw5EA1dfnJdon0rbzFfpDIl6uZn8SyrQ6RY84bRWKJJ
	pp34mXI/hdf6uYv1H8HO1KQjpJ9CMhRalBBUnC6LlnzAgTwdHKR1rN4MnjiSv/LJ6FPJ3grr/dx
	EpE1ePvxHfvQbuuM4EN5x78TNQuAClOjYTPSe04aRcweCCfTjgWhaHCq8Y+bsHpSrk4qCw==
X-Received: by 2002:a05:6214:5289:b0:6e4:3caf:c9aa with SMTP id 6a1803df08f44-6e908ca7100mr16888506d6.3.1741447035365;
        Sat, 08 Mar 2025 07:17:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXqvQTdLBkyJnbcjsyepOHJUD5AVaMnkEXC3SHRcGgUUebagk/n8W0aVAJDr231t/iWfulzA==
X-Received: by 2002:a05:6214:5289:b0:6e4:3caf:c9aa with SMTP id 6a1803df08f44-6e908ca7100mr16888306d6.3.1741447035019;
        Sat, 08 Mar 2025 07:17:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2390fe76csm447136266b.0.2025.03.08.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:17:14 -0800 (PST)
Message-ID: <a366082d-419f-4bdd-bbd3-5771f6ea86c8@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:17:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix CPU7 opp table
To: wuxilin123@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250308-fix-sm8250-cpufreq-v1-1-8a0226721399@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250308-fix-sm8250-cpufreq-v1-1-8a0226721399@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZxOz3QzUTQaPZWaU2izEwgfTesKfNzLE
X-Proofpoint-ORIG-GUID: ZxOz3QzUTQaPZWaU2izEwgfTesKfNzLE
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cc5f7c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VArMjV_vRDmCgQX4rEwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=964 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080115

On 8.03.2025 11:27 AM, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> There is a typo in cpu7_opp9. Fix it to get rid of the following
> errors.
> 
> [    0.198043] cpu cpu7: Voltage update failed freq=1747200
> [    0.198052] cpu cpu7: failed to update OPP for freq=1747200
> 
> Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


