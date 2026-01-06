Return-Path: <linux-arm-msm+bounces-87643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF09CF717F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B847F3044873
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4EE30AD0D;
	Tue,  6 Jan 2026 07:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je7xsfxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3YB5FXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005130ACE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767685300; cv=none; b=rJk7HhifhuLJBqAqU/zDoBGlBukZya0LCmd7zCPnEWjU9JoSOVa1h+Yc3sXKn+DhF8Rqfh9UmSW7KUu8tWzFWqV2956ag8qRPLf0o2xX2ExzoolNYsCfuusGPiu7hq9xugbGS+A+FN7nE1ntAGiI5TJeuAutKts6k0B1cewqsx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767685300; c=relaxed/simple;
	bh=/x8jJlEp84PvJvZUCYE5U7swZZ7/tisiu4amOxNYegI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCjYUL/bhm7vHpIJBPBX7CHEA3o1SguLKR91/Rp4L9cyQroJ2Jea69asQWGDuDuSSzwxSJxEfCx6xjaNXp9cvj2zZqdGOJGKgXJ7CHRnkLriWzapaxPTGPJMIiVKyLksv3ZuFH9mOhdpQ/ad7EkxHnRAdyut7vjftJIbh96v1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je7xsfxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3YB5FXA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q8AC3300912
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 07:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GO8a2P1GNs0xnvslVLQ6oJgZID2w0ORPE5dsU6eLmiQ=; b=Je7xsfxMat9yvqRc
	b9dlDgwKKiGSd53V8wEYXtRLajHrBjX1xMq2l7M/O9QqYDavHL2Ft/eaBbIMx0Mp
	j9R3ez7QUI3bEnYPiyDiDfVc17yTmgoK6z4K6UNsl4TRW2B9D3kWevJkLzHps8/T
	+btCMHVkWwt+CxXW+lOhhcb7rNSRGAmB8nKG1flxvwnWC0PXJOCr8PVm4hnim9wY
	lDa90PKxCKwV3ExUAt1iuLKigQ5gbkDsXyMw6EmleGZ5T362jk0Jss4Gv6Kxb2PC
	Bg7qgytLn++21HE1OlrHCMsXTxrayCRYrD2amuAlHfJHa+p7j07AUA2kaiZIC2gd
	K11s6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvt9m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:41:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso22724535ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 23:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767685296; x=1768290096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GO8a2P1GNs0xnvslVLQ6oJgZID2w0ORPE5dsU6eLmiQ=;
        b=Z3YB5FXAL1clI3riiQnBJfIEBsGrGLJ4F2QdB8n4NiU7WsSmU+2kcglq12A1MnCxUp
         a8JRmaR4nysyTBqRqUjIMk5cGlmEMiK7tfHdxb/keE/w9qfcGz9A2JrKEhvpBXiQc5TA
         X/MqUTrW9BPaCWTtt+1rc8dQMVz817odth4YjVSQF3ogqWIRvP33Q9rCYZP5suEF6kP8
         35fjzCOn0WchJnBP6NN3xxLJfLEwXON2xrBYdcwomkFkA8wBntRpKWNW4t9XYTDdGMLL
         m6Xtok+xmfqKOhrSlQNY44c3FMUpXvKf4A3y5/AWIKFxYLYDscfjPWuBpSxUwwBpN6Mz
         qe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685296; x=1768290096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO8a2P1GNs0xnvslVLQ6oJgZID2w0ORPE5dsU6eLmiQ=;
        b=gdhu4ptmQu2u8W09SskNNmzVI+Xet1F9+MvscumZmXzEEJVsnb0v4U5myRSS4ssD8p
         DAYc23B2eCFAZHobQMK0OfU+8YMQSZkaotYFQ0QAFuI3J3D6oNO6aCwzXE2LtdpxWeCN
         Ayy4h8PwsY4PZWTwxb3bWClIgP2V+aR9pgOSlG8mIQQ1DEfqmfME6/Dc2lIinMYDb/ql
         ix0gkcmMqnMa5sulvzkwkG5UuzIniNcsarguAThUt7IyMR/wdNFwY3RRGy1Y0Mzv3gOA
         pEVKxsG8RJLuDSynReMePMh2ZqsbSWUKNObAovKJHHFVj24vXKdCBoTLvI3Q0UROE4nU
         JmQg==
X-Forwarded-Encrypted: i=1; AJvYcCWQUGrTJFq88Cbk14HM4diB8Le6O1qsXe4XACyMOFvVGGDM2FUB8wxYqDgB6qhVR3/7iwzPJ8iau5dJ+0i8@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxrVGoNECcfvq1zr6YR0qQuWxTkQdKoVgEdAwHY9sv9s2b1fz
	iRtCj5X522xo/aCeIUYhfDNZZEGQLkpt8bCEvUTSsDv+l57xsk9TnT1lKpY/FSehu82FQyNuMrm
	XQK02NKYcfA/UF2bFQth44KbxJU4Ea2WIpKHBElG34vMYiwgt23dSGKr7fIl/EMFlzTmr
X-Gm-Gg: AY/fxX7OXe4xD+0g6S+s7JiseVtF9Z2g+1SfbIFz4DDy/mF+IHoqpOl91SfH1R/CKqt
	8qh7YGwErWRFxc1chKIIotUgsAcO4GaSPmOQUCBKncwKJ5R2Xl4vSFm6N9OfP7TdM94aSuxyryO
	eUjD0094SrUGhSbUNApNPk7I5ZjL4jHJ9KfJgUeVombMTw2FfPMCcD2tkIcjlLu8GxwMEOyTFDK
	CKIase+aptIDGuqeNXHq7UTbEBYscox49V31j1bNqBIOaiCgFBvcDn5ZQN/VDX7/UlCXWCqFlMN
	NQp7FbLEX5UiTP+iIxLH1+0oEwUlyVCh8Ps8xpBX3O7FGpklIMw4k/FK6/u+6TqaQFg+GAUQ/aE
	UOgoLgh4AQ9OqjKMoUj02aHcN8jZLdcI=
X-Received: by 2002:a05:7022:b9c:b0:11b:869f:742a with SMTP id a92af1059eb24-121f18a34a3mr2093319c88.1.1767685296439;
        Mon, 05 Jan 2026 23:41:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOCTRrhaewqHkomFtiYL4h3XHML7uxcz6q2akIRWzgWCr0s/iQHtThSr2VGzGSnsmsYmS9BA==
X-Received: by 2002:a05:7022:b9c:b0:11b:869f:742a with SMTP id a92af1059eb24-121f18a34a3mr2093285c88.1.1767685295970;
        Mon, 05 Jan 2026 23:41:35 -0800 (PST)
Received: from [10.92.136.148] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24a65b9sm2565089c88.17.2026.01.05.23.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:41:35 -0800 (PST)
Message-ID: <83fc2a70-b6c0-4168-8827-466e3584c493@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:41:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] Bluetooth: hci_qca: Cleanup on all setup failures
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
 <20260105141427.196411-2-jinwang.li@oss.qualcomm.com>
 <qymmgw7oteikzceh3kyr664idl3asfqz67c6ibgpjruet4leje@e6xq3ov4gsag>
Content-Language: en-US
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <qymmgw7oteikzceh3kyr664idl3asfqz67c6ibgpjruet4leje@e6xq3ov4gsag>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pIby2lBjjEqyDdyL-T345_aCN3T5pXlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2NCBTYWx0ZWRfX83neZdziHi4C
 OMz+1O86txHUvSc7fulVD/vviYlnFOi/7u0GXMjaqSQI0hJ/1pP5+h+/q9tdL0T/Kr3zhUamflA
 FTNBykl7wXQLOTjxQT9/u0yTOl3hXY2YkkUlagCnB1NkZPAd6bGNzIUT+msjQi5qMVLpD4GsrZT
 bocxLLDDnDn4R83TwpIPD+V7mNcnN4zCn4aQrtw5BiIoPiWY+ASxSJ0sLjJavDtwFlbqbAHbgXR
 3BURs1rP5S6u1HeruZX2AJ7SLpbMLdREV3vJW71sUKFo0GO8TmRop096vwugvjp4yQW3Hgvt7xT
 5zjCzNeZIOcrjV7DA2RiRC5atuEB86Lp33Dd7++bpwSV4ECaroQpIvgMiCPQ060dCfIN+UPwXkT
 +jopkeOI+ZPztvnmE7g9iwfFiSv3dwvLQENlrINqKDOYWjiG+kHbaCNCdI272s0mH/U64ysCDBL
 OKh8lMkELKBn/9jCMvA==
X-Proofpoint-ORIG-GUID: pIby2lBjjEqyDdyL-T345_aCN3T5pXlA
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695cbcb1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CNz0r7oPcfcQ9U3cNVwA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060064


On 1/6/2026 6:22 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 05, 2026 at 10:14:27PM +0800, Jinwang Li wrote:
>> The setup process previously combined error handling and retry gating
>> under one condition. As a result, the final failed attempt exited
>> without performing cleanup.
>>
>> Update the failure path to always perform power and port cleanup on
>> setup failure, and reopen the port only when retrying.
>>
>> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> Fixes?
I will add this tag and update.
>
>> ---
>>   drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>>

