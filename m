Return-Path: <linux-arm-msm+bounces-41677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1A9EE12E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 477D5161A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636EA20C030;
	Thu, 12 Dec 2024 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BO9eJAyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4620C01D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991782; cv=none; b=a4rYE0trk0aQSdryHqWsYtPPHnzle6LT1S+YdDikcnrebqkM2SNBq8P/i4cFEH2qe/2xPBbCxFQzOHW0WgrcoFiH7oa2n55g+2nrgl3BcejqlRLyLEg01O9CqZPpyr3hLfzcabR/fqJSwSdMtNVONZAfnU3d8qTAKUdoWGoZhx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991782; c=relaxed/simple;
	bh=bSbZCqiBxxbA441hmt/QZqPPacsc0H+lynaMJ2djS0c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=E/IdaZOKbQ6rknejI1TjHsXwggV7Hry0qNrEOqugXOdtoWAVg2Ovp3+d+xuTQkvN6nVpV3is3VA1Zeaj2CGtuYhX69PiHvkChPWz2yMceLbC1fiERqGxCVjsJwaNtUEX2wUnX8lXhcsT1lkxXbxWW1N3y4ElGKkNZPabTM3q5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BO9eJAyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7Qh4F029905;
	Thu, 12 Dec 2024 08:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZ6wtn99j/zpRIyVhxNj7JJE5CICJ/KZNBfWCSPqchI=; b=BO9eJAyJc+FOzMc4
	t9O3q3MpKevKLRaYxFpT0qahW46uENPOv83I+14PvRwKyGrHabM4XCc6mcIG0IOB
	XefFyvVwaqtYe5FmCSM571xHt/zzizj4MHsjNQti0ROQZ3F+aKLHVdt1KF7BubBQ
	mLaUBtaSHcJr+No3iDTDeEyYm5V2vEQB4iNYAMrHLafNWYMrtXQydE0kmlSw4Hks
	3pF4K+BikoigI+NEIjpVA9mKvT4AeoZjc9W68AXsft9I5Lu+WDpqcfwnhGAm8Zxo
	hdXtoQrvSct6wOa76u3bDLSn4oIjtxa2DM/QShyGvyAjk/jTXx1tzw6ITSdLBhOO
	+HO2+Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xt81m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 08:22:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC8Mt1b029939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 08:22:55 GMT
Received: from [10.216.55.174] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 00:22:52 -0800
Message-ID: <a589d8b2-5d2e-c13d-9251-c18e1040407a@quicinc.com>
Date: Thu, 12 Dec 2024 13:52:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: add venus firmware file for qcs615
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
 <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>
 <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
 <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com>
In-Reply-To: <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KBrju4IgF-9eW5NC6CeLAC9mC_mV8-rj
X-Proofpoint-GUID: KBrju4IgF-9eW5NC6CeLAC9mC_mV8-rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120057


On 12/2/2024 8:51 PM, Vikash Garodia wrote:
> 
> On 12/2/2024 8:41 PM, Dmitry Baryshkov wrote:
>> On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
>>>
>>> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
>>>>>>>>
>>>>>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
>>>>>>>>>>>>>>> Hello
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> are available in the Git repository at:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> ----------------------------------------------------------------
>>>>>>>>>>>>>>> Renjiang Han (1):
>>>>>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> WHENCE                      |   1 +
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Could you please be more specific, what is the difference between the
>>>>>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
>>>>>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
>>>>>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
>>>>>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
>>>>>>>>>>>>
>>>>>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
>>>>>>>>>>>> use v5 signatures?
>>>>>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
>>>>>>>>>>> far i have seen 2 categories in signing version for video bins, either default
>>>>>>>>>>> or v6 specific tool.
>>>>>>>>>>
>>>>>>>>>> Can firmware / security engineers actually advice us on using v5
>>>>>>>>>> firmware signatures with QCS615 _and_ with older platforms?
>>>>>>>>>> Existing venus-5.4/venus.mbn uses v3
>>>>>>>>>
>>>>>>>>> Vikash, any updates on this topic? Would it be possible to have a single
>>>>>>>>> FW image with just v5 signatures?
>>>>>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
>>>>>>>> the signing requirements across different SOCs, hopefully will be able to add
>>>>>>>> something on this by then.
>>>>>>
>>>>>> It's been more than a week since the last email. Are there any updates?
>>>>>> I'd really like to get this sorted out before next linux-firmware
>>>>>> release, otherwise we'll be stuck with these names for the foreseeable
>>>>>> future.
>>>>> I have been chasing both the firmware and security folks to align on this. So
>>>>> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
>>>>
>>>> I think the existing firmware uses v3, not v5.
>>>>
>>>> 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
>>>>
>>>>
>>>>> to different set of binaries. These MBN versions of signing is defined at SOC
>>>>> level and depends on secure boot libraries used in that SOC.
>>>>> At the same time, there is an experiment to check if SC7180 can be signed with
>>>>> version used for QCS615 i.e MBNV6.
>>>>
>>>> Thanks! Are you trying that without updating the whole bootloader stack? I
>>>> think some of SC7180 devices might be EOL'd, so it might be hard to get
>>>> FW/bootloader updates.
>>> Just the firmware part, by signing it with qcs615 way, as an experiment
>>> suggested by security folks.
>>
>> Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
>> the laptop, caboom or not caboom. If I remember correctly the file that
>> you've pushed even lists sc7180 as allowed.
> its used only for qcs615.
some good news, we could now have qcs615 firmware as common for both qcs615 as
well as sc7180. A PR would be raised to updated 5.4/venus.mbn and at the same
time to delete 5.4/venus_s6.mbn.

Regards,
Vikash
>>
>>>
>>>>> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
>>>>> is not enabled yet (patches in review) for video, we should be good if we
>>>>> conclude the firmware part before accepting the qcs615 enablement patches ?
>>>>
>>>> Good question. I think that depends on linux-firmware maintainer's
>>>> opinion.
>>>>
>>

