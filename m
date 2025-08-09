Return-Path: <linux-arm-msm+bounces-68190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECEB1F3CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB5E56327A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E298E23E354;
	Sat,  9 Aug 2025 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocsQvtQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAA0230BCC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754732543; cv=none; b=PWEFQjM+o8+EZBePw/Y3tAlY+gtZ6yLP2YZVc/ZQKQ3tqd0rTt9GqOPd51X7Xxb+DyEo4o08kmwP908VkwlU2gcpA41jQ6rd0h6fAg8IKtxV3NpCr3RiuHtDuWEGhdrXa6izeF95yeYmNXrOazDs3bg19QiA+1HoZQt3g1aVjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754732543; c=relaxed/simple;
	bh=ifWR+5YTYXsRgjzxK77i+K01IrQXJ9sN/mQ5f08sldc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLwIUIamgLjQuXupJthJhiEvunUX14EhkUxpe7+opelJ3xVOv2AodOXVoUOiXsE7/deh+uUNVfoyzoEvytYb10l7zOsI+S751r0CmSeayv9zGUV7g2t0i/zVJzJz7TnnENSQxetQgtLX91lSwOfxbKtQRLDCvdXFqmfro68/Iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocsQvtQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5797Zt4Y027683
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0372A92yO+6UzrCsBHxULUhC
	eOFsZLUB9BV4b4k/xxs=; b=ocsQvtQyl+rIznivUSMnxJKWoVXw8tKVWP6aYCXo
	NoHoZ0Jw7brxIgxyFnV3yYdTcCN6r/UlIC/aMOEbRvK/8UerXk6qmA12Ct1TlBOv
	o8DCZL6Crc5ta5YkxutyQi73btgUpCaN6DjoONU69PTVTT+on3F2UQ3LC81fAbi+
	F/07w6P0a4NmCPipL2pp0TgOXi1wW5NbMLxINvBS0OFrhd+j5CWMee8VkZuWIWWb
	de+pYI4cAFy000ra0b0tHARUtRxrTEAVhlXPGaTzRiGSTIhgXzQDdBCJHyvHJZas
	HO/EU9BDjWja1gqrdSMkpIIoU97qVHocFssoAoSTHsCoRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9gb3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:42:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af22e50c00so71470261cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754732540; x=1755337340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0372A92yO+6UzrCsBHxULUhCeOFsZLUB9BV4b4k/xxs=;
        b=lDWViCeHys86/h2lsenlbBFb4NOcpoDtFpqSxy1x8AoPCGSZE6NMj6I/yCoWszc+Nu
         Fd69DHQ9MaGvuKlW1VONJ6bl5ERcTLXyBKNl/nXPiYUiDn/a4rcTdLua+0yhrlRTGm/6
         lebatQoGCagDRFXRt0Xl2jzgvsymM0zDmr2HGDASXC5RQgc201btLNdeEqiqLmtj+LB9
         UgUOQjruRZM9SlfxPV84UEvpWWYhzKzk6TD35k4mPxDp56Uj2WeNE3KbFHi96VO1h+x2
         zy+BlE4reWbRE7Ck+ZwMfqMDfLyOLnFMEaCyC1YtyfDgcB6zlOD0pgY/Tjs7BoFBqd+O
         69YA==
X-Forwarded-Encrypted: i=1; AJvYcCWvO4dtNbEvlZwHGDJyE+x4W17w83kkxqxuKlPh21LgglPMTSKkm+Gkr4/MAW8tjpX7cHZ8cAGC+oven7Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YxOt/hR7E7JVT1hTQD6DyUWltHMLivqlfeNny5XUB7hAAsaAvME
	QpGItG0AIVgAsoW1I7iyva70OOuUmJvEbJvHirlXjFw9Wg5dpJqamRu4gdNe0z6MmlvhyUSNKtV
	+l3lfv3dm0sI61lYQmg160JeY4c/3ZTpdVl37Ge004qOGwaZ2AJA8kaqyWPepfCxZ8SnZ
X-Gm-Gg: ASbGncvZlgyXelpj+VDZg4ZKVu52CsJfEXuvkgswIu+r+JKDjKP26HVsZAyyV5DY/wA
	RpbYfHpBpUuRNXBy9GVKdWt0v7wkPA2Ij70jNosBvDCI2/gh6cxEqwkPhXDqb+bxktfv9vlDyfx
	sbqzNJSAIv/dqyJpJtiZMmEQiAsFRu9LlZsCDNYRZt0v+P6RUx28aGCxm42/6/lmvjhnJxjbFuK
	WCIYdsUR7nnJazzcZsbOocxy5/srLtmd7oWk5q1uMVARlIbfA1m2PAbpVVfMGWdLyQCEmAIxrEp
	Was0vRn33+yZLrD5kzLYunmOgz1oe7zrpuJN75lNSk6O/+446KP6JeyIsPaelwJ96bHxsbWIXeD
	DiSAxYMRmbuVcph0boyA6aQWDDgZXIWKYpALhhrOELO/z5ftEE3Ns
X-Received: by 2002:a05:622a:5294:b0:4b0:b39c:af01 with SMTP id d75a77b69052e-4b0b39cb116mr61368521cf.4.1754732540419;
        Sat, 09 Aug 2025 02:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESERnHKkIRpuJX4iR1miZrmVl0om2FZb47EtMDQ9dwoDLbFFiSfbashWKXj5hwmlVMBtCJHg==
X-Received: by 2002:a05:622a:5294:b0:4b0:b39c:af01 with SMTP id d75a77b69052e-4b0b39cb116mr61368281cf.4.1754732539900;
        Sat, 09 Aug 2025 02:42:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8c2e556sm164796e87.105.2025.08.09.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:42:19 -0700 (PDT)
Date: Sat, 9 Aug 2025 12:42:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH DO NOT MERGE RFC v2 2/3] arm64: dts: qcom: sm8750-mtp:
 Enable Iris codec
Message-ID: <pb3yyyjpffjb5u4oorv2rfo634h6v52gytmevn36k5xeqxhjwn@xj7x3dmaxwv3>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-2-2ce197525eed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-b4-sm8750-iris-dts-v2-2-2ce197525eed@linaro.org>
X-Proofpoint-GUID: OCClKYldxQvJ1e8jmxNFMP7o0ABiFZDh
X-Proofpoint-ORIG-GUID: OCClKYldxQvJ1e8jmxNFMP7o0ABiFZDh
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=689717fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=CFmXjhnyot7mmrd5IyEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX3vEBR0sjBUk7
 nsPATUYumIIN0vS3tt4a6dRtUiddsTXQ72CXI0vVLab0Ip6HICCCiqYQy8I9DkcUDtkLMOFgT8v
 Y8mI/TxVEZMNZosdgfn9IXjZPIe2i0i9/70LVJuOBjz3dDCXGoI2OLtHhJ/0pBTQCUEkkfwhF5D
 YdrKUooTLMLsG99nBe6NXHKSh9lOs9VYnDNgv9rIslKtOc2UJZ2Ndn0NoBBjpkH8+ppOiV+XQP3
 mDRvBMqDzWekxykAcBux1uRQf0k56Qc05pupk9/9H5bltSaTCaGW1KQdwdR2ff6nhDrtUl8wNU8
 bKGaF37b3olL/EGJOGMR1tiH9hqxCn/mqSBGQFDUNvWak1apsQbi+zFXjpAW4mzbw+ATvAXO0Z4
 Y3lmF7qW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Wed, Aug 06, 2025 at 02:38:31PM +0200, Krzysztof Kozlowski wrote:
> Enable on SM8750 MTP the Iris video codec for accelerated video
> encoding/decoding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Do not merge because firmware (hard-coded in the driver) is not released.

I don't think we have been delaying enablement of the hardware for these
reasons. The user might have other ways to get the firmware (or to
disable the device) in DT.

-- 
With best wishes
Dmitry

