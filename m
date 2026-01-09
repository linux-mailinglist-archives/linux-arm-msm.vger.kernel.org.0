Return-Path: <linux-arm-msm+bounces-88233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00388D082C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FAFF30B0885
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EADB3590B5;
	Fri,  9 Jan 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkZmnFp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aACiz/7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1723590CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950593; cv=none; b=VsyGZPQru0m0DmdcVgOlgWarbn74IGgISDRUOR/Tp80OEkKr14ZBaV0iFqIVqvvjNrCeWGszDD//qtayrWx/ViQQSPM3l+zrBI5ANQ+9MxjzRWKgybStJwRhbV5AfGaVmPFe5aVhupGtbauPwH+U2Xll3YZEBSN6AaJ8Uwcnxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950593; c=relaxed/simple;
	bh=quyxddBCJbdfnj8ezjVDIXfGNJkfQjaJBRecYk19f+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KERGuR8ZxinGE6klKN9NddBcDFYX+4qW/EX1cVcQwHzLtDK/+XRx1lTxy64cOYId9lCNLrRpt31HaIloKTS84VSsAE9Grt8UaLz6cAUCBi45fv/VkGAnO2YKn7xJUU8ubUQfej1KN6Ff7Jc2grVbhzA+SFB/NllFisboBoAZGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkZmnFp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aACiz/7c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982WAs2183974
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gbUKEx6h2/06Jgs052NbO21m
	OGxgS4o/wlcmmWs0HKU=; b=IkZmnFp0ssSEw2M68/WhsH1X67QSMzV/C5LhtGce
	qKCNDI65tk0PMOFBkqxJWqBWqgfEBi2RQWbc4paLZz+fV3alGtMUM0PJcMOJUu9w
	q1Q/z0wmdH45Wyw5A2eVXDTkUaj3neguS08kB2okCa0jn9cYqC7g62A9XsiyIpr8
	pTH9eYnf0AVV3/nWDrGpb94Aqe2Dbf3mNpFvNdNIui5eJtRGtOZ5+Wcw7uFi+FsE
	eoDYqNCIgmSnjOt+SRW34+KslU7aIOuCNEILlNBk7sk9/uGivfRsa/YysrDni87a
	DfHdhmnRQOKq9/MIa4ExaCIaFjR0zGRkMB4So9NfuuEAoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn88nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:23:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c2bcf21a58so1099906485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950586; x=1768555386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbUKEx6h2/06Jgs052NbO21mOGxgS4o/wlcmmWs0HKU=;
        b=aACiz/7cnFp+MDLFFX4jFooYyEvVK+apFyKE72gOK1dIt/0ozDIFrT8+KpqrEcYQ7n
         GpyopJQaCSs93c+KQsD7xFjW7X6vC3JwchOPSUbS4iqpUURwW2fqNv3X6kp+S7EncFCU
         0PFAJsdwURM6NANhoTeNu6DrrWWQbD9Ylm8aKTFTPFsLa9b8fruoJby86soiFtHM5jZy
         18C93q/M+S27FFAEF1YDwpytGjCAzqKEN+5XYZXfZQvarPjf/aMWJ4ZkOYjucIGiskMj
         qJmdryU1S5S6MVwDMgBG5vCSk0qWmeCws+EINA7FxmjWuKLidsfn8ZioNAW2f7bfYUmT
         lyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950586; x=1768555386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbUKEx6h2/06Jgs052NbO21mOGxgS4o/wlcmmWs0HKU=;
        b=F6vuWVbGc+1F4uxJ9Nirf8hSSxO/SVYLpEbm0CwNuB/uTPs4K7gucRP8iBMHgo4VSo
         J3clOZtp58pqQj1tqppid7CLqc7eJu4yCNWJMgIwvCMMBW0sQo5pkShopePbHvB+2qmc
         AP/KkPvhZAd6tuv7UtXcm5rArKbpY3jJUCF38RMOaq9taH6yWAaJp+0iFuYqqkVn5JgS
         itENbQV11Y/PIEZHyt788QPml/Q4xbfKSdJ1tnesBB4lwZVki7mcpsitYZLp2AYnuI5F
         s/jjpedYANVYM2ASE1t/AhzpiU53WywXl/D7tOWQgG/oQfrnXMNCA8HoBsxbx1ipBhFQ
         /lKA==
X-Forwarded-Encrypted: i=1; AJvYcCV1iswHkTdX96ek17ndQAWdd9H4h+HrMK2p8l/GFw6FNuLAcDvC1sMbSV0unFIykiXST7TTGSBnR+N8q275@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVCe+lq5ZA7XeqiJlDHMHOFpTLu35T88OF/kr/u8NCbW15s7I
	+//U1dRU2l7JJ351Ezz59FbomoQNSFCnMuD3yLlBDyJzmp2tAny8ar6rurXB6Th6JlOLJPX9JBb
	zL9LGnbFqRy7WT68IIfEAaV0JRtLUgv11pBlqT0kk0gtkdbbpMOFBFXy4wZMWxwkEnl4C
X-Gm-Gg: AY/fxX4pFWaJQoaJaecLu3pra1VCboRKslBlf6zQYQoi7iCL5mA7XbEjqFtfw2xRLni
	qYZSxPHha2l6JVX85R2PAAbh+uJWFDV20aUakRjzaSQjyNM1n7fpx66phRJa2kf1e2YKBrA37Ex
	U7nBYo5xdRoSuJg6/EFu2pr46J4fNHDBnpUq6Lv4auUnYUsKNCc9Cr3ia804H+JSQCV1vo6oroe
	GGoiea4k5DKwdSTultqXxItWGAoHAnEYGBr3KOku27g2iGmjJ3/bSbni05IW9ny0Wjg5gz6PAbv
	/Ol410MfISDDc3C6ezL7De9FIthwxHwXA7YewWXJTtIlQqcZUDS4rm7m9DkHhVlB5h5XJgcUoGr
	jonsBU0mcfvmH5Gp3l83z
X-Received: by 2002:a05:620a:410e:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c38938dc0amr1108937085a.2.1767950586027;
        Fri, 09 Jan 2026 01:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDhJ4s/J+LZvq5xGGHQag3lnHCUa0+1Z4v9U1tVSQgONvR2YU99W2TOhbQzi8LO6OYwTHnkw==
X-Received: by 2002:a05:620a:410e:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c38938dc0amr1108934785a.2.1767950585336;
        Fri, 09 Jan 2026 01:23:05 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2340a2sm1072317666b.5.2026.01.09.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:23:04 -0800 (PST)
Date: Fri, 9 Jan 2026 11:23:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] phy: qcom: qmp-pcie: Skip PHY reset if already up
Message-ID: <3h7xe2k7iis4mmowvcq5mghneyyk64epcs2hg7fjrpowl6omfu@ltf6vi6mtx36>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
X-Proofpoint-GUID: GKBQtwtIT4fF1J8H4vAWMC9ffxp5x6ap
X-Proofpoint-ORIG-GUID: GKBQtwtIT4fF1J8H4vAWMC9ffxp5x6ap
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960c8fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q_-NVal78LaQRGvTYVYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX5GlLZIWXfE89
 rakySi82sc8oDfX4ku5u2Pdfa+DilPOFNz0T+A7niXwdJI6y9gCuRbNdaC/oQzBV9rZQnuAFgyl
 E9DSSSd1Xj+nuqfUlG/oEZIs3/xUfQH1BLH7Iktm51cwHWDcW+MEfoMTNOI/zrLycvtIovV1ONu
 LBunuqJtE08ti+6zWNrqh9PQPTLYQv84+YR8fBDLm6no+7wlijkKNb/nfiNj8jwbCQqpqLHwjTS
 75M9vGeAlM0k5RT5+LbNa7hquKT2vrWD712uyHdmy7ZmgL5XnCYYgsLzgneBowSs0InuLL0yaYy
 iTR2iELukApUAqCaWl3TvrPHUZ0cAN1mwXrbNFJ7ukVRmSouR57EdpxxW9yXyec/XDzhZs5E308
 apF2KhMWjLAl6sSqbbHozSLGFhBR0griB96tpqVlWjcwRv/3mFbE6OvSgqFFO4yrjeobbAPiueM
 k7xYfjW2N8RqGtNWQ0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 26-01-09 12:51:06, Krishna Chaitanya Chundru wrote:
> If the bootloader has already powered up the PCIe PHY, doing a full
> reset and waiting for it to come up again slows down boot time.
> 
> Add a check for PHY status and skip the reset steps when the PHY is
> already active. In this case, only enable the required resources during
> power-on. This works alongside the existing logic that skips the init
> sequence.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

