Return-Path: <linux-arm-msm+bounces-76181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2823BC0F39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C08BB4E3934
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC562D73B5;
	Tue,  7 Oct 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psgWcGo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FD262FD7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831415; cv=none; b=ZY5EbNDxTQofHCYBRI8RkuteP3O0MexrbJhoqca4uZyhbC5lHQ7FvF09WvwANI6oJF8fsmX+eObYUKwW0LRx5KqPqLevKeqVGosYLYt+BdXkslivgSbAU+Z7HLVB0Id+O0loLjdiHZ69gbc/LBbfVu43rZRjLZPgPwKYPz0GqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831415; c=relaxed/simple;
	bh=L8Q2C5/Ub2uJq/QGtFgBbZf6xb9DzU4bjBeSblXm4p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8VrG77xqIfgj2qJfQcaY3WXeN+67KMFmosmMdJuSygeMiQCNHbwV0B7goush11E/SVi3D03xal32K4Eki7Xm31nrfZgoq6mDuwGjI+qvq+4BA74EJOgXUjrWtR+3BMRxBA2wVkf3UsGqUmQCGxdvchLTE5MAb25kKHSfQGM6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psgWcGo7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973jw9h026712
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=; b=psgWcGo79wVpASXP
	74n0WlpHkbJBz84+WKHWz+uGBu2O8olBlalaS/p1XxgI1WmGdocD7He953nWCP0P
	HvCg0dTv1+W8S19QZ4cq1KO01D2R1kUAYkbHm4RryWf1emoXLBfIXcnITM9zuxtb
	Vb4fDKbKJ+JbK/1hhyLryTh0BljHq7xdtVUTSt6m8KYqhamzLTkmElvSYJvIp4qp
	0tsmnPKELwAZdU7KfBDH+JBaqbXiYk6knrY9qhVClmMBV9a4MXpo8kw5Eeb+WMHj
	uF19CZ4oCJJrZceg4uGmo5dDfak8Pbi+SKObWq+mNA+o84jy0nlHjQ6ErUj76DbW
	shIkBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0jk41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:03:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-819d2492a75so281832485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831412; x=1760436212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=;
        b=v8NV9zcw95D99vN6iFe5ipeUPvciavDmy8w25cTARBxPBG+N3kHqnzsTBCL+32ui9r
         7+vFe3CIrfQRctMI4svWN/FmLYi/J/GZKronqpGOpowszOZ+tgiBrx50DFZLv7XSwXZN
         YeY2Y349Pi/pH5qDGP3OZvMUcWw9t+jhxXDj3BZYhIcSkPuJtCKg3WtuF8cKKKV5GTm/
         QpUjoTc7ho1yWHoKnL/6sh288vKFNZzYbKTEsXkxnNjxmSaYHS4NSXTsvuwINzqRjl5Z
         RCcikfhZ/afhN+BoS+ndlP04ZNWp1dKMFf1f1ImPMI8j5IJAC3lJzpryIsDZveacESF8
         kuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoP4CVIY32n80H+mFVE+KHjtq0+7AJrHvzI36pudajeQUePp3jlCxqQqRDxKDvAZmjxAd2PB6tH1k1xXQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13lAOOF/P9buKiMyy/Ds+kkx8+o4gOqCmHkA973qt6ZBqdjTT
	PzPpzUvLEe3fIn1N8fI1ZbCdoMf95RqhiorGTWc7o5/inPn9Mj5qyGCkVWDSf6HK+0TBD/R/EFi
	JRTNkDDa2BsHXRN0y8JA6/UapCUATIx/Bema3MOQTBFfvnonb5rXtrBLDb2KeVqFdSEiM
X-Gm-Gg: ASbGncv0Gyl5+UV+/c5/bHhJJTRxVLHN6MWuUPLPSg7X/VfzzmXA8L1490IbxKja8RZ
	J80mNOp76rkkSs55267zRANzTOBnWTpO1nvY98IgUQLyCLhwxdFtUAyo7AIRmc5t2qEDz21iz9F
	wC7F7k/iheEih17so5LRi9LjIMAMxeb4GFTf8qbuMmQVsO3P1Z8/PMhX3GvUMjFV2XIvxRSGwVe
	e8281viY225K4vlY3EOoqyNRmG1ucmUUo//n0Zwx9uwDn2DO8aBhuC+mZV2gmGk8RKiqOvD0f3C
	ESkwmgw9YAo+T5Og0aLL0/I0Vd7Jzh0bGJ+Eed297QUZkk17WVj2Ge2NZ+cfuRzUIrVPsRSawl3
	MyKBJxe55CzI07PV3zYt+/Io09MY=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455921cf.11.1759831412047;
        Tue, 07 Oct 2025 03:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH595GqzjdhPhPl+ER5dVZJGuod+xlkaWX0Q5/bGA/gl6UrOFg8YE+AYMFgUODCYAkuO8cjhA==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455621cf.11.1759831411403;
        Tue, 07 Oct 2025 03:03:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c1f6sm1383798466b.78.2025.10.07.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:03:30 -0700 (PDT)
Message-ID: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PNisuM9BY49g2Bt8ALni708I-V0DVyJi
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e4e575 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=e3cHK1UYxX7VBDkIoy0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-ORIG-GUID: PNisuM9BY49g2Bt8ALni708I-V0DVyJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX32ldFjfDnJgR
 4ht7wpVJaI1SmSSXV0AiqT4wNCb36tZkkwAX+XbEI++h0wDfohA++rFkiJKKjIFPhuYyUWZhW9F
 m7F/ZT8yv1GSvdILd0fjZjgmxi18RCjc/obolevOxWmSjVae0upVxy6nzWxD4C7Sf6xvxHcVdDL
 jFRPnfaAkAzm+dfWlph1Re+J3ZwmByszUSYO2oQ3kh/DM0YQthqNLwDFJCotKjISntx0ljdrD8U
 TexATmG1x51gH4KJ0q1o0q8kP/HhHHBy7VgjawjjaD7AFEHwy4tBLt9Rpt55O8mSGshKpPKEa/7
 +ZjroUK9JAlTPMw3lbN8ktuwOg82Ku2hDc9vJXEfaTQE/wULdFZmvNhQ0eGCS/MJi9rZN4Oi+fY
 f7BR+FUOMWMZWxj5jVkT+FT3QA/sUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one amber and one green.

Do they form a single notification led, or are they supposed
to act separately?

Konrad


