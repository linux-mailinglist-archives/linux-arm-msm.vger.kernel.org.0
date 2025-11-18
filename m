Return-Path: <linux-arm-msm+bounces-82337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BEFC6A135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 26E372D46F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF6321434;
	Tue, 18 Nov 2025 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlO/a+2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fu92eFqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B025785E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476334; cv=none; b=IkMzkaRnu9AMPUTU54WhtehepOgd2ZQ/o3+oQg9P+GZfR98J+8mvA2KPUzuvhRI0xJqaHirpYB0+d8gHTbIGvzNwTqGKtkwe20LNALbyGf+byvw91ONqHw4wy4bu53s3q/xWZu4wPe2xDyLNMmy64q3wtPPgv+kGla1kOwv4kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476334; c=relaxed/simple;
	bh=h50v9D4MuDGYwnwlloL4REEg6nMDf6fIvjUYpab291Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoB+FlOqNcCc5vB2nB9Wx16c8eTAXvmH/X1fL8pWnuLEzs0i0M1mgJJ9JzuBw2iTHbTUjEICBRRjawjS65tkpDFJkXnpCDlrz87JJSGbIv1P7Bmm2MyI1Wu7VeZv3P08SxjDPnNgZzlv3dri15wlHSZf9WYIk0aXeJzWvMTzWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlO/a+2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fu92eFqJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDvCpY623877
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=; b=SlO/a+2zQdtw7Syo
	RW/annFdnysvbgpPdyGEVuaflg5oTX5DP9OQMkyNWI+D+6X2tibIP5TjYvdxmeWx
	Gbmwl4CEkV3uSZiokziIjcoZPXaEAHz1WJOBwvIsyPYQxNHLB6E60KuO7y4vF5QA
	53bTBXOOnzSGg5u74Qmeqw+mbEAxFiNg/AIKxg8dL0nM4kIGw8lQ3p1lVklGyMQC
	RuwJGVbTtytJJXtI/JxaV83OlSrHI1AhpLWEStJMpPdpaNtchfjeOpq4zMEv4joU
	9i4oihUJU4QubE12XKZeeJxLEX+5e4daq1gcqi/rn1x+qdpqRQ0+4iiwa5zg2Llt
	AZQRlQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfar36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b2ddeab8cso605045e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476331; x=1764081131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=;
        b=fu92eFqJa0hK8S04y0uWU/w8jXK2MMg2gjWQVuxv3/z1UQvrMh7xfwXGFzKlgqw9MJ
         Mc0e9nbzazv39i3wcszWc2u6Bgl4h5cok0ctsNPOhDDi+wdWohJyVzuaFHXUZ0dVDyII
         zCl029pLhsbforClLR/I6fO+BNSBgkW1YMtmLcPoJK1n8UiHYzkkHCO9MOS/B6t/WMJX
         jLFly749S4OxS0D/eTzsVz40d4AWyWgIqCkscE7hrgHp2XHmludquQXxEeZVGByczqPB
         ufsjJmsAqL94NMT5fusqUOVaPb6Zp4rMkIskNv/ZxzIFgglEs6Y5S3gAwYx2xuOx+JQS
         q0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476331; x=1764081131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=;
        b=tRXmqYMrAK59IkCr/nDnQ4OXhutzuCSzTuszEz91azpjPDkeD08YFp/S0Sb02i94D5
         SdUw1I28Ltwwjk7LuB5XiDM2tntFioJp8RaQgFPQFAzXa9Fj++/8x418mMYiVlsqEuPx
         7d8FfvcdBE12iJ+DmmqhcpMS91uTE+Z0O6drguwJb/JUhlUxer4yARvRWgT/wA/5iEcM
         8NF9PDRV0Ajw90a5ifiN6MCnx+caM/OfpzTNVypLRR4MJ3p6Vb0DqjNnTB6lPvoGYM15
         QsC5qlwAIAlN327oxFmjAvMpIi6C+SFBr5yX/73a27x4C6/5+OrvIqPkPXXaq7/7C1UO
         ymhg==
X-Gm-Message-State: AOJu0YxQX9T0mBQV/00Rnr/cQrmkR9aZKXzGj8/N0EJVnVEZOUftCYiL
	Q99mcBOYvVoMI/tu6qe+5nxenJnUReeo92swvIsbWUNXm0zVXmtUdBKfVGHPFHliAzBUbpqqooE
	KKseVU+3B1umfkIOwuhhZkWhAJjdmYEU5JyN1OfDVTvctJGAhk/ksr+HL5G9o0by5BLQO
X-Gm-Gg: ASbGnctiYeDVbIJgU5J4t4fc/4GSEBVN1JXbuvMuUtHjLOkYqdp7AFlu9R4VgrUzsYW
	F8j8AhdWhdf9u8j4dPYPZGNt+IqKmUsscJ0nrRk2BRHMbWx0t6NrsJmPk9YYdDk3ujnnM9CO7ZR
	CkQ2ky3BWN9WrImHA4BOgyPdoclr4QHrXVWxhisy/cvyQL/IKDbp+dPqCk23xjEuaO0HWQYExyy
	+/ljARSLytebD3MC/kBnUbrhcdCw8ePXGIUrVh/Idy8LmQVgBWn1cWuYeqt9Gh9xRaHltA36TRp
	/GvskQjrsZmV/16c9An8/OyDNjG+RwqHW8lriAQamrpizu3GGGNTMT6QzLz4HrUeUBMTVegpX08
	mkNDDkxKxr2zH7iCwgWwKymc8NSGJlyGEaYDKM8bsMUTmvBLN+bCDOmlkHGH0yomnQm0=
X-Received: by 2002:a05:6102:5245:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1939f710emr423974137.1.1763476331496;
        Tue, 18 Nov 2025 06:32:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEAZrw1Dxy9Q4fo/SAgS5IBE3ZPVHQRDrYGS4oM7NCvaf5YYAgBS06mNNTeXTjTyLO11SXA==
X-Received: by 2002:a05:6102:5245:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1939f710emr423950137.1.1763476331024;
        Tue, 18 Nov 2025 06:32:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9d38sm1383993966b.67.2025.11.18.06.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:09 -0800 (PST)
Message-ID: <1ba91adc-5011-48cc-838e-7e02cf8b6d0b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts
 supply boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-1-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-1-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX5LOAnxThQASG
 QXMyBUwpt4o6as86vtRb7zlz4htQqDm4UcjPmaYTIf/V217jIqTwOmXXGUS0Bm25/7n0w4u0Gux
 xz9up1GzYqkGwVKH2Viz5jjwiQC9KmpIkgrfoXsT+pUiVCL5PWj+PcCtY4hvvtohjYiLjx+GwjS
 xJ4pRlrosuZMiQk6DcMV+havD9zTw2LrofV35kuQkW0NexDqsI1iAZyfEuk14hbGwm2Y/PCNf+T
 dCWfeiayn+trOWSdrob1Uf4aU4OyuPxAvBtwArVNsDUN4q2mEo8j4UpppID1Aeqn0EScoIAUq3Y
 fFOMBtdjdq1BLkAFpKgobABWZLhCWu0Hq7sGQunl5jH55fH2qSGQljMcUKS84jpSnrq3GlOdZBS
 HnM3aI9DycIKTBQDHxdlvH/BuVSjIw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c836c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=_po-8MkxtPHzYxMzuoMA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hXxAON6Vco-aHbq4-A-NdXvluWJaMB1R
X-Proofpoint-GUID: hXxAON6Vco-aHbq4-A-NdXvluWJaMB1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The touchscreen 1.8v supply doesn't need to be enabled at boot, only
> when the driver probes. Remove the regulator-boot-on property.

This is not exactly what this property signifies (although it does
indeed turn the regulator on if it's not)

regulator-boot-on:
  description: bootloader/firmware enabled regulator.
    It's expected that this regulator was left on by the bootloader.
    If the bootloader didn't leave it on then OS should turn it on
    at boot but shouldn't prevent it from being turned off later.
    This property is intended to only be used for regulators where
    software cannot read the state of the regulator.

Konrad

