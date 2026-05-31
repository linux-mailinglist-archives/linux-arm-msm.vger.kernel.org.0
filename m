Return-Path: <linux-arm-msm+bounces-110476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 01lUIENWHGoGNAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:39:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EA616F0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 390F33004D3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 15:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8033390CA1;
	Sun, 31 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4IKnLfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfQgEJl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF72D94BA
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241984; cv=none; b=dL+UnPekzmRRFi0bTSV3TIZNyRobPaurNRfUacru4ULJ1pv2CzHhhv/aq1xVNkDiYUl5GsLR/AwDusWCBgckAvLdc0K4QQDXLnwoIGkpRH7Vlw4UuTKSlng0Wm326iKYb8Igg5rrWrvm+2NPFyBMhV0vbgrJIiGs1rl6o52u708=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241984; c=relaxed/simple;
	bh=pWT4YdL7aFrko36KfFrjfSC/48ZOWlYVkyea+ZXaa60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKK16975KGRbaMKfP0tuIfr7ErAZw7OKZ4JuEW/rVMRVMtjmE0mPHz+xaNGr2+PMZKE+c7raNw1oxn7gk/7lOg4vkN1R/Zi3f/c3LPCilCX8rcZ3PsnYkyQmP2IoxofNjCmxntSl8uotVC2L5UF7xU4ImA35t/GOy4axKIa+leQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4IKnLfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfQgEJl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VEoBKv2102186
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qRlXql9jyRKpeaWjVcXn6Fhm
	pC8o9vHCgk6e3sXjn8M=; b=X4IKnLfO24EOejgsmq7VTGK/SN3XuRdBwVBTReKr
	m8D+FbyceVeF8ARnmvB12/s2AFfSKPcqV+C3CgwUHV1FewaCI5SmOfR8IjF8ld4v
	BTZnWUMZbKUW3VZIksTc1s5SjCG7rHFU8MPuQQ6Shvdvh0uJKbGoQHKr1b/BHzZM
	+EsDYLiKeXqd5dntBBHmRmJowl+0AG61gHF7U6W+UV1zc9N5klcaozOoy+svFufK
	tFpWyOJPWgX663CPU0Ejojo+ye/VS5RBJqxNWkuBZh5xfg/MqnODS2gY4DDNL08N
	sW10C8Ud51T4bC7/M2XW7MaISj+ablEtnWroLIZhDMrkoA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hbsk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:39:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7670e38so468245241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780241981; x=1780846781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRlXql9jyRKpeaWjVcXn6FhmpC8o9vHCgk6e3sXjn8M=;
        b=CfQgEJl0TNGB2qDUdtyLGfHclScJEle2J3bQwDtf3nVg5bGkDncbsArHD0kyVBEsxd
         mfqGc6OmJyvUfHFIKIU61Ov1sCBifG0NbU+m6tqFII6CXbPs8AI5guGpbrO/NoyxTXBY
         Wr+NWKWEZD0VypAD9avuDxyfqzetEZFMS11UgCAIm2jAOQgCpEPAaCXMipLb4kUu7FEo
         lMv1rDBE1NutuSv4/SWPgCzD5IOOkcrWoEPetVb5QtmrNt6OzBIl3k+RnqMtLxhDEItG
         eZAp9s7cF9f0Qn0xSWRgQoA+3hAu6V6C9o7g5oBTk/k/F59FAsOdY0KXfw+QL1EWojIF
         yv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241981; x=1780846781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRlXql9jyRKpeaWjVcXn6FhmpC8o9vHCgk6e3sXjn8M=;
        b=DRAwjXtJiz44uf02Hup26KhpRj4P/R/Mwvta+UaHnYp8actkbdspjbeAwC896+vJpg
         imRjteQwOpU1s0EJRArPXHM3k5UI4fNOWsR1bamny+3Uysg9iIzgAtoqZqe6gAdr2sS0
         ITNF5tTuLcuL4VaFCU5UnqB+ZkZJ6OARnjSrnWhH9qcAdSsFjeyS7JH5U+UrE1/IITJt
         uCpTY0cuqadj0hNqfDSN3je7n4MO1TuNVn5tenbnd8oDvR7ACLtb0CMlbeZb4sgnX+4a
         MSpcVaHmWRQ9CogdsksOh2ECKGHFJt6ECEYpV4Qkd8H9FPbNJZDlTVHfywUMbhJnHP3R
         zQBA==
X-Forwarded-Encrypted: i=1; AFNElJ+/WThDzuoVopelPBbAalGsEle4lsN48gjd9iC2pw7sR7XZa3J1mquQEblJwyFNBaY9mq0t3vXjI9BBbvhw@vger.kernel.org
X-Gm-Message-State: AOJu0YzRP9IRD4svD0Sh9Gf/qtoxMKlj7f4g4Wr19Suj5W/fIb+OP11J
	s7fmlKPc1/Yo9jj8hxW6Es9w42g7McIHR/irqYGF7klR3jeXd5Sik6Dwo8nPcWrOEciTLxKVlsq
	5dmBg9+rZeL7erB3yq9XX9Fsom4juUhdu/5x+6IOD7qwh/D/Kta0Hry9UkZir8ULx+rUl
X-Gm-Gg: Acq92OExfW8usrFlHkjeUFbU44wbIp1CpfiT8SKmHCZuNUFXMPTd/sBZR5hpgUqpGjY
	sE+U0xkLBZ5LW4KKObCoqL2RNPj+Ox17jFBA48ezYNm2p9Xnto3loHzMohHhSYx0NJzt7vyRkwi
	0MkI7C16V/2AC4jTTO4KZckSe6r5h4LIjMOrQeJmMUw1A66U2UdzjbRDEy2VKH+YDs68W6Y/1mK
	bZJdYHQ4tP+DigSAqv9Gf2hnKtT8buLgxzc47Ehgvfg2GEZf8aBUQwRW252nu/VUP5mxYIvL4BA
	CZ0UzN7cWY6LaVU3CHHtqoVZIYYEeGXAC//TUze9quIyttmsoR3+7VBpRccCegM3FXmNsNKPWRw
	BIcGstVgPhxyjxdA95B/hZeHtnbXm/bXPmucV94UHt4F+IqxyfPMmnoOEaoCRkmkbb8WqUbXiJL
	m/sDwB9r1F/Oylwdrlo+oyWn6rca3vL8rweDLhPXLsrqlZyg==
X-Received: by 2002:a05:6102:46e9:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6d216332e91mr606218137.19.1780241981164;
        Sun, 31 May 2026 08:39:41 -0700 (PDT)
X-Received: by 2002:a05:6102:46e9:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6d216332e91mr606211137.19.1780241980779;
        Sun, 31 May 2026 08:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c31csm1538034e87.34.2026.05.31.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:39:39 -0700 (PDT)
Date: Sun, 31 May 2026 18:39:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: add mmcc-msm8660 clock IDs
Message-ID: <vkgiekx3gbbl7nbgtgul7bx4u7emz4bfo5i24ovxnuze63y2g7@tsdsmulnmpqh>
References: <cover.1780148149.git.github.com@herrie.org>
 <bab6d4e4c147c02987423141c0841bcc5d1eb045.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab6d4e4c147c02987423141c0841bcc5d1eb045.1780148149.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE2OSBTYWx0ZWRfX5zmzR35wbQ/O
 FVTpfNKaa1KkgF39LkBO99/JVumd8PVR537iQ75xfg+qMhIOaWtnVy0krpRRQ+yiXRtD4F4Fa0C
 Yd7JjxB43MAvuTnxJzlgAGwW7hSLr85cI8qM6Xg2w174YxCpRQjXbvJ3QLuuHTx/1if6A4GtATs
 Zv7Bmw+PRY7a0HntRSdHkc2ld0be7y3/4R2zyxNqBlA6RgURUzVDufKZ51z+PcpGVrSXpBWhLh6
 l03sABhE7bTjjR1W0OTvK8OjQWW2fT8mbcYh5GqnKAVruBPrKSchyr5JZ8zu2n7R8CgxZqOQ63y
 F6jgBymqFpxO0oefj0XQRSmxwTw8ewNK2lz304VkVr4nlo9HUzaZWglESI3sz1j07GdxYd1o2w2
 LcmZ+D2duu5PZZdNm6FmdrAFIMVPa9tACZNbwIeZTe6JgL4oXL4Os+10SfiJ5qmIdavnSCZ+2ZJ
 Q1KBU8PprBHPDh7rq6A==
X-Proofpoint-ORIG-GUID: dMEzz2V58HXAdC91cUt9tUx4UZ6TX9eb
X-Proofpoint-GUID: dMEzz2V58HXAdC91cUt9tUx4UZ6TX9eb
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1c563e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cTwmTnRGAAAA:8
 a=QThZvp3mIYKcT4gch-QA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,herrie.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 176EA616F0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 03:58:10PM +0200, Herman van Hazendonk wrote:
> Add the dt-binding clock-ID header for the MSM8x60 family
> (MSM8260/MSM8660/APQ8060) Multimedia Clock Controller (MMCC). The
> header enumerates the clocks and power-domains consumed by the
> multimedia subsystem (MDP4 display, Adreno A220 GPU, CAMSS image
> pipeline, VFE, Gemini JPEG, video codec, rotator, VPE and the GFX2D
> Z180 cores).
> 
> IDs intentionally match the numeric values used by the original
> shared mmcc-msm8960.h so the driver's clk array indexing is preserved;

Why?

> only the clocks actually implemented by mmcc-msm8660.c are defined.

Please also extend the qcom,mmcc.yaml to define pecularities of the
device.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  include/dt-bindings/clock/qcom,mmcc-msm8660.h | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8660.h
> 

-- 
With best wishes
Dmitry

