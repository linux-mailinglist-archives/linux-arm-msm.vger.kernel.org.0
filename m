Return-Path: <linux-arm-msm+bounces-75474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135FBA81D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D8D188F4E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97573256C87;
	Mon, 29 Sep 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTzPoKIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF525394A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759127282; cv=none; b=WpllqbGX6F0Cx/TEthSKCxRGrFKOAkAEuCYbfhmjMVDiCIYAC7K8U3pnJt7hMSx+TgWAOCFcyi/bC5vRydZnBDyTPYvBT+5UQHpKxVliUgzrH5Di0utJtMc+KUvTNBS/Bdv4TdkP7YWG2QEI9T4PF0uwLB1T2W6u+JUifBKVH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759127282; c=relaxed/simple;
	bh=7MONXp2kxgmvXUrMFPJPcWOY5YJ/mSytwCSndhWpUr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFrW9zTuJ/D4CuI7SZMTkXdvMLU/3xDdLmoqWezxkB3PGIkUtaPFgGKdMkc4z4qGOT2ZcXwqcwRsIGhYxoIeKiQyG2gAvrO1Ye36Ba4UpB7BjNRteIfq1L1anXTibrPob5bEKh5YXJWhm1eBR0r2TDtdUKllsnu+azTIE1vPnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTzPoKIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMT6kU024852
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoiySB9U8Vv6U6hO1VDsQsux8dNMt7jx6n76caS6mIU=; b=BTzPoKITsjHcE/Ig
	+gEuoJQqZWQkBnXTNjXpQkAuxDJy7kI0tKw+W2EUdfdtYH3188g0KQANVZ7EfnVd
	gEGwbi4qQDZXg+NFwqB2iWj4DMNQUV/HvIRuTmZF4ZHrFoFIF4Qmp8f9tZAh09i2
	Fil7I7ajvt2czV86ezHNTTCZMwI0xMNnxMFMGFwz0W6AmsQuz7GjDv4vqws3JRc/
	A6AaGsnAkFZ9/2Tjn+uZhZgf/Y7lBLhOmkBtlp91+86228Kl8YlQNcDGeJtlHaba
	y5hpQV0KjClPvzyGYpKY7DmYag84CJ4zark0O1ew7c9EELGMhBm099B3l7gteAsw
	pbA3Pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdbwxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:28:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5535902495so3138742a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759127279; x=1759732079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiySB9U8Vv6U6hO1VDsQsux8dNMt7jx6n76caS6mIU=;
        b=n9oAQSCgJPE75I/GgoTM0pwemOc5zZAryDjbY7oCQG4ueJL1ADeCvvdH9u/hkQ9qqa
         6UEaD6ru90bGmzrpDpO+1So3AEcqR8h5JryBEZjk/E02lmT8BlQEPUtBa5ffjfYZPS6j
         Cs+p3tmSv/V0OmJ+gD1bmA27FbxFeNDTY64pZIp5QwrkWMcw3U9nWHJYR+kNnws8N9uv
         k0sCR/cWQUdhstw4Z1Rgv0vkC0xMOVRRe5jQ7USQR4hBb1NOwnhG+7SA2WjUgwqTTFeU
         kyLzd7eGGnHskpdWKWiHLBAuIZxd1RTakS0B6eeD8Uj46h5U++D+vxQ6L+Dc5Y8ZXkct
         RYBg==
X-Gm-Message-State: AOJu0YyXU1EuxoICzTA23+qCURBsN3cYvkksKxe0JvZLn7msjWQquee5
	ZrdnHLTDDxm6Yb0bfQVwD7R/y6dGBbATBDAczDLQ+Meyq5IpRheOFysrKMOMeYQGbn0aSlvSufK
	3qU6SZlD5bThs3YI27uzbHV6FAkVARAe541UPldLjYycaXtRtRIf8V9qcm99ZS7E+es4m
X-Gm-Gg: ASbGncsUVvWFa8K+UHJN1Z0tr2ebGTvL7tNUA4U3F1oFZyQzGcKus1wh03etUiIbln6
	ZNKpGApdKNvJWdTaJZ1XVZtHb6nD1PBZvIMKV7fw9PmZZ6e+sSV/zNnIQqumBXalxpxaanB3qAg
	+NPRgQvKGHOCt8LWIsykKPCWpm9xhKYdLFRC/nIDdkdeTQb90FLegGzSHT/3dVjRFiHLDJvFtmC
	iMiN/Qj5gVBQ81qv3JOfp2iq7qYuoNez/VrF+zxRX34/d1fTn4Hw4rbpXzalqLtMR5pwTa25SGD
	cdhgwVCutyyzea1ZIbTfrYWLhlFyE3DA6jXsPLfIJ7029UcoHqN9GGNBcYdzcbqE9hnkLXJgJAH
	n8YjnccTUld9gmIZ4GXkrZoziZczHGV1vark=
X-Received: by 2002:a05:6a20:e212:b0:2d9:c2:5ce4 with SMTP id adf61e73a8af0-2e7be066b1fmr17865343637.7.1759127279074;
        Sun, 28 Sep 2025 23:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0+hgjwMD2S0KLIaHpLLLlNzETvpPU2QOEdVqYskNhuhBWrT5uV/PegOpSnXKtl0Mat/ebyA==
X-Received: by 2002:a05:6a20:e212:b0:2d9:c2:5ce4 with SMTP id adf61e73a8af0-2e7be066b1fmr17865313637.7.1759127278653;
        Sun, 28 Sep 2025 23:27:58 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55be5b9sm10167314a12.52.2025.09.28.23.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:27:58 -0700 (PDT)
Message-ID: <464b38f8-f91b-44f2-8028-aa0a17ca3e68@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:27:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
 <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <b7855860-410b-4d32-afd4-84d61cac4a79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PvQPSw9zLCR0MdvFChYdWXR077aYWPx8
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da26f0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: PvQPSw9zLCR0MdvFChYdWXR077aYWPx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX/jtIDIuJHYSc
 ir5KlmmhHgY7+744qdx5WhG6E5exg3IN8l3ZGscF0PcOFFGEGxBhtJffXuBgkriPb6E2N+ggCqT
 F1tnJ1EMcCw14TfKiJCipiiVOcLfB2Dnk1fUmDazGKK0VtJv05JMksgrra8HemC1L7M1ZVhvzto
 HBdiUEz1uJb85bzQ83PXJasCHsJslIveH0UEWvWF9izz4twaiWlVop77kwHjbQvT/Z9CzuKFe34
 o4DXdFCR2yoQAx0H6oWmdJb/YCH/jv0/X8eqlpBHVGzhuX0xgxmCQxi3GE4xBYcseWWBybpRPUp
 YgzWkCLxsbur4W52jrZKSnhohaECkzm14lM9SWp8DAzUT1QWSzi4UjI9+KARfZ6mrsQa2iI03Ah
 7pBw9jttkjYc5vLf8FIp0i+RRiPXPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036



On 9/25/2025 7:42 PM, Konrad Dybcio wrote:
> On 9/25/25 1:37 AM, Jingyi Wang wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
>> platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 99163e48a76a..5007e1706699 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1487,7 +1487,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>>  };
>>  
>> +static const struct qcom_pas_data kaanapali_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mdt",
>> +	.dtb_firmware_name = "soccp_dtb.mdt",
> 
> .mbn?
> 
> Konrad

Will fix.

Thanks,
Jingyi


