Return-Path: <linux-arm-msm+bounces-108249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LLwMbdHC2o7FQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E79A57171C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AD4B30010F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF6B381B15;
	Mon, 18 May 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZRboyY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0JOP0H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4661D265621
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124148; cv=none; b=EyDbfJXlygz5xPZH1Oqh10QRk/v+XSqcDzUzfBZesNZto4tf23Gy8ze9GW867uPY7mKOPk7knjZd6TBv09vu4VwLLsBvkq9dnZRS+EPVZX4UFaCIqVSJFgy7uIdCHmCWjYdyeyPU2hr9p9YBFokh1rUnJWHl/5jZjxUHp/01aUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124148; c=relaxed/simple;
	bh=EiA4Qza20kI0bI27FyEkORjQDf1WJe1jx8699YeVPcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGo3DIU6jM4AEGIPwJI1zrMfotu+XJw/5NG+dcyAfVAFf+ui8gRRhRD60dvEW5I+sfm0YlYx0JYW8Psjr1Q9xwJ482GRB1uf1S0CG/UvO1IYUGPWtbjjoRe/V5DgsioBOzVY4SceLUAzmqTgtym0U98/qIjvqOlz1tXQC0yQqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZRboyY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0JOP0H4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLC251890433
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aiKhZszooCZnIL9WnJC9bubT
	UUgVmiFNdwhBceZv0mg=; b=eZRboyY1a/j/JE+oB6LC5rC1v/ehVUnsbRF6AlXE
	2B5GaRa/fLjczO14sd6t79VkYYnuPlMuMec09/uheXyhoSNJ/CRGvDK7IK8SEUFe
	WXB0pgFV7fhH5K4NDptCpN45QWc7mWcyMk4G3a4W5hzG1ppbdhRwSpSTTa/MiP5g
	KRRmyrUhf5YdwJQ6HPqYlmINFUDYyT2wKfF9cgvkfkgLrpXpbUxYhTTk/mqYMPfV
	LuLYZqVRvCgOI0aGyLMliXjDuvto5/ZjLVPG5sP5CMLJCN8bTyPI9pxwZSUIjHFl
	DXBI0eMIDWX8W5/25wXN3KDkB7tklypUiB2GX1FdRI79nA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw14ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:09:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753ef2562aso2020707e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779124145; x=1779728945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiKhZszooCZnIL9WnJC9bubTUUgVmiFNdwhBceZv0mg=;
        b=d0JOP0H4HBg+uxb1U5TV9qux6g8t0S8yA18HWyZbIxTPeDJxiwHKbMc4g98R8ckK/8
         wxjeyF3ODtCy8xn3lIDITQB+2jfb9YYEyx3/qIqx7XA3gXXBzOwviAe9m+zmHpJnAg8F
         VnIxDWiyOreBjWBQrUoUqoL8ha8XahlgXJRYw0Up2tjgXspNyXmGBixR98hrlSMhWAvp
         dDYLvL4s3s6hbqaaOUx6DG4JhkTx59wMDXSCjp26Zk81CGTkY3yFMfK91Ah5DqG1s9mw
         9S1mmR40yip7VaoZ14x0ZCX78lBT+DzZxAPJYAVtG7MKrZ/inxS6opK5NtF10ASIXwWV
         jjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124145; x=1779728945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiKhZszooCZnIL9WnJC9bubTUUgVmiFNdwhBceZv0mg=;
        b=S3ROkY7L6iB8cCRVJG0bNTw+SQ9n5FXFbeNPq6XpX3Mxp2fz96uxx0u8lxnyzCicvr
         nAwsYOR8/tGRE6B60JXu2ywgX+AorV4wIcRP3XstNc6s8p9PYQ5NQG9gqfbzGQtfA5uF
         sGWuCPQ69xRI7PpxzTKCZ5uDzOtUGZsXMks7Znwxywrond/6doAbMZbwGLKgKEIxhyOQ
         QB3y+P1oyU1zbL5GnFXFL26nw++GDuz+oEZ54Ip4JtqgeKhqlAt5TCKn3Zj7vdQsOKd4
         ZbfztdZsmIRrftzp7FzikpXXYZJcKPnaybtWwFUoYtFy1LB2sunjihGc2BqA1vev0baa
         MsvA==
X-Forwarded-Encrypted: i=1; AFNElJ+azUbx9E5IBaA8MmnUTWLEler9+L04opOFOdq57Ouy7j8vIukafZ/Bj6fTV2s4nre+MmZONKg/9xzfs/HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyVV5RaxbxWqB0kszynacXLxNASgrNF0llfDfcBh1VLaAwN+2hm
	vPnk9gNd8WwuWvtx6DNW9dziklfDLRooLR8cP8CGCW7ICuu/++dBJkTaedrSGjd7XQDIvDHoi6Y
	Q/2OMjEr9nd+ENJd425t73GwYg6cWWoMh3TaJamv3uKtpJNuNRqpGDfVYU+ZXEP2dg7j9
X-Gm-Gg: Acq92OEYpOiAsUe4fZSRduzyaJU+X7qCM/fS7SrTILJ6QE97bwuQnOSnwgPFBrskh0R
	2E+c/8/DPFPhv1TvAhQdrV8dqbvl33RmBO3tAZ57pBE5I3+UxUkfkiiMjVwjs81s+0c/cL7S3QC
	NXhL3GCcQkU8tDrpurH9WjMd1ALk8oOB0iOu2AZ3+5pykPldh5QMDOWT3TjQcqiwwuusFv3kdJ8
	jtQ0Brjvpf4vMMvENmQ4W1OGIf5frmRQ/D6dEGnbQUP0qutf0ac3w92ZFgUpHQ0ms8H2g8LAsGZ
	71WX6VAfz+CpDSxHklsgNforBtOVgh+hho5V5WNfQQACFDQ23P75oM2Tz+VZ0msRssNQy/dQmCk
	FHbBG3MUdgVG+l/EeYParfH3xb6IhoVVyD3WCJTcTfByvaZYANEkpJK741NkspMu3nOyrnpoVH7
	eBn8VBvGMQAkaN+/GOapgr7tgEwHBw7z+xDAY=
X-Received: by 2002:a05:6122:338f:b0:56e:e68e:9fc2 with SMTP id 71dfb90a1353d-5760c013b50mr9411634e0c.10.1779124145495;
        Mon, 18 May 2026 10:09:05 -0700 (PDT)
X-Received: by 2002:a05:6122:338f:b0:56e:e68e:9fc2 with SMTP id 71dfb90a1353d-5760c013b50mr9411593e0c.10.1779124145016;
        Mon, 18 May 2026 10:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm3448184e87.79.2026.05.18.10.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:09:03 -0700 (PDT)
Date: Mon, 18 May 2026 20:09:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V1 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <c6hlbz44belq5l3ko23ijny22hxzei5fexk47hwselgn7onsbz@o7uwxlkvgtwt>
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
 <20260518165346.1732548-4-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518165346.1732548-4-palash.kambar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b47b2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=A1qZTpn-tPCv_KexcQ4A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OCBTYWx0ZWRfX4Y3axiH865jz
 8dVMUfGA5YLqry5f0X4XWdrY77uzbMab4FxmDapv3RkxHreBNU2lBlkdm3AZhZwD6POAiOZeHEY
 9UYM5q2/m1gpNBi7XnZOibPesLJYg/1Csbtsf1us9naTJatnbZpZ6b8nfMBbwJL6+P88xgTKNfD
 dCmwQ7poHfz2uis4VtT3pK4Ik1hPw+PpknnrO+sxrj3YMULwSzgahLek1UcMjak7qtVBYtXRCgC
 bkqmEgSLC8zYLRmgU6mkUQAXkzH3Y81bFs5oruQlmVKfzKA5sSVHqPada8P9vo/csvKSSrLucb3
 CmEqxZWuaAZdXuo8HjzzFpw4kkpzw+mvru/Pzpmf9ehpTGldQsN61w2EV60NrcIogijlmxovKWx
 Jg/J5yVKzopdnTf7FvZEOfopBGct4sM6RTA1CcoTn4CRA6JR5OoMrqm2OVH6xDDc9wfPxAeSxIl
 BxUtKzq5vxyxDgRKa6A==
X-Proofpoint-GUID: I_1EP9wahSlNjzYebYI1a2EVlzbeiHtz
X-Proofpoint-ORIG-GUID: I_1EP9wahSlNjzYebYI1a2EVlzbeiHtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108249-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E79A57171C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:23:46PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  22 +++
>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
> new file mode 100644
> index 000000000000..bf914c752d22
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
> +#define QCOM_PHY_QMP_PCS_UFS_V7_H_
> +
> +/* Only for QMP V7 PHY - UFS PCS registers */
> +
> +#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01C
> +#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
> +#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02C
> +#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
> +#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
> +#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
> +#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
> +#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
> +#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
> +#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> new file mode 100644
> index 000000000000..5f923c3e64ec
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
> +#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
> +
> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
> +#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1BC)
> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1C4)
> +#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1DC)
> +#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2C8)
> +#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1E4)
> +#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2D0)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xD4)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xEC)
> +#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
> +#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2B0)
> +#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3B4)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3BC)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3E0)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3E8)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40C)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
> +#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xF4)
> +#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1AC)
> +#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
> +#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 771bc7c2ab50..a4801cf4b0fe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -29,9 +29,11 @@
>  #include "phy-qcom-qmp-pcs-ufs-v4.h"
>  #include "phy-qcom-qmp-pcs-ufs-v5.h"
>  #include "phy-qcom-qmp-pcs-ufs-v6.h"
> +#include "phy-qcom-qmp-pcs-ufs-v7.h"
>  
>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
> +#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
>  
>  /* QPHY_PCS_READY_STATUS bit */
>  #define PCS_READY				BIT(0)
> @@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
>  };
>  
> +static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_START_CTRL]		= QPHY_V6_PCS_UFS_PHY_START,
> +	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
> +	[QPHY_SW_RESET]			= QPHY_V6_PCS_UFS_SW_RESET,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,

Don't mix V6 and V7 registers. And why is it v7? The rest of the
registers point out a v8 PHY.

> +};
> +
>  static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> @@ -1844,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>  
>  };
>  
> +static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),

Yep... If it is V8, use V8 registers. Even if they are they same.

> +};
> +
> +static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),

And it's V8.

> +};
> +

-- 
With best wishes
Dmitry

