Return-Path: <linux-arm-msm+bounces-108194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPUgKmIFC2rd/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFB56C9B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BBDC300AC9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B183740586E;
	Mon, 18 May 2026 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crmwrb3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRlgtfJJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69464405867
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107157; cv=none; b=ALcZrKjgVgxvFTnImPQjfF2VK8clBhSMNN21sPqz+/hziYsHthjXWVDvBG3hLigOuNkx4Ut0YLDPFJmHIp7zHPBzdTOiFRNfU8aivbb+ZvFFRb5N6q9Pjrl6+/HFUifDO4gu/5cSjwTVIeYMGZ+3DNL2LErZeiAgIk5Nr3Herw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107157; c=relaxed/simple;
	bh=/I/Lh9kABNEkYq/fKWm+AznCg9UkQBLj7n6ZS1EybHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmuSUuSSOf3Q6Uj9jHmgBZpWaQoVBvHSj7NNweQ7JKjdHyhO4OzZPLRnT2GmzUSxqmRIAEvxNkChx1hU7T1gp5eKo5YyrId9QZgrVNECcADL5D6Xx9OFhQOblYu2cwpculrawsIxNucuqFj/OA9cLvt0wvBqBRS9cpg9dRIZu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crmwrb3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRlgtfJJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBwHg21251662
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZeGp5Bki4jeCnZ73ibXYmI/
	3gyap43fyhUtc6hPfvo=; b=crmwrb3JNam+zeq71i9jx5/Ex+pX7ay7/ThZERzT
	xsCRsBxZCQsflm87UUNIx/4MVVOwO9H2SW8z/XzHHmZRMJ7YoaDSfLJT1XJ+G4no
	2g247RLmqg9Ns/lJt/WTrzqbbTH/foFECuS+dMEUbmU8c6colGhm6oZ5qWJBGC2/
	OVc+CooArRsBpDrCrVvU3+6hxBpdYxZyePctCbbJy9fTI0fET72yD/oZoLrKlbRn
	+jk18jWPyZj0Wja14Kis5PJhapHKthbHbGzj6Z4LizXKDtM7+d0lflDu3iLMqcwn
	W34Hyqfw0/k75EhMCYdi5Kb5Dv4V49pY1igrExAdJ0kQPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0g3jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:25:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso47033211cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779107146; x=1779711946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZeGp5Bki4jeCnZ73ibXYmI/3gyap43fyhUtc6hPfvo=;
        b=BRlgtfJJHiEwSJegg/Pr2TMNtfQUmr68Jf4JvqUoK8MCzpYdec+0ehGiU7507hQRIB
         vZVF+mjloX81pODigJJ3LBExdxXtK9H+v+7/R/OZnU798vtt8d95DQN3s289UUiCcc6V
         44dJJRQ8DydyGgr8kgtJgl2cow0ZE9mLJjb8hjMtwFa2yQQSVWOTbEWjmsFCq5FUyMH9
         Ou6Am+MC5NyMZFUsirEjyGS0g8u3zohpgwv3fEWYfrl/po1SuHLgogA0iZxzgTqpSfJ3
         DM/ciFgGI4gKhYEoeMnuBlQw6AVqMMO7iUAYvV3/ElJ3Is7gsiMB4OpuHCfVo++fCbse
         uPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107146; x=1779711946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZeGp5Bki4jeCnZ73ibXYmI/3gyap43fyhUtc6hPfvo=;
        b=tX24yPYf0EMbBwoGm+Tl0ddAigsH1uxL0VtjgBI7jP79yJ9J6qtJ6QvWW1+WegHRnX
         2KD6Q16XC5LtKiVPktGxYyEL2gL1lhySEG8WSoHWAlIrukwGe7AGVLC5ErUVo0wskq5A
         EzhLppG0lou5LC3eRp9eHxj9K9mxAxWARLUABwDbXZWULZRNc4VQtx4tVG72TCqD1DWb
         hRr94yd4E7Swy8xet1cvKYu/K4RiknMr3owCMjlYBXFWMvRERZs5bh1cUDI0008Uy6WY
         PHlv9GrYVU8k4Mr8nce+e0UXCfjy/4oFupYLILlPL6QWYLhGk0gdC+22e8H06xUjITmk
         d+9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9A864Gqq7sAhJdSXoJ39pKG9hDQwk+yD/ZrVPGWSjNwrYZHKIOd8XcndMhj7DXxHFTOiy6h3tbKsDCTtLl@vger.kernel.org
X-Gm-Message-State: AOJu0YysYZhlbo1AU7fKWC3GC1Jk5kVB3BfyWdI0dvcXoK2Mzsq9cGcg
	Bn7MemgiSNKxQbe2xGUOHy5UUONgDAvpYTUeVDpmiMMawumS4CnjZGk/JkowF+RX1zV0ZWHDhxh
	6NAS+QkaBSVnycQ2JKFONE0+sypLFmOoBBpKsn+8vcN1qovWRjfQYofr/+eHUeCKNhBar
X-Gm-Gg: Acq92OEN9RpsgT2PN42i48EZ+BsGONrZiScJPmGDCmmfNfV7G9wCrOjeLtpxqyMJGci
	gq8XeLvCHXL8MSVn1wKHhvvEBLGwMRl2JUBROT3G4aDCfVOkxtS7QpiEkEXc0TXGwSBPpoTu8hF
	BADP69MWCfIwMubLiHt5xmh+Gq5ycos20wvohYywK+bGKwsWPhXHpuQ5TZaGlypSPQoqCSRnXty
	z5Nm/ZkX26wRvZAjxvSD+Ut984AIX3lFHuBQQiyy+ckBKgey8RYqB2vsXmqol9Aho1jaEcZi4YB
	wpfiJNXi4jF/DfpHLvkfTbAdQtWI1F63jmmDEZVMerEeIEwNT1HnLFbIXXoaPaPZrDwF5IPqcc0
	Na0dp+UDNuRmuo2fBaIOspYR0dkRb8nODu0ScdtSfjrYfSY7QWbDJjn0AenFzBvUrt/HY9zCEiw
	+q5D5HqrVs34Fpu5UwOaTuoRVR3bRkAdYbVpw=
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr229736031cf.40.1779107146225;
        Mon, 18 May 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr229735671cf.40.1779107145732;
        Mon, 18 May 2026 05:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b408bsm11481771fa.35.2026.05.18.05.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:25:44 -0700 (PDT)
Date: Mon, 18 May 2026 15:25:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
Message-ID: <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyMCBTYWx0ZWRfXxco3+l8VlW70
 cnzb/FwvWCzHcUqguPFfrOLE2Xh+GtC/7UqqkGm1HbefFpQVZN7f72pNGiAfEmopi8C7jO8vxc3
 8EffJh8dGZ6v9+7+8b4rWHAnVEZ5p03VfDMsCpg0dp6nDNHLcjI/ftv2yRbvEB+ANN0ecWzrPve
 pty916Z6nszQbk74FC+wyuo2n2bE1dg+Ujj6sFh6hMbhh/M7Y9m+jdrXl166eH1vt0hQWatCC05
 188RvtqqhUrHMLtWVZMWZeb9GJkMFQA5IyEISGtiVKnLPkO7vDJEzELzdWhhle+tvjAC0zKaRpG
 7YU8BcqY08+oI3KYrYihwXViM1NnaJxOVSxosNU/CMzdHMqw2Iopnv+RaeeVUygXyDmzv3JsZMz
 M0xcynUYWVAT0vvgHYceuPRSFiYg67MSihbCUUFL6DIClEGUhYNvfmsAg3wQ0P0GHNMO+ju4MC8
 oLS+9CbMPububeWyYaQ==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b054b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fNMWtLC6zdMFL8tt74cA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gUz30sx6ow7Hu3YWR4fKsi_oBTZePF1s
X-Proofpoint-ORIG-GUID: gUz30sx6ow7Hu3YWR4fKsi_oBTZePF1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180120
X-Rspamd-Queue-Id: 48AFB56C9B0
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-108194-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> configuration. Define a new phy_mode for them.
> 
> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> distinct, most visibly in the electrical/analog aspects (slightly
> different frequencies, timings, etc.). This results in a need to make
> the PHY aware of the actual mode needed (at least in the Qualcomm
> implementation, but I believe that'll be a general need).
> 
> Newer versions of TBT are basically supersets of USB4 with higher
> host-side requirements, so these are not defined. This can always be
> changed as necessary.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
>  include/linux/phy/phy.h     |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
> new file mode 100644
> index 000000000000..5f48059814e1
> --- /dev/null
> +++ b/include/linux/phy/phy-tbt.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __PHY_TBT_H_
> +#define __PHY_TBT_H_
> +
> +enum tbt_phy_submode {
> +	PHY_SUBMODE_TBT3,
> +	PHY_SUBMODE_USB4,

Do we need TBT2 as a separate submode?

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +};

-- 
With best wishes
Dmitry

