Return-Path: <linux-arm-msm+bounces-108230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBqpKCouC2plEQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:20:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015F56FCCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DC6D301417C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB8C3793CB;
	Mon, 18 May 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZE9Z7ZkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPlXxVgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5937882A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117595; cv=none; b=mrdKRY7XsHVtdkbJFQL/Kp2UhTv9WWN9R4vOdWoyHTSpFeFmREDwg6yGtGr5QWN824rAY8VB9I+lDPNOP1PXhgWLPW/GDAa8R0BhBh3Ua69+fZPGVvoEP+hDKPBJlqcekV6YStIL5PvGft1ZZTM11CCTXEVZ/mVoVefzr3TA4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117595; c=relaxed/simple;
	bh=gsMvSkDHih/DpAaIuXXZEcZYD6pPNphdGJGyi6G5Q0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsLbfBjxaouM41YESFFzusypTJut6FJZw5uOgEZJsBwnadWaC7HRW4tC1IlSNVZgbe/+PYZ7e57I3jrlzdE4xb2ppDTs1PyZONIo382QhE1UvTwl2ZOYiapx+zjZWmTLCx+LTc/j8rETapIuDlnvfKPe9BJ54PcRF9knAoU+eoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZE9Z7ZkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPlXxVgc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICowQf2437952
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MAoae7wwX91CbhGp0sKlfhoc
	wtNDrl8kr6qv9MhQNYo=; b=ZE9Z7ZkTfMC+OCZlDDx4CumTgzAtrJ1dy84rCaTQ
	C/gilhsE2lIFmFb2vFQ/O3qiaH07vw3OV294IuSXqkiqrBTl3okevIMKsXVrTSzT
	FzT7HMKfVn0yCZCEBO+CgPUQCJMYAGPfKg5ezIr1P9doaMSMYQcKbiPFN8zrbT7Y
	5/ufjvvipiw0/UV2gWPvwIINZXf4uJyBP89RIfUYzV/+jOEFXTc5P6OoOmmOOkZb
	X7sGKG70trDvjUgqDTYrhftlQ80o6RtRF3S9MqdzUYqCBO2HT7ZjyK4T83IdVAih
	OZ8u6nUgiYkyCQS3OBXDDLnN2T0z75bTI+EQC2RlZiaqRw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v0juf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:19:51 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-696906dddbbso2544018eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779117591; x=1779722391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAoae7wwX91CbhGp0sKlfhocwtNDrl8kr6qv9MhQNYo=;
        b=UPlXxVgcJY/6NUKKfCLYyQ6hSajq+9QqM6d/Sm6DPIeVmJyaTw6VvTCvOetD49MD+G
         SihMKlRISuWVsdO/WJl5MsutHO1y3BmUsTJNNy0u1jQHokwxUZepM3pbXScZm/rnp1W5
         m0BOTYKyxV74JPHbTzKSmhl7C6qSpQHISXr6FHlQ1YX7FOvxCMsjtkiup8Etul3FgiYs
         pNugl8tuQLCWJWxG/90314w1jLvGD+uWW9+sOzvl7/foyaDN2uJq59hKPV7VbjnE6E8d
         /xnyXGGC+dLnl6Hfxspcyp0T6ghaJop+VWP6FDsaownfqWoNpymTyIvpt0jVGKUDwOWd
         UJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117591; x=1779722391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAoae7wwX91CbhGp0sKlfhocwtNDrl8kr6qv9MhQNYo=;
        b=bquYX2vAu1DLMrCNRWYFsvZ73u0YA6n8xXQKQKUd+mvfl7cciF63pCKBJ7/UOFvLUc
         3UwYLiIbeOrcbd6qhH7Wg8dHJcyyU1WrAzxFqqZ83hgVtRkVvU1smbWLkwPy6MjWUxq5
         OjQvHwQ9Th/9XKPTNgpjJuJlX3syrpn6nFsFKOTMF624EpjjkUkedu0y0QQS6Jgs/T67
         WJtXqtu8zf0GRG485HYGTtZIMZDAZbjTojG86D5QmaRfdC6dA0JH1rnDT5dvDGrBNjY4
         G9G1PisTKw2OlCg4d5WPU77EzC/qTzH0c+BH/HIRTrX1uJnrJ5FtBiIMtBn4AnM3JYGc
         Km1w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZiOTksl+VM7KGaXn6nXYSpvXWXsVAfMhJFpnYowHFkS3zqXu2/yxGTMPk+1BvGbb1+2DTMKG+k34waChq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5evvIbSblm+YyO5zpJmgTUES2hGYArIK6XA3gKHHSjtZzP4Jx
	Dwzz7KH4u+Syg1Nw2B1DJk6ddoqYd8Doty99Cl3IxUk2Fn2xHjaCSIAfHflvTo2OJeYwI33iFMI
	kMRbioB/CEbz0gn+cNkmeCPjI+Vjxlv3vBV5Jt+lQNl0yzAyBjg9BGUC1PMmfWtCUuLlO
X-Gm-Gg: Acq92OEQTF+4C7qVLWeDNe+1p6BqmQVcTRjZ7ypEUrPwcveGjIoYxpewN9j+A9u5qEx
	ukhw3OLOvnz+7QqPuVtQRFxP9jwKpt++ych+iEesKBXeb25Tr9NX8Ea1UwDO19qaSpDSmmcCnMK
	QN90C/7utsGsc879zlm9GVwJm7jgHpRtgMaeZgIQLP0PoHQwkr1JQ00v8gcz2nCVbP63WkloqGV
	BxZCOEiWpVWiYyP4nyX0f6z1SGhGFQn5zKKG9BXtWLf37t9keAttG9SluT7eP+00HjvaGLErMTH
	mvDL1jHP8ExIpk8S2swps8G2sZXUwOIEErDBRrKIOHf8kVG2iMxu294QAQaI8VSFhMH+K8koJmQ
	pKI0LZU4HI3CIho3+eR2e3svD1ftUKyNtNyQNJmdhFfJrivbNPbIIFCQpT4uLJASJA2z/oZa+Bj
	nroNfBK1zoJuFaxClsMT5mSGRIubCDHoQZ2/I=
X-Received: by 2002:a05:6820:4c01:b0:69b:4cbb:a1f with SMTP id 006d021491bc7-69c9437a913mr9473816eaf.38.1779117590617;
        Mon, 18 May 2026 08:19:50 -0700 (PDT)
X-Received: by 2002:a05:6820:4c01:b0:69b:4cbb:a1f with SMTP id 006d021491bc7-69c9437a913mr9473777eaf.38.1779117590134;
        Mon, 18 May 2026 08:19:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm3388384e87.79.2026.05.18.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:19:48 -0700 (PDT)
Date: Mon, 18 May 2026 18:19:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
Message-ID: <ej2mvzftnm67lrptxktuinzw4au36xpwvbqiivlxmdnvkmvmsj@hmzvlb7lbfvm>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
 <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
 <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b2e17 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xxU2PZ4KthE6Ad2txm0A:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: zP8gH7lCG97vqh-BqMoObZWcLDQY0IVq
X-Proofpoint-GUID: zP8gH7lCG97vqh-BqMoObZWcLDQY0IVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1MCBTYWx0ZWRfX7+9T5VsyiNj+
 dSjTw6pLVFXywanPXMd4cr6Ntj3PxwW7M6RybnQrCGXdWbvwHSZ7glCjlFfwizT5kZCsu5uIf7Q
 Vlnsb/j+cvZ8x6cHXjD1xbq/KboVJFU4DlCWxxFD00olTJoxkFUqg786LzZms6Fo5obWU4P04Hn
 cT0ltQrlGXSp/lp7Xsxu73wMEfn8G2Hvvv5JouJsVou51k2MpSDxDX5+fjUeX4ZyK8A1Dvbi3Lx
 RrWvgi7PhE/ng3RTSBpOP50v0w5gJRfcbETm5MC74DVNJzTlbR+9TjRCBImdWbqviDK28DfSh9F
 Y9PraN82z/n6TizbSdO/CeTgQZnZAeKOFR1K1h0ci+EWWGLkFh9ktJrrCm+6XyUVIPeqQw+SzVU
 8ggGSf0BJgHDREhciJYEC6ugqQkuX3oFtb1ZGu4aT6lDXecIHZV+sFR2DxH88TyWtmtTKQqirI7
 IRJsoNOBtWpTAoNKZxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180150
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108230-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9015F56FCCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 02:29:26PM +0200, Konrad Dybcio wrote:
> On 5/18/26 2:25 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> >> configuration. Define a new phy_mode for them.
> >>
> >> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> >> distinct, most visibly in the electrical/analog aspects (slightly
> >> different frequencies, timings, etc.). This results in a need to make
> >> the PHY aware of the actual mode needed (at least in the Qualcomm
> >> implementation, but I believe that'll be a general need).
> >>
> >> Newer versions of TBT are basically supersets of USB4 with higher
> >> host-side requirements, so these are not defined. This can always be
> >> changed as necessary.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
> >>  include/linux/phy/phy.h     |  2 ++
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
> >> new file mode 100644
> >> index 000000000000..5f48059814e1
> >> --- /dev/null
> >> +++ b/include/linux/phy/phy-tbt.h
> >> @@ -0,0 +1,14 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __PHY_TBT_H_
> >> +#define __PHY_TBT_H_
> >> +
> >> +enum tbt_phy_submode {
> >> +	PHY_SUBMODE_TBT3,
> >> +	PHY_SUBMODE_USB4,
> > 
> > Do we need TBT2 as a separate submode?
> 
> I would like to avoid extending that unless there's a user for it

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

