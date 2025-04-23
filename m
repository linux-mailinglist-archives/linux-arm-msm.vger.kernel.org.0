Return-Path: <linux-arm-msm+bounces-55131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B781A98A4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1754438EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8111F76034;
	Wed, 23 Apr 2025 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvHBibE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098A1BA50
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413374; cv=none; b=gcUDqWYbzGWfylFC4C4JW9aM+3V0h4fu7OGcJ2NF7LkJ4P8s556LDVtxbLE/+ybTQVJvEcM3BGSP9vAsIBRseugKghUo4US9orcNKVyCvsfXkLcdjpa4+6rJbtVcOLijYpN34PtWpib4iBYa5m4tOwphUt5Pq5F8Ay33HnTiiqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413374; c=relaxed/simple;
	bh=BnvOXO+boD8aoX/yVyEiclGZPfk5b7M+Q3WLNEqtKXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2PRt02wleq8i7JMD8kjs9r8gakzBzRmpqTHmjzljvipF19lrW+l5fuxJ+SX3wdYW/o6RPVcOPH3VYwLtMWvJF+c/BGxLpq5SC1LWww8Jnfd2TZzIS0uqbSBv8tAlhB0tHb6klHlP9WPiFzb3aDodJV+o8ktoImCDbECF7gyGSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvHBibE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApPqo020408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfAVF+aMaiSo/7Us8CKrNfv3JkPdUAHjwZh9PyIZpAw=; b=CvHBibE04Ca2Uz9v
	lsgtR5XjledecTmtOP1xlkizF62cGjd1jH+g7A3Yadj6RK3aVxGiXykOBBWGhaal
	+oqEAQOv7l7jkwq3+02kMK91m2MxE9dt5XMEjpVTTL6awk9nY7ivOibVfqHwhzFd
	ygEFR7YcHzzT9/2OxV/G/7/wiyB1Xv5Be2f32ord0ohi6v9Llr682/iodh6WRS5g
	UN6L2glMhMHXkkEPRIo1vBwfSky54vZ0uj8cN5oI025R6VzUCutVd8LQqIB93d/y
	bVj7JGyGpHZpF3wkhj5SkmbudItYqmvSFyWEdsQCnE3+R7WaDIggDXZobQv37qJI
	K2zi5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh226w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:02:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c555d4ad75so32636885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413371; x=1746018171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfAVF+aMaiSo/7Us8CKrNfv3JkPdUAHjwZh9PyIZpAw=;
        b=ulJ5/tuq9Oo3uZNTYOP2iFKNOk4q39f2QSzw4e5x0/nTVPsmM1T5NvJEnwNF6ll8f+
         lLj60UPMrPR8U006cuInqmcbfgW33tuSBaFJvupNJ4x/GdtwOYO59yRUzc4mEUn3mfzz
         q1qvJIx7L9gwLvRKiZlyBWyJv2Btax82qtkClyEz9rov4d8YQF8Cqw24FSWx8iPFKfQ3
         UWPg7J8rNFu8Hi54tusB8wCxxa3UU6flnrIKJgzjuCcSmUFoat7l8pHzAtad6aDzfMt8
         YWRJGVQ0tPjlPhYOiy499FPQw681YEyg4eSaTP8kSERLno2bqt3CD9LXRahdhd/Jgvj6
         k1hg==
X-Gm-Message-State: AOJu0Yz4x0qAtHAuXzLnMBTgAMcMpy7myIAz9rREFKekyMQ07YQSaYur
	2h8TCk9+99fcatoWixJvUlDtO6TOJzkbuSPKvb4dWAmp0GJKCrRBgshxVlWdBB1nvXFeN9Z/JaX
	X4cWl2iLjWu/iHaGnzhkMG68F9vx7hrh5YWlTDO154QUjJWuruNt8TXsq+RZbtrmC
X-Gm-Gg: ASbGncvL04pUM9UcrZKM9BKDC0RohGQVirEPC7Ig3DP7ENsnY8/SHqFfu0IgfmxDAMR
	wWuMA6HRh3sS6C9s0MIE6tkHYti/A0FYEGZGR2pC6syhmMvenzqsRVtJ03C3tgkDB4O60AIpT+q
	jzILURh8JOUTpjIDsaqNgvn2Eb9ff0w3bPmek6lLCvaVNpFxUCSOQ/mJzmUdnJwZ99mmdLix3fv
	FWwBvxTGEOU2E8ZLLZVCyHT6epQxz46wySZ6ufCAQLW1m8FNGjXZPNX+2xU8WKIDDolfAkNDPdR
	c5hmfhW25/Ey5aZeDx+TP7btQkhSGIEh2W2sOZsMKNQ8qkWqzBCqnj5aSiDHILt/YSA=
X-Received: by 2002:a05:620a:17a1:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c94d32ec56mr169897785a.15.1745413370759;
        Wed, 23 Apr 2025 06:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/ovwutEM93izQp2u3D8TlzNzpz5TZzJ2ihH4iRdeWJCL9e6H4/DMIlsm5XIOUTBCuAmehFg==
X-Received: by 2002:a05:620a:17a1:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c94d32ec56mr169895285a.15.1745413370184;
        Wed, 23 Apr 2025 06:02:50 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf37sm805661966b.97.2025.04.23.06.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:02:49 -0700 (PDT)
Message-ID: <2dae7d88-4b3e-452f-9555-05f10b42dabc@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:02:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add GFX power domain to GPU
 clock controller
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        stable@vger.kernel.org
References: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808e4fc cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=O4X4kKYYB9jgRp4dNnsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GiaNBepTTgL_D-lAoWI5nAKTmKRGi1OQ
X-Proofpoint-ORIG-GUID: GiaNBepTTgL_D-lAoWI5nAKTmKRGi1OQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MSBTYWx0ZWRfXwA1DArjndTKb PmVEz7rwY1bTO9K7eInrGptVdB3tpuSLhTicAwxfvu7s/H/k2uhTQfOGeA1YEufMo8lT1TePZ0i q5bJncNT/uauPk1KiO+nlXQzZ/bgYSVPljUAdk5nyxHGX5VyZO2gGF0/uJbvhGtnAFKJEQVh0gI
 RVZWsc3k0A0OT+aGus8A5SesMMjDf6jMscF0OjHwgsg0cllT3Ed26rFfKFrNW8Y399OAmNzoPhO 1Zw0hOFGErH09ARWLJ5/84kTuj7jlvqX8UsEG/ftJ2iIda10VyjQfjtPtg8ocSfJYIPZIg2JskZ j89YYKbCRUYToqiBYB6uChnadFYVg/ifJzOGods5ikhrQGc4HDN+1adFEgEKFI8M6Kojt0A6yN8
 dwU5M3hP/Z5ZPv/tZpbIs0wxGBNb5RXgbQXcHWSlwOQgMZ3w3HEP7usQSX1nJR9NwRgMcZ1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230091

On 4/23/25 2:58 PM, Abel Vesa wrote:
> According to documentation, the VDD_GFX is powering up the whole GPU
> subsystem. The VDD_GFX is routed through the RPMh GFX power domain.
> 
> So tie the RPMh GFX power domain to the GPU clock controller.
> 
> Cc: stable@vger.kernel.org # 6.11
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

You shouldn't be messing with VDD_GFX on platforms with a GMU.

Parts of the clock controller are backed by one of the MX rails,
with some logic depending on CX/GFX, but handling of the latter is
fully deferred to the GMU firmware.

Konrad

