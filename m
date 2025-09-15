Return-Path: <linux-arm-msm+bounces-73593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE836B57DB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D251AA2C5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A3C31B130;
	Mon, 15 Sep 2025 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOeYD6WY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD930BF78
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943785; cv=none; b=OSSEFXR3RCqkYDLRbwvPXSJtzXQnU8SW+UqMItWmC0+vkmBWnc/wiCOv6W9lAbN3YozsKkQudoBuAoQU8myrOvqN+3d8d9dCLI48QIgUPOAwJpkfz4YL2dvKjZ8yrqQgTeqVkxcKar3/44kjtJIgScipsSHNGmkBCVqJISa+b7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943785; c=relaxed/simple;
	bh=v+GoUr80T+Uq7qzt0nWDvFetOFhw/gwsgJSHNNUYMnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I33cmawLmDQdM0VROaloP54RiofXnQcGBlDmJLClbgYtnBQ3A8bSt/0FJ5KSBHLzMJx8a402K1lG5CskU1yDGIcc2oLGRr9xyq1C3kqa2aWSjQIpbYJuPH/LkuN4j1hHh5AkakIKNbQtEHFFsRfjUcYjr7+/n+CA4G7W7oRnkP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOeYD6WY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8Fgh0014076
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lD6LjevKuZSuVw1MwwNhO02UtoMPI94ONWJFlaUQpwA=; b=oOeYD6WYNtuIxRyn
	LU7Oy1yTx8wpxZkWRPLzdI8rNvfSahfXDaO3I67aEkOto4uqNGeE7aNXLWSCFK6j
	7C9jJrsnwJfQzPQ6WaWaQKT+Lnhbvs5oZHGoK2EB7SAdiCEi3kksO+qhEP5D4R+p
	GP7Q5kZutYzAxqbYWUl2soD3QTs/fD808BS74bnXY4Idtk0cJkFGt7koer2NzixD
	vd1S3maOYf4ks62t39FZHkESOjeshjCPk2ldrYEMT+0vXPrq+OfIusKF1UZpMtqK
	Tr9wk3I6sHGqTU62j5JyX4xE+8KlFb9FKvZpJJlRyp+I++gYT3V2VvoTPSOimEbi
	PlkLNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr5c65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:43:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad884ac8so866691cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757943782; x=1758548582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD6LjevKuZSuVw1MwwNhO02UtoMPI94ONWJFlaUQpwA=;
        b=sxw9OPL456AIk4lKGr3k60oHQ9fCsg+uUUFD6FPQJN5SSvhkzwld0omkjUdRbk7zKC
         zhe2zXJxYmFpv1xCf1qe19eLlP4r0BfT3m09ro+5FiKBTlWlB7gDGrbqxSY96FIRu8lD
         6skktEsug6vc7fBK+4BnB+sqle39/NyncTjlcwYoJXkypBqOCkXc3+RfrjLtDTawcIFW
         Dr1kqF33ljw5Zqdmw7fl6HUGhhP+I1dOQCng6Xe5NdSGP3WuXIKBRpM6IhV9i83HboX5
         VxMy9mDEJcIljUVcn0K6qnlWiJ+YYllpwFONLkv9fvzkx6x0duXSRVJ+K/Qo536ivjKv
         q7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6R/Yx6p4TeVojVS8wwVgndBvFCjj+Ma+Gu8bXpmvq8+ugSLgjkuiqYRTvQPvP7pPOQLZ91IXAZxHcZjJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIsZNpyyhss6F8p27PuoCdVGgE11jPWQ30RpyRcLa7yfeuEao
	9bBBxYf+WXWjEBiDf9DkxA9KBqXm5EMO7v8iqjP+yh5SqzXd59BKOoUksAfS7rIUBfihlbYmPJK
	y/Q9+p9/NILdrIaofXVtcXe79witqtRAZjLpXBGFhGBMf3z+pL1CYAjoKfdo5qce2ySS5
X-Gm-Gg: ASbGncvct0KBhzuYoTqN9Q/lC7YOCiwQ+2CrNr5EILxrI5yxoHnSDqzMRWPTGdhWU3P
	IjprimDHYe2hEAe6bKmP5Zs+57siV8VXHIpMhC4hMFAmRlI/K6x5Bj9+7oL0VskUea5VBQ2eBVG
	xrEG6Jul5J+HXGAbAB878ZMm0dnEzTCvilx5QlFXS0KxkTSWfWWHUJwcMdSc6TuMf9e44V2MaNJ
	DbemX4puUW1d2aq4Zh59VlB5zG5NnUYOJta0+9D/5fqgxa0mYf5UCYG+AU0aZD34Cx34pORl46a
	4vSnAiwR34zyfJ+5CuzpGl4BZc+HDISXxP0RTTgc9XRvqXFllQE+gZDf7m7Fxg3wHrF9d4i00Vx
	/i2uW+wWl9djw0uHxKYnKgw==
X-Received: by 2002:a05:622a:94:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b77d04cad4mr108187901cf.2.1757943782451;
        Mon, 15 Sep 2025 06:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP3kdo769sVXIACSYekBoAYJrLURvAqBx9QIzbVx++xX3t2rsgq3d8IWcWVTyOaowCkgO/Ow==
X-Received: by 2002:a05:622a:94:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b77d04cad4mr108187601cf.2.1757943781920;
        Mon, 15 Sep 2025 06:43:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f35b41d2esm2595935a12.6.2025.09.15.06.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:43:01 -0700 (PDT)
Message-ID: <b8d9abc9-47e7-4398-b840-aff1bed96025@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 15:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916: Add SDCC resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-3-a5c705df0c45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250915-msm8916-resets-v1-3-a5c705df0c45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8-rEWTmELRiZ0_eeGhX1-IzuRagVx9Hb
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c817e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=63aoMBMVQsRI4Mpv6tMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX8NbmSt96Nrmh
 LCpvcV1LX0TRELlduv0RAiFOqw9VcTUi9REOSK7EKt6RSPJGdrEzcLz/TnL1iiwpxvJhH1L41GX
 It6BiCHvhUX94Dp1J7BdsxdMmXmitV6Ugr4fxy5xOcYxbeVk+UzddKTswr40gTFe8/rNRMfy4oI
 TC2rH63wN7cU7s2omTnWXwkLGutSkUNPc+CWM90gRJ34MCQUT7IheLcLruw8bR6oGfIUlnxV8zA
 H0eIzTePCHmwgFzrc6EnNlxpC6wLLhjyN5uSYmaLYh/ROwA9SBx76yix/GtSnxwEb6qzCVjr7Aa
 IIQonG2H2YcKxHK/3YZTmnPxjEgrmytAxgNb4bBwifTvo2tVahS5Dj6Q5caXy++eRbxqmWpZad5
 XAi/pKKg
X-Proofpoint-GUID: 8-rEWTmELRiZ0_eeGhX1-IzuRagVx9Hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On 9/15/25 3:28 PM, Stephan Gerhold wrote:
> Add the missing resets for the two SDCC controllers to allow fully
> resetting previous hardware state from the bootloader.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

