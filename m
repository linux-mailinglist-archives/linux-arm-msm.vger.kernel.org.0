Return-Path: <linux-arm-msm+bounces-74399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E651B8F7F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D82FA18A0BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD372FDC25;
	Mon, 22 Sep 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBPOekuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9B27AC21
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758529614; cv=none; b=WI4CMR06+ltdBxoG/foIslCm9PBT2cWfDx/DA3pESZobvVQDOLKNm3QkvnNjslv3wqYUHOraFlA+8IhGc3FYTmmCwRnC6vWqx6/lN7d2sa8FN0X6TV2lBFxlK6opJrWgZQQVyPbJ+7vW8EOrJ/ynxOVyM+4LiXyOoWjT/ChAcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758529614; c=relaxed/simple;
	bh=eJTcISvqO+tecWyVFFheT/EbDB5c/sfz/eNRt4V9iq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRs9xVaMYl/dPRX+Wo8NCb799o/t5zYJpRt+OBhNwLoqRjNeHtSh33Mn8pBifILj4fkc3iNp034iSPjDZjjTKhANVFb7Ladu1ieYGdM+pEoOdkaSZzjuJYGRYMMMFF6lMAsld2cTjK0JwM9qb2P6Dlvd45eUtUJnKBDzyLlFAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBPOekuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LKR0A4001793
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=; b=gBPOekuy/TAuLDuw
	fYHLEtqZoWeB+TuYqIynVldqPB4Chu8KEJrz1Y/nSNhuA6KVMrMWQ2WMMALQHrWG
	tod986QwqjjTGkCzy0fa+kxiXGBnjh8DweQfKaRl66G52sKinHv7tfu7RC2y5Rqz
	gp6hEqCM7QaZyXb+OaihpmJz8RupD7umBfduqMvKLonFBpPYC6XyaGR0eyctEYub
	0qiIPjB7Qz/4lElNdcKVUsRRTbJ4YZHTvQKU+nhID+XzLCuz0eGaS9049JtfUR7s
	4xFFQALX11PAjG9og+4qFjMu9eeDSQeDgJcyXmVmopS+uQHJvYZ1MkSwtYczbRyu
	sXMxHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nekusde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:26:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2696ab1bc16so11869735ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 01:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529611; x=1759134411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=;
        b=shKr6yLp5OTWla1TbZ5tX47JeI/PW0CxRAKyF4GW6RdWC5lwhCT/1zIzCLq2SrN08N
         YIWY3S4dC30T6+VhIbEWFhWO+m2QSXf+d+63oJI19usFixqXuNn1vEbzi2s9Cei/rBDP
         KgNsYvcIPTNqUWvEtlQVKWNngJvObxytCPyS0YD+MnKZlh0tzqL11/qCH1pXpmotoYbU
         EIBBljT/O8GvlTykHLymYjW6PCJbi61ISKoOFeTBDYJ2Upd9PRvV/89LKL0/9WnnDUNK
         D19vfh/MlgeceYruyoXyql8F/EtiE3ne0GfI2HKmuuJr6rPplkh5jtyfRCmgETcCoGOO
         KdZA==
X-Forwarded-Encrypted: i=1; AJvYcCVlVj0oHOvD57cWrKsHoZKDdS22Lh0NLhw1wKaTkm/AStH6g4P81qUZISa0yDaLFRH4LeARqhlNFkbQ6CM1@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8FE92nhaU8FEKaw8BoGoiKnP3xvN+2mm4VCPIxR0bXNh1lTU
	iHnonn4T+z46hl8tU30nUqrZQsXtuTYI0nLYrKWy6mf1+NwjHA1HIqAjvZBDSeAjU6riXvKMsyE
	WrUUkCigND4YeSqF3is/+pa02C6R20/6Q30Py4/l1rQmD8b+a17QyhAzWD/Mj0+uMz6IJ
X-Gm-Gg: ASbGncvJgbG8QicnTWTIFmfDKU5M9wjGH+aKmyPntpLNCRRO7sn4wLcG6SXTMoSAVPL
	vpFBvpmQzaLw8VO2goXmBfAQ1DqM/CdphJyeZJ7w3VR09O9uV388QAGPra36B13uDECz6w9IGZB
	WiUMYlwg8flOr9SHXmSGvf40Lea0mGZjziy++a3AzQTnrMofxS9sHKAhLLhx+LDM9vq8Udc7qzy
	kkD9+7A0MhuQeP+0fmxgndjXQxzNz5L5404MQ/JNl0hVSsEE1jTMaoFa2rYOjXQ1eWzt4ArxONV
	IhrLJ0OifyP44/8pamsn8wrGWtvEgElVeuVN0m9WlnGVgzaReDsM8Njc2LT2ZlGh1Du+gidcyC/
	6luGCNbX1A4cbxhc7M5bZXtH/+8wztG0ZLw==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id d9443c01a7336-276624c084cmr28410465ad.2.1758529611170;
        Mon, 22 Sep 2025 01:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMC8JhklyE4iNEbU5+yB9CJsS1vFjF44g3zzVBlwELKRKjUfowiE8AinFLeQimo+OvsblUHg==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id d9443c01a7336-276624c084cmr28410225ad.2.1758529610654;
        Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053078sm125956445ad.10.2025.09.22.01.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Message-ID: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:26:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _s7i6PqMggBzRzTwMLyyVRuF2xES0o2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX5E+TftKHqEcU
 ZxSoM0lrdhr5b6TSGUHkDE6jDiLhmoBGWqNd9Uyogl588XiCz1hUujjJAqt+rCQf+hO1jOfwIKO
 beTciFx4vdkyPuXRbNfGV6roChChLeR83cZtBjbaAsKjgxgjbOj2V6sHLT+oDBtHNCh7f9wVEnW
 5XvlVhW8dxPv1DD3nzAC2G0H4787lJbBqnFjlbFqvT5++7Xtz8bkUf9C8xmh76Rm2OuUkNDIz+o
 dhEBmX2nHhat1TCk32irs3Sco0tj1JEANZPJEVs8iy4U/Sh5N74uTRhN2g/KGK/fkfZtam5TKqR
 QnX7yEj6YpmjcE4kKpZghUeI9FwHweqepwRES9dlG+XTcpNcX73ZVrrYO0j7rkpLux9LKKVDTOx
 hvbw4uZu
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68d1084c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ewKxBccC1tKemf2ImcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _s7i6PqMggBzRzTwMLyyVRuF2xES0o2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041


On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>> USB and DP instances.
> Why?


Shall I update commit msg as below?

"phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY

USB3DP PHY requires link and vco_div clocks when operating in DP mode.
Extend qmp_usbc_register_clocks and the clock provider logic to register
these clocks along with the existing pipe clock, to support both USB and
DP configurations."


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>>  1 file changed, 204 insertions(+), 6 deletions(-)
>>

