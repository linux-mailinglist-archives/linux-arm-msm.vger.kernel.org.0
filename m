Return-Path: <linux-arm-msm+bounces-36119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABB9B298B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4451E1C21584
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38EA1DD0E7;
	Mon, 28 Oct 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LoG4/QTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5531DD0E0;
	Mon, 28 Oct 2024 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101371; cv=none; b=XAv0el37PPObtrV+LNn9i7VjSQPOuJLnH+KXIXpJJl2gnNcYqWxQRNPAaXg0NGGhxP//94rEIoVJww+02ZyvCALVDg7c01lSlAEZufmyP4KgFagjw3/ucJxD5XCfHV6TfbUq6p5wc+MWRLcqiyVcOjwzHnrQvBjJdTT3r4IPz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101371; c=relaxed/simple;
	bh=XyKhCSx50gEvdvngEQkA62Vax+WJspVF9VbFSm7JA2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KUma51V8Lw4GoD3MdvNmZv9ztVM1IfcgddOK1wLaRJa0uD16NmFmLkKOnACDEz9srtUWczDU2/gMzB3d9dwvQnS/qAiw3svTNAK7egvl5jbmOp70Tw6jAPuUcu2xw2Iyfbh2NNY6PeYaKtIaIdqhUtz3svWm1PP6IP3laJSlSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LoG4/QTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNsGP1001875;
	Mon, 28 Oct 2024 07:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vaZigNBo2RVkSqh17hX/fNf9EwxSZgXoO6QVDqK/VDY=; b=LoG4/QTHKKiAlJbP
	/39ep79piwkx6RTtloUOqqYRIWd0ah9IN4zJ6y2Df7dHLEDhldIbqo9ChIXOmo0U
	Qv9G+hAj8q6iJJFh4E6j2JoUwDOpocPLshHW8gkN+ATHrmBP6XiVluo7af9ZyvIi
	zRlVSzbVAI6PK5dmoiD/xcTFbjYq54jW3R2lX4w7q3Gfm+C5IzMOUDz9z9cs3Pzb
	YFHYm1LfHYtLdp9wUzfhmMDlfJ9WTSYIhfuLEG8WDwg86+BlkW+Dhe4RHekajWeR
	Sf1thvUOfALsgGnAXz7Yqyfsa88Bx47d1+rUh5K7YYPepAteKiUFQ/ahuJwDTKSR
	Qh1p0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4v2m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:42:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S7gHFF014953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:42:17 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 00:42:08 -0700
Message-ID: <b34cfd80-88de-4f7b-ae55-3b65abf8924a@quicinc.com>
Date: Mon, 28 Oct 2024 13:12:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot
	<lkp@intel.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
 <202410260742.a9vvkaEz-lkp@intel.com>
 <ca0137a6-3ffa-46ad-a970-7420520f09ae@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ca0137a6-3ffa-46ad-a970-7420520f09ae@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 80t0sDpFzR-3V7TX7FzE5RGSxe_2be2y
X-Proofpoint-ORIG-GUID: 80t0sDpFzR-3V7TX7FzE5RGSxe_2be2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280063



On 10/26/2024 3:35 PM, Konrad Dybcio wrote:
> On 26.10.2024 1:31 AM, kernel test robot wrote:
>> Hi Manikanta,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on clk/clk-next]
>> [also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc4 next-20241025]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/clk-qcom-clk-alpha-pll-Add-NSS-HUAYRA-ALPHA-PLL-support-for-ipq9574/20241025-121244
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
>> patch link:    https://lore.kernel.org/r/20241025035520.1841792-7-quic_mmanikan%40quicinc.com
>> patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
>> config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 14.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410260742.a9vvkaEz-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/qcom/ipq9574.dtsi:766.16-17 syntax error
>>    FATAL ERROR: Unable to parse input tree
> 
> I believe you also need to include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> 
> Konrad

The above build error is because kernel test robot didn't pick the
dependent series [1] mentioned in cover letter. Not sure if that is
because 'base-commit' & 'prerequisite-patch-id' tags were not present
in the cover letter. Will include them and post a new version.

Will that help the test robot to pick the correct dependency and
resolve this build failure? If the dependencies are picked,
<dt-bindings/clock/qcom,ipq-cmn-pll.h> would automatically get
included.

[1] https://lore.kernel.org/linux-arm-msm/20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com/

Thanks & Regards,
Manikanta.

