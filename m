Return-Path: <linux-arm-msm+bounces-93214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INaQAOO0lGlbGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:35:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7C14F31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D40343007E12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D59229B204;
	Tue, 17 Feb 2026 18:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDgF3v2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYi6vk+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021152673A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353311; cv=none; b=t7E8rWqDoMKqDMMGTPxi5i9+cwGcVnYVFEQPas4QebrBI958pPDixNHY5YGy8e2qzKVMVP2oP90IwuVG6HOCB1+q8BggodwkSYgzd+/4IE/5B4GWk0ttHGhJ9dcEWMow2dneRu4BwE2ABj5Eb1LlF+FNKxqkmcjjRNr8WHUlQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353311; c=relaxed/simple;
	bh=dvn4WhoeyZ48zTOLiekWToB7p0p7kq21LM0Em3rfrXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObJ33NzxAWpW7BvPEZmiWP2HQZ7F3b4pSW1GlC/FhaoBhbdLUHBeo4nK6r23qHQRGgb+bsv3GeOZ7j9SfmxlF3PANiZSeOw7/GGfb0XvhQYKsZ5ryG6A2clbP8ucrRhXD2VbHysDlPHFn0zblDpQutLi/vCcQRfqJPONXni5fiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDgF3v2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYi6vk+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3XmM1942817
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whCFM/BSXgDYxgAJq7FXzzvO
	BcHA3JZlYE1RiqYzwa0=; b=RDgF3v2wzcsLhhMnH8jJtVlwHjzy/EmJS8YH71Tp
	knkpCG1Zd1yevXd10FcYSMEOEq2LtaMVSWqlWjGFlsZDZePz7mYyemc9eXkRQPAn
	OrRoeWRnSadtiHSvmEVEZAzhVmhC8bCQfZiGu3CIKGaKUG4lqLu1ZED0R4XpqubW
	035XsnUYSPWYNpS4mGmrj4KLyepupzJ6tBOuh7T+z0sPIXhr20EwdflWj/sdY2I2
	t+TeyoPQzbqkJRbueblz5w+iaXG9OawdWvbVW/Nqwh58LaPZ+vcWJDJqVT03J07D
	TL/knQp3vOUmSTureJz+tpOZLkSCpScafXm9cI9QUq4b/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g1evg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:35:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad44941ea2so5513035ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353308; x=1771958108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=EYi6vk+1eANbmSsKFX62giKY2YXeAgu1EWeIYBjsM8h0jmF05Jsye4PRwyo+o8XjgW
         1tEwBHI/01cVUUOi+eGDyNsV61LyuoEomVmWUlpynl8x1zmn8k6dR3gWxfM7rzoGnGI0
         9jxEGFNmPhjKUMwQfrkxElHg+MuCn+//PHWwjscbjSH2Wj3AhLh7j8PjOuWwDoPW7WL0
         KB952opcsBMdIiyhJczmIeP49OqPPm/+c1WiZdFo+/lxXTHcpUCizwG+80BW9rISmrnv
         77agTGPFilh9AblO3YPVlGsHmrTj1VmFV2gnLlRzSUCgPtjQ+v+HtGwaU3EsGzg35a2T
         SpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353308; x=1771958108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=FlQpRRfHWYIfGisGFgV9tEFTVbCgORVG8RrjqbFF+fyT8dybjcLcx+77pc9h5cgSxv
         MZRDxQZuCIzwNovOXmSMtmu2/D/nDI1ScYJ8bC0tXsVVB1ZRR/H3Woam0EOq2b4UIscE
         nyRvc1STpFleee/yMDhWYphcEcXzhcef5EMfyezbEkqx5rXf79droPPMpe67dKmuIRQN
         4brlljvo4Rsd6oq+Ds2Fz4tS1HBY3SAKISJNA0B0HurXoMzhx33rktco12Ouwb+ZXDWO
         FRRVvAnGaxHaIeczOrBZrhS1tHrIXvZUMFiPScvOmxABk3vDEwrG3z2XUguhfXmx6wEF
         yWxA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/oWUGGNvKwCrC2qoDMpO2JzD0Se/KNkbFaM2k/Utg8sCjXLupucKs9oYQnI69z7XYQ1b3tLXoszYiN4L@vger.kernel.org
X-Gm-Message-State: AOJu0YymVYShHToTrY21NYc0c8KAMjeNyL2bx2VPrGrUi7bxUAnz/aZB
	FURIQrYz6Su5hy42KNWsqu5lLTp56oqEae/dPe//DuatAFi8pcSUTYahwXrOwQn/0i6pR/Tyrkn
	4/GFRK/E0xOvqfyiKsacU/yvRAmV7/HSLR+9ctIHJaIoIkn4S6iKHuSwdhWHsAo/HHN2u
X-Gm-Gg: AZuq6aIGU/AlbeyVqa+7VJkRcvUfAj4S+WA8BMQwp4Hs3dzAaZSFOfwIR7aozLvsn9m
	w2dDm4U2JEeh+kW6lB3UBsJpJgXz41GZoAeDLGbQNxoIpUSB6LOjj6T2yGJZ9+1wDl2+DCheAGw
	2Dm3MU45B7DAHtk/9CeFY5eAbO59x/YYEln6PrPibHN9MV8lF2tumq2BI1dxWAj5nHdF3VILFLa
	BOwNXRM6lMPHwUkwfEjW43Jf5z/8WM25XVtORJQOE3R4STcitz+s6gA1JdqnhsjLc3L2uoN1Zxy
	f5BKr3iKoaLiKEPxtGYo7EkHSvhH1lAMOiqWDTDfRtJc+0Ekf2wNK4Dw9Zc9i3mtMu7UjWBg1Uy
	B7AndY3IYptgaW8W2FTcbRfsR3uAc4LYLckA=
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642495ad.37.1771353307778;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642075ad.37.1771353307166;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713d5dsm180261815ad.29.2026.02.17.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:35:06 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:00 +0530
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
Subject: Re: [PATCH RFC net-next 2/9] net: stmmac: qcom-ethqos: remove
 register field value obfuscations
Message-ID: <aZS01CotaSazpWvD@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX7HcVpAOYp85c
 Kol8pT8L5GAm0bwHEmny3uZ8DCNLlz7So48+ka6s6Lv5vzy0n2ssHdIJW9iXgDc74e7C30sRIal
 /0oGEpn9rqHZeOzhvu1EIgZz6aVDOVshld6PnFRSXsieyg/glzhMJFNd/6buQqSCV+O+x+7VR7Z
 lvmjIvY0QG89mRvX3rwGXJ0ndwGNjlTkx/6+Xf1Z2rxCCia0OUH4JpAIwUkaOcJgVNTy7T557+H
 g7GuqZGIAVwOpeYLjS/i+pVuQY5fIGN1F656SBjnyidLwI17KpqmdhAZNLIWjlJ8iXVS6CXZDI5
 C+g2MoJaCr1LrkEc2wiA7IdB2im9ffQCyrHHBXNhBXasllFGBIJnqIkJPaKansUmxWcAEhE9Zyl
 8+Ptxhakch86VavVeA5xtRzoeLt/pm1kvjszQ5He0a3wWO8QQ80OA8F2cB72UHL2Bs/wC7guwWs
 DVP3sTEANk+LgpSI24w==
X-Proofpoint-ORIG-GUID: Io8_of1JFVhuHZSOZKE1w86GB4fIhiUx
X-Proofpoint-GUID: Io8_of1JFVhuHZSOZKE1w86GB4fIhiUx
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994b4dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=eMU2cjtvKFU-KvXMnqsA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170151
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
	TAGGED_FROM(0.00)[bounces-93214-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 5DF7C14F31A
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:17:51AM +0000, Russell King (Oracle) wrote:
> Convert the register field values to something more human readable.
> 
> For example, using (BIT(29) | BIT(27)) to update a register field that
> consists of bits 29:27 is an obfuscated way of writing decimal 5 for
> this field. The comment above needs to explain that this value is 5.
> 
> Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
> decimal value 19 for the bitfield 16:8.
> 
> Fix these, and a few others by using FIELD_PREP(). While it means we
> have bare numeric constants, this is more preferable than having the
> obfuscation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

