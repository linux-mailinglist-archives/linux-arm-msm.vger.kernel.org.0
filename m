Return-Path: <linux-arm-msm+bounces-35038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B51319A47B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23FBCB20E1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295841EE00E;
	Fri, 18 Oct 2024 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9Kb8PDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3AA204026
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729282149; cv=none; b=edY0F4P6Xa0l+ZX/9BelaeEZKfghc3vKxnYp/x/R1pK3PD8W/2eskNtd2dcV4OSWInOG2GbInkOKfPsn5hXaOdfQ1qA4idh49bWl4sjNvRxfoicokuI8lHdxYSyGURI9hogVoUyPHfGZdNy/bpw4kQLXedAQRC2CjS3b/O5lZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729282149; c=relaxed/simple;
	bh=YAGzBTav7p7m8lYzB9kJUcIL6dbUXpqglxBBKEJ4aXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAKJFBya4ZHD/yCG6bXEmcTewzbZ6kJYKcW+3MT4SmzjOq9qS7W2TG4i6nA1gDCsQ6ZSaIbadSmwzHn2AjTgfJ0+mtsikxY8WrN+wTjdFBcLyLQWHxErJqXJ6U9ysD2wyxfG/hnqWEfo6rnaXIHZ/OkjFrtG4V9UiHecH5yr0Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9Kb8PDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IDugSJ029894
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 20:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqXXdqAUk0VRbeyiVJtnVllz+xziQoWI0VYQRlJ/tXA=; b=l9Kb8PDgFNZdbSSB
	OBGoYPLU9HMAzxL0LE57ASz9iXUC8z/2LU8Ud5VNmyVClxERwIWGRze1KIJYE3Ro
	Gp9tCntKtgELkufyBUn6IkDl16uO49VlQROAErDYn57dIZwOrOxFShX5Io7ou5Cl
	g8w+aTqI/GFnzqouMne7lJ0POO7puQyuvcDgpCkvUwpsQns8y43HHWSx7Evz1LUi
	kbf/g15VbrZNVo6iHwSiLQEU/apkN0DOFMe3uHlMecJHO9LYUqoduq8AkIlyHSE/
	sbYdo6qqa5BUe8LtEllV7SPKgyuEPC7Kjq/cdg2+bB7BrPFlB6c8UypHQhBBvYTU
	rTk7AQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bs0mryw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 20:09:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe993f230so6685826d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 13:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282145; x=1729886945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqXXdqAUk0VRbeyiVJtnVllz+xziQoWI0VYQRlJ/tXA=;
        b=V7sge9goePt74GCIGVJUAXUmfIiQTPw1jCJdkJrZXvaAkSaglNTHJKEmZ8z0euLB4g
         uXMWZlL7+IyJAIMFTaizXFN//p0FsXEfisnPsdGTqx2Bgtf6dioQDbZxeDSLDQSIrszA
         VbbpxXcz5i2os5gTW+0wcEbVswA7FJZ49vTf3xDv56ad2zYlD2vW+0lHxusKpPETJSG3
         U3nTKDS5/i+T2MEigRSB51idXWKekTf+ZjaJoHGWKXa5zzxNwLxbVariU/pU9DMuJnLg
         rSAl/4cbevodXtF16sZ6swBoy0UxrNXcZvyrUbdpKa4kni7JpZQdbMCWL3V/jIOSOQmy
         l/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuUdsADP9cMB3aJMGguGaPkHOeCJOi8YInpjgR+xKA9YA4lsoA54+EouvxY9j0l2YbtQtTSMSPUZMOM1rO@vger.kernel.org
X-Gm-Message-State: AOJu0YzL55l3/u9aGFKuApOyNskn9wJ8uAj9Y8p46pqNUJ3WAS6tLGmH
	gUW0p/KhauygzV3V50Zkc1DPEXo49oBdfH6WTLyBLrJOV4zwhdQIfplOGN4YJ6aOzbNnfa4ImWg
	8gFg+G9jrJZEKB/frG3/KIy0sH1MfkHULfbejdPUSJKTxc5j4va+qOrUXOxaKU9oB
X-Received: by 2002:ad4:5ca1:0:b0:6cb:e610:f8 with SMTP id 6a1803df08f44-6cde1660d50mr19821586d6.12.1729282145495;
        Fri, 18 Oct 2024 13:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxBCQM5Tk5RPdtwn4L8sBL08cpiII7WgMfMKoYedB5n9Up4SRJF6MZW5WmLEK72Yj2So7J+A==
X-Received: by 2002:ad4:5ca1:0:b0:6cb:e610:f8 with SMTP id 6a1803df08f44-6cde1660d50mr19821416d6.12.1729282145117;
        Fri, 18 Oct 2024 13:09:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b0e6b6dsm1067423a12.65.2024.10.18.13.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:09:04 -0700 (PDT)
Message-ID: <e7479d31-bbda-4bec-af9d-ec6bab24654a@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 22:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] wifi: ath12k: remap CMEM register space for
 IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-12-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VSRxd8HxOPprhTgE485QsR8K3QPhZXAi
X-Proofpoint-GUID: VSRxd8HxOPprhTgE485QsR8K3QPhZXAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180128

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> In IPQ5332 CMEM region is outside of WCSS register block. Hence, add
> hardware param cmem_remap for IPQ5332. This parameter would be used
> by Ath12k AHB driver to remap the CMEM registers to a new space for
> accessing them.

"would be used" isn't written in a very confident tone.


The commit title is misleading, this change doesn't actually do any
remapping.

Why is this region not described in the device tree instead?

Konrad

