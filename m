Return-Path: <linux-arm-msm+bounces-57630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E58AB440E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4DE3A19B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5514254AFD;
	Mon, 12 May 2025 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0l+3+AP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6AE81720
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075617; cv=none; b=t1+g/PESGrPTAy8FrzD1OyYYydHASpUnw1M/PkaGPuZZh3BPHsXnhHFyWUi8yualfqAGzx5Od73oHIe6obxMU+RsTRFmd5EmA+BaF3VHnNdDr2jsRxOCLXV61/dTaGjgta69dD4gqXdezxouk2FlqFRwH4n0k8Oncxy3VCRH11Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075617; c=relaxed/simple;
	bh=WC0QSSHSaDJIeTky6FYZ5/aW/w4NwUet7G5HfGnRlTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRN7Ih4CuxjTbsSu43zSBGOJSocBx9z0gUvC9F1oy8zpd1M+eJLAHd0hk923fmQKaPqnbfhpGI4znSzFEVZxFzdenJo06bTqzf6tnSQSSGMAESIlMX6VbLwCvkMUBm9FYiPrL5Tcgc0VLPREcrAKJdVVkk6jF+Z8G6Dj/OBTbXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0l+3+AP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHtW6c025089
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=W0l+3+APuqQo0LFX
	g236I3NUxXGKMXbpA9Ke8JlmNzDqNPDyW4VzT/UwxtmB7CTbs6741vrCtp3yQhxv
	LE3WZP5kQs2r/ac/oIMXrwbK8yZqcKruQ0t5vn32fCUeGvoPyVAGhNxk0dWJJ1UU
	RWjxbP/p/7x8udGOocwqsc+TUG+5tcNpSSQJjcI/Z2mlLNLKMp+0AZ2bxsGgHCr5
	v9gT2V+ETI9JA/WGD4qw3d86DbfmQicXYFccIp/6wsOBKLbynlBxgfI2QOT7Rwz6
	x3foFKY+dql18044P/cwdSvDVc+13ffx1rPJUwChZaXZ4Iw2xmX6pFB/vfJAMgw2
	Q8wYWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghdjf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:46:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22fd4e7ea48so28985755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 11:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075613; x=1747680413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=;
        b=fIF/+n8SYaShpMyCLOJ+2dEgXmo53yhdXcEuwPZPnCWB1Q+JT6CsBk/MZo5LBVoJ3d
         FVyUKuC7ZvKPbmUxie+upLCuzVvkGteE4mPH585BIMRdJ092TCTLcjfxNLtcEkt4gbyM
         c11H7e9DYrp4bxwr+w6DURO82kc4kGZMCJv3sSoD/LH9Qng9LxjrnoSKGBzbzTCuZ8oi
         k1ywppEAJ90wl4UU1zlR+fR/w7t+3Q9p9abmGcLaBPJFOttd06h/w3Vk9VwAR7Xb/c4n
         R5o1FLONKM/uIKT6HeIwDPj7hDfxMRiLCy+u0YY3OMIBNrGEOP2thlvuzBS+YrOuDsE3
         uFag==
X-Forwarded-Encrypted: i=1; AJvYcCV1NEi3gy6rvoOgCCusLZbqA9D/7DRhE6k9ZGZvJd/riSHEetwCkD+faYV/Owo1sE9Irih0pVGwPfnGKAxl@vger.kernel.org
X-Gm-Message-State: AOJu0YxunQVHVuXfjHYMwtDfrkwMZD3/7d04qa8rSnRtNQL3Y1BYBWaV
	PMSD+O1thyBFWYayBGVHCIVkY/DUdY0a8Zn8WTOTuCLD/5I+ExNfxweSrsKntgrcFeBIM1IPDj3
	jc2fhxuBUAD5e50bnxJJh2oX5l+dqAiVMyR6MXt+wX1wGdq/XJ8l/P3OnSk5c2G3c
X-Gm-Gg: ASbGnctfu8wh76BWIUlKipnnMrGJntFbryY21DWEXu9DpjVP+JrRUICMmx2DoIlVu7F
	IuOqFaFlRFkFereudYXHW4EbzzjKU4h5frCiTaor3P0kN5ZMhRD8VcCQCj9Dadrco7PA51EzGGF
	S2173VgQwGk2YoHp3FXkcCYDw+bW02b/pqJZwW9q6s/1W0s1i3A6OSoLdDo2j4MMn7gzo8Dr8Tq
	z671UcH/ruQIOr9t3CWtbdPSYFtN/AfH9LP54iUZgURyS4nGK+A6YoaHgE4yGnrgOmNZnbvv5q4
	EX6FYAR+NHBp6mSIjWBJvLHeHC/F9np3vmWQIJqoX/CmtXs5QN6O4lmnwvqSbQ==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280675ad.22.1747075613192;
        Mon, 12 May 2025 11:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsWqOd3L30u9cjxgIPmURHi+KkJtpXwBIuouO1S+U1W3n2h4To43nTOBZ4I/fyhCvVNGYpGg==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280045ad.22.1747075612588;
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544f5esm66669185ad.36.2025.05.12.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Message-ID: <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:46:49 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NbQqbN9K3wEnsRbegw3qk0tzXnByqBPT
X-Proofpoint-ORIG-GUID: NbQqbN9K3wEnsRbegw3qk0tzXnByqBPT
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6822421e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mx74GWaVK5euFb1038QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MyBTYWx0ZWRfX/RdZCWDdA0rq
 Fft8OMUKp3S/LIT6jXUVcUaSk7JyP/Ybg5HkHKdX3kGVYj9MfcI2YZSgqjsQ5wRJEwCB1LfCWrG
 p8VEw1ni95dXBlbcCja/uNXN/t6R1oGbyBUUn9Pm7jXDT7Qv7esC2ORneoaeEA56EWwFlNGrguc
 Uh760ghwqbvgFhWXrlNQ+fAccakSqY5Quejy+/7NhfUn+KLNoOtL1CgWNBph7F9FnpIvAO7ZAOW
 3w/5DxFTmmSGru4iIy2FgwPX+22M0J4uOPUzOAl4fIWlknd7enEjIDDAFBlNi5CywifghPXfKA4
 f7swGf11ky9OkImjtVfVAivG0iopR0pPwJdARYm8uEeYtdEMgSl7QCwAAtIZhd/ezwYKYXt2g9E
 9yCx9Yii4JHxe5rjPHgTDDpLCsILYLykByiHv/RyKQAA1xI3fZmsouPI9gEkpzXxJozbN5xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120193

On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.

Why is it valid to load new firmware as a result of suspend?  I don't 
users would expect that.

> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2..bc8459798bbee 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 * device transitioning into MHI READY state
>   	 */
>   	if (fw_load_type == MHI_FW_LOAD_FBC) {

Why is this FBC specific?

> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> -		if (ret) {
> -			release_firmware(firmware);
> -			goto error_fw_load;
> +		if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
> +			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> +			mhi_cntrl->fbc_image = NULL;
> +		}
> +		if (!mhi_cntrl->fbc_image) {
> +			ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> +			if (ret) {
> +				release_firmware(firmware);
> +				goto error_fw_load;
> +			}
> +			mhi_cntrl->prev_fw_sz = fw_sz;
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index e6c3ff62bab1d..107d71b4cc51a 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>   }
>   EXPORT_SYMBOL_GPL(mhi_power_down);
>   
> +static void __mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
> +{
> +	mhi_cntrl->bhi = NULL;
> +	mhi_cntrl->bhie = NULL;

Why?

> +
> +	mhi_deinit_dev_ctxt(mhi_cntrl);
> +}

