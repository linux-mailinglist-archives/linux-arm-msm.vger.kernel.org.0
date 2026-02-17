Return-Path: <linux-arm-msm+bounces-93221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P9HJzi2lGlMHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:40:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131E14F45D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91AE8300F107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20D7372B31;
	Tue, 17 Feb 2026 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icz67uQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIA2EciH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420F36F414
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353648; cv=none; b=qtE5e2Uea6Fxdh5zcg9pNorQzk7sBrNEZgkNNfqL4gH+AkAUSXAqqXGhXQTeY0mmjGcO5VqPrxz5UNW4ll/tgQUppzGsmbjn8SmdUYQ3u4hmq7oV/ZASCCL4GYqzaOx9ZBVtCzr3qkjwtfwYWqTtIoWjh2U61rrVkaZhbDTcJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353648; c=relaxed/simple;
	bh=UvUFl9FDfuFUB4napow20tV4rDiY5o+TzrXHGXuIR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/AAutvefsAcNnYKClL76UDHcelb8+F319ympa+GoPQNM91FvmGH3O5UhKNRdTyuL4MvQbzfzG28ArE4DgYd+5eHFg5KnEH5YCjsFXLYhrlDNSgzpKJ2+vK9q3he/l2wAjBrxa/Bd4BVjU7xH9ZFEYNv3pnHtiGOn/4Dij3w+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Icz67uQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIA2EciH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBO4Tu597412
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QQfKD8GVBA2aksYDATKy5SS
	tCQ8N0yPkSM4M0vZP0w=; b=Icz67uQZ1w168zYFAvuoeuarGF2Bn3D6hMvtUWNg
	zmTKVF3NpQStoRjg8WUb7wjYfAQI5z2BZMpvLmLpEHs1E/Q20DbCNoBEhR0sPTax
	ze9EMQknHWmfvSyf1zda+OpzVx3KY6WCHtjl3l49nAeUzR3SgiMQoLZ576nPQ7EM
	t8kwiF7RCCl7lVzF4qpCXw+Amz+clkZmYoyLKpnbDKt1g37NcoQZX3LHu1jSk2Wz
	vk6jCWqZOgYLKWYjC6TS6Pyd8lITbPGK+9Sx6zJ21h+l0ZHxpWH2CZI9CwcXIDez
	ETlIK2eD9FTSwSqfXkJxZtqsXnZHIrX1cxmgGtH9aarCjg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca3630r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:40:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824f75919f4so4862108b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353646; x=1771958446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=YIA2EciH8tp+5eh1G04JQC6qQ9ltlaSRQawu6vdxDcf00S2RKzQsW5paGG8zyLiPCi
         G5aajD16Lhrbi4RmWg2xlFH6lCKIMutts5AogLvFfSb/xXdPlAIXWVQjOro3ZkKW79v/
         1aeb8n8CIlgAuOsSsHSPqqrvzgstquMB+tQ70Uvo25ZdZagUsSh1kiZqq/jMwVhGd6Ey
         Y7XHeCy2svE1Zo6THjXv4tOaNqrdDMBeFQqGpYpQbHzfWwN3QKdY/iUD0KidDEXaL0tR
         7ghBDUYKMvt4qkbA4f+4UunCdvCW/GE3GQffZa/s7xeNU8GUTzle5v+khdLB00kirPFt
         NU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353646; x=1771958446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=bBfYhLGgaurSWppM5MYhqSRrlTVNEaued+fXeMGq7dIHBSOSohw/3hVZPdKja7bjxq
         az6ea67NTCd5n2zoPGhpXI5gAibn3GZ8wr9b9kYQZQgqu4liKUDhUJyBHIde9U8fXK/7
         CwOabV105bxgCQ2dRXvYCI7cfccyqCcJS6YdVKGz9s1kru3ut8y5Up30BPpqD/9I0XXQ
         wKJDJBiWTOxASjKCa1VgLpgkGDC7Ss209f+NQTHHR8BRY0P44BgVymBhFf5tdMqco9A6
         omh5HXca/zv2oCeezADjxopZiGzw/MET+/hlxrkPPn3KHmZ16J3LuQDCTtJOPXsOno/I
         bFGw==
X-Forwarded-Encrypted: i=1; AJvYcCVeSK1k+lNxSWcmo9mwKLZlFfJ2Btkm6/LQXcrtdvAruHMWC8Kvyd9pF+hqHZxBX7QTpOJGNwzP8UJj1+gz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/57gTRlfnr0WTGKKiepZYR5Ed3OsVKK59gRJJu8RcTG5gjqV3
	GvMD27UVMSYTmNTP/6Uq5gArMNLVKmnOXqRLYCqYUlSCBSETcWPSXlhKFUso1dmayzrI1hhrr0e
	/CsLEHHPwXG87pZaNLY4O+WzPiFAU99E/rjb/EqJV4526ugwHuL0XdiiNhotgHBTW0FDU
X-Gm-Gg: AZuq6aIOEkvlcXvfxMc5jFWwcDoKzDjdhEq3UhyiX9x49q3j4OLvRy/mu9wWFVncQwe
	jyyFFrasPOCqmgCxJBNNgOi8Y6clAnR1Q5AAwqx8OY9KdTEywbJtWHNSsghTXxKpIJrd5oRr5lO
	TtpWXfheWkRPPWyMYhsnnsVK3wovwovFgJ4GGZV0Y8qc7moMSYK2Tf0yas5m50ueD0MKYutBSna
	9oyyPKxuuJQPeDUADJHB2TR02gaTwjTRIUCg5YxIpT+tlt3DwQx/cRpprV54Py4M+LI0Y3pX+bo
	tCL9aY3Zuo86gOj4AAIVpWIfJAR7jcJ+40A7j6UhlHwxyIaeh2mqF3rnaqlU9R2uYixuiSVyfY1
	2lMAvxs52kjMnv/KG7e9MZWepsNR8L7K15K8=
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985348b3a.35.1771353646324;
        Tue, 17 Feb 2026 10:40:46 -0800 (PST)
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985319b3a.35.1771353645747;
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a0c3sm14187532b3a.51.2026.02.17.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:38 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: move SerDes
 speed configuration
Message-ID: <aZS2JpQAO8z2xej1@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfXwiu8xd8jVZ4w
 zHCczi3AP+r5sYeFiTb1Ekoqctt0YMllwpzgdj7xou7mXOpueKqxF/Ye2CrdLXBGEEuioiVCJBl
 ZMlTucWRn4dEgq8cjGvdg/kzIpD2hvHogzS0gJaIva25PJPUOaH5mV7x4HAYgxcmhe3SZA96ujL
 V5ugFVpvdM3bs0UWc5Ig43evcLwZ1AjjBB/davCnByfNhPS2xwcJGWn3wDDOY7Fb26pGhZ5geY8
 m/c7q6rQHqgAvq3qRNNIjvw0/en7oHe7z8jOqVuiMcVzRhhYWUSXlxVsFVjzWi0/BNojzbRNuHG
 FkYPwxLzm8Dkf0NbSZM65sfpyhtEqJiUliUqE1wCtoVLvfBQPI8j+gqojNPYr6b/niidDgpTTez
 lw+f+GDmehJz5qCM/MUjXh+XlzLZwukE/sZSR/49KTtlbazzaf2YIQPJnIJFH/e4xfmI2hSjP5u
 VsV3X9M/CMeMSDMIr5A==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=6994b62e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=K0zUmU2yKo6XzqUEZrMA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: VlxFjnxMCx6h7eWq-Zcc0GL4S0kS7teg
X-Proofpoint-ORIG-GUID: VlxFjnxMCx6h7eWq-Zcc0GL4S0kS7teg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93221-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2131E14F45D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:27AM +0000, Russell King (Oracle) wrote:
> Move the SerDes speed configuration to phylink's .mac_finish() stage
> so that the SerDes is appropriately configured for the interface mode
> prior to the link coming up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

