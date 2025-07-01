Return-Path: <linux-arm-msm+bounces-63145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49258AEEFE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AF053E1BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B040A25C6EC;
	Tue,  1 Jul 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqzinbpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D46A78F5D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355631; cv=none; b=Rn2f0EbTUAMi2fEbQFFw6Dtf6VFDSkKotCF1esW3bvK77xJsp+LUKvt/mAaAjto/sEaJPgTq8S2aiIg9I9DZqCEIOxkH2HSfDiZqbTi/ya8grkEY+6H66RUZc8l7D0vPHQFueheb/5GqYmL5Wqa7yD+5FG4/V4AKNhSZdNXqzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355631; c=relaxed/simple;
	bh=yD+gTzX65UHJgMgaHXUtRp/UqZB3K8WSvA4L6J7/iWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRaniUZNodStkqWMhsAGfGnQdkbuQKAjdhHSquNhI/SnFeB3XpkTFfzR4STQQw73wSu8ZcfUI3v9exqD+Bazx/FSS8xlU4F6ZcAuZESoG2w969QXeaRyvlYjUZyWXVpB+xu+/s1bODIkqbKE6UsSIkzazhvczhsJYAL8OBUd+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqzinbpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56147twn018581
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 07:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FJpgLVOiD37cYFqSGkdmMgvU4F7xSlbYlGdvhvvuUw=; b=kqzinbpDsgdG2QUS
	YY2Sstvk7QTvAoViLiWREvOunSo9e/Al7nwST0OPYVl4JWej7BeHIDKz/QBXQOTX
	ca/3bIsGLLUASNpzfkLQ4eGD77nAUhwxBq1h3nlc7M/+l6LE5s9+GIhj5maSSCxk
	H2dGNHGDh6pjJMO0OVX1PXYr3r+Ri4e67rfu++1/2xdxYg+IN0nGVZjqJ13JI7z3
	BjUNz3+QhYVjwzOsnQBIVE1M7ubOYaTs9h54dWJy2KVs6bBQ2+bF71XauaHKOx3X
	nlqo/HnUuhcYSKn+e3h9qju2W9J3Y3zZwxiqVXZYqfTwlubECMcWeQvk8FXIUbwK
	0KJIMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxfn38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 07:40:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eeff19115so7196480a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 00:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355620; x=1751960420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FJpgLVOiD37cYFqSGkdmMgvU4F7xSlbYlGdvhvvuUw=;
        b=JZD92ma7CnQ6KeKmPekMK6VDRSyJqT7duuxsQdDASdjlSb04wtsJmDB9vXvP+mIKSr
         fSgxol6tLgc/zFqKdYPBvOoF9w38HOwyleY6S+2+Ufp2IUM6uJc6XCqPLQ/skV2CIv5y
         89WCkeuAV4Ub6Xz//+cLcUN0eVZ+2a7ZDKmvzEGnmvy34DAtZdmmu/uNRiQh9r194SAM
         f7l/7A3SZt0Xcd/uP9JrIRD0POb3ObIJuAdvRcX2Hr4ILaf0anDUPNN0E1SoFtzCo13x
         MbCG9420XNclUJoRTBvxb1mrCmGrNWeqFFv+ScpxqMZLYUXV3xn469VFUC6JBBOIamsK
         m+xA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt4dBwhjQHgedgBdJQgp4PFg8TDPHFiZDfr+TxAt8mlL7oyVqehSQQN4aRP9p7ESbcRbWliY4bVSLxiPq@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIB/KYjhFkuFpwMqVTjGo8riZmlpteGUHt49iogVE9lxp5I1y
	+7p8XevkN/TnTgUrdr7HYP+5zUxLK2JIzfmzYdiCqsC2eCpnQ9jrt8EKlC6usyH+ACppWA6Iga+
	rM7V1NbWXr7zP2Mo0UrKIG33lij47O5eletaJ2VTB9xiAVWHDCcP9KfVirj3NW3/D9sEf
X-Gm-Gg: ASbGncvzELEY4QzpoSCX1jmXosRI3CErxNKRYwHCLsm2N93y+p0d+4SIMFwco3Ynpcn
	Sjz6rcHw8XmMe5eG2WrtgevF7f0KG80mxP+vLS3IJh9Xx6giZGqrfY24geqLmyEKhEJJKEVXZaw
	1TyzP9wZ/w2ekVMxqC/0A2sYsMwVhgeIHr6hqIpi16tc2hnWfUCE9IsuR9sw9vuuK8BVbR+vZ4C
	+w2uhC2DjL+rQCKe184qxXkEuC5jXWTVkZG4rXfZd0dBSymyP6nyx7L6KbBGXu8JbWkFCEeqPCt
	EoNyeTsD6oHTR1S7pKG2Yi5mw6C5/TY28HRg6su4OuFVFsVlUZOI
X-Received: by 2002:a17:903:1a70:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23ac46270f7mr205403055ad.30.1751355620401;
        Tue, 01 Jul 2025 00:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6PfU55PeZ0THoeIsQvpLSXshyFj5bq+0QDrT7N2DDDg3D3DoMl91iR6zJ6C30Jos6dGx8tA==
X-Received: by 2002:a17:903:1a70:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23ac46270f7mr205402505ad.30.1751355619911;
        Tue, 01 Jul 2025 00:40:19 -0700 (PDT)
Received: from [10.92.200.128] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c2352sm97622025ad.208.2025.07.01.00.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:40:19 -0700 (PDT)
Message-ID: <d055d163-a0a7-41c4-90e6-0606f9b6eb89@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:10:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] PCI: Enable Power and configure the TC9563 PCIe
 switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <ps5ck23ubpo2vdxzko6yixujlf7mqppdssqrc5bz3vbupmn6cu@yc2ld2tb3r2b>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ps5ck23ubpo2vdxzko6yixujlf7mqppdssqrc5bz3vbupmn6cu@yc2ld2tb3r2b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MyBTYWx0ZWRfX6TvJIDBVP+aE
 KuntqKTK1+hopctFrDlS4FfXZv4vyYEiGZ0PDzytqai7b1vDOCkT8db38Ol6qYQFMdUXM55vAeW
 kNgrMnnfY01JUTYoMGRRoDm3iGq3ZQYAxdnTEAdz9MA9310h+kN8W0ab9Oms+OWGNIBG90bS6Bc
 YL12dumf/9YgheL8FE0PDPpYAD1rKGfp+GiNyjUhADkAvn6RPJV7ZpFhQifbhg2Q85VYAjaRJiw
 RMNkmmNxPRiXo9zXMXiwyWcLtpJpcaJ2NME6nrpS9w+Ot/wsVxGKIatyYSMV9r2XpI25fub1AUL
 ei/UEQ0Z/7WV7yuRM5DqcfXyz76VLDuO3PkQ31peY+Ey+zRItiXhuWYzXzi4rVFzjpbRnxVwkUq
 qIWtmyW3tjGlGhiHV6RUH5LPivw4kWkX/3B6NmTFthOUHAUGeKPWhC6Xnb2jGeuSInN5psHp
X-Proofpoint-GUID: dT3HE5i7LRqizHcVNW0OSYuA8qINzwUh
X-Proofpoint-ORIG-GUID: dT3HE5i7LRqizHcVNW0OSYuA8qINzwUh
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686390ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MuaoRvlZ_d6aMCo3pHsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=932 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010043



On 7/1/2025 12:41 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 12, 2025 at 07:19:49AM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is the PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port.
>>
>> TC9563 switch power is controlled by the GPIO's. After powering on
>> the switch will immediately participate in the link training. if the
>> host is also ready by that time PCIe link will established.
>>
>> The TC9563 needs to configured certain parameters like de-emphasis,
>> disable unused port etc before link is established.
>>
>> As the controller starts link training before the probe of pwrctl driver,
>> the PCIe link may come up as soon as we power on the switch. Due to this
>> configuring the switch itself through i2c will not have any effect as
>> this configuration needs to done before link training. To avoid this
>> introduce two functions in pci_ops to start_link() & stop_link() which
>> will disable the link training if the PCIe link is not up yet.
>>
>> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
>>
>> Note: The QPS615 PCIe switch is rebranded version of Toshiba switch TC9563 series.
>> There is no difference between both the switches, both has two open downstream ports
>> and one embedded downstream port to which Ethernet MAC is connected. As QPS615 is the
>> rebranded version of Toshiba switch rename qps615 with tc956x so that this driver
>> can be leveraged by all who are using Toshiba switch.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Krishna, the series no longer applies to linux-next. There were comments
> which required another respin. When can we expect a next revision?
Hi Dmitry,

Mani asked me hold on this series as he was working on some design
changes on pwrctrl framework which can impact our design too.
Once Mani posts his new design I will respin this series.

- Krishna Chaitanya.
> 

