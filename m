Return-Path: <linux-arm-msm+bounces-87231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD756CEE7FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3449030194C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F6830F54B;
	Fri,  2 Jan 2026 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kP/e0tHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMaKcH18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB430F54A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356443; cv=none; b=IfDEAkPeKDG8QnEthrd03ik9FScGxy+tyUqkZ5EZPirarVWljlIxJKJeHskDjgQrnO2Ak1eIRsfcvtPnAx57kQheYFkSCIie8Bh3Ym3EjJ9z3DYMCAbLNRD+MiXWYj8OkaEQ3jcD+ZvcBwOTK9hkDFvqemL/uYTwVF1bs7/VeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356443; c=relaxed/simple;
	bh=owC+cHpTAGTTsQgb792yY2Sij/IocKp//dcZLvc3k2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkVyIYjyiWdHnI22tedF/D8tndJ7/sv8/H36Tj8nsK+0vfmQeuTvDwCaZZkbubbPmDU4IX/RWtOqUjCYNsTrAym6J56z1cejjumcIHic9j2/KcDW8x8Ulyy9nmpZZyP6QFFMZNtc0sYu/DMjfOKP1LHfEILjdYIeQzL9xjDO2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kP/e0tHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMaKcH18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2Vm824403
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	127mHB4mt2dFg8abT6ez96BYyktNn0EP2M/rkydMbnc=; b=kP/e0tHg45K0QH8G
	Q2UPA8p3zKC99UBFFbcIR97706Y7gwlKQRj00qDnEZ2b1kPd961PdUHvqKqSn1NH
	jXJtfz+L1HO6bn6osRyF1EcMs+BEed3+Ydmye9s15yxUR3K5eSPHKwuiGk3xj0Lu
	tKA8/emRx+R7dwctDciw8jaxkSR7kzrS48cwGRGzzSQQ9tcR/LwWpsV8Ev4M/DQ7
	8HU1pfDI9c3I0b77uJsk43EJ07e0nci8NM/9ewnCKnu8YZb3Y+by8XUhBhTa5+dj
	vsLxNUECiCQsQ4WJa/rxIaNsnjp6QUm2icQ+GExNm2PIKTv0v1KAGq/q1Uz8MADZ
	V3sjyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533af9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:20:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee409f1880so33713911cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767356440; x=1767961240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=127mHB4mt2dFg8abT6ez96BYyktNn0EP2M/rkydMbnc=;
        b=iMaKcH187oPGYHp4o6dTppbaL2WRCVn4gTDCzBtLUVTbtAIzyYFPkaXxqVoS1ytMRw
         kFb1h2PpJMHkWHZ+ceVedIwCi/d2BBUsX9RiSr12t9wzu1TSYJ8UYcOWOdayLI35yKJj
         n9hBO5pW1adY6ARy3Aol9+Otsq1dBoP7XXhs6qztJz/PlJRa9/KajJWRCfY+4//ilyAz
         /n/lAchXhc4rkJlFqmghpZPlxx2CDdvMYidUFLtFYeNSdeUReFPZAkcnWh/HtVeYHT+Q
         82JB3vZ5mNNjW1IBvmveFU/jgJKjUaLaEYrgqDvY+f6zpg3pG792WAgVtmYyAd4xMw2F
         xulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767356440; x=1767961240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=127mHB4mt2dFg8abT6ez96BYyktNn0EP2M/rkydMbnc=;
        b=HGSHwaPEK55RBj+HXIpjDJoy7x4iAYRdCkt0NzEWXd0/53AvLaq5sz88DIqPbBOoaO
         h3+pPCa2Ezda5PkiG5Wk4UkW/IPTPA+DOlryW0zo7KMA5yhp97fRhSyUmbW6vd/3bNvh
         JRrtXkkOpBgj8BAmhKh8UKL6hzRj+idEknJy1ax3naLlzeFh+tPfUDDH0lWySyz6qmFB
         5X4sIxMSMRbkFFantlE2wvtWOgbyeU0RmEARA50m1lye4teeaH25nn7TtHlK8loXZPMc
         XUIN2miD9+sI4GfRqLPWKWr6XFiymWaz3u9xzKPsVxckP1/hih4TUSmDhAqe8yWdwhmf
         YTMg==
X-Gm-Message-State: AOJu0Yz/FGXoNbhjW7yIlz+ql7t/88hIRW3cvYzzqH2hqbBPVF1tcmML
	WoYV6jF6g3byWN24sCztVyurCkPJAKF060A1nCzKueuD3Nj4kE1ccDpWpa2fpeBDlcHQJKD9atF
	Rku/VzbXvdr/cwf1PXSAF6SgVOGDABbVGkh6ZUwlmcGd8Y0rQuvKFR9r4xgA65Yz1bX+N
X-Gm-Gg: AY/fxX73edkwcIxyv25pwORoPyXt6dsHbp13lgbNON5qPFCwcyKomWucu7al1MPzFrS
	jElSCIXo6bs+nQ2Dc8z4Mv16S3WqsrVcvzXKWR/DG2QjsBv6a6/mCgepfto9B4k1us9ptpz7i1I
	QDw3u9ZganZ5c2Ekpre9yam52VBreg2jmR8h3Kas/9j5+E4358CQWicDymNBNzBRvWzBpVc2hm7
	bbGKBzbekAtDEcReZEvm1QtrfmqJpMgymETI6dwPd47quhQmlyNVxhptJNzzDF1BasVyAcqC1uI
	5swgSh9+WYgdXRx9iYYKrT02B6MgDEe+NUqkb6JNJFyU8RBs8/NUe8QjQqC7aZyiDXrc2gj3LuX
	2mONnuf/Du0Qh4Bk5DWS5g4nTiXs1RmmklUs+Q2UuC+WA04RcMnQ4iIXQflTxXtPXgA==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr486686391cf.4.1767356439846;
        Fri, 02 Jan 2026 04:20:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnkz5iZjMtxBREdt8+wbw1V/jZcZuDWnZGTltBvzfzqlFNSNd6s7j3yuIOrXpl4CLtljEJiw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr486686171cf.4.1767356439451;
        Fri, 02 Jan 2026 04:20:39 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b830b5fe8cfsm3040406166b.59.2026.01.02.04.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 04:20:38 -0800 (PST)
Message-ID: <785daa0f-c9e7-4e6d-8140-dd16afdf2674@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 13:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FO_XIqJBiSaa_k1ouW_AEYbJa3c4y1Oe
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957b818 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4tJ64ChziznmrUq2zEsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FO_XIqJBiSaa_k1ouW_AEYbJa3c4y1Oe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEwOSBTYWx0ZWRfXzwIv6bNZS0P8
 mTBL7heBMaSjS6qPcxlSry1I84UCaOEGNgCc98sEiaq/pWh7OkMdbXMZRKue+SC2fIwanwh26Am
 5nJBD7IPsB3R61gHITocmP9SI58ErjVVUCoE0fEO27OPCAEH1k+xIhLRxr6W7+fVD2hiTTrOhSx
 BC6mzd+Qzjm9Gzh7kWhkn7VMTrIsxeZihTyBtEUyCcEj3S4SZPqWBc4x4xnZkM6yjYUCA9cCm+J
 BVBSDAlpgBui/tpPVa7sD5FmdAA4+gQATLpFizSXmHGMdQefQFiy+5GrjWm8Xb5I61M69o7vrWQ
 R29Bg5sEy9LOcACw4qrkd4eoRyYYEFVVmRiWCi8oI3AH5axoWhUxRSRYbifoN9XpjWVUJm2ZW9n
 eHeZLjFMcVSZlEde1ifX332yj3sSZasXYA2VP3KSdeA45zIL9TSJBqyioa1M9Skj19vkselq4z9
 4mNO2+PHn9jiKVZb/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020109

On 12/30/25 3:10 AM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

0x1121f000 - 0x1121f000 seem to have different/wrong names

Otherwise lgtm

Please try to convince git to output a less messy patch

Konrad

