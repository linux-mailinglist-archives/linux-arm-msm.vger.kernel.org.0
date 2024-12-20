Return-Path: <linux-arm-msm+bounces-43019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D089F9AE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 21:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E050016A358
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 20:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BD7223E9D;
	Fri, 20 Dec 2024 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGWLRAl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5A21CA02
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734725010; cv=none; b=Mo/dP1LDdPAS6xJtqnQb5zEzLuHFPeK55+Llc/f5BBdUnRM87zBzn7HIE7QL7ObBMi2uVydiGJuipu5R/r+5yiKzrBqbzSmi0/ytI78G0ss53uCBT8Z/cOa5+8LyBEXf73fA6jJFZ9ylL1gVvwG7fnoTtqCHwKQitru4BS+ax8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734725010; c=relaxed/simple;
	bh=Zs4JlprWkRWYL9R6G/5v6VnIua89C6vTZlubdjcHDVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdrtxQdPMFVv6NtoO5c6XKn5j8Q45vY7dkjhb2xv40/tqf3q84DBBJBo8zgunNRaXnxcJxzWgxtB5U6Y/qba+HThsNLGlHQLYrn1r0//ots4QNSpvn6wXCTYEcsIBEXdfHWcXyAdG0rQmgwDRGH0/uUUT2Eqhc6GAg0Yy5t27Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGWLRAl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCj5hL003582
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 20:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjz4Sq36hjRrUju32Ul73yf+4eJ4TQw8j+POxAHkw6U=; b=oGWLRAl5+IHXStqi
	BuIYkO6QcmyJtbmJirgCxxb4AGmWJTSYFDq4KQx/ItAD00CgQbz0qv5OQbBdbwJ/
	YACVnW+5UhSxvf11eDzIq8Mo5sa0hvThJ1LQ5ZfenD8ynbmMSUWcUgM/kE7247nj
	/fn/em1aSY4IQTVzFxpNUraO/a21l10ZW9VVEz9vuupoKaszp43miFHvUtrDLA2c
	zYC6YIXLanddOZZ15+VzhAKwEJzUAMcG0JW7iSExoK/MEFb4e3djHpK4/ul7PZvZ
	je+OMzU3WdU4r6sIOVELA9HKSZ4r19PE+46qWH9Zi997E4mqH4IYWf6TKSRRBKG6
	cRa1og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8uw955t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 20:03:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679fb949e8so5447331cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734725005; x=1735329805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjz4Sq36hjRrUju32Ul73yf+4eJ4TQw8j+POxAHkw6U=;
        b=YQ5ORYVwZKvPvVYxJLNqN/6eCzHoQBlYOf9DAVIm7go43pxvink2QEwmkvXY5fDf3P
         ou6rMktuK9FWNyk7nipCEjpFl7onOBv1IZHwi40uwc1CIpnSyBsqjZmo5zLz83t0Mv/k
         BIjkUXoEUPPFbt7DLmL5Qk+qz4bxuTNhWzVmO60S+dxaxpw1N3msDv+mx9jwmcHdr1d3
         hI41REujpvVcPT3PhGCnrvx+UB+ol2WQ4Un0ooX+tgO4T6KrN1j8uSHppL8EiYZuzEEb
         J5i3Co0VPmFAzvZyH2kUerlXJ/FPXTeDR8GsQRfA3ox6z4mWAeuSQBctOlrI2aJVBvZk
         sy0A==
X-Forwarded-Encrypted: i=1; AJvYcCXmH+EpDSovxL+QGuQyHeBzJwF9/co0qDsQ8h93EIgdjhIiXvk+J1hbwGkBko0kNVT5VIgHUeSFd4ce5Jju@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5MlCE7WU0dpCkYnhP88XtU0CfXQ82scx8LRyE9iWRK0M9W1K
	pusU73tu8e22ow9NF5c+hiHye8RgeH04KY9072VwnMy5foika5VCEwWXXTMcu57DInE6yMiVXis
	hmGz9DtTyPb0/5QMSQrJdb+vrr8gi6TiYpuXOdYhIgonrUbMg7Tm4kV6/8mWuu8D7
X-Gm-Gg: ASbGncuIZLkUy2c6ypEiNV7Xs85ynuFm044pkT74XCgRD4+XhVzRhlG7ynKsF5sh67i
	p8vDgeYuFRXB4h5OWt1oLdT0FC+XIgk6BsPiW2h+yvzXw84GuVNytP+meMOFWLlbCjzFTC8Gepm
	4s+9V7vYFn69Hhi0+H8d5hCnve7z6vx2l6+zGTDiOge1mdIVPvmfTO23IaxWW/PWazPgCJ/GmhW
	fPuWSOrDYZxGzbZX75vTHICMaUg6uw3ZDA6UFFp5EZNhM3jol+D5p2wFGNVvaMwU4ZJuhf9vX5B
	BQXUPo+JPm5psYL0sAMGh4nmu2SBXMeOBVo=
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr237021485a.7.1734725005274;
        Fri, 20 Dec 2024 12:03:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGOU1M+QO2EF012zHKw00KoR9fn6Wc1NfhNg0vW4QRfK/giOH6H62ekNUf3K/h976xQT1AJw==
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr237019085a.7.1734725004858;
        Fri, 20 Dec 2024 12:03:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b2dsm206705966b.8.2024.12.20.12.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 12:03:24 -0800 (PST)
Message-ID: <9cbdca90-e76c-4ebb-a236-a0edbd94a629@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 21:03:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tIn-AOAncNEGV4btsbm49-MXEJsM_2MB
X-Proofpoint-GUID: tIn-AOAncNEGV4btsbm49-MXEJsM_2MB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200161

On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
> to exchange specific control information across radios using a doorbell
> mechanism. This WSI connection is essential for exchanging control
> information among these devices. The WSI interface in the QCN9274 includes
> TX and RX ports, which are used to connect multiple WSI-supported devices
> together, forming a WSI group.
> 
> Describe QCN9274 PCI wifi device with WSI interface.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

I think this description is missing the key points:

* what is that control information (power, data, radio stuff?)
* what happens when the OS is unaware of all of this (i.e. what happens when
  we don't send any configuration)
* is this configurable, or does this describe a physical wiring topology
  (what/who decides which of the group configurations detailed below take
   effect)

And the ultimate question:
* can the devices not just talk among themselves and negotiate that?

Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
to the last question is 'no'

Konrad

