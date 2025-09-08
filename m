Return-Path: <linux-arm-msm+bounces-72609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3EB494A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B92E44790D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA843A8F7;
	Mon,  8 Sep 2025 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQXWo01P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABBC2F0C78
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347266; cv=none; b=GnNuBT38HfAw7QuptjhpqZWbSjaBGSk3sZ2neQsuUnXXASgoCCm9Mvg5eFjHWBMkQ/Yfj79LJJFKR277Q3oi/GuTnzykxUf8KU8ijBOBwHscWGtJzovhpJokWq31NW/wvj7cc+ZND2cX0zxcem9AFUVP5+IPlajy5zfSZPbQsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347266; c=relaxed/simple;
	bh=7WVxX0wapGqwPj8BtXO/4XTyuaHzlAYZDJiR1LsZre0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nc8c+Qmg1wDFjordfbvAG4LpzFzv+7CJKXN+Jm6K2DJNsuJKtqu/y1yGU24VEujn7SHdU04/mmnt8Pl+rQ86gLxMrNAFflW0yNCfiTLl9Sh6EghRwMcLYygbtEypgpDWjE89C0iT+B9fAcjsO9t0Ru+z5i190AeTpIxTJUhCTpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQXWo01P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58891cof028761
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuxH857PCUf2XzeLyUN8XPnPOKSOMUPFIWEWl7nTGFo=; b=IQXWo01POvXIjhQi
	j/7+6qsSGEg2G/Lqa64EyXCcesrKtOh3zbWeW++8VxDTs+hBTAuJriLpHrWIL27/
	NEhRAtQEx2e2PzyzYbAWZDxMKtsr6xHWzlNhOlwVuHQnJo7RvSUaegg1kCT/H8Tp
	+vJZlVHB/neB7Yf3YgMdR3bwDiVlJhDbusu6/mdVNB4c0eK6NfQfvbcqt5SigOMP
	3x1wiawydijZXVeFajEN2FKpeD68ZMV2C2TkkuouQyYvbccW5Ios2Ai5Gfy4YNp8
	g3SVFeEVAIB7Eng9eoHeqRckEVNO+Kf9iJH819TazVMNX2HND+qm1T09wAVWnS3/
	EelQfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j58qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:01:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f92a6936so10092791cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347253; x=1757952053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuxH857PCUf2XzeLyUN8XPnPOKSOMUPFIWEWl7nTGFo=;
        b=rDgV4eE+Csre6nj6UqoZakQDcn01XIKgVuTMnBMeRWaUn8p2/X4X7PsBNCP52Z0snU
         xho8ikjEL1hPifv8miUaPX2WNt4Uky3bk1GaGHWxIpgr3RFR9a5I02Wmv9VyOyQccZel
         8/pgYy4L8KGntqNnKY0/jWJnNll9gXTCZNsxLadZDsON5jKtfH+HWTvhl7eMg80/E7RQ
         X4qtErr7cQYrOOqsV9n9ZSG+5/3ASBfnw7TBvWgZd/Xsv+SSr7uErbxhrUC9f0JY7XZ/
         +4/Vrutacyx0sFAXJwysXJmzDFXOaEZortg5LdHu4Bky98cz6QZDzZM8mWXsZCWwMdSK
         lkJA==
X-Gm-Message-State: AOJu0YyseB3IHIesJS5WMRBnBk19I7grw0Kz3oxiWf1IlOHanj0L2tPg
	Vh2keJxEtMCF1qK+OLJhGJ0xrrSdXvxa7iM0WplXQrOEPZhA+lSAyn4jPxBVm9lVLyPw/N0AtOl
	tbuA3fJbHGIvFSXr4bULu9hxQScm3Kfz2oCj5E/N6dowbGNlK4/XAPP1qt+HbTpzQRwDW
X-Gm-Gg: ASbGncu76Kt/PerQcV5rJh+o3VBmcBwE30TWigTdok6nfhL/Xv/4Ycksp+eeJMkaEVf
	2JeUA5dmC23tr4zvH/TRDZ9NV88ZlDVtIRMGTfcQpoYd1e+zO4gVRGZYyQK0ELleNhRdp4Bku26
	RQOKbzlSvZ64gLWClufs1/5eiOlSLmaHf3EQjU5Y28jA/LpsZyIqhiv0VU8IFQ62fIEpFFus7LY
	JCCI+LCjF+cvE7sa8wRL2VqCLVC0GKfFDujmQjx9kLQA1KfO3daGWJznMSjd5un2944i2XyDDUd
	CPiJ7zpsDAPDU1EGX2ZEMIcOHBv5NaVcl1l1HA0L6/z2jcIV7ORAUCFTMyhM9D/vEhmRi05ALkQ
	TzSuIVEy5QKehOdkQzY+ayg==
X-Received: by 2002:ac8:578d:0:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b5f8376f33mr68087561cf.3.1757347252396;
        Mon, 08 Sep 2025 09:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8zMue7mVLsV476ogTf1WxQvSyUzv/MogiVSN5i83GQvuAFdA+F/TY1A449LD64lrkaf3+Yw==
X-Received: by 2002:ac8:578d:0:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b5f8376f33mr68085911cf.3.1757347250485;
        Mon, 08 Sep 2025 09:00:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61edb0fdf1dsm12548489a12.18.2025.09.08.09.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:00:49 -0700 (PDT)
Message-ID: <14a35ea6-0a93-4759-83f3-dcd7b6b35584@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: add initial support for Samsung
 Galaxy S20
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250905190931.27481-1-ghatto404@gmail.com>
 <20250905190931.27481-4-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905190931.27481-4-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX1IsGY1FUrhjG
 /bEr+USgn1SXQnhRoUjZtRdAg+uW75PJGUHXNvvCRXZTyCKuALyHw/3euVUw4jXlmDWA3MdO8m5
 PXhJ3Ycn+enbztFcDfcN/gTXdSyTmWxCyIcfELk9Nrw/z2Xyo6d0kgn8lof+e45YKoIOvw4ejAY
 LQN/SlZVvDcx35i5kX0zfSHwC62Ao5WqdpxvwX9bbT7kGX2S+3aVTyeiP1YWlLZbq2uvY6lAY23
 YnS4w3rpDLUb3vAoCi8IQBlveDQR5WoTqs/FgPj1gBeHr87wcDp+577XqanUl3kTyqPii4AxBjk
 RrukhUVqLIbLXsN5S2BT9wei1A7cD16bR1C+D9fdv04fwfZ/yWyvqZr+Mx3MkjA1kJyqZQSkhXh
 m/C3qcsI
X-Proofpoint-ORIG-GUID: ONjSw5pSZLEi4VaM4l3hnhPZBozAf_5M
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68befdbe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=O1J3YDS7JPEwnonmoL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ONjSw5pSZLEi4VaM4l3hnhPZBozAf_5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/5/25 9:09 PM, Eric Gonçalves wrote:
> Add new device support for the Samsung Galaxy S20 phone
> 
> What works (common dtsi):
> - SimpleFB
> - Pstore/ramoops
> - GPIO keys
> - UFS
> - USB
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

