Return-Path: <linux-arm-msm+bounces-74564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91021B98804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 09:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44EB83B7D58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 07:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1CF26FD8E;
	Wed, 24 Sep 2025 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DstiAYUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6223D2B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758698571; cv=none; b=U7n7gJTzBbS8XtToUzHcPCxHYPEzAt2NcEG1bzFghzcMQZ0QlAbCmWAFJVKG5Dx09kJ7A8eyX/q4+8Si+SFvsOuQi/CmRnA39JoluWUEkYibW2tLNpvsOZpkLfFSAEImwbZ0o6lhNQ+dg5yjX67qHJx46/1wiOhbj6GGA8azwEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758698571; c=relaxed/simple;
	bh=s5wukc8WZZ54O4OO+xy9C2hqGJfv6hhog5dDVRtqM9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8oAwB9DQUpHd5YiPdCagC9ERKa4Ih5DNLB8OYL4hPsXsCuY5rIyD8iS3CpO9TGMDgxxKZ4tvfJ+nZznkFIflhKfD1rQYJ0oJZy2U75F42i9ZsoGr7KZM1I2BLThBK7W6XL4J0AncblYj45JrXaicPdiEzaDA2d4ztCTcjZAzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DstiAYUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iJBX025129
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jkzla9yPfs+xt2uBZdioDrNai0dbYaoeRm+eR3334YM=; b=DstiAYUX4LGXQ9ym
	al+FNc7GS9eTBZ17eGB1jyIxxvi5FJGHWhrawca9qhzTlOYtAxJTV/9lx+JLfXnM
	SYfPaTlEvQxrYkv7XD3B5UY5eV1+/4yqfd7X/eJGvovKdIe/k6GTmt9CUEQyHdnE
	G+WuoC8guI/xwSW0koZbT+a2y88V+gQ2MWWvOhsGIdC8WIKgZhapQS1kG0a8ikXx
	LIXNux8Q+rILaWtHf8IHTMifvz6sGj96giM0ZQH9Jc7YmcF8u7ewtqfTlg7XMBrf
	srE7CQxjeIS4YqyC+lHIT7cL3INT/rxYdGrGh6tjW9DiKkitPogDymrK/slma2nN
	fssRsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv13dcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:22:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so6435000a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 00:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758698568; x=1759303368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jkzla9yPfs+xt2uBZdioDrNai0dbYaoeRm+eR3334YM=;
        b=t6o9a0aTqzw5TN9Eu05zJ9HD3qrr3jZuwTq2hT9+z02XJEIdWq4+xe5hqQOvnbZMFZ
         a+ku8sL5pgCAywtnd0Snp/vY5wiR+Bjl7gLHHsrXGH6ge5Mzt9vGGsBrGZW24NAcqFGZ
         JNL51j6Fx8jC7fU1dIuCnq9RJE83EOksn8JvpH80Pl35IzfQztkEardY3qN96LGZiTpi
         QJNmKpwr91yAQ93/gSvG8C4Zckftyo/L7DMJcIEjCZr3ZWk9YyNySaz/NeP45TnbwuNq
         X2dtcpm1rzJmJXoo69GmFHSk04NkxXxNp90t9ZiuUey4GZcFwmhglXA5UgpuK5UJlYmw
         XrMw==
X-Forwarded-Encrypted: i=1; AJvYcCWdwFO+lbRWlBw7S3S7kP7EVs74I3kt2Qc/7MdkTq71EIUWG8J4owNyytguvMHfUYT2Afm66nmfmM/02r2h@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBtB7VhExWNMh1sDn1zTtIxfU+y5HAnsvgnuG/YNIWxnniSg4
	x4GGjdHdDR6lvGaAvfDmcY1+NZmqe22t+JBCMes7l0Gs0f9Np/h1mLOjJHKQq4OPAS05Ug8xQBI
	pBpdA6NoeqSFQUIch5j1b4Whh80ykMggN+iQMu7CVhorNYMhNBH+JZlvyryEf7GtTNuBQ
X-Gm-Gg: ASbGncvy8gDhCVVaK7YFHvJPZNOnVAbTRLkpWrbWb9Qfb+ihfgehSjtXUzw1QoXQufW
	1k3hJIcJUmSLGO7ygmQhsplfMO0le6kkybwf6BN+PLB2nBh87/Rqia6Ck93vR6op2mvKGZ0NoPM
	HlfuEHgpSQrv2EVZB4PkGQMHzzUBPnRABAJKjmqCrsB90fW1lAMqCGeA2oyvP+lVM98DX5tq7pJ
	Mo/r/CcNjootnq8KkuHlr+TScCBDjzTANl8HS0Zq6/pgsrxGmaQQVaCNf/rqUUHKr/GUBBieMd3
	/Nx/Ktayv52k9PkgAe91W1Mo6b1RM+AND1yvUhv7WxR+IzzwnehuPnjWlF81ENERz2gnA9kg89Q
	=
X-Received: by 2002:a17:90b:5103:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-332a92d32cdmr5768289a91.4.1758698567978;
        Wed, 24 Sep 2025 00:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH0+pP82pDEIE+FvE4uDjG/rW9TenUB12/4rmERSL5RIhaLFJBaQpN6XvDtOvUl0ui8dZnFA==
X-Received: by 2002:a17:90b:5103:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-332a92d32cdmr5768264a91.4.1758698567496;
        Wed, 24 Sep 2025 00:22:47 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd8fa0asm1377128a91.3.2025.09.24.00.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 00:22:47 -0700 (PDT)
Message-ID: <ce1e5c0a-46e9-432b-b2ac-44abba85c7f0@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:52:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans-evk: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X18G0Nu5-FaElxaqtolo-4QqZK4Fw5pK
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d39c49 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX6nRqzSOCb2sU
 iAJYR01YalO6j9+fQxF44I33oIVbQo94GK417aDhtlTQhrpKDQV8FcU1x0W4a6ioTpeFRraqpPy
 mCx6zfLVaHPN328deUGYJ64pIi3YjStRXhLAIo25xd6VlYqGlF8VYa2yLYoB3Z9Sxf+MUgIH5pf
 +xWH7Dz+V3Pg9IaLPpZh/cTwOYsubUqOTaFpqct3Dmtd3us1KUqZejGSLsBZnsNKO0wMvtY/oB5
 SfgV6KYsemFd+JSLQUgzXmFMT3o/H8N5zchJLKp4dYuiFEmwqksm6miJdQ+E8yFj6LoyYPV38Pn
 WK2RBoIpJHW6fzhPRFgUCCipc3DHWTMrTw2rcA07KKbRQstMB7W4PynhwMnDaiXxj7uHclD6v2M
 IeAslFds
X-Proofpoint-ORIG-GUID: X18G0Nu5-FaElxaqtolo-4QqZK4Fw5pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025



On 9/24/2025 9:24 AM, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 3 +++
>   1 file changed, 3 insertions(+)

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>


