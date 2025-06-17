Return-Path: <linux-arm-msm+bounces-61599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35833ADCC11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 14:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F70A1896167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9E3296177;
	Tue, 17 Jun 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFj3/XTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE028BABB
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164999; cv=none; b=GT/SdIOkNTJjy3KARl3ka+npXP/kztJkI/0c4+fLvgHjcFYKzd20qEY9acbtCOZXKmBJGcJOwwIrRVSED02waGagAMjfwYYCtKglvlrQv6535ay3MFOe4KgmBAZB6Y6MQxVPlsQ21VUMLdB2aR/8VGZcVQge7GxlBhbTXYy5zpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164999; c=relaxed/simple;
	bh=DKEqcJaeP8X1SLMpYbVwd7qUBQUW2PR23+GTcJd7GsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaZamDMiJYEB7FAbh77C78kQ8tUfhzIqxCZ5NFdqX+220ibz9yBKLVWcRfpktLIxCeXJL4QZOpPPwUhxgKy8GNHVpKv+jMIwObgwZ6LPYaHOYRGQtbjX1ThTTj1yTJxUY/LKYocCxNZoTItJ0oL3h8DGxCadJMcTCMfBSX3+WS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFj3/XTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H80HN8016706
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reLhBblkFjKNgFgw0iZCw73Q
	eAmoIcUiJNhR7l2+5Wo=; b=gFj3/XTHwtHhusu1XkABetp6zBh6LBV2MqeT5ozg
	lVp6xUMtaqNtiiXctXE34Mlu+L1I0orf7wUl7fHGlxaIo11wTuW6MTxeGX2UDRRa
	k9YPcoTINGCD850rfQDzCYkM4Ystr7YtkDYEhhIDoI7Ec7h6MF36bWKx60IIHYui
	R6Hxdj7Q1sM/mA4peducECHxUEdTWlA/t68V1iXYEDnvcamUruNCAxZlVeOudLUM
	ySz+Njh2uN6tMhxbA7Cqzk3fRGYxQ2VuejrtgpMVQR9Em1A1V6Q0stLrpl1DxKy8
	ZG75DBs14WiwqWKXOliEGeAGaF5jhqpLbnLojYBp8R7OkQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfgek9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:56:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb520a74c8so42186836d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 05:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164996; x=1750769796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reLhBblkFjKNgFgw0iZCw73QeAmoIcUiJNhR7l2+5Wo=;
        b=Ykld+/uW5EY6nu98KN4nfbaXeyrljcmW+dhJStbVyF1G69Wr3ig+iPJ7dX2MOp3Imu
         PMR6mELnizu6Z2st10Kege7WQvtZKcXQU4bGT2dGROISsJmlh3P+onCnkNszL96N4IGo
         JJTIoumRK1XsMYSe2PJYBapLBR56EKd8mpVHdgU5Muw90l79KRsKpK7QEHybprzuDjTg
         FlDX5sPukyX9PzF5/bqzJ5egevZaVuXqmblbIk+0bvlJqU+5w0STgibUn8+OeaWjlzh0
         ZkRDmEqp1aDoBUTvsFH1TTativq0+RU4oDBZP6n3PWfxx3DQ2ENu10tnL1k54EH7K5q1
         Xe0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCwAnJUaf/NbYYBHHIl0BimI5lrVzjW/ZpbIOI8ACEVriNxXLWGW2ALqS1mP9nEBUaqu64ygEOlLsUBECw@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+o2YQOrfPs/x6pnMX7k4FN2q62aHY9sL4nrexS1FsW9ggAy3
	2w11MYl4uIp7/VdABuNuKCoMS+xrUqtcQsfpKvGkv15W97O+zIR8hk382A4ivEX4/m50pQJeSaz
	Nfv2dJVGQZUVHZtXU9qxfsRbd7LPNLL0ek5KsPsenLiht4ie6CNNb5dEgJDFcXm3nf8iS
X-Gm-Gg: ASbGncvj72h/ZRmbvm4ECAQ5K7oULII1CmKxo8YhVgmGgIdEjgr/mORqC04T/6b4GcO
	1gw/s93cPtD4B84pfy3phYi9aGMI5OH/OTngT7OFZ3nLR/zhv2/WGTfOhERearKJ/qTl2xsHV5N
	cbIXWdQNtU8dNXJfIduKOSSKb3mbZ67T7LE2GagjoGub1dqt0PAxzkJdZwbWhcuSChZ3qwjU0Uq
	R5qa7sHAlgTQzuA7iGWoyZWlnC75157mW0Q2fnGFa0LLzwLJB4qVan+sXE6ll+BmPe4SWjJRC7f
	KwLM9IfkO/2DyKXj5QASCf3R+eIbM/bUKs/LGymXNc7HXV/phLXqUR9MD3rU4QuWifrYgPcShNC
	NOcZs3JuLWn2MsnwZasXW3QCdLqIhrqt3UQ8=
X-Received: by 2002:a05:6214:810e:b0:6fb:4fdc:dd83 with SMTP id 6a1803df08f44-6fb4fdcde32mr136702606d6.40.1750164995774;
        Tue, 17 Jun 2025 05:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvCoVuhabEm27A62sEPcn/Fb55CORSI3jmx2fmiprrI/xC488IzmD9JyAr83daF6LLrrsC2Q==
X-Received: by 2002:a05:6214:810e:b0:6fb:4fdc:dd83 with SMTP id 6a1803df08f44-6fb4fdcde32mr136702296d6.40.1750164995406;
        Tue, 17 Jun 2025 05:56:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135c22sm1912726e87.65.2025.06.17.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:56:34 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:56:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
Message-ID: <hgtbmst73ijkfptznqh5r6usdnn2tdx4fxow53g5pyl3yagbh3@4thxrkp5zcnv>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
 <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMyBTYWx0ZWRfXw1XeMPFFMuCC
 7a9DaFiVYs5YXn2pNN3jYchg1H5kXuEQHq3nZOZ3OX2vV3VJcoPiR9MRnme2AniIe3Tfaw77X+f
 cRqE9iiTBZNrt7f+9IjQ9pHwWhu67Snhw1zIVKvIcK+iDi/trApQj4ic1tB79i4kLmutK9y5dT3
 izOQGl+jQ0sCOeYaBNlQOi80c6YRUtQFlPLPuTWO+5vhlBqGMd+KXzLGVexq1lyBzNnZAmBb9q1
 A+bcfmjou5WXfMG1Ydj8m2XJWLHRuzpPWGjiIl+52dun6rJ7cauPDZ0A3Y//U3rYTswMT8Uc0m+
 9WjO1VUsZ1n3MQhiNZA0fVKBw9PtWpeDRpgmXYR/vu1OE/OUMM8Ognf9JudXl83eREz47eN9Air
 SBVV96O+uuql2cVIxeK5X+LalMibR/e4zWTrHgR9PbaRYz8Y+sfBH6XaJ6cfH5v/rKrRXzyn
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68516605 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=cispc58g6-s63dKQH_wA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: XZB65SnUSYJYf8Vqvh50ZH-tE7teQOet
X-Proofpoint-ORIG-GUID: XZB65SnUSYJYf8Vqvh50ZH-tE7teQOet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=946
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170103

On Tue, Jun 17, 2025 at 10:26:36AM +0200, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 83 ++++++++++----------------
>  1 file changed, 30 insertions(+), 53 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

