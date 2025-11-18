Return-Path: <linux-arm-msm+bounces-82338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A17C6A00F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EA18F2C303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E8535E520;
	Tue, 18 Nov 2025 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO6ocDM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9RQcX4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7F355020
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476345; cv=none; b=AM0vkSy+6G9KyolphKCDeZj37Q7AfX4g4Uo6CQydZ8zmNd00u4u6d1i0AwgYkpOIQH/H1tMsW+3MkRYP3gDyqgZQl5lRQSc0wqm2Iy6KZYvgYQBtQJXJ0rir6CVjBqw1ZGFpMjij6eqcGTizl7YW8RHzitNUDe97x0RhVi0w0ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476345; c=relaxed/simple;
	bh=8RhPzsRzALU9XX24Ra/bTl3MRvJ5zAjKxYXGWEXU0/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBdfGeJ2h5gc3tLMcsN0M3/xa41eOKA0diCRIaBQ1dD3IGX/Sh/36Baf319aF2KUvFsKERiP5wRXleLIZ+BgYcjxvNDyLnFQhyk3XMdFcKMbJY9uECgfE8SOB3vxbXDDLcpzkpYoGODdrcUIjpwRW3rNwpm+B8QyxiNEkOswjgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO6ocDM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9RQcX4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQrQT2926832
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=; b=hO6ocDM1a/rsD47/
	RFl8oMy6DAaLraajt6gkHGgVezrchrr0fNIJGvCRb2ZaLu28bj3YOXJani/d2jzD
	v+rBtrkkA/RaEVCbxequ6yVTz5k46GHZfuMPi05WV53ZBS7r9m3GlU3YDqjnEtc/
	lB3UUUwiI5uB8lCOP+tyJD9k9D7ic2CEp2C4vcQ+QP1f54vftfOib+bJDL/856zZ
	OTvpz9tQjjRc4h2d+WQNZ/W7fZBWI21iwFfj126+8W3y9y5iZII1nJy07ZG4k9Oh
	3MHx2lMMSYS+EgdMB+wK6CzQtgRh7PVUeTVcNnRmEG1Uu7wTVxPeUO7l1XwtDEFa
	/5c1Ag==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq290m74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b2ddeab8cso605092e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476342; x=1764081142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=;
        b=B9RQcX4YXhdms8WmgF/K+jKm/0nOv7sI52MJhtCj8IjXX/c/H/ahz6VvBi7/sLEpMF
         o3p28f3D9UtUUhVEeER5OMuJLp96qY+8hJ06PMtVebu1tE50EeMI+gOqyDVONNXAL/76
         lIpPoDozlsf01E0NwpR7MMRxNub6w7cEyu9mYIuGcg035FN5Nfxujn3mp5dFsmn2RB3e
         ngU6IZ0B+2vSzalyPwVHYusG4FV41p1gu3/spNQpDrSvUz08ac1N4QAjb86XGLuGOTro
         qxCVx+6jnrw2qxPXvN44ePc5/EMQ14iKSerZbjeaKXpRnBZHd3m2OtQqhlyxwBLG20rR
         lpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476342; x=1764081142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=;
        b=RsUKa8KaZY48JDzjNroS27WVsuYy2e4ip2G6cfsmSwmR6xjM7I3YGuziDRUSIbITFx
         lunEn7mqRQoFqK3Rv6plHwVKE9PA8c0kOXJGFOIyju2pTJdtrMVGTGaW7v3v9Sg4zXXM
         fuqQcJAwBGbCFotNT1+Joe2UlRHh1hTC27ULi5hVbGl4xxDOgNPWlTSy5TpHtqwrRPuk
         DPg70RhUmSvB6aAIjy+9Aaii7ccO7ePJ3s6jIoa6E2MHGAvz2yt9daSS3ePhWmDByI/N
         8SzUbCZW07uEZQx4w36bT0WWu6EWd7y5yAYHcMU4ORKrdg6iAaY+tbKcul/jLIoYlKOo
         5cig==
X-Gm-Message-State: AOJu0YwYUy+hheoHKDLcMF9FOCcUJWU5Mkq1xMpq3e5BTkcHoaf8h0km
	n55FiBGffXpxHE4TIl/9CnyWOpF9yjUOGtfBuVHgaL4LY0H1I1ct12HokBiPp7KzD+84cR7gRXE
	Gud7mnaODrsK9yrfblfuKQ2IuJ4DacV9Y4FwgW+KwWt3tBQ+wHg1mhfXyCqfqYc6YB5fe
X-Gm-Gg: ASbGncv3xDb7ZpK4GDCaD3h4SXa0Ca1+5G1rYB0ytoIhFUYAj8nCsPIDtnFbE2UqgyV
	ZjdzPcA3P3E3sQA2y81Z03LfkLWQ1K/jHN9hQiANUjr3izDff/TCan2j5QXs4w9sxBeOTy3GB0g
	BcvxYmOM5SXetTRjr35J2AQ61rgBKqCYWZQfTpncX2rjxmGufRVYyQV7gr4sEGOa6n3UBwycocA
	c+ubcACaaFvYBjcKKZJk16UjzNYDhQy5b9dG7WZRBX+7L6sclYaurKTU1hlCYdp/M1IlATXQt2z
	4TM1LGyTzHPzjHl52AamqVCyqq30ED6T9Z6zcrq0lnmncXzG7VaDFxj1Gw9f+7dzvuHoF/C2wJ8
	FzB8fV1RiCAVToaL9AbG+GXDBDlpygbabpmrqJ9V6yeSJSiYw5d/vZz8s43OflEnB+Kc=
X-Received: by 2002:a05:6102:e0a:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e193d0c0d4mr394736137.7.1763476342472;
        Tue, 18 Nov 2025 06:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFo+F4jj0zEA0JoBK4MyQq3HW3oKvu9IbH730uCEpz4uJ8wZN4B/oo/d5FeD1zHfduUN+Z4KA==
X-Received: by 2002:a05:6102:e0a:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e193d0c0d4mr394725137.7.1763476341963;
        Tue, 18 Nov 2025 06:32:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad44b4sm1380994466b.28.2025.11.18.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:21 -0800 (PST)
Message-ID: <4da03f13-1e45-472c-9435-95156389ba83@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c8377 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=b-4XwQHDJI6FaDr3APsA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TjdbRy_x1Ta7MpYxVvIsxLuiJKFWqtFG
X-Proofpoint-GUID: TjdbRy_x1Ta7MpYxVvIsxLuiJKFWqtFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX0uXoaMZ2pfBJ
 hZ7x6uEgNFrNDSWRyE1L65vsTc2GK6Facr5v89F+3oIQdHJp9+0MH21eD2mIP3IfwURrf/XG4QM
 hn3RvyCCFfp9DmDSq3SUllYAECPAQcu2wpKrhkQFZAzoVYuNCePdWCiCA4X/xG5A44zTbBs5599
 vgogbpPg864tHbMS4H8Qr3PO63bWYeCebdg2r84SousYiK3kbpEg1LEK+8L6rdQ8KZT5N032yEQ
 nstJgTgkDVwReR9qgV0PvKEBVUepf3qsNc69h2NfxWMykuoL0VkyJo2R1SF1oqUFWa4+SK4dFfV
 UtQadVPfBg/qINrH57tXED6/QhgKhww8VJALQwf3CjFu3WoQGDWQzTxJGfNfYVLtpmT9dbR4+Ed
 3zNOsjneF2znSm87bcyEnqDUzlT7PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The panel regulator doesn't need to be always on, so remove this
> property.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad

