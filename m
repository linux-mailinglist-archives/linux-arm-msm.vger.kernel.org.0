Return-Path: <linux-arm-msm+bounces-103543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDDVLL9L4mnx4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:03:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E041C5AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DAAC302AF34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70E33C342B;
	Fri, 17 Apr 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfko1gwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrU/saTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C82DEA93
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438204; cv=none; b=qnayO18X+U+sw9Xhdwpl8Aze+mssZN2T3l2pP/xTGQVNWhE43pvcuC67UdqVK0yxrnHPQSGSONv+5VXcRlqZSGZDzQCzFT3/cIP7WFPdu2rYxjpsm6jaRar4UztsRs4q2i0AXhhHSw68rfXcVAXsAPDLIBjOlh1mYQo33rtKGNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438204; c=relaxed/simple;
	bh=9R8L9pnEC6/7D0qx0eTa9FTB2bGqiw8EzNmDTrkkM7o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YYq5dCPCGau0WiJy2V62n7vJsXZTKdGg7F6tum7GBmTDLzshLROo10Az2hrcyIBGmFOrh9q3xJUw8uRAI8IfE+SvXQ+PB6HGwPeotzWPLuNB6CakCr+bmWPcsCFvW7uLqkGZkaTnIO0KnFEGiPGrkIAVrNn0QAaqhaAunNkarFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfko1gwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrU/saTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCErYV3942129
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=; b=kfko1gwpf+VtV+3y
	64tEFrq5mtt10P0ADLXlvcmSqCRLBHXDt5ACIPGiZqG363Aa2d3tR0FL+ddm5wqR
	Q6C5mhhPzWZhrDMP8mOfRMnDoqQsA2mXo82Vm5Ra+5/zzrV2ay/HyYoRc6p3v8K3
	9kFca3ckIk1XGNCpolG6evdGkhD3TWwXQK8oFmQANbRblJRihxgsNTmELr4z2559
	QGLH78DHintV/ntlLW9ma9A9jivkmwcbjz6UOLeAb81zdFUOVQzFeoCErffAGXOT
	mXpUWuZSX6OaXnU6m4Z1y6gfhvQthi9E/GiG0ju4zEE3HEX4dgPm/L6ELsSvaUOE
	C++vhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rst2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:03:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8ff14e5so6473565ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776438201; x=1777043001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=MrU/saThKCbhmzQsL2DU47W+jWseE3xhk7pOJlf9InzAA2edDtHpcB7lgRDBUw0nSZ
         o3wXtk/hLImo2pS5tOuwyYfGtgE+2Y5KfX/OmB+I2Tn8qtGHmpWRLzdlpR43CEmzB+qF
         PClcljGr5SpdUBuTooC7Y93XjuUbvw45mK1AR6Dvh0lNHIRhyWnwhMpM/QMyyZ9P9Z5t
         jLk0lnkr3iV6DsZP47JT4JxoqbwX0tisZtNm7JAJNino3DtJgpCEV01vrsstir4MVNL8
         rg5dY9OkzpSg1DqUMyye1oxZ6TvAm69S/5+1XQCp1Kee/ArmZL7I6LQlboSaopPIof70
         gfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438201; x=1777043001;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=DrOgoHug10Lpk6eicKSXyh1LtrDTYTved7yVFBXeLGDIzi6S2DoS+EfuZdyCU/qx2C
         9rhugCkjEYSgPh0N3XTbEN8sGcxvf6vT8te5oVdCjZMZj+q5TO1CirAln4aQElMQMvoA
         KWLHctkZUD7uy7ctiuG2w0bBoPMEKSDt8W3VOz5315RvpTFCY2oB3Lng6v/FDRAdV3Kh
         DlIOx1S1kVR07EHN8c6yxWVawRU4WJW1Whr+++dPUBaEItomi/TeE7CTolrDNcTKWf32
         QB6T2+NjrqSMvFQKa1uBV4jakVtNcWUXdDwASnWZ5EK80d6o5Xq8adm6Rd+AnqctEGY7
         lbOw==
X-Forwarded-Encrypted: i=1; AFNElJ8UVsQsSMD3uVtZrA02ceY73UUGRTYilz9Vx6K7wK9iXFTwa1ImxgFVHP5/7HkDf2WGH97ln8mYBLdxfvaZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyl11E3QnAKB6yZxjA7jiBXUVAnDSE4DWrAqgiMWb2vBLrPWix
	f2lNX/BcV5qNTqi8jo7mTEifVgv/19r8ic5Ds5+WdeVxPbsUPWOq/YxgVefHvEfWrB/8+YekNrW
	nRfqIkZ7Fl4NgI5CznA+QTnw6oUDjTwd1Nh6g7d6RymyRu6E8KJ6vPUxoIsQy2wuxafvV
X-Gm-Gg: AeBDievW+6UiveTueKUBerttsY1n28JJ5+O60jKXRMFN9PZs3CrwZkxRwZBlX3qOnbc
	Ac6m0O7XS2dLUR491x9UsGIQvu90lXtJYcIxDuo4dWBw9zPvNs27nF4GNY3yrbdwRMRmYUL5VA5
	/7QcnWyEjGLwMQ8o7MQE6jSu8nVbO+eDE9OEhsSINBSlXc7q/eIXIqp0de4Qsxs4zQT4XehcxEL
	yA1q6u9AvBbAlw47LtW5lz1OmiBs+/AxUWvkiKxkBSRH8uxBBIpxv3ffcrqUPAojfLxRj73rUzZ
	tgzewlFuhavZr6tLoa1SwxLAMjRAZ47t12rhbL8p11FP/bXfAzbRRoow6KcgWPrY9IrvJHYTd5G
	9zK7O1+62ooypV4scYlp43j8aK0/Ra0K5rtvgkGZokltGugZK3zZLiKdrBzLL7FC9
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22893195ad.8.1776438201005;
        Fri, 17 Apr 2026 08:03:21 -0700 (PDT)
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22892455ad.8.1776438200160;
        Fri, 17 Apr 2026 08:03:20 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm23809775ad.37.2026.04.17.08.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:03:19 -0700 (PDT)
Message-ID: <9d97d9c8-29ef-3419-464c-2db642759d39@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
 <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Language: en-US
In-Reply-To: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VH-Lco4_W63KyvbIKQF_1OjEmvNMOdf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1MSBTYWx0ZWRfX8BmgxKIyvKKb
 AMHtkunSyY7o+slZsh08KDr9M88BcmHLcTGqdfrWJcomXNVGrS8uNSnpDBUXpvxBhz1CDtRU3YY
 Q6U9vFxGL4vmlsHAV4WVneezjWDXzBIdC7rrjVLmnHbKdAfaHIh9zam2ulISkPk5AXQRPJXfO+0
 ybbk40fXqI21n2JK5uPqXoLR7NUQMav/dCRKgnTUV3J7CceFsNik0b7rEk3RaVmFjVlfuP+2IT0
 k3OUFWagGv1r895a8DINd3MHoIPd7A/d18FUIdtwRQIehhSrVcd+S/vTdsExK4GN7W6WIxn6UHm
 54rku14Wj7tgUmVAI8YQ1HTvFeNIcutSpeJV3JQvcmxsx4KoURZEL7J8MviuiYv9+KPhA49qeGG
 zA2gHnkcW31lr1R5HalY8T0PO3N039UgmTiYScjgR4BLnzSohyFrenDTZ7TMFSHz66sEKgnKe3B
 kvNUNHEu/Walnf3OHvg==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e24bb9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Gxg087mSlOwoK-wMwRkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VH-Lco4_W63KyvbIKQF_1OjEmvNMOdf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103543-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 553E041C5AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 8:46 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Change the order of paragraphs. You should start with the definition of
> the problem rather than putting the cart before the horse and starting
> from the solution.
Ack.

Thanks,
Vishnu Reddy.

>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>

