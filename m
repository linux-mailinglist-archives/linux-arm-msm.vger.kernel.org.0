Return-Path: <linux-arm-msm+bounces-32806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254498ACB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 21:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC14283B05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 19:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322D6199FAB;
	Mon, 30 Sep 2024 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YY0Z09gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6662199933;
	Mon, 30 Sep 2024 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724023; cv=none; b=EiRNblQ5bLBlsaK2DnisMLWtUF76oM9L07tQY0ipE+tQzpJjVJa/4Z4IYstyZzPJLw7hh0hu2WBTlWV1cyWbqsPZCX0LN9cJgDVpZD0dhi691oLwsM6Yt8/gg/GyDrXkxUNy6qkja6WymylUz3WiNKNi7L/kJYbhHheNTmW1nJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724023; c=relaxed/simple;
	bh=UJKvPEmjLzRTkPMKbGyfSLo25LyrJojYVuUosQA2g30=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WmlVM8baVNlT6w6mQM59XmDa+tvXx+iyDo1cVeTU0eNYTkAq1MrR1gAqSgw8PnXDUFHMsN+IVH6uCp6alNgkcYDzFirxQ/GR1OaVWehV0vEfXbdvyK1kwKZ/bP/TSp6MuFPJcNWqLLcQxmERKi8WaMqDF6FNRycbPIL2rFY3Nyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YY0Z09gX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBZIMo029830;
	Mon, 30 Sep 2024 19:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIHIsrxB1VgJf5Jm4xx4QA3REGo2kmyAQcw/MfVXEyc=; b=YY0Z09gXJf2/QXdn
	I9ICjTXXvG543e17PKRw4tTq/CEuvCvAvT3RYz6ln7nYnXbHNIXSd0oe8b22c3Pf
	nEvjEhiDUg0sg3bo69sWXhYH6biSkAtQgWwYdS1yLNPJdaH4BZRDojz1T293J3qh
	RdC8lMLZfDdLn1+ugEqVheqvk7cBaO+HA6ZvrtBbFxCHHDikM1Xbg5GqTkvaJOVM
	zNVq7uiIQagWIGruBkz5gCi+IqGIRNRBw4EhYsQTNI1tYscmAGGvbeosQKbTUghE
	IxiybV0ePK6wo39PmaXj0Ne8e0fz6fLljQOlfK4Lu8yU6lwSL5d4wbfTULRBYW/9
	5BIk2w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xb38wspe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 19:20:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UJK1YN030822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 19:20:01 GMT
Received: from [10.110.71.134] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 12:20:01 -0700
Message-ID: <866ef212-a00e-48c4-9cf1-d1d4ee78d0ae@quicinc.com>
Date: Mon, 30 Sep 2024 12:19:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
To: <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <b9e50652-4556-4eed-a013-8e417eccdb69@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <b9e50652-4556-4eed-a013-8e417eccdb69@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n3-Ce93zgnkRoy9WHyXn-TxGMgEhznT3
X-Proofpoint-ORIG-GUID: n3-Ce93zgnkRoy9WHyXn-TxGMgEhznT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409300140



On 9/30/2024 7:17 AM, neil.armstrong@linaro.org wrote:
> On 25/09/2024 00:59, Jessica Zhang wrote:
>> Cache the CWB block mask in the DPU virtual encoder and configure CWB
>> according to the CWB block mask within the writeback phys encoder
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 ++++++++++++ 
>> +++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 16 ++++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>>   3 files changed, 100 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/ 
>> gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index b2f0bf412451..2628f2d55cb3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -24,6 +24,7 @@
>>   #include "dpu_hw_catalog.h"
>>   #include "dpu_hw_intf.h"
>>   #include "dpu_hw_ctl.h"
>> +#include "dpu_hw_cwb.h"
>>   #include "dpu_hw_dspp.h"
>>   #include "dpu_hw_dsc.h"
>>   #include "dpu_hw_merge3d.h"
>> @@ -139,6 +140,7 @@ enum dpu_enc_rc_states {
>>    *            num_phys_encs.
>>    * @hw_dsc:        Handle to the DSC blocks used for the display.
>>    * @dsc_mask:        Bitmask of used DSC blocks.
>> + * @cwb_mask        Bitmask of used CWB muxes
>>    * @intfs_swapped:    Whether or not the phys_enc interfaces have 
>> been swapped
>>    *            for partial update right-only cases, such as pingpong
>>    *            split where virtual pingpong does not generate IRQs
>> @@ -185,6 +187,7 @@ struct dpu_encoder_virt {
>>       struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>       unsigned int dsc_mask;
>> +    unsigned int cwb_mask;
>>       bool intfs_swapped;
>> @@ -1063,6 +1066,7 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>       int num_cwb = 0;
>>       bool is_cwb_encoder;
>>       unsigned int dsc_mask = 0;
>> +    unsigned int cwb_mask = 0;
>>       int i;
>>       if (!drm_enc) {
>> @@ -1103,8 +1107,12 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>                                  ARRAY_SIZE(hw_pp));
>>       }
>> -    for (i = 0; i < num_cwb; i++)
>> +    for (i = 0; i < num_cwb; i++) {
>>           dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
>> +        cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
>> +    }
>> +
>> +    dpu_enc->cwb_mask = cwb_mask;
>>       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>               drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>> @@ -2071,6 +2079,9 @@ void dpu_encoder_helper_phys_cleanup(struct 
>> dpu_encoder_phys *phys_enc)
>>           }
>>       }
>> +    if (dpu_enc->cwb_mask)
>> +        dpu_encoder_helper_phys_setup_cwb(phys_enc, false);
>> +
>>       /* reset the merge 3D HW block */
>>       if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
>>           phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc- 
>> >hw_pp->merge_3d,
>> @@ -2114,6 +2125,68 @@ void dpu_encoder_helper_phys_cleanup(struct 
>> dpu_encoder_phys *phys_enc)
>>       ctl->ops.clear_pending_flush(ctl);
>>   }
>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys 
>> *phys_enc,
>> +                       bool enable)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys_enc- 
>> >parent);
>> +    struct dpu_hw_cwb *hw_cwb;
>> +    struct dpu_hw_cwb_setup_cfg cwb_cfg;
>> +
>> +    struct dpu_kms *dpu_kms;
>> +    struct dpu_global_state *global_state;
>> +    struct dpu_hw_blk *rt_pp_list[MAX_CHANNELS_PER_ENC];
>> +    int num_pp, rt_pp_idx[MAX_CHANNELS_PER_ENC];
>> +
>> +    if (!phys_enc || !phys_enc->hw_wb || !dpu_enc->cwb_mask)
>> +        return;
>> +
>> +    dpu_kms = phys_enc->dpu_kms;
>> +    global_state = dpu_kms_get_existing_global_state(dpu_kms);
>> +    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +                           phys_enc->parent->crtc,
>> +                           DPU_HW_BLK_PINGPONG, rt_pp_list,
>> +                           ARRAY_SIZE(rt_pp_list));
>> +
>> +    if (num_pp == 0 || num_pp > MAX_CHANNELS_PER_ENC) {
>> +        DPU_DEBUG_ENC(dpu_enc, "invalid num_pp %d\n", num_pp);
>> +        return;
>> +    }
>> +
>> +    for (int i = 0; i < num_pp; i++) {
>> +        struct dpu_hw_pingpong *hw_pp = 
>> to_dpu_hw_pingpong(rt_pp_list[i]);
>> +
>> +        for (int j = 0; j < ARRAY_SIZE(dpu_enc->hw_cwb); j++) {
>> +            hw_cwb = dpu_enc->hw_cwb[i];
>> +
>> +            /*
>> +             * Even CWB muxes must take input from even real-time
>> +             * pingpongs and odd CWB muxes must take input from odd
>> +             * pingpongs
>> +             */
>> +            if (hw_pp->idx % 2 == hw_cwb->idx % 2) {
> 
> When running igt-test on QRD8650, I get:
> # IGT_FRAME_DUMP_PATH=$PWD FRAME_PNG_FILE_NAME=pwet /usr/libexec/igt- 
> gpu-tools/kms_writeback -d

Hi Neil,

Thanks for reporting this. Unfortunately, I'm not able to recreate this 
on the MTP8650.

How many/which non-WB outputs are you testing with?

Also, can you share the IGT debug logs?

FWIW, I haven't had the chance to test with DP yet so that might be why 
you're hitting this issue and I'm not.

Thanks,

Jessica Zhang

> [ 2566.668998] Console: switching to colour dummy device 80x25
> IGT-Version: 1.29-1.28 (aarch64) (Linux: 6.12.0-rc1-00022-ge581f752bf79 
> aarch64)
> [ 2566.674859] [IGT] kms_writeback: executing
> Using IGT_SRANDOM=1709057323 for randomisation
> Opened device: /dev/dri/card0
> [ 2566.741375] [IGT] kms_writeback: starting subtest dump-writeback
> Starting subtest: dump-writeback
> Subtest dump-writeback: SUCCESS (0.305s)[ 2567.053189] [IGT] 
> kms_writeback: finished subtest dump-writeback, SUCCESS
> 
> [ 2567.064505] [IGT] kms_writeback: starting subtest dump-valid-clones
> Starting subtest: dump-valid-clones
> [ 2567.762793] Unable to handle kernel NULL pointer dereference at 
> virtual address 0000000000000010
> [ 2567.771919] Mem abort info:
> [ 2567.774888]   ESR = 0x0000000096000006
> [ 2567.778831]   EC = 0x25: DABT (current EL), IL = 32 bits
> [ 2567.784371]   SET = 0, FnV = 0
> [ 2567.787601]   EA = 0, S1PTW = 0
> [ 2567.790942]   FSC = 0x06: level 2 translation fault
> [ 2567.796044] Data abort info:
> [ 2567.799083]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [ 2567.804793]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [ 2567.810057]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [ 2567.815600] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008d60cf000
> [ 2567.822290] [0000000000000010] pgd=08000008d6049003, 
> p4d=08000008d6049003, pud=080000089397e003, pmd=0000000000000000
> [ 2567.833254] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [ 2567.839747] Modules linked in: snd_soc_wsa884x q6prm_clocks 
> q6apm_lpass_dais snd_q6dsp_common q6apm_dai q6prm 8021q garp mrp stp llc 
> usb_f_fs libcomposite qrtr_mhi snd_soc_hdmi_codec ath12k mac80211 
> libarc4 mhi panel_visionox_vtdr6130 snd_q6apm pci_pwrctl_pwrseq 
> pci_pwrctl_core rpmsg_ctrl apr fastrpc qrtr_smd rpmsg_char wcd939x_usbss 
> nb7vpq904m qcom_pd_mapper goodix_berlin_spi goodix_berlin_core 
> ucsi_glink typec_ucsi pmic_glink_altmode aux_hpd_bridge qcom_battmgr 
> leds_qcom_lpg msm ocmem drm_exec hci_uart qcom_pbs gpu_sched 
> led_class_multicolor btqca phy_qcom_eusb2_repeater btbcm 
> qcom_spmi_temp_alarm drm_dp_aux_bus phy_qcom_qmp_combo crct10dif_ce 
> bluetooth drm_display_helper sm3_ce ecdh_generic aux_bridge sm3 
> snd_soc_sc8280xp pwrseq_qcom_wcn sha3_ce snd_soc_qcom_sdw rtc_pm8xxx 
> qcom_pon ecc nvmem_qcom_spmi_sdam sha512_ce qcom_stats spi_geni_qcom 
> snd_soc_qcom_common sha512_arm64 pwrseq_core i2c_qcom_geni cfg80211 
> drm_kms_helper dispcc_sm8550 gpi ipa snd_soc_lpass_va_macro 
> snd_soc_lpass_tx_macro soundwire_qcom
> [ 2567.839860]  pinctrl_sm8650_lpass_lpi snd_soc_lpass_wsa_macro 
> snd_soc_lpass_rx_macro rfkill slimbus phy_qcom_snps_eusb2 
> pinctrl_lpass_lpi gpucc_sm8650 snd_soc_lpass_macro_common qcom_q6v5_pas 
> qcom_pil_info qcom_q6v5 qcrypto authenc icc_bwmon qcom_sysmon 
> qcom_common qrtr qcom_glink_smem phy_qcom_qmp_pcie mdt_loader libdes 
> llcc_qcom ufs_qcom phy_qcom_qmp_ufs pmic_glink snd_soc_wcd939x rmtfs_mem 
> pdr_interface snd_soc_wcd939x_sdw regmap_sdw qcom_pdr_msg 
> snd_soc_wcd_mbhc qmi_helpers snd_soc_wcd_classh soundwire_bus typec 
> nvmem_reboot_mode qcom_rng socinfo fuse drm backlight ipv6
> [ 2567.983445] CPU: 5 UID: 0 PID: 554 Comm: kms_writeback Tainted: G 
> S                 6.12.0-rc1-00022-ge581f752bf79 #2
> [ 2567.994390] Tainted: [S]=CPU_OUT_OF_SPEC
> [ 2567.998483] Hardware name: Qualcomm Technologies, Inc. SM8650 QRD (DT)
> [ 2568.005244] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS 
> BTYPE=--)
> [ 2568.012455] pc : dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
> [ 2568.019009] lr : dpu_encoder_helper_phys_setup_cwb+0x88/0x1ec [msm]
> [ 2568.025532] sp : ffff80008939b7e0
> [ 2568.028999] x29: ffff80008939b810 x28: ffffcbcb66f26068 x27: 
> ffff37ad962cb080
> [ 2568.036388] x26: ffff37ad9887ed80 x25: ffff80008939b878 x24: 
> ffff37ad43642a80
> [ 2568.043775] x23: 0000000000000000 x22: ffff37ad42812080 x21: 
> ffff37ad43642a80
> [ 2568.051163] x20: ffff37ad962cb080 x19: ffff37ad962c8080 x18: 
> 0000000000000001
> [ 2568.058552] x17: 000000040044ffff x16: ffffcbcbb0fc8c64 x15: 
> 00003d08ffff9c00
> [ 2568.065939] x14: 00000013519b2832 x13: ffff37ad9d392200 x12: 
> 000000000000000b
> [ 2568.073325] x11: ffff37ad40dc56c0 x10: ffff37ad9d392200 x9 : 
> ffff37afbe7bba80
> [ 2568.080712] x8 : ffff37ad42812718 x7 : 0000000000000004 x6 : 
> ffff37ad989ac798
> [ 2568.088098] x5 : 0000000000000002 x4 : ffff80008939b7f8 x3 : 
> ffff37ad962cb150
> [ 2568.095480] x2 : 0000000000000002 x1 : 0000000000000000 x0 : 
> 0000000000000001
> [ 2568.102868] Call trace:
> [ 2568.105446]  dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
> [ 2568.111608]  dpu_encoder_helper_phys_cleanup+0x328/0x3c4 [msm]
> [ 2568.117692]  dpu_encoder_phys_wb_disable+0x80/0xac [msm]
> [ 2568.123233]  dpu_encoder_virt_atomic_disable+0xb4/0x160 [msm]
> [ 2568.129224]  disable_outputs+0x108/0x32c [drm_kms_helper]
> [ 2568.134858]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c 
> [drm_kms_helper]
> [ 2568.142614]  msm_atomic_commit_tail+0x188/0x514 [msm]
> [ 2568.147894]  commit_tail+0xa4/0x18c [drm_kms_helper]
> [ 2568.153065]  drm_atomic_helper_commit+0x17c/0x194 [drm_kms_helper]
> [ 2568.159482]  drm_atomic_commit+0xb8/0xf4 [drm]
> [ 2568.164176]  drm_mode_atomic_ioctl+0xad4/0xd88 [drm]
> [ 2568.169369]  drm_ioctl_kernel+0xc0/0x128 [drm]
> [ 2568.174039]  drm_ioctl+0x218/0x49c [drm]
> [ 2568.178165]  __arm64_sys_ioctl+0xac/0xf0
> [ 2568.182271]  invoke_syscall+0x48/0x10c
> [ 2568.186217]  el0_svc_common.constprop.0+0xc0/0xe0
> [ 2568.191109]  do_el0_svc+0x1c/0x28
> [ 2568.194576]  el0_svc+0x34/0xd8
> [ 2568.197788]  el0t_64_sync_handler+0x120/0x12c
> [ 2568.202321]  el0t_64_sync+0x190/0x194
> [ 2568.206157] Code: 910063e1 f8607822 f8607861 b9401042 (b9401021)
> [ 2568.212484] ---[ end trace 0000000000000000 ]---
> 
> Neil
> 
>> +                rt_pp_idx[i] = enable ? hw_pp->idx : PINGPONG_NONE;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>> +    /*
>> +     * The CWB mux supports using LM or DSPP as tap points. For now,
>> +     * always use LM tap point
>> +     */
>> +    cwb_cfg.input = INPUT_MODE_LM_OUT;
>> +
>> +    for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>> +        hw_cwb = dpu_enc->hw_cwb[i];
>> +        if (!hw_cwb)
>> +            continue;
>> +
>> +        cwb_cfg.pp_idx = rt_pp_idx[i];
>> +
>> +        hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
>> +    }
>> +}
>> +
>>   void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys 
>> *phys_enc,
>>                          const struct msm_format *dpu_fmt,
>>                          u32 output_type)
>> @@ -2557,6 +2630,14 @@ enum dpu_intf_mode 
>> dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>       return INTF_MODE_NONE;
>>   }
>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys 
>> *phys_enc)
>> +{
>> +    struct drm_encoder *encoder = phys_enc->parent;
>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>> +
>> +    return dpu_enc->cwb_mask;
>> +}
>> +
>>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys 
>> *phys_enc)
>>   {
>>       struct drm_encoder *encoder = phys_enc->parent;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/ 
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index e77ebe3a68da..d7a02d1f8053 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>>    */
>> @@ -331,6 +331,12 @@ static inline enum dpu_3d_blend_mode 
>> dpu_encoder_helper_get_3d_blend_mode(
>>       return BLEND_3D_NONE;
>>   }
>> +/**
>> + * dpu_encoder_helper_get_cwb - get CWB blocks mask for the DPU encoder
>> + * @phys_enc: Pointer to physical encoder structure
>> + */
>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys 
>> *phys_enc);
>> +
>>   /**
>>    * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
>>    *   This helper function is used by physical encoder to get DSC 
>> blocks mask
>> @@ -400,6 +406,14 @@ int dpu_encoder_helper_wait_for_irq(struct 
>> dpu_encoder_phys *phys_enc,
>>    */
>>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys 
>> *phys_enc);
>> +/**
>> + * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
>> + * @phys_enc: Pointer to physical encoder structure
>> + * @enable: Enable CWB mux
>> + */
>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys 
>> *phys_enc,
>> +                       bool enable);
>> +
>>   /**
>>    * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>>    * @phys_enc: Pointer to physical encoder
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/ 
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 882c717859ce..e88c4d91041f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
>>       dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, 
>> CDM_CDWN_OUTPUT_WB);
>> +    dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
>> +
>>       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>   }
>>
> 


