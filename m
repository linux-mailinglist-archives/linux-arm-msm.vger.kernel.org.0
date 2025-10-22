Return-Path: <linux-arm-msm+bounces-78372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA55BFD620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24D53BBC37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D93734EEEA;
	Wed, 22 Oct 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4wsam94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F02853F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149618; cv=none; b=muTl0cdEWeAh+VVVKKIv7p2Y0flJm89G90ywk6/dZOjgU6zDRe0b0rdm5UooG6etCV4Fi2DbO9jFBwtnSdVg4cuOtS1nWU+3XhZZ1LDOO78qFqe5iD3MlTrBP6Ix5e/Xfhow/P4Iuooo8RX+Yo4fdp0EEV8mVoGi3DldNIR5yCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149618; c=relaxed/simple;
	bh=hrAdyqmnbORphsl8iKrOSD8immxlH+jgdAkkdcSEhJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnoHukrIlkhc6QwvCfXLfJ6C2jP8XJgIMljk3lzxwlwa5vu8JkpnQIphsd83RnnYyUuoA9R3gEMl3Vb/uCS8OBOcq1bPmu8uYqJ7w5cpvl0IqbVAm7CIvR4K1qKX5wglO6gORwL78Nr2qCbIqRLhDG3+ijfBALF8wLoATczVYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4wsam94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAMkUI020635
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwOfoThWrQGJmwa8H4o/SymLUn5pkqKkfYkaRMBxxVc=; b=c4wsam94Jh1Bqcwo
	Y1pTkg2h9eDNoBzgBLGqyXvvs5fKrjjorBgaBudnJaMh5PLcFQ7zV4qwyAB/wCMW
	iR9N9PhOpNqwZi5LVqWKWKZPivkanTfTwBLZMaMC1fGaIbNTAbeVYg4moONGIZrW
	SjJUQMJIoF1Z39pFCS8jfJon8dSozrwyG0kyhwBAis5D002kZ1WELyKpTi3uBjLa
	M/u55nIpTSIyqKuA4YB443TV4ciWNVnojZSW/aqW6OAyS1EtzvHDiWfiXMykipHI
	y7YX9COMRJlwWeHM8v79LGxagf4zf6X6KsjgOfsFDRPTic4y7vlxMCpA7aQ4ZUmw
	eHrx8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3445b8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:13:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8aab76050so4705131cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761149613; x=1761754413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwOfoThWrQGJmwa8H4o/SymLUn5pkqKkfYkaRMBxxVc=;
        b=qXqHQSXZpElFeV+tws9UEpvry6SIeic7jUnu3DVXdzMkomUcFp+YslQeKYZr3oN8MX
         M/DyYogqS+r+4I1/rv0jVhrXR6v7WzoTw+Ym8kmJ8nSpY7Y2a9bcf2ih+xF6LP4Og4+F
         t4GoJmJaF7CIMU/yfwwEBJ0J7c+krg4ZkvQXrBx+5puFqNf+CzGPRk+m292NfMN2vgLG
         +qevq0+AUU4f0l0SpucO4ItdWpXaSrR6MsvkbyWNuYDqvQR/arXyKZ4IoEB+L3Tof6xA
         iQp9bYip7PYLwkr4QqtEzyyON8DEmBgtTeX2zsAtKLgxtszpgu98zE7+94bGKP0M2AVb
         mksA==
X-Gm-Message-State: AOJu0YwhEFIU54sXB0m9uNHg7nnD0djqyjrVjIWnxvkDZaWhG00iB8lP
	bspm8jBHTA7+RDUIp724fKfbnsHR/w47SRxgG9LOAtVInNB5v3YjzIuizcnjExSOo/gdi+5roFK
	qN+9ddwMoaJXIzwOvPggSyqiAG0E6owSDyq5v0u66oVOmFys5iRdcIuZo+htP19U/UujS
X-Gm-Gg: ASbGnctogVXIjKDu/5yCNrXOaLFPfrLJPsxLTA96Os8XQDfrqAEyBLAiyF7LcN+S4Ku
	nR9iSs8ERkuwQf84KxxX0PH8ry5XliL6drwlP1f2eCbT2pkTkaHZb2n9jEc4fgaGWgJTznNWxOw
	KqklKewUrBXcU38HEwaDBEaA7eKWNPThkzIIrC0nJiJdd16AbB2OxHUYCzAi1ve9rMxMWeT033q
	cyLork0/QuVoaMK9Z1BSII5cXcx49zChEeRK0Oq4972fn2V4+Fkp26huLAg14SAP827TAzRzH94
	F+yn/DKR8zD89ltJTSp4C2/NuoMpK7N9Lcedb2k8a4chuvBOdBkOaNvk0LbsYPU7TlUWu18AmJR
	Ek7iHMsZ/diL6xKGKYi9/3ntWzL77dU2ZzRQhAq0Got+3p4v6/CREgH/Q
X-Received: by 2002:ac8:5fcb:0:b0:4e4:a58e:9505 with SMTP id d75a77b69052e-4ea117dae47mr65534111cf.12.1761149613245;
        Wed, 22 Oct 2025 09:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5DVwt2kzigfetQGsDzASKN6va4Dtb5+lbF6ZqHWsnGkk5NTAYapVVBrFqGQGYhyiuWSEQ7Q==
X-Received: by 2002:ac8:5fcb:0:b0:4e4:a58e:9505 with SMTP id d75a77b69052e-4ea117dae47mr65533681cf.12.1761149612727;
        Wed, 22 Oct 2025 09:13:32 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83937a3sm1393835466b.23.2025.10.22.09.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:13:32 -0700 (PDT)
Message-ID: <aa705253-2d4a-401e-984d-5378d49aa672@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: correct the TF-A reserved
 memory to 512K
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014-tfa-reserved-mem-v1-1-48c82033c8a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-tfa-reserved-mem-v1-1-48c82033c8a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JrwJlgOpxx3Y50rriLKPFPH6JwwUYS85
X-Proofpoint-ORIG-GUID: JrwJlgOpxx3Y50rriLKPFPH6JwwUYS85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6hWB8uzErCXw
 uleIUUr8JwZ3lSzsJMTS0GNYeXDykc+XRCO///TcybiCi1Q3zYEyVTHs5MoDdBtKt8auJwrEl3S
 KNsYNzD+OmJoQu4mB688IDzJunq3s5KH1gqjWJqvQ0UjtSAcLjT++7RcwE2tsEqKIRcEp2zdsHE
 g9oFvTcUWG/+bmnlaylVAxexPe7XxqB4gh2eE26LEsf62/moKVA5NCtEwIZRUpnIILJS0EGg5+c
 AcUQ1ftAYESZ2wEU/U5eHs7eKdrccaZzhPo1Ok4DufdoJYE+krcmFvu0grHqIc0oNAxEgXsDg9L
 yCMxhw0xm6eLk5HN9AFpyFwj3pNJUeBhmUO4bWFz2l9dHoOyVIxpCGez8nMULfJ+DFtLZOy8fWp
 vMbVRjamVry0DHLyapYhILnrkYbqww==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f902ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vol1V-uZCnnJZBBYJhsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/14/25 6:55 AM, Kathiravan Thirumoorthy wrote:
> Correct the reserved memory size for TF-A to 512K, as it was mistakenly
> marked as 500K. Update the reserved memory node accordingly.
> 
> Fixes: 8517204c982b ("arm64: dts: qcom: ipq5424: Add reserved memory for TF-A")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Bjorn, this needs to be pulled for 6.18-rc as well.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

