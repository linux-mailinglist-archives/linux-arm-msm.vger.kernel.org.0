Return-Path: <linux-arm-msm+bounces-72701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87CB4A55C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7DE67A3CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C5C2405EC;
	Tue,  9 Sep 2025 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEGqlLdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B8723AB8A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406850; cv=none; b=FNWffFboR4tCjXIJgFhUX+Upx8PKZWebESOfTDQ/59xalz+oCl1U+ocyUrLjRsfMtlkcaPLn7ricK+pNPh4rvgvzLnE7glPXB7czWNTV3ZRQWuPXryoRNMyJ5jt0C68hyLhOqJOBaygQ6wVnfiiwqqT6LbTvV3lwWKdzeMzr3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406850; c=relaxed/simple;
	bh=upmujvJfvnWBaiiN0ti0rvQTX7eUdmtsYcwo6llGIhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoqqojRzQYeKvL/OSVnh8dvoQd77Q7oVdnzNYGM2IFoovcK9n76apgTOdGKIrEC5a4gc9utADZbUtIRp90U0X7LXo/TgaDIi8OuvKCInxcIqpB7wkCbEUSaJeTs+0bFCBbqekV7EJk8WEO9UXPq5LYhQlXZhpKYr+tL4VZ4Uj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEGqlLdD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896T3oi012984
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upmujvJfvnWBaiiN0ti0rvQTX7eUdmtsYcwo6llGIhA=; b=kEGqlLdDFAhiru0H
	ACVzBaGIQxIbrhuhxQvqDUjDKI7LXobCRsLJlvv/eU+ZwKXY7CVCs+gBdB6uDHkj
	qXhF7Lu5bPbwYtrxSZDhqYCDZLiexhxip3pHpbVAZsGVkGFkGdNgrcMAz4+sdMXd
	+/ldYAvtd6esKQu6D/i2/hu7utMp3vnXbC7ngi6PNOqRUXk2fKGIwFXGKanDXLmi
	5j5zsi/XpvIpW5gDA1dXqOvoJmshNVGDwhxJCWa2N7NyomvkRxgkij304lz+Xa0y
	+tduKnMc6pjiRm9Bg7IDvKcdv2QfTFfQRIq6W2JBWPDqVj7P596v5RA68m/ucCbX
	Ax7WzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7e7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:34:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329745d6b89so10835650a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757406848; x=1758011648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upmujvJfvnWBaiiN0ti0rvQTX7eUdmtsYcwo6llGIhA=;
        b=D3j/K7uYgYBt9NBzpR8uf4x+Uk6rZb3RCvgRtk7zoQqVSl+uxIuHpL1/90Mq0D/H4B
         drKVyLgHr1/foN4/2tBq141fcWx97GhgXQyUwu5HYo3eu2/zx15qK4CKrnNeGel98Xan
         Rx7mhSxVswPLyaSuyQHpiRkCf5qwX3d/eX40YIbqHucgDI68Bb5PJkBXSGkbAjFOa5Mu
         D8+lAdVRG6GDEqQ3uzY5LGqb1UAxEGSSi4Cge4NDhD0GZCWg0YJl/5PFGKROWs8Hlby5
         GB94d3XJAbpdjK5qyRUajKRC/9uJ4zyeotQFRUNDwizU4NTDJyRdExnJMPwkZpPxfn0U
         t6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlDdXnkQLv/fxqNbZ/qO64AQ/P92sBhgbw/SNGOTAVrIgdypRJrTj66IBk0uUwAdEyXGDEUNXUgUSyqnjC@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOsVvpBLyHN07+JOhBKhqGTJw57US6ddovJoLR+1CQ4vL5ZLM
	IEn9zG0DlauisLerGBajLaNwnves83AlhNPnHWsN5A5+kLiMJ7ZmwcVYKbMqjjWarRrcvdTW/Ds
	5K4CYQboc6Z/YL9kbhJEu+ltjACEggfXWTMsSA8rhWHtW3dOKeLO+aNM0En5wO35M11oJ
X-Gm-Gg: ASbGncsaTeulqJwiIv9rIvzv9ceHqgGAs5FFKpy9IRBPRyNNbVoYt8LAgmeVae4E2C6
	yhwAGcp4UoRwBLfqVtXP3BzMGJS7rco+O8VLxxYkdKlX4I7Q2yi2FsTWzAtVRiFYPJgwFhsN/u0
	djWV7HDIcJw1ExxqclD7a0TGgGV9cGaO+wwR8EiA+2bISHBI9Z/3otx7AxscjIA7N5+ivz9NqIY
	zgeB+xIs3+TPlGRLGiRGcHa2ws3rqQZ7mSqEY8XgsrcSA1OH1nKPZT7IYWuP4SLbRz6GGodbKkg
	P7T3WLRDfNFHreCZzYqSxxskDT1X30nkYu9LSwFr5PisnxxsMIaPaE5o2kF4lLt+VQaI306lbcX
	/936QY9so
X-Received: by 2002:a17:90b:2f4d:b0:32b:7d2f:2ee5 with SMTP id 98e67ed59e1d1-32d43f53f7fmr15226194a91.16.1757406847990;
        Tue, 09 Sep 2025 01:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFVYaSNpwmTtzVm52pLe74SQM+AQgVs52r6EibYNw4s3M1qPfrL9xKm/fTur78uRMs2Z/xFA==
X-Received: by 2002:a17:90b:2f4d:b0:32b:7d2f:2ee5 with SMTP id 98e67ed59e1d1-32d43f53f7fmr15226163a91.16.1757406847633;
        Tue, 09 Sep 2025 01:34:07 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb15f50d6sm14836433a12.0.2025.09.09.01.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:34:07 -0700 (PDT)
Message-ID: <1bed21ff-ca0d-4436-9d40-acf26dfda362@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 14:04:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom-qmp-usb: fix NULL pointer dereference in PM
 callbacks
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
        stable@vger.kernel.org
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
 <20250825-qmp-null-deref-on-pm-v1-1-bbd3ca330849@oss.qualcomm.com>
 <aLWllyKvag-BAXjn@vaman>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <aLWllyKvag-BAXjn@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bfe681 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=zK7o3jtn9Y8dKal1iDgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ARNF3x1WSqiOXp4oDOUZZVzpIbzgbV_F
X-Proofpoint-ORIG-GUID: ARNF3x1WSqiOXp4oDOUZZVzpIbzgbV_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX63UtOMkKnUng
 VI/LfmbhWsNVq8f5EFyH2k44TWfC4kPETHcJ+jBRN2DCZgCQZU3hCW1xUMR5WRTPWZ4KjrITYPt
 1lPV3M/c8hPyEdh9uIt/mvDQG1YqYgHQqcgXrwSGiHpJUWBlfi4ekRKiDF4VRbBV1sre2tqpJ/g
 PPRs0z+bh4qNvKcIQ/0YnbcPJlefNAbTt+s/GK2bRRB+Ay0dUS9LD3yLbxFOlr+IL69D0y9jUKG
 MIW2jgQx1qCONIvapIGMz087drarTWpv/LnyX7kmkvd27M/Cd2acOcVRSLGZjLwJdgUkKkgsH6R
 F2jjZZfi9FPbm2B4XajHbtXwdjb7ORtaeVM2s4aLdOrTpMtv5Q6JlJB5x25Ru9RViHG73Zg5Rlo
 FUX+BCLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039


On 9/1/2025 7:24 PM, Vinod Koul wrote:
> On 25-08-25, 17:22, Kathiravan Thirumoorthy wrote:
>> From: Poovendhan Selvaraj<quic_poovendh@quicinc.com>
>>
>> The pm ops are enabled before qmp phy create which causes
>> a NULL pointer dereference when accessing qmp->phy->init_count
>> in the qmp_usb_runtime_suspend.
>>
>> So if qmp->phy is NULL, bail out early in suspend / resume callbacks
>> to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
>> qmp_usb_runtime_resume.
> That is a band-aid. we should enable pm only when ready...
> Why not do that instead?

Thanks Vinod. Sorry for the delay, I'm just back from my vacation.

Sure, let me check why the PM is getting enabled before its ready.

Thanks,

Kathiravan T.


