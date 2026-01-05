Return-Path: <linux-arm-msm+bounces-87506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4872CF4422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F09307D815
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F2B2FFF98;
	Mon,  5 Jan 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjz5YZFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUzW1zya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73653002AB
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623891; cv=none; b=YwATaOy4XmgA8W6JH64BNKoi4OW6yNFNp7MVhkWcKipvMlkWclXcIZSFt+H2EWUQ27Oub070WOXHrBbLrAlu4X5OyR03/Ukt9XEqkJ+xwep9E6KngZgDGL6ruI1lmPVbKARZzOaIJtW4TT6cR/1XmGbRHIaW0ct8wJkgAhu+RMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623891; c=relaxed/simple;
	bh=NZk4/R/YDflS1hpy0HSb0LkIF431dyVMMsJ8DVRByzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeUYargDCewlFj/oWfaMWH7Hs/18Kq+65o03lvxsUzCuEje8KOnpJYnIfhqdy0eMo1oW08JcZub4pBaM7QY2jwSdwUwEGYfhLGA7ECfPo0RzMIpo1g42+zAdlmr3a8Jo9GLRyhilVb3fbzpE9x4o+lpTOpPOiqkbAng/DkPliQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjz5YZFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUzW1zya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cjX1610313
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=; b=Sjz5YZFkbaAgPHjf
	Xr9nC2IK8gcOosOfbQR9gmuDiLdzRNN5Gn80x+bjHA2o3r6yQdPWewpxp4r83EiG
	Zv1au6np+62NArsD3ELCAopT/5HYpXUqLYBd57s8/Y2kwb0VU7Pu6Ib2+scoeMjc
	XQ1fybwC1yz7qIJ5t64pYUsPJj/rMVzHYBdCnIMmcihLEuaSzveP3gHrD2aD8AMu
	yaRi2Fi5N/SxdCuFh3uQ8TasAG0N4yuZjqXgZstePbkeYhoU/5Ncw1paanNhNFop
	+0wyqVHuwnX7aqdQz0LZLyqB1xqVKdCyo3Tu/zH0LuE+AgAl8ObPt730ZVAf1a3p
	Hv93GA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0qx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:38:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so51597411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623888; x=1768228688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
        b=PUzW1zyaWpxq567aAImJyuNe1tyfkdu6B7AD52Y98cXWHdu+ajrD6Qf4d7TOedPJs5
         BSpMnkWdpB6BzihPdDFwA8i/08S7GNjp0izZDbXwTKg5ba7sx0vpMx0wJa7tPBjk+F7t
         sUWj0vnUJ21JVMQoKZC/OrfZAtrPcSi4oGIkAFfpgBdqEW9iQRNTAKB7BSWLnRC11gwO
         5N1etz/bXvxt/S8dXj+FOIsH+wFmNMkXZENIY1VZXqZOv8rVlLULUk+YkvzZXVT/45wv
         Kaef9ZRdURB6GCT0hASkFnk03V6bQhj9saMsjMwAL5ugkT+FHMsTprqwZPtiz+myypwZ
         7JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623888; x=1768228688;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
        b=PkXbIjzytecTMmLk+ivGQPIF5cw8JahJtz6zPYdjWiQXFUfm27BfOPzGDqIBUHJXiB
         AuWkjre8jSPY9X6TfuLbseez5VxDprBKozEoDEueXuhOzZ7BxSnKcPmEgvmB7biS5cbn
         Zco2zsDkLd/AGxT/EyUsxE4SuPBGKXYoTA+mZovwgI17aO3fRG7Em6dIMameVOInUZRc
         jG1t5hfzlFXHTAFc4wK9hOE5kw0m2MGIIedBoMSV/6TKOyJ7GBnr/VeDNPjBqpT5HEzL
         gRZB/vO3xqGplRl5gh3vLf8swZjkKlGIGWEZQoo/rz8OfTahib/yS3IBwSSmgm9vr3pz
         o0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtIXWWlsak1Kw/7rrwsmxOMZ2f5MFxsy1KFVkJCUFV+Y/AsrsW+Qi7pqOAU025shkbxjn9fRnR4Ksogme@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgi68vo8L4vhswjNtRwUzELmkT+EGsmcCvridN6Ru0+rb8UiN
	uN8kTbqOZaUoPbrDISjGcRASIqGd48AUV7a1lJOvQEQmFjafuHUyf1nTFgRxLnIZy17GeHqOUXs
	Xpr8cnoCK12dA2vRgaJ03mK2fbmlT37P8aABmnUYvTw1ye9yUgXE9bBKwX3HBoK1q8g/d
X-Gm-Gg: AY/fxX4HsPnjYpD/abg2rwedlkcsTUM8sZ3j/cdkVkIYYZD1sCajYAOU6cZBRwaxQmz
	bt0JIpL63/tYxN0bRucde4Z5bvhdn6Qo0nH2greYtDm2hETvm5dFw94HVzT1CvvZpGz3YSZkfw6
	S/Je8g0LZZ4ccn13agQS6uZoRjvgsVTwQuMQEkwChagZE9cF43/wS84doOkyQGqVNH/iECQvC8l
	w8s9ACMsnL1DRnw3KtRXAN/yLUhvJ+e4EjE3bkYLWF5B4htGz6u2xZ/XMfkhFu+Kpmk46Ktp6+V
	CKdZWxcrQ9Uc19ZhUV5zPgIvQRIOsfMb1SEgbtWk2uvGiRkZqrqgqTVG41LisB2zjFR6Ae4b8sT
	ppX3S0Hm+FP2qNcO2ePNLwZbRV9rdot1uav7CEg==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id d75a77b69052e-4ff4508b502mr108113111cf.2.1767623888144;
        Mon, 05 Jan 2026 06:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgicMyDjA5PM/+eqsrIBwMK144H65yoEKhRKChcbGfAHLmAZEHZwjzOBn9OnYAC/WqGr9WyQ==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id d75a77b69052e-4ff4508b502mr108112691cf.2.1767623887721;
        Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267a5063sm3411466b.69.2026.01.05.06.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Message-ID: <715cb873-6bf9-4902-b586-f02ebf5a611a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 15:38:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF
 child loop
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RYpgZu7p7F6yvNMAK5tu0dYoAwRHLeTC
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bccd1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pJbpxMvPcy3AeZgjqcEA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RYpgZu7p7F6yvNMAK5tu0dYoAwRHLeTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX7IXEPDc+V3wl
 wYrbzHA6VLC9MLmW5zhjXXzC31OvzUe4EgjJ7FwE+TifHxbeVdLIlelyf3MI5I6oipPrINvDIhM
 xAfd1PR2wqY1r/q4GOmrX7HA8YBcoYd90EuuvAjHn+yhNMZPERhTOa5uW10+gYxsmxx53WY/iXp
 JooTplv9pcyqGLZQeEhcIVPvba5d6ZJtjo4J0jvsVY0+QfLz8tpM/4KRDtyYy6Tz59l+BLc7hr+
 SoX505r3Jn/7/GfsTPZFVPNye3+PHC6xdPa7mz7LDxZLQQTJ/bTHGEuezdHO6NYL1yrr924uA0s
 sZIsgaYHZ2HZeK1fm8UuX0dLqbn+Vf9GBKlhU8/4kww/zyMSo2nBcyKxcnSBTILhoxn4JA9Sngl
 DtcZUddLZM1vyxz+NaBlQ5oMiZ/OIMG/fHoqoUQ4a2BL1JcOPtQIQx177VcRgsDAqq1jSt5oQTt
 xVIA99JufsKvCkBrUOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050128

On 05/01/2026 15:36, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add Rb tag
> ---

Please ignore this one patch #1. I am sorry, this was already applied.

Best regards,
Krzysztof

