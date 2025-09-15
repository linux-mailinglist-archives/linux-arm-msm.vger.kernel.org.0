Return-Path: <linux-arm-msm+bounces-73493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AEEB57194
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3EF175006
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC35C2D595F;
	Mon, 15 Sep 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9hJLdQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554002C08AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921679; cv=none; b=MLLM8eiG8hB185TDGyA6AW6vMZC98cz619w0etoXSdQjgsiFeeJOiSwEY074Cp/+wWn5jIdZh3kbzO2QzqKyliVIIF5iu2h10OQhQAuyfXtn5JdhdvZ3CGKSMJWbV7pSde/otlxQmMNhu5W4RBaWyFAnBwRIxrGmW3E6atRp9Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921679; c=relaxed/simple;
	bh=pA7xq58Fqd27paAbgr3RheVO9d78UaJb5yfTRDMvo64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtoNsDuETCN5YuVYKKw1PIC5Uy/jwAAjcEY0U6REnGNA00cZskC7kISs+Dfgz1yhgTjaERIMsIkhOZpwjxOyrkmPJuLOv0VSJhSfjqqTRWXo5kaqefoTU1WnjbsDTOZ7B+afDpv6nNQPuJpL0UqSOylrdcc48rj8ZdB1dA54ZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9hJLdQe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I1KX017588
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w4oCzwIzZYIKPOJu+YqMNrlbG390YP6aeKNtC8d1OOE=; b=G9hJLdQe2GulXu6n
	1EdMfPas3FfDfPhKzVmZ8TTFKddGgtSGV2ex7iy30aRrXTGbk/D5AJAGkact2jK2
	U+rYbzrrif5Tb/78i3WkTnmhqwPk1YgPTz82gl7jmyNPKYIMQLa1ASa/jM1scJMb
	MYnL4iuvpLZ2uiKIP7P1yRTGkDMMCY2981hM9HXXjgSaGshdAxfYgfmodERzV8Rq
	k0wZ5XFGOl89+Ab1QobSZAAi4/vV6f8UJ/LNAw+obdGWM7xc5FSv1XPn5g5v0W6C
	TYObtLf2VTbaSyla5NXYacyePYYTS1KiWrVNxvpOCk8ISrTEuNX/IcynjwQfdKhU
	TP7zww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv3ysk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:34:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-77e3b8505a7so5905666d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757921676; x=1758526476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4oCzwIzZYIKPOJu+YqMNrlbG390YP6aeKNtC8d1OOE=;
        b=jngtgoaPTQYks67BYNgPcu3YWWvFzCkvOymQiR1cbtEOITAD1p/FLcIQctd+n1ytRk
         k/pJVKbQ+sAP/XfMe50YnlZskityr3kHRrslYfE3+r0NCrLEbDxbFwxzXtUfMbJV1dXL
         42Jm/UMpGO1l4tbjbjIjZw/7lIGtFykQ3Vrl9WN7xqt+fxW/TNsxgTGyhBjdOu7yfnWC
         oQNw7wl5HlJNI/kGi6udOxUwzKPvnTc+NL4s9Vg+H0jhgDEWgH35me2qdE+P4nc57N5m
         nmVLYfmJUY0j36vS/xwEQeoViPGptE+Fz3K9hjzf0mdXMykT1CCz3aCCdrR+TI38IrvK
         vILA==
X-Gm-Message-State: AOJu0YzkpsWICoZ/w6nfK89//oOvME2B5yDsCf2EbNLiOZjusE5/9r0B
	CQ/uw5RwAY0i3kS44Grrco+cu21m/P97t4P/k/V+LsDsAswLdbVHrAu3IOszBcysDtI9kVnCBu+
	ZkLkw/VdcNRMNsLxkSF6lO6Sy2vIoYWtupjg5p83vOiDi9Pjk5e4x9Xg1BK/ajya6YW1S
X-Gm-Gg: ASbGncuV3oyN6Spf9oxGNPJthdpCQdv4QmHaeHaqRuj46Ar+qZzNrlujBdzG+Vaazcv
	OxydzaTPbHMnRH09Ip+Sr5zIuRwgZKheFMnIiFs6+nu9J6QAKtWjmHZb8g04FVcwX92+7OyEo6u
	xzX0UtpG8xB7sH8Cxi3RQRx0eRDqEpJcE3n4ONBlvk0YjCCirKS0Q4pzqWsk1BNrj98bHEr6Uil
	utCWmHgXN5Zt1zmwZBBY3WbwhFoP0Jj1AcRoJVtZCn4tnrB3rvP5N5j+BNI4PPlZ5PaBx+TmdSV
	OkBc+/UnhmN6fjK4cGpDikjS1zxO9j4lBTGKj7QCIviA40Fwy5Tgb/xqWPyr3Pjg5qSpub+1I5Q
	vFlOC91NJv0HTuktXEqABpg==
X-Received: by 2002:a05:622a:91:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b77cfcdec6mr106907711cf.2.1757921676181;
        Mon, 15 Sep 2025 00:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+u642mK5pX59NxQG3Z3A6Le4TijvPukrqmOimpRbxXKQNPvZpPbBJQAlASOVx2+OpCvmMaw==
X-Received: by 2002:a05:622a:91:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b77cfcdec6mr106907521cf.2.1757921675693;
        Mon, 15 Sep 2025 00:34:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07ce4dbedbsm611094766b.9.2025.09.15.00.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:34:35 -0700 (PDT)
Message-ID: <281701de-181e-439b-97f9-4bfd103f7977@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845-starqltechn: fix slpi
 reserved mem
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
 <20250912-starqltechn_slpi-v2-1-5ca5ddbbe7b4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250912-starqltechn_slpi-v2-1-5ca5ddbbe7b4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7c18d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=958_26X1zRvj7spRbiAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KBzbB5yMc2VH2xSDMl9M2pKsstRzMdo6
X-Proofpoint-GUID: KBzbB5yMc2VH2xSDMl9M2pKsstRzMdo6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX4CJcx4fYR2p6
 fun4/lK6JmM71fwPt2jscGA3Lq4Ba4qiielPCIrwGIC46py8LuMhOUTTSIeFTSdQLLsSPYzzd/j
 QOj3t0kEuWLY1CehIFCKY3W7jrE08V66/phqjMjtWWkYGhW+b4QB24wMmyrPH6SlIfuE+PzeUKL
 fTLJqsWjCRHoaEqrnZNJ+bVbHy3R2ydqqgoz56CrzhhBUfp6tn5nFXC5BoOd0ZCZPQnzDWuvmY1
 Hlp1AkV8P3g/P55+8qQqOE+jplmUFv+JbJ1EC+WfGpYOdtMDj9IIxXcbBs8G8nKIgEzHlIy3qmv
 66xLFCHilfX+b5lgejN/jm/gDoJlu3rn1wako9/gnm90PggzY3iOiQUJxC3eO+y0aeT7Vl+1A0G
 3/va2JDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017

On 9/12/25 8:56 PM, Dzmitry Sankouski wrote:
> When adding adsp reserved mem, slpi reserved memory was shrunk
> according to vendor kernel log:
> 
> `Removed memory: created DMA memory pool at 0x0000000096700000, size 15 M`
> 
> However, kernel failed to load firmware with 15MiB reserved region:
> 
> `[   14.885885] qcom_q6v5_pas 5c00000.remoteproc: segment outside memory range`
> 
> Increase slpi reserved region to 16MiB.
> 
> Fixes: 58782c229e3e ("arm64: dts: qcom: sdm845-starqltechn: add initial sound support")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

