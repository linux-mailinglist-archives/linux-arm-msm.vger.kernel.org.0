Return-Path: <linux-arm-msm+bounces-43880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8866A00941
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACECE163B34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411071F9F71;
	Fri,  3 Jan 2025 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHXyB48+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA441FA156
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907463; cv=none; b=Xl9ui+KKJShtofKdU4pi5zpD8/UXAHnJIQYqaEco29VO85DORL2WM+9MCiKyZ8fvP7HEzIGhZDYcnE1S0oqeeD1fERG4n2kz0L7c9jIu+c0+DSVCnH9cgVogN7gZgXJIZ8vsvuudG3A++zZwKM1hXy6io1OuP55U52G8gfaXDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907463; c=relaxed/simple;
	bh=nhPX9BG+gAyURmZkkpADTFWhVLQ46RSVNCccZpHnphk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2DALmhnv3edPsd/fij+hxAyeKAJ2Ewp5W2YtE8RqYpbgimBkfhIw8E7r0r/jOb1lwNmbnfLTLwfj3OyUbYJX1o+ybk164in8ZGOVn2PmaVFaUhPyMaLdWBp4ysiOyLcaebHPpsnfGD3iSbxaY9LWQzViRqdGXqqvUYtKxKXr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHXyB48+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503CAWPC010374
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NjXg2KQzeQJJP8EfrOwEtzdhvyUoy43usV3/CaC/ms=; b=oHXyB48+uhilODJj
	fgfrdtqFtICyXDQVJ3FWjZqUogD/5z9iVm1YDablCCnA017yDDMj8rwnjF0bXlm9
	2oeW9aIIcX0Y6fuu9H2J8bC8veZc6hop/137aHqk8D31d89G+VH/WNJq5bxcMzmM
	wY//w+pOsSyZ1o7ZzXqo3GuTgt6fcQWib/uK6S8UPCI33ncLvjQ7el4RpSeVe4Nw
	VgPcNiyHiiNG9cPwYe7MJvSaKnlMi0FSoW9P4ZXI4UV3nPhbpHXr52HTzvjAE1yc
	jqbkGnrVjqvgfWOuBfEN2IUV92rXKWOx7EmbHeLGED3TtKh5o4b+Tmx8i9oEEKHm
	7lH3jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfnfr16h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:31:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679d6f9587so34419321cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907459; x=1736512259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NjXg2KQzeQJJP8EfrOwEtzdhvyUoy43usV3/CaC/ms=;
        b=DEgpAqEvqaXRP9zQHhMCdOXiCikCQ+sw4WxY/NQjY1nO/ZutTMEre10AQpCiAQcTuy
         AUsHsi7+GSgenNno3W5ZdFWB1q8OKTMixA8/BlU9CMtrVKlDck9E3bmgX6orcs3PKDY+
         O/x4zjveiPTMxOXnbs8tZdSgwcmZ5nQd0Vzw37nsi9uN2ptIfUF7xCO6hHG91ldpDK8Z
         mfMYfiyeJiU/+J7bHY/AbXsisR19Ty4CFMuvBimBVD2+w73jxhGTbzsdGZW8l6E9tvJu
         EmQaFb5K0lDikmwdY50088uo+/imPoZLLx4sXCxBGU/9bbX6hi1qj9o5D+0YbZfDoJA1
         Jp7g==
X-Forwarded-Encrypted: i=1; AJvYcCWGuCUGb4GIcK8VamWRrJJTw0W4M7I4Tt551IQg0P/Qk0nV81C18R92V0nTgB5iuGEjG47iK2v6gEHiA/Z+@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgqZpqobUs7ABSjAWVX5x9cnOYIwBEV4JuNd2S5F0g/ZgCKlj
	/Vx3zzkgyOdTMqiyymEkubrzR7Ta+DC8tb0zbhv1dsNQ7WmZA9zsKq9syTAX4cY9/8o4qP91fK5
	sZwAMrlVcYep9MhQmeFpjRh7YHTRjVqS6udN1T7cAmDrgVmS/NJYo2mfX6RFVlU4C
X-Gm-Gg: ASbGncuxOnzWo5CAkPcx21KmZcjYK+PxCPiRoFfo0ebA2izSDrW+W2dlu64bbUl4IX6
	V7jXSVzgXzEMOeijQeEBlxyIOggAa3p2TSYh+gJ7j5j3ZEsFGIdBGOH3N72Wyx3A/6zHph0+yR7
	sR/42rsXjtWws1R0+JmLyJCHp4izos3hTeBt/2miK8+UIz64NYkgb1s1CWxfEBqQCrxflWAoxTv
	ZAWcVOUmJWBPT/OPUyIt9pXXxB3Swo/0jzpjT00M5B/Z5ldj2E4CXJVyJU6+A05AW18qww3+xam
	ZLyIXkditd4CKsCa5m/f/nEAHQCvyFGNock=
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283383471cf.2.1735907459332;
        Fri, 03 Jan 2025 04:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC5i6vcvdpJXvbFLYqlsfKgCGHZdyRcc4CCuROZOeuhDC64A5sgtg9yDqLeLq4zATQak9ZsQ==
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283383361cf.2.1735907459031;
        Fri, 03 Jan 2025 04:30:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm1913633666b.188.2025.01.03.04.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:30:58 -0800 (PST)
Message-ID: <fd4e6fe9-0a04-47b2-8da0-bf7f5390885a@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:30:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: ipq5424: add spi nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
 <20250103063708.3256467-2-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103063708.3256467-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fmmVpIoFsQNs6tU-D6pX9vQC9dBEO1Af
X-Proofpoint-ORIG-GUID: fmmVpIoFsQNs6tU-D6pX9vQC9dBEO1Af
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=913 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110

On 3.01.2025 7:37 AM, Manikanta Mylavarapu wrote:
> Serial engines 4 and 5 on the IPQ5424 support SPI. Serial engine 4 is
> exclusively dedicated to SPI, whereas serial engine 5 is firmware based
> and supports SPI, I2C, and UART.
> 
> The SPI instance operates on serial engine 4, designated as spi0, and on
> serial engine 5, designated as spi1. Add both the spi0 and spi1 nodes.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

