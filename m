Return-Path: <linux-arm-msm+bounces-66979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E74BB14BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 263D67AD28F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D872E36E4;
	Tue, 29 Jul 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYMp/aMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D231288C8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783308; cv=none; b=BJ48rU4089ptRlbbyawXZzqpcK91zPwo4d/LWhDJmeFzmAh1rWvWDGK0J4aESOplO5jU8ujYYzWCs4ZFFGFaXySZ9N/YZUhcfYegSJbVkq7j7DFNoluMj9EzQbTvxwqjd+5WkzpOtdyJ+QHfJVzH4m+BMcwZnUOH/wQbeGCfWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783308; c=relaxed/simple;
	bh=b5/AbWh4VGYvJYGMYEoAI1yd9P67N1DcHHSd8SASrxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adLqTcugxGL360so3Mj3RYdhvhfaBPjSTfUgYHIjpEVrcaM8Ho9izgyftch7mGBTm/HTxBxSmuVX4K6Y2RgjPj9qsciW+orlxF327HC7DLFQBEHsASl6iaWtS6Dh2e5ecXr69ndDXJzK7PzuyErPyt1ZQ+TF3lZf5cAtaspw5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYMp/aMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9Ajdr017815
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2L4H4k8qNpD35pJiHRB3w3KqGWKmWWZOUOqEsCI49U=; b=EYMp/aMg0TzTTDne
	dpd18urBhEYRJPpeB2NpnSWxOT9ZqYwOolDOaioOPBqUqXpDK8gkO8YH+UUoC9Oc
	boxbDvutROmAIo5KZwst8IopwV4c/zDw32G7flXz0svyjA58ujXdnuujZGVQ01FJ
	o+VU44pTGP+i8LbNJUvFrda1xIicD11+SgcJUA5VzVZc/A8uVfmbDYlq7p8wAN7A
	MdMBiqpCvREE6UevLbG0yKmIk/NWyIcIivMuaW0ZEepd+klZJXuOU1OYhn8BgKk+
	5QYpSqeowCDUO03zAuCIc6kx8vodxC36CkHwTY6wyNLn8yUMnc0bbjgnO2YkWFdl
	yFFysQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1afnfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:01:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab5e4f4600so13977101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783305; x=1754388105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2L4H4k8qNpD35pJiHRB3w3KqGWKmWWZOUOqEsCI49U=;
        b=TGw+BISExdel1HCRTyUcpqo2JToEVavyCk8iGWMh9fvrMRpl2f7ix9J+fzI/PFyq8U
         AS+oPaBK3o8YWTKvYd9vmGSmoQJnG/kHX9i/1982sjd3CE5h5Gx2p8LRNA3mskHL2hrm
         fFvw2y4GSA6VyzQEtVCNOBecK8wSX5RODZLYYpMVbxVR4RidGKbBIX/qsuy/DteTRVJW
         OoCjMAVAdmzdvin8iGbBKEoSdda4wCgx8f+sqdtgfpIk2H7vvF/pXthpErih5aIeZTsO
         jx/H4eDMu1dUetsbK4yLkdTQAUrvX6L037P8qYJqC7aB4Y7X71qzVa0bo6R08n67iE+F
         Eytw==
X-Gm-Message-State: AOJu0Yw09nezYc5DJz6Lu2WSrDI95IgSI4ldF5ri6iKO8wZAVldAM0Az
	zyEdIzQM/cdMysBX7NR97kiw3xr8knBAMDb9e+tNWtzv58a4r707ItlRQnAgurTvuEdWtt48f8+
	mUttoikBvVqxCW5iditlXwFUpEgrrSOr9O+h2yH/qH5F0cj9ksoId/4nAWSutX6hBUalj
X-Gm-Gg: ASbGncvuEga9zyax4+G9kLt29ujdAAEJ5FrFQccZXuGVru4Ud5YqCZ6jTWwnRFPjXrz
	cvYSl+VhEx7AKJS7UuqA4mnAtNAhCN6aNJua7SANrXnCifqFGB/41WnmeWWnLLf3DwkHCV8LVbG
	dxRtrxKcuaGcCMqIx0GjPfgu8FKSMCDLD3oD5OakSBpvZz0PaKIdvV2WNRh+h+ptA6Xi0JNJ/5f
	x5gLHslkGLnCi4eH0crv0Hz5Wx7lU/DvNj+LPEW0I7yRsFN5vBRjreKSAvFViGflyDYZAyQU9X+
	HoaPTVc0F60dkNiPfVATQslMK8yZnnjk2O4/JAquZATvfEVHzhw+U/xUBqTrw912yu6T33W3v2j
	Kl8163X0AfvZ4JqzN0w==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr914838085a.2.1753783305114;
        Tue, 29 Jul 2025 03:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiy7mRTlkTSBHHGFfxJGJ7ZmooAMdpG8CLF6Bxy/LBKUaWbfUoweJXi6ZBpw/4Kvy3dj7t0w==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr914834885a.2.1753783304592;
        Tue, 29 Jul 2025 03:01:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61500ad0451sm4462352a12.33.2025.07.29.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:01:43 -0700 (PDT)
Message-ID: <23f37207-fed9-4584-b92f-7142558473b3@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 12:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Taniya Das <taniya.das@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SAhLOJpUXnUoUaTQ0zJO3wuw7z-V94ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NyBTYWx0ZWRfX8XGNSdmKZpAQ
 f58Y2Z1ETNCJIT/m1tucrl3Pg1JaLxaWQQxshpxlQkHiPA8SE/qsYuO5muafmMZxwAJOIhWnuS5
 XmtFI4ZJ1Ux9QN0X1bbPmzJktyV6q11Z4mB4/3cLL9NoSvSH7eMWinOUkpoDw/Hf6sPATnsl1Hj
 k0uiQ2/oWwJWUmoyCHfKrTaYEUHVE8QrmrQh3TJQuGeQghZUUXdqAg1zIa/C+qdJiM8NoQohkNb
 g1+vq3NFx/q9NGivHwSMBRiK2jsX3TXYXxl215jqTy0vHviUEzF6eAh5Q1B0FGYo3rMq67BEgIo
 Owx7EM2BHr2jxefWPGC/CNA+iF5qNsRj2LJTFGZS+Uq1R0/1+W2sldOIaoxrjYYR9XBt7NcuTvU
 mKqW4XByZsOhhD36tMCLMOxWqpQpaJbzsjlXNRzlBva/2uD/JFj3sfQxwHtyUgcZrjO+dBtd
X-Proofpoint-GUID: SAhLOJpUXnUoUaTQ0zJO3wuw7z-V94ni
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=68889c09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sQv67BsiESNKl3dOTAkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=952 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290077

On 7/29/25 7:42 AM, Taniya Das wrote:
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

I don't see anything obviously wrong

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

