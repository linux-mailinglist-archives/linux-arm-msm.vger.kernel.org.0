Return-Path: <linux-arm-msm+bounces-103090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDwIIgIN3mlfmgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF03F829E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA143089C7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724E3C7E1D;
	Tue, 14 Apr 2026 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzyBjo7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErkE0Flu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A783BA222
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159687; cv=none; b=G4o+Gwq5t6r10wbemzO940iLQcKe/UZ6aLZfJSYnwGjPH/kpTr6mvJLz2vES2HuFUzDBaqsKv4hsLzZUrSquWlPvM6JnuIaxaBSPxxBra2Vh4yB8IcR3V8rZpLpEoBD5XZc5ruQ1hUe2FJWg8hfywo+X0YZXMX4b+6Rl1I87CC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159687; c=relaxed/simple;
	bh=MSMc+Vupw6OBt2TRATno1Be0rh1dgFO8N5/ngx1YRBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEGChJrp9eSHp26GPAqFX6Tzf8BLhYB/8F0ewYQp8LO7g4EoEOVP1bqSitBpDEaAG0kO56j+siAzk7ZwQrZjCDcYnGCMFggt26gbVPJct29mvb+ZcfJhIRjcydK76rgzhGw+UdEpdYT52CMwXkO1i7boaYsbACw2LCMVQa/uNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzyBjo7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErkE0Flu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6D9J93505294
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=; b=hzyBjo7F+6LH80T1
	jScrahL/p/ngMgccM5cZfU0DYCqY/ei4+RNgaDc0WGLA70gCk91bsCXogbf93tks
	s1b9Ij0D07WdFwBskx+RBbOLlwnIRP+zN6GRbzex/mzw2RYYo1oj2VmLzWHxlPxF
	+hILN5uOi6vbTFTHd7j61elkhF1srUIf4OXgQKHleXLfdZ/2ZJYMX0icwWWyqUjh
	IdyDLyU8y5YdXqtnx6uTvu63uEal15/B4a7tI6x3wSO8stfAAjJUeGoyyIWcLdW/
	pPeactPbDoQvGmytjgIynF2xWfDCCtb08eC+EnzUUX9EsdniNcDgglSPLCzqDgVK
	2M44Vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870j621-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:41:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so16723101cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159684; x=1776764484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=ErkE0Flu/aRSo7nDgWfODyOAcCKjreVKmshisl5jfL9SMXpTzqNz5BmxU7UseuyY38
         MiIKqpwsMSQJVs2O6CUmOemeeFDu89S5zWCNWcbpYAGnw+9CcLCIGsqSVYXoe78OE5at
         f2+/rb+Jiu2jsNvNzeJJgEyaQoCoTpMIPVqGUmnaxwYDeeZ9wk0jYSiAwGn0MkmvZVPn
         SUTlBqB58XoWVQit8OhEl9i3sU/EJWNDGIGKZToZMmk7APFAl1GIA2EGwF6kV1/kbNMT
         GmQ82QAe4Jxq1YxZRMzrdb0lc40yKEcKCISJ/7AkRybZvKjgLvKKhXIRKum1hbQkssjB
         CYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159684; x=1776764484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=Bvw2Z09rWHqdNe9xkzYt5uG5nBqb1d3TrggiVfc5WLqTJ0Ia7ZY68KJsJUNf89Q57h
         lIZjemLFc7oFa3wldHfD5WgEZG971bDCvYIWq6wMXCH6DSg983a23RpMy+lWk9/YUz0H
         Dqr0qPZwncKy9rfkXzIIW6oYOOzeJaBv+FqFDT1bxOfhLRLQ3eE1d70F/BLzXCqWXWju
         PMq/1hykp0MbunNi+ET0qR4bJWnttxxqHeFbDEHU89NHZgpAW51wYYDzdl+DVQaqO6sM
         3aPV6g/2u+xO5NHGVIbLcuvkZmLuRg6EqbuYHx64v723ktVk1LTFgSWG22nd1gC70n8V
         vxAA==
X-Forwarded-Encrypted: i=1; AFNElJ9SjkDuUlfE7V3ddsrKzt+08nDyCR0P6ccMq7ZqP6swuB5CuPsRPFMTg6r1z7pRgFeh5adVqqE7mED2UCmN@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMUtZdF2ciDY6DTqh8KUWy3HwyA64XunuKdEGS7qKq5alRE1P
	l0+yUgIZScdfGHpsgc+71GTRpluvXyp/6TvBTaehZ2XlWjqmnBnjVPUs4wiCiV1j8X2JuHhf5xW
	+/cksG4wVPM9N6UMT98UzWbuP3nbrtM5dManeC2Vdy95AkbIJQuNw3Z/J+gklznwwfr/p
X-Gm-Gg: AeBDieszU5QRZ8K4BxH/BCDTk6DMvW5qSEjvAij5B18bPoLs1K0UiheTDPKl5HpfdJL
	+CfJg3+RHY9D0vNqhsx6FlrtXcHIJeQSyhL1+mw97lWMIJAiD4M2uujiBZUVcggQJcUNL8gd3zs
	3zZ+IHXlMrxCJ9jgkg3Ebs9BxMUYOvTA9e7znKh5Yc9V4/JuMb+HZvP6dao/GiZBhhheoTEsXUt
	Z4ICOZ8kp0Y8v8uJoEBWJtSFewjrOV/+6r6sibB5rfW5yg2foBQJl3b+B8ihoz3fkI8EFLzo4xB
	xiNPDXaVwQpxPUJoUbkAnUROBCyZ326177pZpDh7lj/fJbJNOkitk1RpIFQXOiA5myXtvt7IeMI
	xPWTIP5wl1l5PLXDjLTwVXBOU72JgFX5ROIEahdlgYckaLexNon1AeF3Mtm/5gA9YR+pnkyh7ed
	UwoU2lM0PVO8WQ/w==
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301241cf.6.1776159683841;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301091cf.6.1776159683256;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c89fasm384601666b.49.2026.04.14.02.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:41:22 -0700 (PDT)
Message-ID: <db41fea8-8738-42c7-8575-ddaca999620b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and
 Bluetooth
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MCBTYWx0ZWRfX9o9hdImmEet4
 wRse3byZf1QvtwiODsvL5uZRXQaERtZh84gRXlfkkGNW0a6Sk8vvMrDl4ulHorQKrzAQhblkKW/
 rm3uS2yjo8+/KBxv9a30iUkiG3DtVp3ncVP9zUOy8mj1IVTc/wOm6ules+uHX+oE6/EUv/B2xoL
 xWeR5PLTwQTEaJ7g6zYz8q+Re0EP5cWjN46Y4gAFfNRb94/OCdWK/V9QmM7fZpgG/it0PBHT2x9
 45FULR4rxSJvclyqY8xOs3kR8eD089SldY9lSI6YcSqqeTD2nI+hyDKQgZisajdjRWh6+AcTY9x
 oYNfc7YLxLmQRbLxg6wRteHI87e9icWN1grSXukCWXte1COLu71mFG634j+p4a89Oua7wR96/6i
 C3x/RldHq5GgWJv69lT3y4vwncgxiEfMedDOgVkFnaPr2407AusQS+1ja1COubo8v0eS/wlr0xF
 /VAqPLfVrEKg4wUNJxA==
X-Proofpoint-ORIG-GUID: tFPKu7jxyL_Fg8y4rGajdE-u6G3mcXg2
X-Proofpoint-GUID: tFPKu7jxyL_Fg8y4rGajdE-u6G3mcXg2
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de0bc4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=6yk2MuD3qlwx9g5reDkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103090-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BAF03F829E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> index 591dc837e600..79fa9bd038f2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> @@ -95,6 +95,25 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
>  	status = "okay";
>  };
>  
> +&riva {
> +	pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
> +	pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
> +	pinctrl-names = "default", "sleep";

You can probably move these pinctrl assignments to the SoC DTSI

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

