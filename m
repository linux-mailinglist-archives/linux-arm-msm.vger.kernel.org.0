Return-Path: <linux-arm-msm+bounces-108835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ANuHDjuDWpu4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:24:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57765938D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80CCC312D8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C7E366567;
	Wed, 20 May 2026 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd+6S3P6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9SjFSbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E6367B8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294308; cv=none; b=h0hP/fUNxgimymAvDBsZQLGf0DeWGe9WPDdBhi5NJeVvigH0S/GL8N0QWJQ2HqUimqAZAwAkMKqb4dqA7kB8uDTF8SqXycK7JJBDbQJf9AUWyoUvaO7mtCn50an/O1o+8+gYoAY2uHwWjseoAj5FyO2yTjWRgVru+oVQgcOZXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294308; c=relaxed/simple;
	bh=CVfGvTButC9Xiy2MykpKcvZx8KtJVMgg/X1XnxS23UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+7dNEdP2rkdtYwEKms7KhFEwyoEmTLMXgPMeMy74NqtPSwAdeahoXnnOwSGvZ3O9NHqfZkca7eFjCiHHagEgIOysuXhsNJ0HaFTf2mRZTn9/dqOL7Rq3Y+cVA1nbaDHpn6N/dj3/d+ytnehZ5krE5srU+ZYW7k0LGZA28+d7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd+6S3P6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9SjFSbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFVcIY4115192
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xz0sUxJ3nHFrIUac9Z0r1axi
	lM92v/+rr+m+cn2RqQM=; b=Kd+6S3P6Id4kRCRjyBWKjDxXK4/fl/gAqjpDGMgu
	kThkDREySxttwciAZ7gbrl9xWlBWVehbd5MdA7n7DTN4diZka2lxIkZqWjK3JuZE
	IfO7ZFgnIEHQja57LFK8EEMWYlDk8k/YdGYhTI4azO4+BS3aSjzHu1y3Z5IwE9Rt
	uaGV417TQpIuM+4MKjo021IjPtyUaHSGD1kOfsSFiwkZwiamZyck0IIwTlZ2MRBj
	eeNzt+8C/itRFnksQsXGgvptSXySA92mj03JgsgtVJoNwwNI7jGWYT3OAurOA6QR
	IVFGddLFW9WS5cHElsfkuAHO1Q3tmtRbF3cys58NjX8+iA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hr83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575b418ccdaso2171809e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294305; x=1779899105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz0sUxJ3nHFrIUac9Z0r1axilM92v/+rr+m+cn2RqQM=;
        b=W9SjFSbkk03c9HUTai7UTDtAtHFmKbKNyrNqm6SbjwkYknsn9yhyADm9E3hmkaacQt
         yFSMyqteBlo9Go6Q/2SxrZokILjp9OI/EdsZ88iH8FALY0abS3qcuArIKr9szzy23B5y
         FZOZ6d2J/1Aq1lEKcO+fZ7SWOc2pf6TlSILcRVGnfbRtMJ8oVeyqVGo+5hCHtVbaLVRb
         Kp2oaBNzvQV68C+DruIRYYCIOFJGK+0ZAhCiMTZ2LeiVvZD2AeqdI57mhEuGuTN5/pVs
         csbEqknjDr3ljPzF17Br+/ORaTbZADlIAiAezbxG6ROIxPYrtFlM5cAgnPITnIx1BRqN
         gAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294305; x=1779899105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz0sUxJ3nHFrIUac9Z0r1axilM92v/+rr+m+cn2RqQM=;
        b=D65O212+n4a6DcCqPoV5hFwQZjHSdueRd+EnwKG1GAiIhZbUHdBiyp3pplOQhUMP4h
         hXgAFOOkuJ1ojZZRoZaDJFq1d+z8mEWfYbJwUXYFn7sVOkzq1iKc2q7SmkkOsgvbMjZ/
         ocJWDwvuaxA7fmfwCWhVSo89zhfnx1m3VE8Ir1+Jvri15seh+KHKPfrGq3S1NwqnZbkc
         vOv9koNdOMx1pKtb26hNT4imjIPY2j8LeKywpV9DQeA+Bagj9vJs0xfcXO4+128czsdd
         uk2RBP8W3lGNGp3mpcWaFtGA7Ta5qgvWHiyCrPon1BSENVUJkGOGTMRZEt1CJ8+PGBt6
         vz/w==
X-Forwarded-Encrypted: i=1; AFNElJ80Idr+63MMSDRKWjVr+YffsZwEncNyI8wRxUCLNPKLLGp9VvlQfTJsXKBrXnZSr17jYG3xTvTGqeT+8fdF@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4FohmZqb+MyfqObR/IPnxXM7jV6k3Hh34sroMczVbzqbU4bH
	7dKLS6za7u2SCCA4tifbBU8TdRkF4+H04/OQzEaX2xXe6Tr8UmvmNfs1FniQzcK1W4D9Zro5tH4
	oWB+IVYLfz8N26ZCVJj0YisiHj9QBLbZkRJOUJY3L6bMsQ0rBJIQbbE1+VWsbVdcXbURx
X-Gm-Gg: Acq92OH1pxk1bm4XHd/L23PiqqkIBNyGmaJxTnUAB9HgCw4hx5vm3hnrtANu0OHdADA
	KnBwMsMvPUgYxyGC9x0Nho/x5xSK8I+xTXowo/bvovMHsdVqD6za3AJKe+XCSIh/U2rYY/5/rtR
	MNqBFRGniA3XUZl51tng+7A9s++RsgtOY/FyWjDxQwLgLnPH4Pz4Ankhi3XpqRh7m5XEH6j3EKK
	dKbNARFwbNQPC9bcgdV7E8KntI6tsk0QXk6C+XZFsj3gIC6cXNfA8eVPi8wftWS2jrRC1ROoCBA
	idLrrMusWZkCF1E0V3rOKSiBL6HbzYXYmNYSXYzvdzmHXVD25Vgs5AkJPBkmjnN6Asa8hIdTpks
	pQE/C+yF2PMfHRkBhSxHjR2B31AP0YyP5fupWuJcaXmusZDc9w1LI9+d6PMlMvRF/2rXYuXn2Us
	+ZsfjcPQ/X2ZI1opLrMXUy2eEu+8Ezjdy0kPM=
X-Received: by 2002:a05:6122:6b89:10b0:583:5e28:17b1 with SMTP id 71dfb90a1353d-5835e281e1amr513021e0c.12.1779294305194;
        Wed, 20 May 2026 09:25:05 -0700 (PDT)
X-Received: by 2002:a05:6122:6b89:10b0:583:5e28:17b1 with SMTP id 71dfb90a1353d-5835e281e1amr512980e0c.12.1779294304646;
        Wed, 20 May 2026 09:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7c2sm4988382e87.32.2026.05.20.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:03 -0700 (PDT)
Date: Wed, 20 May 2026 19:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
Message-ID: <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5TKkS1Yd8Knx_o8P_aWZzwZoC0VPDBnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX/SPT/8VHNB8G
 RaHOTOWfVlWuLZ8PRLDtILBp0P3aQZVdxmTaEGcIxM4rzaLC5/MY8x5W0XlEkP5IZVfobbf/AWU
 1LJZRVdj9myGlNdqdVpTHTmxoB7Wm9qkBF4sBHp0t87C88I8Fd8Eus14PsGhITjssdwULE7tHB+
 j3aKg/YOkWU0hxxZy76XT8dG8pGFg8mTLNVEjMDOJKUemnx7w5AKRu/R8CPFZhbt6PN/sSULgva
 MngL0T4J3GzbbXWt5cWJT7h6RilISqfTcW+kgsFSZKUZwBVGYLghbPk2uihR48XRb9vtg5KB+Se
 q83HaCzCPzmz2noDKTR25xq3PlP0bBjhxKCtHsAQ/3uZ3aovdb3xw5yeDIhkq81aq7EPDUP5JVb
 qCpRE7G6KPwotDLESKfgL7r/TewGmlbL85JMVN6q8IJu+L+oO5Tqk1l+pJpuqgcwYgHKVGNAYzB
 7zYrdQjB6hWjuEGLGFQ==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0de061 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1wzcjCcx2gfPYyxUMXwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 5TKkS1Yd8Knx_o8P_aWZzwZoC0VPDBnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D57765938D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> under a single DT node, each requiring its own pipe clock registration and
> DT resource mapping. The current helpers are tightly coupled to a single
> qmp_pcie instance, which prevents reuse across sub-PHY instances.
> 
> Refactor __phy_pipe_clk_register() as a generic helper and reduce
> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> mapping and pipe-clock setup that will be shared between sub-PHY instances,
> with pipe clock names parameterised per instance.
> 
> This is a preparatory step before adding multi-PHY support. No functional
> change for existing platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 32 deletions(-)

I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
end up having too many single-platform, single-device specifics which
don't apply to other platforms.

-- 
With best wishes
Dmitry

