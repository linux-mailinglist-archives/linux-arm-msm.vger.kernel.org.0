Return-Path: <linux-arm-msm+bounces-60245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A2ACDFE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 16:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A44E3A778D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F9A290BA5;
	Wed,  4 Jun 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CT2N6f/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291F02900B0;
	Wed,  4 Jun 2025 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046203; cv=none; b=unDzUR9Buu4Vnc+XwfXBroHeMhdPVWZRB6OFjeXrzX2SgObt20oPnqM5YAwfa6715Mj8e5/ADuNeVZPe5UOYMGLZ+HxZUjhw80MUIk97SrqHhLf2zhMne1wZcs6Gm6ylCbKvBWySUZlrnx8QDlkoEI8msozCZLWTaIUFtnisHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046203; c=relaxed/simple;
	bh=B2ABg1wz3GCV/5nlluOeLv+jcW/anS6JFpPQBFpgC+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AWF1gIs4Pm5x9fXBA/imRQcuOKN2KLxxNLQpyruw9/39yaKV+/vF3y5hu6PtO0fN88c5fcWwLfcRNVs1kmHfwBS08ivAjrYNpR/MwLwh2S8aLraghTlVk2RIGQtrfAFLLgcxFyit+6VbVZOaxPIcgGNjjar7Z5rcenwVoINwwsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CT2N6f/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548ObLq013606;
	Wed, 4 Jun 2025 14:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Lm/hVQBqxHZuoTLZRaf4HoCuxZUf0ilzEKB6T/CUQc=; b=CT2N6f/E18W/8Xnm
	qdlOmx8mcFFma8nJKf16rTU4cuP0arw+4BxBvjUSTnvRZmLkaBkxVEPvjHm2tMpx
	NGYVd7Q8x3Oxs54720vx+nSOhZBrOw6pAmyU4HXXWb+WwsxOfteFWllGjRmKMGH7
	N14XRoQpubN5xntluyAgm6gQsC+oCED6xMbUtjB3mZvUFtD41efqbozMmO/yGJtS
	M5s2FEtNVgeyPEzQ4TeYHyOPKyxViE96+4vdBNvqdiycGka48ly8zDebJaNCd4QE
	XSCJkmQKHW/O8w9sUudZ+teggUWJL3u7Cbmrru7JHYvA/5QZ/XfkwhwNvXn7s8fN
	sxLzsQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8np8vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 14:09:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554E9tZl018095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 14:09:55 GMT
Received: from [10.216.5.91] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 07:09:49 -0700
Message-ID: <0daf396a-29af-458b-a7ba-3b711b22cde9@quicinc.com>
Date: Wed, 4 Jun 2025 19:39:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] serial: qcom-geni: move resource control logic to
 separate functions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
 <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
 <y41ikVJ5uSSaGZHmqsvTm9akz3EUUT7X6dTPrfSuIYqGmMdlEfPRWqPA630jmsEzwC-6JSgYRPobg4e933PgxA==@protonmail.internalid>
 <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
 <6b7ca51a-241a-49fc-8aac-da5af96b5e10@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <6b7ca51a-241a-49fc-8aac-da5af96b5e10@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z6yQMhYhryW_9wQWU3XXftpSRpkf-1-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwOCBTYWx0ZWRfX5rwUcoh+0KBv
 iU3XtrSQV03RVhFbdGSS06rO+6Yl5KW4J5JEcYJ4EgmWoigHVuRRgIOYSydQOVsbWGn8N62ubUx
 ubZ31D9nDwTftLiemlHqNzxfnLOmssps7IIar7MOiBEDlljfGDVQHkDEjNXYceH30tKyLZYIQrA
 Di4btjY9ZWWMbbu5N8TrpJKT3ZeAYHV9ghXKBBKf4eY88EcEwN4Y9XuRiPjKNRl35NF+aVqPzcO
 DLr8ioW3tUePu2xXuNcy+yqYZcGZwaYEQmzc88sHTC0Q7yy5oXrHkecPX2/j3TTkiCt1EE8zKsR
 5ILjQqrrgFFvIjIszrMJPZNPtEJDPmbmtKZw4zZLiwvxdsF/Yt466uVDnmI0drn7o/JisI7RuRt
 kOdF3zta9ky+mvmax9SbQ0pBtevYmThJb0TmQUJpMbQonwvwE6a2MmvLPgL7fufKyu1S8exy
X-Proofpoint-ORIG-GUID: z6yQMhYhryW_9wQWU3XXftpSRpkf-1-M
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=684053b3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=s5ISWN8GRDGLSXsRgHIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040108

Hi Bryan

On 6/3/2025 8:16 PM, Bryan O'Donoghue wrote:
> On 03/06/2025 15:29, Bryan O'Donoghue wrote:
>> On 03/06/2025 15:28, Bryan O'Donoghue wrote:
>>>> 2.17.1
>>>>
>>>>
>>> Assuming you address my points.
>>
>> [sic]
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
> 
> Oh please fix this in the next version
can i fix this in separate patch since i haven't touch these two lines
or
fix within same patch?

Thanks,
Praveen Talari
> 
> checkpatch.pl --strict mypatch.patch
> 
> CHECK: Alignment should match open parenthesis
> #92: FILE: drivers/tty/serial/qcom_geni_serial.c:1675:
> +    else if (new_state == UART_PM_STATE_OFF &&
> +            old_state == UART_PM_STATE_ON)
> 
> total: 0 errors, 0 warnings, 1 checks, 71 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or 
> --fix-inplace.
> 
> 0005-serial-qcom-geni-move-resource-control-logic-to-sepa.patch has 
> style problems, please review.
> 
> ---
> bod

