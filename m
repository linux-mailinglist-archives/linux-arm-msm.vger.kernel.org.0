Return-Path: <linux-arm-msm+bounces-61986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1BAE31C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 21:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC56C188C7C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64F21E9B0B;
	Sun, 22 Jun 2025 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRF/Qdwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C62BAF4
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620224; cv=none; b=fUbjBi/eaNhTDO/JUtT8NhryUb/8sgsK083QkEjW8sEN7IGtmZ6IauK2p5r6ptctnrckNhv4SCWDKL8BQE01xW3rRWwbBAorxrd4u/IUTD8f6JPVkXlA6RnlQTse6iGB0gn7jSJ3Qxio6YgLwwUt5u9rjBl7LS9qShbiLd44xqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620224; c=relaxed/simple;
	bh=IpckR9VGbq4LXi10n8/fWnZTnStHUdYYVsZXeq2sScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQl7yk++JNIrp/Mpe9haDk775IZebdDKTogZH0rnJvMpYvo40AhbfjDJgywa1hFuClamHIu578pZ4xqnHm4HldOCu1d2D200Ez6elGIoqlDBp2WO7swRWcUhIQdxZPgIjfh4HI6+bgqj5gGYgmbhVVdAfsnCUAHksbkd3Tyec3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRF/Qdwz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so5263549a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750620221; x=1751225021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Br5VyEEaKP/ktAugIXCOxiXHE4k+9++aboaKBknJU3g=;
        b=SRF/Qdwzp/iQcqaKSYU3tzN0iv6Ago32NnmH22EnpDwiErBUzXQUDfqKIm0V47rY+H
         5or7iEOEWcf1y+v0ToyX4Jyn0CuxHl+dIASOFkn/NHORf+gq46iARdg+tK3NQqks4KWx
         plwftMcNBftYLiSapv8FiMia01C6CBxKgRWx4x9vSk3xLbjjpSCvkCN4XUcPIBbsE9oy
         9X6sBOKIw0gwPJGCSNF7yCJKwh6ETXfBI2Q4MaqZz4jV99U3MVZ/Gfx4IOlTrxMFYO21
         tSW37ro23IzSGv12Tx+rxrF2QcNEbPSYzKWxqcQAozSjWAAY8ECBLD2oR906sEUi2ldv
         KnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750620221; x=1751225021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br5VyEEaKP/ktAugIXCOxiXHE4k+9++aboaKBknJU3g=;
        b=X1uZRJXvBhfODETZpQx4LL683UB3n/LMSBvIJ/4cNTdJqiSDdj1lD4En1r3OGYunLH
         adFx+mzlbEcp5jWlpDvfGcVIsvBFDmAOAaZo2ZCnY/NPaiQ1o3HNftHwfTgRGs+d0R32
         DFi1I32+t7Mzvwa1v5AKgMgZgC6svvU7x0Je35hCmkIPVlZ1mFEpRAkfN4yme/SIi/LW
         CHK2i6K7xe/txZgLHhZAw7LLI8MBHHDTMY1UtTu2N3fPN/gQ+SKQrKnlCaivmdgZyQts
         sP6YRtC4RtxLt604v/dzyMuqFAWpVNA1o5Uk4qzf5YgW3yzy1uWbAPrKdKn2TegyQ4wZ
         Kgcg==
X-Forwarded-Encrypted: i=1; AJvYcCVl3Rn8bcnsT04sQyQG/9UH2deMR/U35vi+8iimuvJHcysLogqPhmYpWPmbsl6ZpJYNC7fqNxL0f7ZVoFun@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqd+iFsVWE20XKJStPAHYAGE7c43NSl0ayLM7b1B8k0AnHg034
	zVFrr6knN+vHmdnbIuYGHqCED6FffPjDo4FFI3Ef3+F87ojKaSEaQtomz4g7BG8T88s=
X-Gm-Gg: ASbGnct3LzyaJQWRtZWtAPieuuKl2NRopZ1g6U0+vtVqjM1Q+0gLELerga5U94pheBM
	8xl40pHQv8cGpiII59Dcm6KrfFCyoA7U9JEKdcskxuiqk7lyYxV9XePj6kkdvbF+0H5+qFPmgHF
	NeeAryLlCIaSndkfT57FT2lozQubBaus+fvx6eTQajJNY/apihVL1nPHb0WtA2TQUH/89JMWP/S
	zPxsaNtgXFtDdz/AZXZ/1V01vWMK2yfC/K6E4YLCHEVlkcJChpSuCWKV/6vUjmADhB4nIcew4Pw
	6Tb/N6rQVnZIORaxW9Kl2NP8zFpc/GjL+bYBbaP1O82B3qC8cWw4SgMF93k=
X-Google-Smtp-Source: AGHT+IE/CAE8fTyyaZhNwnHqQ6DluWGob1BPPepxXx61Kxfg9bpG3qc3aCqfgSMh1y8Qa1MPv/AJwg==
X-Received: by 2002:a17:907:3f1a:b0:ad8:8717:bf9c with SMTP id a640c23a62f3a-ae057ef753fmr1060205766b.32.1750620221305;
        Sun, 22 Jun 2025 12:23:41 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a2dsm587665566b.174.2025.06.22.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 12:23:39 -0700 (PDT)
Date: Sun, 22 Jun 2025 22:23:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V6 01/10] scsi: ufs: qcom: Prevent calling phy_exit
 before phy_init
Message-ID: <aFhYOMPdCiCL2EV7@linaro.org>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
 <20250526153821.7918-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526153821.7918-2-quic_nitirawa@quicinc.com>

On 25-05-26 21:08:12, Nitin Rawat wrote:
> Prevent calling phy_exit before phy_init to avoid abnormal power
> count and the following warning during boot up.
> 
> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
> 
> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

