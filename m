Return-Path: <linux-arm-msm+bounces-87263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F6CEEB9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89BC9300D40E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD7030BF4F;
	Fri,  2 Jan 2026 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmWAS9B5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DB2PJyKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9DE2D97A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362660; cv=none; b=NCfn8pE8ztmQKUNvByhT4xgyxaunam3fxxxc4WvyJ5hFAwEmdMbybtZGARHZ5ZFpu8SD1zBR2w/E8zG8ntksgzdBKDdP3YFJtNbyi1INatSnfwTABZDmP/5AuwTBgvF6zj8HKkmWGNghuyHezkRjHPItXtjtfuRxDZhq6cBEJPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362660; c=relaxed/simple;
	bh=fIAsJm88rdZT+4c/pwiqrmBcXCTPv4zP0IARgBg/i40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YNv/bxHLcR21GNPXQjfcYbZN4QN6tBSXU0IAp0BJgp4eypjn83ajI5LfC871KQsZ/HZrhTWdvv6NW36IpDjJGlOM322J0eQQpxPoyoP9QBWlXaZ8xK9idj2GjMFsnNyQrcI+8KT53OK+qr1bpSiZkMZMUPunbgZ64idJ49Hf8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmWAS9B5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DB2PJyKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602BnmA51095184
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=gmWAS9B5k/YF2KxC
	pUQLKgVfTCvW7eB18XPzrAXbjsLtFEqwFoekY1DlvPcq9nJEAAAwqOZL06d4JS9x
	3EPB+GriLWm4xz1H5rpr9clywND3baDb25GB4WG0XQv10GHvGyCXYqf6MXMYOCk0
	vwB8iPQtMBG1r4lwSy4I+rDPmPa7rSiBGXqz9ychUf/KSy1mIyoPIrFDCQpZ2h4E
	45VjA+uQ2jn6MmIWm0jFjZmhUl33AKRPDh5UFAtCdd8uAssXeii2caNh3Y6ZM/WX
	N8JHWp9gqKjscxBk22kkLvCSxWxlMcmQ9ntjHBQz+kdWUOukRXl6jgKRvP3azU1J
	9+nqrw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg407aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:04:17 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-646518169caso2754286d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362657; x=1767967457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=DB2PJyKZev7MFKCIjvlbDFE2DxrwsEuPuNsXwX9wpIi8Sy+Mrea9ws2GhHEMBrCndT
         MipgH43FdF5rGnHYCMVAxqJFA7HqrdMvYM1sv2q6s7W1K40cJAI1W4rGpg54AronLdH3
         agN+3rMloopC4SOxY6a3p+CB7xPMeNyzLzdepJpMFt0cK+sC7fsLb+FUWteCwS9F2tRR
         bJG5CndH2im7GhzAqia758cS/6ndyhaycmM7ywcjgvq2UK0INuU1pwlMk8KjqNsivl4S
         CRghbejCWPXyX5sc5lWqOVJv40i9upU3cbpRKCrvLE0+76NGCbFdupUNBJgRCOhEnUrS
         WyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362657; x=1767967457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=LSTNqbX+lUiL2PglFcAsatg7Ngs7uBlV3/Ya1obuY4DB9LvIDLKnWmyrdYFhJBA7Y1
         4XnsHLo/SfZ20U2BgsqvUVua6O9aEh4CG3XC7EJdVKiIANxhuT3aDBNpSJk7GLn8Ccij
         yQPlzMz4OgmsnRyldIPLLXdDSZAOuflUMM2Ah3uv4S2KFwbcmcdpzIxtfvlz/TwoEtKV
         3TkD38ZLwPy+evgRjaQz3qNrVMRbFNIE7XaKeRfE9bc9jPEwOWdxd2n9X7nzg+HGPumf
         4OIjKCz4CgmxQrGYUfOmJyjn5C6tRaV4j3gLxxa/xL/ensZ933SxXhdXTncVaLEXknZv
         DJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0+uVIAOCevWAenaNSqsGF3T1/y/ofzrlSTw0y1JPT2QOWqbfxEs7/JNHKQzdky2fUIvbfjFToXZ+a5Goj@vger.kernel.org
X-Gm-Message-State: AOJu0YyMoJJoG5KeXLn1X8DcQPjlAlj+riaTdWg/M0rClJJB+bejSTpP
	+EXoJ/AaxP+2Ljx70k7VW11557ROhQaxO8Q8Ixkx6dlQY9FNvMtUJRntwIXcmx10roIie+aZUOf
	DLCtKtzGYCEMB5QExakY8vMTYohrQVSKw0NlJTLDonPe4PP8rPXCx5burCQVUXQzU9Oh4
X-Gm-Gg: AY/fxX75bEsvzJbuPnE/Xp4jBJHQ1kVrTOWO7gTo8vlyvHWXDSnMYaMRasLGnZLNyxc
	AXvFRYSVlkjIFpE6IaUUUXYKDWNrc9JOsWsUfXY7L9Uf4n1608/F1DhhF9uJqLRQNnrRyefkSyz
	OOK17JxO+6fy7TZubaSUtjcxmG/Co691p84LcP1hIdwvmNYJ+N2IU6NThyE7BWo6PASEk7YiKjI
	DerXLRh5JH/oO6gLlgdLrgjz0wrRFbgDsNj3L9Q6tHAb1lmCdsMZ8efH/8U30M2zRGqatVI6qmP
	5r3DU290aVwaoxl8/76VqvBeB/pZLJXeL2hW1KDUdoV4c6pdKzugu78OiF5bU5cwgRhF7YXKZR6
	HLMsE47hOfht6/xvm/dJonHHQ1O6X8lQNOYa+MRq1YbKnVdWTQwQZcElz7Ji9b885zQ==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id 00721157ae682-78fb3e6e5a4mr318529157b3.0.1767362657107;
        Fri, 02 Jan 2026 06:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDY9o/Da3MH+qVOhc/qqaBC7t55MFtKFA+nrAgBn0dEzUb9bRjnu5r7OGAxL5CcAAw/v349w==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id 00721157ae682-78fb3e6e5a4mr318528797b3.0.1767362656686;
        Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f089fesm4586018066b.46.2026.01.02.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Message-ID: <01a884cc-f5c3-4b1b-9fd9-7459227cf455@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pfRlJpyLIKK8AcZ5i10Xod4pqgtGaN02
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957d061 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: pfRlJpyLIKK8AcZ5i10Xod4pqgtGaN02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfX/1rTXycbOPwU
 Q+RaFqB9M3Jjm6DLF8yrgZt1y9Hqpg4D0i+gJgzsgQcLNOr96DuqdoMjZL+z3FjhT8Uy3yEyBLW
 LQpdkAhBo4ay7ePVLOQZzbC+CahQU8UpqWKt7GFXvpO859bOT5wA2eg1qaDwZblbhbOrY3CM2wC
 U5QWse0V6HMZFUDJPuZRQ3jkeWzdoW8s0FHYyneIt2hA9UEWpRgn83IlnNxwgsv0rygEE+WsEK0
 Sc0Ko3V7/ec3dBPykrv0dkNn1VQGemEqhI+loJmP5FfLR0TDLS+3/WdGpRwiYCgh2r9BI9rmkBb
 MubKGymiyMSKdX28wMOxFMYsO9EBE3mwivUuzL3Fn4fXIRzkimrRlQy+KGsHJM7YrksjZ9hNoTs
 4Jivqtwj+11KSVLyYZD0g1/XlXmXwZwHJIKjk/7ETgxe9MZqPj/u10n+HdEMtyksGkfagi4bkDc
 BNxbg84f/CmGxMA9Arg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020125

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

