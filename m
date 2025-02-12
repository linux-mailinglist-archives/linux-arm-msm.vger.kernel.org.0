Return-Path: <linux-arm-msm+bounces-47833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E089A33396
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF002166C21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F6925E454;
	Wed, 12 Feb 2025 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYnMGUNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ABA250BF8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739403725; cv=none; b=Tbd41rZIgCCRfB6mVOPbEwVCgJ6zLrRZLdmaDwNkqwqedcg6sDjI6Lrf2H54olmQfc3rPtTJI6V+ueyr09XdAo4O0XMwxDRQ0Xse8DKa+uSd7eYknYPtO+ginvNpOi9HZr3PLVNJKuINvLwbYAbGwYK4Xln9CkXdwmzsMuumgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739403725; c=relaxed/simple;
	bh=Kho4WTps7E4ZBUOSBpsHZXmjVWIcVvca1MZdlNB5wpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXO+F8Eltq7S214yesnoPWod0JuxA5P49opDUq2g/bioWvrdzwmImWBWRwrsICTdQ/hHsuT/KQ7yqX/C5QvkwNUf2zaLWFKweUAEkM7P/4oHUZTSXrMW7cfMB1cS/V3utHrTf4XIv7G8XknWsicp0h9RZM9m52hmUQns1gvQ1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYnMGUNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CKpoxB024875
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=; b=bYnMGUNlpjFydcu+
	hSacCR2pty43ivLXkV+zJn8PIspcR0a1msqiNfwdkFffTmjqlxnVBOGLefV7DhQH
	dq5WmRCyebm7ZGE0/74t/AeRwZYy7MHQPRwEvqnooV/KW9IG6FRa+3D2OHpoteMg
	evg36haJt9JVFCLQDHHMG8e52stqvWgcVjgSv8y5gWAP8pempl0x5Xs6CqGg4Zf+
	YwZDN4s3zMoD/Pb3+xRn0WmTPub2MFoRS5DqXwb5qSGiB+n6XrysBTH8S4s12PIC
	1vJbt2kcC9c2w00lAOyZNZb6b4cnDlkjW4j8Wp35vslvqrl6Ejq9VZFwd6qKR3fv
	LNvyNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7swv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c07ac9a142so3578985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 15:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403720; x=1740008520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=;
        b=ZRNZ07sJLAEY/MHffXO1MVi/BN+Mvs5sZ3Wgg7JQWuZroEAVZ5RtB9rc1c0gtGr8y9
         6L7X0xsr8gByjwIbWSyBc/cMbW91cnjCVM8p0V7GmS3HThH4LyAY/7FpdhTWDg/8fG4N
         cb1XybH/p8ntnpcs1IKvMLiQePDs3lQaHVVyddVdcwIiGREC7SZfMZp8Y+8MovtTWJ5y
         pcrQtBAn3EkdpmUlMxdo+i/exHpiaomyalfwOR5c+zGPTltk3nkXvC28URDh4a40geFt
         ERT35ZWYSghEhS2zqt5UolZfTAUpfSekp+nVTfuCYXo1bmavw6KEpaP3VbEOiAHLn/rc
         hCFw==
X-Gm-Message-State: AOJu0YwCu74nxNxd4bJz80IgwS+oCiFu2BP9lHFhPN7y32mgr+IE/2hw
	Pse4NHdE3RzrOBguill0/Jq151rP8poPlMSE2Rq7q69RwUZB2CcA73/SuLid1xvIsYPB5sFxHke
	LYusi5jABIrRmP2ufsITMJJpUsLka1YzWdSloy0GaIx9b9mLy3FJQuEhXBr4uwgtn
X-Gm-Gg: ASbGncv//oG37+sxfDNmMsxYj+D9H+eUMm3rOw/TMa2kEIbCPsC411HrwlD/ACztT4a
	eJgy/pVfcP8lHO4wfc4sQ7y28crK/Zpa6UnnQHezi8YBlZFX04CCMNw7AEoX6AWo4lFjAyaKD68
	z+c1mqFnUJM/Qz2FCjK8YQevSB6VeUsbK388nzCi0utOw9GuwcoGRDKxy1QFt22sw7FfkXiKB8X
	3uClGG46vdHnUEEal2D+mkqWxGb0C8D+wPQaRqg3OvPv7+zJkwDOpBKW72ePGqs7hOFB5IVlHHy
	La7YonFJ1fK76zadno6OjfOtDNSjRY3IOyCat8nRmPxK0t+jE3Tbs8LksDM=
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e65d69ecbdmr1695346d6.8.1739403720082;
        Wed, 12 Feb 2025 15:42:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEcBxmtmcHlTzFNoW46Xr2T8lcEbl+S4lmcASGxCetdh2aIQm3gF77JovXY1V0uJjnJAe8w==
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e65d69ecbdmr1695246d6.8.1739403719675;
        Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376769sm13987766b.96.2025.02.12.15.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Message-ID: <9c188b0a-5137-4f8d-b8c7-2eb31c5b8424@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:41:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs8300: Add support for stream 1
 clk for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KnlO0fDaRXFMS8fg0VaJdaRvfbhJva8i
X-Proofpoint-GUID: KnlO0fDaRXFMS8fg0VaJdaRvfbhJva8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=734 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120167

On 12.02.2025 8:12 AM, Yongxing Mou wrote:
> Add 2 streams MST support for qcs8300. Compatile with qcs8300 dp
> controller driver and populate the stream clock for qcs8300 DP0
> controller in MST mode.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Please add all required resources for quad-MST operation

Konrad

