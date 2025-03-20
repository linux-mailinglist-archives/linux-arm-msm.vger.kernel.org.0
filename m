Return-Path: <linux-arm-msm+bounces-52035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A57A69D45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 01:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9C13BD5CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 00:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6023641C72;
	Thu, 20 Mar 2025 00:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gi5o91E4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AB3F9FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742430485; cv=none; b=TcwWFQd0DAw+lEuSr4uJRFucIFg1e2xa/KXOJZqeFv6FtEhIX7pq5LtzdGbNgcFKBjwfelRFqtNt41wNiX73bvTDBzVmxqDkCix9diJL6i3lzgRzQtyGlQARqh54Uted17TytRxiybhTJ8FgV7Z75Ya+Kfk/gV99k7qmqoxyuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742430485; c=relaxed/simple;
	bh=2qs1cuvD46SBrydJgadWII8lRtKQoOFWIoizL7GKYSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+UME8pesWwdTEMTGGoujt/9iWXI0n7i2NpoFZLCsPv2WWil3d1mUu4IgmHM689thLSMGm2DPSqL2CzgF60hy/VjhSHetFEVOuT7hAD3xe7SojmgX4MdZrRLPJGqbfKGPXjWf3cpMkcnwokKrHbaB4Vimr1tRK9FeFvf6f2W91o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gi5o91E4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JJ5n5d023374
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 00:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE2/Fwxxcl0azqiRllzegxykv0hgN5pToHfBcyE+fWQ=; b=Gi5o91E48NR2x7Tw
	xh5PIn0J2Hjw655pGzhxI5BLxc1BUgPTK3n8wuqxcro/+Yy8nrg4RFWd2fmzB7G/
	Z0CWLlM7owdqJ0zppJ+kiNR6xa5Svz4OovR/kDU19Bl7GPqtVDoDwEJFQ9fmvxdj
	FNINQ9TYmBBT5cAlrPBAvHCnCwjYHNKXhajQpvqKencIHIwQI54bZPh2LaUv6WwN
	AiTQUCvJfUkg06+/blzrTlMOmsCsYiF9mCd7VtYhYRkPWF2oWRpbq52cfGgnkO7J
	z96/2vrFDC97EMyraQlQ3rwUFFB5EJUu0Gj5kcnNupL0u5FqXtlbciU1YD/ecfmA
	gfW8wA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf0mtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 00:28:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22412127fd7so1838385ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742430481; x=1743035281;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE2/Fwxxcl0azqiRllzegxykv0hgN5pToHfBcyE+fWQ=;
        b=ZDQdEcCnXmiti3mXF0vu4PHo9bZU/mQGmBaLRbFzXCS0lxo9AU5fDsMIyZUtBmUr66
         2ZT1dzWvT9vaca6FWTDPMLq3itgkoQmURJDR3ibfHXTJd226WeQC8tkdvUaLg2IdYdW0
         HHiecsqaTbT52zGz7LHCuymnSIBy6a3UbFl4rB9SWoHLrwo25WdEo5bNhPiI+1n54KK0
         zpOZYj8iEzsC53eD4ar12p8hejCmILIMU1h8L9pRRRceRN4tC0C1P1XA6NFXWuDKISNp
         ofEJPzum73F/4hNyk7rAe35xfgsOhs1algrUhmTchWEwCjIHVNtMQrGmtY5RU4Tvv+CR
         c3lw==
X-Gm-Message-State: AOJu0YyNSZOU15GYdWvHSfE3jpUUxW9kLlcaKcxR0MDvaSDgLfMGO6kM
	DkhHBdlQWRgGHyaRtm2tD2F1CF5nLEGi12vXyOHhsicKm0U26jKBOYWLFo5Pw8ruBgpDbipQrLk
	3VXhl+gqsg/tJhMz4F2pZvUXnt6vu8O4GvGU7fCeCRir8n+rxL+H+AfWLYdrYYNTN
X-Gm-Gg: ASbGncstN+Rqq0ZFShMuA38ULY3oEPed1hT+ofi1NYPth8GoGNd+b073CpaGxj4myW+
	YfYkAaAqjAVU2aAoZHp1DiFqXXYSx4yeQJx4v3gM+6f4So3go1tMdda0YFteOF+kN8r2Yk4VtX8
	7MDCDdOUcd7764/o7Cl27WEI4tjV12rN4jd/EIWyxH7aHOtnnIwjodqwkJ6UvW5wBKUUAywpCtj
	d9UGc3TqkGWxJl9Qy8kg3iw1KQmFw6RdxUR0KcSHdSEreVKTrd4uG1svtTkKsPwRG5M5xmP1qYh
	P9hKerMoAq7BE1eol98Q6IB7SV6NVgKOwuC87BbxMutxw4StAqK7B1itGtH6Ajb6LwDwAE4J4d9
	NA41gNkjs
X-Received: by 2002:a05:6a00:ac8:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7377a819aafmr1767635b3a.4.1742430480682;
        Wed, 19 Mar 2025 17:28:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERxS36qq0gHwG7e5rOv7rVLk2KqVI4Lx0Mv3+xfovrUKccTrIzWTB5jZrqZEoaUgnyNp+YFg==
X-Received: by 2002:a05:6a00:ac8:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7377a819aafmr1767582b3a.4.1742430480192;
        Wed, 19 Mar 2025 17:28:00 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695b4bsm12765612b3a.149.2025.03.19.17.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 17:27:59 -0700 (PDT)
Message-ID: <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 17:27:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        arm <arm@kernel.org>, soc@kernel.org,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chukun Pan <amadeus@jmu.edu.cn>,
        Stephan Gerhold
 <stephan.gerhold@linaro.org>,
        Aleksandrs Vinarskis
 <alex.vinarskis@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, Pengyu Luo <mitltlatltl@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Nikita Travkin <nikita@trvn.ru>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Cheng Jiang <quic_chejiang@quicinc.com>,
        Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Lijuan Gao
 <quic_lijuang@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mark Kettenis <kettenis@openbsd.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Wojciech Slenska <wojciech.slenska@gmail.com>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B85Bb_xABY-gDvCe2BCkrSQ08A3FuyDz
X-Proofpoint-ORIG-GUID: B85Bb_xABY-gDvCe2BCkrSQ08A3FuyDz
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67db6112 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=vUPx26DLuOswfgBSqJMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_08,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200002

On 3/19/2025 2:10 PM, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>>
>> Krzysztof Kozlowski (17):
>>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
>> sa8775p: add QCrypto nodes"
>>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
>> qcs8300: add QCrypto nodes"
>>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
>> qcom,ath12k-calibration-variant
>>       arm64: dts: qcom: msm8998: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sc7180: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sdm845: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm6115: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
>> qcom,calibration-variant
> 
> This seeems to remove the properties that the drivers expect
> even in 6.14-rc7, so the branch is currently broken and I'll
> skip it for 6.15. Let's see how we should handle this properly
> in the next cycle, since it's too late now to fix it.
> 
>       Arnd
> 

The driver changes are in wireless-next.
+Johannes will you issue a wireless-next => net-next PR this week?

Seems like there should be a way to orchestrate these into v6.15.

/jeff



