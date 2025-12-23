Return-Path: <linux-arm-msm+bounces-86409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75982CDA523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E853029C46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B54131A05B;
	Tue, 23 Dec 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKl1shyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLGIQVec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC12F691B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517147; cv=none; b=pKU4F0igS5m6jf5tB/b61bhDD18pFzN+dQY89fIizVwIxwMUSr+DbkKJL40EdG+EmRKujPJRlYJJJ8EmbVY1bGp4jfpyZRhsXQ4LWGyLeSuKW6DBkL5RU0U2hJQwGDOKIsEVPe4w0lQjjWweJyAcDxRZ0jEeV7DgwTXQ/4SS9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517147; c=relaxed/simple;
	bh=bZX0XoFiCIhw/6dEwBaf7SgHqJw7tyTXutyRj4rDLnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCi3TmtTaEpDmvis105qzgvx3RHsjKO65n9+g0OQTAmB+5MQlRGHuhh47SS8QaDZgnj+pSEYCXP0cfS9xKO5E9z/KtvPy3eZpRVRT2EtgWudV7DZCMflhnbWlZ3u9hVprNQBNtBfz7k9FYpdFWxCmjJ86ZUh5Qf9+8V9/uawHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKl1shyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLGIQVec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGerMd2747598
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tafZgooi9zt+RuExecwY3YY9
	zhJhue98JOLnup+dcp8=; b=mKl1shyMFSdhVSCt1+Q9KbZXTx5EjiYJYjVSmryD
	TkT9fYJs9A8lFbdd0tPAzSUhijLKpKuFbZYwnslD/Rlf4Y9HZfl1HuA8GFdR+BCo
	AzTuX1UpsDRljax4IBTSY8KOoaQL0cfeqF7H2LDwPGzB2DLs8FWuFJrX+wHENfrp
	IadhjaYOZtEEe0iXwQ2/C1R2e7FGTbCqfEZdOufvJU647kiITlgDjheEwaFw1fzi
	zGKUe0MkAMQ2O6ZyVjDNCaX4dOcnZIjBzRJBtgJLSG8ihI7H08K7nfWIQEa5ZMHH
	mZlJIvbLtQPt3ebGYAvp9bcy3bjePEpcqG6PVbLRwUkMTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cu7mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so111408741cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766517144; x=1767121944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tafZgooi9zt+RuExecwY3YY9zhJhue98JOLnup+dcp8=;
        b=HLGIQVecvHqqlxEZQazQ9yiJA1F83rOGOrfudpR4e/7+GK9iBktloLXG/zbI18zkZY
         YZfO12tVV4XbYSXuCPmEFYhwqZ/n0JLcI1zUVeaj8tiiCjTNbYKUe3vqV7kaiWZ2v9nQ
         M6JqeYHZ9jjglla0aHLX8wytaDKOLf2OpFc1Jcs8+vkHifYM6NQIC4w3R+Q3EYz8m23Z
         F/buZtzX3q78v1j4hv1gsaAIlCTW9tILRc3l0W+jQswBFJesTJenRqyKTaVUXFN6ZyDd
         7KRcc4BOEZ26D0orcwrXSPSZ4+vClh6NC2bX5ng74ryYTKu7r0+h706OOCrCvlPiUZUE
         USjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517144; x=1767121944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tafZgooi9zt+RuExecwY3YY9zhJhue98JOLnup+dcp8=;
        b=E218ECY61UvRqeV8q5yY8XOcx9rZa70QYrXNjCCU/jBx4NWXfFy0d2krUH6bwxHw16
         zvl53AsR2l4X64H1VxQkEY9PdJ8Y8GLxyw24Me2mNCliAGqYTiA+uolpLIRROgjHFJcw
         zyZgLbXc1LJPZN2Y5SGOQizMBk+kbjDDn4hUnN7UDev4uPvUyMyxkyJdsaPortGNVdaG
         xxMfj3DwykVyGg+tuUqwp8aUKlUDGUGFEftNf5w35BLmr8ZJkU15W6XX5Ljajmk3EfSl
         qII70PuNSZG8kKUP7pI0XqaBOQKAu0TfnbzqjLZ7ebX3yKe3aNRL1swX14lhCgx2rCjr
         bU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlt64lGQ9gLJCVT7T7KSl1HCVQ0q2YBsN6ppm/FmZkBBAWt3xbtMUWbv9S5TlNV/KQB+LpuVTXg97c1YIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CsL9kXQ9PoArMTrPxJFOEAEmDaaBHlnv0UVbMGKT78FB3CEy
	k+7KJ+LANHHHjKcZis7/qwXR7xSOc4ZfsHf3vzIIY6PVW52+HhssSfKm2GU4Y0UPsMoXRft9pKi
	f+lVpva3A5Ao1TirwZiG6pMtS734oC79RzTGWmwR08dnYERe10Z9+sLpp7AA1jRtKNmuI
X-Gm-Gg: AY/fxX6Jw6GmtkYw42/V7GSdiNeXNmOWGz8m5M2o0NjgrpLU8O+CgjWnmBiQrenMCtF
	f+pK1XVIs+OnLBSKENwQBBNnqKWAaznDbXa3L0I6eWyjwULQFyvQxqor1ly3OTrVjnuseUkS9oP
	EqHkOVU84b9J9grfwB9k10SvYV3WREAPVCePNqSMu3FoxHQXIJrpz77AJCwzBXNhfpMxTVfr6XM
	mI8pe1Md2FIFBXpZK3AdG30E7uiMm4wmvNRHALJU6JJMTXh4HZhlt4kKQ/ykA9HiYykzV0Mq4VO
	+fN35x4neahf41uA5DwCLq4ExDhPNDZVeIDcjwSaCcqTDgvE3pkIvjIE5pJd8bjnLx7n+QQijzk
	6Kvm9LhmeSeA0kxi77PMUaJ1yeoQKBu9f4qp21HJFyCTCphqZxt4Uxnw2UuCU+CSEhXwViae2kN
	Dx0ZIZz8zwHRyfItkuKyieGwc=
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr287435981cf.35.1766517144319;
        Tue, 23 Dec 2025 11:12:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMinXdBpWZykl8cRjWBvUJpxn7zGoS1zWOKWQ0k20+h6Nxib0wnEmEePBMz1Q19+LfDkxUCQ==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr287435621cf.35.1766517143892;
        Tue, 23 Dec 2025 11:12:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f326sm4283973e87.70.2025.12.23.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:12:21 -0800 (PST)
Date: Tue, 23 Dec 2025 21:12:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Minor whitespace cleanup
Message-ID: <w7uiuqulljljd25rb6idcs5wyxbjaimm4ykbihqu6vsjxr3q2x@ez62ctwqxlhd>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MCBTYWx0ZWRfX3OCe5mPkDiYv
 fbqWFddKMDk8NmRfzIxJ7oKs6/Z0CM0quPdkwIj3XNspnzKSeZo7HuxCTyQzoJARixU/RDFMMKr
 Ka2ydbNaIZGBG622wRCXyreM5nZKuRjXh4vZuxezCodjjNK7RYIXgKJWLaDjjpi9tk+Cg5QGeG6
 rq6q31JVdLndNNlE+WHRIZB/dLIn5SXfZhGroM14ZMexwuc+tSYK/cl90CDX+akHvQcrevTkZre
 M5B4irz4gKplbM5copfOjBw8SIyihZsd/fskk3il8HOckv1ClUQYk7MFT0JqdAuqJtwskMfe2ij
 SvnsT0LdxzoV7ooYqn+Apc7H7cMglc81AzHiKpqSGi70K6f80mY9m/tTaEnjqq1zsg6JI9Uo8N2
 QwJNOUV5uo2nXyBd0yqg+TFZ/EmoZs8ndHsEuIJexT2xTOpj2oYOtX4r2iAk8W6ntbVKzuYMJ8+
 k3Qcj7ZT7XBmeUMJNDw==
X-Proofpoint-ORIG-GUID: _aS-9NCS_eBWGHFjV31eZqyRDCOsOnpp
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694ae999 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FLYuuQH4aP3MUV2sBEwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _aS-9NCS_eBWGHFjV31eZqyRDCOsOnpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230160

On Tue, Dec 23, 2025 at 04:26:00PM +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patches done with sed, verified with comparing unflattened DTB and
> dtx_diff.
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 226 ++++++++++++------------
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |   2 +-
>  2 files changed, 114 insertions(+), 114 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

