Return-Path: <linux-arm-msm+bounces-82855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77136C79FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 549373810F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6197B350D61;
	Fri, 21 Nov 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhRp46Dj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbpSs+wG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4731578E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733077; cv=none; b=CycKmHrZ++e5NaO6obEQKTbnwt8CGXJY1jQSOQAYBXeDQ2VBb1Y4uv6FR6f4L/hG/AYFxwsgc+QTylfnLhjHlXjWjmeBTpOpDCepmax6FaxWiaGvEIoIudrKsdKo6FRaELAEYFwt9JmjmREFbRixaIs2v9Yh5pw2GPaA2TUpQOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733077; c=relaxed/simple;
	bh=DG2QRcXdozYH0xpev2AzoCwL5uVdcNKbokJJQvFJ2pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUkXJXwG133SVHA7Lm7XZxLekYUfLtUCjviY4+x5w7iNK7AqPurFDWPM7TiWIjyxC8U55dqudfH+ebmrLGwK2i5vyZXy0mQV3EVhxVfIm1m7WPAfT9KUOu4U/7/4Mne+AO693MLKnJvSOkXhmI2o9D0Xue/m6Y9Z+bKslz4pRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhRp46Dj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbpSs+wG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB49KG3911311
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JadzdbO/0CtjjJ7eJa56fAh1RdMjyulBy3lN6xryBUI=; b=PhRp46DjMQ8GzPgP
	V4eKLrYCpI3gP/Jru03RNPDd9NLnPt0tgdJn1o4pnIWR5DiJpx2Bhku7lbsCtiuB
	8kk/x5NyPFIEVM3rbnIIc0rXYox0I4dwH47Og2v2TxWU+0Sw9I7t7ChTpNPEyVgJ
	eKw2VUw9y7B0KQXsqRbSmeSOMpPg3dWaWW7GjyMN6/jeGCf+JxcdAN27VJBdfCbk
	QGXshSJZu1qFOyxZJthn6kR/6lybp2Klyj3Oshqio34EnAEvFPaV9jYQ25FsSPbZ
	lXQUKI0UYJdaEM871MupoDz46DyFNHCaoFjThEMeOxyaalc12z7hCZ/r9LNkhO+T
	7Sws+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsgem5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:51:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8adc67e5340so30213085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763733074; x=1764337874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JadzdbO/0CtjjJ7eJa56fAh1RdMjyulBy3lN6xryBUI=;
        b=YbpSs+wGfC1UwXJVEnrKAqLmiAubPRvfB1TeVHIV7huxuGMTOdv4651Jc/0RReIdgn
         /q2TypOIbnBn7cC7O6wQy9vWBZEQH/8LL7N/y7FrPd4lhldvMr8GSftECtXq/S9auoqS
         fprJEn8VduNwYyRLX+7NrkkHFEYCjHMvPNu/zoN2qqjvjyi+PZkI2QTUqRTcdGAsTS7H
         6Nhz6kRdAde52GMzECC40EG6iz/1nvmKHvcIrYHIMm2lgPQ6arrTyWKWECgfnbJJz/qA
         TTETQp1wHEoRj+0O3YES7s7AzQYbbzJEAwK3EIWDntkq5ilaw2RBJWH7NxdxbQ1Mpmtw
         OTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733074; x=1764337874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JadzdbO/0CtjjJ7eJa56fAh1RdMjyulBy3lN6xryBUI=;
        b=GeQ+figyyh5dSnoOIEhHaVccVYCPNhHTnDEvdks2zgse2vogppyqYV7KhtWCGOmBWp
         Mi10HvN7ZKF0CrFIWhUAoHVv5r1aMaSwSwUTqlaGnPYLxv4I0LGAT2+iQtizm84RTtU4
         U2bnxdME+q19QxAVOEHmJ2NzcqFAoc8NSyzb3Ao2wFk2Jk+JZSnG1JkpVDNloNgYQYOr
         Vu0yjSeNRCAtTt4kD3buVwp/GGN8xiPoOodyRs9H37EGEI2dtet20Rx1Hj8LyOxklhqM
         z0UpXLX+xc+InbITkqONQyOeIgukcKfcLQn5fK0QkubkrrlLLMEXx6g0LgkHh1DZRhqw
         vslw==
X-Forwarded-Encrypted: i=1; AJvYcCUFkvaxeeNMXs3cDSLOlASJw8lMIKyaYym8W4iNdDUpznaSLetcDyVgCde8wqC4FIeCAyyvCE6x/Va1gcM8@vger.kernel.org
X-Gm-Message-State: AOJu0YxedMGfmlUSHYYN3r4ZnNj1mUEr2KN1WLU05mJo9Uqr/xumpX5/
	ijKgiLjHUJfuRBlGneFADydqIQ52VIckmSkmD1djTNSZ+/g0BU598s+MsH6cjh3A1bAKsZDzWHP
	fP0yzuiwTxZQQ9+co4lXZPH8ugHC75jDDdp7pq/XobnVo+kGpLThqQh6Cxj9JMRlcLvuS
X-Gm-Gg: ASbGncu2ghhCVmxSlsScJS0O1sQ2gWH9PZBjV41iy73neP3w4VUM8RptogsC1RFCRPB
	6gaMZQUk65utfWPeUvWjfqU0okDpGkRpe3+BH7b+ezb2tv7lGsvVnAOAp4U761+25zoctLe5+nf
	WLiGY8VhVTF0T9qnimnsMvahY0c52aAfdK6FFIdKW/lXddkEveHw3DyM2lAI3/3/EaIOfZQAkm3
	1zKLkF2AYYgvIh61ZCK4S7YtATa9DW0F9vStXmkR+seZZVBsx+AowU/B6g8iQeVJgDECu85MkhC
	PfhkKKl/F+XAQZ3NJhqlvK8pguqIlPz6nzue9I6p7hDRvEZ/U+svx1YyhupJkWgYIwOPIm07KFR
	43xvkt9khiZbMAfAiloI+zNqqSkH/MWDJePh5pGIg6DDrQEsoI6z4ZhyEJ+IzZeblalY=
X-Received: by 2002:a05:620a:1aa1:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8b33cfc8758mr183075385a.0.1763733074141;
        Fri, 21 Nov 2025 05:51:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFNjT/4SpHq+Sjnjw1z7I3jUONwJJylkkFpSq/rX6sP1ice8dlwFi+GSew3HUpOYPA54KhwA==
X-Received: by 2002:a05:620a:1aa1:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8b33cfc8758mr183071885a.0.1763733073456;
        Fri, 21 Nov 2025 05:51:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3bbesm459820266b.51.2025.11.21.05.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 05:51:13 -0800 (PST)
Message-ID: <9e79b63b-82c4-4e20-872e-1dfc1c1139a9@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 14:51:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: fix qcom_smem_is_available and check if
 __smem is valid
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251121091125.6289-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121091125.6289-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ELMU3rHuWcG_l31OF2eTWFK7Nyyyf_lM
X-Proofpoint-ORIG-GUID: ELMU3rHuWcG_l31OF2eTWFK7Nyyyf_lM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwMSBTYWx0ZWRfX6xQ07w17Dn7F
 3oTDDRf0DzeTn8ZY9OhLV6PDKiMNfEv3Gad+20p2Vz/EYDYzLpvK+9xta0sOzOJPTN4ebu7Fnj4
 BPafzNnPhEseBzkw4DCpqj3DUuqHW392ZGumWOrnaOevFvzYH6uKKCsaiblMBq1lytZCAuwbBHr
 pGv30kgR7bjbAe0B9x6lgfENKDYQyO6qipI33KJON3dfjz/BCALbisZ7yhgnNtrSEre3kDT9xfT
 l1MmiHnEmWRzc+iIBstLfsJfqHaBLjvNrATe23t8KBd2ms2cOuAAjBd4vSSmQqgvlopVhqjnvxC
 ZuMrQmmodLXQd6K+sJpTv8suYlj4McFO/HkAqB0KeDmbB/Ag9Wko2iNQIHmvmiZipwAiIOKTeKR
 +jFR6JtrGAmwhmLeZkxc5blYJoL5Mg==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69206e52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gJ8fBl20O5mqia6x0qsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210101

On 11/21/25 10:11 AM, Christian Marangi wrote:
> Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized
> state") changed the usage of __smem and init now as an error pointer
> instead of NULL.
> 
> qcom_smem_is_available() wasn't updated to reflect this change and also
> .qcom_smem_remove doesn't reset it on module exit.
> 
> While at it also proced other expoert symbol if __smem is not set to a
> correct pointer.

I think that's a separate issue where we should inspect the impact
(or just mention "please call qcom_smem_is_available() first, probably)

Konrad

