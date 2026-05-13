Return-Path: <linux-arm-msm+bounces-107369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J1iHD+VBGqrLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:14:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B473B535DB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 898EA33B440F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CA630675C;
	Wed, 13 May 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTlxDDph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDwa0Vp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1953DB628
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684100; cv=none; b=eaxEvHm5pJzMxk5uukUDuEul9MnCXskpEmR+jwIKc8SKS51xCjhNERk0EDG50BbSYd848VWpEZxkmbsenUZLK3CGVB/VM6YlGgb4gFqEPZOfYeeV3eQHudrT6wtVPuyHFOYXxXaB8F1dXwqwGzT8H6kDzejP+dzOBsc/hTdirtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684100; c=relaxed/simple;
	bh=/SZ4lgqUsAgCzmclIYPcnNzgg+iJvjG1BSdLoDV3NwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r0Jg9PSu3G9/xf6frB1ABDctIDa+NiyOwO47YyPfeWIC5pAGyIVT+dvD3amHYWA9l2CU0PdKmoZTB/DzhVxLw1lFAqlWsaFFN1moBqqI6DmUcDCQAZVIeDBoLxvlMcZxjwxo9tSHglEMKVz7ycLh9JtolN5rObAf65EtNkZ6duU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTlxDDph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDwa0Vp1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVIhA3430126
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=; b=XTlxDDphz9dNihO2
	/kDmXCMp1Vw92z7+otxHLWBzNfyuKRiw4zFiwt7aF1/5CWrNOOhcAO+xWwAWJ8gR
	CtILnL1U1JRVfP+Vn8ZiHzwQKMxLs6uMl1r1/rlErLa11zORtyodAPGdxapluCqE
	ec7hTSv7GYeGtgVIA8Lsfzruz1jAVFnWhX8dl3ZsgglJqODTuq3EF+3pUIrOrJ/2
	A39MxBDxMCQQScSmfiP2ztc1r7ytkhMZoD5nVYRQUrS4GF6B2G4gy+itf1ALpnhn
	0o6pCHyVDmRChCMaDiZcfvV0AzMtosdOYFU9ylVzTfJeFZkG8whEP9X19ZrLoikE
	kSky6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmch06s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:54:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so2636089a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684097; x=1779288897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=;
        b=YDwa0Vp14AdrCRnQ6t9gLD4EQwAI5U1dmHykdEWNHDvYfeiL3/ZRitXo5CsoSkXXqH
         9nMG/24qI47xqvfE4CgVd3OyM4ocfg7heNTtVmAfo2s6hbnaOAajxHRQmBxgGTLOPJcq
         XweXzebq7tTYBSTHVBD4JzXGfAvfAnEtz5YwqM9mMi/e25aDeRUv0gpDhb9u0SbpYlgb
         a90ed1V0V7BVEzWdRzUjQElY6D2MELkyi/IXJxlmKcfIkT0GVI2IrLG1hV5o6+nEkjI4
         7a29fc0E4defWXPMOeSc2J3u4/EK4xGQR42TqXBeE4R+SBOL058Msx4CctHSUieCPXx/
         crFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684097; x=1779288897;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=;
        b=Ykf9OVMBs4SNwfp0MsgGdXOMQPigo0q5t07qEHUFAFP62DplaFm6vSxOD5YBuYSKyA
         B8jDzOEepisurlde6YI8F/a2Sd9ng6c4nNCW46tCxFH+uBwjTwWKx3ElSRAtxw0qj4MG
         SbVuXuGcZLJB2wDx+Tpda/viNuSxhmqvndlFng6ctWOVJNB7pOdzC30VLIpDXWj1dmNF
         +8UvS8B+cmF2Ohc6fRLrD7IrHPD5ZHcSgM/762fD2QdXchAm5IPL0lX7RL/E/+tCIeWq
         3M+AnRKnOGR4uuJ7QJDve2q7BQ0whbhNHsV3n5rWGBRcfIlrkpx48dzBuoxmuILzJ5gp
         9dtA==
X-Forwarded-Encrypted: i=1; AFNElJ8HaxghHJeAlwSWMKa3o/i4EROMwLSX1eU1mehFKySaFTC/iVQvDAay6jSkDTEzNbz9fwL8pKtoCsvLklj+@vger.kernel.org
X-Gm-Message-State: AOJu0YxuiCLUBFQ8SLALs10WsmCx56BEpZJikhstTtdWqDxXXdQpR66m
	pNrjwXi3Te72PyT8z/03SjGcd1mnKHxd5cEfNHhypqlXMtTu3EjEotGxyIalUXVzl1Unn0edNYQ
	pZ66M7FRAh/meH0OApptre4WTrFxsst9qcXsn22UE02tHWa0to8SFBLnqTtc9qvgiZfHt
X-Gm-Gg: Acq92OEbQxUAdKoBA1uXXC6hovxTiDeFVcQQIUShVQdcevRM3kUNdyMWmjrG5OiRXcu
	mht3ay4kHem1jeUiTP1FnON6VxB0SctmuQ2KlaqP+AJWZxW58IlKz1tr7Sjcyh0zfZHwzht9a2B
	m+tuMKA3W2yk7Bq9vuM37rFgzi0+LJtHzaSJV2neVl9FRzItEhM67UQ9NFxqqwnfcZCRmOEMwOn
	386kgmxYjRmMR7qU+xXb8UL/NKfdb3VnHPvuCGmVeSEZBaEecXf8AH1xi/xFEigJatEBXnrNOsj
	US3sENS4spczmLrmmtXhg9t2yJqiEQ8o4bQITHcTLNUBd530i5y6s7SORK3uQm7OVJ0pQk/zW8w
	WEij2DjIQyviCOcsyuS9h
X-Received: by 2002:a05:6a00:2c86:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83f042b390amr4151473b3a.34.1778684097323;
        Wed, 13 May 2026 07:54:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c86:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83f042b390amr4151440b3a.34.1778684096733;
        Wed, 13 May 2026 07:54:56 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.195.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f38fsm26172053b3a.8.2026.05.13.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:54:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] PCI: qcom: Add D3cold support
Message-Id: <177868409227.23780.11104184283675036276.b4-ty@b4>
Date: Wed, 13 May 2026 20:24:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: r8jvsb4HHeXS63mdKYca0OK6v3dY4DNk
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0490c2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=QkUiPtlOeBxfVnO1KVo74A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=0YlPbCStZsfHY8mGD2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX6Fcv9QIk0QRj
 Z7NsVYwBR4hbF4INkUOFMmyHwA/SvOXuWpuRdrk5B1DrCNKJgqo79DYjtcZ1CgIzQWSPyeO5jal
 KlWcbZI44myhsI7++7yLm4lCrcErOxfkKPpFpUnisdRSIOO6/ABnkoLx/2ckt9xqIaEDwvQPb+Q
 NvX0sIP7H8TN4+KzttPrZ04FRUrA/F1fD2O3GdKJ6JvXHabGHaYbdtCu5W03C6L5iR73icTXjPP
 DeXpywXbay/Zp+eXz+r2zl4E3s5IkCYSb4sTdojXGZIUNAbLFA84UGPii5BCUayOogeY6c4gb+4
 7FCrfK4fRXJ3zGhBaNtk8/okN/psJA0RydMqswLmU3pcHNRcCJECfHiwPfMDz/Lwz4QzxW7qMZO
 lE4p0INm/YxFrvWgk1I+sv4SA4EfcZt6xpldl9KkEbqOB/XKbFkZpSAFt7pnyZtpuw3r7zfV8Sd
 Iljw0xVckF6OWMMHAGw==
X-Proofpoint-ORIG-GUID: r8jvsb4HHeXS63mdKYca0OK6v3dY4DNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152
X-Rspamd-Queue-Id: B473B535DB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107369-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action


On Wed, 29 Apr 2026 12:12:22 +0530, Krishna Chaitanya Chundru wrote:
> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.
> 
> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.
> 
> [...]

Applied, thanks!

[1/5] PCI: host-common: Add helper to determine host bridge D3cold eligibility
      commit: fdf2dc2b677c8a26573624ffcd8f4e2265a99b6f
[2/5] PCI: qcom: Add .get_ltssm() helper
      commit: 60aa688121667577f2f2e7d01c805277dbb75a89
[3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      commit: c3554c5ec37a490fc66480e10f00ac5bada8eb0e
[4/5] PCI: dwc: Use common D3cold eligibility helper in suspend path
      commit: f4f39b1fdb9445b1e4682fed6f86a2e327755acd
[5/5] PCI: qcom: Add D3cold support
      commit: 2ce984daf09332c09bdc26550d7b6cd4f12d3a6c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


