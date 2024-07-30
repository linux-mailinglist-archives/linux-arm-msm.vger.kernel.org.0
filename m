Return-Path: <linux-arm-msm+bounces-27392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A7940D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605551C243CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 09:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DF8198E6D;
	Tue, 30 Jul 2024 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKL6OOdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815A198A2C;
	Tue, 30 Jul 2024 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331688; cv=none; b=B+TvLlv36u+KmQZLmYKYAk88CKtbDRWwbBS1Ru2nGiRn8OJ2P/IRJn/alPj2V3EpxL+onVCmYttHn0NGnQBkZHo0rb3bzthpyrOKzpCaUTNWVxcsC7QQTe4zwDKd7re6qiNUsQm+8AMWxeMLMPDz4YfLGCZhM8FAXFNNPgkiAgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331688; c=relaxed/simple;
	bh=C+p6pZ0h7zLgsZsTQ5Q7sPudkgmPqZXi5xwOwAfqCMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKCN4KO8Ha/ibPH+mCaNvl07QAJOaz27yLNAm0BIkOUgaFTTTuFcWOwQeqjhNpNe0CEGqpLjAq2QmeKqqoqNkxk8Y4X2LZ2UyfAExuo1P+PHKKvtn8m47HkL/3gPOSqOCFcRFv3KMMoaI2YrXRGqdHlZ3S1Hi2kiNFOFttnPJTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKL6OOdf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6A5C4AF09;
	Tue, 30 Jul 2024 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722331687;
	bh=C+p6pZ0h7zLgsZsTQ5Q7sPudkgmPqZXi5xwOwAfqCMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKL6OOdflGNTg4njDQOMEVg3m4GDky/0orsrRCzoyNMXydHEklzyg0YZQryY2VlXY
	 zJVEksFzAfc2fAOctikH5EeFMH1j8n0SzO/cGXBFkX6WER/RBCbe/9NsWosNulO51d
	 Fm9xt9rBQ7LBs7QjOpy+m3FQ4ou6miPWj33WL9vf1AhfzhRE60SNGH5p9e/UTZ092o
	 iWNOOqghLVgvyN9+ZbQgntdtBcg9XhRXryDaPM4aodRIZei6Pu+sbBc4Z1iwvfp+Hc
	 PoBDR+1+u76Z6+//UTH859u6wnP85JbKmLErWHiVAcMfjXvM9j76Qs2VoWNNBI/pmM
	 7hisK/VqMYo+Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sYj9S-0000000017y-1Now;
	Tue, 30 Jul 2024 11:28:15 +0200
Date: Tue, 30 Jul 2024 11:28:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
Message-ID: <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqet8iInnDhnxkT9@hovoldconsulting.com>

On Mon, Jul 29, 2024 at 04:57:54PM +0200, Johan Hovold wrote:
> On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
> > X1E80100 has the same protection domains as SM8550, except that MPSS is
> > missing. Add it to the in-kernel pd-mapper to avoid having to run the
> > daemon in userspace for charging and audio functionality.
> 
> I'm seeing a bunch of new errors when running with this patch applied on
> top of 6.11-rc1. I'm assuming it is due to changes in timing that are
> either exposing existing bugs or there is a general problem with the
> in-kernel pd-mapper implementation.
> 
> In any case, this does does not seem to be specific to x1e80100 even if
> I'm not seeing as many issues on sc8280xp (there is one new error there
> too however).
> 
> It doesn't happen on every boot, but with the in-kernel pd-mapper I
> often (every 3-4 boots) see the following errors on the x1e80100 CRD
> during boot:
> 
> 	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>         [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>         [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> 
> 	[    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> 
> I've also seen the following, which may also be related:
> 
> 	[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
>         [   14.571943] PDR: service lookup for avs/audio failed: -110
> 
> I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
> reverted again.

Here's another bug, a NULL deref in the battery driver, that is
apparently exposed by the in-kernel pd-mapper. This is also on the
x1e80100 CRD with a couple of added printks to indicate when the
pd-mapper probes and when the pmic glink services are up:

[    8.933775] remoteproc remoteproc1: powering up 32300000.remoteproc
[    8.934623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fd5000.phy
[    8.945244] remoteproc remoteproc1: Booting fw image qcom/x1e80100/cdsp.mbn, size 3027368
[    8.965537] remoteproc remoteproc0: powering up 30000000.remoteproc
[    8.971075] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fda000.phy
[    8.974299] remoteproc remoteproc0: Booting fw image qcom/x1e80100/adsp.mbn, size 21424472
[    8.999726] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
[    9.007697] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fdf000.phy
[    9.101196] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
[    9.103860] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.1: qcom_pdm_probe
[    9.105989] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.0: qcom_pdm_probe

 - pd-mapper probing

[    9.112983] qcom-snps-eusb2-hsphy fd3000.phy: Registered Qcom-eUSB2 phy
[    9.296879] remoteproc remoteproc0: remote processor 30000000.remoteproc is now up

 - adsp is up

[    9.300086] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 7fffffff

 - SERVREG_SERVICE_STATE_UNINIT

[    9.301878] qcom-snps-eusb2-hsphy fd9000.phy: Registered Qcom-eUSB2 phy
[    9.306985] qcom,fastrpc 30000000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FAST
RPC
[    9.309924] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
[    9.311367] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
[    9.318330] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1

 - This looks suspicious

[    9.323924] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
[    9.325275] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
[    9.326008] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
[    9.326733] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 9
[    9.336582] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 1fffffff

 - SERVREG_SERVICE_STATE_UP

[    9.345544] dwc3 a000000.usb: Adding to iommu group 10
[    9.361410] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
[    9.362803] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
[    9.362882] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125

 - -ECANCELED errors I reported earlier

[    9.364298] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
...
[    9.364339] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    9.364395] CPU: 6 UID: 0 PID: 111 Comm: kworker/6:4 Not tainted 6.11.0-rc1 #70
[    9.364397] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
[    9.364398] Workqueue: events qcom_battmgr_enable_worker [qcom_battmgr]
[    9.364401] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    9.364403] pc : pmic_glink_send+0xc/0x24 [pmic_glink]
[    9.364405] lr : qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
...
[    9.364427] Call trace:
[    9.364428]  pmic_glink_send+0xc/0x24 [pmic_glink]
[    9.364429]  qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
[    9.364430]  process_one_work+0x210/0x614
[    9.364435]  worker_thread+0x244/0x388
[    9.364436]  kthread+0x124/0x128
[    9.364437]  ret_from_fork+0x10/0x20
[    9.364439] Code: 17fffff7 d503233f a9bf7bfd 910003fd (f9400800)
[    9.364441] ---[ end trace 0000000000000000 ]---

[    9.365205] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

Johan

