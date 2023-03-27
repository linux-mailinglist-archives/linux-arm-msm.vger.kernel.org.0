Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50626CA685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjC0Nyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjC0Nyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:54:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5673C25;
        Mon, 27 Mar 2023 06:54:30 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDLVad013620;
        Mon, 27 Mar 2023 13:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vErAbA+67np0DJjRjpGBn7ZfxgBTtrb9gzfiMtW068A=;
 b=DKm8ufx20TaXw7+W3AalnHf91O4nx8BmfaHWtVzmhb1WUKYMADTpVrs9LQhKwTTa+IMy
 fqtW6eX61ThmBtcjlFwIP++hMed6pelgNK/10y2C2ms+Md2xDY2qDutX2OaQ5zYRQXXk
 W5qW9YVlyGpuSr+cALC3/KRYOOeF60Uv3+y1xLKyxMj2FsOaCK/qEsEMJOuFNKnFXR6w
 70zbCbC4At/BFyYIGC7wbBfj+Mn0B7cadfP/KkhfYkZaLg4FMtG+dNFAwK/xDtb7feNx
 9/ytZsAcx8JwjJbjMC8S0bpC3Nt/ylOtWYAAof3D06SG0Ii9f01Hh8Cs3PmSJ+od/ZCC ng== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkby4825k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 13:54:10 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RDs9p2004370
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 13:54:09 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Mar
 2023 06:54:05 -0700
Message-ID: <745e6bd6-96a5-ceab-1f0c-31440d34e4c8@quicinc.com>
Date:   Mon, 27 Mar 2023 19:24:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Content-Language: en-US
To:     Miquel Raynal <miquel.raynal@bootlin.com>
CC:     Boris Brezillon <boris.brezillon@collabora.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <robh+dt@kernel.org>, <vigneshr@ti.com>, <richard@nod.at>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <quic_srichara@quicinc.com>, <qpic_varada@quicinc.com>,
        <quic_sjaganat@quicinc.com>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
 <20201029100751.713e27df@collabora.com>
 <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
 <20230306153851.0dcdda27@xps-13>
From:   Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20230306153851.0dcdda27@xps-13>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BeaiQvF3fssM7SoEvGEbcFicwmdk2VcU
X-Proofpoint-GUID: BeaiQvF3fssM7SoEvGEbcFicwmdk2VcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270109
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/6/2023 8:08 PM, Miquel Raynal wrote:
> Hello,
> 
> quic_mdalam@quicinc.com wrote on Mon, 6 Mar 2023 19:45:58 +0530:
> 
>> On 10/29/2020 2:37 PM, Boris Brezillon wrote:
>>> Hello,
>>>
>>> On Sat, 10 Oct 2020 11:01:39 +0530
>>> Md Sadre Alam <mdalam@codeaurora.org> wrote:
>>>   
>>>> This change will add initial support for qspi (serial nand).
>>>>
>>>> QPIC Version v.2.0 onwards supports serial nand as well so this
>>>> change will initialize all required register to enable qspi (serial
>>>> nand).
>>>>
>>>> This change is supporting very basic functionality of qspi nand flash.
>>>>
>>>> 1. Reset device (Reset QSPI NAND device).
>>>>
>>>> 2. Device detection (Read id QSPI NAND device).
>>> Unfortunately, that's not going to work in the long term. You're
>>> basically hacking the raw NAND framework to make SPI NANDs fit. I do
>>> understand the rationale behind this decision (re-using the code for
>>> ECC and probably other things), but that's not going to work. So I'd
>>> recommend doing the following instead:
>>>
>>> 1/ implement a SPI-mem controller driver
>>> 2/ implement an ECC engine driver so the ECC logic can be shared
>>>      between the SPI controller and raw NAND controller drivers
>>> 3/ convert the raw NAND driver to the exec_op() interface (none of
>>>      this hack would have been possible if the driver was using the new
>>>      API)
>>>
>>> Regards,
>>>
>>> Boris
>>>   
>>      Sorry for late reply, again started working on this feature support.  The QPIC v2 on wards there is serial nand support got added , its not a standard SPI controller
>>
>>      its QPIC controller having support for serial nand. All SPI related configuration done by QPIC hardware and its not exposed as SPI bus to the external world. Only based on
>>
>>      QPIC_SPI_CFG = 1, serial functionality will get selected. So that no need to implement as SPI-mem controller driver, since its not a SPI controller.
>>
>>     Please check the below diagram for top view of QPIC controller.
> 
> One of the hard things in the Linux kernel is to make devices fit
> frameworks. This feature does not fit the raw NAND framework. It does
> not follow any of the conventions taken there. It is not gonna be
> accepted there. You need to expose spi-mem functionalities, even if the
> spi-proper features are not available. I believe your situation still
> fits the spi-mem abstraction.
> 
> Thanks,
> Miquèl


I have started writing the driver code for SPI NAND. Please check the below design,
is this fine as per Boris suggestion.


           |------------------------|                      |------------------------------|                        |---------------------------------|
           |qcom spi nand driver    |--------------------->|common ECC engine driver      |<-----------------------|qcom raw nand driver             |
           |                        |                      |                              |                        |                                 |
           |                        |                      |drivers/mtd/nand/ecc-qcom.c   |                        |drivers/mtd/nand/raw/qcom_nand.c |
           |                        |                      |                              |                        |                                 |
           |drivers/spi/spi-qpic.c  |                      |------------------------------|                        |                                 |
           |                        |                      |common API file:              |                        |                                 |
           |                        |                      |common API: reset, read id,   |                        |                                 |
           |                        |--------------------->|erase, read page, write page, |<-----------------------|                                 |
           |------------------------|                      |bad block check etc.          |                        |                                 |
                                                           |                              |                        |---------------------------------|
                                                           |drivers/mtd/nand/raw/qpic_comm|
                                                           |    on.c                      |
                                                           |------------------------------|


Here ECC engine driver as separate file under (drivers/mtd/nand/ecc-qcom.c) and all
common APIs like reset, read id, erase, write page, read page, check block bad etc.
as separate file under drivers/mtd/nand/raw/qpic_common.c.APIs under ECC engine drivers
and qpic_common.c will be exported and used by spi-qpic.c driver (Serial NAND) and qcom_nand.c
(raw nand driver).

Thanks,
Alam.
