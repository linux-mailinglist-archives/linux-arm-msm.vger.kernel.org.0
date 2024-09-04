Return-Path: <linux-arm-msm+bounces-30715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C996BC98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0D51F24778
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42D31D9336;
	Wed,  4 Sep 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXDwggKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13C1CF5F5;
	Wed,  4 Sep 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453627; cv=none; b=bCDFz1ep/uwzgH8Cv1RNnh0nNMTPXoPJ9F/B5fUeKaVFlQXfvPA5pQNmmIcBn/mpubF9503sAAyaaZfhvZOf8tvNR8/muk0TxW5MwTpS0Id0FXo3Jevu5QbbCoeUkSmSvH80vtK8+VfzuI/GNs4bQPahYJw/uIWJSJGrZ8Tv7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453627; c=relaxed/simple;
	bh=/ngbUNVBBiNe+pD6xIFN0OnnDxQc0JlS7tavd/IprnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0Br3avA0zKghVA1OnsmhCjxHY7sjRvxP16ZemqmaTo1O+4aWxMIkyFnOtEhefe5EaZr19Fqe41Mtp7jcJjKfpQwvE4PXDOSRU+VQjpWNeHlCP9J/GKBDmHWBBrGhOBv3RUkvOR+us2Inxkuns9v1v9v5wF6PQ3Qtpd00Fk+Tfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXDwggKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AF5C4CEC2;
	Wed,  4 Sep 2024 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725453627;
	bh=/ngbUNVBBiNe+pD6xIFN0OnnDxQc0JlS7tavd/IprnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXDwggKgQSMlGmQteE8+lmIQyZOoJ2ATiiHBSeR+8T9ZliX/YPRPwbxuSanKdLjS3
	 X0alkfk3Oy5vEBSwgPMiHQrCRg2EEAuQk8LqTnmjmOngRLHA9WW9tMmpJqBssQpou2
	 KMjvU6j0XEG9gORlOGkBAbkY1QKjqPEWZrYa0xds9xGR+DLoIl9ILoW4uXb+2SFqvs
	 G4oQygFu9nG6TxmCdYM79mQNMGxKDHFpaCoMH1P+7/HCf63pO0asvRYGnA7OnZIh3M
	 psvaWTCOG3tj/kTLwgF5alWhMS0EMcAeL0WRtDB6kJItnVMZT5V1ffVVJOjXIHFobT
	 dI7HQhPOwqBtQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slpJU-000000004Xv-28Cn;
	Wed, 04 Sep 2024 14:40:44 +0200
Date: Wed, 4 Sep 2024 14:40:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
Message-ID: <ZthVTC8dt1kSdjMb@hovoldconsulting.com>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com>
 <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
 <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b>
 <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com>
 <CAA8EJpopAYp3Y6cW8B+2cVM=_oAnWeOqS6zygc4o7b+r9Lj1ZQ@mail.gmail.com>
 <02e3c217-490d-4051-8fb8-6bfcf322e27d@quicinc.com>
 <ZsbomSG6DXTfYxXZ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsbomSG6DXTfYxXZ@hovoldconsulting.com>

On Thu, Aug 22, 2024 at 09:28:26AM +0200, Johan Hovold wrote:
> On Tue, Jul 30, 2024 at 11:04:58PM -0700, Chris Lew wrote:
> 
> > GLINK has a concept that is called "intents". An intent is an object 
> > that signifies that a remote channel is ready to receive a packet 
> > through GLINK. Intents can be pre-emptively queued, or they can be 
> > requested by the sending entity. GLINK will not try to send or it will 
> > block until there is an intent available.
> > 
> > Intents are exchanged with GLINK_CMD_INTENT packets. When Linux receives 
> > one of these packets we add it to an idr "riids".
> > 
> > Example sending call:
> >      pmic_glink_send() --> rpmsg_send() --> qcom_glink_send() --> 
> > __qcom_glink_send() --> qcom_glink_request_intent()
> > 
> > In __qcom_glink_send(), we check if there are any available intents in 
> > "riids", if there aren't any intents we request an intent through 
> > qcom_glink_request_intent(). This sends a GLINK_CMD_RX_INTENT_REQ packet 
> > to the remote and waits for a GLINK_CMD_RX_INTENT_REQ_ACK packet in 
> > return. This ack packet will have a field that says whether the intent 
> > has been granted or not. When linux gets this ack packet, we will wake 
> > up the thread waiting in qcom_glink_request_intent().
> > 
> > The ECANCELED comes from qcom_glink_request_intent() when we receive a 
> > GLINK_CMD_RX_INTENT_REQ_ACK that has granted == false.
> > 
> > On the firmware, when a glink channel is registered they can optionally 
> > fill in a handler for GLINK_CMD_RX_INTENT_REQ packets. If this handler 
> > is not configured, then a default one will be used where all 
> > GLINK_CMD_RX_INTENT_REQ packets will be responded with 
> > GLINK_CMD_RX_INTENT_REQ_ACK and granted == false. If a channel is 
> > implemented this way, then the only thing Linux can do is wait and retry 
> > until the remote queues the intents on its own accord.
> > 
> > This would be my current guess as to what's happening based on this not 
> > being consistent and only seen every couple of reboots. A stop path 
> > problem sounds like it should happen every time, and we should also see 
> > the remoteproc prints related to powering down the adsp. The above race 
> > should be applicable to all platforms but depends on the speed of the 
> > ADSP vs the CPU.
> 
> Thanks for the above. This indeed seems to match what I'm seeing as I
> also reported here [1]:
> 
> [    9.539415]  30000000.remoteproc:glink-edge: qcom_glink_handle_intent_req_ack - cid = 9, granted = 0
> [    9.561750] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> 
> [    9.448945]  30000000.remoteproc:glink-edge: qcom_glink_handle_intent_req_ack - cid = 9, granted = 0
> [    9.461267] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> [    9.469241] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
> [    9.478968] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> 
> I assume we do not want to have every client driver implement a retry
> loop for the first communication with the remote end, so can this be
> handled by the pmic_glink driver somehow? For example, by not forwarding
> state changes until some generic request has gone through?

Has there been any progress on this issue? It's already been five weeks
since my initial report and we're closing in on the merge window for
6.12. If this isn't resolved soon, I'll send patch to disable the
in-kernel pd-mapper by marking it as broken.

> And what about the audio service errors:
> 
> 	[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
>	[   14.571943] PDR: service lookup for avs/audio failed: -110
> 
> Does this seem to be a separate (but related) issue or just a different
> symptom?

I can confirm that the audio breakage is also related to the in-kernel
pd-mapper. I hit it after 30 reboots with the in-kernel pd-mapper, but
have not seen it with the user space service (e.g. after 100+ reboots).

> [1] https://lore.kernel.org/lkml/ZsRGV4hplvidpYji@hovoldconsulting.com/

Johan

