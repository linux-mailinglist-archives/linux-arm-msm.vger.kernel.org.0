Return-Path: <linux-arm-msm+bounces-104229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPJYLR7j6WlQmgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234E44F1FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14EA2302BA09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B934D907;
	Thu, 23 Apr 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb8sSy7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brajNyf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4403737F759
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935397; cv=none; b=QQsCEeUIa/Oup089MifH4Kcm4xAmFZ2Gi+80w1ABYCLiRegpIinLzT04RRefRZKNqDq59VDd/uFx34WB/qnwESBd7nIdBvzU318dmYiZdW5fYpofSSOxi/3XcbfpuCGnRevQmjqkBuZ4fUlWCYyw21QgLSrdR6fRT2ihLt+micg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935397; c=relaxed/simple;
	bh=AwQFahNGDeUjudI7/2xTDoyVRPp0z+s2cGtF+OXeNfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m61SqH2jQ4VA/ksad8wq80/FG/AH1BjtN8lsoyWYRbjmPXyqB8fVyi/x7F0b02559QmItIOU8S3iD7642sTF8Y5536q3cAJFtXkDp5YaZyLEj88xiaVr9IA0SjklUJ/XUy6aPp8PKdrSggHRwZxcGgbQcIpXIQnHiHNHUtYPyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb8sSy7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brajNyf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEUo3044044
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=; b=Pb8sSy7pR1D61DW4
	ta1Oa3H69RbhzhJaX2g0K8Vp7fUODVKEEwrsRVTBcYQOH7seaXgJkD9vBJ6SoCEb
	4bzjAfyvqWzNUmOMLuMDIndSdRRZU94NzjlXY4X9jGJ7zy3MWKhwErvI6TipeHnf
	PaM3vY+6PsYQcWNTgqrJXH+r0bj349x6Oj40MeXENqJAjVMKz4kAgUUkmJBfCO9r
	FplpfUKOeOCcuOYUrZ+L2XfKzUY1Oas4r9ByVY+uvKXqGqiml+rsfdo4ovpWnQ+H
	T2GxKoUmPaXulOfNC3fui9VV5ZqA/erZjGBrbITKnrTQmlW11hrFJxa6aO7nOQPz
	FYj+5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh33ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa366fb79so5603056b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935394; x=1777540194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=;
        b=brajNyf0uJ1idU0Fzd1x74sCVzV6LSy4Tv0+CB5uvNP+nJOBAM5TMoMrHishEXgRDN
         l/qwpj09Pn3WMnvKLoG1pffnAzcgiicCOWAXPl4WdkNYqa5BrcC+MJxMa9fVpAgFO1a6
         95siSizNN6wzc4FJ5meqUVKXwGzLcK9HADCq4gYbINuYw+u4Q3793ojrJhAvR9il5ivo
         tA+JKCVoT2btvfbqgpbPHNK3YZuMeQPyneExOrBnQWqCT7aoBRVunPFosIc0b5d55ohh
         qRZfzNOmtQhi+/6HIM2/ceSHUmUwLoAJvbcCzIc8RBxVS9L+09J/2J/LZTi8y4AG3tZR
         ELUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935394; x=1777540194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=;
        b=kfzrdnyzvil3JdZfKQ58FbOWXuR7Am3Vu/RyIZ2BtLVbftb8cgrSQbcbV/kLIwy2OF
         dwMGbiBmBzFOwuLoP9G8nArM2qJtiKriUx+lcbq9eB9PaZqNQXPEnZgNdW6AU20s2xyT
         YLB3kXiFpkOBSlkaY0x4uS3Q6KPpH+Bq26cwtlMys54ghBU3519ohBg8HpfBM5wfsqjt
         EUCd2FH8aYAyZH1RxM4OXxLDtfkUT6yLD7ztOZpojKTzTQUEDpYyNlHNRgCHED7lUCes
         wpl+QM+YBJPjdj1yyMlKPgTHWRML/xgHRhKJYlz+p1n+u+fgiXribBh8eYiVRwX4Xw8d
         z2Xg==
X-Gm-Message-State: AOJu0YyuNzyulgvAR+M6ew+b13ARd2uW1u2KBHi82hh3b/7b83NXe8xN
	rw4TKHP+T2BR2gaQUPzOfQtbmZhuiUwEPoLbCI7J9j3qfUegdl68f/Qz3vIvRV5vgCQ6o1JpmOg
	B+Zrg+MP8ZbE4FbewtwURygBd6zFYnY/t8flTGuh9raVSGyhiS6EYKMyl/RWgkNuBh7vZ
X-Gm-Gg: AeBDies5EbCeGz/RqBA9PfbN2uPjhNeIJTW0UH2InGNK5N6+a8d2ajlsIga78Kx2IMU
	s1Auyx8jmKrriRn0B+ZLOxgJdpzzb9JgOsqJREwUPjDgYhCgcaegku6q0TAvhhLqwa8uBqMkx25
	VtvY2Eh07W+qcusPlXQHsSOKQuSKViu3o23rH4P9Z4F//RNzCT+gAs9ncy1/dgUHGb1+KIBsZsA
	uyvQIpyQLwknbbU15ZKI0yv1LBzC3SZkUM35oxW0i450qpXHEckybxVHIdQiM5Wp01/L/srFdan
	92k+lLMuoI74b1Dftw2I1dCkdvIUh+/bRTGrwSYsh322yI/A2R8FbInNYkGFk7iaqf+YcNu84/c
	D1HWWrHwOkkHjb3EyorgmAfb4d1UQsIW2jrulneCdXmUR1W2JZ8ac+PB1YrEe
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr28147125b3a.21.1776935394156;
        Thu, 23 Apr 2026 02:09:54 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr28147087b3a.21.1776935393695;
        Thu, 23 Apr 2026 02:09:53 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm24438425b3a.45.2026.04.23.02.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:09:53 -0700 (PDT)
Message-ID: <6da8a5ff-0e13-4be5-b373-71d6ea925e2c@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:39:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4OCBTYWx0ZWRfX2Oqua7XzTZ39
 RSeBuyrxH+bnFgyj65QF508Chhn3wBK8TG7xnevcDK3OBB1qOWn6lEkvDW3KUlUsV2knt8y+Ngv
 wGMb1RFOyO2QJ60mb4LPJIvH/EjErmAkqgWSyoiiw0poPH+1WLx4Vc4znuLYCRTBHbhHnDS9Uir
 nFhTnAALAZ1BhHyZiXIsL0IQw1SgBqchCXUEFNLaa+LT3SbW8PSoYYkC98WfQHkAM5OzznAaiLq
 AOPbo8HRnldSGj3LaBVM0A48KTcP0gjF/GITzKxmJ91BLnl5obSsrS3jW3mEkXSS6wRyW4Cbd+r
 20xswcv5kbrRF6SfAVz51R/XNGkZzOcZoAKvfbZd3rGhQqFSXP7k60t5REACiuu0OSS9oq0y6aK
 t6h8C6X58KJKwDbzi4m2xlNY+CJSlz4i5mIAazyU4D9Z9Xitp8TMdrYO7zjUqPgQwYpAvmojWY/
 7IRPi9kNT4JIs90vjoQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9e1e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=SsaAUIoj8nFF_dU8A00A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: p3sQ-_nJgfQomKRnYCcOtu73nYTBDNzM
X-Proofpoint-ORIG-GUID: p3sQ-_nJgfQomKRnYCcOtu73nYTBDNzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104229-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2234E44F1FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22-04-2026 21:09, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 36b419dea153..af2bc29ccdad 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2458,6 +2458,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 


