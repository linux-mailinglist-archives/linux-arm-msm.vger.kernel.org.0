Return-Path: <linux-arm-msm+bounces-118109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gHufEh0FUGrIrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 22:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2073559C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 22:31:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mPqolArs;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB6C303452A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 20:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B8C3BBFD3;
	Thu,  9 Jul 2026 20:31:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A33CB8F1;
	Thu,  9 Jul 2026 20:31:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629082; cv=none; b=VxBatsQ5RSRt++wiCDaJ8A7/em810zVsORIf6Vi38NE00ZX8/Z+vVxOhC048EcSlXA7B4+i3EjhrRsmc/7wBPwjlVQ64o1sZckCkWP6Yn9Wl60NnWEn4CGLTOItHDyiViPbsaJ9KSlV0eFi4gpR8CuxblK2l71Ox2PHSYp3M4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629082; c=relaxed/simple;
	bh=ixMi6HpM4htSHbYkQqTkfjEBKIC3adwC+jwQ/ynG114=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA6nJpyN278ilNdO47akb2o55e4jmNyoA4lxT70JwhrQc8WMdU9tGooeE4I/h8iFWJLxu/CJZcRDK5NJwbjUcsqYeG892vQ2KkqWYAxDbK23bauI5RzNx0ar7ajK8yNqrpkjtrLZj9CUG9rbeYdLgyQh8Zd9eobVYxaPI/XOLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPqolArs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9861F000E9;
	Thu,  9 Jul 2026 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629079;
	bh=mU6wcQmTF9H5kdA4V6p1oE5hd739P6/b6LjkbNEjJo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mPqolArs5+rCBpKiIViShiPvWCTmtVNHSmuZtyl92YiFmNNlY4RNS0m32zsXkIA9e
	 ZIgUVmdV3mc48AOFXhOf+FJN+XbIgFzggFMiQ74LhWPTV23AcW4OJaR8uPWUrWydjR
	 E8cxZyqfWva2Ai4ZwNBA5Jm5eaqZ6o46957oULm+LUH3WGcf7dMzPesIumt/wbPbLr
	 LXIQ0f8G5b2KlHLzJquCp1A5titiua7SRDkDDM+/iV3bsdNdeK0Qgcp5YgO/iszDWf
	 kSpLtwc8/CDjY/WkSg2uIxXxNI4RTwmCqFUegkVxI9FWZ+QRzKODn17c6nl/B0LZaD
	 IcnFy7izDWdqQ==
Date: Thu, 9 Jul 2026 15:31:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, manikanta.mylavarapu@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alAEKQzBXqjESAbo@baldur>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118109-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:url,qualcomm.com:email,outlook.com:email,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFD2073559C

On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> Hi Bjorn,
> 
> Could you please help review and pick this series if it looks okay to you.
> 

Sorry for not keeping up with this corner of my inbox.

Series looks good, please rebase on the PAS changes that should show up
in the next linux-next.

Regards,
Bjorn

> Thanks,
> Vignesh
> 
> On 5/13/2026 11:49 PM, Vignesh Viswanathan wrote:
> > Hi Bjorn,
> > 
> > A gentle reminder to review this series. All the patches have picked
> > up R-b tags. If it looks okay to you, could you please help pick
> > it up in the current merge window.
> > 
> > Thanks
> > Vignesh
> > 
> > On 5/5/2026 3:53 PM, Varadarajan Narayanan wrote:
> >> As discussed in [4] posting this series after dropping IPQ5424 support
> >> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
> >>
> >> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
> >>
> >> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> >> I've resumed Gokul's work as the last submission dates back April 2025.
> >>
> >> - Secure PIL is signed, firmware images which only TrustZone (TZ)
> >>   can authenticate and load. Linux kernel will send a request to TZ to
> >>   authenticate and load the PIL images.
> >>
> >> - When secure PIL support was added to the existing wcss PIL driver
> >>   earlier in [2], Bjorn suggested not to overload the existing WCSS
> >>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
> >>   This series adds a new secure PIL driver for the same.
> >>
> >> - Also adds changes to scm to pass metadata size as required for IPQ5332,
> >>   reposted from [3].
> >>
> >> [1]
> >> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> >>
> >> [2]
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> >>
> >> [3]
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> >>
> >> [4]
> >> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
> >>
> >> Changes in v12:
> >> 	- No code change
> >> 	- Rebase to ToT
> >> 	- Change quicinc mail ids to oss.qualcomm.com mail ids
> >> 	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/
> >>
> >> Changes in v11:
> >> 	- Add R-b tags
> >> 	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
> >> 	- No change in other patches
> >> 	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/
> >>
> >> Changes in v10:
> >> 	- Add R-b tags
> >> 	- Remove unused fields from 'struct wcss_sec'
> >> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
> >> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
> >>
> >> Changes in v9:
> >> 	- Add R-b from Konrad for dts patches
> >> 	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
> >> 	- Restore clocks & clock-names in above yaml
> >> 	- Fix DCO on two patches
> >> 	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/
> >>
> >> Changes in v8:
> >> 	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
> >> 		* IPQ5018 support added in v6
> >> 		* IPQ5424 support dropped in v8
> >> 		* Updated to use IPQ9574 as example
> >> 	- dt-bindings-check and dtbs-check passed
> >> 	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
> >> 	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
> >> 	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
> >> 	- Dropped changes to ipq5424.dtsi
> >> 	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/
> >>
> >> Changes in v7:
> >> 	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
> >> 	- correctly sorted smp2p-wcss nodes in dtsi files
> >> 	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com
> >>
> >> Changes in v6:
> >> 	- added patch to fix IPC register offset for ipq5424
> >> 	- changed phandle description for mboxes property in dt-bindings
> >> 	- updated bindings to define the right clocks per SoC based on
> >> 	  compatible. Ran make dt_binding_check for validation of all
> >> 	  SoCs
> >> 	- use of more descriptive match data property (use_tmelcom) and
> >> 	  added a condition in wcss_start to not error out if tmelcom
> >> 	  isn't used
> >> 	- mitigated potential off-by-one
> >> 	- adopted use of of_reserved_mem_region_to_resource to acquire
> >> 	  memory-region resource
> >> 	- added driver support for ipq5018 SoC
> >> 	- corrected size of reg properties as per Konrad's comments
> >> 	- added patch to bring up Q6 in ipq5018 dtsi
> >> 	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> >>
> >> Changes in v5:
> >> 	- retained all the patches as in v3 and addressed comments in
> >> 	  v3.
> >> 	- reverted changes to dt-bindings done in v4 and retained as in
> >> 	  v3 and fixed firmware format from .mdt to .mbn and retained
> >> 	  reviewed-by.
> >> 	- dropped 2 patches in v4 that adds support for q6 dtb loading.
> >> 	  Will post them as a new series.
> >>
> >> 	Following tests were done:
> >> 	- checkpatch
> >> 	- dt_binding_check and dtbs_check
> >> 	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com
> >>
> >> Changes in v4:
> >>         - changed q6 firmware image format from .mdt to .mbn
> >>         - corrected arrangement of variable assignemnts as per comments
> >>           in qcom_scm.c
> >>         - added scm call to get board machid
> >>         - added support for q6 dtb loading with support for additional
> >>           reserved memory for q6 dtb in .mbn format
> >>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
> >>           and additional item in memory-region for q6 dtb region.
> >>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
> >>           Kconfig
> >>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
> >>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
> >>         - added required check for using tmelcom, if available. Enabled
> >>           fallback to scm based authentication, if tmelcom is unavailable.
> >>         - added necessary padding for 8digt hex address in dts
> >> 	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com
> >>
> >> 	Following tests were done:
> >> 	- checkpatch
> >> 	- kernel-doc
> >> 	- dt_binding_check and dtbs_check
> >>
> >> Changes in v3:
> >>         - fixed copyright years and markings based on Jeff's comments.
> >>         - replaced devm_ioremap_wc() with ioremap_wc() in
> >>           wcss_sec_copy_segment().
> >>         - replaced rproc_alloc() and rproc_add() with their devres
> >>           counterparts.
> >>         - added mailbox call to tmelcom for secure image authentication
> >>           as required for IPQ5424. Added ipq5424 APCS comatible required.
> >>         - added changes to scm call to pass metadata size as required for
> >>           IPQ5332.
> >> 	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com
> >>
> >> Changes in v2:
> >>         - Removed dependency of this series to q6 clock removal series
> >>           as recommended by Krzysztof
> >> 	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com
> >>
> >> George Moussalem (1):
> >>   arm64: dts: qcom: ipq5018: add nodes to bring up q6
> >>
> >> Manikanta Mylavarapu (4):
> >>   firmware: qcom_scm: ipq5332: add support to pass metadata size
> >>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
> >>   arm64: dts: qcom: ipq5332: add nodes to bring up q6
> >>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> >>
> >> Vignesh Viswanathan (1):
> >>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> >>
> >>  .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
> >>  arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
> >>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
> >>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
> >>  drivers/firmware/qcom/qcom_scm.c              |  14 +-
> >>  drivers/firmware/qcom/qcom_scm.h              |   1 +
> >>  drivers/remoteproc/Kconfig                    |  19 +
> >>  drivers/remoteproc/Makefile                   |   1 +
> >>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
> >>  include/linux/remoteproc.h                    |   2 +
> >>  10 files changed, 723 insertions(+), 5 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
> >>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> >>
> >>
> >> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> > 
> 

