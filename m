Return-Path: <linux-arm-msm+bounces-93642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL4HLEcknGkOAAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:56:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E81745C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C5423058B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927EA3563C4;
	Mon, 23 Feb 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDEBQYHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdYjEoNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D60350A35
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840466; cv=none; b=Ki55pEcGcLH9t4Q4Cj7zAJwiITmPGAE5rgMn+9Pf82kh4SLlo/mni3UiajUKxWMuRhT4WpemKjfFXtsKNAzaB0XqjFHCvri6fEoZD4Ji5brbRqsFt9GJjnkukYLkJKpxz46M7m0TFd3cnLVPl1hDh1R1wxBqrBO+sa0ujt5lq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840466; c=relaxed/simple;
	bh=Icnu1d1RncN+al6ldVgN2HADlKwEOFX2otQVBPAHv3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9MK1dyPeWM03BqbJywM7ASoqAdXYvNxjx3LV4mezHs4fi9D7Ne4sBdafPVwWeEGah8X205lvaGUwyLGzL25Sp5lECzxFrWbym61AIQEGnD1Oa9308jChhpI1eWqK5+0yUujtsTWydJ7ounvLuadZ2gxYXtwVNk+eoLXigNCxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDEBQYHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdYjEoNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9BgbN1249093
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMJwRoenSFg2hWtcaGyYH8c9
	1ypYkTPXJQa7dQ0lvIo=; b=BDEBQYHNvvIodIsKxbVwYcsC/q55fMTVS8gWXSn1
	MvlVMX+3JOBrmIW2f0FYtqQF0zbS7d3tCBxxVzCURPXuzIIfBLsqHHP/YLgnjWi9
	OiZUT+7M00nUxbDFIWgxX/bOW8X7GQ3tk0EX62ZL2++o7vr12d05QZszV+TiDlLa
	PC/IELJi2W/iuEr3GvdymOFzrOSReh8b/OMzDkuIxfVQuRGAElNfz0FcMahEgEtp
	9hnnBQ59d9E9TY+up3xVynDcHVGEoGVevKt3NxQ10pBbWXL52sJYSBwqsdDM4Sl0
	RWr/t+bjK7Pr7g+CfHSUjWoTcVaROPZPUNPWBjGJrd3SLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v8ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:54:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaf0dbd073so52643215ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840462; x=1772445262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
        b=DdYjEoNgWqrPSxURSclKJhZXGWZsc+JV28ky6ETIzket3fnfAyOOp7V4KgC/X8dmaU
         1QS55G7HZ/fSdwwV8rTkfZtMIAoZe2OeXDSkDc/oJJXNzgRM0xGgwHqYHG4g6+RH0X+8
         XINzYRAaLOq5f0sL1ywNH6h5ya3YOn1Bt8Vexz02pdut5jdXsQLHTlG3FIsOsYwxKS/m
         uw8DQp6tB6apt5LhN1VKysLOOFAI0PcrjllJOTv89GETvbUKT336FL9ENa4ZwqxXmReY
         TpKShepQw248XVuvYAmBQU8kcuT4CAph0mVNsU7puKEMvE/EwKpQ4kkxqccquVvyYtWh
         vKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840462; x=1772445262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
        b=PliBxpbh7AJDvCBdgphfDviBvL9oNzFbnCEI2e0lfhlKsxxbuGzwPqXOu1xjrx1JSK
         hvTJQoPgwmSC+jvqr5eSUhmF4l3ocxXWsIiXdsYeHftfQ9zOQ+j0N90wEKLOU26p5Hy7
         wWaOAq986a1XzUkAkf9QxiCLo57TCJWm2oN9x1aZc36mrptMMsfME/yOCHJ5bk7ScECP
         dbsi31mc4yiZp7a0LVcuaTRyH1Lt5lWqZcNztdjBlDeKrSWjqAYeSEtosJ+cFWHx+rIG
         5AIb1CA8TKXGX6NSPYvwyacgV7vOeF9pNvVTvGbf4n8rB9Skgi3mftQ+LWl8e6bQjdp3
         yGsg==
X-Forwarded-Encrypted: i=1; AJvYcCWCiPscREdxaQMoP7UJq/CaPUXLgwPz6nO1ASsbe/8p1Mr4jPDwO9mTQnrSKE3AWyO9yYeJjeV6RVDtu4l3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3idgvsyqkhuNZECbfA48Gw1yXhOroWgLtgpIBkVcHDpitM8ED
	ow4mWd9Pqxzrhu7QKzyHdjxbBqtQnh5Xsc6+SYj/GrNVlrVY9B0cn0AtRUWK5HoDiHa2kO69CVw
	CtPx8ijmFHTSbrojwNtPhmyX0CjHRAFlh5puYqLer1ffK7JOyo2usDHJhsJ2qO/BV3Ql3
X-Gm-Gg: ATEYQzwloGnoKULDiB9XPbTYfmnXBHReoGm49imtnqaxl5lDkr6aB0VPVBbpTzKe14L
	XJPX+WiatEuMSpe49poKlXAuoSZY5CHRReHjnZo+qn0xqNqNZkuic2G4Fmcg70gP6oUqmcqBYBJ
	v0xKkLNcjS5PYDII0xeyP8/hRyucierNrElda/CXmcQiDUKGdZMGYSjgd5suFWC2qiv9owbTcOl
	a7PeFh3ePqcbZ1XpMGoIGFT/U/uXS92lghZo9ni/KrpfqLc7OYxAVb2r4myQ/Cu8+048d+godS6
	tZyq9bKNaWybDcvmD4OdTF//EiAc4EOKrCN1ivDrMyTKZWT6cPqM0rHE9xL9rtkyhvzNcFBNEKo
	oVAu0WNTbxwtPgxqC++EKee9jn54IT7V8w3Y=
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-358ae7c3134mr5861400a91.2.1771840462343;
        Mon, 23 Feb 2026 01:54:22 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-358ae7c3134mr5861383a91.2.1771840461811;
        Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af93b9d1sm6128924a91.15.2026.02.23.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Date: Mon, 23 Feb 2026 15:24:15 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+ 9/9] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
Message-ID: <aZwjx9pKFROhF5DN@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXzuvotKa7wX2y
 LpYRlYitNEBOc/WxagJulsowLjaV2/0s2wtqFjjkam+NN9RNgNCjwk3QHq8Q3rkSxGVOXwuZd/I
 ZmjiSvcGy/FNpVoXgaK2fP/SpUgeiWAnOsY3ZEHw0UiwJA06OW0lgw1WALgs4zZFJmOz5gdk8Mw
 q/eWe5JjpdhYhP+2/roqkDcqz3GvfONc2/EBGPpIZ8uAGFu+XFwQQufbOdABXOMQ5xBrCLAXJg6
 EE+cjDKxjA0sgg8wICLTxWcCmUbFnRfDh4dgubcBvIRaWhQKA4o6OJLtJ1NjSlgWd1YwRm8Xb6m
 he62imzYdn9crxgck9aZ1WItajrzyAhhtMQfZtDRTR7xKlJCAypLS532BCjR6oGuvE1LOYanpNm
 oVgt/l03EI6P2jRonNlnHvEUfTlNxnhlKZkneHSKyCteFw+i7keffeJzWPVOrR3DriyTeRrNrp8
 Gzg4bHd1y9pz1UuMKDw==
X-Proofpoint-GUID: v2g5hWoGxm98nIrPeuOqrS7pjsvRNEPB
X-Proofpoint-ORIG-GUID: v2g5hWoGxm98nIrPeuOqrS7pjsvRNEPB
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c23cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=_j33rwhWCIcg66mWb4UA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93642-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E0E81745C0
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:51:10PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

