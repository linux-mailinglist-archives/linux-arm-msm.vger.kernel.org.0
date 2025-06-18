Return-Path: <linux-arm-msm+bounces-61771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269FADF7AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 22:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F8C3AE238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A8A21C16D;
	Wed, 18 Jun 2025 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GujBmtGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323621ABCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278317; cv=none; b=Wiio1ADNl6JkrnsmMtY84eCSAWrkVsZMvQzQSf2x5iX9tOoPBvo8WG3yarkm7Twh24wbt8gNue+O8s4SHCJqDiT6qt8KFFcs5OFdc5120trtA8RLyjUuCmBU62H2N2svkpN94nt3Pth+GMoBHcxjTvISegW4u2Jg+15xtnakyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278317; c=relaxed/simple;
	bh=Xp9l/tJ2kja1jz8SU88/Ddj1PCPORUiv+hAOLS2xETg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLvTVcmvDB+RrgnDUJeun+/VyDpZc+lT3zB4wqXxZJiGzgv1ZXeSXzmaWiaEYp5aOm0hJf5mqpHrP0uZCmmkFr03GesqMDhim2zk6GawaHHcV7rPOofvYZqMaKx5JWBKg2afNZZXrvL41fJyf8iZ3dIZS6p0OcpY5rjDD1nNNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GujBmtGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIrshg009934
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5rdETK0CGMbwpmdwX2di0zfwSYlupuJsv/QKawqVmQ=; b=GujBmtGE3/ZZdY4X
	/V+zSQYHNbjUEjEMOJ5QFC9C3PcT1adjcW8xc4IzwIWfJ0zAhaSKHpsFv6Fg92MK
	Nzl2fHEGqy491AtxAiuzWMizebpsNSRF1dAtsrdagBBcAUdblpLJl8xCNj1kXyRW
	Adt3ApCAB6pyG/gyjf0tcKLcGdWDh8PGzVhFzevSfdin5fmpx9e42t/9EaKW6YRT
	iR+j0y2Oo1rFp5D/9xqLDaGq6EZjwiZsRXr8PBHgUPAck9tZqheGhLDQii+qM5TJ
	hpvIsq3zHmnGBoY6ylaaL6NXZhgwcZwGYxVOnX1GMjrTavulWQ80sUQyNKMYwTvV
	JAHu1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5v6dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:25:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so2434785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278300; x=1750883100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5rdETK0CGMbwpmdwX2di0zfwSYlupuJsv/QKawqVmQ=;
        b=wD7Q+/SQsWeBlBpPr7uaLXa61apxTVTKH48gBv1Gthb1KkmfXfVEBMwI6+7M4Tw41D
         LMi6yzInlta8ELXYVtYEXHHW9e0lT9wBLW7UfT6XiqkpNYkMuwx6siPqw1pRidJf/WPz
         KBV5KrHn/4syRtPjUoX8eCCOo6luHJjoQtHfjl/zgXpt9hcW1xA9uM+zCOh/NWYjo55j
         TgrbR93HxPsoRaH6I4w4SKWK2ovmUmnNhjor7K/L47UX5HVjrpsK2ZYbZwQXaDROu3ZT
         mQFwn4QQY0oYDDMizFdAzj/ATv0mm+3NjordVpculUnxwI6Fw0Ptn6Wlkl7m0qqdO/FJ
         H5Qw==
X-Gm-Message-State: AOJu0YySR19nCtcaWdEQrrX6lZxDywz9aZIZfHEB9AW6bxDSDyomQzv9
	SdehKJ7GF6IjGYXdLdDSPPFf6+J5sQZ0CrjNHWnnmpzL0+qpRG/qsAy2+A83O4s/7+CKwnC9c69
	K11pXZfdZwJyBpE93L/71zgFvxnz2/zz5zEEITAJIa5Aw4QohnzRxAtcVv/g3Zeqg75qz
X-Gm-Gg: ASbGncvfJKCG8gFlJPBbfMnkJd4dGbRGlzdQNnMSfRUiMFPSnMnvXQhaLLpn3YuaSqR
	LbY9MwUZjBRNGZHi/MkECBAMpufxrl5xAVa0bQer3b72gbX8Q9V64wIqsthKLRcGBIrpzh4Svur
	eQwiEbZ0sXwNnG8G1+rhnOOuekE0j4QgxdD+mFLbjINeTB4WU5EOp0sdj1Mb4sUgHrxDcSYc4DM
	TwqFKViAiy2BAT25SELvyXUXCcxN+iicWAcIzCvJqNX1M0aXoeiijxKnQo5lJIkmuIWE+bc7Dsb
	Z3wsoFaebuwBWz9FuY+ELPY40VZDyM3WC9Vysxqla9w3Ird279vkuIQhq8O+afnETyCVd7yMsmI
	aNg4=
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr518302485a.15.1750278300530;
        Wed, 18 Jun 2025 13:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk1TvaW+rFRP6NHspvxWymzXPy+5exCsFRUxs4VaLgedmuLlQ9Pbjj5RZryxTjrMp4+BQcAw==
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr518300785a.15.1750278300142;
        Wed, 18 Jun 2025 13:25:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89299c2sm1111742366b.119.2025.06.18.13.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:24:59 -0700 (PDT)
Message-ID: <7d96ab73-ea00-4817-a8e5-5b15ddda3107@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:24:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
 <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ee_m-KvBuwMVIdTswZdc6eX_dtSXzj3G
X-Proofpoint-ORIG-GUID: ee_m-KvBuwMVIdTswZdc6eX_dtSXzj3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3NCBTYWx0ZWRfX+AdnKpxL3TaE
 SMLZamhCqwozjjf2YuODf8zPVG05ldS4cCqKOUOh7Qfv5IkNpV5iUeLtVs+H1f03pzicHJeCCzY
 OPXaK/8xT1y77OliWJifniMs7Caj2sLU7As0pmyiI9ZbTUcMFS+4dx1lHwxu142hDZai2uJzQjC
 v86a7ZQ+4hdgGBGKUMKBXdu3hlonXoS3of2ZKv7ak7RfYkDbGPrkr9MZ9xlNTDDmdm4b3HBwFib
 w9CaAkbRHRuDDIhsNe/DY7UUZ8xSetLlpdzskTVrFF+0iVtcCmGVzLwrGTgUL+7FOQoYdjKWZVr
 XeNVDaqC6+/w/L+SXo1F9F7BqtxCsB66MfJaqSQVIRdUXZYCFcLj5o5+TD2lv/iN5p/Spc0cpqi
 HbKYJUT4namSjPNutTEFB11EzW5CoDqk+mMhn/TAZoIOQThJMkT3Zj8OomHs3pdbRmJ2FCHV
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685320aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1anRd3zWmIIzkk0cLioA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=763 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180174

On 6/4/25 3:40 PM, Dmitry Baryshkov wrote:
> The established practice is to have the base DTSI file named after the
> base SoC name (see examples of qrb5165-rb5.dts vs sm8250.dtsi,
> qrb2210-rb1.dts vs qcm2290.dtsi, qrb4210-rb2.dts vs sm4250.dtsi vs
> sm6115.dtsi). Rename the SoC dtsi file accordingly and add "qcom,sm6150"
> as a fallback compat string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

