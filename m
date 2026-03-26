Return-Path: <linux-arm-msm+bounces-100148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEK/CEh8xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:34:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BD33A2BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29DF13030574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81E21E531;
	Thu, 26 Mar 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRwTg0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/UDeD6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DF13932FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549766; cv=none; b=u8so25LwcDRpp6yqRSp/ebh4Pwog6g59A5JNUcJZ40prFpCK6FgnnG1IMOCVQ9zA6nVwm2p9cUAXS3atyegJ8Pgly01fw8HXX/8wRDpbyC3NIgLSjq2b9L2Tz77/cukbApIe7hWWO4HUSQMmkM53qU/8orSZQNW6CJFpnP7EKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549766; c=relaxed/simple;
	bh=2RnMYeqxbIG3xtIeWfFsB1hg5NMXMzWhzE+LRApt/Y4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hkh4yD1StM6HMfjeTm/QPfWhJNYN11xmwIC4cmGCLteMnyaqAEEU7v3QdoBcG4AfNTFJZAdaiQt8IdMaQiqOX8osUbgmDCnT+8xzjMYL0EbQkr+NoK+MCoDWnnlvtVi0sA+hJePpHWFYDgU2a2cUNttg0ISVEQJaOuwioHOQGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRwTg0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/UDeD6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI2x973757492
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=ENRwTg0wQgzSXmjb
	Mfte1+W3mldM2W+BFRwd5RobDOHcS6s8+faGOe2/GKEJD9WDyst+D6RhEif5zxkB
	f07S0mjqTvx+yjrj1RV22kPs2lTRdBsFTG8Bm6Flb9AIB6BxNP4kZeg7Mr4CeZiH
	r4AN05B/ZgCQNZqrsF40onb9wXoeab19z7+GnYtCUeQ3/EpHuqsyPDLIY1OTOPwj
	BpPfmU9Z0JNE9EFMybPlewCnDrMBcv008XOVT5vhTlktjiHVgD0LP49Omsr9vvQx
	3060uUgJI8cqVgNyDUGp9xoPwxoOzWirQICEKpKbwV6laGntEqoPrjAQGofLKPqP
	6chb/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1835x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c6929bd26so1922558b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774549762; x=1775154562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=W/UDeD6O18tHvDGa7kst2k80d5oAJl3xjE3cQAIPPHIleMcY0Mr9kCPnC12eEg+n+z
         WVL/qDRArNB7oLQaqeBw2a+L0r1+Og7bYFvCyXLfWyseZMX2IpuT9uGTTaVD2KmH3X9A
         jFnysuEfqHIUktET3NK7kgHdGWpU+UyxjJjTZwi2FT8YGcza4PY5Qed4GS2t7bYHXUdn
         oBaB59au76zFTLUO/+FBEtRRFmVGvsj++camGonUdHxBYTDkWDmVXrwa6rdM+e/9O+Ch
         gLdrtT1mMvAYtvtiSCEiW7pRVgvT0SRY9pSpIxIoY5MLlmsWEC7cclnzHnsM0AN1ck0O
         gzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549762; x=1775154562;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=K2eE9qxdFxcUMs0tlGiqv++Mx1YRh67sG6kJPXn5kVGUdHVY6EaM+rT45hbR4nF0ex
         36qXgoNqHyipbvbSuJBMECT3MshjhWnzGz1ZFLoUZnBPBk8NbP3oMgNSp9aEakkuyCWu
         fbpgIN3cxMmQzeEgAfGTGJ4Ja6eQSXwELBZDhzhUG/nImfrQbPvVV9sBucypDv8VY8Hi
         f6hHzdEyXGUu7MrLi7UkdvFrYXFhSzuFA9V83I8BxfQamMZ9U+hXPhziO5j0xpeCIXnL
         WBld5zgMqf6o/cZLqpka89s7k2YyUqAmTmIh2LWvJReQh8aM3YinQrPcw6yXLb2YgcRL
         Y7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWJzOKC1ZGMomBcW+ynjUgxx0f6g65jT6yecxg4hLhJTDLMsaJHzEhNh4+LNU+xKI2mSGzDcd3x+uYU0Tsx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyf92Uh8NkAP8h/uDK1ZKYgeglRYPFUdhqrN3AZXdAMG1w4IE9
	z+E6Id3fpbM5/DFkv9/pkK4Eh8kO/dHMdRX9Lxk5wgMwqn2tTSEv5Jgn/1nV0yjl9gUJmXVIc+X
	VxFZmjXKRlYyUMgpN3sFJ4Sz9kbvU4kz/n9ZhXIJ6KAr0iISyqJdmFC1oKp80UShGJMEYjxUS/n
	Hs
X-Gm-Gg: ATEYQzzFaAEPDdwYSCN5wxX4dKsHdJtA2MFvu+zaew6ilCV8Mndw6C8A12ymPOTl3pq
	1yEHabVGnrKcBrwUDumNdAV9ZbNMt+w+baA1hVgvemlRbm1BqP+WixdqtTqp1a0w9YhJ3Nb/CIr
	yVl4nH7Hzm3NEpXmPefCuF0229Z5H2GzDqi2MAz8I78CEBTSkUeb7v2eyH0bHzkCwJ72lXMblHB
	vDxalpGnvVlYvY0xgIKkJnedzt5B6KB0z6P295+v2Vd12TAkF04U4KxA5gn/HHHsqmL9g9xRmXE
	6vdx9gL9aVBnVvODwU1f0iyEz7bTiQgFfzyQGr8S3dFCzI0Rp7s4ConvvUU3bWqmOppuQDBn7DA
	DL+Vz2e3Ct+AMMkH7b2Xdpcw=
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829080b3a.47.1774549762467;
        Thu, 26 Mar 2026 11:29:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829059b3a.47.1774549761916;
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21777asm3568532b3a.18.2026.03.26.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org,
        bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
        jim2101024@gmail.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-Id: <177454975543.471319.11131195385745201008.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzMiBTYWx0ZWRfX2S7tiHa3UeBE
 xM5m78bD/uY181xGdxEz/vifCK3meV+yNBlX0GhyVfFoAP4rCJ1oRmkgr8tbalfMKZXLE+ClFFC
 ZjsplZMFVA1umryVv9xiFkmmtQnBwu4VxA0nW+ApqyvqIXZePywxS6KumvGb45TEUXgi1dd4GqD
 E40n2UdskuL90s7jFKd6hmgFhj5b7lxADpqEgiSsWN0BG3fniHuslDu4rhbFR1cyvVErtFN01dQ
 9NJCLPxXtC1bZdwf9vfTzq+5kMpwWvKt5WW7B5J8C5Gl9bLr0o7iC9BoQRGMiFEiYTKnfxhYWSV
 zM0iFcKNrPdQqmxqdbTkzzA8PUkxE4jl1a2LFsWC6uBM2PxN1sxnS8Au5AFBEGlvOIlI4l0D7S3
 6Zr3/L96laG34UK6c4STsTBTpDT4Hyl6KoqNCFgCxnqazMe3J8PtNz1pcb3LvRQ51vKhVLVKRJn
 37KACbEc5Fha4NyPDnA==
X-Proofpoint-GUID: T74fDMO8WvxniWLIDNhcGmC3llpn7AlO
X-Proofpoint-ORIG-GUID: T74fDMO8WvxniWLIDNhcGmC3llpn7AlO
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c57b03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=YByT1-VEI5v2HgF6YmoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260132
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100148-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 080BD33A2BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 14 Mar 2026 00:55:17 +0800, Hans Zhang wrote:
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> [...]

Applied, thanks!

[1/5] PCI: Add pcie_get_link_speed() helper for safe array access
      commit: df61f4732adf9de5ad1f5e71b7670710c1597d18
[2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
      commit: d884b0e51459175f17ddc52759ea4533bb752130
[3/5] PCI: j721e: Validate max-link-speed from DT
      commit: 1542ac6d83d0b5706f45e2937de7b4f7b8c4831d
[4/5] PCI: controller: Validate max-link-speed
      commit: d0cc5918a1d539344190cbb19fa3ae0e7b0dca1e
[5/5] PCI: of: Remove max-link-speed generation validation
      commit: 15217c7015c0e1804925693c55d721aad8987e32

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


