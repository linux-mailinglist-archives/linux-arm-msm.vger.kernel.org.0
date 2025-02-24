Return-Path: <linux-arm-msm+bounces-49185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E37A42830
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 17:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E291898EF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 16:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5296D263F42;
	Mon, 24 Feb 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhhrvAK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E5263F2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415450; cv=none; b=FoKMftFOHpYY3H8/SdHoHGaFQxzBuNxQJ3fVgPabQhryDx3u9uMLgI3u+GOzOapLoj9T6eQV1mQv5icy77RFAZYZeolPI0+Do7yRcYpOSiUZMeQ5igk48oDHBLjJhI2ChlFvDHL17Rs1zeYBmG3rZE29y1mWa8LKjY+PktV6Qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415450; c=relaxed/simple;
	bh=lsBzBusKOpwT3CwNGtzOUDsl4urSNfOiHa9mnOLQcac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYmS6LTYnSzSPpPT/rOmX3EFPuLm/A0ak7VjaGY8np2IFF1iOCoYfrPlprFyr8euhFjNAFxKRlY0O4/xqR4zUyS+DCNUCHB79j9T5Tsp8GPZ7Nb/x4dU2gTEH3EwaRvVvM+1M5QeUK9PNZ21lMGK4tjuY40qT6yhpyUkzTo8GHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhhrvAK0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220d39a5627so70778515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740415448; x=1741020248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6d5XSfEwRqWaYFLWfE4Y4ohPqjDkgrU++dRrHmEqq/c=;
        b=xhhrvAK0xI/C9ggeY8sKeSx84Y0sS8vr/V6dGz07SdbxzEGzaGS7UhdXuTbZlYASMz
         mDckt7RRcASI8BXv9CvoX0Zs5vfN+siVwaFGhUYr4WGI6wVoqUv66gZlEeMe37FIyOCE
         jm7kAhnZ13IGpTRBC1XwuoKMqHGn7a3tE4KRInOHla9kmldQXWth23ZNGBkAvT7YM3Ph
         OW02flrlI2W6cxyV9+POXNt132oVc059ng7hXco4rOHxSsDm5aXht5Uiy51/ALYf0bCX
         GV2znOpT13aUrhqrWX1Fkyys7eonHcLJIx2hXiIwlKjMXxTCxvbcNaDME0HtKlu3aVBv
         puDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415448; x=1741020248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6d5XSfEwRqWaYFLWfE4Y4ohPqjDkgrU++dRrHmEqq/c=;
        b=lQnpH/H1k8LI/o6hwmd8jVfo1KCsX8ZxY5jiusSwvoPD3zocu1pmwhvjZrjm6cgABA
         AsRW3pXebYO1jRMG2yJjANE3mbMlekJbwCMbdD/OYIS4Ral/cHKQkYZ0Iph7HJMFL2z/
         QY4kpT/Z27PgQsLMKJIJom3RP7BB0ApCklNxtqU1Td2kps1kUWXOKHg+qTH2+4cFXBlF
         Zv4+lmP/0drM5cGNud4f6blGJCuU2QMbrTRKgpxWvYI2ZWoYqGyz14gizvzwsKxyXUza
         q46GYZHVwveG9/Na3cK87so9Ll1W/4vne4ldeBI8WNEovDYsE2aUZIRPBq74IUVGyK48
         PDTw==
X-Forwarded-Encrypted: i=1; AJvYcCW5UJkTxOv7lYnMDiccWO/lytdHuAXp6c0IRrsHC6/NSlWCBX7++ldZgohIbA+txhoB0tqq4VPP82WB7Dou@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhfWQ9S7KwUZgo9D1AOrK7mXA63/K8QdOBeaEIIl8g3R1Kb5g
	DRHVCQIEK9J6qUmw8vi0htxvdm7LsWI6XQes5tMz4Aapa/L0p+6LEHhbYIItXw==
X-Gm-Gg: ASbGnct7ES9V0+LvGY5tnDSV3YWOs+w15sbvBzgjWtmJzEgwANO1PubWkJ+JzkHZZZp
	tNO9vYHKy9xeiAHteROF5Gs0uuyFLUr1C+zZok52hbpHbR1SMupKaNHc3wHI69rqfnV0+8uQc5r
	s55ipio5zt007NEy+ux691qM6hIu/kY6V9ydmMQBTSDfzbkiKv3Gq3UWPUab4WP1VO4ut5ThSki
	aUclWtecyJ8bVCFFxnPRHIUjqkCfLK8eqwVBH3BJ7WRIMC/IHlfbX9J+m/QIkO6GNHaA9ScP/ij
	RTHUC2Z5YZTheMhzbe9dEh6AIjUdXSINYUeY
X-Google-Smtp-Source: AGHT+IFG1lGtUN3MM7H9ZJAba5MymArVGS0ryXDNHwp0DEkpN0qPAZv5NG2dk7v/JN0eP4aRNmsZlw==
X-Received: by 2002:a17:903:2f43:b0:215:89a0:416f with SMTP id d9443c01a7336-2219ffc2dcbmr207030045ad.30.1740415447841;
        Mon, 24 Feb 2025 08:44:07 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c9casm183409845ad.130.2025.02.24.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:44:07 -0800 (PST)
Date: Mon, 24 Feb 2025 22:14:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	kernel@collabora.com, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
Message-ID: <20250224164400.w3lpzxxwfbrj5lb6@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
 <20250214070447.scs6lpytjtecz3ko@thinkpad>
 <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
 <20250220075034.unsd5cq7xkip2by6@thinkpad>
 <ec8a01a3-5eaf-4fba-bb85-e7a677877e5f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec8a01a3-5eaf-4fba-bb85-e7a677877e5f@collabora.com>

On Thu, Feb 20, 2025 at 05:34:06PM +0500, Muhammad Usama Anjum wrote:
> On 2/20/25 12:50 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 17, 2025 at 07:35:50PM +0500, Muhammad Usama Anjum wrote:
> >> On 2/14/25 12:04 PM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >> Thank you so much for replying.
> >>
> >>>
> >>> + ath11k list and Jeff
> >>>
> >>> On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> >>>> Hi,
> >>>>
> >>>> I've been digging in the MHI code to find the reason behind broken
> >>>> resume from hibernation for MHI. The same resume function is used
> >>>> for both resume from suspend and resume from hibernation. The resume
> >>>> from suspend works fine because at resume time the state of MHI is 
> >>>> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> >>>> we resume from hibernation.
> >>>>
> >>>> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> >>>> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> >>>> while switching channel state from MHI_CH_STATE_ENABLE to
> >>>> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> >>>> resume fails as well. 
> >>>>
> >>>> I've put some debug prints to understand the issue. These may be
> >>>> helpful:
> >>>>
> >>>> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> >>>> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> >>>> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> >>>>
> >>>
> >>> Thanks for the report!
> >>>
> >>> Could you please enable the MHI and ath11k debug logs and share the full dmesg
> >>> to help us understand the issue better?
> >> The ath11k debug was already enabled. CONFIG_MHI_BUS_DEBUG wasn't enabled. 
> > 
> > Sorry for not being clear. I asked you to enable the dev_dbg() logs in the MHI
> > driver. But it is not required. See below.
> I've disabled the MHI_BUG_DEBUG. It only enables some files. Ideally if those files
> being used, there shouldn't be any difference. But they are definitely changing the
> timings.
> 
> > 
> >> I've
> >> enabled it and now the hibernate is working without any issue. It is very strange
> >> how can CONFIG_MHI_BUS_DEBUG make any difference. I don't have much background on
> >> how it is helping.
> >>
> > 
> > Probably some timing issue. But enabling the MHI debug logs could also hide the
> > issue. So you should disable the CONFIG_MHI_BUS_DEBUG option and collect the MHI
> > trace logs that we recently added.
> Disabled the MHI_BUS_DEBUG and collected logs by Dynamic debug:
> [  584.040189] mhi mhi0: Allowing M3 transition
> [  584.040202] mhi mhi0: Waiting for M3 completion
> [  584.040480] mhi mhi0: State change event to state: M3
> ..
> [  584.535478] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> [  584.535482] qcom_mhi_qrtr mhi0_IPCR: PM: dpm_run_callback(): qcom_mhi_qrtr_pm_resume_early [qrtr_mhi] returns -22
> [  584.535490] qcom_mhi_qrtr mhi0_IPCR: PM: failed to restore early: error -22
> [  584.831583] mhi mhi0: Entered with PM state: M3, MHI state: M3
> 
> It seems like the state save was success at hibernate time. The error is originating
> at resume from hibernation.
> 

I just tried hibernation on my RB5 board featuring QCA6390 WLAN chip which makes
use of ath11k driver. I did encounter the resume failure, but the error log was
slightly different. Then looking at the ath11k driver made me realize that they
reverted the hibernation support due to suspend issue reported on some Lenovo
platforms: 2f833e8948d6 ("Revert "wifi: ath11k: support hibernation"").

So that explained the resume failure. I reverted the revert and that allowed me
to resume properly from hibernation. So please try to do the same and see if it
helps you.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

