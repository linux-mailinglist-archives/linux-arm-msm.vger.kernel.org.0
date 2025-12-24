Return-Path: <linux-arm-msm+bounces-86531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB535CDBD38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 232B43043F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED3334C34;
	Wed, 24 Dec 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmcQdubf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2j0B3hY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBE33375C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569176; cv=none; b=Phi3tJE0jIuQngkER92o0yS6kf95UIKf5Y+MeVHUvmoJgPeL24W+s4v6J9nqvkUXKE04/M9hf0TO3zFfubwvax7HQMFe5y3HArC9PByaJeAC12qSF84icQaXyUrTjXPXedmOGfGppbr4dKkJ35eomHrhPip25c2hUtI1hgQMgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569176; c=relaxed/simple;
	bh=tfjO+O1vZYPQ4yMuMeu+LRGx2EwBN+QJP/akKXBGBhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K75RyWI2sHHCKKxJcRA2KWWsnHgFIsBa+w4LLYwX4PWZJSONRFzNn4GyqEsp4Oa6t/NamAP/wEryP9Hn1ghg4W1CZMz+CUNAeq4Stgdm5Dl0r4PpaEoDpr3VKcY6pWV7Zq9OTI4XbwB1bG4YfofKnM7U+dUL3dMELMPQnKWJGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmcQdubf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2j0B3hY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6iGU3678327
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OovCWUkmMcj4oKfgC38zgyTW
	qGyoxMNGh48TksGHzWE=; b=VmcQdubfoiYaTce//tdF7T1Q1e6uRStxj9wo2enm
	yJQeuGQE4dFYQ71H5QyO1Bnbmb7Z30hn4wTa3iIlgpRUzBE6TXt+M/4kpcMQnWVX
	Ja56XfmOJC3EAyjcb08ZZ1Sy1PY9EWRKBFAUCHjOLLaLevvF+rs8RPpLngzK9oBJ
	NJHMyKPQxizOp12hNK+eWiztPwH/4alXHlsTHGrNv/VqLB9y2haAia+4h8IYM5IG
	2jdDammrusZPZsyzyRlYiQ23qyhvVEj0eD4waiIo3RT8h0BQX4jVbzyzV9n40dEN
	7IxflvtXnw4SejO83HKDr5e0GjfXzzF1clBEAecb6ykL7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq27dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee04f4c632so107139811cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569171; x=1767173971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OovCWUkmMcj4oKfgC38zgyTWqGyoxMNGh48TksGHzWE=;
        b=J2j0B3hYSAhtWNnp41w0SVslQCnKwoYIvHCGE5YVbZcy+lNf2NMwoajAfJhQLvBQsr
         lUr9bDhDr4rtUxyjJ5yOdKccbatRhLIcHdwu30kzaJkErxYEV1dixw2OmvMGyT1i1ccZ
         oQFvTB8K+uS/amJwHzUp6SRkIOSjK5YOdwIxwV5j8e80/ma5AHh/5Xha4A/TpqsO45Vj
         D+38Iy4D2hUqs+KRBUqrDGv8YI+fGBIlPurGF4rFY/kx3BP/mM/LgVtnFlnwXcFTeUk2
         fmsyyaz3PZCJCw2ojs3GMvd/mDyiKe41U98m4dt7g+Ejhll9m8TSEcM4wR3KNByeya9G
         UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569171; x=1767173971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OovCWUkmMcj4oKfgC38zgyTWqGyoxMNGh48TksGHzWE=;
        b=bbV9eXMUIXloEV5OtmMc0nYtneEQEQYTIdku9WwuQoUdhOUlHuONLJJezxxHldiCZd
         d70JDaLHVwTkdY7ySQu+2FL1I0Ga/YtBZ/cF5udd8xFzmFAxMRu32eGdVqTzdnEYV7f5
         ur2QoahYDXPGjDwjN1xg3TMnl3mnZCWNki2KLOxR+NsRHHxW5pTO6v3ha9CH5m+s5/ra
         U9GJfLWbHC/65Z3bF/y93Jla9c1gJvsym5iyPXUkPrMSMiGpva3X1Wof1JNkwfbpzbbB
         d0zRvGovFgxvWfl4Eb3zXErDnIjvliVmR7XYV65B5tZ3eVSEGh7h9uqei1/W8i6A4ZFI
         QpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx6dD2r7F5XX4SqZRAvo0FDJzAFm+s0GB3pjOD69/GasiAMJJLJuV26gmqf3BrM8nG6yvQstd7pnNbD0dv@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKf89U1A+aEwPQ9Z8MuLW8kKh+8ob3exvfQSnDGWge0+SM/FF
	jT4g5rbQJ4B1zywagF4Qc3bHuNSkjc1snY9H64T/GOlADfquDPgnYRF4uGm/adybU2rJPPlpKwW
	BFLoG5U2UuQ8dNKC5G2LncnayBl9N4/kWHtWs+o03BIfwSQMat6PiAeTcmKLUlXY3G7a6
X-Gm-Gg: AY/fxX79UQg4H/fp6jytcWBJo+SfWKuziatTZaLVQu12o5IT6IMxdy4q7rUCq7GOF3s
	eRPRahCg/xtIupx+pVdHTN5Lbu6CM72tOqWJ1K5GvkC7hiHoWMAHIbp6bkFKuk1WymgNwjESBIl
	WDZuoS0NGvKvljPKwDCkS1NoXS82Udz6GM327Tp/EgWG+uvFIzYa8QE1o25Qxi1xSAS7/BNLONT
	yMVQCnq7DnsnTtIOU+svUe3PuIHWrtow/VZPYFrfl2/MsRk1N9gV8w5lGCXprPh8IE5MkLnU9V6
	95qcLC4br/Z4Z5/EUh8pYqxfV4O2bAg/KD+GdhC+ikuTpUfMJDYCU0Vv6cge0gThRGhnYTQMd+z
	Cb6ns6GTGZKJ+e0NfkZw0fg==
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id d75a77b69052e-4f4abd0fbf7mr276842231cf.36.1766569171224;
        Wed, 24 Dec 2025 01:39:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxRTLn0U0i7li9cqmsrt4orBb+YdXbS2ZggbhmEVcsTCwmHqG2E6gXJls8QEX/fPRC5+HJLg==
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id d75a77b69052e-4f4abd0fbf7mr276842041cf.36.1766569170775;
        Wed, 24 Dec 2025 01:39:30 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ebbasm1664151566b.55.2025.12.24.01.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:39:30 -0800 (PST)
Date: Wed, 24 Dec 2025 11:39:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Minor whitespace cleanup
Message-ID: <awmcmo3wvy5unvn3c7i5lvflon7sq5su5qifj62vp7pjepjqka@hlsmdph4m26f>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XG4ho1P52pFw01WwusJQn4L6dvHttOqV
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bb4d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FLYuuQH4aP3MUV2sBEwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XG4ho1P52pFw01WwusJQn4L6dvHttOqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfXymldE2ZDyB7O
 0MLpmjS2+yPgbaLydOmXigt2GoPtgXpeXBvRbLFm3HNSHyQRlLiPgZmChjBpWczgteukd5V3Nis
 KuCMmTuSSECvN4IFkPF6tc/tNsYPms64vCOAroNMKW+xC8sD9vPs7XRsl7hm7igtz0v1t0t03Zl
 sGS9PdtARDzac/c2oRd0h1T//Lk26/MaxuaB6v90LdD6/QPdctT28Xd0EzHVzYu+SKvWm/8AS47
 VRYewWRoNXevccZ9DiL4HtizhxSuKjn2MI/m8HGyH2HULK9fjP+q/4OAqi5oDX2OS2G2zdTWjRf
 K4n4LPBxe2lc8nRMq2TlSigd0uuHSU2BkhzO8XxhfP2Udagejuc7SV2nEwQmPZ9/KE6CZVtnH8M
 UO5aYH2KSJA4dMRB1WuOymguI0QlLAB0DDYtL9FCO0UKgnDAvdxaDjRNWu95W+HCQDLcbfmt56+
 Qwrgirx4/NW4IhbZMPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082

On 25-12-23 16:26:00, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

