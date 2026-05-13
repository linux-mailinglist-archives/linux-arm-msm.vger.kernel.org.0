Return-Path: <linux-arm-msm+bounces-107246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE90EDlKBGrNGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E9530FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C554630237DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46793E6DCB;
	Wed, 13 May 2026 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7On0N/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UD1HoV/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C73EBF3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665407; cv=none; b=JSCwpChXbIoGGxObl9tENGsIH53C0mh0ejW7pgzJeWMni4P4SYoAu4fOKBo/mZ98pRyOwPqx2vCW8+C+rPWiq45FRgXC35mxjA+78mcRAoY37GRmzL4qTtj1DHgN6CKnOa+q9UiREfPAkS2G/CvCki+u1Ix25hg80+jVH4zgUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665407; c=relaxed/simple;
	bh=bsGFC6Oz+4oZsRZtz+C0v/Pa5JRMFV/QVgt0tDgSjBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvRZJ08Io4fQi/NwzeKvF5U8ixOc+MD2p3gYRSMfhiS4MGqGAGnW4VyHFKWKds7iI0MTuKeENVa18yrEM1gr2gTfI3mZx7PPVEbECEjbZGAu4HC0J80eQpTRlvW8hHvgahZ8z8mpudZwsrgC2cCk1U6dYNnrh262KNqvKQOkGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7On0N/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD1HoV/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pCtk2331501
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=; b=a7On0N/LRN0BlA5s
	ANmafBF4OCh2vLrg51P8RV08QssmZ6MnxvKmq9n7CYZifuuEAxQNCjq0Rx2CwQQK
	gS09JNt0/yHbfd5AbDdVWQVQeyUQkAq5wkdn5AFB9F/0KXIc/n7EDUQBgZnxBhU5
	qrY16YvA65CtNmketWkQ500KuKEQ3TbK7o+HiKzXjG8iLZOwEwJbgPqP89ZqcT+B
	GO+8BsB/ApsAFLw5rfmskoSB/nGxJnrV7D1oxVJBtQ1VC75o0SmdMACCKj40MUBl
	mUYC0bQabxWFfqkxa/jAKtVphInwaPPeTE0wpfSPudULhSSXhCXP5zKOj0pl7Vh1
	TEFxuw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypcggn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:43:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575296be5b1so632521e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778665401; x=1779270201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=;
        b=UD1HoV/MHdytQHMCTW+nf67Rdlx4KPcyH1rLC46JsK9hrd3vQNL2Kz3rnrewzIJXeq
         8gU6mPOgJHZ1rq3p20UQRtuXfkKdQSUab6rYEzD0Uk07W0MuUCudRRUvuAx44qjyUEm9
         /j4UGgrrJvpYF9gD9qKpcP4LJfiYluSdZAhwvK65jEZ2wZoEw+O87gwhne9p4bm7zpYf
         Ousvij92xvZxryr8LpV4Ks8c+lo03O3zC4OtaF0noyRJwUDAPQtPGASQP7vnwoQQz+lg
         XmjecEMfwKYQIYg/YGPs92RI5cRz5NLA4Lyb4e5XxNIzKL05tafX6FuARgpy8C6IUIhX
         t2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665401; x=1779270201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=;
        b=cybTj2c91lEvGnlRhoAXpG6CUVY3eKcfikLlcmTmXux3dfr55g2D1nxro9NXgCg/Yt
         edDCwQbuM8o0P3gr9m9Dv4orW2UeRg7UattMdEuvTtGKHdkPe04noyE8IHtM8R7COJr8
         WbzREyWxf8stWr2GHmusqqhNKx/ocd7L97QeOOLK8HFdnHZk9QPV5PbFocm/IcKH2J48
         vpwIPv7F1lF7r2c1EgE2k76PPJ1f2QAPun+C/LUFQqr2ViWHfAQJIWA0j3OPnCrYA2Su
         adbwf8bfp5c0DJ0gT5NQgqCsp2cgVJ6XbgWeEAX3m/uTH42CAbhU/4Y/vfcQ/6ApkPU3
         N8OQ==
X-Gm-Message-State: AOJu0Yyt7bklrrTRNOQlV/PQS8HXMAsU87nvRkV0Ijk/0MQIeKvQjwt2
	W7ImFdxVrpiT9W+nxJ83zLwTMvSh8sCnhPfyZl9y9GPdsAdE3TJZ3XMRYvNh0nJmIelOu7FoPWf
	5PWQRV6zEhqCg2Kus/saQSxUJqC4R8p8fDRcMOGFOgTvuu/8as03tMpJQRigww7d8F19y
X-Gm-Gg: Acq92OEqepmxI4pNt7xCWQfhxhG2fZQxaHGxRMORpuZqQsgXCNstTZibQwkgBjHBmq3
	9anXVNT7HoTqaCTVAoCMEUWEiF0DfV+z3VaRjDBapTXpW5Ms96iyXtzTLd4mKPPANWs2SSHfEQ/
	pLZ3IyNsCSw9xQNbkcoLARIv3AQncnXz7zYAEwL9LbBf/+AOM1WRBMGUBStyc24HQLFuZsctyb9
	ADmFyqVWB4C4MtCJ5g0MyunPMvL3IGNQwCyBDwGDGynDK3d6O3w3C6alcmU7gVDAukmaiEnh29N
	ExcQmatJrqhB8X3NY1JLAhy2MAEdv3ROqkilLbsIaLB273vPyFKgR5aLflYH9rrXVTF1oy3VovN
	589HqxmrRJGfmEA7wQpGb/Nv5k7XN6bZnB0KwVvIm7LoyfTIc/aiN20CvAooF8GKW7z6QLiDUK+
	6vM88=
X-Received: by 2002:a05:6102:5d5:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-637737077cfmr252574137.4.1778665401583;
        Wed, 13 May 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5d5:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-637737077cfmr252572137.4.1778665401228;
        Wed, 13 May 2026 02:43:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcbb2b1c3adsm717847466b.35.2026.05.13.02.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:43:20 -0700 (PDT)
Message-ID: <ca27a95a-37b9-4c5b-ba9e-7d977b0c0162@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:43:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
 <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XpD20TI6pJPkJdrHccig6-093YsZEvwr
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0447ba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=68niEd13HyaExDxXyQUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMCBTYWx0ZWRfX/xzgtSXnBSuc
 WkdrvinlAMEL4EL/oaJ4YV6yhHkQHJr88+qyuc6AUTxE4kxGRbBZKUTlY4ofC4Do4/EJTnKetFg
 h7C5Barn+lOKFktb1EWmVadceB4fbly5jXFK/1nkBsT6oENPfMHsU9jAf9wckkqM9FpUiX0rT9y
 oshhnJuocPmyx66/rBhDGqgZnQoQxgCBG5DTuYQyPYwRJaKTaLOiN6gPVi2hbyFm43DYUdUA+JW
 8GRgWio8HsEnrCZojmZnTOrL+aNWlZFe8PaAHXtuduYrlZJnRxDv5oAKj/PaJgM/U2z4c3vYn0e
 5O+WT7mryT1lI8icAuFGIdDZ6XcGtk+R3py8OAqRPvMjfJ3YgtWF/yEG3TBxallDuFirrrXx55x
 zdCKqNLqQm5g4ikFubhSEgLnc6U8KOTy9eZ6ietaRxPM6jzbwFRlf2nQmtsRtmaEHLvSyb5OjlU
 rcraJI74rPDLNMGutUA==
X-Proofpoint-GUID: XpD20TI6pJPkJdrHccig6-093YsZEvwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130100
X-Rspamd-Queue-Id: 2F7E9530FA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107246-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 11:18 AM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

