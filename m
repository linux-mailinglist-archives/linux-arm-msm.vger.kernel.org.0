Return-Path: <linux-arm-msm+bounces-58185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F465AB9835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDCF1BA7A6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C4C20E71C;
	Fri, 16 May 2025 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOy6A7NP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE031A704B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386054; cv=none; b=GkX3t+2WUMwjhjbsXIhtaaKf6OaUNhEKMkX1SJUrUKqpDGdNDnTny3n2SY9cUCEcIWXYLg9P+8fKDe6VKqc8SUWS8+mKZjTZA9US4loVlyQWvb+pv85TKzzSLsZUUnckPeQEJOuws49td895IHED2vMp1Ext0bTuRcO1pe3hyYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386054; c=relaxed/simple;
	bh=jnZhFIc60EpD17GuUJxPaSX4JS1jVvOVrSRcJ4Ikqws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj9apJnnGEow9I0Be2gYUyITPNF+PQ8pKg8V6vDvD1pUGQA8wN1sYGubFnCUYtLjstgH0aMpxpM73LimjQVO6JXqOq25xuwZSDxhJVVGqgZyNJ9BkD0ZR/JP63FnBADL9Sfqh9WEj3+u1I3n2ut2J+uCvEzx0JRhUlCgswtIdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOy6A7NP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FMinM9022658
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emNqD3+84OsoC1sz/sXLny32zR/CcxC3pmnwMkCRoCM=; b=YOy6A7NPx6grlFyP
	xIY8FjBE6HADmb0Dksh2OqNTkJCjHnpZl9scKhjH8jipX/dAPYOWESQPyJ7aH4kK
	o8mKWhf9m7FNJnJAqUj9aFvPLeBpMrkOkugSLQFf9jEQfGyKZcX4RJMc9sDcyO8+
	yNXuHxV7nZAjApOBM18obg3e0u92oWcD7e3nfkxOxBpg7xf9b/usDQbvxNigP4g7
	PcZ8W9IQXs1ib/TSOvT77adv4fmIWMeo2JtCCaGsx3VKHzwMUgdYXvFlycEQ8htT
	hc/zXNJkvnU3yaw7XIYfNIyyYNH4qWCJnt6J5LUd0XdF1bcm4GS5jsaSsQWRjARO
	A954PA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyshqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:00:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c8929757so4746156d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 02:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386051; x=1747990851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emNqD3+84OsoC1sz/sXLny32zR/CcxC3pmnwMkCRoCM=;
        b=HFMnFCKlp2CyCzllGl+ZxVknjFHP/ntqcx+YO0sgJsACsAleLPZXYqQYYWTe/aS6m+
         Eg/2yH+nOVVDHfjhELJGHozry+hJkkGlnNKJgDrSIXHTHZo9llGd7O4UMEzrJyj1pZIU
         fA7K2GV/GAxwFifmHQImCb+YQ5DstBZ+fG8VLQKCkGlyQUrD3QvHIJI1eoeCpc/HI9Ej
         zMt00vAjcsgQiYDzhTFwg66JEvBaBHT1tnqkYyj1sG6pZYEEGPVuSH9aVZb1qCPrePAo
         uXBw4FwtgohtPLpovErQwbz66HEsQFM9uXaLBjifEwNbID7HuXg2RRoa64GFwCqIyWuF
         ghhw==
X-Forwarded-Encrypted: i=1; AJvYcCVfcdspdQvEn2FlRhH1ICWPRZpjZyktQ09FP0NwdSQeLXpHMTdd2r9q6OP03+RATAzqv20YH+DxmjZZ7lHB@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgppGV05ofnxiCtI/yEBOS4+G7Xkem3Dsv3txW0/MBBp+RDaP
	BTcYaoHLrZNvz5YLBrG7JPVszW1ImnTn3e5qK1uKhj+IYhOzFOdAo/HSAlyJ2ff1Sg2Hcan2LBC
	FKDIv+Tlp5AYFyjhnGb0Gy/kKEDqChmSX1LcKT2bKhc94UA1+d5JZEyQfmgmnqArLcEX52uruoa
	2t
X-Gm-Gg: ASbGnctyZVPdfYuY9b8UNotbKAM9dIcQyTY0S5uyuBQ4ZXHAb51MksKrmsXr4arZwco
	Fp7t/4Cx6bpEOpIymmyhW02paY9FU9cqqKYhu349Szu4X+5Hnr+QGRkI5BCB58iqKAdxSVjNPBL
	nqaN8ak+BPHa0OdiDocO5wfd4v840Z7s6+2leHqu9HDPHeY1VGIkynLsbusDn++bA/ViGLcJu0C
	Lbj4UyHdT9wwB1Iacju1EABSc1hzcZy/JLfmMeFto5PxQFeitDIv36Q1OAnaWeORrL83QEHTSHJ
	ZgZarLygudClDManz73mKnsq5KQRGqUfWeYzSqHgWXI+/rDhHm46YK41ScR7hoeZyw==
X-Received: by 2002:ad4:5f8e:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f8b087cad8mr16035636d6.4.1747386050673;
        Fri, 16 May 2025 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFssDUTPLfA8FG52oie+qg7EwCQlej6WrDyiMpP6WkKB2iMQNNW99VeHioL7oGkK8GI+fj7kg==
X-Received: by 2002:ad4:5f8e:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f8b087cad8mr16035296d6.4.1747386050098;
        Fri, 16 May 2025 02:00:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e019asm1055150a12.36.2025.05.16.02.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:00:49 -0700 (PDT)
Message-ID: <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
 <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VF74B6GHL2xo0EE6yVNNdqfzFVjaTkOf
X-Proofpoint-ORIG-GUID: VF74B6GHL2xo0EE6yVNNdqfzFVjaTkOf
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6826fec4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4QkPWBSfZRwaAYBdk_UA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4NCBTYWx0ZWRfX/3Ga0tTwfmot
 8vbWuJlOQniJXOncrjJxEz/gLlrJMqsi9ie4Jg7Vt2VPsFeS2d0izJWoK30Q5jXApYkb/2ccbHi
 fqO/LNJQu4ygnnHq2hH/zkDiHDE8ij1UvDUrjvMPdqy7BJsB6kG4L2kajVa2YdD5yv+NK1GDZES
 0Yyehqzv7EZQIoSuPiEclpCWtSt7rustYNXZQzmpz0MhPQIUaJ8iH7px6+wF29/dpgz52vnbDPJ
 YuzaDWyi7++1EPhG2M8oK2dAEnFOW3i/k5Ju7kYmTJ4tfLsevSTbuCAOTiTElZTqt7m+3+eILbh
 OAjPs0Ozrqz9vBfRPTakGN5uGhWds4HWZK8/fLYFGjrA0Cqry+gSZgArg4LuAghoZxUtvp/9nmN
 WxZ31Pr9cmEnVpWt9e53JGId9o+dxNPKIJ8NqRGBz8ZRwec6wnE0aeoiQXe64GQX0xh18PtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=957 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160084

On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> On 14/05/2025 13:37, Mrinmay Sarkar wrote:
>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>
>> The maximum link speed was previously restricted to Gen3 due to the
>> absence of Gen4 equalization support in the driver.
>>
>> Add change to remove max link speed property, Since Gen4 equalization
>> support has already been added into the driver.
> 
> Which driver, PHY or Controller ?

Controller, see 

09483959e34d ("PCI: dwc: Add support for configuring lane equalization presets")

and commits around it

does this change depends on the patch 1 PHY settings update ?

That I'm curious about too, but I would guesstimate no

Konrad

