Return-Path: <linux-arm-msm+bounces-66590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF94B10D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD011C23308
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31232E426B;
	Thu, 24 Jul 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6NU8bc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A52E11B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367140; cv=none; b=KkNieedKPWluGuLgTHf3xISnPTJ7EMUq+fcc5jv5MSF0emAAdXckLa01yWOPsiSXW5TZIcin6+cKOKNQRkG4tjRMbF/7PXkdfrq9WCRwKzhwF6UvnjN81urvuKTHoKYbnIpryW0g4Cc2bNtX5yYU9qoz+xsexQt1sOiV8lMa4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367140; c=relaxed/simple;
	bh=9TwUxYBs7bG8dOsoIWLmLiq180yfoOqGlaYJu6O6QU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9xi8wiIilycA7vxIt9Q7ba5p6sI19uYrpws0HFKyeYPy+9Fjy/jSUL0ocIBq/P0/7vlYDyf384BvVXHGdpPjXzcxkWEOYDuKtKtSP7UieaFBXiRVvt14mJYaAzsHsClYW1Fq/ac1DSaNfiJ5fKu94JPVlgi1rJNWChjKjEc7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6NU8bc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9d9wA022148
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=; b=d6NU8bc42r2sWaK2
	kA/tOXeNoiGkbiv9nIYRNRRDyeCSSFBc35bKBjfrs0Q/qUL/uf4WW6xdypnO6lY8
	0s0s569UZMo+xbhw5Gz8M3UyJ35k1wWjiHI/fHgp3HFybJF7XYR4lgcJjpissq11
	5f5ITkyhPMB1QNPRhIgZczHxpidbWqoYFP+Loj8TXK7aPiNTwKwnfxUoaREDiG/n
	MYnytMqXPKqq+IbXGjO6sg5XdFiRNnBYSod3cS2g8mmt66hKMGjUdLYViF39te9m
	bcvrauP+kZQg3bQRPk4heQR0e6nJpFBpQwLE2ZjfeyY4PHtxdTBuJ76KzS02KH1y
	arNWaA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044drt31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:25:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e8161d03easo218810137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367136; x=1753971936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=;
        b=Nb3tX206OV4wPaOGEUnq0Xir9JXk9ROoGJNNqnD153Jk+f3xfMQ9k3ov0KNseTqiOf
         eZLXiHcv608fAOdl1z7ClFCwJ6c38SDaDGkQOEjePAMh15JcLccA3WCDG1Eppy2sBzSg
         gJ53k3YcRc5hr6RjadM2nUaAYYmUH80LH4kFPnmGGxvHrP0YbJB/wV5EmMVkihVyhSaE
         KaFCuc1Krytu6dq6305gZRJ4JKHdhQF6P9ieIVr2XKFeHTfBKOFVdzPEbuJl7HEYymuC
         NjpgmWn0a1hXL3F4sUGKv9DRY63XRBygt0JmWARKxQ/RpIhYDl7eKFR0naWQv1VD1VW3
         T9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvguoFLanJwYoS4Bqgs59Lr5VJ5RXRNab6IYi9NcKCFdfCIWgmvfAEKZWnN6M9JVBxFvLpL69fEbgCBciY@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4xR/M1juEkiGSEgvnrH1odNRUK/Toy9/k7Cm6AMZLLeLbZGF
	SYUlVp3uyiIMjPuVroTrBUUmwchAoOnCQFq554HgKMEBYVcOmnjVjuLU8LEm2TWxl25y2PQ6+zf
	gcijNsXoaTuzYhBLXXYV5Aq8jsqQuMFPkAS/Hj0bOSnWusdMteO9T1p/Ib/m/rYsy5TaN
X-Gm-Gg: ASbGnctKEy2yDk2EqnuWyn6/zhe35Y9rPPOKO08G7M8lq+1PO7WD/cjoEEzia3eRgRU
	NpldT+T5CgFCN3+kerLweztE2o5p2/MphHugYOv78eR7oziWlefbVJOp/mYOREdsiKZsKLLTV7E
	jIfF+/Itpd5A+hj+JlcGwF7wAMOCkp3BQ6BCnOdxNZKAUx3OrXAcerE0TdpfV8VhWk7TdDUSOcf
	gjUkdIYoF6EjG31TQAs3DvGuzj3R7Idu53r5a8YA7xT0G6if4oFaDKSdpNxNAroRUbgcJrWJlr3
	WSgy7oD+VJsEqKKNlajXEMz3e/miUNTTo7+RkD4rDefuRfQKI7eQNnDgMf26W9ZU/oY=
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295854137.17.1753367135902;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM+il14E2osq/m06SZGdVqsUY0imeh5XZ9qO0BRDLCTsWVEfMc4K/24znXseOfaB3Lj87ixQ==
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295805137.17.1753367135334;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fcb8aa6sm2378331f8f.67.2025.07.24.07.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:25:34 -0700 (PDT)
Message-ID: <e2d7d66e-bebd-48da-b61c-52fe2b74232b@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:25:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
 <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68824260 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=A88rw-UrIt9Wtq4Cu4sA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9FICA4YwtUPJZzruVDh1dqTk0JkJSOor
X-Proofpoint-ORIG-GUID: 9FICA4YwtUPJZzruVDh1dqTk0JkJSOor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX/TsVPgZc6Vb8
 D6pBkGu3XHHkgVxFa4IHpV2iIR1uIInFcOhRBrR/9uIMU2KiiK678beFc6LSlxAhG34FbMQPRpo
 ygHp9xgG2hIRnM5B/DVOMWG1eXwiYwkFwUXV90OCiWKWHxAphQu8Kqjw6k1RueoSDk/iP1r2eqi
 3OmE52ejSYX3w7TlgRDjH1zWxsUVHFNYy5+Q5R0c1L76c7bSPHTWF2rTx1jqY/QPIQdWMIQ+7OQ
 dp8yCe0NClcmgNAHUySf+3ofQGDAPj3aP05bke0e1J26lsS+i96q4amlvHtqutvwc8fh+rJeW6r
 W2xRl2E2tyYzFbft3q/nwhqTFaZMeBexWJydVn11nFYSokZgUj+VtMzU8YsF0S7WhjvfETIx+gb
 SoS8Ov7m4Rg/48QjZiDKqqpZHPEvE6BbQQ8k1sMIBPVFpMWPsEeyBMFdJ3glh00GjdkjmZEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=886 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109



On 7/24/25 3:23 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I think this should still be @linaro.org, especially looking at your SoB
> chain.
thanks for spotting this, I think so, let me resend this one!
--srini
> 

>>
>> GFM mux driver for sm8250 is totally dead and unused, there is no point
>> in keeping this driver without any users. This patch removes the driver
>> and the dt-bindings and headers associated with this driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>>  drivers/clk/qcom/Kconfig                      |   7 -
>>  drivers/clk/qcom/Makefile                     |   1 -
>>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>>  7 files changed, 472 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
>>
> 


