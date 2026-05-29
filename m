Return-Path: <linux-arm-msm+bounces-110219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM8JITk7GWpVtAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:07:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E45FE52F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F31883033A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4C03A4F26;
	Fri, 29 May 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eue5Lsf9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZZl6VkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CE38910D
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038134; cv=none; b=ciUOxoImkipuESioHFPvWGumZYiDiN80ILZRtImegxkywobm9SgO+T3siv2/xFRUOazU0KyWRqdD3gORAoaGfabUWuH6RcMCtO8Ii124nrOb1sU0jZI0u3CldeqejxLz94rkobWC2uYHJFt/cxKlck6qCCsGXvHKQIGnURaxxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038134; c=relaxed/simple;
	bh=4pD45lRvztNJmvYS/zIvzADo5zNT7W/KdbjrpZhEzqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNE21sKQVMr8umnkF1fnS9Y+ezUNcKAXZ3PajQomSJEkfunFL4lhUVYmHLHvLGkYzmvXVthvwLus5IXCjKb8VT0gaxGw/BFjwvFJVUQJYXlxmCtEmeqLcqejYjWqSTSx/BPDuaBa6rn6PeZ+b2uj/GnR7F6xSR3wNTgfCgns3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eue5Lsf9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZZl6VkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6NdBP1540487
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=; b=eue5Lsf943Kr+vx0
	EthGTDnomIOolQ2u5G8a8unVbV8Uzv3HgUHCESGi7u9PbxWiFUf6FLdlL2+IABYj
	ar/OkKYhH6yJvSdOEPldV4RghZf7R54g5tmWPH15NANGuU5PkHTOAKcRUlRXn7jn
	SBY5zNef8DkuDFt0E3aia7s05Ed7AGU4tueo+qQgvUVxREvAZ5kxSLzB0IpJy8pQ
	AZXQy+2VyGZDMzH16FD0CZAfLdhl4C9FXPPEZOO/glrWUajaUMX8gdn4Bhhp2Jyb
	SMXWRbQldk5Q1ean76gP1r7AFNkNRuf6tgZSAUbjjYH1+i+qSOsLbwbEKUVbKNTK
	LvPy6w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4trux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:02:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304dd917645so1216426eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780038131; x=1780642931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=;
        b=AZZl6VkHeJ6Mcw8AzkBqYzpwHKckcdmr+WLF4k8uLxzjHJpK6+FzlbW+KO+r1u62x6
         2md6KD6yBGnnSapA5fF1P8GRDQ4OFr6KhTTfkvwtr8ZjNXj1oETgZ+LXxNqOFtxMKmSc
         IsYIUOkKp2ldwM08K55gv8jLlPiYBA03Aq2Dddu7Zu4TSXCV7xXextBRdp8aj+DAvut5
         0tyb2ZAt5rf0zoVC85PHc6pU01oLM2ecUBCNyLdrY3hYQIJVerm1WN3d95Ro6z5N8hRD
         hWgFwSKttcUITVldJMBGeVxObMNZNJWv+PGDe7YUThTGx/TCitVfGP1nT7mz1eFreuIH
         v9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038131; x=1780642931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=;
        b=VE4UnFggCb5y6itsSD3PibYUMlpjH/t35qPkUdaLj+rn1EKtm/2GRKa4GV6WTuISiU
         9aMgTTzYL+ORpf2H7tN+fbKlN/Xv3PKpIPFl9N+6sDI1IyrT7RmFncKH/7zJ6kUz2VbU
         P7QT/H78xnQiMNot6Bwz3g+KwjGtwSJW4yaok8mCU1/gxbs1RunWIDE8L+Tz5YST2fFm
         4Yf90Lol9dHCrYktPvWLT+W1reFSo0GgLqrFNtBexUNFcQOjy0zcGTV4XWjEpfwnyoHx
         4jB1p/5RyvDVaRk+0Zk3ffceuwbB4MCbQiUuFhfcY9Ku9MBF9XGKpbD4STa2U19/qOWR
         RznA==
X-Forwarded-Encrypted: i=1; AFNElJ/ujLQcLtVG3xGxk9fekEAEa+MSzCfoHpf/2oiApSXzfHAdQq2CLJJqdwbeR+AXSUq+Zt5EjWUus+luUJZb@vger.kernel.org
X-Gm-Message-State: AOJu0YyJw4/gMPp6FetzegrG2qY4F9MdNW46vOpBcPrAq1TOCfZfH07v
	br3RXGsQVQ2qDQiE9bTpLu9wu6mTI0+X7azAghwiZp2CNqPCeqB/kRpED4nEsGae1sWb/hbIx1P
	BBPlTXTsD91Zdo5ZSVJ9dxw7V99gt0J6TJYlBD/5bGyCTozgmryIpnllvslQwk9popSBT
X-Gm-Gg: Acq92OGQmJdoSm0ZNJrnoTQ67en5Sb+bTgkCsD6OJLCV1DcayHX6KT+lyj6fQ5DPfW/
	8hpzRQwLnavB6X1dcE2qHH+YtXGBBGEvl0ISrVxaLvC5QZJsobj8wehYpjXiErNkDM0cvj8PVwa
	jD9m1yRXzBCrTEr7En7wKWdhVscMLPzO/ZIatRQvc0A71Z0WauiAQpoOEKfGF/hhqz/PRO2hKlZ
	HVYAwOywrDNNmsQihgafvczy8cRYQRFyy9ZPQa/aliiITsecONyedY/9HKfyWIRzrVLXGN1I4mI
	P13Nzb9+2w2UpT5r0jBMP6daGneCq9aNleVXfCyOhO7EF7d0qWRHcBiS4GZPhPHNJvH+2N2yLQn
	8EfLfENJyr7wANJc47F0r7Hb1xQbSqv1aR9Orezo1d5Yy1a+VENYu6NUa+OHk4CAIoKGOOqM7lY
	B23J8=
X-Received: by 2002:a05:7300:6c28:b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-304eb0d7e2fmr776892eec.18.1780038130813;
        Fri, 29 May 2026 00:02:10 -0700 (PDT)
X-Received: by 2002:a05:7300:6c28:b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-304eb0d7e2fmr776872eec.18.1780038130188;
        Fri, 29 May 2026 00:02:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm746216eec.13.2026.05.29.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:02:08 -0700 (PDT)
Date: Fri, 29 May 2026 00:02:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
X-Proofpoint-ORIG-GUID: G2IEU5MmEN56Q19-ovvj6DFKEwLDKgzc
X-Proofpoint-GUID: G2IEU5MmEN56Q19-ovvj6DFKEwLDKgzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2NiBTYWx0ZWRfX/lsQyJLGCdxt
 qCh1axceeR1BvpIl9OYvbDTwCQ+HnoqesP4RhRW59jjf4itv89By03sL/rptH7+kU6yW4nWtVyL
 b1TkL9lxe2JezR43UhbfsrJ9GrJVaIGB9bckzKa8BJOEGF9/5ZwuXNxrekNkQFKC9InD7xIvfq1
 Ln/se9caJkexrDG3Qqd9i5X7BzZkA3k+Ky+fhG0R6aKL0wEqBTEfe8IWpOmguKAk92Sbg8kNQzj
 FBq7Md7F/poZOVwITRLlRu1D46BsjWOD32b5rB6J+OMuQhnzn9BlN7tKScaOpbNUrorSksDyZLR
 FDBO0SB+50XlynvDLsZSYwSsLFypE9ocRxzIs4D8eyzFEzqGJDVGq7PQY8AfuxDVR2Pnlw2/u/g
 BxC4jmq1R74x95+t9U5zgswDlRDx+hB+D/m9lmfGzqdCGrPEPKsMLoISFQfk+UuAsJuJv5B8SEY
 o3ccgTEJa0tKVgKqEKQ==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a1939f3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=CphI2k7nj8PUyFDNSj8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110219-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,infradead.org:url,infradead.org:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 287E45FE52F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > > under a single DT node, each requiring its own pipe clock registration and
> > > > DT resource mapping. The current helpers are tightly coupled to a single
> > > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > > 
> > > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > > with pipe clock names parameterised per instance.
> > > > 
> > > > This is a preparatory step before adding multi-PHY support. No functional
> > > > change for existing platforms.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > > 
> > > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > > end up having too many single-platform, single-device specifics which
> > > don't apply to other platforms.
> > > 
> > 
> > I don't think that's really needed. This shared PHY concept is going to be
> > applicable to upcoming SoCs as well. And moreover, the split won't be clean
> > either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> > driver and may only end up keeping very minimal code in
> > 'phy-qcom-qmp-pcie-glymur'.
> 
> Then splitting makes even more sense. Let's not clutter the existing
> driver with too many conditions and options.
> 
> > 
> > If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> > move the SoC specific 'cfg' structs into a separate file as that's what
> > occupying majority of the space.
> 
> No, it's really the 'shared' part.
>

To confirm, are you okay with some code duplication between the new
Glymur-specific driver and phy-qcom-qmp-pcie driver.

- Qiang Yu
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry

