Return-Path: <linux-arm-msm+bounces-59286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83DAC2F38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 13:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA44A4A30FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 11:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3EB1E5B85;
	Sat, 24 May 2025 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/Fcyp/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C91E5B73
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748084473; cv=none; b=ISa7646vv6nzBkVqPemapGigVA/A4VlIUgXxlrl9ri5Go0f2B/bbJM1Vvd72H8EIlwAqdM2Y2KeN2U/8M5pEwRXK+weTiI9rfW1a2Is/8YNPXqOtOJENDZS0ytUa1WFZWH2iYM0XHV9qJgZCpTCMFD1pH2+LOHLIHHZmX4X+128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748084473; c=relaxed/simple;
	bh=uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y36jeJseYmPUZCq0bSEFbV8qbCKLROixuCiEGXmaZJiRtfBDMRccvC0SEbdDTe6B9noRn64njhvNwGtu6RP8m1Wo7utK/oaxuIgNwcuj0iZK/dkUfBJzv9p0ohurV3ag9SJkDLqlhsvNxcTjhxD0R5LscuBpDLUprqjv3SvMx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/Fcyp/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O4U2e3025598
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 11:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=; b=N/Fcyp/NC9GTtEYW
	yK/AFO3BxuesYqSkqbvhSRXAQHcjASZ+zoyYOVp7tHxa34C50CgY6Hdcf2ZjWbBd
	Gfobap/24NjIDUqQx5mPuGK3LTTXaZGqr2B2XhLCJkv4K75ydgUXki92AKmmnmOd
	SZN3ddUrZMwTxQC0O3pwC1OVTQNhDkcHLMGR2N1sGPriALxZuY1mYWnMx/96ZMYr
	Z/DQHuK72Z85lcM4u7osURHktBPnckx9ysb+L8KfqqaURKWyUOy+bvJiPvzYZUN5
	1D4mkEzlJ5phJzkKdetVT1sC+J+jVTOZHpbeZM4OqZNtFODtUjfuBOjbWECP9RQn
	YRLkEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5498kps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 11:01:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c0e8a5e3so188686d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748084464; x=1748689264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=;
        b=oH/dIp0nfT1rlpFwVV1aiU2tbfer8iUx+UfJtZck87vL2tFL/UxsW9T5eJerDnnu0U
         imZwbJMWCjAnuWCbIfyLhOOHcaXdCJLA4RI//FBtrMEbIs+29FyfsGxO2zQ81tGqLqqF
         lFNKFax0YOLAzNnABmLMJbv7rMlkkWqLHGNSN+kx1Od2k2dQLvj53PTMiSFTOtxq7O4m
         a9P3U3zKpGk0QxejfDTKgg+2VQ9kbY1K7b8LUkS0mVpJOkkkfcx6jPgBI+7oZ6MCVpZR
         8fmOAUSfCeZrIcKFRwuiOBeqiMaSdI6Bdi07iXQb6xEsmldWtn4SU4sQnv4+Z1Du+o1V
         2paQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ayWxhEvdzaisJVrkKIQ3K0LNxmkfOvwUZw1Lu8iXRH9lgZCdZw/3bGxfQdximCar9TND2YkJKfNvGr6k@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqgJ7QK/i6riYQUZy4Dk2HLR/Ba6tP2Qn9Fw0Fw0LPXd3d+JN
	eIFkTU1VcVXCqNuJSiIhNG/j6IOqMJgGCDbXITEBjWvH5/FPOYoq/ubq0WmKX1vsjUWyLX60Bnx
	7r3uNAbEqwE7KgrjGHhDpfQozGlmZw/u1QClTSoVgBdi1nclvDH8fUjrWn1Dvw7CVRsJ1
X-Gm-Gg: ASbGncszMBuIzs2ycR4MMebpZycjRhGCbayEcbDfUOnnzzyy+iyRBo8GqknJCQaSfSU
	JqNyL9cxq5+xbBZpIeXqnvLnIWODc53FKd5/S+y7cejtlSnsX6M5YpZeU3ddaSzhyZik7V+ttPV
	xe+AxQvUmX5LJErg542sptLrRor560GfEtczwA+EaunnMod+LIP5xyGv0Xv+hpr5AagS1Zg3KHR
	cJNAKBcLSWG/lDcIm9DcDTaNZwfNTPAbmf7htF8G8Mz6cZ/Z8+RKAx1Tv1J6ASKOTiPyqcFvg75
	OqP6PQbaxx+JQhf0EkC7UctixhR/2xq+BP0UYycM16ZQ88oU1LOVgCToKbJuNl138g==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6fa9d396e18mr13300356d6.10.1748084464347;
        Sat, 24 May 2025 04:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt3zT9ObE4H3laeqssPI6a1m8vVV+uGCihBhTUhjMgPqOlKiS/ZHkjAau8uvxRtp/e5FS/WQ==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6fa9d396e18mr13300066d6.10.1748084463739;
        Sat, 24 May 2025 04:01:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438086sm1369934466b.89.2025.05.24.04.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 04:01:03 -0700 (PDT)
Message-ID: <bbfc2598-6820-4d0f-ac09-406933771365@oss.qualcomm.com>
Date: Sat, 24 May 2025 13:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
 <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
 <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YcLMQlPkGMjy35mhV2G5zjrw4Nuhv-1V
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6831a6f1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Rz0-UGbwDQDUX_AfhhUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEwMCBTYWx0ZWRfX/2z7rHvp6uwg
 Nt7+urxwVAzX9rE87HsV9BtK9o9wWKXUdWaKe8md/2FBNp09g3NOtDZt9URDgIsPzVeMAcDtmmk
 YtMPIPUys6apI5+3w2Rx23VPNQ7JzbNeE4/aAoUiBci97A8fGnYnQ3D1VWCrK4m0REEGJ8neeBI
 3V7iFUtiWMgpg4tlhW7krMMV8ufuY4Fwdhis9+DioihCNv21KJu7sIdX4Sb7ITA0hxcrCfAb87y
 gGgFqY6a3vXHf5vxv4+fZE+MaDYzqPTdctdKoG8YW7sCchh0+bLJQ/CVMUjpySNRkPIKvyFjDHC
 dBtrev8Km2zhRXGp00PXKaOf5DNndN5noFkI3TUPBFeOlbVkgEZGEP8mqq2QawxHm2z2fb4fKPu
 HhzPWSZtV2D0f622b2V1eb5bnnYC8iWcHOOZdmGSSrCF0ekulIGOCBvjdHXJ8SG5X0eJUX6m
X-Proofpoint-ORIG-GUID: YcLMQlPkGMjy35mhV2G5zjrw4Nuhv-1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=814 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240100

On 5/24/25 12:36 PM, Jens Glathe wrote:
> Am 24.05.25 um 12:11 schrieb Dmitry Baryshkov:
>> This will break without the next patch. They need to be squashet into a
>> single patch.
>>
> Changing the order wouldn't suffice?

It would, but that would then mean you're introducing dead (i.e. not
compiled) code in one of the patches

Konrad

