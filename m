Return-Path: <linux-arm-msm+bounces-62477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 355CDAE857E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E338163065
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116422641E7;
	Wed, 25 Jun 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4cMehir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8C263C91
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860193; cv=none; b=J99vwcRp1iMZzzp/3HWwtsSPnSuOUVMOUosFsnpeS4ojfySrXSFjtzrRIYFVueQmNPqsyTDg0Dk3Dw/GnFRK4hy5/JyZKrcTsFyyK2pzP5wI1BoPwXNNfUS9TyUx11M6tgp9lhSpf0d9fh1Usrtutowo/RcI83zXKz+BWueUtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860193; c=relaxed/simple;
	bh=5zMJXwwWW08GGXTySP2knMOGm23otbDvAH32Yql1p7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCETCSeG3/k9ALsYh7UdEh7GXWQR5V+tQ69EUiewXpoEDx9ZsYc0iJlgoAs6s2SUMaHeEFKxh2zRszE8wg200xv2cSArsK2Na1CCGs0EndlRikcRw1IZpFgJHZARxyVgmNtauCFZlQRSkBP+QrjkEuyt6Bfw/6POX0xERJFkvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4cMehir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDCpCY023113
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=; b=X4cMehirXtoXBVvk
	ABmJsgAVU1YrN1uzZ6MEUfYF9AjNbW4SRjuWooTtKuxPC08owya/wc/Ckcyn+W8c
	OVOQ0H2BfBGrhgvhlX0VXyTiKmW1nsD+xNsyLqLuJy0edGOtiFXIK19qvKw86ZAj
	fcdo6v5zEd2tJX9qVdC+0rYnGPTxm+l0hTSE9T996loTAcNuGhLItlIB6mk+Zpoq
	FtsMDXw9IRBU7XSb5F4dyKD1G7g3hbMdXNGScjC6rtUasl+tokn1kXKiYoGt+b4U
	VwlzAo4aCBIRAyS3h/kjvHW6TGi8v1zUvzalSjARgzEZj9N22tLApLFw6QN53eJ9
	fFoFqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgg4hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:03:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3eeb07a05so90567485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860189; x=1751464989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=;
        b=pDJTsCPbf1YXdUSbp85l0hIJ5br/0vBOuMvmE6aKF9ujTY60VxS4kL/IxiVLV6lxpz
         bwz2ypYCY80OufpSH1WbGPSzG3Q7ETPxyX5yiIMXCovZZcjk73r7cZRaGIc3dutYh53Z
         StweYsddtnTmmGnpYmB/OMPj+Q59lii6H8z5M+etFHNnBs4rJ9aK1swCQ2P3Wgf9IcD3
         d9+snuai/xGdlkfvd009uOkIVFb12hEEKldd7gBU14g4tupqxpp1MQdjYHMYajH7Wtaf
         yBJ6UByphbZA4LOAhC+Z6hj5LE9osLBL75QNrRdrp1W1GSWrvgLEQuM0LZzWzY+gO21Q
         W5+w==
X-Forwarded-Encrypted: i=1; AJvYcCXDlYGKx9CvvmRm3zzbnnabCFYvBCoqADOkEuOamFqr2QPx+1A4+S37y+xsywY7b70Ko8Lm+lCq/pvNmtjs@vger.kernel.org
X-Gm-Message-State: AOJu0YzgMT8fAiipHgUu1Zhvj2+FXqdxIO6Pzomo11t07n0ZPGd4dV6f
	h59DRcrlOoB5TQLULfkQDj4dNU8VMJuWioWsva08FS4Ic690GFyohT5pncckkLApfWlYJ1c3F7o
	Daw2Pftz8D7wfXW4hwifrSYFxcErDB8/bvpNxutTbTdMrYYDgpFcOsXW4+CFH6hda27BI
X-Gm-Gg: ASbGncvbB966N5HX9OZBrHcTwiu3MtdJiUtG6eReVXvrKiLrtg7qc5UhoEp0RS9lkwh
	zzgiPQ7K9Re2w9DhqjdZvBac0yca2O2AgydPn1DVOK9odC1v83JMDRkCu3vVCQwuMGNQg1VY205
	Hf5ORpNWw0+zai5H80DE4kgZE89sxe21lG3f3LmXBogi9Fd6kmi1AVVMCco0sEulGO4re/T6zD5
	MYjAF/0UaEqFFeMUMf/Gh8cqRhnsWJTrkJV26VufEkMmfjbMS4zbuqIS4dOeP2o0+XhjOynUmdv
	i8ZTUVHargp4+5HUMr6AhnTJHQwSB4M5Q0CfYyW+K7fx8GZmruNLtVODw8SNJlHuHtlHFeD0xUI
	VDUU=
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151197785a.6.1750860188793;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdIBsWsp4TsebQh9ea0CxfPNx1LapgZvLTSmHhJ3o+vsH2NNt9o3OqUtv9riIIP+wKvxF8wQ==
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151193085a.6.1750860188053;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm1067888966b.148.2025.06.25.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:03:06 -0700 (PDT)
Message-ID: <8ed0cca0-c2ed-47b9-b2e0-bbd66e133f78@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: add support for pmr735b
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BMhiGKY3bD2k3qjpO406ZuP7TCyQ77C5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfXwHOBeOK71zY9
 QCDrfLVYoFHEOiHL8pyN7y+jm6pON6PpJVUL5P7ToaND5YB/jy5ukpF/x4hmC5ddmVPEfizqniI
 mbh7GaR16Qy7j0b/2d6GLJLOLCT4jwyLSn5N/fjBgNAoeewf3JhlKrckBn2A2LZdppfXbgSKi24
 5RYnhBPgzoIbU3TQtjon5gE3+pf/srCLY26taw15tknvTHnf/8+u0GJZMwC20JTznYWUm2YR66B
 1sDzthYeS6CvQ8dYKUQje15X1Rtp//1DopdITilo71w4Wsw8DOYhX/aRk36sY5maoVb1D7Njtbi
 om+xmBrKDWbVqvREHDIW3huaRxgQKFNZg0r/h6ECUaNsMTslpFCphd/aCg4NpMqrC0NNGQooSlM
 SiGODxS5TlmCob0pvzvaCWpYt6b1wlH/BmKCtuFhwQ7DhkGthJ+MQbAyx1vXGZAs3jOvNqa9
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c019e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FIv874YiPNcmhJNsip8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: BMhiGKY3bD2k3qjpO406ZuP7TCyQ77C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=935 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250101

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PMR735B PMIC.
> It has 12 LDOs with 2 different types, L4 & L10 are LDO512 LV PMOS
> and the rest are LDO512 NMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

As far as I can tell, this is in order

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

