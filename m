Return-Path: <linux-arm-msm+bounces-110118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDbwLGdAGGrIhwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:17:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EA5F2958
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DCDA30B05C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365963E638D;
	Thu, 28 May 2026 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHQkpna+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCuY4wCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FD3F210C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974148; cv=none; b=Jz4BQK775H/MF7vXrsNZ9KhwSZ3KFyKOXxqGWH1CzfSewaBEiB6dOYZHYvcmNu1/e5oMsMtqjZkAzAC3De0CwDrZKrPOlKaDESsT13v5TwSyJIWGJ+AXwMor3oa3kfMl8MJxHkJtIcTAPVlLX57o4b+LjusEl54mWKHjDtbaHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974148; c=relaxed/simple;
	bh=Vo1i6u78HdYqI978QgAqscnNoozWLbIOBnxfjDfKqp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+gOoe6GZFCaQXoaK6FEXKGd+LsTQ3OrQp0KniXQdAIjc90/Bn0gBr1gO5RSiDqRfeJYAekl36owFgy0Pxa39GUo7xtxJKBug5406N1RrbUhvWWlKcL/jkcu919fG9D2/U+x2n4mEmkSNus+H+gJjJyrNCqSFo+nGOGgg8teXbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHQkpna+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCuY4wCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vqwV124476
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=; b=MHQkpna+qodOr+Mp
	tyquD5PKaWGON31cG/1uUqINKyXCUiFUDRLF7+fBHdqwU1YETR5WnDmilF66iUh7
	u45JlvuNhY57I9T/gVmlZucDnazikH8A88Zi3i82HZEnfXpg2Ak71JdxFbdA1ugt
	oz1PspDIACg8PY8Fj1OXoXRIeQz6RGMOMfGJ1kmdVs2e5LLpmLhNpzqqPkwR0Lfb
	+PCWtU8uCFYDLbisOvU/hQtrioLpU3l0sHkJ5wJgLeocW3eSb+kN+iIx8UXwqCge
	H+WcFz2iDE+pNOZdBMeoCGyyV4bBnXC91mYvo/p7OEzRMRu+HIbrkGpVgpmQE6Hl
	oogW1w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ycau2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:15:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304cb3508e1so3791603eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974144; x=1780578944; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=;
        b=gCuY4wCNw9RcjGJHkolD2V/MFr1QMGQSx4un8FVb1CJDnpQjKa7tZ4T9NPyAQgel75
         6MJZ+eDB/u/lLA/HF2qekoFfEn7ZZABxqRNxsrSI7zX/JnI0qCsJZ9mh6N0OCoZd4BLy
         59PwjCHQo0gBzo3yZJEZ4ylPI5ApBL9JlRkncm3CgY8d4duVgOy6u2O1licEopAEL/vX
         OQHejvnX4mTrTLWmjyAn4BgeoiAk4Mrayn2YlKHWZHsJtJURLuXJ7R+4/n+Vnf6LVdJ+
         dlEStY2tsMKgL6nvkIoZwm4h22hbcq2CiMUxIGRZkDkEmT75X/H4YHGm55BlMDfFpZsI
         J6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974144; x=1780578944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=;
        b=fz95mY3dTUeXrxJ5Ng/nhotC0ISOS/hNobMXx+GJJZsBWzeCk28Vd1SI+93QhSKFP8
         ZonWKqEchf4wRtDnQLzTV8jTuFqVu+1eLAEuaHhPvuuavnEf8veaHbkFaEPYNv7AcZa4
         sSMppAi9hwKpdnzAO+UA4igA3WICFjRpDkOtanFs50ha+YLHYbLW7tgInxRzSj0HhRSk
         WU8mJDu0n+mFkkVSs2ihBsnJiYC3Ve1qhSYOoHFaghBeLfNPCLB/HWyA/9+DMgVU8HDw
         W6UkEzPGMxe3dJXs3QOnzGQrMaWGIiGIFH7gIYE726D5QzfXdd5seOluVW4tN/8bGH/E
         mKpg==
X-Forwarded-Encrypted: i=1; AFNElJ+MYS9QVD8+k7raRYKgukX60JS0lZGSsqISMBbdb+LT7MyiMtFicxT+EN+KDlDPO0sLaTZOKwVyWIpsQ7Nl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5S5L7zQqYkV+WSrNTX7D4pal428zsvGglgB+D25TGZOzzGAMg
	DsAjBvEnifYtUI9KyiblqU/sXUFcXVCCuPyWxJsPXTjoAOLhIBqfJC+frtxYEl871IpIeJFM4Me
	EIo2diHZOHqhUAunZQf0dhs6RktwtuotUW+LZxj2IxuOhQEhQ0+DzfiJgMApss35/dtw8
X-Gm-Gg: Acq92OHtdjyxUnRcVGqDs7i2J8aX4RiXJXFtQcl+YbOcqFZrpjogdHprrW1sLmnC971
	ETByTFsYCSJhH6m+LOxDJupCfXEoCv1gw+CX1WMaB/LgYhZkNlwRQ58M3wLIbMakFk6TdW2gDVl
	06xarx09aFEQ+3G991KWYeIv6rYxA6Pn3k/8fBQyvZ9dOVSlTs7ZpEs1wHGV42IFNx56XONvnhX
	2gUWTHHC+VLFstk8OJ0YKTugMMMzoOhDmIzajLi/KWx225Wyc3Z92VmrEW21YO0e7YOL4ncSlGJ
	CYDlLKBdOeWu8bwluaUrKLP3JKjJLVZdITnNe5CTcneMf5D9RvAgb0XwOTzl1u3JYDo0fXUIujF
	PNyjvu1oXzg7ptpStcLw4sfVNATEYmuHIjfOO4PBRRPwZ6gkMB5qDWm/TpuSjZUcP/kvVTVTwmO
	+hLmw=
X-Received: by 2002:a05:693c:8848:b0:304:59cc:aee8 with SMTP id 5a478bee46e88-30459ccb57emr7594267eec.18.1779974144403;
        Thu, 28 May 2026 06:15:44 -0700 (PDT)
X-Received: by 2002:a05:693c:8848:b0:304:59cc:aee8 with SMTP id 5a478bee46e88-30459ccb57emr7594241eec.18.1779974143736;
        Thu, 28 May 2026 06:15:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245fbeesm15786645eec.30.2026.05.28.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:15:43 -0700 (PDT)
Date: Thu, 28 May 2026 06:15:41 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <ahg//RDP2dtleqBv@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
X-Authority-Analysis: v=2.4 cv=VOntWdPX c=1 sm=1 tr=0 ts=6a184001 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HkNMFyVr_tcJnp_woqUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Kj5nX48id8T2v3qOO4IEtlzt0nzDSQKe
X-Proofpoint-ORIG-GUID: Kj5nX48id8T2v3qOO4IEtlzt0nzDSQKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNCBTYWx0ZWRfX40X8VttTFI2J
 ifxgj8gegatOnmv/K4PACnRmsW2+2xqUJM4uQsCGm2f7ZHgLPHcXY3kGaLoqEBUWWv11CQxsfMb
 xClpl0jGUTB/D5fDTwaLRsbyQzA4GXNWX/XCG+uSoCFfHnymgD8W/qQ2IzjoZ+rz4Wa8FXcmfPc
 tQGXSPvZYTpLlwzOoQgqppQ1sUeQ9A8taSTrDpp+X2Kz2EHRLsbxRbENFN0ExLi7jiJJJnihKU+
 4wMkh+MpsOZLmrij/jVoSoJ5ZxlS6HLOSLwEiJ6LqOPoifDnp+DBA2yMyPbJgRunIfHf9wCdshs
 cV7PwcGRLN5xmRXOWxU8gf/Zk13tztXKep1R3N/0wjXiBX5l48u4it2sadydChH8Sg2NSDJ1FI2
 wAtWXKeTp3FQXZldOenXc247rqND1e5K12Mb7BJ49B2bYHGUFUyTkrp5HsTG3Gb9+/jfrfyrROt
 GSvyKt8bsLBRPSJOyAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 602EA5F2958
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > under a single DT node, each requiring its own pipe clock registration and
> > > DT resource mapping. The current helpers are tightly coupled to a single
> > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > 
> > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > with pipe clock names parameterised per instance.
> > > 
> > > This is a preparatory step before adding multi-PHY support. No functional
> > > change for existing platforms.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > 
> > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > end up having too many single-platform, single-device specifics which
> > don't apply to other platforms.
> > 
> 
> I don't think that's really needed. This shared PHY concept is going to be
> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> driver and may only end up keeping very minimal code in
> 'phy-qcom-qmp-pcie-glymur'.
> 
> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> move the SoC specific 'cfg' structs into a separate file as that's what
> occupying majority of the space.
>
Can I move the SoC specific 'cfg' structs out of phy-qcom-qmp-pcie.c in
next version?

- Qiang Yu
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

