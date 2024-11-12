Return-Path: <linux-arm-msm+bounces-37555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B289C4FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 215DCB26879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384C320EA3C;
	Tue, 12 Nov 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="VaNcyP43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m25496.xmail.ntesmail.com (mail-m25496.xmail.ntesmail.com [103.129.254.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282EE20C499;
	Tue, 12 Nov 2024 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.254.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397333; cv=none; b=HQrTFFhn4xA36d678vV1Y9d1DEhJmiCrz2FeHTOeDmi+IjFc91t4Od/Er9p/g55KA66l7JkRLMurfQ4EJeAUHMIuxjdg1JFvm7nq3f+tT3diTi9sxd5Wk5sI/tnghceWJnKZLaVXLP6rMb3PCwJOPIxldbmiqxW24j+yyrGialQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397333; c=relaxed/simple;
	bh=dBnJYwwKIgzcIjgyx5ZbrWtctPqBJ+GRz95RV8x2jAo=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=b9l0nqwsqgG1wPDGSNsvF/ZoerwojXJYfPU74yCo/c25N2tjcQ31h5cgSBaOtRu7FFrVJEWCIhmtgCHwcvmpVclE1NYJ3945HIF0TdT+qcJQpeyADGJSDIGcryAVn4dhb+dLfChsGfC4BOW48wqBAOAi/LDgqHJ+B2EQodA5kY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=VaNcyP43; arc=none smtp.client-ip=103.129.254.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28050541;
	Tue, 12 Nov 2024 15:36:48 +0800 (GMT+08:00)
Message-ID: <2276434c-8842-42ce-9cdb-929fc2c06b76@rock-chips.com>
Date: Tue, 12 Nov 2024 15:36:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanasscheartin.petersen@oracle.com>,
 Mike Bi <mikebi@micron.com>, Bean Huo <beanhuo@micron.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Luca Porzio <lporzio@micron.com>, Asutosh Das <quic_asutoshd@quicinc.com>,
 Can Guo <quic_cang@quicinc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "\"AngeloGioacchino Del Regno\"," <angelogioacchino.delregno@collabora.com>,
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Content-Language: en-GB
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 0/5] scsi: ufs: Bug fixes for ufs core and platform
 drivers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklNTVZPTE9NGRlLQhpOTh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a931f4dbe1609cckunm28050541
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDI6MTo5CTIvGhlLTiFJOBQw
	GjYKCwpVSlVKTEhKSEJMS0pKT01LVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9JSTcG
DKIM-Signature:a=rsa-sha256;
	b=VaNcyP43gs9wLB8ql74QChUl2E4KHbG97hymVTtaj1TJmMLA4m/SXWGvg3lfvdKXC0rhXppjbqjnQMJabET6k7SjGKauf3hC+zhmftoUopLZ5RhltoWgyI3DkukW7WsQpIicHNxfL3t0////UHSqWQ1RO66ufDDRyifnzGC7NC0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=W8wIrOJrtWi9wR0/zvQJRVrLG+fDpqQvqOPRmkLlgVs=;
	h=date:mime-version:subject:message-id:from;

 > Hi,
 >
 > This series has several bug fixes that I encountered when the 
ufs-qcom > driver was removed and inserted back. But the fixes are 
applicable to
 > other platform glue drivers as well.
 >
 > This series is tested on Qcom RB5 development board based on SM8250
 > SoC.
 >

Test this series against the under-reviewed ufshc
for Rockchip, it works:

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

