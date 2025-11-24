Return-Path: <linux-arm-msm+bounces-83124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BDC828D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3A793ADAFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 21:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8744B32E6BA;
	Mon, 24 Nov 2025 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BufXf5vF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV8qBse6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5182F6925
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764020355; cv=none; b=XdeOMYQcKgwUskiUPNenMwMI7OVaDB9e9uI4eJ8EiMHe6vGjyOcdkNc53pKXjAu1B5w2+h1NU3ZWemo9961gdsz9NfKWq2ejOj+7xRQtOaYda/3v94i0vizsMP0swDBIIMonou2mSpIYbqSzFr34zOSsWoGPj+V1B+zfs8aD2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764020355; c=relaxed/simple;
	bh=GS+UuGlRaor7WWCZH1JiOp/qOZUepK5YgfkenjUH2KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWr3USbJOFskC3NvVavAz4cO8gKvn8L2snHnFdt5skc+WUelxwuR9WddVJakdWCno02uqRvTgYePeqECeLGpX9w8xkJgnnrmF3ILiODKuO8IiaKG9P0pg9FT2c9KcTVn/rkCedy05HAIF/6gJrEJMf0DWQGETD1HCKamYMrv3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BufXf5vF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV8qBse6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOJroQT843553
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=; b=BufXf5vFYj2Hddb5
	pO4tArFN79drh7+qn9UIBs+E/HUCIhb37y1QUpb2j3YWhnhbULTj6+9MDIKnzADW
	yQ+1Y1bil1oSXQuABpGSxNbT6SJzi7zdUFXMar8B1N7y1BBhNr3/FlpxGFymwepU
	WzliofabAOe3OYFpi4U5kby3Pc/CabGUBnu7GBUfmwLUKmYEDGaUHP9yT0th1yAA
	YLAFvBTxY3PWzrN1VUt/KsJ5slW7UqHHM0BGJHCtiiF62FVXmi8PoH3rPSUjhQvN
	WNgD9+5nzF8hsgQ9SchyUsNuu5gpi4y92XlgzhQ8Yqmu6iEz0tDTfq0OsD5tz4/j
	97RXiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv699fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:39:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so9919453a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764020352; x=1764625152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=;
        b=dV8qBse6K4Q1p6TUdDq4TGjOGX5evntK44YYXleQFMp28dH0wrlMTPrGNjHg8xvpcm
         TYAq5B3Bqh9Jr4D/R4bNMMFibnf1cM9XdhGIXP3y5DjDvPZ+sKgzG/MLJkscPY3cQHeO
         h+5OhOKPnARsmk297WqYmrDozvj+9BJ8qapWmOuZR9EHBPhOWGiID0j2UCr25UecBYYC
         1/EQjDRqKJ/UpAiaMcnnP9mQG/ds0ePdxw4wWZ5azmPT+qB+ST/qCZ0sQ+PWxE+MucB3
         rsSFhy14N2hFsOaW6+qA5rhwEkOUw4LmexI1zQ+SlLeB3KzRyKtX4CUVxh6olTR/zUU9
         Fh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764020352; x=1764625152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=;
        b=qOMe3qdRyfW1O4p3j/T6izErwO0/TIXuraDYTUmjYZv1IOvE2dy/YZSsoFrFs0pFFJ
         /e8V7DwfFPbcV+Ey7chzdwNldMkLRcurz8ejm+b0fiUuThRLsiIMAXT2Ksxb0vHw3eKp
         pd9+HcWacdqYVPbbvWaV+V7rv+fbKuHvlQ8zucIgXCbdoshyBYyTZCP2xGtA6XtSkmaF
         AXbnJjr/lib0PvDnEQ9Bf72ZncnObTNUQzwy0CPV6wI19tQ89wILpgNebVuC5KebTFrO
         WrsjooU2Mf/ggvnoGopAuK/lMg9Tdu3W1FgEtZakh8/VoMe0xegktoA+4CCwxpDBCMWm
         OXEg==
X-Forwarded-Encrypted: i=1; AJvYcCUdpsYExIFPaq71OQJrqi0O44Kdkecsm4K4ThOEJo17XE2x9PP3/WbeGlCc45+W5/2lh2s39dzgx0T123sb@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRPbX9GsB+u/p3EukX+lhj+F0kb6sQ3cn6dceWcf9DMoDgntX
	H3CU4BOvYVGppPDZ9vMEvWaHZgnJK8Hb/cWuQkxucJAzfUhckwdyojsncYUiP0x6Kum/lgXFEqQ
	7gDRF6CRBCIEAcV8uEC3GLlFfeI0l9qzS1dm93YScH16aJ+2pd78FGdxwo2p4wDtd2G2o
X-Gm-Gg: ASbGnctTdKAiuxjsPuRjBSFN026GlTnu+tk9OCwLnKfQjZFWyK2h3PqzbXx4z0py58U
	TqvB713J7eZVjTGVgEgQu1EOPnh9sab+Mh14LQLezyNvl5FOkP2Rhcnn1rSFEV7eon/XnLJN+Lw
	Yvd4oGrkmOAEQURczpYRgkpVjPDAzGdjiGGXBucekMVigM8kCFHc2rYpMPfkngrkMIhLsPL6/L/
	azk5IrrYjyjCveOFE1VgjlUGcEDhAXXfE0/zo1+hPr6GLm3dWG+rw2VT1UBqRNb3Lj8yhp2qAxT
	QfeekJBGAwf7uT6O4OvOkk+VJTX2Hn4vhCl1qDc5qgPcEd4e17lYO5s6KY3zEiRzKMzHFvwsPWe
	dJCnqMYqalQBq70uimCBkRZ8g9VnK8Q9MIiU=
X-Received: by 2002:a17:90b:3e87:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-34733f4f4bamr15101968a91.35.1764020352526;
        Mon, 24 Nov 2025 13:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBTx5teH4HQxlx3zmAf8DbE5rLFzZMVPvASueFdbjQ/qQPaDPGzHLFZ88hLWWlnqEQSKoDAw==
X-Received: by 2002:a17:90b:3e87:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-34733f4f4bamr15101934a91.35.1764020352034;
        Mon, 24 Nov 2025 13:39:12 -0800 (PST)
Received: from [192.168.1.14] ([106.222.231.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff9fed2sm2224a91.6.2025.11.24.13.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 13:39:11 -0800 (PST)
Message-ID: <1207b70e-dcf1-47cf-be26-ff2928932e3e@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 03:09:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE4OSBTYWx0ZWRfX8PniyI8do0Bo
 UNhEmMOjecnd9ELN7u/eoXjkVMPaYkKFLKThtLL/roH29sHlVi2l8lkvUKoJ1qQXlYnp2IL9Q11
 5xDcHrXwgvOBgdEWdycKjv4FldgQ6vFDPTNQarooVDX3KM2f2jJqKD7/1nBuUn7wSLehF6YoCSF
 zZcp55IeIxfkM2dM2GZG/AMSxt30zY1DGMFa8WBstW8a+8/9JAG8MEeTTpQGqkfBbFyFQ7dEn9T
 lkcFnHXX1FAZrXAU4oBvMS082MJg0Jeov6mREUpUXNgeH32JgQVVY+5fYPxpzEIn7+/r2sOczHW
 Upny9tX5IvjJEn/glS7wKDaQHkYw3NeBGfqQRgPtXDGYDh3ULZzbKf+hNG8MGU4QKut6vzSK++M
 td577Fw7D5G0gGLEs52w1m+qKIzIbQ==
X-Proofpoint-GUID: nN1jBrJFU2tT9CBFb70f7xlvqgiqiSo9
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=6924d081 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=QME20dCx57Gc1q/4dZKLgg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=X55b8mUuofX-4EZtosYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nN1jBrJFU2tT9CBFb70f7xlvqgiqiSo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240189

On 11/22/2025 4:32 PM, Krzysztof Kozlowski wrote:
> On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU Core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>>      else:
> 
> I am pretty sure you break not only intention/logic behindi this else,
> but actually cause real warnings to appear.
> 
> The else was intentional, right? So the pattern further will not match
> some of devices defined in if:. Now else is for different part, so only
> 612 out of these devices is excluded.
> 
> There is a reason we do not want ever else:if: in bindings. If it
> appeared, sure, maybe there is some benefit of it, but it means you need
> to be more careful now.

Aah! I missed that this comes under an 'allOf'. Not an expert in this
syntax, does moving this entire block under an 'else' make sense? Or is
there a saner alternative?

Regrettably, I tested dtbs-check only for the talos-ride dtb.

-Akhil.

> 
>>        if:
>>          properties:
>>
>> -- 
>> 2.51.0
>>


