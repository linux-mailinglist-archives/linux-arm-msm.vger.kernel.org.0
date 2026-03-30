Return-Path: <linux-arm-msm+bounces-100671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KeRBl4dymmu5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:51:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B737356150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B34B305DEC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AC037D121;
	Mon, 30 Mar 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvUJ7Pcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eY4uetEW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D539524D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853051; cv=none; b=EzrBhIxLp0bGaESkPvG5nXIlM9ns4UBsawTP7DOg2g0dOIdM+xVU8PAH6Bg5VMo9DJLLQXXAKomhqeOjH2gWriYYpYHQ4KkFJQNnrNEBKv6mdVXHB2Qw9WwhLF4UB6v/B5H+CWjuuJgR6URMBt7L0VzghvwA5aSbToJJbMx5l3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853051; c=relaxed/simple;
	bh=JNDnbvn/bke73wixgEK7eZfLAvIdjLwWV/VKde36B5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2TRaxSwY3jvS9ga9xFUYnc4Jeye0mb0STOwB3BmoYPxZak2K6ZBKw1K0oOXQqEwbR7ukIYH1/2FSQgG4olVGWAFx5AhQOt1KtT07sTkU4D1f3LQHkLp/ZqHFnriqoUbDPeQNZ75AALhB9yvhXqoKKD6g46SJTuHfl6Bnx1//tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvUJ7Pcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eY4uetEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNmPvV350298
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbQhAl4tdMY0ByMxwdtTvBXtZvW6ESKRFzxqbbegH08=; b=VvUJ7Pcx9fzGo5ZB
	45zeHZVpZ/fbefjKDFRSGFxcbKx/YJu0s0DiBmu+bzHMGClFDooFG6pGv+qe6uaK
	5LrF+CrloCz0QeaYHT2VwMptRm3DKml5kqIpZmn9off+YfMoHGe+ZhvahGequ+Os
	ztJWsfs4v7aojHzHznF5RA+dvrwT+O1sh2w0n7IvFWQOsLSWnkumBw0uGt6z5IS6
	j3Mz/vVY6oj/qcF4eBn/xzwpkNj4xy+DUhIUgUhAq8Ta2Nvz3FaZInvdyIVQVYsv
	DK/+yrpSBZWwDkLA7AmOgqMjSAzCeOuPlbFFai86TfXXDbREjCV+8y68JkM6zVu0
	qnG5hw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqejqar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:44:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7414516609so2701715a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 23:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853048; x=1775457848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbQhAl4tdMY0ByMxwdtTvBXtZvW6ESKRFzxqbbegH08=;
        b=eY4uetEWSkyCjK8dohtOc8ws9gzwvIhhlnkcWvfbDDDE/cmtE63YevImNHryTJRqFe
         ENfqKJqPqKjEmXw80sTaiUF0xugARXEoYaLTKWbNBF4X4L/znCsyaGxW+q80Rki3IKxT
         5FyhsoLmccbx+XfNLR5Dqd0b6Z13cREbUeoIG+iZkwZqFlgfYmv2NW/rRtSP7ZZV/DHC
         i+BKnPiu6xGfBecTM5erM+PDdX0Ik1BLREfuEEfBBj52z4EJF09P+KAlb+zwAKFpmSRl
         w90YaqB07uyz9tqhipSJB1nUdFsNLyjwpFCxG46YWOZjQcj1USwRT3CBAxErM7KP+N5+
         tsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853048; x=1775457848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbQhAl4tdMY0ByMxwdtTvBXtZvW6ESKRFzxqbbegH08=;
        b=AUy53zNq9E/EnPW+nKiFHCL1Qd4vEaeyPN2zbMsGDmS8SFtXEKjudaGUDiuOY2rXbN
         doRMJOMELWTAyuBayx3BKet6aKK53AmTZwtv3Yuyvmu5ritlTMndHMTzEoix1Y/G1UN1
         lPHob/880PkobFrx4PvCFD4oy2oWOvrSPeB0OScajoPCtZOug0WY4SlzjvmaJimpasBD
         0uwWSUJxquB+QvOm8JWO8Rllzw6QBoOdBYnJHtXFTszBDUBNPazrHTaxKON0xSxTqTxM
         fa60CRNHdKCicNkPlzEimq+xDIBxCmHmot3KjHuwr8g4fnZRI9zg3747EmL2QeL5mUri
         2AkA==
X-Forwarded-Encrypted: i=1; AJvYcCXjEmPwYus0pCbw1yh5gQEtFg6PPa5vkJ2qq7eRzlFKtxOhqCXMG4WmklB9dnP9xkofb/YaZpNDpFlcYOU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0fvgWhDt5ohT9kSp9fI8fRDIQpEdDGM3SYY4QM4GQUmhZFz3
	qe4rAlq+S2p0LVTymjxdH+w3SwCCH0l4DZoJ2OTgDHnTd/sn+I+Nzd9Zfl0MSEGQgLabD7Al9jJ
	6VNxGFX8T9fc40EPxyfPu7giGm76LNypkS3SDoTKsQwhbn2jBb3MLxFUzT1KldB9i146C
X-Gm-Gg: ATEYQzzsTIKja2UlsuhZjlEatXpCSGPxPvMz4sz6OIOi5w06RTxa2Zt990rtADxtiGX
	wPxu3+mSH4gbzGye6MVXw7TLBP5sOXmoh1qxcJNVuXsK1+I68PdOxTyoanfJtlldo2ktd4ZQFVA
	cq3QRn/ZS2pHTUHGz3Zoj9fnwGUo3uSd6gUuW2ktA2OrBzxxmhTXZOB3/iNBXIwrHzCykx1BHuX
	1wAHyWZXZTWkPY+jzQLfjLO1t8Y+JefOZxGDMBZhSs5J9RgsrWJOJ+TgtZ/jD3Y0+8pz3e6oViK
	VeyMS06Du6ZepiHh+9P1Rde6eCBLFO6VEHdc/6GTZomJ7WLalmlhT/0v4qvOO6PrnEHGd2TdQ8c
	eAeU1gMgWKPePaAthuEzSKSbhC8fXdELg6OBe8ntpBa1SuhU3OcQi+YkUTfpDcziOW8pL3mLMoD
	80/gEmylbAxZPiCanSKeomddWRRfFS3MVv7A==
X-Received: by 2002:a05:6a21:329c:b0:398:9662:10ff with SMTP id adf61e73a8af0-39c878491b1mr11763250637.4.1774853047155;
        Sun, 29 Mar 2026 23:44:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:329c:b0:398:9662:10ff with SMTP id adf61e73a8af0-39c878491b1mr11763222637.4.1774853046561;
        Sun, 29 Mar 2026 23:44:06 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917ba961sm5059303a12.25.2026.03.29.23.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:44:06 -0700 (PDT)
Message-ID: <e35da42f-e43c-4810-9985-7f51a1f5dc0e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:14:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
 <308ae40a-34f1-9b69-bfe7-150ca8ad1d29@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <308ae40a-34f1-9b69-bfe7-150ca8ad1d29@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca1bb8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=-kuFGtFKBxoBXFU99qsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 9U0p2NbIhcDRUTp72m0295h6BNVysAKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MCBTYWx0ZWRfX7uAXVcjdC26J
 r+HPg1YObJBTsXX092llDVYugUtpir8gRVUqocZCJByAMfbbsaV//H2hXd5wCeAp3ONPlp2Q75S
 0EgXl5kUtT3R/+d8qCkE7Ld2qbQTQgGRGhln9nOK8DUlsvdpZvf+5yKCIilkumNaMlybjF0mQmo
 d026rWcxjD8wWjGBOwkSACj69mFG7omUpxg+g93pRbIt+jtRZxjkjgCVmqwHv1HErvczPVRyvTb
 E5Q/idf0IF52FpkDRL9DK5aM9+GdzizBEPU0utEDO9ugvvWHtSOrOSAJVFhVFibuDxEc2VSf3CP
 4L7fmXAz5I/anACntON4kXMR36gZf2xJLV8pISZJ2HRs7OQVL/YNuuJxtzdFXwFaf8rVG0TThpY
 RFtNShZ/zWZQ0IDsayIBVEjP7zdZaBKCwrN2oZHcm5KQayFoe+oDr2MJ+mJ4uRWStI8XQr/P4DJ
 gFQ7LX2z68rf+Al5egw==
X-Proofpoint-ORIG-GUID: 9U0p2NbIhcDRUTp72m0295h6BNVysAKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300050
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100671-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B737356150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 5:20 PM, Ilpo Järvinen wrote:
> On Fri, 27 Mar 2026, Anvesh Jain P wrote:
> 
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  12 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
>>  4 files changed, 472 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 30ca84404976..536dfd9adff4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>  F:	drivers/misc/fastrpc.c
>>  F:	include/uapi/misc/fastrpc.h
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
>>  QUALCOMM HEXAGON ARCHITECTURE
>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>  L:	linux-hexagon@vger.kernel.org
>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>> index 10f905d7d6bf..025cdf091f9e 100644
>> --- a/drivers/platform/arm64/Kconfig
>> +++ b/drivers/platform/arm64/Kconfig
>> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>>  
>>  	  Say M or Y here to include this support.
>>  
>> +config EC_QCOM_HAMOA
>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on I2C
>> +	help
>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>> +	  control, temperature sensors, access to EC state changes and supports
>> +	  reporting suspend entry/exit to the EC.
>> +
>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>> +
>>  endif # ARM64_PLATFORM_DEVICES
>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>> index 60c131cff6a1..7681be4a46e9 100644
>> --- a/drivers/platform/arm64/Makefile
>> +++ b/drivers/platform/arm64/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> new file mode 100644
>> index 000000000000..0f883130ac9a
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,451 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define EC_SCI_EVT_READ_CMD	0x05
>> +#define EC_FW_VERSION_CMD	0x0e
>> +#define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>> +#define EC_THERMAL_CAP_CMD	0x42
>> +
>> +#define EC_FW_VERSION_RESP_LEN	4
>> +#define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_FAN_DEBUG_CMD_LEN	6
>> +#define EC_FAN_SPEED_DATA_SIZE	4
>> +
>> +#define EC_MODERN_STANDBY_ENTER	0x01
>> +#define EC_MODERN_STANDBY_EXIT	0x00
>> +
>> +#define EC_FAN_DEBUG_MODE_OFF   0
>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
> 
> Add include for BIT().
>

Added <linux/bits.h> in v6 to address this.

>> +#define EC_FAN_ON               BIT(1)
>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>> +#define EC_MAX_FAN_CNT		2
>> +#define EC_FAN_NAME_SIZE	20
>> +#define EC_FAN_MAX_PWM		255
>> +
>> +enum qcom_ec_sci_events {
>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> +	EC_FAN2_STATUS_CHANGE_EVT,
>> +	EC_FAN1_SPEED_CHANGE_EVT,
>> +	EC_FAN2_SPEED_CHANGE_EVT,
>> +	EC_NEW_LUT_SET_EVT,
>> +	EC_FAN_PROFILE_SWITCH_EVT,
>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>> +};
>> +
>> +struct qcom_ec_version {
>> +	u8 main_version;
>> +	u8 sub_version;
>> +	u8 test_version;
>> +};
>> +
>> +struct qcom_ec_thermal_cap {
>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +	u8 fan_cnt;
>> +	u8 fan_type;
>> +	u8 thermistor_mask;
>> +};
>> +
>> +struct qcom_ec_cooling_dev {
>> +	struct thermal_cooling_device *cdev;
>> +	struct device *parent_dev;
>> +	u8 fan_id;
>> +	u8 state;
>> +};
>> +
>> +struct qcom_ec {
>> +	struct qcom_ec_cooling_dev *ec_cdev;
>> +	struct qcom_ec_thermal_cap thermal_cap;
>> +	struct qcom_ec_version version;
>> +	struct i2c_client *client;
>> +};
>> +
>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +	else if (ret == 0 || ret == 0xff)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (resp[0] >= resp_len)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Firmware Version:
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response		|
>> + * |		|		| (excluding byte count)		|
>> + * ----------------------------------------------------------------------
>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_read_fw_version(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_version *version = &ec->version;
>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	version->main_version = resp[3];
>> +	version->sub_version = resp[2];
>> +	version->test_version = resp[1];
>> +
>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>> +		version->main_version, version->sub_version, version->test_version);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Thermal Capabilities:
>> + *
>> + * Read Response:
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (excluding byte count)		|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> 
> 0x03 ?
>

Typo, Will fix to 0x03 in next respin.

>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (1 present, 0 absent)	|
>> + * ------------------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>> +
>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
> 
> Please add include for dev_dbg().
> 
> It seems you've missed at least some of my comments to v5, please recheck
> those comments. I won't look further for now.
> 
> --
>  i.
>

Added <linux/device.h> for dev_dbg() in v6, will include
<linux/dev_printk.h> as well in in v8. That said, all your v5 comments
have been addressed, here is a summary of what was fixed:

- Add <linux/bits.h> for BIT()
- Add <linux/err.h> for IS_ERR()
- Switch thermistor mask format specifier from %d to %x
- Add missing braces
- Remove empty line within variable declarations
- Change loop counter i to unsigned int
- Replace snprintf() with scnprintf()
- Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly
- Condense devm_thermal_of_cooling_device_register() to 2 lines

Apologies if it appeared otherwise. If anything was missed, please do
point it out and I will address it in the next respin.

>> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>> +{
>> +	struct qcom_ec *ec = data;
>> +	struct device *dev = &ec->client->dev;
>> +	int val;
>> +
>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>> +	if (val < 0) {
>> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	switch (val) {
>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
>> +		break;
>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
>> +		break;
>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_NEW_LUT_SET_EVT:
>> +		dev_dbg_ratelimited(dev, "New LUT set\n");
>> +		break;
>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
>> +		break;
>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
>> +		break;
>> +	case EC_RECOVERED_FROM_RESET_EVT:
>> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
>> +		break;
>> +	default:
>> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
>> +}
>> +
>> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	*state = EC_FAN_MAX_PWM;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +
>> +	*state = ec_cdev->state;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Fan Debug control command:
>> + *
>> + * Command Payload:
>> + * --------------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x00		| Command	| Fan control command				|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
>> + * |			|		| 0x2 : Fan 2					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
>> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
>> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
>> + * | 0x05		|		|						|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
>> + * ______________________________________________________________________________________
>> + *
>> + */
>> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
>> +{
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
>> +			ec_cdev->fan_id, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>> +			  0, 0, state };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ec_cdev->state = state;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>> +	.get_max_state = qcom_ec_fan_get_max_state,
>> +	.get_cur_state = qcom_ec_fan_get_cur_state,
>> +	.set_cur_state = qcom_ec_fan_set_cur_state,
>> +};
>> +
>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_ENTER);
>> +}
>> +
>> +static int qcom_ec_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static int qcom_ec_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct qcom_ec *ec;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>> +	if (!ec)
>> +		return -ENOMEM;
>> +
>> +	ec->client = client;
>> +
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>> +					IRQF_ONESHOT, "qcom_ec", ec);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	i2c_set_clientdata(client, ec);
>> +
>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, true);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>> +
>> +	ret = qcom_ec_thermal_capabilities(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>> +
>> +	if (ec->thermal_cap.fan_cnt == 0) {
>> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>> +		return 0;
>> +	}
>> +
>> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
>> +	if (!ec->ec_cdev)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
>> +									&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>> +					     "Failed to register fan%d cooling device\n", i);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_ec_remove(struct i2c_client *client)
>> +{
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct device *dev = &client->dev;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>> +
>> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +
>> +		qcom_ec_fan_debug_mode_off(ec_cdev);
>> +	}
>> +}
>> +
>> +static const struct of_device_id qcom_ec_of_match[] = {
>> +	{ .compatible = "qcom,hamoa-crd-ec" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>> +
>> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
>> +	{ "qcom-hamoa-ec", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
>> +		qcom_ec_suspend,
>> +		qcom_ec_resume);
>> +
>> +static struct i2c_driver qcom_ec_i2c_driver = {
>> +	.driver = {
>> +		.name = "qcom-hamoa-ec",
>> +		.of_match_table = qcom_ec_of_match,
>> +		.pm = &qcom_ec_pm_ops
>> +	},
>> +	.probe = qcom_ec_probe,
>> +	.remove = qcom_ec_remove,
>> +	.id_table = qcom_ec_i2c_id_table,
>> +};
>> +module_i2c_driver(qcom_ec_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
>> +MODULE_LICENSE("GPL");
>>
>>

-- 
Best Regards,
Anvesh


