Return-Path: <linux-arm-msm+bounces-88803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53216D19B05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F16733020B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFFB2EA490;
	Tue, 13 Jan 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWazay0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6N09HGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721B2E62C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316409; cv=none; b=R2vvYKJZ0tDR8xhCvJMvNvkoaGgo5onIQOHhHjR49nXgj93ME+UpkKXsHclNlW0ZjcN4dhZuO1LLwcQGPqMqV1kLyFlG1PBSqX1qA4xbO7mwOL5Q7O+P/wAWZ/zPtataDNI0pyKqfCNYr56Phx3dJdJXB5+c8WPIhSDc43yV+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316409; c=relaxed/simple;
	bh=r5bVxz5fd5226yh5qcQYbAXqPX6xGUFlKgPtj0iHSHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9o2HGf8FJXE3w+5DjGNM1UsVc9JzferVHtPwPGhfuszFWTp0Qm3kZYiViaSo4AmLqxWfEUqQkVpYZCUyD57CbswPOU6V+49iIxZ8+hotnxySzBjsuOQ7NX+N0IWUDIn8eFBaj6kUDlu2FBqDT9DHlCkoTU7fLjdzy4hl/NFw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWazay0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6N09HGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDXvS4164859
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktm2n2UyqtKwdocxHv9UajYRbFEg/OQhxiByX9habIo=; b=nWazay0WqOMfywOg
	iGGBIxweKZ2XEeCo5orxLzaVrSuhlllOTp3FOrLPMzK7fnOTe2uf6BHRr6yup9X1
	qfboyLflN3qKpY6Rj4S/eqD5am/9AYafGo6BwVxxR/TNcEoDExhgs+SN+SoSxeZg
	JEQrZ2ERM/juSbZHn37MwoTzIVQGQ+HO7GtLeKT7mZFizIiqTb5s3rg2luN8QBD9
	wQBmpx31v9xh6ixBV+dmUJz3MS+snEmoUNM2fMryMMTuNJDsMDjRdt0p3bK3bgER
	yPnBFsjsBMHB/bvD5DK9lt7FJYyBfHeJgQUfBqv6FEyJOaO3dUDoaXf5eXs4RZBV
	ZhFOiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rnky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5265d479dso3869685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316407; x=1768921207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktm2n2UyqtKwdocxHv9UajYRbFEg/OQhxiByX9habIo=;
        b=a6N09HGJoAbazTM5cMyJAKlpXFJId9cVMLudx7O+WZNRJW5Eg1X1TXttqZIui7aWTv
         gTSUBq0m1qWF+BLoKytmoGqy5B3zOM6EFbafmIXJGjOhDqFxjQRrehLpvw0XTAJg1Phy
         YeD35H9+DFII/q3UHSMUeU5zWQJjnGRGsDoW/4DoJefS7b8o6xop1CGBPj8+a6HZzRRc
         /6MejQuqj56rGQ4nTaTOO5xjz+a6WkTc+vTHoK/wsvnQJqSTn68w5IK94TXiPOCG+gZ6
         SWT/9aVmw9zUQaxGOUXL0TLFXvjv/pBGFNSLHhg1t6/cVZDeciLXI6JniidM0x8x8TkN
         nCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316407; x=1768921207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktm2n2UyqtKwdocxHv9UajYRbFEg/OQhxiByX9habIo=;
        b=uEb4FA/96gHvSFbQKj6H3G8o+FCmQVioUNrieI1e66p3/NZpT0qkFhBjFkIU6J9OlW
         aSNpoc9StGUsg/TifFmXYk76IIhz2w37bpWkf0IxH4rVh0H5RJclZ03wcwtdvBgunrjA
         BjkiQtIxWR3cJopal308v5m2z/FiXoDznCM5GUr5Iii+rpuScXELaTNwA/i8hPbqHcdC
         JjKiCvpMhdpXJ6M/nZt4zSMz3dpjBtpb9VD/lLo0uyuj5qgahVQrHSHsgiRWWvQyV76p
         rXxeHlRHpsEjOO+PgnanalUh69YTdTccFU6808hrbOwyTlhGrpS4RJhotCcJXDtm9seU
         b34w==
X-Gm-Message-State: AOJu0Yyif1LfPhceDEHbZrBBkmzOKgJKE9CdHu25WzacJn7gcv6scHvk
	+aDmBzk6+Nf1Uwr9h57CgKtkm1MZR1eW5e3L2qIOHI2d0gnWNl6P1mg5v/qaNIrTCPSwJJ/CPiF
	/iGI+y4lJii1gax4aAk2YT7YEVAhxCM3mXbZQk2Sme7g6pWbZgXxBwef9ZmTKe2vjCcAY
X-Gm-Gg: AY/fxX6svNC/ewHJx0puM3FPMgWdNN9Qx3f/R4zA5bpC66tJ1yTcB64Fgj9QbJmawvJ
	RvwoQtw9EpTrsf5S8MJsAPGZnRC6duk3Lg4weN+IYq8K8wjs8MOc3KHkTcGAQzLhJI+uBEvUlei
	yBZFAr5AA+w3Yt1zXd7fBjyEkeJfzx+PIJrsCeLqfvAhP4iBgWeOVy8FDv+zd5Xyf2T/SHzmc5a
	7CFmcrrWU8ZcMIRirwfRAsXjH7dt1M6PdDCy3tfl7Ozz1Wn5pAZ20c2Uw74hOHpNztPcd2LWMDl
	jKbotYo1wFhUB4y4IUqCgNZOiiyTkx0YhAnDswgG+jfsMTvE+fEAdRLyUYAZ71VeblObttGcUab
	VaWjy8wPbP7zEbAwFIvEut7sPXLpcQslma0BHgdgu9uWk+q/2fVLebvNa5Tdqd3to5Lg=
X-Received: by 2002:a05:620a:4620:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8c389399eb0mr2130317085a.5.1768316405189;
        Tue, 13 Jan 2026 07:00:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdONpxl9J431dvGAQAnM9vO8ucFgCRI0lQsiVnjL5pNFyfzCrP0QoJRqVWlJoEgu22V8539Q==
X-Received: by 2002:a05:620a:4620:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8c389399eb0mr2130311785a.5.1768316404422;
        Tue, 13 Jan 2026 07:00:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87099fcef6sm820866666b.22.2026.01.13.07.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:00:04 -0800 (PST)
Message-ID: <1fcb607d-f3dc-4dcb-b640-452eae750952@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: power on onboard
 uPD720201 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-rb3gen2-upd720201-v1-1-50d9b22dbc2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109-rb3gen2-upd720201-v1-1-50d9b22dbc2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iJgspLvEKYg_EwPk6sSfOmtdOMW1Vzwq
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69665df7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v0cVDqjUyCw1FM0saaMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iJgspLvEKYg_EwPk6sSfOmtdOMW1Vzwq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfX9MwUKbeA2+6K
 j378YX9sHWHkYN7KIARCAPY4EOJY4Gmi/g1SfHMO1ka3ErybKHfl5VjB4tk+dfUECPJ5OgHmoq6
 M76LA3dCPdidsl38G2QmSdqo+6Q9yZFcgn73b8S9xmoAY9KZSA9IrYNqPPaGedXIWfyVszduKGW
 iBJ/SsN6MsEa4sY0keZsLTwKj1je64pwF1ZIMsfWOR9fLYEh2VT7duqaQonHQfHNkXjqg0NlWlT
 QHDSAmv+GuHpWIRNZPya9u7F7ja3+FnF2CJeazzFOlPOBQBYIVkOcTClao7lZfKTdNpP1KgGtyk
 30jyuwW+25vryf28uxipclb/iUDAq4fvq1psHpRUDiwJ0Lx+E3MeLkLpQvA14VkAdVWYw8ykPQ5
 MndUTsm5pphlAbl5UJxzNdfgfmRecvAQ8zcvlhe5jA823ZpyE+hPSZeSGfJ4FFbZc+IfZ8Q0oX4
 bfdHAAfn+7xz+UpnP6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130126

On 1/9/26 4:30 PM, Dmitry Baryshkov wrote:
> One of ports of the TC9563 bridge is connected to the PCIe Renesas host
> controller. Specify the voltage regulator, powering on the USB host
> controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note, with these changes I can't get the onboard hub / ASIX controller
> to work. Most likely those need to be powered on separately, but my
> quick attempts to do it failed up to now.
> ---

I assume it's connected to the switch?

Does it show up on the bus? What if if you rescan the bus manually?

Konrad

