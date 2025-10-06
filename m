Return-Path: <linux-arm-msm+bounces-76021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA897BBD70E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396393AD1B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E902676DE;
	Mon,  6 Oct 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNMVWT1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C27267B89
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742876; cv=none; b=CwnovdZMk70ZLMaY3cqYeacpkC+lTYNd3B9UUWrKvHND+JxZHmqn4lgtOEmcAO1OFVz7YkmcYLp1lRHNqfpyKd+MufRzOHmi4MTpnUU/TgZGTuxDmbxchwyLP5TivQ9pquQD4D2kLGsXR/bZtiahjhJanRro0WP/EwSYR8wdPe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742876; c=relaxed/simple;
	bh=QU58PgIDoxyXxvtrv9nIkUTP1aP3Ji5RwiYuSuwuyDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtUAsC9BoF2/RC9LaehdHtIfxxIQiC/qP5h1ReYUe+5E4PlsEbquvIHN2dVGCFT4g5/G1jpMENkmvbHHKsE63egnm5Y4KnhqAuq5XlDrqYnop76QmpIRJKWNgTFHMXpsO6N9UMe623ZoKjzKLSWhZ2SUiJ92XXZowQtcvWfRZq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNMVWT1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961V519012073
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pcwlnjS2vmra4LDe4EMuIdtHHOf5Cpr9bJvDe22TZQ=; b=BNMVWT1xSfVjrHr6
	prZKemFBfBPrpPFDPdzuWXdSw/eyvjjkfTuK4EC8BfbYyenDb0KTt4araD0L1j9t
	pTlpG5+WoZtokGsVfQ5tw2Y/mOKz59A3ZRjCfQdUI6jaXjJdcvYyoIygeobayeiO
	9181KHoE0VCsa0eljEi/nfPmUr4T5gmOAjV4p7IDEwwQVcCRyKGeQFJlOzdsajkg
	8az/qTMih45U1obx60ypgShyItRAqI3HITH/Ux8heegdywKkizP4dnk0yQa8hNOL
	ZuVeet7oenEJQJPfT3bT5E19z0cSKhefPipEG9jRw91eBAw5CBRLNCNHseODcqzv
	92N6MA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3pjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 09:27:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e231785cc3so20410111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742873; x=1760347673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pcwlnjS2vmra4LDe4EMuIdtHHOf5Cpr9bJvDe22TZQ=;
        b=HjSmud6ftY+YPJDrugCHnC5gwfKU+Q8IqL7KozXjzSNGx2najxTrnDXHFW4KWjFYXt
         K5BiU6cvHb3xnxKyFqlUHAffKwy3p66ZNxDiGiyP5sAZ0YMr7Wlo5qfAe13Gfx2yodKn
         3mOSK/cVFu01hmULrhjvpxw7FPGJkMPiB8UW85Olgy/zL7Ef1rPLpU2DaOKwGvg0wEXD
         fFjrV0P+BFVeiG1JMKjmTcB3gQZp2pkThuf5ygULo1zlqIKrf2au9iPfZUTIWkZduaPe
         RFWPIBixEYyTe86n9goAPDRioOpg0UVF0GGrLFEswPtIWrOUPP2g8qI4DvjcvxthZtgO
         n1KQ==
X-Gm-Message-State: AOJu0Yxc3+T7Mxnc9Kw0edp2O462FxZX67kXBp+f9Xf0q367xZb1v7jU
	EjA+YFaErcLkqQM8qwLfpDiqi/iYHGabvFU7o8Eprlmo4PQD9KaExpNVkLcH/WLB00Npeiogxgx
	m/4OGdlJB1OcnaXN3vLr9OhF/V/ihwAljfnFiHfUwytco7kJVwLykJ/3JSkl880uKVVLm1NBy/f
	Af
X-Gm-Gg: ASbGncssbe966jCQTod811WU7d8mritq3cBvEiQZTfsAqreYjqU+vsgC9o+0G3uucl9
	tYhDBhavbbJgl9i9395mF+5XwYN90SvTYVQMe8TC76ASJHio+8sf1hbQfc/X7cA1O1HcQYL10rj
	0bDlJtzSgIkHhNbbdZfPFdRyf022GLAX/Gwfi249JJxivOWYogGvmH2h+qKD0jHRfiGtidHWawv
	5eS2vyLcxk+Zs+FCrUw5kS2w/6qkQBXVNXiK6pA0wJ4tfTfiC667Ce61b5TNS/2ywMKTY1aKhNn
	wFT1QIbUHHueNU243uXDkrXWRW0JJXWs58QSEfyIzMmelZM9ESiFk2vHaO2UT9YpPxzHf81EmDg
	YcKCD9FSlTe7S462/23WONaC6j8k=
X-Received: by 2002:ac8:5f91:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e576955b55mr107433271cf.0.1759742872945;
        Mon, 06 Oct 2025 02:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk+OyISCU/gYVLyFTdyZBlaX8VxXHWghQ/t1CCKjFjUKk15AZPAUHnnfYB9omxMiCPUC3/Ww==
X-Received: by 2002:ac8:5f91:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e576955b55mr107433051cf.0.1759742872419;
        Mon, 06 Oct 2025 02:27:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4f1d1sm1089257366b.71.2025.10.06.02.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:27:51 -0700 (PDT)
Message-ID: <4a442f02-405d-4a88-bca9-92233e602653@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: add interconnect paths to
 USB2 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana
 <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
 <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX9qbl2YcmK6dc
 GZ/AgNm3DlgJ62sm3g65qjbqjjbjBinydAVA7/7TJXHQw8IZspcJ8RW5Nkoo12ZV+CDTACUksQw
 tKLUhnfiLuY10gnSmXJMoV2XpA0RMCE15q3Tbvsx+bXhufcAhUQ4Zq2vaIyyskBcdF7P7F0yGSz
 kO1woZbAljQ3sluY4vvvFEFWCbdNXVakIJ9KMGph1m8IVBaNO0phIiEW3hD+BL86O3V7/znAic3
 4TdIky4EJ7dJYvXJH/i9842EGQIIKtpjDOU1UWjII61HB0RtChxJSxU4nS3+YG/5FrQXsSOzawj
 nzmccqh00sLMgkMF15q1ErMiN8A71HIbsC4Nvz+rxbsi2jl///l/E8KXUgcNYRPTSyB57bUkU5D
 0IWxQdDnl2rxNeb7hw7VopjeJoke6w==
X-Proofpoint-GUID: DKFzc2ZZJUFB30-5IaeuTFYnlag1XrMu
X-Proofpoint-ORIG-GUID: DKFzc2ZZJUFB30-5IaeuTFYnlag1XrMu
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e38b9a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=81On53fQ4K8t90Y-VgIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/2/25 10:53 AM, Dmitry Baryshkov wrote:
> Add the missing interconnects to the USB2 host. The Fixes tag points to
> the commit which broke probing of the USB host on that platform.
> 
> Fixes: 130733a10079 ("interconnect: qcom: msm8996: Promote to core_initcall")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> ---
> Note: without the previous patch applying this one can result in the
> kernel stuck at booting because of the EPROBE_DEFER loop. I suggest
> applying them through the same tree in order to make sure that the tree
> is not broken (or using an immutable tag for the icc commit).
> ---

with that ^

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

