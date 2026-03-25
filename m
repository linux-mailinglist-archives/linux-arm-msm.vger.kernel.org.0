Return-Path: <linux-arm-msm+bounces-99817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EOyAbqrw2nAtAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:32:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAD532245D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E454B30557AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D44351C29;
	Wed, 25 Mar 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pvpx+3rB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4jsUSwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316783254A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431159; cv=none; b=EZ+nwVMXj18MCtplnnO9N2vdxhj3hUCtdxXPaopz9B550JGBC43AOx8SHnchF78U8OeNb0/HERXp+yIVaPdy38AEQm5goyS2r9L7MeIXP1f343JKzf42KB7RFsGgvRQ2T4eNeLALKg1dmlqR4X0LV3tiR1ZtQvB8stLMd9DSiGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431159; c=relaxed/simple;
	bh=fSUL9igBA3KN4gm9BjiayxKw1TnmPlLVceGWkB0osq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7iCL6NM6vvA3LY9nxsh7IU2cl9FyfVm1xJzlz0dCwHlgSsAK6MT6jZf2dLrPVTWCwo6u3/NloT0Ztdg0Tr95DXQ6Vja/Qu0vaXMQ8Aui+XtMEh0W+XTl8VYXSLbiVVFjvZE7ttRjGaZ0hSKArC+bPwknv2r0LaiKZwLrGhliV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvpx+3rB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4jsUSwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5ZfQe2076695
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=; b=Pvpx+3rBKH6CGRq5
	Kq3BLyUlf5QmLyzMWs5tWe2hgeQvRlM7uvjnAbPhhsIUuF4XXct21C0kN7IyALPT
	nAgyyttVxyIeQ5Z+qj/+Y7+FHQHLohgESbxgB5phhFklO79nUpnTZbz1a8Ddz3k3
	1AMAwK+XmFWA/eOQMSXCTAVExsxz2hFRwc1Hymh3urAygOmIQ/HCadXEbvh2wq7B
	SXe58CC6AlCRIIYVB1LWSKnS9Qd6jcXD3wqcRFue4+DDLIWbcpdDmCOVKxwr/DPt
	mguiPNKmJlGEzjp4nz/S492AgJycvDcThaFbfjFMNrhzFmtUcofRImMjhBKMzXKT
	g/dXLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412fu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:32:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso51971466d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774431156; x=1775035956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=;
        b=R4jsUSwTN4HMuo0IVU5b6NfkJ42QTx4qnWHnOz4wDvNMY9VpsNtMFyODsaP+BxS2LT
         bWzfyq53zScTayH4m0SQcKvlhnBIMMEba8CtQlHf4sk92dBiTxDA4ETDRCRNyikqPebU
         ycAf7+WxB4BZCrbUSAluZ2EvG2WJlHe08OP+wpAdo+BGoKBy+YT1EiAD4JQVzdh1T/MC
         rWadfL1EjDP5gjv7HBl2mVPprDuxvruHHvv4PRfqkaprZtYVVJTIJZlppreRIi5+nIXv
         mS6ZNUwQ1xSRdBbsWoRJsob81hWERYNN/HbRzDryqNhVkc+sRcDKXjTjgeY09xA25x52
         Yv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431156; x=1775035956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=;
        b=nahrNIf69Gk9/jdF7h8eE7Q15kxrwU5jcQonRwpsqLnPiM9556pxDPxSyhFcvkCLgR
         7GtvGqP1BKhJmp8R2r1A3NIKsPBVsZYKQeyu0lUX7XK/JBgavXjSJhQJn/yHNLXXreDV
         iX4ou747hvrU+sr6/d3A3xTZxDRhOtzXp4HdrtajKPacka17U547DQJqyOVi5RUJ3Cnx
         Fw74qlj+Ycre4oAM9ofUZ0GVnFTEJLH3HsamODvWwJPfZ6fqTxmTapnrwSjc8MIOlCk1
         MTaW24UBNOOq7jSy2UeI/4WJaiul5e31NxSzOW+zRTAp6dKyUuSCkxwklN915Xbgpd8Y
         eB9g==
X-Forwarded-Encrypted: i=1; AJvYcCUvFjDgq0nLTv4g9W2BiPd4+mR6yEJh6SmTGTlW/roG2dsPWu+OJ8lxmVxAqUeRi0/rhclRNA3MseyLEMn7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6twAm0axJNXj0ofGRAsHDs4SmRX3GNZh2FUNSKxjKHm1hJP4+
	UkSbAnr50IGB/hK/ysLIsKGsyLSx1sKBNDd3qeSxTuUq0qbu/SaEP3Qtk3mKoWkAtkFFDj0vxdQ
	3jdWnvYMAm1DtxxkUb+84FrQIyWGieHZL/q3iE9UwELR0ndO3ED1L0JSzBZG9cPoUwC5U
X-Gm-Gg: ATEYQzytUIrrenZz6GtWP+I8cy8VfLrNbaVLXNB6ED752XLSMFiOwhYo4FP4+hScmCY
	JtUMw9TyACa7YCuuD8u5ySsZ3N6F0xUEqQ0WV+mqUUDiznqeYrltfFgDwFN0a6qT57qV4X87v8H
	UHteP3G/0J6or0nNZAjAVknHzrrFHngUIJHPp40oqEDQpRlbYW6+uAo2A0/xGwiPVG0IO6dB0pI
	lhgcV+JCoDXukkYz+Cx0us5nDnT18cColDCNbwSqZQ52cIBn3CDohe0CwN4AhmcLUAKBx2IQiPi
	QqD+DjxY0CFcDX2THpV41KHZhjY0MYRLxQwnqMiNfyIFiHTSfDy5IDHwLBYQwZZ6l2zbEVJxaN9
	q3JmrCNzuaPVSnOY3qtis4+tRy+GSA0/nd8noTRkjBs0cDAuEfVnMxFXVqxZQYH6lovPPfjx57b
	6FoeM=
X-Received: by 2002:a05:6214:5191:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89cc4738ca7mr29547396d6.0.1774431156439;
        Wed, 25 Mar 2026 02:32:36 -0700 (PDT)
X-Received: by 2002:a05:6214:5191:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89cc4738ca7mr29547166d6.0.1774431156025;
        Wed, 25 Mar 2026 02:32:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365d86asm779950166b.48.2026.03.25.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:32:34 -0700 (PDT)
Message-ID: <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3abb5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Va9S0ePWEawDROJu0VIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: xcxPupSwh8DEqenpuUsDjyvflHKOnkeW
X-Proofpoint-ORIG-GUID: xcxPupSwh8DEqenpuUsDjyvflHKOnkeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NyBTYWx0ZWRfX3ZZTe2BvWd03
 kb9/cdR6B0YwRvdiKvTJsGOWaqTZePUpB7pzMJq8qd1K2/PKUoHzFWjB2sQeAgYbYaNX2qd90rT
 ZbyWYkFSDJEaT1TLQi1q5sWManr82ju/LLWUAdyegiXZYweX635DjPNeWh9ZZvpWdr2j+c30l2o
 fia3aNEJ8djLCKZ2orL4+nLugitqr8reSG7HbE1z0U75YPdWLzLXfdGE49stR3H+k8A1zgJhHNC
 OCiIkYdBDgnSgIW0g+/rw6SVTQmGRmzMsUQ/qbhrb+h7nknAoLlAO2eyehNLzRtn5YOIQyi/kYc
 yuAL654EvsPfhFB0fSt/op1LUdcq+9jX+ZQWq9LU114Mz4U+D9LJesGQKxIpkFybyiCTF/izKS4
 f6xC7a8yVYjt1VJT5I0Dqxq5lX0b8zlHDcfywb0as6U5x8nPM0YMwb+MKoFfAEde7CjG9KXUN38
 540DUn+NG0zsR8mrP6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99817-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88dc000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AAD532245D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index 75716b4a58d6..fd727924b8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>  
>>  	};
>>  
>> +	qspi_opp_table: opp-table-qspi {
> 
> Why is it not defined inside the QSPI device itself?

The QSPI device has #address-cells = <1>, so we'd get:

Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property

Konrad

