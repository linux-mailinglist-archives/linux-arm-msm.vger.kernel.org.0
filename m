Return-Path: <linux-arm-msm+bounces-113105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GwGnJrKsL2qdEQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:41:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF38684481
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZKvcTkAT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GyxMkTub;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 988123038530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1C23BF696;
	Mon, 15 Jun 2026 07:39:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893A3BED5F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:39:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509177; cv=none; b=J1+R9y2kEw1nI8vYlzy4rD7CBQCOcuKH3ECSTosltP18797kynaywu2hETbJ5F9h4sw/s1u8JW/R8K9l/VQc6a/7IyH7tjMT88GpKgte400/wp/H1U4eBNZ156ZG6tiFm5Wr+jCDE48w/7b8w+WRYJJ4HBSXdSeAuGYheSerxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509177; c=relaxed/simple;
	bh=bUTD83Pf7C+H3yrldiYUl4te8DBkzpoeq4nNJbvHMsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjyaXcUYyzbs/eJrTOU2tbUrVkRfDTlXWQwcGKaLCN1eoCbykQmD+0yjHzbMp4jwtz1w7h7Eu2cKQE0A91Lze5Xkxg8Mr1gASF+TPG4tLGFYpjEmkHWaFJg0gLqopA7Uo3PwY5iEXVBeHHC+TmGiV8XlnERj2CVaFCiB7/+94Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKvcTkAT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyxMkTub; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IsDF3346509
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZp2CdAOzWMP9vNOOQFjfC/K
	5baWaymmSjQGLpC8WcY=; b=ZKvcTkAT4GvL5Yp5yQ68MYwSnHMLSIV4+ZgzzPw/
	kV6yJSNcbvOabzoUO2gowjOWsFamE/su+n08PAKzUBBSK8ev/KORO4upnF6IuO5V
	v7nfFBe+cYK6eGEwIh0nr6E2u1XPPFPy70l141hewHPUAhmh+SrY1nJM84FRJt9e
	qgDDJmqOfDCLBoJajA9LpMW7Cr3py5PDmAX2jqHotZ+OEfQXrGE0J/uuVCTEi54X
	kyYDRYQsxByTd2VF0NGkeL2/qmxex9Ey1mbkhm4/WkSR+kUZiAZSsR3evr1RJ8Am
	VaF0Pk+hwuGoykPBS/pi8AwGXlyPQz2s9LhXjvSzXUYn4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g867sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:39:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2977189a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781509173; x=1782113973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZp2CdAOzWMP9vNOOQFjfC/K5baWaymmSjQGLpC8WcY=;
        b=GyxMkTubtGcwPtiinlMuCSgPDC9cCf7z/JjVtLgv6rwvldwa62VwYR0EHbBp5vTRmM
         Nn0tGj0d3Jo0XZT0c0Ptm1AwCc8xYXXAA1rh2W3G0p8C1C05FLd/8Kwzjt4SbQboO/3+
         grHtVflgRBEubeqwHI3sji/gZX4QXBVq+GT4pPnA6wiF/hBHgy0bd3VYe9rDUVrlrtVo
         L6prHE4FY0CCzB4QgUYayx/skB8Eqf/iFqFiAfeqgsnSdX5qxXDXhR42YpeSN16u1q8z
         ZepvFyi2Eg/O+SybmUGQBViUwwUtk4y8aX0qOOIY8VTxZ4kdLSTFL8sP5nftZnrkWS5B
         SgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509173; x=1782113973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZp2CdAOzWMP9vNOOQFjfC/K5baWaymmSjQGLpC8WcY=;
        b=lkX9BIGGKgWO7h2+VsUKe6xxjsAN4XcFhm7n/1V+2hXTrM/3twko6bXKays4lqSrDr
         ACKG4E1KoriIExKsnY+q7vimrAAVB3957CZhql6tlkJC+hb6kDJMRC68M/8sZmJQ6yrg
         4kRASXutN/kiEjjVYm1bg19rQnaBbHuDOudAD7ONMHYGvaHuJiRwlK9jVip3ga5CQUps
         jz6n0aDfn5X+Zy2ezjljvmWxNJ22KQSLyPbhGq/Tg25D+KqiFN7M4+j1EZNfIxgtoBp3
         AKcmEhe+HCKHCyvcAiZFe0KA1/u3+M8XsV8Ajztb2mPn1g8lCBK/TPlq54Mdnhh8yjUP
         hLdA==
X-Forwarded-Encrypted: i=1; AFNElJ9bC5exzwJPuvEDW1KFymnrf7xBtki3J4m63MvuiPo3/8ld0huxURcVj4wip/xd3ZpQPtoWFmHSB3uScKDm@vger.kernel.org
X-Gm-Message-State: AOJu0YzjshKz18B/4rCbkUJSGZUpo51c07utLzIUZ2XXKamh/YgPLaU1
	2fzxQbq6u64AvOx5OCB97nseansZOI5NE4hsTnnw0VjlgblG+Tx/zZ5KpkkQ2merRBt7M8a/kXY
	+JLvaRwdRG43aNSsXnS4dJWKjkvud7mUrXiww3/WskFkQYU+lgOxJLms5qy16oYpEdh1D
X-Gm-Gg: Acq92OGu6KO/NmBZdVP6UkeNPmTfOBnzomshJ8/pQR2MXwdOeDYI2imeItyhGedz3TM
	2Yc0WT26/XYpscoa3ryQY03KHqjieKlqRE4FiBQQGlYoPsUGsukjkAGUKvY/vnISIUGjhUz+ctd
	99WM6r2FhILDkLpgFlMAe7glIVN7v7Cp+KSpAnkBhHYw0zt17FwerLEQ+L3UbHDX/xJoi5cf1i7
	+8jRqRZg3t7FYK8NnInHJm/WVn1h5vBIU70fVPFmHo6yeTesy9eQpu6XoB1lEJRHDTgvh/OdlAQ
	N+8Tl+fy+LPuGRIBlIAbN4urLwxvNpKWSvSuDWEU7mSNpyN4OZIZre+EYSRKk/0qWOmYpwnn9zE
	qRoN6rpD6juVQM8IyVudtCd207aFCo0JKQubYVX61O3QA3k1viU0i0GX6
X-Received: by 2002:a17:90b:3f43:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-37c2bd7e8d6mr10389174a91.25.1781509172679;
        Mon, 15 Jun 2026 00:39:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3f43:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-37c2bd7e8d6mr10389142a91.25.1781509172228;
        Mon, 15 Jun 2026 00:39:32 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd66fsm12016278a91.12.2026.06.15.00.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:39:31 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:09:24 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
Message-ID: <ai+sLLCjdWQt3NOC@hu-mchunara-hyd.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
 <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
 <gq54nr2bzvvqkocphvkji7g7rhbsrngsno7gvsfl4nsfvakj2a@wsfsnohrnscm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gq54nr2bzvvqkocphvkji7g7rhbsrngsno7gvsfl4nsfvakj2a@wsfsnohrnscm>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fac35 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wlKiXeHTwYhgOVykP0sA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: K9hEzQEoWsAOZmqDGtqd9rvkNV4y2V-6
X-Proofpoint-ORIG-GUID: K9hEzQEoWsAOZmqDGtqd9rvkNV4y2V-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfX85LQhaSadr81
 EULOXNUxWPj58WD9jQ0X+m87Bsuz3gQD8t3Yq3yqXKoe65AqYNrMHPPT5gHaqt4f3SPhEmueh1z
 jsnEFXDbIUOSnhBAft4zowMJrBOy5UJtvjNYmyr100emaFdj6WOI+76lI4Q0H28agL5g6pXIq4E
 X+f3pq/PGArD0hoQGVVX/fhmXvRtrIEDRmNItVk/zwWlGvNklPXJ4WQBqYNLWDzQJ8lgyaiRSpO
 QKGkEkolqsSVrKc4tUtozFY6m1EXuFL9BKFtuduxD01XX7a4mDf8yva7fxhPi6pgW8ystYouEyL
 ZgUWwDD8PKUhG8R2aJTJZw6ZlUSajZ7wZgvOHfRf2OwLj9fuf0QO0UodjL6ONJoysvOBtmQDbBP
 b/pygsaR5sDuY9JJ9N41J3/Y4UKMTTf6K99bWZkNfTGVs/6TDvh9UGP5hBpxvtmn4g8BpA3hxui
 XnL0dWPrVrImmI6t1KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfX2cW3nlmy5snY
 h4kSPMPPqNmUa79ZWEh8rx9RhVYHa8DMQ5p3Kb5HTFHO/0h0t/AMajHNc+NsGB3z0NRpNmpSi8H
 uLke6qaQfta+3MotGlfXuvAVTSdyT74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mchunara-hyd.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECF38684481

On Thu, Jun 04, 2026 at 04:49:59PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 05:50:44PM +0530, Monish Chunara wrote:
> > Add support for SD card on Shikra SoC and enable the required pinctrl
> > configurations.
> > 
> > Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> > 
> > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > +					 <&gcc GCC_SDCC2_APPS_CLK>,
> > +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 
> Misaligned

ACK

> 
> > +			clock-names = "iface", "core", "xo";
> 
> One perline

ACK

> 
> > +
> > +			qcom,dll-config = <0x0007442c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +
> > +			iommus = <&apps_smmu 0x0a0 0x0>;
> > +
> > +			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
> > +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> 
> Misaligned, make sure that ampersands are at the same column.
> 

ACK, thanks for pointing out.

> > +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG

Regards,
Monish


