Return-Path: <linux-arm-msm+bounces-47602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C1A30EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9648F1886C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857D4250C00;
	Tue, 11 Feb 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp+6ziyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77122D4C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285403; cv=none; b=aQ7Na3QpECKyh6JCebHpM4kqdNi+fFR5SBWOdcnxG3WBAjRa+dHZtxa4/eufAS9giDmmfVJZxg3CV+2OjvAGbxcrjXr6bb7NnIu5qC791h3nXg8CPYrOY7f8uK78mZfST0xR+LruSy8H6PMTxLzSJEehJmNjlB/ArJl9bjN40jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285403; c=relaxed/simple;
	bh=jdFTd4heaqF1waae3nF4Loe4e9NQVSskphOCed8h7lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2S/R3j9fEniYH9mDQ17scS0uARk8S2de0G0WqkxD251MR/NH63CgfPYkw7vUZUqnKrEUrzSXhTdRBvskfBQRVlkQNtN+29NCn49KB6QP/GMG4NkloNzVunjn+xkyj+00DPsT2xcQQJdtrXobwTMgRafMk1tLG31kqhG4GeWYJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp+6ziyI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHjIM026076
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9QQxW1CrdMOjnr/u7ZG72NR9gv+JDy1eoZ8KaTkW9A=; b=jp+6ziyIHb65iozh
	9RVFlMo/Pi+ZYkw+ukFV/65b+/w7nfKODthOo9qvUziQDjqlrrfUzoYNDdpZ2/im
	RtHMD/h1JF3f/9n09QehWXAnPrb5MSLLOdNBXb7JknzJeUCAEhRog9D/vKWL+LAT
	qz20fnFLPN5DieKa75sy6B16SFDbjsQCALbUjmGNWXg2GKjj4CUDvEAozpNwh+W3
	joP3vGfnfA3nB683zqvCAI9DbwaoFyJi1E1XAyMStJUr90z9Tk76fbYjgfcq4Jfv
	K059w/GChp4VWKRjA8cY+Z4TkTfd0Y5hVaZd1SKtL2Hj24ctVQoxbxmTPIk/TYNp
	6EYjfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58mtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:50:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19bfc2025so15337436d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285399; x=1739890199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9QQxW1CrdMOjnr/u7ZG72NR9gv+JDy1eoZ8KaTkW9A=;
        b=VgZGzPwHi8oHNFHgvTqDPUfnMeXs6uqcRXT5uh0VmAmmBL3940RoRDNZ65hhSFTKIU
         /0WbvGdP76Uze2WvnKKf0H85N6+wnKdDn6R/o5pv06gUge0aqZ4ObNKVl8ondApiTOM3
         Iusc9F1zqCLsB4osTMJpmyfBx4h8XoNa/sEK8luq689fH9jyKdnJzhn8h3DgMbO/Sf8I
         Vgd28XSAsbI/4h8s5hBImXD5wRRmRJhqywcBPttV8c6CW2gC+1SYFb9o3evv8I4D2owM
         i7xx1fXisa2+3DgojST0oAdJppIkJGXG8EdJbWuW8gjHSkDKU7xnX3iP6q+RT2wfrAgs
         E/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbe+4xuNlyNjtYM5tFl/p/CI4Aso1hmg/P9bN2/20NByrpWdgME73zOl5i09RZX9SME1vE6hFstkp1Futt@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNDobAC5wyrhaWvH0Xlv8tnA8nwtGEpHLlvFc+xwqXLGvXEse
	WcdIwFekTr2HQc/vTq+oQO9C8b0WGpKdFce8XHym0/vzGBYBE/7voTaI0co0Lvk0T7CW//o3YvR
	uf5NKDuAgANizGM3O3KKv1ftDhKLfwmkhZk+E+qqVHDHvWfcbzE4/wwNWzQK0eyCj
X-Gm-Gg: ASbGncsQOODCj29LLMyFehNYhJEHFIhdUYozH+hwXVRurXpw00bdk+8JVtWlKbP7rj8
	oRRyf1KNOBWXjHXtMnK1fj0LgZPA13JNDxWhrjQnCScRakxk3xc9U4Fmv+SEU6lovDOcPhVVJen
	ypIwamNf4YRKhgtsPWCCvk/DURvVaaW9GPumPqufvzws9D6T5/QiiMMIba9Q+YyC7CZ7w1YLZYm
	TfmVD1EPCsLG4msHLw+K7fcQiDK1n9Ghmb1PeVgiL/dj53GhIgqi49RXH96Mb8nMENIWNA7t5ug
	JJw+Z1mfRjo9PtV3AW6/qXQE0r3b9NAnJQc7w2SFZFLVZRJsV34yCKsqyKw=
X-Received: by 2002:a05:6214:19e5:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6e445715619mr91437526d6.8.1739285399565;
        Tue, 11 Feb 2025 06:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkk9DjPa3+ZeT3Nyflq6y5KlqeBXv7S25Hpw0rmBRomm62/VHebINsLa7PDQCcXTd8MmZyVg==
X-Received: by 2002:a05:6214:19e5:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6e445715619mr91437396d6.8.1739285399076;
        Tue, 11 Feb 2025 06:49:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e2711937sm125092766b.25.2025.02.11.06.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:49:58 -0800 (PST)
Message-ID: <52d29b4f-7ae2-4f79-b09b-f0b2a4e3034d@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:49:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: qcm2290: add UART3 device
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
 <20250207-rb1-bt-v4-5-d810fc8c94a9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-rb1-bt-v4-5-d810fc8c94a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xhnR8izRsatbiqhcsnhVPQ5w397YUg1m
X-Proofpoint-GUID: xhnR8izRsatbiqhcsnhVPQ5w397YUg1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=820 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110099

On 7.02.2025 9:41 PM, Dmitry Baryshkov wrote:
> On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
> corresponding device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

