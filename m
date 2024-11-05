Return-Path: <linux-arm-msm+bounces-36987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 622369BC1FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 01:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C000BB215C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 00:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152D48F62;
	Tue,  5 Nov 2024 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jtbsMO7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3223BE;
	Tue,  5 Nov 2024 00:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730766384; cv=none; b=I660gmvMYcee/FNkA51le8f6+l15Vp6i6dw7Lv890bUCkzEf5RJ+X4S4/HtU4Hq+HzvMeGn1azbtq4uq7evpWsdcsDS1mo0Scee6+K89pv3opEzQirXIW+gcykFFJoVbInDXh0kAMHlLXeZA8bE6YMOnWhPHURhU8lFiScVLDgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730766384; c=relaxed/simple;
	bh=EdIcR1fMwyzrH8F/FF+qgFhuLFr0NwEScRS317/AAPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HwH9GDUmCtZjPsaymqQu4WBLQtJFQSW6/nRNsHzxNVyrji0UpFWccqdIl3XAyv4nkQHTQmU2/+0ZK5Tuxgilctk1Klt69/SEg3mBT4zKJ/TeLWrbJVh2NrosimscSdNG3rx3YbZtrf0X62fjpkoMxrnFX457L4HDtsU2WyjzII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jtbsMO7Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIe2a015613;
	Tue, 5 Nov 2024 00:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBN3T4Vgmqp57QrQMRJMBEh0Fc1TKbJGeO9Gl1LpGHY=; b=jtbsMO7QNkK8SaJ3
	hIrdRSYcKrqeKH28AbjhABP5gXXVt6imPIb8UMBZfYcMeHIsF3Aj1Q9sIq6+Ho+n
	1KSkVT+YboVPKXLel+7u8Y415c7hTmwZ9Sxg9JOppMrYbMjJwtmoV0aTpZcDG9ms
	rOHQbzb3Fdwk5mk3uqlKRQPqQVxQdoPikbEsYQsLQvzQt8OGRBZSOd8GyiMUdC1N
	IMEMdLmRL0W9F9Sz8eqxL0/te1cxTtA2xDXpKcZKbeiUZL8V0XXL1hUmpmtr8+mK
	7JIoB7jV2qz9jHqRriidrhn8L118GUSP5w5VznOrV86/2zfEwAJZXydJkPGtj90E
	beu09g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8gcb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 00:26:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A50QGB6016077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 00:26:16 GMT
Received: from [10.71.115.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 16:26:16 -0800
Message-ID: <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>
Date: Mon, 4 Nov 2024 16:26:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qrtr/mhi: NULL-deref with in-kernel pd-mapper
To: Johan Hovold <johan@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>
CC: Qiang Yu <quic_qianyu@quicinc.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kOFPgUbwC95y-qgApyhP6RF_-v3_KOak
X-Proofpoint-ORIG-GUID: kOFPgUbwC95y-qgApyhP6RF_-v3_KOak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050001



On 11/1/2024 8:01 AM, Johan Hovold wrote:
> Hi,
> 
> I just ran into a NULL-deref in a qrts/mhi path during boot of the
> x1e80100 CRD for the second time.
> 
> First time was with a 6.11 kernel (but I never got around to reporting
> it) and today it happened again with 6.12-rc5.
> 
> Both times I was using the in-kernel pd-mapper, which has exposed a
> number of bugs elsewhere due to changes in timing, but I'm not sure if
> the pd-mapper is involved here or not.
> 
> See serial console log below.
> 
> Last time I think the machine survived so that I could save a cleaner
> log of the oops. That one is included after the serial log for
> completeness.
> 
> Johan
> 
> 
> [    8.531773] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
> 
> [    8.825593] Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000034
> .
> [    8.838623] Mem abort info:
> [    8.838626]   ESR = 0x0000000096000004
> [    8.838628]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    8.838630]   SET = 0, FnV = 0
> [    8.838632]   EA = 0, S1PTW = 0
> [    8.838633]   FSC = 0x04: level 0 translation fault
> [    8.838635] Data abort info:
> [    8.838637]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    8.838639]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    8.838641]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    8.838643] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008813bf000
> [    8.838645] [0000000000000034] pgd=0000000000000000, p4d=0000000000000000
> [    8.838777] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    8.857297] Modules linked in: mhi_wwan_ctrl(+) wwan qrtr_mhi(+) mhi_net(+) rpmsg_ctrl(+) rpmsg_char pmic_glink_altm
> ode qcom_pd_mapper ucsi_glink aux_hpd_bridge qcom_battmgr typec_ucsi hci_uart btqca phy_qcom_eusb2_repeater qcom_spmi_t
> emp_alarm(+) qcom_pon bluetooth sm3_ce ps8830 ath12k(+)
> [    8.864039]  industrialio sm3 reboot_mode nvmem_qcom_spmi_sdam mac80211 snd_soc_x1e80100 phy_qcom_qmp_combo regmap_i
> 2c sha3_ce ecdh_generic pci_pwrctl_pwrseq ecc aux_bridge
> [    8.872648]  snd_soc_qcom_common libarc4 sha512_ce pci_pwrctl_core pwrseq_qcom_wcn sha512_arm64 snd_soc_qcom_sdw typ
> ec pwrseq_core qcom_q6v5_pas qcom_stats
> [    8.880892]  snd_soc_wcd938x input_leds mhi_pci_generic snd_soc_wcd_classh qcom_pil_info snd_soc_wcd938x_sdw qcom_co
> mmon dispcc_x1e80100 snd_soc_lpass_rx_macro led_class qcom_glink_smem
> [    8.889499]  snd_soc_lpass_tx_macro snd_soc_lpass_va_macro regmap_sdw snd_soc_lpass_wsa_macro mhi phy_qcom_edp pinct
> rl_sm8550_lpass_lpi snd_soc_wcd_mbhc soundwire_qcom snd_soc_lpass_macro_common
> [    8.900156]  qcom_glink phy_qcom_qmp_usb phy_qcom_snps_eusb2 pinctrl_lpass_lpi lpasscc_sc8280xp qrtr snd_soc_core qc
> om_q6v5 cfg80211 gpucc_x1e80100
> [    8.913754]  qcom_sysmon
> [    8.933436]  pmic_glink snd_compress rfkill icc_bwmon rpmsg_core snd_pcm pdr_interface qcom_cpucp_mbox snd_timer soc
> info arm_smccc_trng qcom_pdr_msg qmi_helpers snd rng_core soundcore soundwire_bus fuse dm_mod ip_tables
> [    8.960019] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
> [    8.972985]  x_tables ipv6 autofs4 msm mdt_loader drm_exec gpu_sched drm_display_helper drm_kms_helper drm_dp_aux_bu
> s llcc_qcom pcie_qcom crc8
> [    9.002021]  phy_qcom_qmp_pcie tcsrcc_x1e80100 nvme nvme_core hid_multitouch i2c_qcom_geni i2c_hid_of i2c_hid drm i2
> c_core
> [    9.002030] CPU: 10 UID: 0 PID: 11 Comm: kworker/u48:0 Not tainted 6.12.0-rc5 #4
> [    9.029550] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> [    9.029552] Workqueue: qrtr_ns_handler qrtr_ns_worker [qrtr]
> [    9.061350] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    9.061353] pc : mhi_gen_tre+0x44/0x224 [mhi]
> [    9.090573] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with 2-0008
> [    9.106931] lr : mhi_gen_tre+0x40/0x224 [mhi]
> [    9.106934] sp : ffff8000800fb7d0
> [    9.106935] x29: ffff8000800fb7d0 x28: ffff6db7852bd000 x27: ffff800082490188
> [    9.120382] dwc3 a000000.usb: Adding to iommu group 5
> [    9.133750]
> [    9.133752] x26: 0000000000000000 x25: ffff6db783e65080 x24: ffff80008248ff88
> [    9.133754] x23: 0000000000000000 x22: ffff80008248ff80 x21: ffff8000800fb890
> [    9.133756] x20: 0000000000000000 x19: 0000000000000002 x18: 000000000005cf20
> [    9.133758] x17: 0000000000000028 x16: 0000000000000000
> [    9.172738]  x15: ffffa5834131fbd0
> [    9.172741] x14: ffffa5834137caf0 x13: 000000000000ce30 x12: ffff6db7808bc028
> [    9.172743] x11: ffffa58341993000 x10: 0000000000000000 x9 : 00000000cf3f2b90
> [    9.172745] x8 : 0000000094e5072b x7 : 00000000000404ce x6 : ffffa5834162cfb0
> [    9.172747] x5 : 000000000000008b x4 : ffffa583419cddf0 x3 : 0000000000000007
> [    9.172750] x2 : 0000000000000000
> [    9.192697]  x1 : 000000000000000a x0 : ffff6db7808bb700
> [    9.192700] Call trace:
> [    9.192701]  mhi_gen_tre+0x44/0x224 [mhi]
> [    9.192704]  mhi_queue+0x74/0x194 [mhi]
> [    9.192706]  mhi_queue_skb+0x5c/0x8c [mhi]
> [    9.210985]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
> [    9.210989]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
> [    9.210992]  qrtr_bcast_enqueue+0x78/0xe8 [qrtr]
> [    9.225530]  qrtr_sendmsg+0x15c/0x33c [qrtr]
> [    9.225532]  sock_sendmsg+0xc0/0xec
> [    9.240436]  kernel_sendmsg+0x30/0x40
> [    9.240438]  service_announce_new+0xbc/0x1c4 [qrtr]
> [    9.240440]  qrtr_ns_worker+0x714/0x794 [qrtr]
> [    9.240441]  process_one_work+0x210/0x614
> [    9.254527]  worker_thread+0x23c/0x378
> [    9.254529]  kthread+0x124/0x128
> [    9.254531]  ret_from_fork+0x10/0x20
> [    9.254534] Code: aa0003f9 aa1b03e0 94001a4d f9401b14 (3940d280)
> [    9.267369] ---[ end trace 0000000000000000 ]---
> [    9.267371] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 

Thanks for reporting this.

I'm not sure the in-kernel pd-mapper should be affecting this path. I 
think this is for WLAN since it is the mhi qrtr and I'm not aware of 
WLAN needing to listen to the pd-mapper framework.

The offset seems to be mapped back to 
linux/drivers/bus/mhi/host/main.c:1220, I had some extra debug configs 
enabled so not sure the offset is still valid.

	WARN_ON(buf_info->used);
	buf_info->pre_mapped = info->pre_mapped;

This looks like the null pointer would happen if qrtr tried to send 
before mhi_channel_prepare() is called.

I think we have a patch that might fix this, let me dig it up and send 
it out.

> 
> [    9.408420] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000034
> [    9.408429] Mem abort info:
> [    9.408431]   ESR = 0x0000000096000004
> [    9.408434]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    9.408437]   SET = 0, FnV = 0
> [    9.408439]   EA = 0, S1PTW = 0
> [    9.408441]   FSC = 0x04: level 0 translation fault
> [    9.408444] Data abort info:
> [    9.408446]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    9.408448]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    9.408450]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    9.408453] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000882f43000
> [    9.408456] [0000000000000034] pgd=0000000000000000, p4d=0000000000000000
> [    9.408476] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    9.408479] Modules linked in: mhi_wwan_ctrl(+) wwan qrtr_mhi(+) mhi_net(+) qcom_pd_mapper(+) ucsi_glink pmic_glink_
> altmode sm3_ce qcom_battmgr(+) aux_hpd_bridge typec_ucsi ath12k(+) sm3 sha3_ce mac80211 snd_soc_x1e80100 sha512_ce liba
> rc4 phy_qcom_eusb2_repeater nvmem_qcom_spmi_sdam sha512_arm64 ps8830(+) snd_soc_qcom_common qcom_spmi_temp_alarm snd_so
> c_qcom_sdw qcom_pon qcom_q6v5_pas regmap_i2c phy_qcom_qmp_combo reboot_mode aux_bridge qcom_pil_info industrialio typec
>   cfg80211 phy_qcom_snps_eusb2 qcom_stats phy_qcom_edp dispcc_x1e80100 qcom_common pinctrl_sm8550_lpass_lpi snd_soc_lpas
> s_va_macro qcom_glink_smem pinctrl_lpass_lpi lpasscc_sc8280xp snd_soc_wcd938x snd_soc_lpass_tx_macro snd_soc_lpass_wsa_
> macro snd_soc_lpass_rx_macro qcom_glink snd_soc_wcd_classh soundwire_qcom snd_soc_lpass_macro_common snd_soc_wcd938x_sd
> w qcom_q6v5 regmap_sdw mhi_pci_generic gpucc_x1e80100 snd_soc_wcd_mbhc qcom_sysmon mhi icc_bwmon snd_soc_core rfkill sn
> d_compress qrtr snd_pcm qcom_cpucp_mbox snd_timer input_leds pmic_glink snd
> [    9.408524]  led_class arm_smccc_trng rng_core rpmsg_core soundcore pdr_interface soundwire_bus qcom_pdr_msg socinfo
>   qmi_helpers fuse dm_mod ip_tables x_tables ipv6 autofs4 msm mdt_loader drm_exec gpu_sched drm_display_helper drm_kms_h
> elper drm_dp_aux_bus llcc_qcom pcie_qcom crc8 phy_qcom_qmp_pcie tcsrcc_x1e80100 nvme nvme_core hid_multitouch i2c_qcom_
> geni i2c_hid_of i2c_hid drm i2c_core
> [    9.408548] CPU: 4 UID: 0 PID: 94 Comm: kworker/u48:1 Not tainted 6.11.0 #185
> [    9.408550] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> [    9.408551] Workqueue: qrtr_ns_handler qrtr_ns_worker [qrtr]
> [    9.408556] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    9.408558] pc : mhi_gen_tre+0x44/0x224 [mhi]
> [    9.408563] lr : mhi_gen_tre+0x40/0x224 [mhi]
> [    9.408566] sp : ffff800080d637d0
> [    9.408567] x29: ffff800080d637d0 x28: ffff65434505a380 x27: ffff8000827ee188
> [    9.408570] x26: 0000000000000000 x25: ffff65434ad59080 x24: ffff8000827edf88
> [    9.408572] x23: 0000000000000000 x22: ffff8000827edf80 x21: ffff800080d63890
> [    9.408575] x20: 0000000000000000 x19: 0000000000000002 x18: 00000000000506c0
> [    9.408577] x17: 0000000000000028 x16: 0000000000000000 x15: ffffb0aa21cdac88
> [    9.408579] x14: ffffb0aa21d2b348 x13: 000000000000a9ac x12: ffff654341700928
> [    9.408582] x11: ffffb0aa2234ecc8 x10: fffffffffffffd20 x9 : 0000000089ad6b58
> [    9.408585] x8 : 00000000d944ea76 x7 : 00000000000404a8 x6 : ffffb0aa21fd49a8
> [    9.408587] x5 : 0000000000000084 x4 : ffffb0aa223883b8 x3 : 000000001fffffff
> [    9.408589] x2 : 0000000000000000 x1 : 0000000000000004 x0 : ffff654341700000
> [    9.408592] Call trace:
> [    9.408593]  mhi_gen_tre+0x44/0x224 [mhi]
> [    9.408596]  mhi_queue+0x74/0x194 [mhi]
> [    9.408598]  mhi_queue_skb+0x5c/0x8c [mhi]
> [    9.408601]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
> [    9.408604]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
> [    9.408606]  qrtr_bcast_enqueue+0x78/0xdc [qrtr]
> [    9.408609]  qrtr_sendmsg+0x15c/0x33c [qrtr]
> [    9.408612]  sock_sendmsg+0xc0/0xec
> [    9.408617]  kernel_sendmsg+0x30/0x40
> [    9.408619]  service_announce_new+0xbc/0x1c4 [qrtr]
> [    9.408621]  qrtr_ns_worker+0x714/0x794 [qrtr]
> [    9.408622]  process_one_work+0x210/0x614
> [    9.408626]  worker_thread+0x23c/0x378
> [    9.408627]  kthread+0x124/0x128
> [    9.408628]  ret_from_fork+0x10/0x20
> [    9.408631] Code: aa0003f9 aa1b03e0 94001a51 f9401b14 (3940d280)
> [    9.408633] ---[ end trace 0000000000000000 ]---

