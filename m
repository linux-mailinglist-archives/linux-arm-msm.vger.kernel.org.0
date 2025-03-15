Return-Path: <linux-arm-msm+bounces-51527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777BA62D8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 14:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE3E817B22F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C216D1FC10A;
	Sat, 15 Mar 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBkd3Wnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D11FC0EC
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742045862; cv=none; b=mK3dxxW2S541eFeyKn/5RfBdjevD/39g2Co3M2nUMSsDN85/2oWPVC0UVdb8Q1i34grUeTPnAwPk+W0iVI3jvJiKyl+F4M6Us7xesvXU6doXjltYEBi8HiskBkRh/LYr/cZAUkU3h3StMSF3tws0VPgd5umBmqt4N7/ZZWBRoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742045862; c=relaxed/simple;
	bh=M7HCNxc6+ULLaGJ60tqlxMwe2/03GnpwEGTUEfOUeSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw9dzHKuAO+Fi+yomT//buMGkPnr9DCxR/nUZ4+tyfEU5yfGaVnyu00zMONmvG2UfQOIDr2hlYHUqYXK9VA6L1AeHPSb9skmm4S1/A8W6JrglQ+x9RAL5gVyxlYfOGR5rBJuAJQ2bJgMppddnhtf/X/yKXxQ6iMlph8IjZYHzFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBkd3Wnk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FA2lMr003711
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DWUpv1hI6Be51QFuZOBU9rLiz5KUxl0EDZoZvkV/0s=; b=fBkd3Wnk4IOKpolZ
	HKDSZDkKWvr95ITEgJQ9hmEUVDtop/Y6bkNzvEI7QBYOxbXv4TitOncMlMuUo2If
	fhTn5Tl4YrwN/fbhacLcbP400HpuanLuxsySf59GcbK0ck0RIvievfbRYMkWlZx5
	dw7sRhNQtjJJ9CFtq+lelQce70XMJK03va0getE8PVz4cnYsL+tlG6w1aAeX/aRc
	UgIoDk5lGTGACo8/BlLOOgJjUs8P4oe8VVkZIXvs5mNeFcAxYGN+R72sMddcxdqb
	towvq80/Hwx6+/H1F7JU+DwcOZyOyF41pp2yhcQLKjzEvKEOdt3B7LkzGZuBaxDk
	h9D5Ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm0nm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:37:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so36945885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742045840; x=1742650640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DWUpv1hI6Be51QFuZOBU9rLiz5KUxl0EDZoZvkV/0s=;
        b=wI8xEsRxjKX3+LJt6j5tj4Wq6knLaf2yyPTRZDwGN6J+UCbr/WCtmsMEuGghNtvuhL
         IaW/ThLofYIh8ZgydIHJcJSxyMVHRcajvmJBjEQrdfgZ6VT+T6hTHEEmU1+awDD8Y40n
         7iB5QuN522rQ2Xwp2bjnoIg4LEThISaEbVYfgOlKYHVDuS+CraZGmUWxYFS/j+sCkxDa
         mNfFuvGbhcoGBjeYcyAlzbzPrvKhY58j98CVnG2kSYbp5C5OUGo8NB1Q6PCUY3Bwe3ox
         0AjK8eCW4cGiQabL1zKjTSx+d6V5YvczA/LrwclEBIG1C/zIBgbDsygrmw0vpG120eSN
         t+ow==
X-Forwarded-Encrypted: i=1; AJvYcCXLF459DsrD9kpmYVnegaiyeTne01Byt1sgczQBzwj5sDfjXb/Op/HItXNXMLD6I/Dnj83BG6ICUpCleF3M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6erGaLBffLoLkLMr0JFco0dP0NUKZxsM/UfjS4iVfu+SlkS7
	/t+YbFgAnygEcnaR/VFk2xdNAE7JBSoYgxZa0oMq8n99QASvNNExZ/reKPB/BK8fyDo8sSYNsmF
	cLnQN8tmXLiEG9FJvP/CdBn3QzpK6QYX8l4kJzw0Y+LefgSMtDdlbKtf1OqLZdLvb
X-Gm-Gg: ASbGncsD23gHwjW36Ix2srtYYI4XPzu3yBJ0JvdntgCAV2oC9RYJfb5O/TbsaRdxbrl
	H+2gCvKeB/IqSlaGQfJmsQqIAJHJwLVELLwfBGlTcypbpu5s1R9gEiJNioSpN6MzDzwh7wjbI3N
	npSPuRw4Z0jgb+rSJHCTbRWKc8fVW661Lou3p0z6mZMFY5lPWg8RsB+genTXqW0mk21mTU8P5y+
	tdy68VHlSf+IFSH9lpTHb7sVMR3g9I8cSMWPbwApoHIcMBFjJAhmFw5DzKlPy4zC39m0yxvG1NY
	srXhjB2eOEGA7au+CTgKd3GyFCsFvHjYLzmwFokB+Labk2G27y0/g37Fh2WOS6ZqpazSIg==
X-Received: by 2002:a05:620a:a10c:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c57c80efbfmr243595685a.9.1742045840321;
        Sat, 15 Mar 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5IYQOLUaJk0sMyhujqGoj6BeptOau5msBzGVpujPDlMP4SRkuy4eNYMV6ySVlRgZ01YD6SQ==
X-Received: by 2002:a05:620a:a10c:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c57c80efbfmr243594185a.9.1742045839950;
        Sat, 15 Mar 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe25fsm3217460a12.78.2025.03.15.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:37:19 -0700 (PDT)
Message-ID: <a6779d4b-d4b5-41c8-932a-62cd17c9d021@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 14:37:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VoKLgtOLoMinUi9tuWbHnyhk5o60H05_
X-Proofpoint-GUID: VoKLgtOLoMinUi9tuWbHnyhk5o60H05_
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d582a4 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pUt0LEAnZhKoKCINpSsA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150097

On 3/14/25 9:21 AM, Luca Weiss wrote:
> On SM8650 the CPUs 0-1 are "silver" (Cortex-A520), CPU 2-6 are "gold"
> (Cortex-A720) and CPU 7 is "gold-plus" (Cortex-X4).
> 
> So reference the correct "gold" idle-state for CPU core 2.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

