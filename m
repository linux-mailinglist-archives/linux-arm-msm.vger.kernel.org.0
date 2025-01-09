Return-Path: <linux-arm-msm+bounces-44542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A73A0732A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 11:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEC51885ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F7E21578A;
	Thu,  9 Jan 2025 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WmQDcqEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8F1EBA19;
	Thu,  9 Jan 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418589; cv=none; b=gm+Fi4Ckctpl8OJln8IMdxKQl7caNPA5VpAG/XHjU+Ry1mCYD/4E7JoCjTrn0Bh2nZLpyxfSy/NtCAq2UUmgpYsTIajnfyz3VbFyC86IB8Y0NwaOYwlhsjGVa8l1yHjmNcaYPO8eUQr1/wnZWdzk4FyHl5xNeEiyDA3rZ3x3+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418589; c=relaxed/simple;
	bh=A8Jvny284Ah9JmJIbQ7A7QBewlSmYYlJCcjXr91TtNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dUFbb5iuCsynIlWf22Bjr0J9SMNWRFcfLxc8rQe0b2ej4/RsDIuRIZ6uPm13IQyD0EmyCDJLHE86/fBVI2tSoaYbQAKWgqoKdVdo0gJEkpUhpouIGTBnIFm//RTF8lScCYZqHlp+u38pJUplfjv+LcMRfG0+PHJeTcnhs6iVNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WmQDcqEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096hdIG022339;
	Thu, 9 Jan 2025 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	011PxFbLqqkOVf7IdTJZZbt1NJEiR+8pY1Pl3Io/cro=; b=WmQDcqEBLKcK0VnN
	+DOleDB568lkd3UkXEILCEiANEq6CzEACtOlCdIb1DS2XchfVgAQ4Dmuu+8JvwxI
	hcPwgdBsLSK65dopyOejhUn2pEVuGXM3B/PK6aRplH01ha223tP+uQ39JoBdbQlE
	chq/tmJS7nvkqsuBwQUlqUWCkXCFPqInq7xQCWDeoCEEqW7HC4Aliw9ZmHzgqESH
	6Gcvo7aR4hclNoppHUl7K+R70kne5MtYgKyCDwXA7/gxDA8UhxPbAwEsQhmy3U10
	M9o8UXu9aPqpjBZbOB64xvbN05iIsuVCtHkAH6Ltul3ctGKdtVpCzfhI4AbK8ubK
	AcyNeQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429epghwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 10:29:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509ATgJo014326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 10:29:42 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 02:29:40 -0800
Message-ID: <829e68c7-1a9f-45e9-9a81-77bd9985d85f@quicinc.com>
Date: Thu, 9 Jan 2025 15:59:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Update memory map
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241217092636.17482-1-quic_pbrahma@quicinc.com>
 <hhwc5euwxjpg5r4nfoh77do2g5sm26r7vfs6ibboqw3x4qkwze@zld5mnznijvu>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <hhwc5euwxjpg5r4nfoh77do2g5sm26r7vfs6ibboqw3x4qkwze@zld5mnznijvu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 90QsjjGegJuTP4U4dhkQ5C0jtE3BlUZw
X-Proofpoint-ORIG-GUID: 90QsjjGegJuTP4U4dhkQ5C0jtE3BlUZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090084


On 1/7/2025 5:45 AM, Bjorn Andersson wrote:
> On Tue, Dec 17, 2024 at 02:56:36PM +0530, Pratyush Brahma wrote:
>> This is based on Jingyi Wang's patches [1] to introduce the
>> initial dtsi for QCS8300 SOC.
>>
>> New updates to the memory map of qcs8300 have brought in some
>> new carveouts (viz. sail_ss, firmware memory, tz memory, etc.) and
>> also the base addresses of some of the pil carveouts (q6_cdsp_dtb_mem
>> and cdsp_mem) have changed.
>>
>> Incorporate these changes in the new memory map for qcs8300. Also
>> modify the labels of some of the carveouts to indicate pil carveouts.
>>
>> [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com/
> Does QCS8300 not boot using the efi-stub and get a memory map with most
> of these regions removed already?
>
> The excessive representation of reserved-memory regions should only be
> required for targets using ABL. (And the regions that the OS is expected
> to actually interact with, such as smem and PIL regions).
Yes, it boots with the efi-stub but there are some carveouts like 
gunyah_md, hyp_mem, etc
which it doesn't pass as holes. The OS has no use of it but there are S2 
protections
on these regions by hypervisor. When buddy tries to allocate from these 
regions, it results into external aborts.
Manually finding out the regions which are not passed as holes but need 
to be no-map wastes
significant development efforts. To err on the side of caution, I felt 
it would be better to mention
all the regions that kernel isn't supposed to touch anyway.
>
> Regards,
> Bjorn
>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 180 ++++++++++++++++++++++++--
>>   1 file changed, 170 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 2c35f96c3f28..e16d11c05515 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -377,6 +377,21 @@
>>   		#size-cells = <2>;
>>   		ranges;
>>   
>> +		sail_ss_mem: sail-ss-region@80000000 {
>> +			reg = <0x0 0x80000000 0x0 0x10000000>;
>> +			no-map;
>> +		};
>> +
>> +		hyp_mem: hyp-region@90000000 {
>> +			reg = <0x0 0x90000000 0x0 0x600000>;
>> +			no-map;
>> +		};
>> +
>> +		xbl_boot_mem: xbl-boot-region@90600000 {
>> +			reg = <0x0 0x90600000 0x0 0x200000>;
>> +			no-map;
>> +		};
>> +
>>   		aop_image_mem: aop-image-region@90800000 {
>>   			reg = <0x0 0x90800000 0x0 0x60000>;
>>   			no-map;
>> @@ -388,6 +403,26 @@
>>   			no-map;
>>   		};
>>   
>> +		uefi_logs_mem: uefi-logs-region@908b0000 {
>> +			reg = <0x0 0x908b0000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		ddr_training_checksum_data_mem: ddr-training-checksum-data-region@908c0000 {
>> +			reg = <0x0 0x908c0000 0x0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		reserved_mem: reserved-region@908f0000 {
>> +			reg = <0x0 0x908f0000 0x0 0xe000>;
>> +			no-map;
>> +		};
>> +
>> +		secdata_apps_mem: secdata-apps-region@908fe000 {
>> +			reg = <0x0 0x908fe000 0x0 0x2000>;
>> +			no-map;
>> +		};
>> +
>>   		smem_mem: smem@90900000 {
>>   			compatible = "qcom,smem";
>>   			reg = <0x0 0x90900000 0x0 0x200000>;
>> @@ -395,6 +430,61 @@
>>   			hwlocks = <&tcsr_mutex 3>;
>>   		};
>>   
>> +		tz_sail_mailbox_mem: tz-sail-mailbox-region@90c00000 {
>> +			reg = <0x0 0x90c00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		sail_mailbox_mem: sail-mailbox-region@90d00000 {
>> +			reg = <0x0 0x90d00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		sail_ota_mem: sail-ota-region@90e00000 {
>> +			reg = <0x0 0x90e00000 0x0 0x300000>;
>> +			no-map;
>> +		};
>> +
>> +		xbl_dtlog_mem: xbl-dtlog-region@91a40000 {
>> +			reg = <0x0 0x91a40000 0x0 0x40000>;
>> +			no-map;
>> +		};
>> +
>> +		gunyah_md_mem: gunyah-md-region@91a80000 {
>> +			reg = <0x0 0x91a80000 0x0 0x80000>;
>> +			no-map;
>> +		};
>> +
>> +		aoss_backup_mem: aoss-backup-region@91b00000 {
>> +			reg = <0x0 0x91b00000 0x0 0x40000>;
>> +			no-map;
>> +		};
>> +
>> +		cpucp_backup_mem: cpucp-backup-region@91b40000 {
>> +			reg = <0x0 0x91b40000 0x0 0x40000>;
>> +			no-map;
>> +		};
>> +
>> +		tz_config_backup_mem: tz-config-backup-region@91b80000 {
>> +			reg = <0x0 0x91b80000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		ddr_training_data_mem: ddr-training-data-region@91b90000 {
>> +			reg = <0x0 0x91b90000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		cdt_data_backup_mem: cdt-data-backup-region@91ba0000 {
>> +			reg = <0x0 0x91ba0000 0x0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		tzffi_mem: tzffi-region@91c00000 {
>> +			reg = <0x0 0x91c00000 0x0 0x1400000>;
>> +			no-map;
>> +		};
>> +
>>   		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
>>   			reg = <0x0 0x93b00000 0x0 0xf00000>;
>>   			no-map;
>> @@ -405,12 +495,12 @@
>>   			no-map;
>>   		};
>>   
>> -		camera_mem: camera-region@95200000 {
>> +		camera_mem: pil-camera-region@95200000 {
>>   			reg = <0x0 0x95200000 0x0 0x500000>;
>>   			no-map;
>>   		};
>>   
>> -		adsp_mem: adsp-region@95c00000 {
>> +		adsp_mem: pil-adsp-region@95c00000 {
>>   			no-map;
>>   			reg = <0x0 0x95c00000 0x0 0x1e00000>;
>>   		};
>> @@ -425,35 +515,105 @@
>>   			no-map;
>>   		};
>>   
>> -		gpdsp_mem: gpdsp-region@97b00000 {
>> +		gpdsp_mem: pil-gpdsp-region@97b00000 {
>>   			reg = <0x0 0x97b00000 0x0 0x1e00000>;
>>   			no-map;
>>   		};
>>   
>> -		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
>> -			reg = <0x0 0x99900000 0x0 0x80000>;
>> +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9b700000 {
>> +			reg = <0x0 0x9b700000 0x0 0x80000>;
>>   			no-map;
>>   		};
>>   
>> -		cdsp_mem: cdsp-region@99980000 {
>> -			reg = <0x0 0x99980000 0x0 0x1e00000>;
>> +		cdsp_mem: pil-cdsp-region@99900000 {
>> +			reg = <0x0 0x99900000 0x0 0x1e00000>;
>>   			no-map;
>>   		};
>>   
>> -		gpu_microcode_mem: gpu-microcode-region@9b780000 {
>> +		gpu_microcode_mem: pil-gpu-region@9b780000 {
>>   			reg = <0x0 0x9b780000 0x0 0x2000>;
>>   			no-map;
>>   		};
>>   
>> -		cvp_mem: cvp-region@9b782000 {
>> +		cvp_mem: pil-cvp-region@9b782000 {
>>   			reg = <0x0 0x9b782000 0x0 0x700000>;
>>   			no-map;
>>   		};
>>   
>> -		video_mem: video-region@9be82000 {
>> +		video_mem: pil-video-region@9be82000 {
>>   			reg = <0x0 0x9be82000 0x0 0x700000>;
>>   			no-map;
>>   		};
>> +
>> +		audio_mdf_mem: audio-mdf-region@ae000000 {
>> +			reg = <0x0 0xae000000 0x0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		firmware_mem: firmware-region@b0000000 {
>> +			reg = <0x0 0xb0000000 0x0 0x800000>;
>> +			no-map;
>> +		};
>> +
>> +		hyptz_reserved_mem: hyptz-reserved@beb00000 {
>> +			reg = <0x0 0xbeb00000 0x0 0x11500000>;
>> +			no-map;
>> +		};
>> +
>> +		firmware_scmi_mem: scmi-region@d0000000 {
>> +			reg = <0x0 0xd0000000 0x0 0x40000>;
>> +			no-map;
>> +		};
>> +
>> +		firmware_logs_mem: firmware-logs-region@d0040000 {
>> +			reg = <0x0 0xd0040000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		firmware_audio_mem: firmware-audio-region@d0050000 {
>> +			reg = <0x0 0xd0050000 0x0 0x4000>;
>> +			no-map;
>> +		};
>> +
>> +		firmware_reserved_mem: firmware-reserved-region@d0054000 {
>> +			reg = <0x0 0xd0054000 0x0 0x9c000>;
>> +			no-map;
>> +		};
>> +
>> +		firmwarequantum_test_mem: firmwarequantum-test-region@d00f0000 {
>> +			reg = <0x0 0xd00f0000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		tags_mem: tags-region@d0100000 {
>> +			reg = <0x0 0xd0100000 0x0 0x800000>;
>> +			no-map;
>> +		};
>> +
>> +		qtee_mem: qtee-region@d1300000 {
>> +			reg = <0x0 0xd1300000 0x0 0x500000>;
>> +			no-map;
>> +		};
>> +
>> +		deep_sleep_back_up_mem: deep-sleep-back-up-region@d1800000 {
>> +			reg = <0x0 0xd1800000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		trusted_apps_mem: trusted-apps-region@d1900000 {
>> +			reg = <0x0 0xd1900000 0x0 0x1900000>;
>> +			no-map;
>> +		};
>> +
>> +		tz_stat_mem: tz-stat-region@db100000 {
>> +			reg = <0x0 0xdb100000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		cpucp_fw_mem: cpucp-fw-region@db200000 {
>> +			reg = <0x0 0xdb200000 0x0 0x100000>;
>> +			no-map;
>> +		};
>>   	};
>>   
>>   	smp2p-adsp {
>> -- 
>> 2.17.1
>>
-- 
Thanks and Regards
Pratyush Brahma


