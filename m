Return-Path: <linux-arm-msm+bounces-75092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464FB9F39E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001DA4E7589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B6586353;
	Thu, 25 Sep 2025 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER/ymupR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D48271446
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802926; cv=none; b=FgGCC55sPBOmonVs6Gmo+35RtD6Vy3LuTz7FmbQQhHgTBetP9jor6kzQyjJ6/CrjmJMGpGdfeaqmVNxm9X9n+h7FvLRwgdM8a8KT8guDUl8iDN0mURCcVkN04C1WgwxdnLJdwa7H7hgiiIrGH4/QTQ9rKYnmoejutODWUNuF2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802926; c=relaxed/simple;
	bh=2XqVg0dmLhS4rgfpAaBmZZFswjnXfLDwZ3YAEXR7JI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVShcuMKW1xoE7t3XejcMGul6GbcfvtKYImsNxbdWLlysLm9Js1fiCsqSNFaJMxeW3FRbPx/nutL4xgfCZvl523kVrmjrzXajGjN7UOHFO4viNG9NKrqkAcD/jJezrGQag3aPC8EpvriW0efbIKzstG3kSlUjLLNXDTajznbNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER/ymupR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9XjSv023441
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9DR5cpyOH/BxeCbJMQgTb1MvE86nj0ENnimkpeYOk2w=; b=ER/ymupRzR6PbkCp
	p96ZuAClQAY9Sy3sQFmb9t0KmyWZxY2iImSsxGawYB1++b4BCxS4kbYK8ZBPaanG
	jlUt2hGPMr+UnXW/rZ4eZO8AeAyw3HlJhfxI5D7lzhPlu7vsZly3037N+AJNoglK
	JjRgzWpceQkJtJ83/U/U6p1teC7i9isMbyBnTjFD9IVXNrpBC1h/qYq1a7SzqTxc
	lQEJBVFNQlUdNG11FdYiITJyPvwzFHozLb8j26nplChPTW4hCDYKOVPp4uPhthuI
	tjFV6SVnAwOdy6E5MqCBIqAzBPDlndTRnI8Q8ty4NFg92pbKKHbm3G7BeY3PHvhJ
	JH0TnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafm7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:22:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so32782785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802922; x=1759407722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DR5cpyOH/BxeCbJMQgTb1MvE86nj0ENnimkpeYOk2w=;
        b=tTh9YVex/RVBcUDG6Hal+IZV0Wsia66nvFBjRNQTyn2Of/RVLkHCKpTAqTsVWdlvqa
         mvbQ4x4kOF4g3PqQXjZtoxzSrgh8L2v3AOIgjQ+M23DBmHnfRoRBBBisQoGuv8xQnet0
         3uihRPX2D9yFUuoCakmxCxEv8y09fnSPLPmBtaGwShza759NEgUMN8F+urofwVs+Rm/U
         ObTC2lANDQ9QwkVhvk8AFpb4TFjssbpIS971g5kXSUhGGjitkRRU4B3xXgMsf9brvxpP
         62VHtCENJUE2dfo3GYahTxpfaENOfT6Pd+shwOIDAL3b9pZuikRpfTY7o9/9JvbFcHxR
         aJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUk05T5EL1Mm1VzoE/Hmcf6924cYlFkMXwCmVWwoutEs/r8O088FE+lx2lF+5fn8ed7gMdC8dA3qqySDWfs@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNc67t2OVMSqc2eyrvHGOXYmsbpaoQfLCTjbOcids4n2SMcD3
	JxOGjStCAK7JIaw4k2BbNRiqyRWOJsekfsbn6bMNedmmdCaAvHOl3bB05yi8ZztnaCcWbLDMrxR
	V3XYA9wv9l9DrEOKhRFT+FexQUMya/eWzFaSLFHmjmMk8XeQBe0wxR876TP7VaxgGY47d
X-Gm-Gg: ASbGncsqo190sGlFa0EmZDS0BkXF4mHgQCq2npfyrAeE+tAQGvLf9/A4+m/B2BWg6s2
	fNRI4r/HPpGtIhtNqinh7PqQjFvG/O+VVc+SN5MUcixrK79AMIg2AbRIziAEX1QEtTi+dd27URD
	ukZfClT7DR0fmxMXi5KzbDUBLzkiUgRB2mTa1tFTq7N/a+IP6PxG5Nx5Ai0bUSrm7kv5Fe/eIpn
	scm8qw1TzF9K6O6uDkQoHCvRgQTq232i0kCgxAoE9xtMdVoFLX2FZmqhIQq7MgWA2HPCiBISHdJ
	hLyMxq1a4dIOXQFF4Ebox0vvqwfP0H0lO3lfrxL2vXp/DJbmgRlioP4aYwM+3sdJUV40gsBiAkP
	qOMKbyXTEMNzBtzr1vBtYog==
X-Received: by 2002:a05:620a:40cb:b0:855:b82a:eba5 with SMTP id af79cd13be357-85adf5d276cmr260962385a.2.1758802922332;
        Thu, 25 Sep 2025 05:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkv+k6t8AORrT51fuAymrjcGmjeXtdiNAouIlWNN19Pm2PP8RbzkJ3wR5/uExqQ4VNoCqwfQ==
X-Received: by 2002:a05:620a:40cb:b0:855:b82a:eba5 with SMTP id af79cd13be357-85adf5d276cmr260958885a.2.1758802921627;
        Thu, 25 Sep 2025 05:22:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a7dsm156717766b.83.2025.09.25.05.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:22:01 -0700 (PDT)
Message-ID: <7dfd14ed-18d2-423e-abbc-33ef8bdc0a75@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:21:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] arm64: dts: qcom: Add PMH0104 pmic dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-10-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPetzYdOvYkzeWmm9pVM1MwJhng4JLn2jsoAuey4jtfrqQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAJKOXPetzYdOvYkzeWmm9pVM1MwJhng4JLn2jsoAuey4jtfrqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B9Y_-ZP3MARUO7SY5FdhDRLigfpVUmhd
X-Proofpoint-ORIG-GUID: B9Y_-ZP3MARUO7SY5FdhDRLigfpVUmhd
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d533eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9Zr-VXZqQWZOgLseAA8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX+sOAtTsKWQDg
 jJ1voRc4dS4fZC6AFq6OeGZ/MEKMRpeP9V8Uf8EqT2dRM+kHsGhZC27iyp/NsYfLwlzq6R0u/VT
 OrzTOzmpf4f1zDrySP2p+Ke9fvscbANfNJKMhws4B6F00iSxslcWip4u9uv460SrZpEz6mJq8kE
 gvIW6wYOxjvDeKRiNY0/wG85CpNx8iqlVeIRZ4otzVxyhfzVIBULDj5z0a+BkSGTwSCDXOOuVsP
 7s0qcd08wbz70EaEMMPz+NYCdlcAnQ194FYSnuMnVmuvXj3aO/vkXxq/gQqt5MugdVzuZGztRPi
 llDvgR2xxw5uwgNM2WYx5J2YVLrRT7R2LbcMTVJ6dJGONDqKa/mLYzGbDanzSzv0mm9Ebwdf0p7
 nKiUJP3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/25/25 9:59 AM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Add base DTS file for PMH0104 inclduing temp-alarm and GPIO nodes.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>> new file mode 100644
>> index 000000000000..f5393fdebe95
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus1 {
>> +       pmh0104_j_e1: pmic@PMH0104_J_E1_SID {
> 
> 
> This might be fine for Kaanapali, but it's wrong for Glymur.
> 
> We discussed it already and I'm surprised you come with completely
> different solution, not talking with the community, not aligning to
> solve it properly.

I think I omitted said discussion.. if it was in public, could you share
a reference here, and if not, would you happen to have it saved somewhere
that you could forward to me?

Konrad
> 
> Judging by other patches sent now, I recommend to drop it.
> 
> And instead just join the talks... Otherwise how am I suppose to look
> at this? Everything I said should be repeated?
> 
> Best regards,
> Krzysztof
> 

