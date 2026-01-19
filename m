Return-Path: <linux-arm-msm+bounces-89707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CED3AF76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1B430778AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4D118DB0D;
	Mon, 19 Jan 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs2wIgAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPdLtoyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABF33090DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837531; cv=none; b=RThuyH+HhGEZpBLGxblXnMrC8v0Yewim6b4bIxiPlNTklr4nozb6pxWNj/hKH+Q6bSDjGF4LvgelKhutvPdxQA4s+IEZ/Gsn6Bcn62XDflx/BquTTi/rAJo4AjfyuuYX3LjPXyI1hDuqHJ9zEbOkjHx7EvMbbMEHpLxYu8OmqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837531; c=relaxed/simple;
	bh=ueatqlSRaZNQtdkbSIcVnGvg4lTbklxPzJQpdEFKQ7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBVvC475PJBUVwb6Pqi6KbP7C0U3ew6tIfnbTOaG/h5Bz28RaEXsMG0APbmRiOQ7koFwITkxS186n4O1mLKW140cKrSfRNvtJdKP68ERpe0/H4yw5H9Rkb/velkysBmj9cBFZ9m59vA15XMlvGUE/gKSUaMfyJrkvS2/caPcpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs2wIgAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPdLtoyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoZVk2305926
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OdDan9HGVtfj4FJo5UKWFffsTLKNtaQDs0FP5LiRLhs=; b=Gs2wIgAcZmWxyTDd
	KeYVdDB8Gxa8ozC+wZyQ8fw97Su9GC5M6k0uqbUT6nK/uAAkATM7a7RHJ16ou/LI
	C+8/C0ae7so73IFo+TUeCf3s9WshDkc+fMiOchKyJOwP/Aoi81xOni7EvYNaWCMa
	2PuiSEWzDDvxgssAFrwVSuG9iMgP+N4ioVSGladcUPBMNAKLNiKtQ4C138Xm0AjN
	MNchec/spjYXwWUWNQrp+p62tgOTYmfChxd12y1inYXsjzuYwJSYh0mT5O0lzoAs
	97RvL5C7FB2ui6XM301aTlKKENW1TFEbBGlb1m1OrL/hfS+ECcxCXP8KVVLUDQFS
	UQvRFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8567-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c231297839so99784785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768837528; x=1769442328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdDan9HGVtfj4FJo5UKWFffsTLKNtaQDs0FP5LiRLhs=;
        b=gPdLtoyFwg0rLaxyW6yx8umaY/9gMSbNpXPAyGC/clMVGfq8YqQEz+DlpTmOUkLckn
         tUWiGMMxPpOymYxzxQ3LZnwxEcjgpzzuDDkn2X0LiphCa7F/hImJ7clHuTpybiwLmi2U
         fRFwGWilX8xdQlrj0u017lIBsrvXvMgHaIT1i6GbP9AsBqJgXekotE0ZxGF4SBzbTCPT
         w4fDdBd2NW/wJja4AEsfsn/jXlscaHREmcXFOtOCNnKn/MMttJAbdx5rekBJge9X+YkT
         bbvYg8fXNSoRKWYjJl5AbaEQjo/ohd7YUtLRzvRegIrBJL63gg+MwfeN5ilGqIrSMZs6
         Ce8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837528; x=1769442328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdDan9HGVtfj4FJo5UKWFffsTLKNtaQDs0FP5LiRLhs=;
        b=SPh4TtFnSM0z8jJu8DEt2+67G0tgUdKWECM/kKTPEDYU2Tm9481lyw5IwoKGmJtYQp
         +2bA6rPm6puCXe7TAHfgGi136pXg9ibW8BJFcW96zKptMf9+lsvb6ZT2JSEI0X0LbjJ5
         rHFA0FTYUYtfQe5AKe5CcVBUbQwA4Gj4zkSFBz2FcMWMPDZvC927dt2YcK02yVslxnwJ
         OhYI/rNFKqRNf/FL8gDU1SpKMx6sTym9ekbfC7sHeW9xKzLfHszJPGFIwOssW7UQ+zyv
         CaRLqF6sclo649MLd4yc/di0ov66u9owQKItoarFOfLsgC/Cf8ewHAImr/Rzf0zoOxtl
         d+LQ==
X-Gm-Message-State: AOJu0Yys778gW7fB7QOBWGlHEidvnhhP02Bcfdrp6N5Nht83MwRqX/mA
	tBfh2mrSVsqjPaNQTni+e+bbJ7edg2dwfIvGKwdtCgRwoJy7DKALhhlADXymg2e+oGdhBo62V8M
	2gXN4yaJBtlD0ppwd7k0oSq+50qEV93F8aT/yidfcr07oqDhQnCIyPi/MO1gIXDouAVio
X-Gm-Gg: AY/fxX7n5wdx/gQ2q/lgxbVsM/Wgv7l7gl+7oCyZoElhsN664+1PN5XEdi4Q07YNYwA
	lt7dmTGEVyPnTzb8jOX7x3s6PQkLoxEbF1Xk0EBlPKpuwB0wqNDLqxeZRYJS9ezmXMv4suOxO0v
	OipU1fhv/SbOFvZkMofajJwV4KV5QWj6rv61aLtpI+fiV3NIUXxGyou7sVMEM1ut1u6DMq3heOv
	QdEFOGJxnLbFBt1Yp087nXCjCfPOC7EYnjrk8jNrwtm57JTFrsVngGCtQbyt1BFOKK98zzyFek/
	P5z50PZiQ7DTxEGwNxfpQ/YX7+KICvru5c4J1vWcuClMwOg8jSPKGX2aQIqX5MWDv2m4McxeKco
	tfYG9nO2J9djaZkW6jPW33DCgFDQVV6ixbyNkn11NU5YZ7+jqbzQPDTxB7KUoV+HfJko=
X-Received: by 2002:a05:620a:7017:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c6a67c651amr1276687385a.10.1768837527863;
        Mon, 19 Jan 2026 07:45:27 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c6a67c651amr1276684185a.10.1768837527212;
        Mon, 19 Jan 2026 07:45:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbefdsm1110425566b.55.2026.01.19.07.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:45:26 -0800 (PST)
Message-ID: <89f59f3c-8cdb-4190-acdd-d09136c7b67f@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:45:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up
 button
To: nathbappai@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
 <20260119-xiaomi-ginkgo-features-v1-1-3c8fae984bda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-1-3c8fae984bda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e5198 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=0z5cGoq-UR3Mgirp60AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nwuJ_Gp3hy7wkLlDPPrBPiVoNXERkhdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzMSBTYWx0ZWRfX/NjeNLMt/TWv
 m/NeXUO7wLORpBxrMJvR+KYS2VSCWaHBUMtrXiJQKAIClj5bCDyNXLGqWvMSqPmHyKYhusTop9z
 Wfxs4qLywjy6kK/bukiuvRJN04CuvfwBKnCJ2WLl8wlI+5gnVSgHyAl6QYVUzNRkuXUrjwhXZNF
 wF7ZeLw+gyCVDK1dmBQM7LDhUaHhn+LDYuRJw1CPNPZ4V1gSSavt7GKg7OedtRjxbYaal0Tt24w
 SGqRFsNkfztGqHIRbNWUlV5LeXPeJi0Sy8IalJYcv7D69qxelm2/YSnDE8kR7I4EHAf5/A3cOiH
 uBKVerixmFiDJ0FTULZ4TWjr16A+nPIHOAceIz8uks/Ynymw5raVbzPBHDDjTt2VALZHHOm7dV9
 11ZMzKkr5bVioLACy4vX451xnDz8bPdVw11LeRQMijZAmgMfPeEaIMQWKhRqu12UlpBDje2hIaY
 BugI9rndgzxIZb0u1Gg==
X-Proofpoint-GUID: nwuJ_Gp3hy7wkLlDPPrBPiVoNXERkhdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190131

On 1/19/26 4:13 PM, Biswapriyo Nath via B4 Relay wrote:
> From: Biswapriyo Nath <nathbappai@gmail.com>
> 
> gpio6 in pm6125 is used for EMMC and UFS thermal monitoring. It is
> changed to the correct gpio for volume up button.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> 

For future submissions, please remove the newline you kept before fixes
and s-o-b, so that the "tags section" is contiguous

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


