Return-Path: <linux-arm-msm+bounces-87602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058FCF675B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43A303008F10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E7522A4E1;
	Tue,  6 Jan 2026 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APOXoJRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXPES1KZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB814A60C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665882; cv=none; b=DYCSOj4Isp4px3HwR512Oe624/CB2yX92wvyTMBf/QK1ESYoTl8TZLPFJ7T5CKdJnMK0TuyIXxwyLmeRurXm3YDiC9E8fg5W5zhUdANSPKyEObn/CrU95TO4zJcoWLWCEz4ksLI/SQo3XtPbY4ZFQv7pLSZTJDftPw+vcCXZVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665882; c=relaxed/simple;
	bh=n2fg2/Af5GpewttNT49HB3aoRxw1yXTxo9EYF+Jtyq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTLPOlNhkcVHcq2VL84mGYcQPXS+eOeyBziJul38zFhmhmM/fdtxtiRkMKez3R4lZMp8cAczQWpWCmBAldmBwPh1bNoq72pxl0KvyVwYDqy4yz1nHd3TF2msv5C3n/W0FF5BAg/Tm6baMwuOLnkQGaCpL7OlShdwPL1a1bYpanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APOXoJRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXPES1KZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nKHs2969887
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V/hqyfw1+JhGgX5FOIOJy9NP
	Z6e81TYUvrn6tJG4ijU=; b=APOXoJRrm/kcx6e3vqTpwbrtznqZyWHCijksdVau
	YMaAeloxbg5HsUUjrcu9GCX3/kOlvrFbwkwTEjT/WRKFiRSadodBw6kc7uIU8BI5
	h4CQJ5WchtKVRZzTeWffVGga+EHO2F2304LX/9+d1Uvx4yukgoyzQ1lonZLZWEju
	y9QNYQV+w+YHFQCDL0NCOPwO4mfWI4lWkjgIZ99WkeNu2pKRLtGZmKGFowLJXAYS
	p8WCbv3SGs9Y5mZi2CX+OAY0qpmNfLQ1jR0ot69sqiZAdc7p+mL3rnIzO+OWE2io
	Lky5K0YtVl5uTqnjkKR+yoUwvTiMIpVxt567RETvsrpvXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsdnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:17:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3a4af701so14110046d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767665879; x=1768270679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/hqyfw1+JhGgX5FOIOJy9NPZ6e81TYUvrn6tJG4ijU=;
        b=TXPES1KZTLkmebROpNjlC9w2MbMt3B5HhJiDsZOuOpYF7741YgNfiite0lVT1Sqi25
         KKJ0DDxW0BQRS20Kaf/YubEJHRRAdU/FWT6SJYnjqQMlceC/UHMzbsyEd4yepNi6vg1g
         Zt7CXrU1gQ12yYrVykTjtIRfF50/5zU13BOpsqbN29Qee6wBTdYe3dzEmTqliLmr1I3n
         +vMltYQHHfBrTh4qJ0Z6+MJD6X8jXmrUNrlCwCOl/oJRxQ+at0RDcDN118y0Cebm3yqo
         af/psRZY70ofuiZs7P4kmkKuQH257gLmMcv0uTA3GLknBu/BgReomxQDWCuTyy6qHXup
         OjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767665879; x=1768270679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/hqyfw1+JhGgX5FOIOJy9NPZ6e81TYUvrn6tJG4ijU=;
        b=a61W96f/81oXFboT15TluaC9Ljg2cHzQPDMLj0zP6rcVxagUbbdNaBxQw7Y3PAFzGY
         aIdfKimlPt3kV8AMSmHEq9+ApMC7/DRfosD0l+x5mI+pIlH4ZRNg1V8L7Nl9VhoE+4A7
         p+Jj7hM1YU+0QvtoCCOyMsh2/3vUH7FRU1J73zPstwuw6SfbaqZ99M5ojHYmdNXJMzfr
         P/y2ZabjJUVdMVw5MIue9Ebfh0055TnLqrK/yABJmAYRHxHvW3Ubq2nkLfxIFyK+ruSQ
         26m5jdU8JIgQnMPgIcioXnkdOKGceeZ6hNVgG5vVtcQT63Koqe9IURNVUH+7ormv6Iuq
         hD/A==
X-Forwarded-Encrypted: i=1; AJvYcCVGK6NaHrMCRbmq3tiQeR+cDhLUsI+z6OMAsMH/diMOnvjWio6jLE4BNLEzalAoCC0hVCGHvhediT+FpeA7@vger.kernel.org
X-Gm-Message-State: AOJu0YxGev9pqfwy1mTjYHL0N7WNs3yKobYzufSbLI4S/JYGauAN35HU
	/sdcDzC8GRs9jweZ6ScRnqk0vAYht9nTa0/PeDnXa6MtPuvTXaPh1q/Ks+4bQH+ZJA5kIQCu5Gv
	rKgWXf2AAWY0/hkatF6p4jSFWudHPaGFfGIyM+c7W23xJksXsSmuDtnVoaRtjO1zUMuZC
X-Gm-Gg: AY/fxX5u2ftx7xIHR57bLxUAWOFm2NLep4sZ90fyCdIPe6x63o+7kULBBEHxGj/0R0W
	jsJtIzkdjGpjYv0bxhoOog6vlQukOgPhzXUUrCnjhHLLbLFFnpPMZ+iemywpw3FCL4gfsCpAO9B
	5lPf7H9jJqzSra5sXvS8EjwWIZZE9IlHHpM1Adikw3VjCOoQ2jcHztf34bPVYioXd65QwpcMgIM
	l8GiuhMDrGTMq2Oaen72HLl2AHLs89slnHnkKkXyv0NuY6d1VkpZyiARYAKqwA35Pkv5NlytnBs
	RSXdW2LHmnKGIMoSHQ/r4MkjNoxWPkzYEyDWQlh3s72riAJOfR96EthS5VxZMPwxlFKbK3tBmmI
	aY4MI3HdhccjF/UiVy4B0NDKQcjsCIb0CfOqpMa8yGwCpsLVXuQSCVxERzsuLf5tIfRQl253b9B
	t2snPJxyL1e5rPgdjiDU/trvw=
X-Received: by 2002:ad4:4ea1:0:b0:880:6647:1031 with SMTP id 6a1803df08f44-89075e19183mr24409346d6.1.1767665878826;
        Mon, 05 Jan 2026 18:17:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXJQ29cnUdZqNNihnuRfmFbbTDe57nwdLlHFaOCjefwB0lyfwIqKCf3VB6Z4++v2nlPJUrZQ==
X-Received: by 2002:ad4:4ea1:0:b0:880:6647:1031 with SMTP id 6a1803df08f44-89075e19183mr24409056d6.1.1767665878380;
        Mon, 05 Jan 2026 18:17:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6973asm208846e87.74.2026.01.05.18.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:17:56 -0800 (PST)
Date: Tue, 6 Jan 2026 04:17:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v7 1/1] Bluetooth: btqca: move WCN7850 workaround to the
 caller
Message-ID: <gmmij4bch672mxj4uhws4oeeb5r24p3gciwykrtmhgrq3o4soe@wg776m6ixy54>
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
 <20260106020738.466321-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106020738.466321-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: fRiZ2qgXQyKDrJxSY3sbQA0JtVYly0LG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxOCBTYWx0ZWRfX8EcX8BU5ygRB
 heyLlwdnoBGkFHZGCJYRwa47ozWEM7BtE8L7RzdNK3XDHHrXimJTJK3qWhnr6UZAdhi2rHP3FGV
 xRbUYizaTFnrhnhntolHyOVssW9Zvp6Vus0aZpOTXxJrdhiy5ONc3qedHh3NuAQDyd2w02TN2r4
 OnD+eGs5tS5g28seeueRACOo/IB+3PLChm86n82zuJ0Fqvg3lV50DxkCbJKNDO+HBHAsQGemDNR
 4lG9C8Y4CCJE5vbgYp1nCB1MfhJ4AjGiWltEIWiaVcLYHuQWEMAbpSd6AyEXhSHrX6xLA+rCnKy
 I8NeYk1SS6RgbOM9NMxrpxoaq4Bmnjc7JNZqQBGB9uRekBhcTG+RkCc+L0vG42/M+tKS4tDNenq
 pSpIXDGb1avFQW/v6/anKgiFm2SC0AOPprpHoiQ6XoYd3/apaJEBvULd2HRTk6kWudDS0WexYZr
 jGoHKiQ2l1a3g9FPUzQ==
X-Proofpoint-ORIG-GUID: fRiZ2qgXQyKDrJxSY3sbQA0JtVYly0LG
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c70d7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YWdG3P-n8oS0mWOsiswA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060018

On Tue, Jan 06, 2026 at 10:07:38AM +0800, Shuai Zhang wrote:
> WCN7850 will first attempt to use ELF_TYPE_PATCH,
> and if that fails, it will fall back to TLV_TYPE_PATCH.
> 
> To code uniformity, move WCN7850 workaround to the caller.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

