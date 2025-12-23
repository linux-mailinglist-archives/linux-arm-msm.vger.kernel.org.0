Return-Path: <linux-arm-msm+bounces-86426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C963DCDA866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0436B303E3E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D1D35B148;
	Tue, 23 Dec 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GC9kvNv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRuiG/hJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0EA35B136
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521364; cv=none; b=BSvtXHgy6psy00Scr4JTg6Cs8WHKGOEPYoK5gJj7x5LSi4YfWb86fZEkokLqqOJ/Sxx1tr2j+lAj3WE4qfkCcW59dsG1TlAjrf7erOa0VE7cX8xCzaxqLx5gTJiFYDGMQVZFf/Cs44XCL8XNH3B9Gw/uCP1bH40zapT2nDP80LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521364; c=relaxed/simple;
	bh=RbALZPmNnhfVUUnn6kGQlrR20YZlpbJ1KzdA5EzSMgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChixOzghAqoEE80rUOEvSuSh41z5KYErNXIQf9Yl3rjieFXcKdGH3tgJQOM8RtP7GOXwuuPbhcXDQOdPJvJhk1FV8kAD+pDw4pC4scKziKKswNLvybC9l3HH4Nr2lq/NOBRWVMabbPFzEb0LZU98NBEHTtvg8YTBaXruhpoTyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GC9kvNv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRuiG/hJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO6j71018062
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I+g2UeJv3MotbZDGJXhzU2IJ
	PY7RSGiVrbIq37NelSQ=; b=GC9kvNv31REf6ffUYUJc79/quYzHtco1MPPWB58Z
	hmTg+9dZbYH5gQnObDmeWpLarq5vvghSisE1d2kTJFqxKXAm0iCzy60dHqonLRVb
	Oa2AS8R2MQthRw6iVEOpnQpEQ5Pk/XR3fMcP+dI3Oyq7S4wIB+6ZJLVbC3LYEorD
	vxz+4Qg3wLi7k6Jd5lObtHuYNzCkfwVDh01077sukA8dw28v/NOWj9IjYvSu+s7T
	3Z56hO1r3GhKtW4TVcqrh30h2d1wmpYlc4Jc+PZv7Fw5K5QsFU7+fp8VH72VR7wH
	Vqx9Yj6D/G+URHgsweqEFBMrwSamNBf5xUWuOFSeZg9+Hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs8r7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:22:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso64029941cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766521361; x=1767126161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+g2UeJv3MotbZDGJXhzU2IJPY7RSGiVrbIq37NelSQ=;
        b=cRuiG/hJ2KiWViQ/FOAnNNHcQ4l1ueFfdxMGme38uE1ZGxcSyiC97LSYEFLPRLtf3B
         wQM+qdDGyUBtwaaPF5rFKCFwFOMYVb0gXcbwsdaeg7N1DGgkdnk3uq+M64geD1XUCOeF
         CjIKlA0nLOyf28gvJJYTIKycfYc3Ey5topCO7v66CXpPqNKvvMMEHDvu/Q9wDaNvTfla
         TOopjks270ZkyxvUClqpWKWtoiFaHUSh3odRCixbPg8e2/E/i4DVS+yO3CxnOeDeFm/j
         kSiKX9kMyl1PAIx0fJnZiVzrVw7jv93nkMWFFD/C23feikNcXQ0yH4jg/PmoF2TAfxtn
         HAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521361; x=1767126161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+g2UeJv3MotbZDGJXhzU2IJPY7RSGiVrbIq37NelSQ=;
        b=JIKVaEmtY37gq0zw89GFn9nofpOu5RbBtSFs40mLLrK2dVIBMpE9m4qGPjBFHkxpkF
         e7Inp0X/crnPi4FoCF7yTpnybua4yfvruMNMQsGX229BuTSXyzwewNNUNH9/q/WnCemE
         GuanGwHV64eaIuwzhTqCvKH9ESvbn+1QrZnvQaFs078Vd/sOpJndJUm9vPqoQGV+WUkX
         LpdDOvE3u2U4L74xXCG9/WFoUAz/fOk+moM8RU3IhoHnRnVgeE1tDNLvQM5lO4kWBRKo
         asLaSLpoUwQl218yYdvjWkUtNyUgvMJuwojctjEwpHi78SxjEZDElGQ2L3+4jKHrKOit
         5nIA==
X-Forwarded-Encrypted: i=1; AJvYcCW00scS0kvqgBy4ogB6xqpQBubXbkjI1GRs8kWasdx/azMUw4Eu5GTEPmWD9pMyLLjwe7iCyv/1qUGjSBxi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19uNcUA/zogpQzHjc8Q+x2DFPgeMmIHazk8AeiJl86+D8kt3e
	6xXJ0yi5SH0hTyYFA5VMFZ+iZcArDfXR5+MSVgNscy5QlBMvkK6wSiwSg4XE/kZCPGxDR/ZW0sa
	3aImjxi8bbDoEGzqTfPz5DzxGbwMnQtO+fuka/oOY66/5K2ZidzX52qXnCep2c0Zb9Z8Q
X-Gm-Gg: AY/fxX5k7cpyHbPUWB8mZ8AQrNXoAZVe+N7Rjaa7Fo89eaiCYAm3dg4mklOo2uaXv83
	DKtA7Joc2p6bVJ/khp+wyVN50CS7Bbj368s3Rdyqs1fGvdDeVwk6yoqNDZIaPGGnHIDqiJbCvyO
	xW1mI1XBhzhB1Q5q0STF+tDVyi3MZLMCoAGhjsolFVSweUAKiLVyYQzIGEuHI6WNVGOVZZW7Cz+
	g7ZiIikzyCHl0q7u2kcnZ/3sHmUqzTFj90g8Xxtoh6QwzgALrhFwIpshHUiXgvJtq74YUiy8NdC
	S6ly4lC+8NkbzpZcsjoh7kn5QV+be01mIhUke6vxziHL4fRqZLDUFK48KgjlTwgOngJbyQjJvLR
	X4khMjsxrM+C9rCc0GfF/vTuNn8BLRY2hTPUR2U/9jK51pRRinbo7HESswUxwdmpOI32YN3jM2b
	Xda+Jp+Mz90G6fC2N6DxaGgjU=
X-Received: by 2002:a05:622a:a0d:b0:4ee:ccd:7215 with SMTP id d75a77b69052e-4f4abbc303amr236203271cf.0.1766521360996;
        Tue, 23 Dec 2025 12:22:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiG3iSJRt5SZ9p4EZGe+QBjzN/m2LB7T7Pydnc06brAZusGTv8OZWbCc1FPDCVjM0d9/YT5g==
X-Received: by 2002:a05:622a:a0d:b0:4ee:ccd:7215 with SMTP id d75a77b69052e-4f4abbc303amr236202981cf.0.1766521360586;
        Tue, 23 Dec 2025 12:22:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd849sm4491335e87.35.2025.12.23.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:22:39 -0800 (PST)
Date: Tue, 23 Dec 2025 22:22:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add QCrypto node
Message-ID: <advjg46yjja356zosb3qamuvlsoandllvgh74xj4dfjxtd76at@ak4mwxafihxg>
References: <20251223-enable-qualcomm-crypto-engine-for-lemans-v1-1-f2c8f8e4f3cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-enable-qualcomm-crypto-engine-for-lemans-v1-1-f2c8f8e4f3cd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MCBTYWx0ZWRfXwOfTsToEfAi7
 4lIsJRJmzf7bjwC6CEqy/hQNeotloGhJ1VUyKUxYNGfOAFmSO71OM0rmwuEvvSXaNh1KldTT0Bs
 yYle+u0pI4rlYE+CFiTdUJ8lWqluAe8MI1Q/zL0GS9/psekfj2YMUCxmDPP6vjNhwglor+gOOkO
 onnlQvBedAqOi/C0+RPtPEau1cOxHwPMQNS4eTDhWcOEzzpwKLZeOkpHQ/RW/ePsfATD2oSFBt2
 D6prnswHWq3CHyhTDs+WZr+EZCAJwfyAKybTQFsigVxiRjlqyoSZ7UQwlLSs2QBeXgXClSCyigA
 skWTlObtNtBg78BNCFOaYCFNdGJNv+N4o2saJd4Md6VBDKOrst2UeJGbB5HXJDa6UxVNguDQ8pe
 QayxbCzK1s6m1YlQvrO3Bt3Q01aPgbbYgHBYMQr6K81sjgg6d2PRipFr8jJSyes4+kL7ijU6Sfo
 XcGtZHLcWBaW9C14kmw==
X-Proofpoint-ORIG-GUID: yZO-85eCKC8uI77FhWr_NdhlS_7B_L7V
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694afa11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=amjzsnJ4ma74pxkQl9cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yZO-85eCKC8uI77FhWr_NdhlS_7B_L7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230170

On Tue, Dec 23, 2025 at 02:24:20PM +0530, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for LeMans platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> QCE and Crypto DMA nodes patch was applied as part of the
> commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes"),
> however was partially reverted by commit 92979f12a201 ("arm64: dts:
> qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add
> QCrypto nodes"") due to compatible-string being miss-matched
> against schema.
> 
> Resubmitting the enablement of QCE device node for lemans platform
> with compatible-string being aligned with qcom-qce schema.
> 
> Bindings and Crypto DMA nodes for the same platform is already
> present in the tree.
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

