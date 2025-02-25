Return-Path: <linux-arm-msm+bounces-49275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F1A43D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3457917A1F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA279268FEB;
	Tue, 25 Feb 2025 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWr6hurJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47742268FDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481612; cv=none; b=M9BdlSkc8RviPpD3DUEoDKWCSIyoc5fMAtnqT1uMDa6mczocQ1zHHSarh1Oijsd8LlqmnjD3+PEeiiTzQD4zT8TfIzaveDe/5DKkhcTl+wG3HUFb8qj0Pf2l5/RzniQVwwY6dgXE3LaI8/Vk7N9UCFbGcnEVWV/byql0+pps01g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481612; c=relaxed/simple;
	bh=XkYGmuqddTj8oK8dZdu+4fdiwObTc32dreqIG6VgV+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QklyZV1E5Vkh0UT9i+SolSAwZg9UjB64RoTOcFcpbPQYcD2NLDlssHzHxoxqJchN3LtDY6vbxB9FMDgZJ71LjxeY+geEbS1nenAgE3R4se9vqTaRl0iiiQYPohrlqQ4ndAoXbQ0jWruSPUlNlqgf+0VRo+BRq52FIyIyJG2V6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWr6hurJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P86692017286
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmr3+jNBVikraxFllbzAvshxw5rAgQsiv8Obg2rHUPk=; b=QWr6hurJNwqzWRwI
	XaIRMvmFWUTXnrxp+r0bAIMTGeiXKQdkDEPOQo9CUVeHFyFcwhVEdfvhXygbrH2b
	veOp6DCBQe99ImpwO6h9IqA7FPKpL3MKZyOTMhYxE1SsunHDDEnCorPBGRfLshgG
	TWpVXSwAjMllqiJqjXkNqnu6hBC42gWrt9DyetYViANSyHpDWrinQjPRq5In+nV6
	vaempD08q3SSvgsLEzVCg9byQrWP+qmITZcVqb3dwlnnnJ2P+j0P6Cn/3IZ/WoIR
	isY0mRs6p/NtY+qfoTZx8jCRiCQH9a47rmyl6G8/eUFMTY73Er2nY7/8IdDg1+q+
	nhKYIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k68r4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:06:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e662a02f30so16148506d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481608; x=1741086408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmr3+jNBVikraxFllbzAvshxw5rAgQsiv8Obg2rHUPk=;
        b=A/tOYkhMylbTEqweS84HT4OgAROunjhJz/FxRgOjC8czUD0/rSNcnyFxAIgkSaSdkC
         YyqrYSl82Mf5dB8seXGbwi9NFvNwDpKo8irMUDWG8wLfNvHT5jipxlRzNoEXNvF/f7yo
         q5C5VoSeuS/kX7WP+ToZCbjyPGbiSYNYRv6wW4v3orJwDdfHw13NsyjUE3D2/NRvMpL8
         QkI4nc+QxPB2OoAIySMizp/WLKGVZ26wcb888+d/0nyeVhGR2UVRer2aY9Z5I7FCHFTS
         Rxqbp+4+ia7nGT8WzDThKpCOuz94HN8bnIe2Js1ixrlWggebH/vv/ZbppqHeYNLv+vq6
         0gAw==
X-Gm-Message-State: AOJu0Yw9noDAbJ6vwHYTV1JGqvqKK90REsN8djnc5ecHXWWk+OIAR15S
	Iiddxihhs3Rdl/NsJ2bKqj3BeJRY0U/9KbN5sTwhOT8lHwWoHImn5163NuFCfeugDviqxIdA6d1
	iSWv6wDFakwcxCk/u+6oLjkymN1+MCPjj5i52HjOs5xPGOQSmd1JlQAOByokXjCRS
X-Gm-Gg: ASbGncuOWsYrdhYyUdcQurKIxBqVDxi98yhhFpZMsJKmCM1wiVG5NOfbBGRD1dpMpye
	9bCTo8Gph/Wc/32HEyQ6GHwG8owUJw+MBN9J5wjQvxsHy04ixvbIbVQK1HpFpZyMWIWnMPTLItY
	1LRRYdaMFDD/ehZGkCMi/lNe9o0bLOHAQgOk3rfHe6grPNuZwQu0XGO+Q7Dh/Mczp6TIEPALZXZ
	o2oQlfVlAEnV8vgZJzLEMG4OVkbucC0mxAnwYIUOknUEylySB5PNP+w+aJzkYHg93M+vfUv7/Hf
	0rIQDtJ9zOMLOihsIsB1fgUgM61IrEycX/zn+EWHG8nmJ14RaSjG9jaRw7VDP2LGgyz8lA==
X-Received: by 2002:a05:6214:262d:b0:6e6:6a6c:79fb with SMTP id 6a1803df08f44-6e6ae5ff006mr84483236d6.0.1740481608163;
        Tue, 25 Feb 2025 03:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpCizjt+FZyk8bw+ARjsYXsPjZ8AeU9m/iRlA2SHZyfGOnxjBSvYobvw7U/JUAWrjEvCtKuA==
X-Received: by 2002:a05:6214:262d:b0:6e6:6a6c:79fb with SMTP id 6a1803df08f44-6e6ae5ff006mr84482986d6.0.1740481607816;
        Tue, 25 Feb 2025 03:06:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2053ec9sm122476066b.137.2025.02.25.03.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 03:06:47 -0800 (PST)
Message-ID: <253c497f-5c52-4f02-a477-478aa3ee35ac@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 12:06:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add RPMh sleep stats
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_lsrao@quicinc.com
References: <20250218-sm8750_stats-v1-1-8902e213f82d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250218-sm8750_stats-v1-1-8902e213f82d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DdmsvCX_k5kwcTqSaZ9YCSBxIAUBavoF
X-Proofpoint-GUID: DdmsvCX_k5kwcTqSaZ9YCSBxIAUBavoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=918 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250078

On 18.02.2025 6:51 AM, Maulik Shah wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # 8750 QRD

Konrad

