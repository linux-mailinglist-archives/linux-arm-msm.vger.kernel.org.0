Return-Path: <linux-arm-msm+bounces-34812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BC9A2D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 21:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EBD91C20DCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A6521C160;
	Thu, 17 Oct 2024 19:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSU9hVhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7A1E0DC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192391; cv=none; b=iI6fylrxAFE5IV+xpl4klglf7i5OR5bc42Gjq7DpBD1oluRMCKnbOXcjO3LzA8NRY0bnObARDEkPFvAD/wG2QgzPVQlUGxmS0xj00NzsIrdafDLlo52QXFotpYMVRQBTdRMkIlAEzVMKv0CcUF4vVyMqLMRNHPJAlTqQrrPDGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192391; c=relaxed/simple;
	bh=1dd00Qx2EBh8YxOFQdo9vpm8Kon2YqflEBJff8NGjKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCczu3btTWzW0Jkcs1vim4Yc+CI47lcBTKE58S8p3WzeLTRdAOvjOh+0fiun9D3EaCckFW9nvIy7TmYt8Z912ELkxZR187F3CBaQNAOOiGdHJNeDekBmMp1RDpjotzh4ebaZTHH6cJb7GtPmlr8dYFT8dsjClEoRtoFTdOnXtdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSU9hVhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HFmfW1008326
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PhmGa+PsAmdli0oMgsVFWbNWWhmW21epKoK81/HYQ4=; b=mSU9hVhu5Z3Z5SLO
	xEIUvOW7Z2f1/uXHuqppyXKutqR7VOgwT/8eAW7iki9OdMGqAfLZBCSQA2Wdyz7F
	H16QzBvulkn/oqpZKrqEzdU9FSHGu0U6BZn262TGIcvZ7tQmfqVcHwotVDj1NW3A
	zkRo5Zgs6amSfy/KpgUnSAFsGH/xK1R6H/xA+QwOxDFdkehrIfOIlabCQgLDDGHG
	cl1eTKv24KPny8bVrrpReB9dya4b9uDyfd1MWX8kWlzT9WeEKXvn1QHk51pxrFoD
	8MkdRI1YojtzWbbEXKfQz7xe8JdmFdPaXoZR8YiTYz3SK+H1oS6oh/RSc+IE9Yzv
	XCmwlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hsrmcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:13:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf2a4afcfso3808736d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 12:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192384; x=1729797184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PhmGa+PsAmdli0oMgsVFWbNWWhmW21epKoK81/HYQ4=;
        b=GeyPqb3T8gY13B0c35/MfSlJm2TVz6UGcWCMSRAI0iCXKXnBdDKqzzFp67aNCxlTH+
         caXfxdlCGUYJ0KyzpiTOpz7y6ldAN6Vvm0FJVuvyteL7o2dBlGZb66vf+KhjBoqryMgJ
         eX91psFrOho+yj6j9b9biWk/jboYEQSZNsGwz4VwipPk+CqTEOn9NBOschDwpRuANuvF
         SHvhsGr6imagkBgtyIZhyyzVWwN+4wKtppnSH/ElW3EOGVxiq5/GdgXSjnrDLNds+tHH
         wDDNE/OlAnuRaKqAQ7u3e1yy3A9sJJlEA3PBpsn3W7TVKvYTpa+ZJxottMSrHRdjLVmQ
         fSbA==
X-Gm-Message-State: AOJu0YzCXrRcLBvvaDeC7NaINdXZVcKoRTez9PR+nPxmFSw5mspPWGLa
	lB+gErIYFYIFD54OPwoefX9kZ0loY5nfeJcT6TqNFlp2sMQmXQe7zqHkc2U14YuZGlXirrKWxQ0
	b8U5WGII/dYYdBkc5MiFdYg8XESJKvonKQ/LOdDjFU85bWS/KfsA6PHFMfiqPbZP5
X-Received: by 2002:ad4:5763:0:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cc91badc7cmr3546296d6.7.1729192384167;
        Thu, 17 Oct 2024 12:13:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNjMUbDedkbOA2MqvkIgvzqY+U4esV1vzQWFnNlX27uENLErxKMt4L1Y3/0J+lvQuQvFuodw==
X-Received: by 2002:ad4:5763:0:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cc91badc7cmr3546006d6.7.1729192383743;
        Thu, 17 Oct 2024 12:13:03 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c2677esm1097266b.188.2024.10.17.12.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 12:13:03 -0700 (PDT)
Message-ID: <80220d6f-c4d0-483e-95a1-54a705121a3b@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 21:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] clk: qcom: tcsrcc-sm8550: add SAR2130P support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-12-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-12-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KVMjBzQhPpm1YDPoj8IAA3sGrCisRg10
X-Proofpoint-ORIG-GUID: KVMjBzQhPpm1YDPoj8IAA3sGrCisRg10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=775 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170129

On 17.10.2024 6:57 PM, Dmitry Baryshkov wrote:
> The SAR2130P platform has the same TCSR Clock Controller as the SM8550,
> except for the lack of the UFS clocks. Extend the SM8550 TCSRCC driver
> to support SAR2130P.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

