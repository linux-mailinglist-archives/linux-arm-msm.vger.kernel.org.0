Return-Path: <linux-arm-msm+bounces-76183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA65BC0F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 296474F4324
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469BD2D7DD1;
	Tue,  7 Oct 2025 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQzXMFq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066AA16EB42
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831478; cv=none; b=XgXarrFyZF9osbNbEnwGeEnZrsCaf8s+va6S3RbL1XK6CfztFZ2pB2iGSZcwr23+afT5Qa1sNXGYC2J2D/qyBQbSo3EpOj/ObpE72geW4wSWSONxkIUfgeUqHKe4OfH+2llMqRyuwbg+Z6YUeiJ7bNQbgRxqAZc7/Q1ScxD1600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831478; c=relaxed/simple;
	bh=syP41pd5R9Uci+nN7DevDmDEh8xWqwmT9OEsz3zK+k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/cYhweKO49kI/epd7zaMo1JO7elW0YybB0w7lkuaYiV1TYgpsplJfRkY9s32n0TTW0Fef/+X4lwfPmBk9+zuWlu+9B1yrDgbhgHm6xhrbd/zH+6TzK7DAAq16T08D27sVJz5a9G7+QR+Y7WJxfntWYPQDwQGjN0Y/mu8zLL4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQzXMFq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973HnlU024872
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=; b=kQzXMFq3dERTPmJR
	i3tyTvk7Qkt7984vJW+dXREFf6N0AEzJqZRFzLCx1jHzwMyGu7h4XDjnHv4Rxb9I
	YPFowLoQ8cwKkyQYS49ELr6a8eZQf9KIlJEwqlezEGztQPfABLJhh609toKvQ2Je
	XrZChq57p+bQtZdX8WbDTnmv3Pg/aEt4sbeCkrYFBbDYCs8Gi+4p1G3QHSAju9Je
	FRV6sZL/cgJIosLS0q2G5UdMKSCtmTNFxdrvluAMyDnTD4mg3PYlH+IbMvIjSrD+
	pHDh15VEWEVjz8evWxOg8yEXMhUeZABWg3h59UuBbEs4FW2ZzULmnrAu/GMpsnaS
	x650ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6aajnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:04:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85d43cd080eso187510785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831474; x=1760436274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=;
        b=qgeFrR2ocKQag5Gy9oGKUpJzAUFF+h9piTVmty529LmWn6vMUnLKpW3hp8Uc50rkbA
         mOHj9w6yYX5OD/ULlcWfjHK+Fdzm+HjXbUZ4eHTjkwoffjQbsF/RDIMIzKk8UYDIrHQo
         Rk4rQEgYx5WaN8bTyPsIaSlmi8v/RBgjx22an7lVJmKv+4C1R2qQeTScVQgr7I4Yezy6
         alN3UmTRMUGdpVpMFgqqkU+r1Jlxz0qMayvd2mkognedn+CcU9RfOuQR4dKMrwgrrDzY
         q+hLC8JAffGGau0dR42XsTn54QmA7UDqftLihtkBHGYBjJAdGES/M2STJhjVSDYExRGR
         vxvw==
X-Forwarded-Encrypted: i=1; AJvYcCXYe3OsmsSmMyU4Urrgn+n+dSNV+izTtnTkqL8gJOtOmRdg05caNaA5dvgT6EbePUDRwT17k6yt8Ciah39N@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeCjGfAI5/O/0JdiB3twMw4SHVXm149i9h14UPKBPiWlgTHtt
	eKsyt+3ypwWf+eTiPdmGQH0H8qtMu14bvj/HB20tzrR1aftcHkewtElAf4wiUw4NN5vEqfBXu17
	PTVvc4lFURbI8I3TdOtRLYfeMZBfzSbjC0SyzAAtwVOTnfs3tRdsrmhTAegDIetBTQX1P
X-Gm-Gg: ASbGnctwa2L9q/J48R//sKgjJB/aaJoYvTbEVp62XFla2Mv6ZDo9m6W/CywAn9yNV76
	Ytz59kk2TIkGJq5papS1nOylSmgPvpRj07Ic6n3iAUzhN66VZEsCxM7nad5Xdfi2oY7GzGSMNID
	/+uOPL2B9U6scSzFgR0XE1rC4bzdogLkNOuvvO0eZyQyagybDPtRhBVUFfgS19+hbpeUvkgg+IL
	bH7UaZrnrYO41TpZy2vK5bP2h2sJrazW0WcQfeCCspzYo0IjdBBu92NHgRV9UlAuqSfTZv8GFMk
	4H9G5FaPyTt8zJy3G465VSVb/+c1/t+4xStIYThbZcvN7UUEQRdNH+3F98COcQofGyy3srj2trz
	IhKuGpjfrYo6ecaxHptLhuk8eGJU=
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121120051cf.11.1759831473603;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNIWw2SAUTUQLNb+7LVAsg57ghgAbUy9HBwlXY4iZKFwFCHllk7t4lrcnif05kVwqiugILGQ==
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121119701cf.11.1759831473052;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b70aesm12333222a12.17.2025.10.07.03.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:04:32 -0700 (PDT)
Message-ID: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e4e5b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=2dNuJvzwNQBdB-WvFZIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-ORIG-GUID: bCSLI9YZrse_bH1sY0L_IuixkuOeS2St
X-Proofpoint-GUID: bCSLI9YZrse_bH1sY0L_IuixkuOeS2St
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX0IDtu4ouLqgm
 pKGKs0QIRvajb48BY8dwAJB5a6Gat9ZvKw+cUXL6FyQAYhLeljgvQzJBb8Qt1Nvzlx6V3Nu92Kb
 BhqfUAauDCuuGPg2s7IZs8q64hEo3WYcutWsuaBcSz4h/+hbKdtzJvnEN+Rzvzej94laSwIHulS
 +Y/YXf5Y38YHNvwW6QkvrLzG9IuG0iWM/E4qjdJATxmgLivRoqdkGg7SB04any99UzLpf4M3Uw8
 /rCqi1iTr5FmLU4K77FSOlJlwrt7ns2jt2WHB1oEwYGI/ydXWJXBHzrcmucPDXX5cNLo8v2Q+ZI
 LOA73GWg4hy/VtXlHuyv6KsSPn+SwhBGus9pQuRTq0QdI1+JwK+L/L4o0u53knTG86tAWNpdu20
 Yk1fYC/1DBi7tpyORPtzqrt4Vht/NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> index 36eb42f0f3d9..040a256f9465 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>  	};
>  };
>  
> +&blsp1_i2c2 {
> +	clock-frequency = <384000>;

This is not a valid I2C frequency

You're looking for 100/400/1000 kHz

Konrad



