Return-Path: <linux-arm-msm+bounces-86164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D6CD538E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A49363004CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3242930DEAA;
	Mon, 22 Dec 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhglG0sp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i49lVTL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D21E8342
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394026; cv=none; b=E+HBesVSc31+b4F/4JiUiDQ0STWa6OW1xUjYJpIuvJbEGiv5d+R52/UoscV4jTqpcSmjAOEOxS8r/bJGotPGM0UNc82i399ySOX1xfCXCL7vj+oiPuLTEYG6ktfxexrkfBK2dh3hd094gu+ukn2p0KjZ76SK5zgUWagI8CTKHY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394026; c=relaxed/simple;
	bh=7nFTwrTwUwJOFwj1vqDygUH4PflUF4uOIMAqrK8X+tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3AyXdhhRUh3OcprBP21QIupkWCvqL8M1tfi9k7/KTRCXOf+agZkOtfqUJcsUi2iPsajj0qnboblr+NXwPuAfEc6+yvY1+k8iXtMNUXu5JOcLA6GWD9A/rG1ped+tDh0QxwAoBQhQySvvlReG7EO8Kzw2wSBlz0dmKPhxoceXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhglG0sp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i49lVTL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7tvYE3732860
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=; b=QhglG0spVm0QGZ1Q
	SZBd/YM34FpvT2X0InMZs1uuuAtN8Sb4WBPnDcJIcemDtm1jUWiLw+E/VKOpuPt3
	5xNPxP9BqYhEJ6N9HxQDlfm2zDM+jhXyGlg6wqjf+4p4LBzVUNjbc6uau2C1t5ox
	aK2z8xu5nKl4jH6qy9eOK26SH1O+50Ax7VHAbzbLVxxsapAkTtY/koq0PZJwekzT
	BiL1aAE5oYkDVOzdFav27lBIP4i/HNl0wmo70zSzunKQvPrcSMP1CE+ba4yIiW5P
	+j7oV7ARwpQrMeekK/5tcMCsSKEP2ejGW3JI3uCkrXKFba3Hm55f6HdZO2fpOcZs
	OkkfsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcd06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:00:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f357ab5757so15786461cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394021; x=1766998821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
        b=i49lVTL16F3+StUisdAlEQBu7JL+IV9mpy9xZgpFnuWr2IYEVrBwmdn7LrUFjMD16/
         pMVRC+LYOTNQAtuAkJbCdfwc2J4SwB4Rki8LlCZcrlDiHkM7Eq5HXrOtlnR/lpivXqSM
         m/esUlNvW5XvmwZ036H/iJCk/3zm6uDf+Bo7bdQeRMP4lAxsugNpkUGnWTtihH5BJ3oK
         Z+Ihbd5CD2KEm9QWDo0zOSKJw2QIC/5UZW+dZ4lMXeBNAQQxW1TLIdWDAI8Zi9tW7oWw
         jQKVIHmK2f0pzAb29A9HeDG7Jmit0c5Oh9dxkWMTz7JoD3doQyzxQDfOBSOxQKbdBoE7
         4GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394021; x=1766998821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
        b=IMn4CDi11Xacs27G/0yKZI/e/IflA18YtJAOGn3sHoY/qBAxOj6k+4BTeIErxthk+f
         6F8dN0tRJ1uZOkN38jhooo/E/fluuAyTo4POV7u4rnHGftJm57or1pnlmhIEeTRy21b0
         Ae7eiCaHia2iK61pKDjiGCfPwKsFHA3ttrLzAUFPRShItKXsrMgUIjNA8MGTzkvdMVtY
         s/k+SJeJ9nnWz0vF3tRuMjbD6MFTeUj0ZgvXGZ8I9UlnxUxYrxPwqVII5GXEUSXuHlQa
         bzX/nJnoQRGQlg815haC1VOWJJtD2BYa/iiNYvvrascAk/WzmAamF6mPlmNmi9ocD1Bf
         Pd7g==
X-Forwarded-Encrypted: i=1; AJvYcCVUuWMJ1z+lyvYUUueCZb2uFUanA4FBB3pWyH3OKVrAMP70hl3Lv/gWY0npSqcGy9N27zNEQrG+4DpRHAHa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OA/KBCkT20tAaTyOL4vO7GF35Xnhj9dphCd8kqjN+lv7xvRN
	wVq/irkzsxeXJ6VEaBCkn8WvGW9AiEufIqsTBgtkS5oCWfe8iDKQq6BtVKtdnzpNE0tXjGQO+kP
	Z3nlSaxUF0WMGQ0W4h088wa2FNrsdtUWWItdr37yHolqY/NRmZ19rZQAAgK5ApwYep9wb
X-Gm-Gg: AY/fxX4vIAKTJBJJyBEzAqBiQD78O6N3Z8fB/DV8UPSLvAFz2SlAHaD5u2wpWq7tgWf
	VgIrTBoJXx/CLpdcO8R2SemK6c8oDDy9pp6eqoj02JEuOynHfSPdYnoHQCanQZROtfbv6dHNbhD
	M1T7jaSIhRXEsnFEPrPpAQKKvcilm0iemyoIuU/8Q2AcGs+8EFytT0P3lAdsX+HTfAj/N7N39Nq
	YEYoUfxRb0QlxE9pw/c+wlDYHrrXLjnGjIxJ6eE7+eOaMRLSsrGyUQDpKVIs2rDoJOH/vW9NAZl
	2qJAmYf/DPa8EQL3yGlZ1shpXKjvdJnneynzHUNOD5zrrldJhl5c6dajXqoy/kxb5LdQ7zj9Bp5
	48nPoLzHy0xEvNcT5LU842nLdppzfdhpp0eOSzb59CXsb02NQzc5ODoTf3HbbNtnJuA==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f4abde8b40mr126853031cf.11.1766394020883;
        Mon, 22 Dec 2025 01:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ3sa2cwix8pdUL8luSbRZkdo1cW7juRVDsscaa4ncFyVB+MukCKD119lgajVKKUHQrCA2Sw==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f4abde8b40mr126852221cf.11.1766394020083;
        Mon, 22 Dec 2025 01:00:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cc52sm1005945566b.52.2025.12.22.01.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:00:19 -0800 (PST)
Message-ID: <0d442547-db12-4408-a0cb-b3d2bbc723d6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:00:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oDe4l-mCYKg1rH4Ub5pq9cwB7MWjC2jH
X-Proofpoint-GUID: oDe4l-mCYKg1rH4Ub5pq9cwB7MWjC2jH
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=694908a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KB0s8L93-oSB63ZrkccA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MCBTYWx0ZWRfX9IGVUKr7hFgu
 k2VRgK3DaeiK6w6r/8QUkwW+tr5rNyEFcU4IteP2Z4VthnkbtHIK6XBjcBcea3bDkgyvcqwY3ln
 M55HlOpswEMmjpjPS8OKcVXwFur+ICNzG4hjA/oJX/pXk+sSFeRWNI2z8gQ2ToIcJcq7xjUTUlH
 or6yOBnELg6A3UGGHQVzInTbd6t8fhgZQ4vNoE7ZXGbqkWsozM4E9FJCioMgbIguyaGGRvbLAz/
 rB23Tsp7Z8i113K6ShXsiZW7fKDVgxse6qZnP54yFEVQiF22HhVne6iBx1wSSgNnF0YsivDepvW
 PNYVSdTiT8K7fzYgY8VD1hE5LBhNqX9Eqk9XhyceXKbXCjMnTzoIB4iptdJm0XFBERaqjYDcGS6
 +dY3QVcIepgRv3DK/9AjaKItB/IKORTFQJpzajwxIj/tiEe5zOPXUdhZOUccnlUZgkGbF48Rq/Y
 bVU9SqLXgq3LDbqDwBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220080

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

