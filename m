Return-Path: <linux-arm-msm+bounces-103868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHxgCFHn5mkv1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:56:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE579435A31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ADE530160FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 02:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394ED282F02;
	Tue, 21 Apr 2026 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X44ieAHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTCAHQwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD2251795
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776740166; cv=none; b=MKWuh7fj5Ln4cTRHVIXpKXgiAkf4+rUvUMqcSBgxmnmkcF3My1IkFRMdhAmegau9MczxVCgl112pJPqcRnzW29ieNGlW0mvpNNccN+GKIDZp68HMKcW4x2DXsaQfFddtFTsht7juewNcbSDdUPzegs0ZfsNhokQJWI3W/qhhV7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776740166; c=relaxed/simple;
	bh=3ntnNaQppSr0HtRY9TtVltf7Ow1kZwK4jU/kwq0vBz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVB8xYi68k4P3JNPUgX0/jFVpGKZzAQ9t/o/p1H86bmy33k3ga0BY4jTKgVqsacKky38Daowp7CeYDGMkwLGp785+tTMoe+xW+DdJSLsQkdRdtNY1lOWfs6I7Bki/e3+ot18+rPSgTy9JsWXutSgsd4P5ZCvpIEyckh/yCuKJao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X44ieAHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTCAHQwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1N2kt2281664
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X236xrft1INzz2/WJiMckXZh
	pew2GYTkvpQgBGylDGk=; b=X44ieAHOiOor0nrdJJQMCC585wzfKecrykh763IA
	cX+Nl8bm38HNAWXj0NwWfy93rFse96S5iox06UlUcSV68WHBba6XHTkpW0UWH3um
	F/BspV5ZzifSfQn63WeFhW7d/DDqHPCt6cIjh2uNnWVp/0D8PHb/3HXBE8K32LXN
	hJQ4WdN4UTdkRbN8gZR6FNYV2UY7eZR3t60lGBiEfJs/Pn6rhYaCMO3TNscxR2/I
	Eu690ZrLE0lAbPLy72fweVy9q4XFHcfLA7kWTn1iFJ9vWh3NxtmD5wthDWe/zWEY
	RBck5DbevAXdBHhffbY4UVCn17NR6E1dK+8pbAVZ/zudSw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59bev1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:56:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c8ccc7593so2558188c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776740163; x=1777344963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X236xrft1INzz2/WJiMckXZhpew2GYTkvpQgBGylDGk=;
        b=VTCAHQwrSF0Q5AyrqpiI8+C6e9bIVDRrVu8KGG1eWfS/YJhNytqqPd5CYoARpLxbe0
         NNacAmUSp5AiqzurcaZYIZU6JOimtfSk09wNziXz3JFAETKdDYq3QKnzb6tcJQcERvBH
         UpcpBgPf467a5TuGegB4DGTZ9GZWrvt61fiM6t/nkeWHf9dpVldzsHs7zGjhOsMWXe0o
         RySCmOvhM/ULv8cEi8dfybxVU8EuEQJSa87SbIohQOG1nwe4K8lJmZmOwDZKlxYCtveG
         RTZQkyXwGTyJ4hYXwngCmPFKf26E899Gz3PYcZs/pv75aNTr9sfryMst0AXxGbHPSSwq
         yKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776740163; x=1777344963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X236xrft1INzz2/WJiMckXZhpew2GYTkvpQgBGylDGk=;
        b=ZWjWaX0SwTb9S9JAG5DRtAo5CRTSrGOQAJ2awvAtE1OFo7vqre0vfDN9jpYgupxalb
         SYd6Uq4dgdhCLHQ3zomRF/SCwSQvvuOiudsCLrx4iYeImgTkQhQJ5IVxfGo07KIb72f9
         i2YbxZRy82677kSW0X06/wuTyQf2KG25Yo3PwjFW1eNyG9c94TXJliF/cUSwC2/ievoD
         eYzY812yBD59/VZTK35BNMNuWAQrIrFOa9hntnUlwG6m599LQW+vteR+1fp4tA4iXTW1
         /UNUJ4KGtcXrTq8/aftG/vPoZaOKKnac+QwYS7bGCvzvG7wPfnYHvAofXvA9Ryr1I9fU
         QYbw==
X-Forwarded-Encrypted: i=1; AFNElJ/6iNSkg7To1Ed6PGL/+dV9lNK4+CYnAGdlJ6cP4echsHUHfZNRdO177f2z974HT7nVpW6FG+hF6TFj5Aor@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsklL2LAcWd84gpGZDt994kFPVPA58+AD24mUnwA5f3D4Inkw
	BhxY9QI6PiAJtAnW7eosgR89fpb8lhSUzlAsjshG6aHk6LhtGqYfulQlfqpY8NBxio+bAZef0IP
	jHenzOwJdrGM2IEBTi5PGw/cfp5tmgcmsb2MMNk9kCcxB1alTeNjJx31AE+n9IMw5dhM8
X-Gm-Gg: AeBDieuo+Z2U6dQIdQvXtTr0IfSiPZ98e9BoNwWF9mNkFVXd/0ltQ5jTXxCpIY6slWW
	eTBw3pXsXhRRIjx/STe+0IGp92bzPGVngzwd9GvlTNFm7CBHRUtteS/3UlINgwPEDMois4mIUmJ
	26gQWzypqB+1XCvFyZdOLOOb9sjMmWn+4eMWDpd+fAPsddnZoR5sBQIeg1wbGr5LYsJLxRytYyS
	6IM7DnZLhNs6iO4WoDVBiVC0WaXoGm2hux+BRFTFORlGB31pyC8frr2f3ScyyCnI02i79SN25kW
	sk046ZzV5XWHjDksAOv/q526d1fx+pUALDT6jGwTRX2RjDhKE9cQGBG/oPVXOj03xNMjy9SAeG9
	6x0JPNXzlPVxewcdCnlGhbxtQoOiDZ23NyOXt39WIpc+fJxWeHUXQZWwvFmmjkoqVHQW+FH3on6
	s=
X-Received: by 2002:a05:7022:f99:b0:128:d219:e169 with SMTP id a92af1059eb24-12c73f712acmr8365496c88.10.1776740162573;
        Mon, 20 Apr 2026 19:56:02 -0700 (PDT)
X-Received: by 2002:a05:7022:f99:b0:128:d219:e169 with SMTP id a92af1059eb24-12c73f712acmr8365482c88.10.1776740162021;
        Mon, 20 Apr 2026 19:56:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12da8b8fbc4sm4347880c88.4.2026.04.20.19.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:56:01 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:55:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Disable ASPM L0s for SA8775P
Message-ID: <aebnPAPLO8cI0H-J@QCOM-aGQu4IUr3Y>
References: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
 <453jc2ff65zdn3yahdwkdh2uqzz2coi4kv3siqfygfgmfd3v4w@4dkwj3s4dkfp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <453jc2ff65zdn3yahdwkdh2uqzz2coi4kv3siqfygfgmfd3v4w@4dkwj3s4dkfp>
X-Proofpoint-ORIG-GUID: BnbvCE3ABUSvsTtqdKakmrrlKkh9rti6
X-Proofpoint-GUID: BnbvCE3ABUSvsTtqdKakmrrlKkh9rti6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyNyBTYWx0ZWRfX+Axf7ugmtdPd
 9rJG9PLfogrm5Ba0Yb3siO7kL9svu5PzataPNITy+9eFuj91ywk/8UVyXjkpPQeXqXPyHtlm5sW
 YCYu9PjTNjeTwvJT4rerNuzukcVzJgoeKtAaP1DbiUWErX5zjdXiB3pb2NfMOzj3dRXHCg6YP1r
 tFt3nXVvuz492X9VGJl+E/DQbAbt8O9Ylr26qtzkSt72A7XJ8cu9su4y/uxMB36AaB/QChRRJ64
 Mw8UDBXNpALVbgYWzvrws1rFX3Rxb91EnJx1XSETEwY4ws72uUTqO47DhR/9O607jU2YfJDBE+p
 LNRzFpwvtDDv2OmBI+Q+uIcgzPX3PEPQPFyBDF/0KlQscK9K5LFby9+gm2N46PGp1KqxDlyDpbe
 fW0gHTWHfmypNRjbOMD7X0up7ANZQJa6K/6FuP8Zyy5nCJMLuz9yBuHNZYsWmJtPh2/Gwrtvq6z
 lQZ6eUS0d0FiqJY8Nkg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e6e743 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=A0J8VqqiQ3YToNBSq38A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210027
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
	TAGGED_FROM(0.00)[bounces-103868-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE579435A31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 12:08:25PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Apr 19, 2026 at 05:39:34PM +0800, Shawn Guo wrote:
> > Commit f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port
> > if iMSI-RX is used as MSI controller") removed MSI/MSI-X capabilities
> > from the Root Port on platforms using iMSI-RX (including SA8775P, which
> > has no msi-parent/msi-map in DT).  This causes PME and AER service
> > drivers to fall back from MSI to INTx.
> > 
> > With INTx-based PME active, the QCN9100 modem endpoint sends PME messages
> > during D-state transitions early in boot.  The level-triggered INTx
> > assertion coincides with ASPM L0s exit sequencing on SA8775P hardware,
> > causing Data Link Layer Replay Timer Timeout errors on both sides of the
> > link.
> > 
> 
> How did you conclude that INTx collides with ASPM L0s exit sequence? Also,
> AFAIK, L0s is supported and work well on this chipset.
> 
> What we are dealing with could be the board specific issue.

I just got looped into an internal discussion.  The issue seems to
be refgen voting related, so likely affects all Lemans (and Monaco)
boards with PCIe enabled.

Before a proper fix is available, 'pcie_aspm=off' on kernel cmdline is
suggested as a temporary workaround.

> > [   13.069528] pcieport 0000:00:00.0: PME: Signaling with IRQ 332
> > [   13.082436] pcieport 0000:00:00.0: AER: enabled with IRQ 332
> > [   13.082447] pcieport 0000:00:00.0: AER: Correctable error message received from 0000:01:00.0
> > [   13.101347] pci 0000:01:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Transmitter ID)
> > [   13.111281] pci 0000:01:00.0:   device [17cb:1103] error status/mask=00001000/0000e000
> > [   13.111284] pci 0000:01:00.0:    [12] Timeout
> > [   13.111313] pcieport 0000:00:00.0: AER: Multiple Correctable error message received from 0000:01:00.0
> > [   13.130512] pcieport 0000:00:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Transmitter ID)
> > [   13.130514] pcieport 0000:00:00.0:   device [17cb:0115] error status/mask=00001000/0000e000
> > [   13.130516] pcieport 0000:00:00.0:    [12] Timeout
> > 
> > Fix the PCIe regression on SA8775P/Lemans platform by adding no_l0s = true
> > to cfg_1_34_0 for SA8775P, so that PCI_EXP_LNKCAP_ASPM_L0S is cleared from
> > the Root Port and ASPM L0s is prevented from being negotiated.
> > 
> 
> No. This is not the correct fix. If we identify if this is a board issue, we
> need to disable L0s selectively using 'pcie,no-aspm-l0s' DT property defined in
> the Root Port DT node.
> 
> > Fixes: f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> > Assisted-by: Claude:claude-4-6-sonnet
> 
> Ok, this seems to be an AI slop. INTx is triggered through in-band messages and
> the link should be in L0 so that an endpoint can transmit these. So there is no
> way it could collide with L0s exit sequence as the link being in L0 is the
> pre-requisite for triggering INTx.

Thank you for the insight!  Indeed, I was asking help from AI as I do not
have too much expertise on PCIe ;)

Shawn

