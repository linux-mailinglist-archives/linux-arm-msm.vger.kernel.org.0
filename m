Return-Path: <linux-arm-msm+bounces-93219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHXHIuO1lGlMHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:39:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EAD14F41F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0799E3015B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27478374172;
	Tue, 17 Feb 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnMxNOFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG8eURxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B636E49A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353565; cv=none; b=bnH4WdbCss0DTpu+88S8ur4AtEh7ed2KBvfhLH1UuWkWkYhPv+ukfnAx/FTKdA3BDexhqlcIXspXivhEYWLYUltgx9rY/yBdBAS7LcME7rgoud+81/PSx7F+oRKl77g7UyGdFK6S41+9bzy6ekSPJiK+wGrYLh9FYVH+MRlAVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353565; c=relaxed/simple;
	bh=+V7Vl4YLN/CBb36rZ1VGqeTqLId5Ikd74J0lrmVM8sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeFd5MiOWW9ZDhPTAz57L4UD2b9d1ElXkUBsz/I8hVNz6Jh/9HqibER73zBFoLJ9TWAiJVhcX8Xo1YTTS6Jbh+Bx4Goao3Z+/tcMSkv8LPrMwzuIoOgx8nCU+lZE/idD1ROLDIC8jf/SNGkRnErHC1oLtQqCT6B5tzzeYPkRL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnMxNOFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG8eURxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBmIZj2331800
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HrP1EV3T54x1E7EsuxwJ7YEZ
	jkA7SuQSx7N9/VtPaic=; b=XnMxNOFA2nL3bBPtO0tGC9aKa0ddr3/TFFj3lql+
	OLwEaR61vOGo5OobG5tWWGPMXlHRCQ6VbxpjC7juDNVFex8dYWJr9h8fSJMzAqsk
	QfF9nWGB0+y1rq+o6ZpZAt2bHwH6LN5Ne7ZJvwkFIokvr5gpaMUwYI7vWaaMMTzu
	T0PNooiyLyxniBkd5QqjnoTglaHnsauLxybFqkADjbDK9euSUDGfrF8Wqxu7bD1X
	cKdC2BId1DTqMnOP8uFI/RplCaAy4SAbut8RVuXx6Eve3V0WKQ+Ks/EyX6q4NCqS
	sc9nxdPXDaKfhzHSt7IdyaCDsi8cGcOuzA6M4m2PdgGlsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmbdy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:39:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e78c4aa50so1077061a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353562; x=1771958362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=LG8eURxm8/4b3tJgOahu6xUVdi4lAPDTrFQqzVtWVFvGYeh355rd2qlr/U8XGmXU3c
         2DRgcwgupaz3H410o6mnwQTkRgrkgl9DejjlmKx7DNU3gY4+mN67emWAuKtoHX2j9NWM
         N/7+NBsesXOOPAMeRDN/jUuhFW6uf71s26S69oNQtsDUr+uerwFvCgD50ekgjrxW7C4n
         cCAZLvobcd2DGE9I997qzIiivYu/WPsHrd5rdyICbxkVKQDD6qjMv/BoxVp91bSLrYxo
         /Yv64rIGxBjK3qCBXTlam0pYzvEjbiekk0MD+HYxocSCcvgoRyYUGXi57bAov1HtMpG8
         BHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353562; x=1771958362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=Xw7rJ7f5NEy7XKrFIHBnLoKvmRcCiVaNlTrh3M+7UFDxkRTIPOkLBkl5FKF7rc4/kX
         CE2mfjy0mBzkUiKuSJ4qDaPXVoEIGxNUxsaUuved8xMa4TVXTJIugqQ2ZXcq4hrNWgqh
         CH+kFyqEe9Y6MZHWPb09hgknaB0xH0iBF49i3v99qpOxdQz91pqn+xHFu4pF5er5IgPS
         nBjeOOAPYFDVBiaPWPFbw9DznnoH+x6FI23sF9/iwBhRJuy5w6256qrzqkoMNdCJ+3Yi
         5H7A+hOjP+n3xNHkNdveSo/ThAjTiVPQKy5sIFk19iFy2SFfRtQJ+EKQ9er0cMLcMImc
         QyfA==
X-Forwarded-Encrypted: i=1; AJvYcCX2jsaTwUOOh0xzPQUu+t2VfPI5z5q6Se5N++YbE/k17MFpvY7Jtrbql9b4XWhTK/IJp6v1GPihFn/r7Ktp@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJSpNvr+wTmcu6nhGWXRq7Gcv4MMfUo5BlUmPFMgopbU7IRYe
	n9JpHUr7PJIXpR4GfU1hDgFCyCrf1tMyp38sM/L6QU9cYwGZs+7xAVOPVwtDe4OpYEYZzkD+g4W
	aJOikRttOj4SyXvnmOpECqTA8XdcKsptECKBwP6FoqAMP3F5/fsPXzzE+8MM3PFsgsr1t
X-Gm-Gg: AZuq6aKqMbT5j8M0y4gO9Vs4XLl5NQbEVHjth/GeG4zgkW+mY7Rm0nooyuG5MQq+6On
	hVsbukireZKsHxWK/QDjSfUW80tN4SfQGMICSNz3DECitXPx4IZj5cAa4OhrB+PNGxrjnncu2gT
	+DCOZ+ZQ5nGg1FimGd0uq69sEOPO5HpKrAzeQvMW0E9Wi4ais9215UzP3o2jKV4ERaz4g6VNJsq
	Hd48WTiKvZPtj+fB1FejIVVSKiN6fycokF2RrEkK3k9Rw37huftj8vt6jjfiAP9aPF/havfBcCp
	9HCpcrEl3URXlASu/LnPwip1Mujq0NrYi+7oF5Sqyc/zVDMiCLvNuPLF1NJNJiXb86XVJ+Qr7M/
	G/yiuvvxUnbGlh5k9WbAOnGIUVkMsOtq+BNQ=
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781191b3a.13.1771353561876;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781157b3a.13.1771353561363;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bba008sm13377726b3a.64.2026.02.17.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Date: Wed, 18 Feb 2026 00:09:14 +0530
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
Subject: Re: [PATCH RFC net-next 7/9] net: stmmac: qcom-ethqos: pass phy
 interface mode to configs
Message-ID: <aZS10liDHG0r6UJt@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: HPgIq3br1RC_gtT6kWfEaG7H_2Hu3PXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfXzhvvBGPS3KS1
 9UIqyd66zcvEJRZbIvPkigIWCpx/X5G1q3uUrbKlawaYNa1jYZetUxmAdo6Lb7BTDsHq9k4OUip
 IqZSkQGcfKGI9djNeQkbnfYo+FgAeqd9k7Tj42mSYj2GnjFsZ81X7lXSDJ/4PoC0N2SS3rCf1Kq
 rHD1KymXEC9jzHrsvdvl5cHR1rrdMHHh338eXx0mSjCNKldZXBwAPOCFkl9v5ZYDR3Fr4UPRDh8
 DyPafL7ezRsdqJVhvuyXIg6CLezM+Wwkg0JAtw22lXhuZ6VsaIVuKW1tNfgF8OKlANWbd1LIsz2
 c5HIc3hcDEaEIyYBv3++WwBVzJYaZCrNWNAjow4NnFNJRqos7fgr0ChSP8gjRdKCKf1t55BfN/t
 alrXre9k/Ej+swG5iPakKgwgvrIiSyf3G418APn8/esyJldPE+iV7NenNEEQPslziW+p1+hoKih
 Ap/Thv1tR2+lp/hyKcg==
X-Proofpoint-ORIG-GUID: HPgIq3br1RC_gtT6kWfEaG7H_2Hu3PXD
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994b5da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=VKYGXzwvPY_sFHXjFqMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93219-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,armlinux.org.uk:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 33EAD14F41F
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:16AM +0000, Russell King (Oracle) wrote:
> Pass the current phylink phy interface mode to the RGMII and "SGMII"
> configuration functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

