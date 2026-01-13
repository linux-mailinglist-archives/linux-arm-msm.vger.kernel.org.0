Return-Path: <linux-arm-msm+bounces-88731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3BD17A1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D29AA301E689
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837803876A2;
	Tue, 13 Jan 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfuRzeAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQaGfADS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562938FEF9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296449; cv=none; b=pmMjEoIjoTpkjU5dnHBZNatO0O2GgrrR2OCU9QHPRySRArbcW98uDv+2I8GWYfMMj7QFtSLXOkH5SjO6bbbksqLEGDY+LKF9PrlRQ0yR8IYtb5ddduv8siRo8Em1i2WXkHBhZOepHTrAC/Dg+Lk6Ki3O6k84wgvZWDg+zjbwFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296449; c=relaxed/simple;
	bh=Fz3cR76+MaQp/XIhDc9c1VZP14LpV9CinThbODOLIbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofOiHbsJ4w+jonIttixtuG53Hz/IF78c2bPC2HhUZD3uI6JvkZ+8yADB3fcTQoSPkZ3X3IjYuiAYUviz0Lebc2qHSc1v7I6yHJgp9+YFChNa+9gExv7N+6j5SMqwzSDY1Dl19wND0jtc5K8p7rw+ChbFV/1Zpo7OACw7VET0lGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfuRzeAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQaGfADS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7JdCa177668
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=; b=SfuRzeAnhaBhpHwt
	QGX7M2WiauFLwmlpcawn0szGh28DJC9ORgnPNXr0xWVlCwlz1bEPFK3ALJVaUjnA
	otJX7Kf58xcl7T5+hPuyNNirAZi8L6HOtegrxGBgVebf0BzNampHT/6UzbvpvDLu
	+LyA9B7LbXpEtF2W22cn6okBP087PwqXtj6GxbdeWtJ3jpEnrE17iqgyi6AM5MML
	isPNdaSGLVU3nWh5u8Kl2Zza8gqQUGDK5sLyTmy34V0UVqlOjULeCYJ1WmFpLjht
	wJJN33dZm3Y69jgrL3Y90Ko/AzormH4Z4sMpozC225iOziob7OVyfoiU0//Z8BIK
	8hlbFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2khq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:27:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f77be4f283so10915101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296437; x=1768901237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=;
        b=JQaGfADSk5ZTNG9lYpDs/meeHDZpTlrHTNfy9MhJlQFL0lO/w9TzHdZFk1oCgmzwtm
         qrArqUzbl0BbEIW79iPe2cyWNhcdNKPfIfCLCSS+ynJN2dkS1PZcK9FgbpNA7RCVRruk
         Q+/+h/LS0KfMpf7hsqbFIF5dqWWhJW5t1JZPK2niMNjk7RR2k6UqbyAY2s8LVGuaCg0z
         59SU6DWBF/NDmWDK+oHLGHYHni4lBda/kw1pbtjkqsDhg7M6pd94P2hnVpMVYtXDFVzJ
         aaYX9CRGDQEq9mIqWLrWcN4SgOyATGZpNb7sb4DEgyI8osFpm1pmsmR4u/AGwTnlfdW5
         NAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296437; x=1768901237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=;
        b=MpmTyaau6TJjDbBjAGwArBl+kmjBjM4lNXvtcG7f7LHzCXhbq8TpSt/z88CwliMxq7
         pzSvxFibMIIw24bDx8gco6hqudYg6N995YxjdXdK6Jfps70aLHNXzxV/gASB/RN3aJW2
         w3G4865eOGmTOwB3/wxudmdz4L3nejcxm0xMoJy28W3gTj6J1pmvr1n/L8gMH7hC6Ujp
         fREYvY4wXtTF8vJOTSy+O9u358qjmteJbDsGvVfueCbVFvu8CWuOF16V2EHsHpSlN2tm
         Pke6sRgv4gwoNyb+RhKWvDfBADggJv2raWNzHQo9YAvGfeIE7sDrDwJVEVOJbZ4yWsvq
         SVYw==
X-Forwarded-Encrypted: i=1; AJvYcCXLZZvIvmhL2AYvIW2kgERwB1InULsX5rnA7XodXuj9gakKcHTgRi8tBnJHpkHuljhMlB7XwxBfz7+H+Gxb@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4+kd17r2r1ijN+/r9uY0T1wANlHdHysoVTOjW9U9Gj/6ftQq
	9Pzlx+UDuZBJL8S/Fkuo3pTGSI1FH09ACcjpuozMwS862/sk84gE2F+ujsPSyjt8DWx9Tdm3dON
	MLN/q9CBGs5wm8/oAvxRpeBfx12H9Y3P4c4HYr1wHW6ZADtmDyiTWEfHjMRE2tVEbPcP0
X-Gm-Gg: AY/fxX4wwa5kcV6bJPvrE/ykWoGixlNAlGvcDVenGqNwKjiA9Yn3lq771PVAxqLlFOD
	/snK6voGDJYBoQoF1BFGGu56MNdQv4Fa0HweruU5xV/8gFmr/PvtAd+9SFhAYFI+VRxYS5wdv2V
	3gNwBj63xmT+fiFJW8LmNDXhAaJfn/oAbGie4cspYNIqQSIpB1nmkBWOWBSZfKtTbCz76/yeRs5
	/YAlBQq/hbnVC/QSsmrqQW2hpVngh1hCeLIxt+4Lxx3EpIJEjhrnQD3qIBgaX33iN41d9Cji1qo
	UEFSfN3RsqTmt6iJC56N1uVbBrOjpWm3/C6rniugu1OXoY96HCoFfg/IAZEH0DlgcxLv8j5QmZz
	ZMEjKHAaMehs/6hNXR7F9gmPY5SMI7FxPjtj0mCqDgTqSAhCto+Igctg35k5+BO4N0Qg=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr225480791cf.5.1768296437232;
        Tue, 13 Jan 2026 01:27:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnlMTzNrNhcfpXiQVSIw1kY27USHt4pc+MMDCbypU4h5Ch0yyRWR5bQ0m9fiujeiYQv8MIfw==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr225480601cf.5.1768296436809;
        Tue, 13 Jan 2026 01:27:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b873051cc88sm286593566b.7.2026.01.13.01.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:27:16 -0800 (PST)
Message-ID: <6a4f7953-1db7-446d-ac2a-0870f4f3a260@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] needsreview! arm64: dts: qcom: sdm845: Add missing MDSS
 reset
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OSBTYWx0ZWRfX9wzkeFDawHl2
 AOeaX2RUSiK3Dez0fWEMrZmX8XigRbBWS3sGHYuDEW0jOyXww4k6UxIejk4xkd0qAUVV3uQ/f/F
 KSTw5xKc07znFfUv1hvJ39Zia9M2ph3pvDAOKslic32KVWM85zpexsRIgYkm+omvta9rmeFCkON
 8wVy0DNCNG7p4gfQxjKEtYL+vq5V15W5RVC5nGL4vJl5gYQLUQVOlgPKJaM/NgWjQYydQ6dTdL3
 wh5kgauiK7uuDGawHKtjNqmNBwvFn78ZS3BYTJ+SW2AW5kM+oRNbvPR5ghuEnYBcninpeLLJM0e
 kfu/DoxslZHa84rQFRdynmb9zeaYe51/lQf2dGhFjTb4yZaQ8LHnQQRIUbIvhas79CVVCNgredE
 e7aC5jSWpQJ2PF18+urvL1MELI35BjQVcQzCnI9WJpCCH/IWBkaDla11iq+f3CBG0osiZGsRB2J
 jvHYW9dguM/c38lKSUQ==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69660ff6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9UNV2iuIHs_NaximHYUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cRqZwyXfVe3Sygwlz4GxasQi0bDpdJAf
X-Proofpoint-ORIG-GUID: cRqZwyXfVe3Sygwlz4GxasQi0bDpdJAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130079

On 1/12/26 1:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.

This part is reasonable

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> It efficiently fixes nothing for us (at least what we're aware), so I
> assume the state left by bootloader is good enough
> 
> I sending this as a something "which seems right" and works for us in
> sdm845-next tree.

This part says "I am only doing this because cargo cult"..

Generally this patch looks good, because it describes a physical
connection on the SoC for the OS to consume..

Konrad

