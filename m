Return-Path: <linux-arm-msm+bounces-73502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB365B57201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECBA1895FF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BA22EA720;
	Mon, 15 Sep 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYcBq/rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A02E03EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922608; cv=none; b=TkVnJiKxwmZXsNlfFc0LqwoPWH3FLLbP/lRoilBDheNQN0gBaHfWMGMLvaLAJn+SXEOvH+Y2mW+Jh5EXmcIfqHfnDHMrWlvhRy9gHl5Lpa3dUDU7l2nncVcL3S6eS0mCKPfimK24tVSkmeN2rdTX+gh/81N2579n4iyCjMeahHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922608; c=relaxed/simple;
	bh=imIwfrWHj9CQmVA/0RQBUojS0AI0wdZSgd77TEu3Ta8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAZEf97PBfLkV2ZF5ae7ffc2mXoslOI7GxVh/fpxUqWyGl4iYWPzxLFJSVn8dSK7WdN6gQEjWImBGEAc53Y/XEjjvd5VRL+qeOv0lPPBhJsj29IZC+mXxgMwAGt7wdjOGqosUp1iI/FJ9x8y5TxOFN2JLuHg6tHofPK+vJqQ4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYcBq/rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7HxIg024499
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFvQk9L7Sc2ogFTfxkGGaTbBywW0snMelbktXcT6biA=; b=AYcBq/rpbD2QYOl2
	Vheqdu7hdaICz4pS+OWcBxCqTLqbcGJB1VWwddADXBRZxUOiPVtTjq6X77fqdSkD
	4N041k8wIxUbo+/t3c2BDk+rkrrg0qvuSbinBlUzw6WYQH6/aXRXGvQD3dxEW2PR
	WcNS9GKOfm9C4BujrPfpdD7nRVafEXHKMC7caQn6gWsbe/e7vn8ADGf4O06KhLNH
	saSmA/s4ZS0i0h22wBkBk71nwtREAn2qGPA6E7a+G+1J5oxNFH/XqQddckHnPX3I
	0WPCA5pG1dPU2mGKrf/yf1HA3snef0KrWqRIm9YBLRD2Ql473Gph+Jo7l9+d1giY
	KXxrgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr460g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-80e91c02c8cso104128885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922605; x=1758527405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFvQk9L7Sc2ogFTfxkGGaTbBywW0snMelbktXcT6biA=;
        b=GQrjBCTb8B3rflfbqInaE2TkriSxyqA4qUpN1DUXCNJyocCla+LcqrPYwvSjUEevJ8
         MUbJRWQWIPt0pS8iDM/o5k3PzTm6bLWkVZaPMAVHS1iK0JHI7YQypCvlHgua+NJz9bOb
         DKLg1+GOZvuPiwzpx8x3Hg8Dv9dE9u+Kq6+QkSC5nJlQ/inwI4YulxT2o7A51fG68fOd
         IRzcIDBf4WddkRpn9nBRy2Rd9rDKFt9Rtq9jox9MVOEc5XCIupFchb6m+QhR6/QMlrhe
         OOnQLHZC2QCYWZ2luJTj9qZn2La6OylLErRBn4BgSzKv3q/D9TYTZOtNWbtxNvn6GNqR
         S+lg==
X-Forwarded-Encrypted: i=1; AJvYcCUYtiIyJYeoHAV02uYiIF7Y938sPKcq9G3gnt2Cs4rqUv2LI4CaFlXciy5UqWW6ote9ZqZ0vtwad39dwZ1A@vger.kernel.org
X-Gm-Message-State: AOJu0YyugmHrvjiHE+hMkLmGhZ13el2pdh4LAE2FG3Efsa3XvXiH692X
	ylgdn7xCbxvMm9hCmfv/2N7x4DAMB+MRnnNX+s15qikgFs1jchPvk8R2/0daaJUEvDNHFG054bJ
	QHqzszQ1Ljxs5SUbCBK0XsL9qS2gOogKvZbW5YkjEQaqEvXFFJYHxYt+I4EpKoR4doIJq
X-Gm-Gg: ASbGncvB8Q3CIrPmT4M+bNZbfzsmvPm2Km1sgVhyoR9WSBwLRQwfEH2G/khXDOMfvTl
	HfigaI5nOxasAP7wZcSFZmZ4BXaC5rbIMVPtOjIvpEN1beJwwMa4jJofdvANq+muu40g8nTmBds
	AroPHuRK7/roOGGMbAa/+cskb8P4tY0NZfF9ZMC6NlQJJImLObqWCRjcyhszg86BVVWwPj0Uyfz
	EUc93hyO01VhcOLema4nxrGEVoiViCd5h6+TCSRrKzkLDkZ/B6nLP3nGLUFz9HhJiy1900Hw84B
	LY0pwHHq47AhM+eq1H/sI2BGXKvwinPWsgG6+631qKA0qqkC9AFU2yDKrAg4aCB6Vzq3uLIsH3+
	512fK1NyfW2c7cfXdXrbc9A==
X-Received: by 2002:ac8:7c44:0:b0:4b5:6f48:e555 with SMTP id d75a77b69052e-4b77cfd4f60mr94842201cf.5.1757922604566;
        Mon, 15 Sep 2025 00:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAflOJ54Lq3cHAk5vIwFH55/fPyxggfOmOlLP0TjHN6i+XfS8IJFnTqbJiNsxJwWBvExHJhg==
X-Received: by 2002:ac8:7c44:0:b0:4b5:6f48:e555 with SMTP id d75a77b69052e-4b77cfd4f60mr94842051cf.5.1757922603937;
        Mon, 15 Sep 2025 00:50:03 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347b90sm878500866b.109.2025.09.15.00.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:50:03 -0700 (PDT)
Message-ID: <c9c0ceeb-d9ee-49b9-a8c9-f4a4d13ccd96@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sdm845-starqltechn: remove
 (address|size)-cells
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-2-4ce9f694ecd9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-2-4ce9f694ecd9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vvmFMQPNpPx-uJW10UASLgUCTVeQSfxG
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7c52d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=xr6KYs1_5vtqEaBoEi4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX4Oe6A14ZpYBP
 SPGwUsv6H3gQ2xHAy2i3Ftmid9P3TE83B3tMXTQkf36tcfF5agdF2rbU1FM+vdwsvQXNzHw7pUG
 BT3h9FFCPJe4mCVYnDbSNFqWE5vBKouPIupqu+0FzDosOq0Jwc0V8g+tMhxnX3e/m50HRMKo4/r
 ToSFNHb+lJlU2Lu1EB3Ft7dDeXJBsxzA36Cr3Te1rIOXOj3wNv/2Q6DQUBfgvb3bXpkorUlnjlo
 bW6o0wTwEjkl7vQwbTCtCqKodNdKoSyrqrMLYFtoiVz/3hNjGGZZHqFgR1T02sAahFt4s8KnYqs
 cjVjkMOgaNMzJ3wtb3lONK2oC+u79ALTMaDhknbvD5DV/mMfr9ux+U+BBJAdxX6bTJv1GpdLxCB
 wR6fHE2w
X-Proofpoint-GUID: vvmFMQPNpPx-uJW10UASLgUCTVeQSfxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On 9/12/25 6:47 PM, Dzmitry Sankouski wrote:
> Drop the unused address/size-cells properties to silence the DT
> checker warning:
> 
> pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not
> match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

