Return-Path: <linux-arm-msm+bounces-74915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D4B9D68D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41BD74A0225
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9A7274B5C;
	Thu, 25 Sep 2025 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Syk9qAre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B462DAFB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758775739; cv=none; b=gMSIhgwmVTkYFKEd1W3Zcip8a2gxkn5t4HJD4pvDgz3ivKuZXl5WBikjrR+44qXaYzvGx2hnDBDfgjy0DgsSjRFaKGRLF7NpI6Cm48Opp1c+StiyXwfzMpNW1YoNGr24XvvJQ9Ur/9eBuYI3BkI/85SoN9ktmv/grFZ1ZLNu3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758775739; c=relaxed/simple;
	bh=s9FpdGOs8PnBwkz48+q+M2ShltlanLs7DUrxUEIDWIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0Q9XkIw3yj9OpHt5MnVx+Og+MW6gaOAMEt1pIJqo5q2Us1JSbbKm916N3QrqLss5gFn4zMGnZcA+pEj9b7hIHBjrfoH3KmLQxFTzSeQ1g/XAEsuCA3iMbhM9fOOA28FRv6C7HY3iSCuz9Kk8f+X4QnH3JThePVyKnuaCbvcv1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Syk9qAre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aJuM027521
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LU6IeO1zXtpAmB/Z0x5SiX+9EHhyKCQGpK7EzCxiG0=; b=Syk9qAreokVlRZKo
	f7SjZ90/wbmBegbK475fhrZj1xu1iSzzmRMwHeECsRXm9vTryOSsxm8IdUB8+ch0
	rX+fk5OcxoqXlGAW+T0i450T4fE4bU9pTEtZG9NJzhfu8IdsFoxOmkRwTbBglp/t
	los4DfwvKdK0vP7hftLGeT1ifr8riiANeSradJalQX0kGhd57F71CZre8Bl+dwwH
	A1UxZ+hdv4uQQ9Nyqait8AG+Skq7eGt/3MctSsD4KK5L6ebj/xbqCaSiGMCiqQu7
	+6XbOVv8qwV65aTCH3WdkGd1IefRGa3miTHp3kYW83AqtDNMMod6Ewjqlx1RvzZg
	ktOjDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup00tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:48:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so667390a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 21:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758775736; x=1759380536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LU6IeO1zXtpAmB/Z0x5SiX+9EHhyKCQGpK7EzCxiG0=;
        b=tdZ/4YPowE29u3QZWwQBFAKiB3oc6GHod7m55mOEplAypcScYVwCN/N/NXaoUXfIJq
         p+meFKduuHVeyCmVSdy3Ahgk/dMI7mmSDlDV+8+ecfD6ZbP7uQApSiQO3IOOapZubNvc
         9p78cZ6M8ubEIqjKo/w1JzD04TKiLsh0RyGsTuseRp4VqF0U8BxYyDsJFLL+/Fc5KM/j
         zr/bEyRtxGhCyx7fWJDQhOfQSh37oduV5rHknXEP5uR99l896ZfZ9acVX5j00grPShQf
         KjpCml64OVXuI61RenNz0mmRd3QJxjye22/c3yz46D6fdg5fov2ot56URVILLRoS7rxG
         W6zw==
X-Forwarded-Encrypted: i=1; AJvYcCWoVsoZYyDCWMVTVWBSELkQ5nV9tpKShObcXdjE3FOoq98I1f+AelpR0vO+pZDCpqneio/9+W8mVTGmg0QJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrrb5KVgUrwll6JT9OZPQGMxp9/N7le32Y6jPZCJFHnZPrLOTM
	O/0I+YYn8WkSKqU6TcW4HEUu+N2/BY10qCB5I88gc9wGm6OCEx+tX5iyZB9Oq9/i0DCTkUfeVCB
	u6ibqAEnRkEdKsfYiT5JFfKFd6cu5zFK0KWoI06lpuV6tqy4zgv0ZwUrlwD9hstPBfMxk
X-Gm-Gg: ASbGncsib/96YLLumtpSai+ZUCrnT6+ssK1y/YgjbSDWE4hkqRuUu3fcuTqAz4Spu9w
	4kolVLt8bTTMFyk79gCgGkcnrdRBHCjvIudMVTEd+eI14Yc9GE4PfrTyBtXKdsfoXQ4ulqR4nGw
	PaMyRNd9qom11bPN8DPS5CgFzV23Vinkp7JfQkiBXK53VkJH123b0KJLVpTDV7kerdjNNGDfo8g
	A7spwAn6UJsa4Kqg6u4eMz8KWX4/o5dWUPZ1+fYx8uhR91ykVns2uSPJvt7YKiDlTyX6uq4PVxL
	cn12xkyj41y5YWbF58RGqj9glCQDW2InSv9odASMc3OqNjfsSr/GGJ3HjYsNPxTTKvc=
X-Received: by 2002:a17:90b:38ce:b0:327:83e1:5bf with SMTP id 98e67ed59e1d1-3342a2da541mr1678292a91.28.1758775736442;
        Wed, 24 Sep 2025 21:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVWgEtqOn5boD43PWaFWdVBdM9sKcuzskhvCnQ25tJGjyIKpXs4nP0mBgSM4AQTvBtl8bvJA==
X-Received: by 2002:a17:90b:38ce:b0:327:83e1:5bf with SMTP id 98e67ed59e1d1-3342a2da541mr1678246a91.28.1758775735495;
        Wed, 24 Sep 2025 21:48:55 -0700 (PDT)
Received: from [10.217.216.93] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53c9862sm899243a12.14.2025.09.24.21.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 21:48:55 -0700 (PDT)
Message-ID: <f255d360-64b2-4880-a069-81c73095577f@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:18:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
 <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4c9b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=muTqSOK3q4JbPMG3l9AA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX3FWo3+IGkhlW
 H5ndKdbrpwpS98WWcjkpXLZSb1kGdPVEeFERFsXQisf/AS0udYLuH8iQ+NnYlSdAl0UPZ4C9ExI
 Sr1dldOESO77MJI8cF5NbW2rTdg3P6ErVIewQaLwfAQK40CGxM49t44MxdUmXOPXGXRykXKb57s
 z4RMa/Et8EFVteuzjiXnK4vnbYagaRPdC3OQdOydo2MjiZnOX6/agFKW3TXwfT/IXBY1ZjYLmcI
 COyzlDThf3tG4MUjIDOPON4rcIaCeio5Ln7/dOTDa7K4g3gTt/T2dxDV3qaBVw13r9+w2e8wHrX
 U2mGYgtBZP99uCslbXzpZKrnEGQ0x9UIbIhBTPWPn1OddKPDX9qVIm+1iuM0CYFH5DyQ18VFHkA
 sgiw2crn
X-Proofpoint-GUID: i9CB3wrNK82GUOVuzBqMvuaEUxiK4lTD
X-Proofpoint-ORIG-GUID: i9CB3wrNK82GUOVuzBqMvuaEUxiK4lTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042



On 9/24/2025 2:55 PM, Konrad Dybcio wrote:
> On 9/24/25 9:17 AM, Taniya Das wrote:
>> The pipe clocks for PCIE and USB are externally sourced and the should
>> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
>> to disable polling for these clocks.
> 
> "This helps avoid xxx is stuck at 'off' warnings, which are benign,
> since all consumers of the PHYs must initialize a given instance before
> performing any operations"
> 

Thanks Konrad, will update the commit message.

>>
>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> The patch subject must say 'gcc-glymur: instead of just 'gcc:'

Missed the SoC name.

> 
> Otherwise LGTM, I've been carrying a similar fix on x1e, as it
> (obviously) turned out to be necessary for the usecase
> 
> With that fixed:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
Thanks,
Taniya Das


