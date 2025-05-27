Return-Path: <linux-arm-msm+bounces-59557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A582AC4FD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1968C189D52F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C21D248F4E;
	Tue, 27 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6Fnt4ew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB3242D79
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352803; cv=none; b=obExEYiBVyN3nsTlD+3bxWuKcsBmTXMNvnYta4XFkiS2QuPkcHYF7+h/+sUuE0lqtYe/gENdzBEWlqXLodLFW6HjK65H+tY0P4HuhUqXnA3Osm49JmJGIciZ3LxVRu9zu3HGBFjjrF9RSY2V4QTAUm5pCQ24MYlEl33CcIvlbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352803; c=relaxed/simple;
	bh=wR7Njg6dgwD8Ok8E4irPjOJteY0XUc6ZQZzhYXAYtZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlQQMk2tEoLxkLXtBiEw8iGlks4K0TGX2rRxt4AmGe2XeGwrytcGUDY/+ejwIQFkx4+dpVBECyBPM8EYjFdkeFWODurSwu5GEHWXJHDThRCKocSm8KgSxzQKk0z4iF65tiWiz8cReqCABWlgoP8TdaMViNbJvSeab3LFyODaS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6Fnt4ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCSHIQ012234
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sf3ZDOW7jLeRaHKCxewndBSZWU52iW5rDGhJ3dY4AS4=; b=a6Fnt4ewlwant/Y5
	TrzK1myff8Ttll60bfCP5g5o2EC4TnGrqLVSBwC2HLHcyJHTQXEaY9trkukWkV0L
	YDZfaNQz0tQPd42OKZ9OJJYFnT2PnRThYtMaWzv+wvOAaOSAMimLEGsnaeKuBDNt
	9pJ97U8/JR2Wry29pN5nDQ2EFY1XAKavo3GfzXZEK+F4c1pR0CtFPuEwqFi3OA61
	wMKuzAoShKtYlUmG+CRgNdd0FRYPEZt63wfN39FP/Eohw5k4FcbRtvVkG1Et78L2
	HbiCBtFTxaErE9+geZDLVrtANhuW+akmvp/g7nIx8YqPXTaNkb0sYYlFZMVSiP+J
	C71qZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w6919f4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:33:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceec331273so111407585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352799; x=1748957599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf3ZDOW7jLeRaHKCxewndBSZWU52iW5rDGhJ3dY4AS4=;
        b=PkyVQSxygleoVQA+KvthHcALgf2KCyvqPvG677xrs7Js8aLQHesQvIJwJnJM3WoCHO
         C2ymYQw3JQ2ochJQcNuI0/QGUrfikynB/MnePb4zi/Ii1rVIofV/cIocc3Mw9m4OpBC0
         TM+Rsg8AOC0NYGZqfVdKmc8FODgPH9KM7KzGVSqgaTWpbwRArz0PxfJsLDk9HAH7Z3Yc
         DXf4lbj6qpLR9pyiwZvkWeODEBvoa/Zu+cuXpHtE04CUrujc25Y+Aq6iUVB8ozSALqK7
         Ctp1QOnb41kkCuYM9qYBSPPgY8ZZmav4PfDLBmGgJ9iGqRhepc3V1Fd5eAfmgLVHNNAx
         0TWA==
X-Gm-Message-State: AOJu0Yxq5Br4Fmj0T9++tczsENKcb/ZRayq9r63fwMhi4rOmby7c/+Se
	Tm8+tc6aRjthqBJMcPq49mtoymmfpfxJpy1LJcikdIbymS+El0ZWeQbAx+DL2VB/0NUWLmbI5Nv
	xkTLsKjkgQ7qmfvifuiCb6suPMzJJ0bcqeLbyXTu5j6M5+Vj17OHZSzUQI9Rcg3sUGWO0
X-Gm-Gg: ASbGnctnC2m4WQaShfzfmZNk3sIRzeTqzcRRteRbpJpksfPGMZ351alru/BSrNOEXg+
	srsRcMGx9+FSBO3TY1Mv1kayECWIjEZSUPJNlH9pirpw7zPKTEQo2BlRAUdjXSqFi0/y2a0gXqv
	s+4I/Vl7xHbC2SXL6/jNyTrpUTioV7VpFNPWh4c/Ig0eV4OInCjKwoZqT7zps+VeVwJEmvtYGm2
	43+3YsJfynaTe8eaGKCMo6e1DnhYLikErEWJnPizmx04rWpicewzvb0l8b8hinQnqlkz5v7FolI
	TAehwjNM8+oKbYcJzndj9v2GbSYBHDtCmoXzRJYfu21YQm4tdeliT1QqQOpDI8yFiQ==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr707843985a.9.1748352799517;
        Tue, 27 May 2025 06:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxHp9Kq6xACUrOLZeAPK3xKbLCPdgK3Jt6UEMD1d7N5UrCW5O84Ipwm5LgeRSnuCUJQpgxIQ==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr707841985a.9.1748352799038;
        Tue, 27 May 2025 06:33:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f33182d8sm4940505a12.7.2025.05.27.06.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:33:18 -0700 (PDT)
Message-ID: <fe4d2887-59bf-45fe-acce-604185aa4081@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750-qrd: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
 <20250526-sm8750-audio-part-2-v3-3-74429c686bb1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250526-sm8750-audio-part-2-v3-3-74429c686bb1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6835bf20 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=er6kI1bek27KySCzKVEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZI8uHQWem8v_ESuXinMSbr2wUIkn4WJp
X-Proofpoint-ORIG-GUID: ZI8uHQWem8v_ESuXinMSbr2wUIkn4WJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX2VOrX1seTz39
 5xGmRaQTadu1xkGU1bH+y/lpcmrCZKKxhxfauXx9TdgZDbhGTaOZKI7xYCXAz/uP5+uYxM+Iqju
 51sRQhx2mDyjxlIQwmKdpZZljlJkecKXsSUVCl0TDPKtniDTOCUSXuh1vCfOplk29lgAhevjBQr
 O5hm4CK2BYMrTZibf5WGpsShQcSTWWRpVITCzIwIHV0+dJC4T+5m8dNUnYBWIswRIbtPf0JsMRE
 CGufXT8TkohzRfD505Q0iIbKjxLaJtwgqyJC7ip/GMP2XHuLXjESDh4/V5IlsqIgyft+szcr+UH
 rYOFawy4lVL+s837aumc8HsmE4I6tNC8bridqBIvdHrTvRRVatOv0ajEAQhxkfFmtWTbC33pbUz
 bWbZv6AOnQoBxN8UnBN4xWPPp6VdbBUybd19fhrn5Z3ATezZZWdOP/7WpbSpIitNxgTaOFhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=909 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270110

On 5/26/25 1:46 PM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA884x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via AMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

