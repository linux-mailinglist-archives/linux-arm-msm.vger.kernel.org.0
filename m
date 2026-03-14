Return-Path: <linux-arm-msm+bounces-97685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAHJEhQZtWktwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:15:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0A28C143
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 909A1300F78E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 08:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDF045BE3;
	Sat, 14 Mar 2026 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQL+I7nJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzC0Qfn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F230CDAF
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476110; cv=none; b=JViVOEAP7DM8CMT7FZtxf7+Tso+cTUD+BPqxdPF6+3IFB2Jss0Bg7PECXjRm6gYwcut/aS1ErfNs3mWJQRCBpfI/jrVzJlk8mM6TPfkZe06sZlSoPFyyJwEk7NVkJB6P33lsXJyihuIj0uZ0vkNMgDX2PKeMipXP48g1CHQP9g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476110; c=relaxed/simple;
	bh=piww26dlAiOV7LK4Y87yPnY4n23Wu8h6YnnuwpC9zXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQ0ZIM2OFh6PfoqkAqIu+aMQlXlKIoYsrEDa3m173mJEl1IDr9pJj7xw3DLBBJ8A69eUkjEj+3Em2AwfGtxO5ewlPIijLfjboPwVvmjgzF+IXCHbg7uIc5wBrpqzsyrS9Y+kfPRx1y7RllsuYnMhhY2lUi7nlKjxTMMxkNPhTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQL+I7nJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzC0Qfn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5TrWV3540207
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1oe/bEGh1wABv9dzWIU0CVKm
	bRrD+hQyEkkW2Ehs+zg=; b=aQL+I7nJTw58XPrCF9uKkjbChcjMeAjchi8hDJ7J
	nh5TGCuALUZHXXXarv4ZjCs7upjWh0qOeWpL9etG/mET45/JJRXtF4XZf8rIonIg
	1dUAnADv2roNFnR6of+u/hhlLy7k9C610zXvs6DUC89A315xUr/11b7wmMYwBrYm
	IBVpejcLdJGD3MVYCYGeQ3q/3Xd4bMkV0fjJoyKHVCnedQ9Fn3GPtdy5UA1UOMqJ
	dC8O3S+YHrDP6bIIPgmhnDJPZUOreEMSyMty90a3j1XYH1CrH4UNwV3S35PqURbx
	oPBLY+yNOFXSYg9iluqo+CKLpdKePBmjIwl+0eDGkvqEBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0278cp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 08:15:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so433891885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773476106; x=1774080906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1oe/bEGh1wABv9dzWIU0CVKmbRrD+hQyEkkW2Ehs+zg=;
        b=gzC0Qfn8VD1vc/hF5uvkyHL6niTamK/g8YIBbTcsV2W7an462DrlKZU2VpHiHO8P3C
         O1mxQbAL4v6oO2Nb/CXbLLFDTNHmcKR9GdC+2epRO5y+qkvc9869XM29fJqkz+HGUokr
         MN0/iRkgXhtl042fFIMc8xq6pLsVBBQIOdTAdpYpDGpHmqrumU+FeTSAwr0X86YYk9jc
         VPtTLkh5AM79O9kDNaVuj0b2Rra8XhbZ6mTNBf5oF63g9nkikLd7oaZnAPFIMV+b9JaI
         0Wj5o6L7T/5P1HU36ewVRMoX6NE6wVPMPrKy7SLwU9W7oRCiRjb1EnROQn7LQdueRQ18
         t4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476106; x=1774080906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oe/bEGh1wABv9dzWIU0CVKmbRrD+hQyEkkW2Ehs+zg=;
        b=aLXVu621uoEo40xOx4vufEZFJDEhCfX4Tj3S47EYwmuzL+rqeQ0ET7TEHRily825oh
         H4daZmCjjoqBi42Kag1yGUFnqZvmDLiU+gqsOoqT+osvENZtDeA2YrIUsMNElTemK6C9
         2sp86Qcl8nEYNHUXiCIkKXbCwqqD1YS3cQwGR8l9UjAbCtP/P2NJ/1RwMYV71ye/cCDo
         AH5iTQlgeXPI4vRRq9MfYZfyRWhlzDi90V2kkY1iFzC2Qc19PJ9B3seoRDMPvi4KP2Uf
         yYFqGOHdtqWH486N36U0cUNUNSHlHz0mCHHD8VA0nNoN1trK/InkzNMzTl7VpnxovKSn
         ecoA==
X-Forwarded-Encrypted: i=1; AJvYcCV/komm/Ud1OCW74PHPobW2g49CGFSfAAMLRu5iB6lhdptHJltluU6RDUXDSKxEbfryCuOOz7YlbBW1Fmd+@vger.kernel.org
X-Gm-Message-State: AOJu0YyD2S2MF+m5iVJjd/LhYgb6wTTiEKXTvsWtUC666G472V9V+J4/
	8Vq/lfmOVCZlKbRccMPCIp2QO7gAkps73bz1qilskYJwdWu235YKDfJaO014JagVyphjp1ue/w+
	cV6RS2QLbP4tTthBQ/J9XO42NX0OvEDx5FmSzK+lOslre9KXFX4JdRFNOjWj4PVcIA3g2
X-Gm-Gg: ATEYQzzy1NAfRDa3VIodTf+3XFCAc+W6PJNMEsjBHBMananzIkUNBGOYppGcStvwphx
	ixk/J3oPRTaDbETV4hlgHh09OX1Ud8jeOPEZdb58pFsYR5QkPa42ZfqERDNSujYiZRm66Jcexab
	vkKTVIDtHdzTYarZpT5jLxd4paRkV2mG9pXEJprvC4+omdVLOr/FtLVoxnycZu4SDP15NrOf7p4
	n7OQwvVhMrMq8/EafUhqLHrVP4UpBpyfvncs9Cr3SAAOT4zLeb+rXpoXwI8RGVMsyxLBFlOoczi
	oqo1K2M8e3u9IwfUg6Xu+zrOvQdRw+K2gJqeDQSWuiXJCJeXfA3OZRDw7k4GSSsvnN54wy2NRQt
	q58mBKrI5O5DABP7Hpg4RVtJujkSW7CFAUeIR0E0rt4Kxm6WRuotJ+ATf0Vkh5p6v85i+2jDSHS
	OEr/AewWvk1Hv2WBMBJQqNQ2XGJIS2RoWw6Oo=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr799153985a.38.1773476106243;
        Sat, 14 Mar 2026 01:15:06 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr799151085a.38.1773476105783;
        Sat, 14 Mar 2026 01:15:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156033a1esm2008837e87.36.2026.03.14.01.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:15:03 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:15:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/6] phy: qcom-qmp: Add missing QSERDES COM v2 registers
Message-ID: <y27nftzoudhvyz57pdgch6rfdu4brss64vpwkcuasozbrri6q4@2tt43qo5quer>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: P5J-Z-l4gzN0Pjd9hgNnrOAoSvpAU1pr
X-Proofpoint-ORIG-GUID: P5J-Z-l4gzN0Pjd9hgNnrOAoSvpAU1pr
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b5190a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=dUGQFA8BKvGjJvMztnMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA2MiBTYWx0ZWRfX84L8yk6ugXVF
 uo6++oYpR/wl1FxPMhgWVREApRBvTaEiqfjJKPIlTCm8NMftaph6kr++FeJWCk4I+B+OtcaUJUK
 YY/OHZwuS1fmjS130w+PAGZJuD57QsBtObd8wiiYD4LFGkrkdu+Y4FZ+rIL2PyHEO5LoNu2I1rZ
 jRFfaf1RFfFG3IrIPS8B4KPaXsTrsuoDjIeSweE86asTaQQ+kYJiD3/exx58rwXbPw0Bn3MYX+x
 XMQjmJWWxHViDCXDOT23NYUvK5IG9Otii+6fQqdYn23WQ/FPW42qgNCSrj4XlYgnXHgFR3NHtys
 1vk/ybZ7KmRm6yRcrZCBGmSBxlx9OJ5f34O9S/2SMRP8/CyOrIuMZBWX+65tyZhFEKXsh9tQ3aS
 dhzPZvFA6HYbqDj3P8+Rb40ZPeeO9p0DFnU7XeJh97F+UHT31iOfF2zD1qR5LysxPO0ZWyRPDG+
 R/fAkJHq5AnsMOdFkqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140062
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97685-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,infradead.org:email,infradead.org:url,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FC0A28C143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:20PM +0800, Shawn Guo wrote:
> A few registers that could be used by phy-qcom-qmp drivers are missing
> from qserdes-com-v2 header.  Add them.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

