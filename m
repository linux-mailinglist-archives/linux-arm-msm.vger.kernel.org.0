Return-Path: <linux-arm-msm+bounces-75830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1BFBB4EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 20:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409FD322ACB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 18:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09362765FB;
	Thu,  2 Oct 2025 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IN5in/Ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E015539A;
	Thu,  2 Oct 2025 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430965; cv=none; b=E22NoDPT+2FarPw1Kf39G/AXFf+TEgO3Ab4liwmh3873KQdD2KXjr4pmVYUq+XwrL07dVMH9Bw9qPpyGiyG2pSPGDYGDazm07nJB/OScnh6QGWCMy5pBo0vv+1Jw0aP1ZtEOYP7cCb0AHvNnYDQe7MUhcpwLtcep6yfpuPUxsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430965; c=relaxed/simple;
	bh=KfFso04PeOY9dXbNgpb2nBnxT5U8h9WqasIeO318aVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Blrvoef25cze8NpvWAkdsb1QEUAEn4inC+DMnYkBnWHR0l38b7jex7Ggbc8xu2UfitgSBWk4C7fQ5+isxN6a1VL8DrUHCFTu37Q9+jPs7TxUut0VyxVvZUa/vACjTXyIMA9Fs79J/aZVM0E0AJ13MmEHE383vnnXXIMXx7DYicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IN5in/Ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59292rfS010749;
	Thu, 2 Oct 2025 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBLeaFmk6s08epL7fzezFMbIHY9YTm/FKC3Gi591Ofo=; b=IN5in/OlQIwxVj+f
	ofWuzvdhiHcWu1Xoa5rPeRHswk64AUGSe4uLlVpxTpAQ7v/auzBQoLO0KVkEpAjO
	tGUc+PeAbg4pkH0bQdZicqq75JPYoBH/B0PYXSHiAp/46tZzw9IxfHK9kJiQfiIi
	0c5qNBFCo6eFvVcrDOkxv4P1p3Cb7A72zGs3HjmCs463mYl/lJqCK5NuejU/Bzj3
	3MDoK+M1wRR2Gw1JY3AjPkBC/b3wEA/zFFRNNnb9tv/iueu4s+2HbFNtnmwsOzNf
	zSqEwn4M0AZXr5aavofUcKTUjNryMBimuopGfwNHAS+hZaeKsGUKwdk1GsG32b1k
	i9W56w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hrdmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 18:49:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 592In1ZH010820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Oct 2025 18:49:01 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 2 Oct
 2025 11:49:00 -0700
Message-ID: <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
Date: Thu, 2 Oct 2025 11:48:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>,
        "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>,
        "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
Content-Language: en-US
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX5j/3ThhQFgrC
 uAVrhFIGbxu7FXfvH6i8xQTaMbLMV0nH7XlyjWlBbYpX94kIPFudWKIKrFi0bopIo+HpDDJWLLe
 j2fyARLEG6Upu9nzARs7Ru0Ntz5sPvRsri3KJDKpuSO0z1WjpxwEIWu5A93f77H74pZDV427AyC
 x+1AKyYQzrbeF640CbluCdalPgeQRkUaYQr887Pws0R/pYr/vBcrfMceJ8gM3UQ9ipiW2MCYkqZ
 5eozp5ZuitAkCytyrnXO/Pn5EPYo5jo/PPGal03eVmVeU/h2Zzl1u0PovbXW9sYZABYDi+/qxW2
 S7Gjv4wJPegRNsdPfvixbfarticXQlfuQ5/OyJO/F8KUGy66ywx8hnPOska/FgGSYotqoBa8Z7H
 ncf+T1bji8Sv7+veuTDgmGJzJwFEWQ==
X-Proofpoint-GUID: ULyUvjth2Rl6nV6TlJmOO1GIZWkob7ph
X-Proofpoint-ORIG-GUID: ULyUvjth2Rl6nV6TlJmOO1GIZWkob7ph
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dec91d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=YKdBxgvyY27R_9wN8GQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 10/2/2025 12:57 AM, Peter Wang (王信友) wrote:
> On Wed, 2025-10-01 at 13:57 -0700, Bao D. Nguyen wrote:
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 2e1fa8c..45e509b 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -9738,10 +9738,9 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba
>> *hba)
>>          }
>>
>>          /*
>> -        * Some UFS devices require delay after VCC power rail is
>> turned-off.
>> +        * All UFS devices require delay after VCC power rail is
>> turned-off.
>>           */
>> -       if (vcc_off && hba->vreg_info.vcc &&
>> -               hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
>> +       if (vcc_off && hba->vreg_info.vcc)
>>                  usleep_range(5000, 5100);
>>   }
>>
>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
>> mediatek.c
>> index f902ce0..5c204d1 100644
>> --- a/drivers/ufs/host/ufs-mediatek.c
>> +++ b/drivers/ufs/host/ufs-mediatek.c
>> @@ -40,8 +40,7 @@ static int  ufs_mtk_config_mcq(struct ufs_hba *hba,
>> bool irq);
>>   static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
>>          { .wmanufacturerid = UFS_ANY_VENDOR,
>>            .model = UFS_ANY_MODEL,
>> -         .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM |
>> -               UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>> +         .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>>          { .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>>            .model = "H9HQ21AFAMZDAR",
>>            .quirk = UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES },
>> @@ -1713,15 +1712,13 @@ static void ufs_mtk_fixup_dev_quirks(struct
>> ufs_hba *hba)
>>   {
>>          ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
>>
>> -       if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc &&
>> -           (hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)) {
>> +       if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc) {
>>
> 
> Hi Bao,
> 
> Adding a delay is not reasonable if we have decided to
> keep VCC always on.

Hi Peter,

The current Mediatek platform driver applies this quirk to all ufs 
vendors which is consistent with what we would like to do in the 
Qualcomm platform driver per the vendor's requests.

I do see that, about 5 years ago, Mediatek merged a patch to keep the 
device vcc always on, probably to workaround some HW issues. Since this 
is a very old patch and the impact of this change on a broken hardware 
is minimal, I would like weight the benefit of cleaning up the ufs core 
driver by removing the unnecessary quirk 
UFS_DEVICE_QUIRK_DELAY_AFTER_LPM vs the inconvenience of a 5ms 
(potentially reduce to 2ms) delay impact it may cause on an old broken 
HW in the suspend/shutdown path.

I believe removing the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the ufs 
core driver as well as all the platform drivers yields positive net 
benefits in this case.

Thanks, Bao

> 
> Thanks
> Peter
> 
> 
>>                  hba->vreg_info.vcc->always_on = true;
>>                  /*
>>                   * VCC will be kept always-on thus we don't
>> -                * need any delay during regulator operations
>> +                * need any delay before putting device's VCC in LPM
>> mode.
>>                   */
>> -               hba->dev_quirks &=
>> ~(UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
>> -                       UFS_DEVICE_QUIRK_DELAY_AFTER_LPM);
>> +               hba->dev_quirks &=
>> ~UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM;
>>
> 
> 
> 
> 
> 


