Return-Path: <linux-arm-msm+bounces-72184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9600B44DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5EF3ABE99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 06:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38699281351;
	Fri,  5 Sep 2025 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilMUjJ4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A55281531
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 06:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757052227; cv=none; b=f01tdAdQLtwKphjCH8TH3lSo7g5v7HmPMHCZx7Z39EyC5bKVbwhNn3vHvstiEM4ijmTYH6x6TESWfqoODgjU00GRS6Khx9lETB51sZu/9CbVIT5r/GtICcYAQIYzRDL0E1AVa+vZ7UpCITOdmiupf4I1Q8Q6aDYwGsu4zMMY2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757052227; c=relaxed/simple;
	bh=XN+5aQlGOPpCg5kuB4dzTGHmHG8kh0hknZ9S8kXByDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afZzqCYaj6qWU+U6QRe3GqqMU+Bv07GfgD03ZeJfao5zz9G5YCaczzr0tw1ovUVMzWmVk4zjn8Q6SzNtmpXLUye5lV63X1Fz2ah7Ye+2At8vdeIusJmu/fguDrqFZtaviXNhp/SVubGHV67g0Pv1i3iSyCXXYsbzy8uRyb5sZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilMUjJ4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IAL4t022145
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 06:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGF+J9AHsEJF/xc+w0921V5m2G3QCbk+R9u1525NlYI=; b=ilMUjJ4GJYJ4V2db
	RGdca+Bto7B6+mecW28GEL8Bgzkqygm5U/hZIiqmCq0Eqj+ZJkOIq5gMql+wsJYB
	7FZSWIfm6Jgw7M7VZtHrc7W1EUgoNryASQsrmX2q+K43gKbT/yYMsntxsq6Mm6vC
	JeBmwzGudnGHhuewwRy7fUiDw7NAQTOK/FZ4XrvEFcX8hh8rBTAfd+++CY8fwD3+
	hoyAGIHqMUfk3y50l9+4ASOFTfEYnORb/mn6+qQO1ofEE5v+vnZtRUVmgjzj9VnZ
	IHFE3HkpLU6NaM8XmO6yQSTBX2w2o7qQRn2/pZ1uSbQSQTVEHYb6+BJ/7frABO4h
	IPb6Xw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk99vav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:03:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4c724d27f8so1237980a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757052224; x=1757657024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGF+J9AHsEJF/xc+w0921V5m2G3QCbk+R9u1525NlYI=;
        b=TcF9AaF5raPEhD7P4Y38dwWLIkuVuyVJ7yqw81O+XR5HuzMifkvT53B+Z8JYm5wvKj
         7qdkJFvJ4sFuTiOOf6+OsMmNKnuylgFd0Zlr0MFx6i+jTRQwtxkK0NOywk5BhA+9OaU5
         hI/+1cnUnbJj0e90K2JcKPsDqnE6Dbgq40UMZ8UaZ2swwpna8q8avv2/1MJjSkrPcphq
         Ed08kiYaUlJ9W8YgOgJHo1T3rrlbeA8W82ADlbhkBvjSncVw5uOx18b0KgQVkXfcl327
         xo/s9GNeC7B4Pg8ag8sj5NqSRI4JUugRHWh6SdWbsjGBYL4/y1x7ZX0a+TxK61idOVCr
         qRYg==
X-Forwarded-Encrypted: i=1; AJvYcCWyM2xhVVAjCRqbJE1BjEoulW7WtojYN8UZQMlMTfew4P0RPH1Laepowb7STBixt1ICXV0p3b05o7tX7DyX@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEP57T4jpRMUah+VkrQW5lOeTY2GxOsUtGMt6UyTAMPLx2T0F
	ugs/snKS+1OBr4W7KOR4QAq7VQrMh/dRFypB1R4NBCWyFmtaivxzEbYdVw2SfRGRfgfz+ehXQfV
	a61EFMqgH8xECbTOdb8XEegJFffo1O/Tu9FJItkGYxAijocUUFBkEP4Q5o2otz2gr2tDZ
X-Gm-Gg: ASbGncvvHSf4fPTGR7aRZjz3sI8RqNqSPoaFdJt5pBKvvLqxK/+rgauw5Zp+zYaEgaj
	6g3RBrjVSR8eoX6oEjZYmdVVJEcKcU+zMjA+sRhf1oh4NGcdFrxq7mPm8gcdFNbPEOBadYvNbrK
	BLDKVmUAxDT1GU+0EJFDoQ70NyKZxbYGej/tfNY6TBBqRRtGbMosV+iViBQntJDZBVJQZtvLW5s
	XfB87ZEtgZbiTFbhmQ0i/bYnCAF6bxW4HGXEjLIo6ZK7e0tTVbe6UsoQNhoVkZoTti7rbnSlJlO
	mhJzvb/2eUuDQu2vzv18Ad+mnL5KCYjdHcupMvETKsPLexXMxkYgFXXg9O2Y9/4HxArOLktHOXs
	etqPx7nPYaH8vvcRgMWACsQPMS7PBCSC4
X-Received: by 2002:a05:6300:218e:b0:243:b565:8c1 with SMTP id adf61e73a8af0-243d6dd4fe1mr27516564637.6.1757052224048;
        Thu, 04 Sep 2025 23:03:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3utsGupNyxFAAMxIG6Rx1/K4D+J2MZctOvdwD3MKC6ir5/a2omsbuTj31yhSgWBsRgZ5bfQ==
X-Received: by 2002:a05:6300:218e:b0:243:b565:8c1 with SMTP id adf61e73a8af0-243d6dd4fe1mr27516525637.6.1757052223584;
        Thu, 04 Sep 2025 23:03:43 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b520eaf013esm721659a12.52.2025.09.04.23.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:03:43 -0700 (PDT)
Message-ID: <c4227ca8-f24a-44f0-8f45-1ee42a34b206@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:03:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
 <20250904-hamoa_initial-v9-3-d73213fa7542@oss.qualcomm.com>
 <eneg3nxaatpiqvujxnvfexwdgb7mufoi3qn6pjsxh42e4n3tqz@npvgjdh5cu5h>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <eneg3nxaatpiqvujxnvfexwdgb7mufoi3qn6pjsxh42e4n3tqz@npvgjdh5cu5h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2LwJ9mZDteob7AgoyHmThbcYfXqJ8CUd
X-Proofpoint-ORIG-GUID: 2LwJ9mZDteob7AgoyHmThbcYfXqJ8CUd
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba7d41 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DVxJuRqVII--7E6U2AoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXwcCEXsqrKOFx
 hJkdWhfVDGpFgWw13kYVdyHvP9jF1bizSsTiwfVxmMujy3vyu6LtMLMs7Wsb0XSVH4yPm5nAbhW
 RZHnRUAHFsOIPBtCbgWF1nJdZvkauWGbYJVTEwQASqLNDfdic7r2YbfCnIvksK3G1U+8SX6MH6z
 7Hk9z1hE1bnwfYQs8tlflMDaX3rwoeVmyGaf0BeKlTpwqOwVVIw0gt4oPgxOpena6sphyC9ZahN
 F/I5hAheNiwfeUDzBT+Z0KXJADSMgM0Vtgw60NS20Rg6b8KclqED2/hvl70b2Pc+v5tkBpMgatg
 /liKZYLppo2pbTfN1hk5GYUrofDI7uU3VYQsIh7Kq1g9YKBr9UmCZlkCET1EJNk6qaL/ccaT0t4
 546/vuVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042



On 2025-09-04 21:58, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 03:48:34PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables the following peripherals on the carrier board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
> 
> WiFi

Will update.

> 
>> - Graphic
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
>> <quic_yongmou@quicinc.com>.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1248 ++++++++++++++++++++++++++++
>>   2 files changed, 1249 insertions(+)
> 
>> +
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
>> +};
> 
> Why do we have DSPs in the SoM, while GPU is enabled only in the board
> file?

Thanks for the reminder — I’ll move it to the SoM.

> 
>> +
> 

-- 
Best Regards,
Yijie


