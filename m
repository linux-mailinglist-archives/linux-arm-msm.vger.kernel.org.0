Return-Path: <linux-arm-msm+bounces-57269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D899CAAFD00
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA874A6AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16827253345;
	Thu,  8 May 2025 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hORXaO6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8BAD2C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714560; cv=none; b=GzqVEnwtoqQQBMBY3xL/YVWtUB5hOVGYTMSc7buitOXmhPz1qEQds+9t1vl5IqMEzx8lLCS5I7tUGNvLpnqapyW5QHGsx5YKebG5GufZffiYWFNZTaTEVn5/M4urvuEPC1vpCnh87vnAjONXULhgJbn+99dV0HdoiaVZX14F3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714560; c=relaxed/simple;
	bh=Jbh/9af6d5ID3SFZRBT4G7nBI1lKLhOwQR45yMrSHko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfwCWtU/WIcY3GejYfqRJN+a9NT2GqWMIaedfmySqawUxciTy3c/nER2T1PUPNVm7yiIoh94HBY5oTdOlscjRiGMxc6FiLhaxpFTB3y4ooMXBASlIqS5R7VF137EpZTYhUZkQfkVuwTNK/hTWYjDNXCCXUJMkmXB4vx46ldbhEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hORXaO6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CgM4A031435
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=; b=hORXaO6a9SMh3pKO
	xzZhMhWFomjD0o7QZqMQglsv9KACrmwcUpNNbIBnsGE+8EbUPOb1bHuYC8xRXqWJ
	FFPGTgfdgX8IfHcDuimT5UCJNIT5trm7ajYqiaHah9Sw4timIb+qbMsDGagophDP
	fD7K71MDNX1IGFQJygINl5TtATJSoN+6sFoM5N/xXOP3NXnNJW6JbWWlGPGrMPiI
	RiFhUU7eU0+6znr4yZEiGo4XVs3q7fIYoh/t2ivqYGZRnLjBTE/bz3Hw/faz0W/k
	G46C+ZJ0F7KZ6Tw/N3N8HqFpZ7K26d6xUkRZBglvjs2rjgukFMDBYgT/SDQoGw02
	2mtCMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghjyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:29:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3181366d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714557; x=1747319357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=;
        b=PnVVEnua/vIFZltLloTztbyJdvMApiq85nJjlU2gjOLP+u1+mIcJUOE626LMFqhNG/
         eWt/jQ1Wxb4ZPoq9+3V3F+BquZ7E5evP7Q/OitLJE7Se1HziUZl0cn2RNVMViPfbj8AG
         HgRVV4LSoFWPNZwJWLYZBVmht4/3iqX1toVxZ5usbOH5KZY4rDf54MbrnB4PFKlJ6NiP
         rotxU5RwR5o1Lt++17xL4nQmvWEgw5nfWOKr2JRgTkEHzanoFdvTuP8u148DmLOt5NgX
         EWqckxeQzSvv0DmA/UZ0XOEc396cSYymtFU0yPfYeD9rlJ0ys+MW6ctOZXE81Mgv4r/c
         U6Tw==
X-Gm-Message-State: AOJu0YzabVgKGDFZlmPQWY8uwYEvWG0m1WwS9HE83xwAnWljN8Avj6od
	QEn/HmxxBqGhy22JquMPuSk3+oaeQ+1dzywXtvDDwcUA99tTtdmXnq/XWWmsM2CYLmaJyS63oqy
	zifBEaieaHupKkn+1xER79sB9l+Q4GZTgHVTldhvU9n74U1j/rrvSZ8SQbdTnAZ7h
X-Gm-Gg: ASbGncvhdLIY+wkN3gQTcCWiMdammT2xu9kxpnlg6+7h7BpTXSCVlBtdOczrzP4hgPq
	AN2mVEVYbg3MU0cQ3prpOkwiKbhIKDFJXsJQf67209yhAULmOHBqDIHuFzAkbiK0xrqUtIc/oaT
	cvBrdVwD1vNWj3uTMh73dXO1h4Sa6aQtmCZwibpyQvjAU4vOESvYk+sNh6jKSjG4B9Xwe64QQus
	wskUkxLYzJXywgzE9jKwcTSENNrF3DpKU/lc8Cyr0SaagIo1jAiO8K52FVS/KVjfbodrlCLCC7F
	zMrjlTKo82kP+m0ISj6yUBNPo0lYr3sbsJ3uKlJkmUmCbxxMukCMVpXGvlkAyL9hKrs=
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377746d6.11.1746714556822;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz9mHXpt3+OIRXdPn95Ms+NqkqUskqTCeWS3quvvvRzqN5bTNhGiO6vHKI+hmpfTr1sFDJqQ==
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377606d6.11.1746714556447;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa42f65dfsm10180410a12.38.2025.05.08.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:15 -0700 (PDT)
Message-ID: <ac96227d-5b03-4309-b3a4-5c7cbb40a057@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify
 vddio_disp output voltage
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cbfbd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=nFJzA57K4K8usXJIcEUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfXyogfpQJMbJFN
 9SNaPA4GnaO9QYi3ucU/HHzEEfNySqbQd55beFJ6PEjZcGLvrhD9zrZmrnZ9oCmqNw3bzbpjFuu
 oFwgVXDETKtTOsXt3lvkP1YYtqqaDL5DlF+qV9b/Y/qN8mZA+ExkJvuf4cmBDT/7NNSMbG/fJbR
 pb+4XiAnPwa9E4ieWdoHdmdTUCPMUQwHAg6W9eHR27JisV28pHdM7mVFBfcM20WQr8YvOHyQ/vb
 HlWkFGi/A+YP2dN2dNgt9jk/dome8molDIt4r23czA9voJ4hnbJzhUhsCVPfN/9BnvVmhbJdsyL
 q4Tdv8JXKk4c2Nu303mx+mpD6Peiu+X+9mfkspO12hKT4xi8UbavknnpEsRusipgHcDkmmLnTzZ
 6icVa85kW9cb5apT8RJ17SoN+UuI2sT/4yWyLbpOHdrysbLD3ZrfaQ0AgzGNdot9gtcjCz1B
X-Proofpoint-GUID: JinKKtZ0RfZJroH6nVcSp9hcxfjH2uSg
X-Proofpoint-ORIG-GUID: JinKKtZ0RfZJroH6nVcSp9hcxfjH2uSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=908 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the vddio_disp
> regulator's output voltage is 1.8V. This is further confirmed by the
> troubleshooting guide. Specify its output voltage as such.
> While at it, add a comment specifying the IC, which according to the
> schematic is the TI TPS22902.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Not sure what the troubleshooting guide you're referring to is, but
nonetheless

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

