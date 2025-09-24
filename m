Return-Path: <linux-arm-msm+bounces-74571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F385B991E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 11:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1E91892521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 09:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4002D979B;
	Wed, 24 Sep 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jai9rjcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7AE28314A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758705967; cv=none; b=LGiIXv3a9r23TUIKS2bA7JILblFIUgu0DqsvEaNKoFcyeaSbkzFKbuL/wybFcxNHogPV5cmT2zxgpmrskRCP4qGI6K4YZlrrOAwOYw/DtgTkF2si8FCAQE89pmSI1Cemu6PwzNNu9ut4iW9X/l7zTCbv8H7PYtlA+eZUQZ87Nug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758705967; c=relaxed/simple;
	bh=kGACjza4kLFIuoVjadheB4VrqhuF9hGSAnViyIKI53o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0Y1v0bkXXNlVE24nJX50rwATxQw+RRhKm84lZvvt3jXC8qJ5cu3hpqtG51qOTGqIoqx3fPzHPG8IoJnAO4lVzBnFQKc1YJ340DeAhh0xaB3FlKS0LcrenI62mY7cdRX81bGzZiCzlLkm/1hs/42hCX3uKSL0rGW+fMhuwtobTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jai9rjcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iHiT029712
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iVQMdHaKcnbaZ6S3hoE/B2b2HZTKVXu/iQm4DA6Owg=; b=Jai9rjcHmdFpIyPn
	GhFb/ev+IBXZBXDdtGjtVRQErQQOqFxcHrsAiQqchlgk5reYMWNOMQk0bCc9b264
	a05jyel7Ju6AmLesjrIkUcGS01cKPUtpdEppUa2vEQkI3OwaJbrAAyVHahI/h3Ym
	xdgkzuQ5EOITT12S1J1OJ2f55cIpwBehHSy88/TUd+J6GQtAnY5Iig3JAWCL7eUy
	MC9j4CakhgXYUeOdojpdRthM3lHzsfKZBP0uemm+tvmLwDaP6FcwTaLjfxMRFTp0
	Zdawoyf8aDDILJSmnEIJImils6X8kMGu9Cf6nULT22uVKTbRVjqcw78rNR2obYqt
	DWIYIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fkp8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c39b8cb20fso24191891cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 02:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705960; x=1759310760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iVQMdHaKcnbaZ6S3hoE/B2b2HZTKVXu/iQm4DA6Owg=;
        b=oOIFA3Fxm16nlMd8WSlCBLFKAwS7uSdobzsOZmFQ1D43uJIe41K8ZZgBF0gKIsF3cu
         Z2N8rRrmnHnLpwGuvDObreT7ZSUMueUF9QwsusjJHxQM+qswTgAdDgTrPFjizS7xWhIJ
         PG6d5uNomq4Ay3nqUFjEea42ctoFomfGaseqs7eWhghwzAUO+7569M6a0klOQ/srRP9a
         YJVLBedgFOPZlHsJoIHPlm3LFTxTLExJ1cvcT9piroKGCV6YjYkvfywe9PzyL2RpNcct
         YzzlyyVF2SKEOfhrRymvqirNH4z45ZGOL+Bo64OdNkgd5f95/dZACPiqYiaePsXqS+QD
         amAg==
X-Forwarded-Encrypted: i=1; AJvYcCV4mozrkmdIScvdUp/CvYosFIs7gmWLshqOzLcd9pRsXGQDWaTa79F6Tu7/fCw8QuJZesbbHTc5JB688Q/e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VICOaaehU3bPyV8yN4fD67IZaSHfsyzSy3kSGHeM0cicg37h
	s9XOLa1kflRxJua3WW734AEqqlrPu3DTh94r24YpN3EYvj9tLiYS3jeZzGGZGVx3hnZSYR0TEKJ
	FJkhl3/jCbtbUycjl3LK3MefYLxC0c5aDQskHqis0nsPopU8ryykIbX4cf0lFbDzfADOQ
X-Gm-Gg: ASbGncvk9ew+Ya/aem4OdZ7g2r6qilco7AJoyBIXlzONNy19LDZjckXGKt1YBEEOjkZ
	YihdCQKF4I0U/siRAwPk6hemFFRpgRrGwCxwqU16V1g2FTtC6y0bjyiP4BuE/Z4yObuHawabKlT
	XLOtRxJ4qW/C4E8x322r5RrLaLDyil0tK/4uYMYItRJhXCHcigwzx47YIGaLdQG8i8/9vsqrQ9o
	ViDhNrQWzp4iszmjcM+tOwTo5GvQ8XvZWpI52XVEN4xqusLIPRyGo1xOIzKakiB4YRMa4SuNBOj
	yLjYYbhHDxdg3fI2wfcifk2DbKmoy9DXHwoh0STefMdK5XbvDU2OyvpmZgUiMKLyFFsb9NXQIGO
	b2IKAC+rhJ9gH+DS7QrvCPw==
X-Received: by 2002:ac8:7dd0:0:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4d36feee39fmr44886731cf.8.1758705959687;
        Wed, 24 Sep 2025 02:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9jltynsPceOPKBs258SdQflImCClEP7oCDtLUeJd2HIiXbb4/Fq4DcND9VXplQIu2TahAkQ==
X-Received: by 2002:ac8:7dd0:0:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4d36feee39fmr44886531cf.8.1758705959191;
        Wed, 24 Sep 2025 02:25:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm786252166b.111.2025.09.24.02.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:25:58 -0700 (PDT)
Message-ID: <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xwypqfQSffSvuV0VpTCul5mAPKiwOrGq
X-Proofpoint-GUID: xwypqfQSffSvuV0VpTCul5mAPKiwOrGq
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d3b929 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yrTspkcuTgY8Q9LkLrEA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+rjnm+AgEd8S
 V+rzREvtn+2uQQE6vN7xfKsBcyfy2Cw0WtM2JIfqgLTkeYZrxnkJ9X+ekxa+wcWPJOk4DbzjqCo
 oouxjGsijMGR3L5wnsqURnnc/lvnssChCsCFgrHa83ZAoKm147lR5yKvcBRU2sPfU4bGYj1Nm7R
 Lg7zewZUccleTG7IFEedSLsa3ANm65UShsY+uukxG0qDg6MTzF4yFBt59WpBCXMa1Gk5W7XnjUy
 OSpeuscPJh1QyNCEO29FOunSI+sYHItG+WmVvcu4XYUrE9KtPY9F2+XHhwyDhmt5UMLOLhu9YjR
 fY1r9V/5R8oS5oF1WIQ34Xiij9Tza9+HCiHrWcX4mYrZwe9PjKtQSAZqGWEwEAAk7vQV6fWF1Qy
 LbUJNoe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/24/25 9:17 AM, Taniya Das wrote:
> The pipe clocks for PCIE and USB are externally sourced and the should
> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> to disable polling for these clocks.

"This helps avoid xxx is stuck at 'off' warnings, which are benign,
since all consumers of the PHYs must initialize a given instance before
performing any operations"

> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

The patch subject must say 'gcc-glymur: instead of just 'gcc:'

Otherwise LGTM, I've been carrying a similar fix on x1e, as it
(obviously) turned out to be necessary for the usecase

With that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

