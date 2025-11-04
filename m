Return-Path: <linux-arm-msm+bounces-80337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B33C320A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 17:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F101892A06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 16:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954483314CD;
	Tue,  4 Nov 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qndf1bQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422A32E75C;
	Tue,  4 Nov 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762273530; cv=none; b=YF6MSobBkWlp9EfKbz0LCchdaJ0mOyfmN0Z2NxMUO7kXiQIVxbOTvtLSGkbGBgifdJP1z6zrd/8Qtt+UfLJFPMJxOC2HXkVkoRjCHLpIm/D+E0m6yzQmuikQTJJJqB/qs8En8JsoJE1r5ZjAxo8hye7hePDT1r8dkdtGW/QqQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762273530; c=relaxed/simple;
	bh=N/y0vwdR2mvftDnxV9APUaI+FV7/j0wxDHQCrEz8YsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoASd4TQhOvZC8qqF/IqbPmBxpnBEjlY8lkinzQ54SY7j3KslQNOyvNhA5wt7nS1MRG6tttski+WAfwA0+hSiBtkASV7lKWooDrgRNVO65hC66iaZdoRpWx7sps8o9aYYw30aY4UeziFHytDFry86dUdmd/KN+gb2i8TUmAs2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qndf1bQy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C334C4CEF7;
	Tue,  4 Nov 2025 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762273529;
	bh=N/y0vwdR2mvftDnxV9APUaI+FV7/j0wxDHQCrEz8YsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qndf1bQywT5cTntWFWsZlLPbAJy1mRvEzxQdBq4h4Ngz6r2vb3jTgD5AaxWucD5Wi
	 gPS3x013FeabjTJbWjLHA/JTO5gEcp9twS5uiToPWxieCSkwz1N0KxaT3tPo3JWnKO
	 5TcZsYNoL6lC+QqBd69vbEv0YCo774OaFc4BY21a/2NN8A2zKtR0czpkvfdDjzlHky
	 j8Ca7vQG7ix+NOMTJb03GqWL7cIaRzuOH9v1FPt1TZmv0WNS/2hrQHtfGMnI7MdQfT
	 yxO3iEpJCNEY/icPbW2LGcvyDZ4QySDxUlcqaDObtLyN451Cgh1Z11pDVAjmvwGUW1
	 5DVXQN2KvCbvw==
Message-ID: <66b2d9bc-c8cd-4517-aeaf-25a2de6c46ef@kernel.org>
Date: Tue, 4 Nov 2025 16:25:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <gh1Ap54xdQJqBEHQnzjGUqQsyHQgLp5ggPTjje49OhydkkjnXH2xrFWPcAwSsov_yLqCo2DRqh0F_y9aM3opOw==@protonmail.internalid>
 <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2025 07:35, Mukesh Ojha wrote:
> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> related to Secure PAS remoteproc enablement when Linux is running at EL2
> for Qualcomm SoCs.
> 
> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.
> 
> Qualcomm is working to enable remote processors on the SA8775p SoC with
> a Linux host running at EL2. In doing so, it has encountered several
> challenges related to how the remoteproc framework is handled when Linux
> runs at EL1.
> 
> One of the main challenges arises from differences in how IOMMU
> translation is currently managed on SoCs running the Qualcomm EL2
> hypervisor (QHEE), where IOMMU translation for any device is entirely
> owned by the hypervisor. Additionally, the firmware for remote
> processors does not contain a resource table, which would typically
> include the necessary IOMMU configuration settings.
> 
> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> authenticate and reset remote processors via a single SMC call,
> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> TZ for authentication. Once authentication is complete, the call returns
> to QHEE, which sets up the IOMMU translation scheme for the remote
> processors and subsequently brings them out of reset. The design of the
> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> is not permitted to configure IOMMU translation for remote processors,
> and only a single-stage translation is configured.
> 
> To make the remote processor bring-up (PAS) sequence
> hypervisor-independent, the auth_and_reset SMC call is now handled
> entirely by TZ. However, the issue of IOMMU configuration remains
> unresolved, for example a scenario, when KVM host at EL2 has no
> knowledge of the remote processors’ IOMMU settings.  This is being
> addressed by overlaying the IOMMU properties when the SoC runs a Linux
> host at EL2. SMC call is being provided from the TrustZone firmware to
> retrieve the resource table for a given subsystem.
> 
> There are also remote processors such as those for video, camera, and
> graphics that do not use the remoteproc framework to manage their
> lifecycle. Instead, they rely on the Qualcomm PAS service to
> authenticate their firmware. These processors also need to be brought
> out of reset when Linux is running at EL2. The client drivers for these
> processors use the MDT loader function to load and authenticate
> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> to retrieve the resource table, create a shared memory bridge
> (shmbridge), and map the resources before bringing the processors out of
> reset.
> 
> It is based on next-20251103 and tested on SA8775p which is now called
> Lemans IOT platform and does not addresses DMA problem discussed at
> [1] which is future scope of the series.
> 
> Changes in v6: https://lore.kernel.org/lkml/20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com/
>   - Added comments made by Bryan to save some cycles and added in 2/14
>     which could change patch order.
>   - Renamed qcom_scm_pas_context_init to devm_qcom_scm_pas_context_init()
>   - Replaced devm_kzalloc with kzalloc for output_rt in scm function as
>     remoteproc framework does not usage devm_ api for resource table
>     pointer which is cause mem-abort issue start/stop test.
>   - Removed union usage and redundant code from qcom_scm_pas_prep_and_init_image().
> 
> Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
>   - Replaced minitems with maxitems.
>   - Addressed comments made by Bryan, Mani and Konrad.
>   - Fixed some of highlighted issues in v4.
>   - Added a new patch which removes qcom_mdt_pas_init() from exported
>     symbol list.
>   - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
>     directly while it should use in the commit where it gets introduced.
>     Hence, reordered the patches a bit like v4 5/12 comes early before
>     4/12.
> 
> Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
>   - Fixed kernel robot warning/errors.
>   - Reworded some of the commit log, code comment as per suggestion from Bryan.
>   - Added support of gpdsp0 and gpdsp1 and disabled iris node.
>   - Add R-b tag to some of the reviewed patches.
>   - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.
> 
> Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
>   - Dropped video subsystem enablement for now, could add it in future
>     or on a separate series.

I specifically think it is the wrong thing to do, to drop video 
enablement from this series.

Its just papering over the cracks. The right thing to do is to have the 
technical disucssion and agree a way forward, not to drop things that 
feel too contentious.

What's really so contentious about

video-firmware {
	iommu data here
};

As has been done with ChromeOS on venus thus far ?

All that has to be made is a case for it.

>   - Addressed most of the suggestion from Stephen and Bryan like some
>     remoteproc code checking resource table presence or right error
>     code propagation above the layer.
>   - Added leman-el2 overlay file.
>   - Added missed iommus binding which was missed last series.
>   - Separated qcom_mdt_pas_load() patch and its usage.
>   - Patch numbering got changed compared to last version
> 
> Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
>   - A lot has changed from the V1 and a fresh look would be preferred.
>   - Removed approach where device tree contain devmem resources in
>     remoteproc node.
>   - SHMbridge need to created for both carveout and metadata memory
>     shared to TZ in a new way.
>   - Now, resource table would be given by SMC call which need to mapped
>     along with carveout before triggering _auth_and_reset_.
>   - IOMMU properties need to be added to firmware devices tree node when Linux
>     control IOMMU.
> 
> ---
> Mukesh Ojha (14):
>        dt-bindings: remoteproc: qcom,pas: Add iommus property
>        firmware: qcom_scm: Remove redundant piece of code
>        firmware: qcom_scm: Rename peripheral as pas_id
>        firmware: qcom_scm: Introduce PAS context initialization helper function
>        remoteproc: pas: Replace metadata context with PAS context structure
>        soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
>        soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
>        firmware: qcom_scm: Add a prep version of auth_and_reset function
>        firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>        firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
>        firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
>        remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
>        remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
>        arm64: dts: qcom: Add EL2 overlay for Lemans
> 
>   .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
>   arch/arm64/boot/dts/qcom/Makefile                  |  10 +
>   arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
>   drivers/firmware/qcom/qcom_scm.c                   | 387 ++++++++++++++++++---
>   drivers/firmware/qcom/qcom_scm.h                   |   1 +
>   drivers/remoteproc/qcom_q6v5_pas.c                 | 166 +++++++--
>   drivers/soc/qcom/mdt_loader.c                      |  43 ++-
>   include/linux/firmware/qcom/qcom_scm.h             |  30 +-
>   include/linux/soc/qcom/mdt_loader.h                |  22 +-
>   9 files changed, 593 insertions(+), 110 deletions(-)
> ---
> base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
> change-id: 20251104-kvm_rproc_v6-6329e4d594fe
> 
> Best regards,
> --
> -Mukesh Ojha
> 
> 


