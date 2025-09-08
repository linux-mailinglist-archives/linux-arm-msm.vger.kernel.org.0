Return-Path: <linux-arm-msm+bounces-72610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E95B494CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170D43A81BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669DC30BB93;
	Mon,  8 Sep 2025 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nc4WM7+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8EF1F9F47
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347791; cv=none; b=NbQIzLc8LwBiMv/di+Kn/p6vr0ox23F61+aClV8KoA1qI5oQx3qx5bzqEP6cIbV7hSBTDGG5W0gtqP01+YC6OspxXGpXHLHZcb521ZpJFW0RXqHii/4uNht9fTKdK8W16v+4dg/ZoiaKiIPRBXuB5OKP5zszKnpzBA76mqLzjMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347791; c=relaxed/simple;
	bh=ubWdoPQHWOLDpJjgP9VamsCXUKRL6blwyUiqfCr+RMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfpAa7PkwXDv/KzPn20PMeMVbyv+EJzaS4cM+OgMwDtbNZ23II2dgHIbQuND8e5izSY1iz2vHfdJHNLtKMrFasjzYCNcd5TCjJIWNVFidH1TdGkYpsBZ3cappk8oSZ/+HJT0Rd0Q85S9j7QR+ztJeg9m9HfrWMlAk1SHNdiRxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nc4WM7+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58891766014458
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=; b=Nc4WM7+r5YAV8P5n
	N32xQYxdol1iNduD+wLaVxRRACWnY9JFJ6LLHaQVciQKjk0WfkczXVAAzjVDrqET
	4nVoe3SR64EsEmXWPfnJ5H0jN4LN07anEG0rC4Y8npb6WnrmKyapzXPHxLA0Obny
	LQ4lKEmmjuJ0sqDh7dRNIzjvBIO/BixzdQtGfhwQK5+EjvkeEHRFzVonAJyM2rEI
	10U+A/rFJNwVtWm1ldOMW4azMiv8irhLapeQCFI5NwZSOqd+FFJ9n3XbwS8OCqi1
	J9N+h5GCRC9sZ9jPyeAjptssWM2TFVQjii2jhlaZtV9oT5UFCcPLZQapG0GWdWRP
	egMdnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapdegk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:09:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b601ceb41cso9550971cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347787; x=1757952587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=;
        b=QLvr3VgOqTEFGkI/cVgXthUK4rdIE243nsO+uUvRdt3iNyhCfFTVSETs1DPOIpxUk7
         DDeKJH9WlX/mB3G/5iJ0XBKR2B4/pBKbS6bDGluP4VgPkc+JWXp0cZlbY21I7BxtDbj6
         bH9eQWkZzbWerS9aXuxVd6PtANXJQtKFrweRZ51cv4t566biEY81DQ5sHJ36cPtUa+Da
         f4ftJW5WpETrPJPucpzvsFz5vPdwAFd5oa0FejacuhKZqdj4IZOIgOFz0rq29Mw2AHUo
         8fM3Nl/xcDUZHsovBDTXoyRUjNhy4ciHaQ6/0lIW5bQEywcbyhc8C6BTz92rrqyYYv+W
         mqYg==
X-Forwarded-Encrypted: i=1; AJvYcCXTbTzZxTvzd2VRgoKAnxUMJNs+9TNRjIlSIZQNsVZkbmVGEvaziyAsBQWCrm1rdL6Jv/LWooEkEdz0uP0C@vger.kernel.org
X-Gm-Message-State: AOJu0YxwiJJWwHp3947Tyvb77u4hDudsRFXfm5JG6+Wc5BGSHVe/OilH
	BHbCiVKjlwPO5B18bK81sqhp3y//J1QZJ9k+d4UmdjE9HjN/TmbTZGE+DzWF2gBDlIkhpvKIjOd
	YxOoMW1SMLXLjm7qNZ2OW8jIXD1OsJMCIbNYq1466M83hTuUZJpIg/bMXe5bwoyZo3jWY
X-Gm-Gg: ASbGncs2dS2lKmcIF1wkShPkuTdqpwJX0zcedfVTlCCu3fEH3eSoaK4zsRvI9rAceow
	7alocQXIhpt7iFlBzXQzw/UYs3mEZpvVwBD/Tsgg0/7yqnHu33zU2JGqtjhJiqgC4FZz1XHaVUQ
	Sfkl42dAkpH5hsZDykmbcj+MRjXhoHrP3+r+xJklZkw4racoljbMC3PEPxTvC9K7MMVmYgP5s7F
	P1LkX21kwbcbe/yOA7VE0VOEQE5vYz9jpiwPpYR63Cf1DoR7z/TKg3Q82nkpDoB4vJskRbRv1h9
	uQAEkOwg92xaVH36yPUzJizxo2fREBbSqlqmspXRP8EW7+JHISRv2FpTxjDi4A60BQhjSl4wrko
	3gnDuozXH1wB6s1I1u8UvhQ==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567581cf.2.1757347786594;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKp0kzn+Vp02fMPwlJf0k2yNql13pFOExJFPIqquXqfbLcwld8IobIzG+7YJra//PBsHnvLQ==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567221cf.2.1757347786096;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc579ba9sm21968793a12.52.2025.09.08.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:09:45 -0700 (PDT)
Message-ID: <92123e16-d98d-42c4-9dcb-573dd7eb1973@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68beffcb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Is5zltCUzCQjwDH9xFcA:9 a=QEXdDO2ut3YA:10 a=kxpXfmk2mFwA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ffgEh9Zjrs_wjAKwT3DhNAOnCMR8snnD
X-Proofpoint-ORIG-GUID: ffgEh9Zjrs_wjAKwT3DhNAOnCMR8snnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX5zLyi5jOqpXi
 qpXtWyUtBq//im89AQjgAtsVTSr1IU+jyFkjTpUPWjAx2mlM2uv9fDlvoFnTfrWX2Gyr8RnngAY
 bj9Xuvm5iD8WiTy/tZ7O6wTJMmYC1o2ZnwNX284tHcYlSC6y4yyJ2V2dq0OYZv7e2ZoupLu6Jvj
 SxRGkrQLlcgbU6XEU1x2rkrXXLhw3HyxEYih4h1lnqt0CybPTTiTDn+JUj+n5SgsRAQJ3G27YgV
 dkNX8I2vsw+PLK3pPnYMxq+A+YwYudr9KOrhOtOZRlwI4m6f3UJO1rOcpyB03fABL3aett05PiP
 7Dc/sENaSPERfggSnU1rl07ecWLN7iMQe5DBuwSdJiFclMWTYI086e2fl330SI/XprmBbPvUj9K
 1sUB6RXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

