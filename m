Return-Path: <linux-arm-msm+bounces-80205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDACC2F2C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4CA189CE01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABAB2877D9;
	Tue,  4 Nov 2025 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVIgJX9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eox0Vjed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1EC284B2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227308; cv=none; b=JxlbU+SeCfavuzuVI8VkZq8OPSmBwBObzY6YW6XKn5O8KeQf1xn4pKM3mKK5rsxdxp6Co30hDePhWorWBXYnxY4c+H5Sd8eEa0Ynr0oBFAw6pnzZQNhTCqXp/feORTmoBfl7/QLUEvd3hDf8BUyy6xlfDdsHQweNc7mh7GazPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227308; c=relaxed/simple;
	bh=t601eelFuhoshQ6UhK8FXumC5nM+7Pd1jlLamcO04w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnkrH+pe1XdHohRg0C+FzvBjKuDggwG7et6jcDE3EFg3szPsIjXoC5iU4Q3NI5FAaPsVKELCdQxCyi9N9CxovQBzv7VIA09QNvldIaFyGPo3zhdgFLeitOkllg39rzFqUDTmG0Kjye1TiEwlNkXMMPPqomXKemaEGoNW/gogh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVIgJX9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eox0Vjed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A429FhE697108
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8t0XF1cncrMQz+L3qdd7BN2KhVFZQpN3RctAGGxSyNw=; b=XVIgJX9rvYhblKcN
	3zgiElpZZ3TIYZTbMXRXgyJ84sYf5LoF/Yvar579lS0fxJa/TNEzoSLyog0DWrsT
	y51f10Mn1qVkRJY50Qb9zJIzpQ9KVZ7FAYHMJuzQCHj+/ujTOp6N+EqBnS8oGVWb
	sMvdWJTAaN7ejy93LQz8IQ91f02ZBRAj7HXkNCTnO1lVZgEoSnD09nmEv4rHbc7s
	A9jHfoUz6mwpRI14CSUO5IIBV6gNSVvktreBG6XdpEZ8fGsMO7s6UgVq5cQn8EQx
	jWpcDMgXLH3zmsc+c+f/XEH7XzZQPRXtZVbtSEK07XsZZT88J7ch47epmJsWh6ML
	UI2QxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a78eqr779-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:35:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698ede62c2so19146325ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762227304; x=1762832104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8t0XF1cncrMQz+L3qdd7BN2KhVFZQpN3RctAGGxSyNw=;
        b=eox0VjedCqvYXPB0FbjX3wOpW9Gl1SRASAkDaAOrTH9vLaTCrwLe24TTKh0/40vaJj
         ujUaRaDyNoS062NUTgyXa6YpIRjqDvSyYjPSaIu7UkwsDYn8bEQJqs0d0Sd5slzF1niO
         A9T39dSxcbhP5m+qB/SWoa4OHCj+Z3EIX9t+mpZaxRZ2ff0yLpI3bPdQaF+Rqde9athP
         lOZPhJ8FJKRtKBn90YOpV9rERBd114oLvtgxCmbL03+Z6Cs5lv1atSBDlfigl1uiw78K
         YRq71QNVTG/4u4X1eTWVtYdAzEcHiFevjWt1Yf6IMEKEDIDZSdcz/37iHtiBFiKjlfzd
         4srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227304; x=1762832104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8t0XF1cncrMQz+L3qdd7BN2KhVFZQpN3RctAGGxSyNw=;
        b=IR1J0zL/YrZmyr0qpOFmvikxq5dWnYT9eFom8xJi2fH/YGP8eAV6u0cPvi68f/zNjB
         qExdxJTtTg0oKlzV+BVN/HTAEU0qhEp+zFzG2S0z5nxKh899GOig20JypR5TdJZeZnzk
         ECIS0Z6LoDZhKAKsin8Iw2pqyqkW2IV/Q/LYEqmW6hpQUVIri/UVt3JbDx008k99HXTN
         su0w/eH2CUgX6BROf14lcs2qtuRog9C44CbNMxX4J+q0xQwP93epHI1VT8nS/SoQWe9W
         jhhMW9y2EFX1EiBgY8BthGLq4GqXiizg23taZYbRfHJVVAAx1rGwtIK86Aitnya6rcxm
         lejA==
X-Gm-Message-State: AOJu0YyVls1HQvJsAEShr13Gs19I2bAYt4u3oFQUyUjPkZ2VuuYuu4Me
	kSsxB3gfDwftxNlxs+qKId9ozc/NeP6euzOT4MMKKuxYQm6rj5jW85EOIS5SplFNju4BLfsqK4r
	gh1H4iCTh5DAJrvbkNS7llHt++tZHXIGsASVtJ24QaCRecsd1M1/QLwk43vs+QJp+GciB
X-Gm-Gg: ASbGncss3rBFZr6h+A7ENB9sOQZlRunPlQB0mcTo8M+9G4i7KfQ5ciWMf9Mcubg7DTP
	TxbEA+PT+tBnucnUmhEx/JQRgZb/EqJ03evsMIX1AK73+fR42UkmjtWPQewSwu4Ajj6jLnbyKkV
	+1HkO+K67yiCmJhxTu41RBpeWeyRWc8zDE/GBIzZtU2b1H+406gSWHyK5XUfRQJN3toUbE95iPi
	LuPNGaWIHMJpiCTARqIf7zrY27eUwMR2BHuLxiXbQb3i+FnBrHjF22bRMTvOXL0TL2RtTQe4QYY
	/TtOHxe3ob5SnsPlOCNUKiUR7+Fyr5uXH6MMsePSg1ixKjDqQt7DV5wVvuN86KsLAbHTRNj2WGd
	+Ksv/mp+WjXWyl/NAEKGfX/VjNcuZFSdCWsE5PQuoDAGhViYLMZ/3AXqsBZvZAjB8Hg==
X-Received: by 2002:a17:902:e5d2:b0:277:c230:bfca with SMTP id d9443c01a7336-2951a3b6656mr105514065ad.4.1762227303947;
        Mon, 03 Nov 2025 19:35:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPCTZexD+QXqfxpLAdQ9PN7TgGgbumgKenU9BA4EepJgR6Oo0ZpARKrQ1dKow8iyI3o7tD1A==
X-Received: by 2002:a17:902:e5d2:b0:277:c230:bfca with SMTP id d9443c01a7336-2951a3b6656mr105513895ad.4.1762227303459;
        Mon, 03 Nov 2025 19:35:03 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199c338sm8022115ad.46.2025.11.03.19.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 19:35:02 -0800 (PST)
Message-ID: <bb3fd5f0-9797-48e3-b54e-fb2ac2c3867a@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 11:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Kaanapali
 BWMONs
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Amir Vajid <amir.vajid@oss.qualcomm.com>
References: <20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNyBTYWx0ZWRfX1W2oDRTnUg0J
 k0ThJ7tS/2QJnEpZpk9DjTARpWfHv9tzNuMqCCseu5wsIgpF/8qO3yhcca2lNwAWyD8fyRAHCTW
 H3FmW+UuDSdXlqF/WcRO8H2PDfudx9FuMVJkC5qct/NaRYp/VyFkvLD/eH1LX1eYSmw4R+a1Wne
 IC7603nlOx1ZtI+73cU895YPH11y6WCbFa0CrnG0jsUy3Nvv4epL6OSMlL5IWysrXxaU/mRLcAM
 QlUMRALGqbQSmikNTkM6qd/Iroai7fhC0D16Q8Ap8j38df6R0UlnbA7nVq0WQxTAOLUJnjClPLy
 M7m44cqfrXkHoGeWfxdLmKEeV4KDa7PS5L47Jon//Hbu2V+/6fKvDze9GxDifE8boBr9OGZkSOX
 +gsTRAsZKE/IONOZ/vlTkR35BgOkzg==
X-Authority-Analysis: v=2.4 cv=fofRpV4f c=1 sm=1 tr=0 ts=69097469 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k-oXDJut3rjzcoNMBmMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 61VxPs9Wy52pA1d8cFN0oboQKmJRX1vJ
X-Proofpoint-GUID: 61VxPs9Wy52pA1d8cFN0oboQKmJRX1vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040027

On 9/25/2025 7:25 AM, Jingyi Wang wrote:
> From: Amir Vajid <amir.vajid@oss.qualcomm.com>
> 
> Document the Kaanapali BWMONs, which have one instance per
> cluster of BWMONv4.
> 
> Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 256de140c03d..0d1a268db921 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: qcom,msm8998-bwmon       # BWMON v4
>        - items:
>            - enum:
> +              - qcom,kaanapali-cpu-bwmon

It looks good to me. Glymur didn't have this functionality verified yet.
Remind for review.

>                - qcom,qcm2290-cpu-bwmon
>                - qcom,qcs615-cpu-bwmon
>                - qcom,qcs8300-cpu-bwmon
> 
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250917-knp-bwmon-d3e2020ca6b0
> 
> Best regards,


-- 
Thx and BRs,
Aiqun(Maria) Yu

