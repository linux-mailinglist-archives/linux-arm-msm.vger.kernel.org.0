Return-Path: <linux-arm-msm+bounces-88675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30328D16FB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CA7B3034907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E0A369972;
	Tue, 13 Jan 2026 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMWRNeZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiIz+FHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DD2E11BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288906; cv=none; b=KhOkchbKU1I5gvN+tpeRAQMfA5VBwpAaS6l7+7+lGElD/wIy90ycPfnkUaEwMuJD2EZyHK5LvVKxo7pDsApV/fPb9Dk4nu3whZOmz4p7kPLTsW6hboCPwkKyu2ta5Npbz+j2gIwH9WkFRuSL2bC5Z5MBtwrd4wE3usZYnBYJF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288906; c=relaxed/simple;
	bh=h+tbJihlnVbv2QgfGC4z69UrAb2Fb3j1G+BioCORuO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfOUuGfniXExANUz830PkEElWIKk8f79zX8hlmpqLgCGOeIffb16I9Bo6IzDyi6K3e9oRbLo24I3tiVbYNPDZWJFZlHsp/r/BGl8sM0H1cgVSa/CQEijcjPd/BgovKcvfPZHJWyEnl8NEUj+sF4XFu6pZIT+Z7eq4GDMq9d/z9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMWRNeZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiIz+FHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D58w472834926
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVqKfUmOywSA0gLZz1SHy3X8BBKzZ8QCkCISEbcE+1U=; b=kMWRNeZWCPCSoP6C
	MYkBuLsAlDzAYegGtxvL5yiHxi9B8N+kBVM/n/WWVWviNj9Hny8mazgaJcNTOIqJ
	LNJiTNL8slcGsq70potmRH/6PoCQRLUEY1zUPcolFIBsFIosBPi6N94dMjlVlKPC
	a/xUlkWGEvsImfF9FispTGV4keappz5/JGxVEm6z9xGBHF+19utiegnAgnqi69Y2
	JcaK5sLVYBilexNzUqCpS3Rady7HTvFW2292H+s1OF0WpRU5p1vAJoUm8VTc5Lfc
	n1tl02b1nZVqdZjmm2aDScE+rfsflg+ewKyxOCcGf/Vd+VSjdl00mecjEoiwMVI1
	Ekqfrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rb68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:21:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5539b9adb8so2313049a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 23:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768288903; x=1768893703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVqKfUmOywSA0gLZz1SHy3X8BBKzZ8QCkCISEbcE+1U=;
        b=IiIz+FHYrkntzG6pdD5mnW6QIxONLthzVUTt53W7/RRPCGLLmgDdZoK2/GRh/uwj9H
         +Sm2yrNDB+gcZx9qqXBiePcdgHqywa+WuOFyVpwhFeEAWNOWuodKa766DFNhsrcWUYQb
         UEy7nZTQzE1pVxh01neP1dh/hdxzz6+eK80fHynu5CcFg9iyVVrNjih24ru8pjMqoKUz
         w6QzYpNPAK96l8yNvj4c2WvqyXgD9C4Uj+HoAWFDZ7x9Puw4/0pZTboUX2vRrUyFWcx0
         Lknww7AQMRHPpzeAxiphBjDeplCug7Bx7a2IS7EizVBZOacSiUwEEus7k6kh5jIm54nT
         hzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768288903; x=1768893703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVqKfUmOywSA0gLZz1SHy3X8BBKzZ8QCkCISEbcE+1U=;
        b=RkN8M6Xtw4b5qm2rvGpL3KH9M4W5gG6gypLGN+X4wkPDK3mqhCBi5qSdu3FB7to9aa
         YHhBpg5iM53TRnsS2TjwN/W4O6QWKs49cUx8OqnJzNQfkWcXXl0Ndo73poNkR7u6jouP
         6lgyOkjTQNIWe6c0thWL7DpY8CIp5ZqNjnCmLmr9R7GlJIE8ZvuvWETEX/BdcmXDPPEU
         T9IWpuXgNPZid2UKa4oSyyOb/pP5M8mmfZcnZ7tGkW7YRwmXMNvPS/AcN5zRZsXMR0aw
         Xz8Q4+ffl5dmAgk0XTKK7SlwVBLz0k7BFc35ax81WwUvH8k0RookS01/SjIymW21rC+A
         41vg==
X-Forwarded-Encrypted: i=1; AJvYcCWBrXZCZHUo2PMosREV5My3X5B/FbT0EPNQZ39zgcWnF+ZKGabswhFdZwuckCV4mJN62d9HFeboK6QciQfb@vger.kernel.org
X-Gm-Message-State: AOJu0YxX19kFQn+EAbmBe/xisu/r1zmKMV/6TnxOTmT5AURz1YS5JtMO
	pGNyohDemP2Ebra5Bnxg4HyFm6OpBfVqjAdq+DxQ8jsllBAiquNtgDky5Rr0a7+V6sq0fGXmGBs
	ZXff1MxxUC3GITzSnOSJ0j83wuF18+TNNyAaiweT2nxby7isjf7WWhjZUovy00i8v1RnZ
X-Gm-Gg: AY/fxX75AzhZRfVMWU+x4tN3fhFR3B5h6h7T8+95DMx+NUfend8XifLWN95I/A/Cw5l
	3RCyVTmBRF5RDnawY0ihVDxtfpvX12gSBTX6KGFq9TmV6y8DS55MQDRnAzfcb/QHpiAGiRmzq3r
	OUqeD3zZozp7RpssPqpMTB8CjgPY7F/4XYSnX5P3QdFLXahKwt7/C0zf3wt+fxWN2u5OkE5/gTm
	hoUOYfZl0VhJcr2K048xZO0jY4QcMCAqCpfo8/rxubnaI3Qlqxz3D58pY8I6mPwlxvR4YHElA8J
	ENQFXb1+7dM9r23iSA16X5Ab6A89zvl+iHz+ZwqXW4HQJu5Cdrptj+1xaqOdwEEqnLzfH+QyETz
	fH7RGScWKNdIFgro0MLGwXgeBQPC02KG5VOVK
X-Received: by 2002:a05:6a21:6d87:b0:366:14ac:e200 with SMTP id adf61e73a8af0-3898fa5446fmr19025006637.62.1768288902609;
        Mon, 12 Jan 2026 23:21:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkV9q3zgv3N0XqANv02ep0uRzkZcssMxk2ulTlMPIi/+0hl+9D2uecVlALUeZIAoAjx+MBFA==
X-Received: by 2002:a05:6a21:6d87:b0:366:14ac:e200 with SMTP id adf61e73a8af0-3898fa5446fmr19024975637.62.1768288901993;
        Mon, 12 Jan 2026 23:21:41 -0800 (PST)
Received: from [10.218.4.141] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c59b024cfb4sm6906512a12.14.2026.01.12.23.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:21:41 -0800 (PST)
Message-ID: <15d512a6-6207-4000-b714-781af9b0f2ee@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:51:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] ufs: ufs-qcom: Add support for firmware-managed
 resource abstraction
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-5-ram.dwivedi@oss.qualcomm.com>
 <c2cb45n5gg2zlwwwzffjb2ycsksguhykoi7gghmaq3gfr3lf5t@6kvcteqptskq>
Content-Language: en-US
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
In-Reply-To: <c2cb45n5gg2zlwwwzffjb2ycsksguhykoi7gghmaq3gfr3lf5t@6kvcteqptskq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RXxKJyD2yrYy60Yrkv1lhfFvLzdSlzCF
X-Proofpoint-ORIG-GUID: RXxKJyD2yrYy60Yrkv1lhfFvLzdSlzCF
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=6965f287 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G_ItkVTm6H876gg7Fk4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2MCBTYWx0ZWRfX5dYtkxchIYDB
 qE+ZUzn003IXOVEJZ4jKYCrRun4kBeJak/y6UFzM80ZKC7FyLpz7apJzBsKMzzURYCfRlMNqnA6
 5vJS3HAMhv8LmOo5TfG0R629AJnIgL8Gu3xbFjbsdNbSYI3tC9AjCoxdMwyUmxQ7e4X1RTAWB/9
 4PUEiAxLGz4bWaY7HhKG5IDQ/+pAUcmTjFCJkJddcjmdQReVbfXo1uUNrEth1G9mp/mndjG18jg
 Qns3YIjM3NrCleeMAnwXNKd819QRwVukMrH5a/Z9tHjS+G6EGf1cBTddmznislP2sSVsZL4b3fz
 6rAfTqbzVJKA4LjrHin5a08f7jWb8i2uOrSxg0XDgQqCALagy/M4C1xVzCTwdJ0rBr9PpYRAoXx
 Ytcv11mmyUI3P7omVvnX9TZCRNrjuzKc6A2In04/YBmoYx6jHFnr69JGiNA8kcjvf14JT4yb/sH
 t1dq4DRMwL3N9mdCaJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130060



On 08-Jan-26 10:12 AM, Manivannan Sadhasivam wrote:
> On Tue, Jan 06, 2026 at 07:10:08PM +0530, Ram Kumar Dwivedi wrote:
>> Add a compatible string for SA8255p platforms where resources such as
>> PHY, clocks, regulators, and resets are managed by firmware through an
>> SCMI server. Use the SCMI power protocol to abstract these resources and
>> invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).
>>
>> Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
>> based resource control. In this model, capabilities like clock scaling
>> and gating are not yet supported; these will be added incrementally.
>>
>> Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 164 +++++++++++++++++++++++++++++++++++-
>>  drivers/ufs/host/ufs-qcom.h |   1 +
>>  2 files changed, 164 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 8ebee0cc5313..ddca7b344642 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/of.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/reset-controller.h>
>>  #include <linux/time.h>
>>  #include <linux/unaligned.h>
>> @@ -619,6 +620,27 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>>  	return err;
>>  }
>>  
>> +static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
>> +						 enum ufs_notify_change_status status)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +
>> +	switch (status) {
>> +	case PRE_CHANGE:
>> +		ufs_qcom_select_unipro_mode(host);
>> +		break;
>> +	case POST_CHANGE:
>> +		ufs_qcom_enable_hw_clk_gating(hba);
>> +		ufs_qcom_ice_enable(host);
>> +		break;
>> +	default:
>> +		dev_err(hba->dev, "Invalid status %d\n", status);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
>>   *
>> @@ -789,6 +811,38 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	return ufs_qcom_ice_resume(host);
>>  }
>>  
>> +static int ufs_qcom_fw_managed_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>> +				       enum ufs_notify_change_status status)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +
>> +	if (status == PRE_CHANGE)
>> +		return 0;
>> +
>> +	if (hba->spm_lvl != UFS_PM_LVL_5) {
>> +		dev_err(hba->dev, "Unsupported spm level %d\n", hba->spm_lvl);
>> +		return -EINVAL;
> 
> After the sysfs change, do you still need this check?

Hi Mani,

I will remove this check in the next version.

Thanks,
Ram.


> 
>> +	}
>> +
>> +	pm_runtime_put_sync(hba->dev);
>> +
>> +	return ufs_qcom_ice_suspend(host);
>> +}
>> +
>> +static int ufs_qcom_fw_managed_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	int err;
>> +
>> +	err = pm_runtime_resume_and_get(hba->dev);
>> +	if (err) {
>> +		dev_err(hba->dev, "PM runtime resume failed: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	return ufs_qcom_ice_resume(host);
>> +}
>> +
>>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>>  {
>>  	if (host->dev_ref_clk_ctrl_mmio &&
>> @@ -1421,6 +1475,55 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
>>  	phy_exit(host->generic_phy);
>>  }
>>  
>> +static int ufs_qcom_fw_managed_init(struct ufs_hba *hba)
>> +{
>> +	struct device *dev = hba->dev;
>> +	struct ufs_qcom_host *host;
>> +	int err;
>> +
>> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +	if (!host)
>> +		return -ENOMEM;
>> +
>> +	host->hba = hba;
>> +	ufshcd_set_variant(hba, host);
>> +
>> +	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
>> +					 &host->hw_ver.minor, &host->hw_ver.step);
>> +
>> +	err = ufs_qcom_ice_init(host);
>> +	if (err)
>> +		goto out_variant_clear;
>> +
>> +	ufs_qcom_get_default_testbus_cfg(host);
>> +	err = ufs_qcom_testbus_config(host);
>> +	if (err)
>> +		/* Failure is non-fatal */
>> +		dev_warn(dev, "Failed to configure the testbus %d\n", err);
>> +
>> +	hba->caps |= UFSHCD_CAP_WB_EN;
>> +
>> +	ufs_qcom_advertise_quirks(hba);
>> +	host->hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>> +
>> +	hba->pm_lvl_min = UFS_PM_LVL_5;
>> +	hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min;
> 
> hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min = UFS_PM_LVL_5; ?

Hi Mani,

I will update this to a single-line assignment as suggested in the next version.

Thanks,
Ram

> 
>> +
>> +	ufs_qcom_set_host_params(hba);
>> +	ufs_qcom_parse_gear_limits(hba);
>> +
>> +	return 0;
>> +
>> +out_variant_clear:
>> +	ufshcd_set_variant(hba, NULL);
>> +	return err;
>> +}
>> +
>> +static void ufs_qcom_fw_managed_exit(struct ufs_hba *hba)
>> +{
>> +	pm_runtime_put_sync(hba->dev);
>> +}
>> +
>>  /**
>>   * ufs_qcom_set_clk_40ns_cycles - Configure 40ns clk cycles
>>   *
>> @@ -1950,6 +2053,39 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design
>> + * @hba: pointer to UFS host bus adapter
>> + *
>> + * In the firmware-managed reset model, cold boot power-on is handled
>> + * automatically by the PM domain framework during SCMI protocol init,
> 
> No. genpd handles the power on for the power domain before UFS controller driver
> probes. SCMI protocol init has nothing to do with it.
Hi Mani,

I have updated the comment in the next version to clarify that 
genpd handles the power-on.

Thanks,
Ram.


> 
> - Mani
> 


