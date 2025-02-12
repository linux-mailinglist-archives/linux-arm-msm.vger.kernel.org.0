Return-Path: <linux-arm-msm+bounces-47757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A9A325EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D893A545D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE2020DD46;
	Wed, 12 Feb 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrDqFZ56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814CF20CCDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363846; cv=none; b=m9c5tink4WLlqE/bRUKvaCOsl5cvm/Fc1h3NYENRQMrslPrFmDZQIcLjEiPFMp5P8GRy63QyGgE8QiYXHiQHb1SGmAr9WS42q5YAOWu5oErvNT2Xw0lb4rkN+60E/mIjlfKGtkCiOTEq8FW0OH/qU2455WNWloCgzlT/yl5lrxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363846; c=relaxed/simple;
	bh=gf2ZQizGdSB2ftMlT3tO9mDn0opnFOrA9sp9p7fJyk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAPfGMNZ5AdKN8vpYizoDoS0vCumf6htL2AzIHG3sjd+Lqi72RD49ExYMeM9dWZ4MAn12OURon/sJ6iAS1N8fUIBYuSAZ4qc8JGBygmvdl2LAaJmvupWwcjAbtmoJUZIB96i57UxdgCuNxLChKIB3L9qxHs5IpgIsm/TlQME1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrDqFZ56; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so374359a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739363843; x=1739968643; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iOqKefoEOFgmHw7EHtaZsDTWYxKFbNx0Pt4RvoChu0=;
        b=FrDqFZ56zmr9rWQPDTxULmI5BJ8gclmE20ELPCSZPTHMkWA/Z0WIq8mhX8L3MdiCef
         ny8oC1obzMRcg6pNPXwm5Tm0FQ16i563coeoBS5g0PWpTfwQkv1CxbiFLotjXDKXbC7r
         arr3p5Oy3Bc1urdo0R5Jfd+v3P93uqq1VZwvmDcyMmdfqgMHJZw0or6tA9XIweH3FvxZ
         O0305IX4FpJBkO97tojYd1Rzhf18R4UNenjA9vCl4Iy9x14Em8LZjyKrtz779yTvDQbF
         W9eslk7nnl38JYTXi4lJ7hc2IYYMMUMJVVcjyX24k/uvAXW7cdUi4EUCxhunvrgEkuOu
         Gsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363843; x=1739968643;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iOqKefoEOFgmHw7EHtaZsDTWYxKFbNx0Pt4RvoChu0=;
        b=RDDQ68bFKzjk+ZCjVIYqBCBZjUk9cDYsWJXqGwnx4SF8ELX+Owy9ISbDBJ7SkpeyBA
         MFXpFKqIIAGnJEEJX8Vw4OayCExqXh5qZco29gf1x8J+CTuPFkbQ9TY0Qll3RtDWVhVk
         Tr9ENHB2Wcjn036wq3qnvCdu2Vhq1rDzJtqADdPQHNAynRiso9AhA0aOwRPyE+g4Wz+h
         HCYsH7jc7vLl8Kszk6xv5uceua0NKrxSzbhlEdZb5KdS67G4w1PaZnpf6ecen87WPy+P
         RE2m6K6jhHAbvN1jhb52/pGBgMTXUENLSSrAc8oOs2BnbG2ZoH0KLoHC+VFPEaXMxB1z
         2o1g==
X-Forwarded-Encrypted: i=1; AJvYcCWY0uFNQqdII0RBlnJMo6yWUQz06OVSTyULSa7a5RKdmcLV38xNXzZL7Bk6C7VpUIiab73BK6+fKjJFkRMw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/fsRw3m/CZO7M3nG7VTRvhAPDFNifP54iefylNxAyXbk0ptuF
	ue8ngyWVfo8TOfnuTvfnMu8tQbgNyZhmgqVwf4Y4ceifewU4Xcr3/YNLErhcfnrl0Vd3i1JVYW6
	2
X-Gm-Gg: ASbGnctbGEPDQqjo495lRKXs1gB45sBpjQpyxGYlq+gwiwy9UcHtFbCl8T0MutDsqmr
	TvW8BzVOlSFXWEfIe4MXrd2CudIdtR1YKg22K1ZJeiatMxsoTymc7uXfcVhNTXRkaTOEbps7KGH
	s2RrsAhiN5/rTHLmejaQM3VprWWH5xiz5eI4q+Ru1uH9d0YPFY325jcsf4w38ZkDSGw/DEgUYlf
	FrdGa/wCSgAQ9QKA37x0qeLAUr4QpE9+hwhTr2+5B45hqicSQXIWSUpSlXly4Q+RanuvfmKRJFo
	oTYow49bZjpNWO2TZhg8
X-Google-Smtp-Source: AGHT+IGYTOzcUgHPJRW0kYCbQrRFecyM+6qv7h4XAq61LxCD0Pf+cDCJw3BGknJKHBSXeWLKG4xRig==
X-Received: by 2002:a05:6402:358a:b0:5d9:3118:d0b8 with SMTP id 4fb4d7f45d1cf-5deae0b5caemr2250068a12.8.1739363842691;
        Wed, 12 Feb 2025 04:37:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de52712538sm9275054a12.49.2025.02.12.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 04:37:22 -0800 (PST)
Date: Wed, 12 Feb 2025 15:37:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Leung <quic_mattleun@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: [bug report] bus: mhi: host: Add a policy to enable image transfer
 via BHIe in PBL
Message-ID: <e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Matthew Leung,

Commit f88f1d0998ea ("bus: mhi: host: Add a policy to enable image
transfer via BHIe in PBL") from Jan 17, 2025 (linux-next), leads to
the following Smatch static checker warning:

	drivers/bus/mhi/host/boot.c:611 mhi_fw_load_handler()
	error: uninitialized symbol 'fw_load_type'.

drivers/bus/mhi/host/boot.c
    491 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
    492 {
    493         const struct firmware *firmware = NULL;
    494         struct device *dev = &mhi_cntrl->mhi_dev->dev;
    495         enum mhi_fw_load_type fw_load_type;
    496         enum mhi_pm_state new_state;
    497         const char *fw_name;
    498         const u8 *fw_data;
    499         size_t size, fw_sz;
    500         int ret;
    501 
    502         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
    503                 dev_err(dev, "Device MHI is not in valid state\n");
    504                 return;
    505         }
    506 
    507         /* save hardware info from BHI */
    508         ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
    509                            &mhi_cntrl->serial_number);
    510         if (ret)
    511                 dev_err(dev, "Could not capture serial number via BHI\n");
    512 
    513         /* wait for ready on pass through or any other execution environment */
    514         if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
    515                 goto fw_load_ready_state;

Assume we hit this goto.

    516 
    517         fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
    518                 mhi_cntrl->edl_image : mhi_cntrl->fw_image;
    519 
    520         /* check if the driver has already provided the firmware data */
    521         if (!fw_name && mhi_cntrl->fbc_download &&
    522             mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
    523                 if (!mhi_cntrl->sbl_size) {
    524                         dev_err(dev, "fw_data provided but no sbl_size\n");
    525                         goto error_fw_load;
    526                 }
    527 
    528                 size = mhi_cntrl->sbl_size;
    529                 fw_data = mhi_cntrl->fw_data;
    530                 fw_sz = mhi_cntrl->fw_sz;
    531                 goto skip_req_fw;
    532         }
    533 
    534         if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
    535                                                      !mhi_cntrl->seg_len))) {
    536                 dev_err(dev,
    537                         "No firmware image defined or !sbl_size || !seg_len\n");
    538                 goto error_fw_load;
    539         }
    540 
    541         ret = request_firmware(&firmware, fw_name, dev);
    542         if (ret) {
    543                 dev_err(dev, "Error loading firmware: %d\n", ret);
    544                 goto error_fw_load;
    545         }
    546 
    547         size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
    548 
    549         /* SBL size provided is maximum size, not necessarily the image size */
    550         if (size > firmware->size)
    551                 size = firmware->size;
    552 
    553         fw_data = firmware->data;
    554         fw_sz = firmware->size;
    555 
    556 skip_req_fw:
    557         fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
    558         if (fw_load_type == MHI_FW_LOAD_BHIE)
    559                 ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
    560         else
    561                 ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
    562 
    563         /* Error or in EDL mode, we're done */
    564         if (ret) {
    565                 dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
    566                         fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
    567                         ret);
    568                 release_firmware(firmware);
    569                 goto error_fw_load;
    570         }
    571 
    572         /* Wait for ready since EDL image was loaded */
    573         if (fw_name && fw_name == mhi_cntrl->edl_image) {
    574                 release_firmware(firmware);
    575                 goto fw_load_ready_state;
    576         }
    577 
    578         write_lock_irq(&mhi_cntrl->pm_lock);
    579         mhi_cntrl->dev_state = MHI_STATE_RESET;
    580         write_unlock_irq(&mhi_cntrl->pm_lock);
    581 
    582         /*
    583          * If we're doing fbc, populate vector tables while
    584          * device transitioning into MHI READY state
    585          */
    586         if (fw_load_type == MHI_FW_LOAD_FBC) {
    587                 ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
    588                 if (ret) {
    589                         release_firmware(firmware);
    590                         goto error_fw_load;
    591                 }
    592 
    593                 /* Load the firmware into BHIE vec table */
    594                 mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
    595         }
    596 
    597         release_firmware(firmware);
    598 
    599 fw_load_ready_state:
    600         /* Transitioning into MHI RESET->READY state */
    601         ret = mhi_ready_state_transition(mhi_cntrl);
    602         if (ret) {
    603                 dev_err(dev, "MHI did not enter READY state\n");
    604                 goto error_ready_state;

And then this goto as well.

    605         }
    606 
    607         dev_info(dev, "Wait for device to enter SBL or Mission mode\n");
    608         return;
    609 
    610 error_ready_state:
--> 611         if (fw_load_type == MHI_FW_LOAD_FBC) {
                    ^^^^^^^^^^^^
Uninitialized.

    612                 mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
    613                 mhi_cntrl->fbc_image = NULL;
    614         }
    615 
    616 error_fw_load:
    617         write_lock_irq(&mhi_cntrl->pm_lock);
    618         new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_FW_DL_ERR);
    619         write_unlock_irq(&mhi_cntrl->pm_lock);
    620         if (new_state == MHI_PM_FW_DL_ERR)
    621                 wake_up_all(&mhi_cntrl->state_event);
    622 }

regards,
dan carpenter

