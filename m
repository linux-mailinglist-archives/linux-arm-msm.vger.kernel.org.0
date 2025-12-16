Return-Path: <linux-arm-msm+bounces-85369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9719CC37EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F03B30735D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9770A3B7618;
	Tue, 16 Dec 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0sQo4tQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CO9OZs40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDA3B75F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893082; cv=none; b=n4uCcIsMaC0QMLZkGELfq66qr/tK6SYNTmaiKP0G/q9dTI/2zUiH9mbGCSu3WmwE0Ze/t2dVDfkLlDxZXN+1raz0CMTNVMycfyxHKLoMqReJVjpoHzh44Wk8EYDWMRx8AL+kiXGRzpGozoujjpBmVEzU+06x2YZuyPCty5P6Z8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893082; c=relaxed/simple;
	bh=kqefaEAINqf9ddsXkYYvoPTUSPTPMuBy/+O6QH0DNwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1N/l0oMX6XAedUAMpZGxiaYqRnNUFof0pnW9C87tCrFsdi3Uv+9m6c8JAmZ2tUmwdPKfDNQceJI9EZqgB37fW/1cA+Z2B3ivfYbQGrlFnI0Px2V+EBjIVUaYU6JMR+ZUKdpdgfGsFMr5AmBK220MaHM6vMRUU/vYt1R9mvGDe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0sQo4tQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CO9OZs40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9ZpB03349304
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=; b=H0sQo4tQVbc15Jgy
	yzUdm3FiOBzttSL2D2BWVJ6qw4i7YROcnjirWnndq6pqHGRb2wcAL2Gei+B3Ie0S
	B3xm3J9goHoZQItQV9zI4EZvge14K0NKCO7u/YWgzCW3RXSnIQmed0G4xxsfdDoU
	wrKHXFfl5KZUFPPPNs0X9ahAx1kDH64W4GaThUk9KlkGlG/SjPYDL1UmcVsZ3pld
	MVCwEHzyyHRBDvQ+C8EhgWXmNZuiu19arpnx15B27OM6KEX9YTGkE0sBbZuFJKmH
	jxjxChkn4W5xuUg5/S+YW5o/gs44PpGW+NJ4M89oFdrOEDVNv+b71fQkq5vtZys9
	jM6thQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34xd0y91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:51:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25dbe495so12021505ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765893079; x=1766497879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=;
        b=CO9OZs40IhrDCiqIU6Ag94dSmI1yLMQ2oRY3xSb8Ct1r+bNgtvqfXKGaUs148f1AnV
         mEkCE3rxQsoFQZcIaE7IUmLfnOiXEcS/bIDM2Cg9A26D6dSsDaP4AdbOIphfAQjKtglk
         Xh0SMM9zzfD42UFdhAlN6o9FStO/JwqUcQ/eYOuNc4ohuvTT5JvLjUPQhlCMauoWgmfg
         s9k+wiQdi6PHBRhT2t6vqqwbIxzqVIRJ0rMYQASdMh6+ZNMKcOo6tbXnZmVTP2CtZij/
         nHPBrz57OCXvKHpJgP122xjiL14v+x4/w0w8Due3aBY4MPtvmWNwY9I9m1yTF0jrTskG
         cQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765893079; x=1766497879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=;
        b=MB/0woQr7Kz1idfVr1naESoC2s2U8Gyc/L2Tg2FnwFkT0JFS8Vcne422kYe159XKx4
         mkMvf2s2wECD7eVKhbes7muTWe8RYawS2UyD4jJNHKcVgR5hNJyB6NfsBAMWR/vi41jL
         HWSCTH/KXyZYGgYJluL/t5y1QGpNQ76Va6+EjQfZ8qCHIXOlRI4yNTiyWdoCmyqc1Lj5
         TzM8H2z60pOefoeboMsF3QXpBC1o3mtYWGd5WIK/h6jYiJwqAHjKnEc2ekdBDaBvFMdS
         6Dm3clD4vrS1CID6HKBHCgN80G65ZDruFuLsAslrykzKAezEerA0mum6oyrrQ/slRcyZ
         1U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3VBdkyu4vu++CWCiURwYGKQ4IpkcFPE1bxWFWZqJkWXlsp88jHPrDkbVVIfEMN2GrzvScS4IftLEVWLcv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmY4e5SfqdbhGBs4JDj6tHAoNw/Wgz5RuwGRfNt+on0I5V6bp
	HMbxYU4pRRM0x6DlwEuVycPcCbvb+bS3buQna0E7zmbR9bcs9Uyt3F5QyruUxf/RPxJoRPEapin
	5korY4AW666ueSjR0bhI0ZeE5iJCIyvATjqp51zn+aTkbCovSfRLTmolEHAjS0+sy1vLea+A33V
	qv
X-Gm-Gg: AY/fxX4kH5ar51JvQ8p9t09eGAiDMX6YEPN7dFzw+e6cxyuxeU2qqb5ki69zU+tmZwo
	EM904Pq8sZBn3sremLvzgSpqXxu9dyDk8ndA4T8PoWjPHZz5jwQmnfgyvGczjcjrVSNvHUfxGza
	uPaZ0LJ7m3Xu+OFHTzZOCXHcDr9hXiNNvMYlXHp3+29ZLFpqYC9G80GUqHRI761EIArz0/EWosJ
	vAqiRj24Cpalj7PjRfkX9Wy5NyVcoSq2tPs30OxW5kX4lxSkKscdG9ERk5REVE2UrpfqCGpX/nz
	BmG7QumAeNvW/G/p29QkvzMkOCqTdvN5OtbGMJvMGi2i1JC6SAOU4+a21KxY9Mq2a0HqQVwV1l5
	lZuxvOznUEwWSElsUmTOB7DHV3C8ULBFuD75mlG3SUwUHjVpjD4AnDcXzylkrhgZU0A==
X-Received: by 2002:a17:903:2bcc:b0:29d:7e23:629 with SMTP id d9443c01a7336-29f23807a27mr108321795ad.0.1765893079186;
        Tue, 16 Dec 2025 05:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBOq5l2eisqWzuziHOLKqJEQPy0Brj00XHCZuNMqzhum37I6UYsbBPPvOquk5iaGRcXQavjw==
X-Received: by 2002:a17:903:2bcc:b0:29d:7e23:629 with SMTP id d9443c01a7336-29f23807a27mr108321695ad.0.1765893078766;
        Tue, 16 Dec 2025 05:51:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1688588866b.22.2025.12.16.05.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 05:51:18 -0800 (PST)
Message-ID: <932a87de-ab2d-4a60-a188-04cc2c00898c@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 14:51:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 fixed regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOSBTYWx0ZWRfX4yOtGdi59zcK
 ME/+Nl4X2zrIlVraT8VtlAuteWqREYB439SAIyawWUCo6jUZMQDVCWGt31ef7edevzdup66WRe/
 e2p/iXcS0vnf1UxzjKxrQyJkR3wYcIyeG3NcoEE+tvfJFrTdAsj+EqsvdMbfS3I4QdZF3JqCFQe
 HDYoPDczeIfJtyetBXBmjWcX4YLrQiX7vYoLOdZMQzvxXrd0DnUpVF77lb6CXVKlmFbOdioYDxj
 Ha74VvknXfTVjb5taTmlcR5KIQxlA+IfeF/GYdpdF7ukqPE53hNPzLzOUCd+ud6OGbXF9Dgn0Pa
 RnJUV7A8CaP3chjGrhgPUwaYw8llQvY2/mQnD+yYXdfk28nvg9g2mO+5UzoVTRtDX2uh/gKdVgm
 rZFGWJBWuSXGt3GHtOZi4DaM43H5rg==
X-Proofpoint-GUID: 9gj3A0grfRBO0q6_g_elzwRkwjxwIDee
X-Proofpoint-ORIG-GUID: 9gj3A0grfRBO0q6_g_elzwRkwjxwIDee
X-Authority-Analysis: v=2.4 cv=T7mBjvKQ c=1 sm=1 tr=0 ts=694163d8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=7PjLcmBxODYuNRU7m5cA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160119

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Add multiple fixed regulators that are found on the phone, which provide
> power to the cameras.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index c2f856a56b2b..0cfb24e3941d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -246,6 +246,46 @@ active-config0 {
>  			};
>  		};
>  	};
> +
> +	vreg_32m_cam_dvdd_1p05: regulator-32m-cam-dvdd-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "32M_CAM_DVDD_1P05";
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		gpio = <&pm6150l_gpios 2 GPIO_ACTIVE_HIGH>;

It'd be useful to also explicitly describe the pinmux/cfg states
of the PMIC pins, since these can be a little surprising at boot

Konrad

