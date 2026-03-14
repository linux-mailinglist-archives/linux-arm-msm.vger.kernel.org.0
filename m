Return-Path: <linux-arm-msm+bounces-97686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M8yFy0atWlZwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:19:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E1A28C165
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8863C3044B82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 08:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C1282F0A;
	Sat, 14 Mar 2026 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFea8JGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBAgLB6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891DF2D0C84
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476382; cv=none; b=Hkg43riLFCpRt3kQMh4KJTP36qJsLw7VET1WO/WOl0gwmqLtMSj5zZ3T7RqD+0eQDOi6mc+SKP2qmtSUB6FUNjLK8Uf7d7di4KvrpiWtc1LxBx988wkTDcO5qzc+bmDV3IWygUjMNJ+tHHl/XOCpXM4BIVhiBZp74eHunLPDwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476382; c=relaxed/simple;
	bh=CJvqtaECQrB9CIi7GPWfK1Guad9o5y6MdzMaGAY3FuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufv0VXMMgJzQlh3WvLvJPVuc/rqwMr4Md8qKl7gZ6YFCpKMCl/wKTgymlFIx6N4UQm/FhJgBXRPj8d/bJyL5pQbt8/Yqd4G8DipUvD5zRUH5voS7Jh40pxn+XXd9K2JaBI1fC1O0BDdghpodH3Omrn4rzlgbqL6TpvhO7Pgz5hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFea8JGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBAgLB6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5TpOW3540167
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ood9g82rWdas10daIe7S7f/M
	weIpuD50SK+gS1YGz/c=; b=gFea8JGDCstohksC/ChUFHdJwz1FdZ26nK+c4CiE
	35c62pOdah1j/Qh+gJeWN5XTcFbp5hx96cd1KcQUlD+My42MOFD5kcCwhK7Laf79
	g0N91Wbq1z9NzSb2QWw9oQPexi2aWRaRxqgOljRSnMAaqUq+yyJXXX0GBM8pIOLf
	eZG8xmNPXznjJ1o7W62aiY/k6/iQQr3tWtb6k3orE9J0MlJVG0diw+rsuf5WRbkr
	bp5p/GKNXiW0ZHA8Mr/+RS2cQI/jdq+ws2J11nsPA6IdmWsUUEtQAEGPqwCrHGWs
	QhL3noDFtnI3D8068cZGaCTQzoL/rh3futUKBZSOhU6lmQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0278cu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:19:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa9d879e7so24317989137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773476379; x=1774081179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ood9g82rWdas10daIe7S7f/MweIpuD50SK+gS1YGz/c=;
        b=jBAgLB6VUMKxbrgvJ9BsRM06Llc+CwiQOXzSZg6qZcsjDMX7PIMxXkKbxzpEw7XSzD
         YzCbit5f9hoRRb/HYS3kdtDDInPlIIvaVnVJFSlZ9BDDN7fv74YaXLxWFhKRDS8W37iA
         reOix+Ssa2Nnk7aQhxUXlg4M1txrDldH6Z9V4GqolbQvOCEsdk/kZzD0ODvLFCswwN1q
         xUXO+C34O26zZoqFoFJAkVR28h9vmFBBqse3jOYQsprKieCRmqZ7nfOmLtoAYIhFTSZG
         2y3g3f1PrXu3cnrmONXA97GOCrljpN4oajDtmWdWYzi0srX8ZC5QzLNXH8/d31/vcVYa
         3UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476379; x=1774081179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ood9g82rWdas10daIe7S7f/MweIpuD50SK+gS1YGz/c=;
        b=iaDFzhprzha7flg6L5eqQB3vuINWGm7ybKzxFOnPjcU6HvMOTZUnCtcCW31yIvmEEW
         1BEFUC5zXSvSrMZcssnYjVpj0jtbt33CBpZjd2nR0G5mZdf+miT18FKEYk8QNBJvwEsx
         2QX7dDZcQ+RljxJzAS2VCxThSP/+/jxv+PZTnkT0EM9jodekv7i9iyGccaZToz6A2AII
         9Z2Wt0MNJlUVVrQFKey8XkUOH3jUEnEDEaZp3HnOptMvPk9R2kbEC/16PHZ/pCCWIX00
         5wWs2jXZQQ1QpzKdEvpSRq4UGta/1k7BWnNVlKOxv0MJOlZg1DFvAawK7CXhYkoTARcj
         QZBA==
X-Forwarded-Encrypted: i=1; AJvYcCXNss2a1/c7KlvrZTaAMWY4xOWStnSoHVjqvaYzyzY2OQMfWXvjUJtSGms1lR7KsHSKkvHaNrlycl3lOB7p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lSX5ruBVeor5eEgrIc07gS8EFlZHjBs8GMpx8CINUU9FrFus
	NnxHrZpbdeOSSIBKQDy8WcGpV6Gnw1QV2tyaFIA/NesiVBBG5KZ/2LskRtbcVvZU6aM94KzYI6A
	DuOV4l7/pQ5wnv7wO8qhK5Q2u+UQYyjTp6oP/tK4hUrUndbVWbz6JNJmjmf5pRA51/0pluXMYMk
	u7
X-Gm-Gg: ATEYQzyFJx1bXqfrcOHV9MDY2ls5uM+yTP9gQpASjQC15c2pzFtIuWP0RX5VDsNFDHC
	in7B56vjCQSAm67me1OJx3GqELk1y+lKWyRBMDUmxo9sAimiQE0h2/y6/ZBPz/FhkZNo7ZogJgM
	xwOo98q2JVhhzXBd2MQ9Cc16aZ5amrSX8LHdAIxKeAFmeMmD2lyex2Tnduw2Xt1xrM8Ej01QJWt
	Wc3iVZ2FSubdJUVkDC6zXW73qN2nHXnWojrvBUkOoNmgpQoYYVM8K/t+cQWpJBeDzi1Z7fMLnjh
	lbmov0qTh+Od+S0Nw3/woecVRxTx8LS2kgZGMLXkWLKtSa9Z/7lGlGcvKRgoTLcKrhAzfzGMt+L
	35lZhSybSM10yalP4oXPFkX2UvWJ3trHAExn3XP5CajDD/CuEBBANRKDxqMGRFRQ7DsnapYnDU+
	QcDbWWnCiz7p8mDbPg4nurJTHECYun7CFboYM=
X-Received: by 2002:a05:6102:50a1:b0:5ff:1d94:b746 with SMTP id ada2fe7eead31-6020e58f46fmr2963106137.27.1773476378732;
        Sat, 14 Mar 2026 01:19:38 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:5ff:1d94:b746 with SMTP id ada2fe7eead31-6020e58f46fmr2963094137.27.1773476378330;
        Sat, 14 Mar 2026 01:19:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d5fa80sm19240551fa.5.2026.03.14.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:19:36 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:19:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/6] phy: qcom-qmp: Use explicit QSERDES COM v2 register
 definitions
Message-ID: <zamuzlsuz5lcffppa32ipzak4lsjx7khsv2wv5gvswmt6zds7m@fvwnwded63xg>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: jELePDwsGGt7YIYqZzLvr8-o_2BNfmju
X-Proofpoint-ORIG-GUID: jELePDwsGGt7YIYqZzLvr8-o_2BNfmju
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b51a1b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=37ufUEadZACFBEjeejkA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA2MyBTYWx0ZWRfXwzkyXGO5Pn+P
 nqu/60fp/E9PSrNRFfnfWyyRKitPSZ1WNy2lWUlcfujmLdZxaLPB1xFP308KkPG0hsuYVftuu2F
 7yKg5z1UkF1p+UzFqiy7o7b5Fppwqf49YKraAX3yCrhL9AIIn1qGxKVWD6CyJvU7OuobYaQR7WY
 oOr337ARE9I9HfLvMfQYcuuKv8C9tyWg+91Wq6Y2OTUQkdmvlFjCVwMNAJpE9vYUXk6hepzNz+U
 aEYQWV0uIsDhKqxLtKr+MIFiINIkRXxkRwu40cCdmhizrs9YlFJmFYp6L0kelxSfqw5fyKb/Ebh
 Wox1b+rUE3hgya7r+HrUrJqB8LYGQSCx3kAbF1dmxo4Mc6y049EDq3A6TK42ZClZOIMvXHAnunE
 9L7B4KY1lHzLpSBnSmHzTsFKzzuVZVdx+NT1beVoY8J4KGusnMmyKlPZldeW54oqJbxrkT6WTl2
 9H/rJHO8oN2mfx0PqGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140063
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97686-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4E1A28C165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:21PM +0800, Shawn Guo wrote:
> As the code comments in the headers say, both qserdes-com and
> qserdes-com-v2 define QSERDES COM registers for QMP V2 PHY.  Switch
> phy-qcom-qmp drivers to use register definitions in qserdes-com-v2
> to make the QSERDES COM version explicit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  86 ++++----
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 162 +++++++--------
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 194 +++++++++---------
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 188 ++++++++---------
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 180 ++++++++--------
>  5 files changed, 405 insertions(+), 405 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

