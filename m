Return-Path: <linux-arm-msm+bounces-97689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMjPFiMntWkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:15:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3828C4D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBA130465EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752243264F7;
	Sat, 14 Mar 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuBiBXPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQBpS8PP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D819ADB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479705; cv=none; b=DghMmWlWQd7DDFsgByWJHk7woTc1uUYU3w8qZa4FZ6POwRyCYNm0T523iHfjcxhABS+IlILeN8T7OdMGweOVK4YKrxW6tnvk9aIYCNA8FrSTXgYvyVtMwnbTC1nh4q/px+p9dHX3ZVdc60+S56ksT9ZfZPizGtxi7gsYz5akKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479705; c=relaxed/simple;
	bh=F1ajIISUg1+DdYgacqXEYCzV/jHBk6bKtM/1JXVu7p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEOwYouW+1D0Z+49lSihi0hy7IkjDxMT5jastHCRarqabPIcVaLpaoDaevUp2qyLsDqKEYRQsnq6zwpuYp+Sw7C760kj6pd0tMisNRkAMT4WLkNhYXJBHzOIDk09xmfhEdMruyES2pLREAe7rekACEMh35RbiyUaXqJxRlK/6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuBiBXPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQBpS8PP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5Qok13729247
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WVv8yDwY2UOuW5JC8S7GuKkK
	lPo/L+Eu9SHsukBtIWo=; b=PuBiBXPDNhAp6PVgTmM5B2+iX94k9Iphk6y6ljKD
	JWajOu0OXY/vHajQMYdcgcJHVoUZeVpMiAYLtL3GUFe2uYYre3ZDSifsyFXlQwgX
	kBmLPZcCs5O0jcQ8BUKXyZLa0BnINvbOPxD54+3GpWQ1W/ZxMOpI9HWdNedkThAR
	vcBcNIb/luBit6u8Jpbm2X0HHh/Cmxf97224A0gG9Bv9TYLl2ZWeutfjXXYrNKOv
	+4E2udmsysXL+3QIP4W/3AA623lMSx2p+gttoPSycwGRebwcOWMTmk5nMFOznG10
	ZM3HmyIIarHFEZ1+AwGYo7mWUkxwTb/5xqspo+jq5FWGsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc0fr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd858e8709so3085620485a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773479701; x=1774084501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVv8yDwY2UOuW5JC8S7GuKkKlPo/L+Eu9SHsukBtIWo=;
        b=cQBpS8PPegtXl6iJL/sZ7sGpEOfjyR7KC7Dye6Olu7sAWgNOj4RkDB9XH49KG0N0ZL
         +2dIqumPuALQrM8HOej6mPxn2MI8QQhO6Zle/J5CSjnkOlrmFMvkPjALq/WABCoCWMd8
         cole+mctDgDSgxZFKplOQg2uUPwFGLBDdnqA82VgNTMgDxHtmwJlEnY8H4DmDr3YbxY5
         E5IJZB0BtoC3E31d/e92WEEqjqzhclhvr+utYXrODJ3Oim+36oy/i2Jyn+6b3a8hQ9oM
         KZouhhBzoi/JsW6NLjUqzVTcEsnv8aM1YnscLAB0vLpukXOBCCFxqFLr2iHs3Jg/k4+W
         saoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479701; x=1774084501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVv8yDwY2UOuW5JC8S7GuKkKlPo/L+Eu9SHsukBtIWo=;
        b=GEdyxw4fZQC8gycTKKTPf+P53EHB7RmKKev+HavZe3E5RiN+X24H83Db1tZ1KxncDT
         0aG700aOURQypercygDnXvgKg8PuN//3VoukWld6SBEML93g2+43zjUUapqwS8xZXL+D
         Z65nM/45rTU+ZRJLqPGIKnwgefA8gdJEFOZr4XAI05CA7w6vFwuLbxr7aAbyEg1E8I8J
         1+ebzK9ZsXmed71LtyyS1Oe1SgAOkNx1s2PP7LLbI0cTS2ymfYFDnTcViRMt3A/QdLlo
         qr1VEnqXLnSwN0IjcMpAnGraGwucrcEFCbPGNDXYpQGfiXNcx0uZz27SHYRfIeLpV2Ke
         uo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJYHR/ts5x+Lb2BIYEpg9ODgG85EkeePXzPMpeXeMj5m86qGo6fFNOzWptNd8u1MXehUeNZDh8xSmGPf+C@vger.kernel.org
X-Gm-Message-State: AOJu0YznsIbYRePYhbP/P0bJg21XHbxLngVV7JBV5eZou7qyvs7MHq2u
	H4762jv1LAH7uPQFW+yOJxBNPi7WhlLcMgUEy7CwaX/xR9EpB/Mmjc0jwz+ejkchL3RcWma4Bms
	ED1vw6DqmYKX4IaBpwDbn5p73dgpdDk4KkkUty2KcAh+o6XCzOZAbkGJ1huome4u81YxC
X-Gm-Gg: ATEYQzyDzXi/nE5ZsraGppur+hnb4jcmvjUjwVM3fGqVXmYGbf5dxlXrFaLHnP16vBP
	InSQtwYJOjIxv5hbv6t+0SBXGUfBUP9K/dE7lHMdnH4Lkpm2Tm+gxypBKhWMnsP2aS1PtvwZrsz
	TLsx5fRh6WKJaBCpeSwRfFLFgBzfMm6OOXrnvKAWwS9gfDK1aw5u+6jib8byRSCmJmyOCI5BpUW
	ItRirrSowngMFEaBPGAHP4AYGbBLizyDpgTmsCM94UyN40z4BDzueHiEM/hgdEGs4iUx99BcOPe
	dxUgx9aGHw37bdx+xAlvhbHKhNEwdrHMgYnPaNpWXJmIFe0ccQfJTGX/bZjZwJAF8XqHYC/fAHD
	EQrlJDQLXYHMroKJGKi08Tg/Hlar6QrE7jMhG3SG15Gb/ZTNRa4z746XQFOWWB+gCwfvSyvzBwc
	bweh3chDlBf01U1kQh0dDYS/mqxpA/+zTMqpQ=
X-Received: by 2002:a05:620a:472b:b0:8cd:942e:82f6 with SMTP id af79cd13be357-8cdb5a4b8e1mr782696185a.2.1773479701113;
        Sat, 14 Mar 2026 02:15:01 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:8cd:942e:82f6 with SMTP id af79cd13be357-8cdb5a4b8e1mr782693185a.2.1773479700634;
        Sat, 14 Mar 2026 02:15:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b98sm2078353e87.48.2026.03.14.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:14:59 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:14:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/6] phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables
 and functions
Message-ID: <ckj6c2rute5bzachye3tl6hs3fgw7wtafoldsdutkszxjc2vsp@nplvcpzqzwfn>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-5-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b52716 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eMEfm-d_TjBb98c8FgUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1J5EPITveeV48MpIb1o3TOHEhJUC6Pt9
X-Proofpoint-ORIG-GUID: 1J5EPITveeV48MpIb1o3TOHEhJUC6Pt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA3MCBTYWx0ZWRfX0HIfRtoxyucH
 dNkg9GVHMVCvqin3DSsopssyDRmL5xNgOLfgqjta2fMdKxFt+8gU2A9EsM2OtO7qid/JNvlbWyB
 LXN0FISEu0LLi+ufivR2OG2Z8QjsBbm/tJUY4QB8JgrQiVQZ2s6/v98vnhfPdl/CPL4XCkMRcZ/
 ggMC9e297xonI4qZv1W2+fNj5WzJYqmwsE0DUTjSNWRszmVMemMI1fBDTfVtaijZFkLlCXpvCFL
 +xb6v/5XNFdNONpqjsDBNQkG8d/LZCCk2tltE1Oxx4xbwfe/9QAQ/j9o9OIybwVmBf04qp69dZ8
 06u9o9blzu1o+U9ESVQrAE1J8kso2mInqOMAQDP6YjgFy7jLoruS06SG8NCnlYXgNEKJMzjHRSN
 t6jPc7+DOEd07lhz3cf+8qCluboFlXHhLf8VXegrCGfFixnl3chcnfqZHawTXlpqJHTl1+jq4LE
 gq42yZuCH2a/4VMp21Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140070
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97689-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03C3828C4D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:23PM +0800, Shawn Guo wrote:
> Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
> and DP mode support") chose to name  QCS615 DP PHY variables/functions
> with qmp_v2 prefix, by assuming that QMP PHY registers are versioned
> as a whole.  However, the reality is that the registers are versioned
> in sub-modules like QSERDES COM and QSERDES TXRX respectively, e.g.
> QCS615 DP PHY has registers of QSERDES COM v2 and QSERDES TXRX v3.
> Thus it may cause confusion that qmp_v2_xxx table and functions access
> QSERDES TXRX v3 registers.
> 
> Rename QCS615 DP PHY variables and functions to be prefixed by qcs615
> instead of qmp_v2.  This better aligns with how the driver names USB3 PHY
> variables for QCM2290 etc.

Well... I'm a bit reluctant with this one. The driver needs to support
DP programming on three platforms: qcs615/sm6150, sdm660 and msm8998. As
far as I can see, most of the DP setup between SDM660 and QCS615 is
common. 

> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 66 ++++++++++++------------
>  1 file changed, 33 insertions(+), 33 deletions(-)

-- 
With best wishes
Dmitry

