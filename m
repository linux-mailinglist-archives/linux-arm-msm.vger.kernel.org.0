Return-Path: <linux-arm-msm+bounces-55559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE35A9BFC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AAEB466CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF98422F169;
	Fri, 25 Apr 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3G0dm9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8822D78E;
	Fri, 25 Apr 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566186; cv=none; b=HUhu9yManqEV8NZxFeQ60paZesfNmI2LX5XAC9A7GLsD1fGsotANK8cbQiv89coXQBBh89eYRTqj2ym6znI9jWX/G4EvJ6NvJQmxNS1p05FrsoQSar5X3uhjNJIa+GfyA54uTaIZqV9m2fppFk8dGwR4qy/0R2SvhCXtoPudP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566186; c=relaxed/simple;
	bh=zJlN8O+uh+v92rYMJtIqwS5PrwNdmPc559CSstYdQWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B+CTo9K7cHWUjMx/V8gz75NMg0pWxDZlM8gWtGVUbko4nlNc8+I4rf54E8rEerudZ+GGdwgQkBGnzDWY+FVFjgnfRRkUeLhvWJqfc+oPs3BFf72A8jCAPMJLQb2D2mIlnhhqfO0GgyIv2PYgjtnW8iLpc6eFExwRirQwkwonPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3G0dm9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17ox6003115;
	Fri, 25 Apr 2025 07:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig5fmG7S3ER9YXpJ1Zzu08k/utEhYy+ndOaqGwTJL3Y=; b=j3G0dm9by+gWOkvf
	VRxrTJFmY4Bq1pKJddr/H+gUSGFGVYeIa3KiteRSx+W5YLC8Im7lnJYWECvesB/Q
	t2Tz6k0bLjfkCDhWamIJdJYM06gl5u2IhdU0HZg+lPY2gkMy4YdRBMvBCLoDAwAy
	qg0bfq+etSPPgjKW306AI3G0Rq3VXUkhL9uAl3fLXjJrw4kjI8378hgmJbvjnnYc
	E/uq2NBPFA2bWsBtB9RRVCuPe6RJazKYuUT1TSEZ5ktjMEYuJsXRUe3adlLIkYd4
	OJzdPO6wPtdRIiByJTw1wxP9u8mcNZFKs/xaI0NSjGj58Hn+9uXa8jIk0fiE7g3f
	JN8+JQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy826k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 07:29:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P7TD6l031372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 07:29:13 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 00:29:08 -0700
Message-ID: <0155bd45-4c57-44d5-8b0c-852003aef5e0@quicinc.com>
Date: Fri, 25 Apr 2025 15:29:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: <neil.armstrong@linaro.org>, <quic_cang@quicinc.com>, <bvanassche@acm.org>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <peter.wang@mediatek.com>, <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        open list <linux-kernel@vger.kernel.org>,
        Linux regressions mailing list
	<regressions@lists.linux.dev>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <20250213080008.2984807-6-quic_ziqichen@quicinc.com>
 <c7f2476a-943a-4d73-ad80-802c91e5f880@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <c7f2476a-943a-4d73-ad80-802c91e5f880@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1MyBTYWx0ZWRfX2cg2SIxikzv4 COyBEhpb4XA4fo/YJcz3QEYaEpMm1wQKFe3Y5AVEehjlGTyNhWA7idkuqS/vvMZxEu5S8VrBkKh /GsetrzMQSZzkfsc2NVh7D6kThQ4Q4z0j3NRJE8uPtY3+NsoTAFmpazqJVy+cVIEMTNmRfhkaDt
 enp4ofnCSddVZTAHhzg8cAKdYavEqCiMpnOR58DbZgWnBExg2UIGlJM8KJqMRlsilGT/XJf4zjn Rq+8RAA28xyaE/qmkIqQ/qhXpW46N1c8UeJpN0LyCmPtwCT7uElAfh9lS0PzVD/PbZBHOZPSmFm 61fn4FyHHpXVYjplQd7vwXHodbhDmNUNd7KZtTGxa6+enuwurs0tn8+J8xu8ml03OJz+TcdHYaP
 vHOOv/GHPWDo+259aTmtMRZZj4lVHhWbzycZ6xJOPeOOgEWoYxHFpdSoOSviReKY5Sf6oRdA
X-Proofpoint-GUID: PsZgquMR-JsSdEhXprZC_kuIH0iRw7Io
X-Proofpoint-ORIG-GUID: PsZgquMR-JsSdEhXprZC_kuIH0iRw7Io
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b39ca cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=KKAkSRfTAAAA:8 a=OV80YVMUHrPmMdHFnQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22 a=ySS05r0LPNlNiX1MMvNp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1011
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250053

Hi Neil,

We analyzed this issue today , I don't think it is related to this patch:

[    9.383728] ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x2 with mode 
0x11 completion timeout
...
...
...
[    9.588545] host_regs: 00000090: 00000002 15710000 00000002 00000003

The timeout error log shows the mode 0x11 is the correct argument3 value 
of this pwr mode DME_SET cmd.

int ufshcd_uic_change_pwr_mode(struct ufs_hba *hba, u8 mode)
{
     struct uic_command uic_cmd = {
         .command = UIC_CMD_DME_SET,
         .argument1 = UIC_ARG_MIB(PA_PWRMODE),
         .argument3 = mode,
     };
...
...
  dev_err(hba->dev,
         "uic cmd 0x%x with arg3 0x%x completion timeout\n",
          uic_cmd->command, uic_cmd->argument3);


This prints means that we gave correct argument3 here.

But from the host register dump , we can see the argument3 written to 
register (address 0x***9C) is '0x00000003' which is a invalid value.

And according to the UFSHCI JEDEC, the return value of ConfigResultCode 
regiser (address 0x***0x98) is 0x00000002 also told us the value written 
to argument3 register is a INVALID_MIB_ATTRIBUTE_VALUE, this is the 
reason causes this timeout issue.

" 02h INVALID_MIB_ATTRIBUTE_VALUE "

However, though we don't know the final root cause, we can know there is 
mistake occur during writing register. The argument3 value is 0x11, but 
after writing to register , the readback value from register is 0x3... 
Anyway , this patch didn't touch the path of register writing.

Are you easy to reproduce this issue ? How many instances do you 
observed ? We never received similar report from our internal UFS test 
team and stabitily test team. If it is easy to reproduce , you can add 
readback prints at the place where after writing register to check it.

ufshcd_dispatch_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
{
     lockdep_assert_held(&hba->uic_cmd_mutex);

     WARN_ON(hba->active_uic_cmd);

     hba->active_uic_cmd = uic_cmd;

     /* Write Args */
     ufshcd_writel(hba, uic_cmd->argument1, REG_UIC_COMMAND_ARG_1);
     ufshcd_writel(hba, uic_cmd->argument2, REG_UIC_COMMAND_ARG_2);
     ufshcd_writel(hba, uic_cmd->argument3, REG_UIC_COMMAND_ARG_3);

-> you can add print here:
   pr_err ("READ BACK argument3 from register 0x%x: 0x%x",
       REG_UIC_COMMAND_ARG_3, ufshcd_readl(hba, REG_UIC_COMMAND_ARG_3);



Best Regards,
Ziqi

On 4/24/2025 11:35 PM, Neil Armstrong wrote:
> Hi,
> 
> On 13/02/2025 09:00, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
>> plans. However, the gear speed is only toggled between min and max during
>> clock scaling. Enable multi-level gear scaling by mapping clock 
>> frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can put
>> the UFS link at the appropriate gear speeds accordingly.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>
>> v1 -> v2:
>> Rename the lable "do_pmc" to "config_pwr_mode".
>>
>> v2 -> v3:
>> Use assignment instead memcpy() in function ufshcd_scale_gear().
>>
>> v3 -> v4:
>> Typo fixed for commit message.
>>
>> v4 -> v5:
>> Change the data type of "new_gear" from 'int' to 'u32'.
>> ---
>>   drivers/ufs/core/ufshcd.c | 44 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 34 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 8d295cc827cc..9908c0d6a1e1 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -1308,16 +1308,26 @@ static int ufshcd_wait_for_doorbell_clr(struct 
>> ufs_hba *hba,
>>   /**
>>    * ufshcd_scale_gear - scale up/down UFS gear
>>    * @hba: per adapter instance
>> + * @target_gear: target gear to scale to
>>    * @scale_up: True for scaling up gear and false for scaling down
>>    *
>>    * Return: 0 for success; -EBUSY if scaling can't happen at this time;
>>    * non-zero for any other errors.
>>    */
>> -static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
>> +static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear, 
>> bool scale_up)
>>   {
>>       int ret = 0;
>>       struct ufs_pa_layer_attr new_pwr_info;
>> +    if (target_gear) {
>> +        new_pwr_info = hba->pwr_info;
>> +        new_pwr_info.gear_tx = target_gear;
>> +        new_pwr_info.gear_rx = target_gear;
>> +
>> +        goto config_pwr_mode;
>> +    }
>> +
>> +    /* Legacy gear scaling, in case vops_freq_to_gear_speed() is not 
>> implemented */
>>       if (scale_up) {
>>           memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info,
>>                  sizeof(struct ufs_pa_layer_attr));
>> @@ -1338,6 +1348,7 @@ static int ufshcd_scale_gear(struct ufs_hba 
>> *hba, bool scale_up)
>>           }
>>       }
>> +config_pwr_mode:
>>       /* check if the power mode needs to be changed or not? */
>>       ret = ufshcd_config_pwr_mode(hba, &new_pwr_info);
>>       if (ret)
>> @@ -1408,15 +1419,19 @@ static void 
>> ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool sc
>>   static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long 
>> freq,
>>                   bool scale_up)
>>   {
>> +    u32 old_gear = hba->pwr_info.gear_rx;
>> +    u32 new_gear = 0;
>>       int ret = 0;
>> +    new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
>> +
>>       ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
>>       if (ret)
>>           return ret;
>>       /* scale down the gear before scaling down clocks */
>>       if (!scale_up) {
>> -        ret = ufshcd_scale_gear(hba, false);
>> +        ret = ufshcd_scale_gear(hba, new_gear, false);
>>           if (ret)
>>               goto out_unprepare;
>>       }
>> @@ -1424,13 +1439,13 @@ static int ufshcd_devfreq_scale(struct ufs_hba 
>> *hba, unsigned long freq,
>>       ret = ufshcd_scale_clks(hba, freq, scale_up);
>>       if (ret) {
>>           if (!scale_up)
>> -            ufshcd_scale_gear(hba, true);
>> +            ufshcd_scale_gear(hba, old_gear, true);
>>           goto out_unprepare;
>>       }
>>       /* scale up the gear after scaling up clocks */
>>       if (scale_up) {
>> -        ret = ufshcd_scale_gear(hba, true);
>> +        ret = ufshcd_scale_gear(hba, new_gear, true);
>>           if (ret) {
>>               ufshcd_scale_clks(hba, hba->devfreq->previous_freq,
>>                         false);
>> @@ -1723,6 +1738,8 @@ static ssize_t 
>> ufshcd_clkscale_enable_store(struct device *dev,
>>           struct device_attribute *attr, const char *buf, size_t count)
>>   {
>>       struct ufs_hba *hba = dev_get_drvdata(dev);
>> +    struct ufs_clk_info *clki;
>> +    unsigned long freq;
>>       u32 value;
>>       int err = 0;
>> @@ -1746,14 +1763,21 @@ static ssize_t 
>> ufshcd_clkscale_enable_store(struct device *dev,
>>       if (value) {
>>           ufshcd_resume_clkscaling(hba);
>> -    } else {
>> -        ufshcd_suspend_clkscaling(hba);
>> -        err = ufshcd_devfreq_scale(hba, ULONG_MAX, true);
>> -        if (err)
>> -            dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
>> -                    __func__, err);
>> +        goto out_rel;
>>       }
>> +    clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, 
>> list);
>> +    freq = clki->max_freq;
>> +
>> +    ufshcd_suspend_clkscaling(hba);
>> +    err = ufshcd_devfreq_scale(hba, freq, true);
>> +    if (err)
>> +        dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
>> +                __func__, err);
>> +    else
>> +        hba->clk_scaling.target_freq = freq;
>> +
>> +out_rel:
>>       ufshcd_release(hba);
>>       ufshcd_rpm_put_sync(hba);
>>   out:
> 
> This change causes UFS crash on the RB3gen2, after UFS successfully 
> probe and scan:
> 
> [    9.383728] ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x2 with mode 
> 0x11 completion timeout
> [    9.393272] ufshcd-qcom 1d84000.ufshc: UFS Host state=1
> [    9.403126] msm_dpu ae01000.display-controller: 
> [drm:adreno_request_fw [msm]] *ERROR* failed to load a660_sqe.fw
> [    9.408484] ufshcd-qcom 1d84000.ufshc: 0 outstanding reqs, tasks=0x0
> [    9.425577] ufshcd-qcom 1d84000.ufshc: saved_err=0x0, saved_uic_err=0x0
> [    9.432433] ufshcd-qcom 1d84000.ufshc: Device power mode=1, UIC link 
> state=1
> [    9.439716] ufshcd-qcom 1d84000.ufshc: PM in progress=0, sys. 
> suspended=0
> [    9.446742] ufshcd-qcom 1d84000.ufshc: Auto BKOPS=0, Host self-block=0
> [    9.453468] ufshcd-qcom 1d84000.ufshc: Clk gate=1
> ...
> [   10.529259] ufshcd-qcom 1d84000.ufshc: ufshcd_change_power_mode: 
> power mode change failed -110
> [   10.538102] ufshcd-qcom 1d84000.ufshc: ufshcd_scale_gear: failed err 
> -110, old gear: (tx 1 rx 1), new gear: (tx 4 rx 4)
> [   10.542841] WARNING: CPU: 0 PID: 274 at drivers/ufs/core/ 
> ufshcd.c:5504 ufshcd_sl_intr+0x64c/0x6a4
> ...
> 
> CI Run sample: https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba- 
> tester/-/jobs/233352#L1479
> 
> Bisect run log:
> # bad: [0af2f6be1b4281385b618cb86ad946eded089ac8] Linux 6.15-rc1
> # good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
> git bisect start 'v6.15-rc1' 'v6.14'
> # bad: [fd71def6d9abc5ae362fb9995d46049b7b0ed391] Merge tag 'for-6.15- 
> tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> git bisect bad fd71def6d9abc5ae362fb9995d46049b7b0ed391
> # good: [fb1ceb29b27cda91af35851ebab01f298d82162e] Merge tag 'platform- 
> drivers-x86-v6.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/ 
> pdx86/platform-drivers-x86
> git bisect good fb1ceb29b27cda91af35851ebab01f298d82162e
> # good: [1952e19c02ae8ea0c663d30b19be14344b543068] Merge tag 'wireless- 
> next-2025-03-20' of https://git.kernel.org/pub/scm/linux/kernel/git/ 
> wireless/wireless-next
> git bisect good 1952e19c02ae8ea0c663d30b19be14344b543068
> # bad: [1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95] Merge tag 'net- 
> next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect bad 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
> # good: [22093997ac9220d3c606313efbf4ce564962d095] Merge tag 'ata-6.15- 
> rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
> git bisect good 22093997ac9220d3c606313efbf4ce564962d095
> # bad: [336b4dae6dfecc9aa53a3a68c71b9c1c1d466388] Merge tag 'iommu- 
> updates-v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux
> git bisect bad 336b4dae6dfecc9aa53a3a68c71b9c1c1d466388
> # bad: [0711f1966a523d77d4c5f00776a7bd073d56251a] scsi: mpt3sas: Fix 
> buffer overflow in mpt3sas_send_mctp_passthru_req()
> git bisect bad 0711f1966a523d77d4c5f00776a7bd073d56251a
> # good: [369552fd03f296261023872b8fc983d1fc55c8e9] Merge patch series 
> "mpt3sas driver udpates"
> git bisect good 369552fd03f296261023872b8fc983d1fc55c8e9
> # bad: [42273e893157501ae119ea5459f3a7d2420c56d6] Merge patch series 
> "scsi: scsi_debug: Add more tape support"
> git bisect bad 42273e893157501ae119ea5459f3a7d2420c56d6
> # bad: [7e72900272b61c11f2fd4020d4f186124d0d171b] Merge patch series 
> "Support Multi-frequency scale for UFS"
> git bisect bad 7e72900272b61c11f2fd4020d4f186124d0d171b
> # good: [c02fe9e222d16bed8c270608c42f77bc62562ac3] scsi: ufs: qcom: 
> Implement the freq_to_gear_speed() vop
> git bisect good c02fe9e222d16bed8c270608c42f77bc62562ac3
> # bad: [eff26ad4c34fc78303c14be749e10ca61c4d211f] scsi: ufs: core: Check 
> if scaling up is required when disable clkscale
> git bisect bad eff26ad4c34fc78303c14be749e10ca61c4d211f
> # bad: [129b44c27c8a51cb74b2f68fde57f2a2e7f5696b] scsi: ufs: core: 
> Enable multi-level gear scaling
> git bisect bad 129b44c27c8a51cb74b2f68fde57f2a2e7f5696b
> # first bad commit: [129b44c27c8a51cb74b2f68fde57f2a2e7f5696b] scsi: 
> ufs: core: Enable multi-level gear scaling
> 
> #regzbot introduced 129b44c27c8a51cb74b2f68fde57f2a2e7f5696b
> 
> Thanks,
> Neil
> 


