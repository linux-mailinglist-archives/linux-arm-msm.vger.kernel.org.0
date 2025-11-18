Return-Path: <linux-arm-msm+bounces-82230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9CC6896C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5F5102A5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F353164B4;
	Tue, 18 Nov 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3rQaBj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8Gle0pE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F7C28853E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458773; cv=none; b=CxcYLXiz+YckXs+l8doHqmUnFQ+QBM6YSPeAoZZLqX7mpgxPPSucZPhJKTvv/VwrmVJAaULyfy5pHo7Hxa+PxNQJpizKVkmb2DgZVCKnL0Vs+9BnS9JUUZflEp/6tZ1zxjTIPUUgTNAjfhBsDM7JaRp/K0KbAcjMXgKl6pvDkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458773; c=relaxed/simple;
	bh=WrlyMU3FW2/XAd/LiX9aSpm26vl+hmVr+VlOf0zE3j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5KKTJiEcdEQsElhVM2Yp7ZdKzvkXl1V6NuSSkhvhpW7c/M706XW0jKC8Bhd1osiYt2HD1tyw+re7PUvJgbXSCeI4OcgMVtOiCeM1WIXTlqgmyge1Z8cT+rRc+lKh3N1LYOWOVGpgtMG4XaKXkTse9tb1AWaNnjsskkzV+ex9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3rQaBj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8Gle0pE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8lEOM2755747
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=; b=o3rQaBj5ScL1zN0L
	PHBjTonQzOvLNOKcZC6UVeX14zXdkTIPSgWOjisVnqIpwLep//EgkR6JUdotVUMo
	E6T7T0wFwFhX4wdVWtTq+tZ2W2izSD5R/r9a6m6104ig28ALDUJR9cT98evjB4BP
	SbT1gd0CtDVumpxYTC0pA9aLj5f6kCUH7su7D9px2Z1trceFZ2hRH0DsMJad5d8y
	ZW1giSiulFLiLVtqAONduuiRsr+aKZN7BYOhUxnupNtQ/6f1N9yJMN5tSPqOFQZ/
	on/FtN6S9Qk3tLvrIjIwnkrY3oDXKk2dGFcR5LaVRqIurmr46CS7tNTbez6Ody55
	rIg7eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj05sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed9122dce9so744281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458769; x=1764063569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=;
        b=J8Gle0pE1M5TQtw2pp4B7uAqXUhCnwN+Xevon+/Se+A5cAEIUZ9tGuJmJAWcorQk4T
         XP9LH9WnhiC7WPELFl/gehAn1WdkCMUUCWw1rh120rtArDe5Bc3An3sCWMAPJjTHf5gT
         172dSuWPiYxW3ZcJntichbGn58TBb2S1OmOak0yn5xnyQkGFTHH3lJxAPDK9rlXRU7H4
         8IUTOO0Mdk65ZuDI6EJKdrGOa8lIpiZdRZi8AL3SJjdKT/ypEp6K3aeVNkD78JIzgZdl
         KsKgLxX0nWDS5KuQRRFse2reeBG50kE4ckWburdRJZo1b7/OnGLgoYRuC6rEGZXUYBvU
         Z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458769; x=1764063569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=;
        b=aV8ew2Opmo3dDn4XDsTUS20VseORlZTGMovzUYuqU5x4zSoR/9o9N3NzBu5CA1LzHZ
         O+RdBa7lA2DbZs6YlLk0tKRx2+hHJcXmtAAnF1HQftuD7m7sWKjYuWNuKc22HA0VEsdx
         +aNRJm9q/R9CvJ2EkacuOfPCRzQv2/XvKjjXeax9lYKQjs/y+7/q9EB1O2T3OgXzOZS7
         AXipqZiIay5tFa4fQRFdO8gPiakp2zx0QmRVMru9SfA5QlxF9r/Pq1MwjWuZC6Nfkpvg
         0b4hdOTT9bDU85xYTdls7ep9LV/DOGyf4QQN/KV1WlaohBWD+bmW4TISdQxDym+cTc9q
         vlVA==
X-Gm-Message-State: AOJu0Ywg7RT+jmbWBFQa+ibNMW0BUJa1j5c67fimXSaaYNWLb2fqvaIU
	tUeVMHyr8g8N/g2KG68U6NU7UJGG2qCjn+XQ47eHGUraBfmeBEUhXf/4d/w/5ES2Vh7GKqYTwk2
	pxPbzZr5OJafHjU8PRIsb5K20J58eKnuVwNsr/C6PHoUIaxwdZIQrtAJMMkI22ilgbqqs
X-Gm-Gg: ASbGncv2HbTzxuoGTOKI/a5Qc/KrwFq5IBBvI1AH204Xs3aE58mIJqWcSfA1GXmqUIe
	LmV6mbGtzkhNPZSVN/CLWZWk+tXwaZap/OUOjjs1I4t+nq/65eHWt4mepatR409mclv+z9AL9Sh
	RQazneUDI7l6IwRMO+HyZd4Ra6EUIY2HREEcccHda0yKyT+Yx1k0fg0V1DI4ujgIwH+Df2S74oc
	G5S61hAXucVJoE/UKBbNtrZTwqvS5UweXf+7QOGyZeIz5WWlV2ahZcw5tYtgwnYVaDJhdAu3Mgd
	gLjp6TO/FtlfJgVUy4hZ7rDPZQMiHGLyRurmkvxiuCiZgPAv/c6MxAGcqPo6hSIwMNFxX4NipM7
	26ugKbbDyoG5J4eEzH1PVvVRrcn16LS+oYcAkKSrSo9rCpV2kMG11roQn9flN/+wCjEs=
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr19437611cf.1.1763458769331;
        Tue, 18 Nov 2025 01:39:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpkWYRcH6Ic3hvyodSbScOYYm2d46nVwKpRacD79DGZMCLmGeLtZKUSf4TUfGF5y/FZ3a/2A==
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr19437361cf.1.1763458768906;
        Tue, 18 Nov 2025 01:39:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac50csm1305346366b.61.2025.11.18.01.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:28 -0800 (PST)
Message-ID: <1599d0fd-ad93-4b74-8954-37a754907741@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TFHXrSO9FPGxuc3pt7e5N2VQRZPnYiH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfXy4Q6zhB9f1LD
 YYhbNLEYsqyIjqU0LP+TtdJsz01yJ9A2Xk21Vzp6JHSGLlf2zhv4UGy1MSie/he78BOzAV9EGMN
 mMGogVDKE7SyuVonOOH58H+64nwhTekMMektj0jyuB+fLfq9c6BmebZ+H6sBG7hMp9l9jQp11zA
 cI18e2ucYPQfLpn6UPkKuocGjTB1zh6pQWHxiKZGHThSmXzx5BXmIq+SODv5ExgNkSxD2mJsBZz
 M9MKwfaMSzV4WdiaVpTRZbxsc/9feMDON0TEldTe4YCj2iRv3+xAOnwAlCVYkQtYFnk+OfQuhvz
 EZAfXiKJ1Oijc/+gSUuZiYRtqnmiwVayFY9jgGpZoZYBVS3EA9tx5LeIcpaW8Veg7vRfRJ42vEh
 SRYDBM2V2or5TlCh3l8QsoPD7RIKFA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c3ed1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ryDgvqaYVM-mru2dUqoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TFHXrSO9FPGxuc3pt7e5N2VQRZPnYiH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
> describe memory gating implementations that use a separate mask and/or
> inverted enable logic. This documents hardware behavior in data instead
> of code and will be used by upcoming platform descriptions.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

