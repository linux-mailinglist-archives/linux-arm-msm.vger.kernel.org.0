Return-Path: <linux-arm-msm+bounces-91407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hVilJHYwgGl84AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 06:04:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B5C840E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 06:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6EDC300828C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 05:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEF926158C;
	Mon,  2 Feb 2026 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZT9leGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJOlQXuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB262206B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 05:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770008691; cv=none; b=BZQZ/ubzsyYs1mJ1L30PZd6qYiXiFVIKKvmLZjQbSpevthgfMULnQmDrvOXdIW9aNh3opjZWwYybWQBz+uun36DG2dGhj/HtT5x3pE7y2w+GmmEqY4TVMzio2x+vEY3NDSXgsYcgaF0jMqva0MlQkD1o5Wv5a7ZMivU1VG7bwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770008691; c=relaxed/simple;
	bh=UzwQevWpsdXsQi6mZwPgKwp5qqwPQDDY28zbUMRwsFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xne2nREraxFHdbftpu+5HAEKevywkv7jAUmC61f+JMWSOGU4N4/ug2z7bysnAU8pzW9GfndDqZ1U4FxhS+9AhDj2LXT0UbOGfyqjeNLCKfjDG0C3dr1WqYbb/aNstVByted6OnnqB1fNadVoqI3PqA0y3HrsbpqzSjJvwlYWf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZT9leGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJOlQXuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611H9SOR023076
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 05:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCq+q64AS2cxDqWWtZoCYuiF
	viYG1A4fMyG5lYVtRxo=; b=eZT9leGEUvUTUJTdCkhAz/2uaIVal+mghummXCV4
	j9QRUeYVfZsidsVZtAtCpmEpVeinLu3c+j+ucC57b71x3ZweEDskpfVtBPksUqeM
	1BZN3IT457DclSnzXKXd8nkkge8111NcQqc3GNsLMYriclo6Wb6rb8DfAtIsBMvv
	bVgbDD7eoSiLGW72wKtgAq8tIYkPe7OXbU80/Ffr1d6iVbVdBeQgr+8unrFj6F3s
	Y+yVcLTHFz9pb8XnZtv60CiZ40eQeigmL/OjilOHvQZXztWcL1oElJOH8uXCl5Cf
	yvGi8C40TJdUFruxvRvERPuxvn5fpZw8WJ8lqhzrxRR+Sg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx3w9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 05:04:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b713fa927dso3176828eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 21:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770008688; x=1770613488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCq+q64AS2cxDqWWtZoCYuiFviYG1A4fMyG5lYVtRxo=;
        b=IJOlQXuo3vzmZu2IrNYoJbRX1UnsHPnT9m4PiexnB93oAcfNwuUQtcq+8IMCK1MimD
         9+7ji5/M/k+43MduXixgBsREvabOD53XbZpTe1+wBAmP6J4BBL+wgGEaXWnrYorExLB/
         e5n9v5Dz6daxpmuV+mvidpE9z6sgs1OuFXUXfvm1MI2yL5syohvv0WfGmSJeMvBHewkJ
         ymj1gWU01kr4zT4raT6kUKUGq6v1k8kmqoL9VltA7KXEOMbFY6P9Lv1xJER0v6t9i9Y8
         prbXzOmlgIqpshZMvagrdeu1ifpl3Zj6NSM8yWlQNCsGwmxt2oSlCmLDyzpNvnf28Yuo
         ONaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770008688; x=1770613488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCq+q64AS2cxDqWWtZoCYuiFviYG1A4fMyG5lYVtRxo=;
        b=rcfYcLI3Lew2F231T5Bj610aX/cUJcKzbuTn5kDZ813F6fzhE+m4S7Z4O/6TMaiyqf
         nQ3vl1Odo/m5ZYltpHuYXrSPzhuF1wkwSdsMTcoA+T90VQXZRvv87EduVm0OaDHrANBc
         o+XU5kNy5gfJDV6RWzRBMjzJGsFEyEW3K2LV8uxIxMzg+Uq0L1H6G9viTBACoc/TFlL3
         lnSMJyQfrd5RRDvrQOl6ojF5Pfb873WF234F+mPQa2IiQMKjrTJF1qmXSLVvl9YtHH7K
         J1bsMcE81JnvqAS1BscogdjyGx2khIbki2BBqX2oVRADba9xkiKrhI/s9t+/0GmWWziU
         D77A==
X-Forwarded-Encrypted: i=1; AJvYcCU3U6rU6ITSeKfrfuz5jvW7FmoEssBnwEPWKwc2qgRnzuvUn+M4CIdh2x9v+96luErFo7dvPD3tXHvnp2fK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+ACiw8ue9yk4o8qUZunkHZIdCoFmy9yIWlvj6mrE5efGYtD6
	Qbs1QxqokraLfLq03ivu1/KxBJF6+Kyt0LLB917gNS8f7DRSPgaOgkI2/KfN9lmMaev62M6SE4C
	sA/g6yoh+7XGn3LayIrWzHaIbm5BXTRuCx8mOYcJmkLv5RbhVQZ4eXVfCsPJ+rRejdeFW
X-Gm-Gg: AZuq6aJ1UiG7SOzWMbma5qfsUgv+8zzFVzO09Hlj47ZeCxxjVrtla4kL6RKZQBFdhMc
	E2STvz+NO/jShCZbdlzEShpZCg8R8vPrtSirUYylY8PBYCKrp8DQdyzpe87htIb8GYX7JRF4keJ
	XFcZuVM7lEj5xtP2pLWjj0Ng2ZAnMqIBdCypxDIVfBxf+Mm49XYFNWdALN5wnWyYW2dLaJokvbU
	Lxoc07ynR4CKZrSIcrQremKT1X2M3hhzpgza+Zh03aBUJs4tp5BxL/Of2c9N8DVtu/gf0eIEN4C
	uy8RX8Qr5VVMP1Q9iR4uh1Wy2Vq+Kof+Y4PnTpU9SDkthoKOpZgznp7EONsmJQXhrCvgVndUh0V
	Pjd9bvdhOPfMcS15l0FG4+CbpAWJARDcKii40G4GQUMhmy6J45eYdBxWi
X-Received: by 2002:a05:7301:1e4c:b0:2ae:556b:76f2 with SMTP id 5a478bee46e88-2b7b17a7162mr6346363eec.6.1770008687576;
        Sun, 01 Feb 2026 21:04:47 -0800 (PST)
X-Received: by 2002:a05:7301:1e4c:b0:2ae:556b:76f2 with SMTP id 5a478bee46e88-2b7b17a7162mr6346349eec.6.1770008686882;
        Sun, 01 Feb 2026 21:04:46 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9e0304bsm17448885c88.14.2026.02.01.21.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 21:04:46 -0800 (PST)
Date: Sun, 1 Feb 2026 21:04:44 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
Message-ID: <aYAwbARiKCRcWz4U@hu-qianyu-lv.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-4-245f408ed82a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v6-4-245f408ed82a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B2e_DpYIEdpO_HKDma5NFeSAFRSfkIJV
X-Proofpoint-GUID: B2e_DpYIEdpO_HKDma5NFeSAFRSfkIJV
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69803070 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HLvJrb55YJJQxwU-fPkA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA0MSBTYWx0ZWRfXyCekrFrIr6O6
 qheH1aGjWC1YC7+PlgVlBQu65VoZS6gWhqEI9C5xzZWgUpWiZxM7R7dXL00w5DMQsY04xu2zG0x
 XN4hqoacSbvR5aArcWY4GikNjRoCzZ0r8TbKyBOmm2mmGCpLLhXw51VOU3s8f1Jcs+TKr/MWOyB
 WRbod4zhZj/E/Z8hmrGxvU8JdMyZobTRq+JqCoU658sOE7zIiWJDKVIVaspPAAPLJ7/2CERj2SZ
 yLFBDJ8U2ZqJqeTOqZTQ89cigrCLk1QeUlUZh3C0K8yOhckBYhtIXHw80oOSWkKNskwzOKsWQz/
 Pi6Tgbi0kCpOk7yVbiaDYRLA7ApkMngHTAQlsHN4vLBBwpJQHVkagHbE0R1byySh1qTJzpA0YCa
 Zhn5W/xnRQ2/QurKOXJmOFFuvGj63EJMJQ87UR3xjwaKNOoZu5+c3FwFSCWT/8h/LlSRc4eFkww
 SJXtpbo2xAm5cyBTqrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020041
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91407-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F17B5C840E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:54:01PM +0530, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Board and sleep clocks
> - Volume up/down keys
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> 
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 601 ++++++++++++++++++++++++++++++++
>  2 files changed, 602 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a5d6f451f85c..c24ade85b73a 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> new file mode 100644
> index 000000000000..0899214465ac
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
> +	compatible = "qcom,glymur-crd", "qcom,glymur";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c4;
> +		i2c2 = &i2c5;
> +		spi0 = &spi18;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_nvmesec: regulator-nvmesec {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_SEC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_sec_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wlan: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WLAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wlan_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WWAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wwan_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;

Please remove regulator-boot-on, I see SDX75 crash with this property.

- Qiang Yu
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_bob1_e0: bob1 {
> +			regulator-name = "vreg_bob1_e0";
> +			regulator-min-microvolt = <2200000>;
> +			regulator-max-microvolt = <4224000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_bob2_e0: bob2 {
> +			regulator-name = "vreg_bob2_e0";
> +			regulator-min-microvolt = <2540000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l1b_e0_1p8: ldo1 {
> +			regulator-name = "vreg_l1b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_e0_2p9: ldo2 {
> +			regulator-name = "vreg_l2b_e0_2p9";
> +			regulator-min-microvolt = <2904000>;
> +			regulator-max-microvolt = <2904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_e0_2p79: ldo7 {
> +			regulator-name = "vreg_l7b_e0_2p79";
> +			regulator-min-microvolt = <2790000>;
> +			regulator-max-microvolt = <2792000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_e0_1p50: ldo8 {
> +			regulator-name = "vreg_l8b_e0_1p50";
> +			regulator-min-microvolt = <1504000>;
> +			regulator-max-microvolt = <1504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_e0_2p7: ldo9 {
> +			regulator-name = "vreg_l9b_e0_2p7";
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_e0_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_e0_1p2: ldo11 {
> +			regulator-name = "vreg_l11b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_e0_1p14: ldo12 {
> +			regulator-name = "vreg_l12b_e0_1p14";
> +			regulator-min-microvolt = <1144000>;
> +			regulator-max-microvolt = <1144000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_e0_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_e0_2p4: ldo17 {
> +			regulator-name = "vreg_l17b_e0_2p4";
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <2700000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E1";
> +
> +		vreg_l1c_e1_0p82: ldo1 {
> +			regulator-name = "vreg_l1c_e1_0p82";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_e1_1p14: ldo2 {
> +			regulator-name = "vreg_l2c_e1_1p14";
> +			regulator-min-microvolt = <1144000>;
> +			regulator-max-microvolt = <1144000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_e1_0p89: ldo3 {
> +			regulator-name = "vreg_l3c_e1_0p89";
> +			regulator-min-microvolt = <890000>;
> +			regulator-max-microvolt = <980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_e1_0p72: ldo4 {
> +			regulator-name = "vreg_l4c_e1_0p72";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <720000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +
> +		vreg_s7f_e0_1p32: smps7 {
> +			regulator-name = "vreg_s7f_e0_1p32";
> +			regulator-min-microvolt = <1320000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8f_e0_0p95: smps8 {
> +			regulator-name = "vreg_s8f_e0_0p95";
> +			regulator-min-microvolt = <952000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9f_e0_1p9: smps9 {
> +			regulator-name = "vreg_s9f_e0_1p9";
> +			regulator-min-microvolt = <1900000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e0_0p82: ldo2 {
> +			regulator-name = "vreg_l2f_e0_0p82";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_e0_0p72: ldo3 {
> +			regulator-name = "vreg_l3f_e0_0p72";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <720000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e0_0p3: ldo4 {
> +			regulator-name = "vreg_l4f_e0_0p3";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E1";
> +
> +		vreg_s7f_e1_0p3: smps7 {
> +			regulator-name = "vreg_s7f_e1_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_e1_0p82: ldo1 {
> +			regulator-name = "vreg_l1f_e1_0p82";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e1_0p83: ldo2 {
> +			regulator-name = "vreg_l2f_e1_0p83";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e1_1p08: ldo4 {
> +			regulator-name = "vreg_l4f_e1_1p08";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1320000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "H_E0";
> +
> +		vreg_l1h_e0_0p89: ldo1 {
> +			regulator-name = "vreg_l1h_e0_0p89";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2h_e0_0p72: ldo2 {
> +			regulator-name = "vreg_l2h_e0_0p72";
> +			regulator-min-microvolt = <832000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3h_e0_0p32: ldo3 {
> +			regulator-name = "vreg_l3h_e0_0p32";
> +			regulator-min-microvolt = <320000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4h_e0_1p2: ldo4 {
> +			regulator-name = "vreg_l4h_e0_1p2";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1320000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&pcie3b {
> +	vddpe-3v3-supply = <&vreg_nvmesec>;
> +
> +	pinctrl-0 = <&pcie3b_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie3b_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3b_port0 {
> +	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie4 {
> +	vddpe-3v3-supply = <&vreg_wlan>;
> +
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie5 {
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie5_phy {
> +	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie5_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie6 {
> +	vddpe-3v3-supply = <&vreg_wwan>;
> +
> +	pinctrl-0 = <&pcie6_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie6_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6_port0 {
> +	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pmh0101_gpios {
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio14";
> +		function = "normal";
> +		bias-disable;
> +	};
> +};
> +
> +&pmh0110_f_e1_gpios {
> +	nvme_sec_reg_en: nvme-reg-en-state {
> +		pins = "gpio14";
> +		function = "normal";
> +		bias-disable;
> +	};
> +};
> +
> +&pmh0101_gpios {
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +};
> +
> +&pmk8850_rtc {
> +	qcom,no-alarm;
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
> +			       <10 2>, /* OOB UART */
> +			       <44 4>; /* Security SPI (TPM) */
> +
> +	pcie4_default: pcie4-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio147";
> +			function = "pcie4_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio146";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio148";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie5_default: pcie5-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie5_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie6_default: pcie6-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio150";
> +			function = "pcie6_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio149";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio151";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie3b_default: pcie3b-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio156";
> +			function = "pcie3b_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio155";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio157";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	wlan_reg_en: wlan-reg-en-state {
> +		pins = "gpio94";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wwan_reg_en: wwan-reg-en-state {
> +		pins = "gpio246";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> 
> -- 
> 2.34.1
> 

