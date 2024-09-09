Return-Path: <linux-arm-msm+bounces-31260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85D971419
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AE66B24E67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 09:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3CE1B375D;
	Mon,  9 Sep 2024 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erF4b8WV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B011B2EE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875050; cv=none; b=pKfTsZlkENRhybjuCHRPSX25g43Wo0hH3Dpfzx/otQVjUXzvILjxuI4+xOhTojy5RHY5J3NHBmvu1iB+wFWZNa3Y5fk8PioyWE2zhsFoAPiiT5HgeSpslUM6+EiGmEOt40EZJZP/55AkuU+4JkJCpl1+nnM9dR/zULv7rGO5/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875050; c=relaxed/simple;
	bh=bX5jM3kyQKkVdtMEpnz0qCHRxu0QYubOxMm9Z4e9e5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkveDxG1a0LA05pplLTDuPrr01GmqDhgBt7+9ywLBCbw1kKb/7gyUcQWNV5O1LXBHQ3WxBb61818TaeK0/srOjAaCNHlBN4EBqt+bKo319yjaSUbgfQ28I7irGSpNkBnpyrpu5oEBLF1fwsSD5pyNL6o9jZY8bcKmo6tkjAPpG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erF4b8WV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso24636221fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725875045; x=1726479845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayxt9tW30pARsBtY4uNjtVx6woJrfLpJGoVganqLqLs=;
        b=erF4b8WVYYjPBBInFSA5pdPTCmm8ktqbUjqKsGrppLo+LC/gX4YB7cVT4dQW2zbSEF
         DJOPr4Ckb++NmzuVVxl68oxyc/taBSqCauZCybvuWvTWOXye+G1jDEkGV91kse94tmFm
         1lX1V4F78W789A4wMYkQjlnji0+hQd6E6UgzqPZO9DXTLhBAU73OFA1JwyJtBR8GTahL
         Lw5Y7XjgZNses3QmN47MGQwHcQa0rqLOvbU7MwF0QVhuw7Rmu+UCS7/+kpsZLGkklWH7
         2/wSiLvpXI4WdvIXhtBPeWMO7EZDAiH8TsD24RbVyl8wq6uvQzoyenekgvRmY/D9uG2/
         8bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875045; x=1726479845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayxt9tW30pARsBtY4uNjtVx6woJrfLpJGoVganqLqLs=;
        b=sjypyBDUuSffQxEfzWBddHgEB+pilYXF8jYb6b8jbtI+R419ZRb4/+CgStENgHVVHA
         Hwzob0qS0RljixiDNMO2czdxjh5HxhEqb97pHD5rdGkS27xejY+5BQH7qXHADrjJ/Jl9
         gKDXYD6xh6jjLG5e6MbPYjSib+rBwC/wG3icsDRTidYTTyrTAaUMNAtRjbrOvbOz68vS
         T/WkoLfYlGWLtrMMTzrZj52X1zvHOH/eBm4ZlZq+G5dyLIB1OhiCDF9/n9llmbUVLWbK
         DfFIUReiTK6k15HjvehDOIN/wQ5scc2NV0hRy47EfpiGPSfJLGvYn6htqjKOrvYnPORp
         fcnA==
X-Forwarded-Encrypted: i=1; AJvYcCUevyd3UbXAt/oaP68Mli+pnRzBHrM0Kl49guQjjqCgeImYuDXMcbVBzEXPJbn4HLoqfmj53st52yvPoIZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyycBjddU7m5Puv93cBSwKY7CpKG4K9/GXongSHJegUcAa16SYj
	CK7+wssWiUMG/aSoTKQzhR7HSWq25EWCQm3vPUvCjuRilanVKZMsDf+OuIMTIac=
X-Google-Smtp-Source: AGHT+IFfJZf4aCicpleqZE+fxLlnGBGZEfKHivmNdx0kcBfFkbzhf0hjKD5P+CTHE0X5P4PgDl4WVQ==
X-Received: by 2002:a05:651c:211e:b0:2ef:251f:785 with SMTP id 38308e7fff4ca-2f751eb30d8mr74440981fa.1.1725875044071;
        Mon, 09 Sep 2024 02:44:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c098cd3sm7416661fa.113.2024.09.09.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:44:03 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:44:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jens Axboe <axboe@kernel.dk>, 
	Jonathan Corbet <corbet@lwn.net>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 09/17] soc: qcom: ice: add HWKM support to the ICE
 driver
Message-ID: <ivibs6qqxhbikaevys3iga7s73xq6dzq3u43gwjri3lozkrblx@jxlmwe5wiq7e>
References: <20240906-wrapped-keys-v6-0-d59e61bc0cb4@linaro.org>
 <20240906-wrapped-keys-v6-9-d59e61bc0cb4@linaro.org>
 <7uoq72bpiqmo2olwpnudpv3gtcowpnd6jrifff34ubmfpijgc6@k6rmnalu5z4o>
 <66953e65-2468-43b8-9ccf-54671613c4ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66953e65-2468-43b8-9ccf-54671613c4ab@linaro.org>

On Mon, Sep 09, 2024 at 10:58:30AM GMT, Neil Armstrong wrote:
> On 07/09/2024 00:07, Dmitry Baryshkov wrote:
> > On Fri, Sep 06, 2024 at 08:07:12PM GMT, Bartosz Golaszewski wrote:
> > > From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > > 
> > > Qualcomm's ICE (Inline Crypto Engine) contains a proprietary key
> > > management hardware called Hardware Key Manager (HWKM). Add HWKM support
> > > to the ICE driver if it is available on the platform. HWKM primarily
> > > provides hardware wrapped key support where the ICE (storage) keys are
> > > not available in software and instead protected in hardware.
> > > 
> > > When HWKM software support is not fully available (from Trustzone), there
> > > can be a scenario where the ICE hardware supports HWKM, but it cannot be
> > > used for wrapped keys. In this case, raw keys have to be used without
> > > using the HWKM. We query the TZ at run-time to find out whether wrapped
> > > keys support is available.
> > > 
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >   drivers/soc/qcom/ice.c | 152 +++++++++++++++++++++++++++++++++++++++++++++++--
> > >   include/soc/qcom/ice.h |   1 +
> > >   2 files changed, 149 insertions(+), 4 deletions(-)
> > > 
> > >   int qcom_ice_enable(struct qcom_ice *ice)
> > >   {
> > > +	int err;
> > > +
> > >   	qcom_ice_low_power_mode_enable(ice);
> > >   	qcom_ice_optimization_enable(ice);
> > > -	return qcom_ice_wait_bist_status(ice);
> > > +	if (ice->use_hwkm)
> > > +		qcom_ice_enable_standard_mode(ice);
> > > +
> > > +	err = qcom_ice_wait_bist_status(ice);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (ice->use_hwkm)
> > > +		qcom_ice_hwkm_init(ice);
> > > +
> > > +	return err;
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_ice_enable);
> > > @@ -150,6 +282,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
> > >   		return err;
> > >   	}
> > > +	if (ice->use_hwkm) {
> > > +		qcom_ice_enable_standard_mode(ice);
> > > +		qcom_ice_hwkm_init(ice);
> > > +	}
> > >   	return qcom_ice_wait_bist_status(ice);
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_ice_resume);
> > > @@ -157,6 +293,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
> > >   int qcom_ice_suspend(struct qcom_ice *ice)
> > >   {
> > >   	clk_disable_unprepare(ice->core_clk);
> > > +	ice->hwkm_init_complete = false;
> > >   	return 0;
> > >   }
> > > @@ -206,6 +343,12 @@ int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
> > > +bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
> > > +{
> > > +	return ice->use_hwkm;
> > > +}
> > > +EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
> > > +
> > >   static struct qcom_ice *qcom_ice_create(struct device *dev,
> > >   					void __iomem *base)
> > >   {
> > > @@ -240,6 +383,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> > >   		engine->core_clk = devm_clk_get_enabled(dev, NULL);
> > >   	if (IS_ERR(engine->core_clk))
> > >   		return ERR_CAST(engine->core_clk);
> > > +	engine->use_hwkm = qcom_scm_has_wrapped_key_support();
> > 
> > This still makes the decision on whether to use HW-wrapped keys on
> > behalf of a user. I suppose this is incorrect. The user must be able to
> > use raw keys even if HW-wrapped keys are available on the platform. One
> > of the examples for such use-cases is if a user prefers to be able to
> > recover stored information in case of a device failure (such recovery
> > will be impossible if SoC is damaged and HW-wrapped keys are used).
> 
> Isn't that already the case ? the BLK_CRYPTO_KEY_TYPE_HW_WRAPPED size is
> here to select HW-wrapped key, otherwise the ol' raw key is passed.
> Just look the next patch.
> 
> Or did I miss something ?

That's a good question. If use_hwkm is set, ICE gets programmed to use
hwkm (see qcom_ice_hwkm_init() call above). I'm not sure if it is
expected to work properly if after such a call we pass raw key.

> 
> Neil
> 
> > 
> > >   	if (!qcom_ice_check_supported(engine))
> > >   		return ERR_PTR(-EOPNOTSUPP);
> > > diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> > > index 9dd835dba2a7..1f52e82e3e1c 100644
> > > --- a/include/soc/qcom/ice.h
> > > +++ b/include/soc/qcom/ice.h
> > > @@ -34,5 +34,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
> > >   			 const struct blk_crypto_key *bkey,
> > >   			 u8 data_unit_size, int slot);
> > >   int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
> > > +bool qcom_ice_hwkm_supported(struct qcom_ice *ice);
> > >   struct qcom_ice *of_qcom_ice_get(struct device *dev);
> > >   #endif /* __QCOM_ICE_H__ */
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

