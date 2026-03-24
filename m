Return-Path: <linux-arm-msm+bounces-99756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAEaA1AQw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:29:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48631D55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56A96303A846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A700735E927;
	Tue, 24 Mar 2026 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XO1Di+b8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8NEMOku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742043C65FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391373; cv=none; b=gz+8jJ0oihVea2nb47D7t58+2ORq321/02M0Eutz3hKhp/1032W7I6RknWtw3jqCLXJMw1zu3LWNNhwBticZ8cSSip231qmjY1dwKoCCQzdKXO51gGs15dcId9LbiVh4B81S2D9kSf/TGzne5UfAwBdwGA0IBfnmL9VP6w5dboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391373; c=relaxed/simple;
	bh=SepiFRNI5rVtwrBIUvJ+O7VJ/R+/s945d+Zg31iJ1W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo+eFKV7PW5W45xNPfUz4P+Vnx5V9QQCoi92OMkop5+B7DGyF+VslbBRsvc81ZVNJi9+r+HJFrI2CxzJ4EhvTMG4/JJIg6RvP7jdEgRD4GI6MVsr4bzkQaYGp2PBYBvtCqTWTacdDuhAkHinPlEhb1Z+DYiKdpYfQZqeCAH1uR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XO1Di+b8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8NEMOku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnpnv2075801
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=crErFMmMQQYPDyY6gE4eEkzC
	E2pUe0v09b/TKB9REzc=; b=XO1Di+b8pUosSEGwLNYfcQtSZwo8WXU2V48D+ITW
	m3IRNd+VPdQN8ZZhN0wQ7GGxn6q8/7e3jURiQxxjooyzCb1RMpbYeTJh0l1wDrDI
	rkQaVIPN4C6vSNE5iM2RqUVii9Tm9Jp8kLAgjjSftdB1YwmzS+u+x7anrqEuID0x
	jicysT9sbpwcSeOytWSGsvWAP+LQikz1SFSkQ4cosr7RZ5MtgOiUdJoCo9rZdOjW
	KqD2RfHccT+vbup30hVzfI6oKYOQcA/ZSwDA+SP9oYReKxQw6O0UcIS8x+v5Owxt
	bpMI+sfcW2zHwqsJ2VMstZrV/kMZNnadEYvwnB9tMAtReA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41410e4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:29:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so273325211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391371; x=1774996171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crErFMmMQQYPDyY6gE4eEkzCE2pUe0v09b/TKB9REzc=;
        b=B8NEMOkugFMEdvxF3Rn5tLpdMYFvQ8TyqW1veunkyYdmQRHCFWk86EKNaSnM/87R3X
         TNNsIi0Hv4c0UAbrBlUnmyWJU5B09iBiGK9fwuZFoSpt0ca30kDNxQ595I95P4H/nCGs
         Edb6xyeBSbSPV8rthz7Brc8HcT1ewz+TbmahiS/RJCNtlw+Z94/uKrKNSU9N6YfxfT+w
         zdrM7z+bK9VMFG2qDrbxWAUHJVsG7RMKHyttIvVeKf+Utzr3OAJxUCawvSAaSTP19vQT
         7FS75VTwhYbxCdal1NXUbMng5pTv6Bww+x+JaTl5t1xNItQlldHfJ5lpRpLZh9+Fms5N
         KkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391371; x=1774996171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crErFMmMQQYPDyY6gE4eEkzCE2pUe0v09b/TKB9REzc=;
        b=EIkCy4PbZloqLLWiUkjjmMSMYShuvbSpWcKtUAOtBxUW7/TpXeiFjIDk4TF9sle13K
         oHdth76edt98yX8KF7tVrdrp2pqRx3unBh4UZ1KzQ4/1RaGYDxwtqrh1EEl73yKiBCpX
         DxtFyDK6hHL4UZOMZ1dSS9LPMkEK2nlZ4cxvIpt5YKVw3RiVql4ztJMHs60G0xtK4h2i
         aRVNBT2KruTs/a2LLCAj8b869YjuDE5nxN6eQF7EdfskcvOGE3pCDtnR9t5k0KTSS7rx
         kOcD6tH+UQoJmTmrNi7lZKLta9yCqxbOh7XD5eL7Ltq9KDQP/3e+B/Tp6fxw4y21k0WA
         mb1A==
X-Forwarded-Encrypted: i=1; AJvYcCW6mHf3o7LLziFLaLJd6SbVRjnuZqTcvEbRBtBQ1uq7w5dCFw12LCn3JlmkJxL8LdcoWGJRdly+EpxH/QyU@vger.kernel.org
X-Gm-Message-State: AOJu0YwOG4MJ/E2gF4hNSr82Q3VMCrOPsgowVN1ySKWPVoHyEdvfomuf
	7DrzVk5n7bYbLJRjq9kzOw0Vz37Ggx/Us2UkVMw3hPGrxkW8UjAVrK/HeHAzCJyLXuxsNfM7i/I
	U1ytIQfeLdYcYgH3V9ORblGv/eOVrP/vW+fKxEuzLEsyFZORDS5jJkHJzC+PmqQ+qyn+h
X-Gm-Gg: ATEYQzwUFb//Gqf/PYiKFUgLWmXFXe7yVF9lO24tqzoshaKqfNseXEGHeQ+8DlP0oJL
	pbqsatUDtnaezeqOhITd4rbsy75lDEpGs2rp51UneAeqSPk+NK9hJx/rQe/Q/WoVK2FkusZhG6R
	qiq7xxCaMZKTVD87Ikegdq+2E3cXpkDgnD4y0ZuhfWg+cBb20Om97R3OttqG2GbPkxwoP53MAY7
	XNdW1XjW1lE2gkmPjKE4//x09p3S/FxgdJPK0ISurWXayDvGNrgKRqDgqQ4v/7F7ciTCglBbNq7
	bhKji689DzIS8UpswmcyKYKXk9rL1JS+8w80vEHFwKjIGOWTrf/2AFqPbNi4wMQYyonDR7IYstn
	+7JaKD4U0MUyv10nj+JUSroS59iefuJFP3PjvjmIIyZv/PnanzPGdoj1tXlAzNKFKIQT7X04wll
	5pIVVgRM1/a4xk4Lp2tnQdSVx96d/n6xV7FKQ=
X-Received: by 2002:ac8:5743:0:b0:50b:6a6c:ed06 with SMTP id d75a77b69052e-50b80e2e793mr21489591cf.49.1774391370741;
        Tue, 24 Mar 2026 15:29:30 -0700 (PDT)
X-Received: by 2002:ac8:5743:0:b0:50b:6a6c:ed06 with SMTP id d75a77b69052e-50b80e2e793mr21489191cf.49.1774391370313;
        Tue, 24 Mar 2026 15:29:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm3544934e87.39.2026.03.24.15.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:29:28 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:29:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
Message-ID: <ejt2t7qlbiwctjlcbaqxw2abwa3lan2dewmubci3cczwxp25yp@ifakhv22rhgh>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
 <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
 <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3104b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DiUhS0_jvD4aztRdCdEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kZUa--_VISEIdEt9R15mdbx9ba7132hA
X-Proofpoint-ORIG-GUID: kZUa--_VISEIdEt9R15mdbx9ba7132hA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX6aprAVQdlBpx
 nQJrIJDUEndA7BWZoBXHgJpHQVcC75KcHw3sJf1gCyRHi/A54M+vcIv+qUdnhuRh1PXc9Y+LZHa
 1egWlnshrrClbkVQneE2/t664vu71vJn0tAJwCRgl64K/lny+AJnFpoCMl7cXep8EL4ZMKGL1Gs
 zqnO03MQFj9VkV0HDMWOnmHuYdbQ/b4IqdJaAl7xZUJQrQ1D7GEm8OVidSbQdA3/tVs6ZZ1BysS
 U1yBaJCs8IA0MNmm7V9HdojT/9vm2vU2bvogankPpic3fs3BOpZbk3SyQR/EeeOHDkwibpbdDmz
 Plad5hXexA3Mg6i9kOuksu73fxHuM77NkDoQ/TJeZRFuKRaA+2vlEDrS076U+XZdwwn1MUfUKL3
 tluVkj7keM/Glwc5aSEo4S4O8fRawTh3b/Yvg5iKuo0TSCxD7kUe2vwRNbe/BnjWjZM2wIgIukZ
 6HgdGpPm/PYAk+rL9uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99756-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A48631D55C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:28:48PM +0530, Nitin Rawat wrote:
> 
> 
> On 3/24/2026 2:44 PM, Konrad Dybcio wrote:
> > On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> > > On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
> > > > According to internal documentation, the UFS AXI PHY clock requires
> > > > FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> > > > the UFS controller fails when operating in MCQ mode, which is already
> > > > enabled in the device tree.
> > > > 
> > > > The UFS PHY ICE core clock already has this bit set, so apply the same
> > > > configuration to the UFS PHY AXI clock.
> > > > 
> > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >   drivers/clk/qcom/gcc-eliza.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > Do we need to apply the same fix to any other platform?
> > 
> > Most of them, actually
> Only SM8850 is missing.

Could you please fix it too (in a new iteration or as a followup).

> SM8650 and SM8750 has the change.
> 
> Regards,
> NItin
> 
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

