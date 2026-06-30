Return-Path: <linux-arm-msm+bounces-115495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XlhgGhXkQ2p8lAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:43:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980D6E60DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RUrDQsll;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=POLxHsWC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115495-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115495-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ECFC3093E00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5811451052;
	Tue, 30 Jun 2026 15:39:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3878F450909
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:39:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833948; cv=none; b=R+ghmNz5GCYNoRLgLZCsreCZpozKbOovJi2TQNQwGbUacyLCOy8jUy1uUgd3ttVONefPdMIohmO1pNnCeAWOGwbwRTl4SfqXNSjywXSWnWHxzkF8KTm2KDHI0/VtPS80i8zwhBQ5Co8Uts64bE98YcC9rg87ckDPju2yijFhS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833948; c=relaxed/simple;
	bh=OSbb7xN5YSikelytEh5wz4YfdTkKH7j3hgMOiOt73kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A54q/bbA75Yhd0qeOleHsWPS0ZQsfKU2ndL1c8VGrXbC/9dRYZAIHnj/acJ2AZuDyxmg3HWhHIJbRcMJZ39vW2KN1gFv3dyJpqM2pend9DjzriyP64kpcV+auGLbi/VWBwhR2gzSgUA8BZhOUM/luflENXAdw0hgpkWlP1Vlzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUrDQsll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POLxHsWC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDDG02213505
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=; b=RUrDQsllXRYC+LYR
	WIy833EfD7V3NyKC3r6FmzjuFAWk6Xr1MN6crwbDiJJsjksc325S8VTUwy/rUy53
	yW5WfQaeedbK/5l2kBIQ4Cg0xSMVq8vWXpPdi5dQByCmSOD/7vA8310+x+snelYc
	qbs/JaBSHUB9SRTZLDqTrMEUwBbNvCzQCh2ubAjeotl319Rv3sqpq5fhzTQn/ctP
	N/gyk64FQW6fKPWAAt5PcN8CjW1U0vOHYhwTZty0FtK2kz9trtyl+rkwCpMA4uHg
	xQlM8ee7tSv++oGZzDKjGfGjXjeubEMN7r7XpPNGPXttYjzw43ofbqcH0KJrtrA5
	EGYL0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fk0ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:39:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb5001ed8so5004245eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782833946; x=1783438746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=;
        b=POLxHsWCVrLNNjHZCdcRw8onQfYKWAXimHnrmSTzdAgdj223XOsUL2wzK8c/acReWa
         BUyhdoxsnO8+WFGaVM9LuwSOFVyCMkRYVqd2Ewy/Iin0OGKGxcDwfB4YUPHzr5atJETx
         qQ4RUeTtF9mVc/SBYKCa7mRsotmSSmmr4sR0kgZ7NryDnhOrmk2sRfLIFGOSfRiAPgUd
         0YuoF4FtYqBZaB0q6o1EETFYk5iCnDdQdA2NJNdHv/eRlUqvIUzgi9ecobQJ0Jn9vO27
         YTJtRNQaBx088PHKMkkUJ140egN2b1M+l/kG2BGns0hvrRMCLmkFkqksNJaJVEM3Dx+n
         62hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833946; x=1783438746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=;
        b=adMExnyLdl96AGIRIrHSv0l4znhzLjiOuX60grk8Aov6+q+5l/arrl4Lvn2HVHYtIX
         psKHJvr8XxPCPvMIjl+tkkUixKlxBTJLx2Rgj4kT8vLhns7mTR6xrPk58+sFSEismbuZ
         oDMB6NpiBvDo8hRsQhgkfXIceIsD5KjvdmY/Nmly4iCFvg7vfAunDQ2nyiuAEDCP4woz
         QAW8btuuKBPlZORkTDUtmBbdalXEfnkIeEBLgkxh5HlyQ9X9ajAqfXReGROHAoMUoDph
         UGPhKEgyjm3Aq/Y1VmFnOkDcstQPfwHSlF7qrzuxoi+fsPjav8Km8/KfHJTT4l7SfgT7
         t7QA==
X-Gm-Message-State: AOJu0Yx0ltVWyvQYLdRqRIOz9RZ25Z5tU7xUGJyWLEKQC/fVTHDWwGt9
	7zrkkJ7A5EhiqozuQ37VmNydnmvnUUwBb7nbzhqYDjX2EptSvrCIR7RpF3PYySTklj1g54gb463
	iovQJAMjdweSzvtKeMFeIMlbNkyjiER9gFhX8XX5Nsu+nURz7Jk9Sf3HyDMd0Bo2DLGM2
X-Gm-Gg: AfdE7cmHUw8kfNNAh2GvqJFCDY4jYBuCzbWfUZXQMJTiGhLJpXZAOJpWWHkViUCjzrY
	o+A4PIvLBlt5TWE9x484f/Jo2RuRJh3yHccpqqlcYgZIORPgEFHIKiCRjMIm/MUWLTdUwEmaN5b
	Gn59iY4IdAEyffTCb9kYXyFApA828Trq517Rx4IDaCT5ci48XjUxid5W6UcEMizN3AYn0vL9R5b
	feWDuOpwwlDVvrBB/Ew2xvc8IwN1r6D5IfA6vyKbl6awiuCJOvbG6Oa5OBKmU+3ZO6ay5JTGz7F
	r45TTmX9mvEyrWP7+pCLRZYgXDkCR0xMnHYbcVG0TWXVFTXFph7oxHLF+TdQFRZ21z3+Xh75dfC
	43GjfW5zKEQsfKCNQRrZ6QRhn7MxGzQ==
X-Received: by 2002:a05:7300:2151:b0:30b:ed93:5cdc with SMTP id 5a478bee46e88-30ef09e6c47mr732721eec.31.1782833945506;
        Tue, 30 Jun 2026 08:39:05 -0700 (PDT)
X-Received: by 2002:a05:7300:2151:b0:30b:ed93:5cdc with SMTP id 5a478bee46e88-30ef09e6c47mr732683eec.31.1782833944944;
        Tue, 30 Jun 2026 08:39:04 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5ed29sm10103096eec.1.2026.06.30.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:39:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] PCI: qcom: Add PCIe support for upcoming Hawi
 SoC
Message-Id: <178283393946.298268.1292819046120769296.b4-ty@b4>
Date: Tue, 30 Jun 2026 17:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0NyBTYWx0ZWRfX+4Urrkue4+Zf
 PcXaYM2wqyms/WD9dhtHaKIi4qy3QC+61VN08eTPO/Kb80TIZjXbjGOhjwKsmSmejNIYfGpQpJE
 FLBn9sNd4vfVr03wQ4lMb+oUuSE5xDIA/Q8sltABsZESrrbcsFXA/+hZN+4lrjpN8v/d//OHkcN
 CMS3L3tdp+oCWXt/eHTAh1tadiyuCL3q7Qc72u30QAN0ViK8eWeX5d6zWDdqXxR/YvIJPwuVrvG
 zQJBVyg6VKf5ldbaLWpxfSoMy8frnKTN35eOt2t/s0fRqsKfZgZwrRHbXzm33AvZC99iySY/MkT
 FLKjrz50h/g4YLV7pQmF4q69uJmKWjJEiZSe7Hhb9VsHMT1q/HxvACemKHbEytnL4iK1Hh06PBz
 0rgAYp6szIqMTuaENxmmnQz4R4t7QiHGVXw6iXDDWItLKg74cpf9wqFfgBYIcwS1WVuFcOtvwsZ
 ohrE7UU9nOl0icqpCiA==
X-Proofpoint-ORIG-GUID: jsnueUiUguIXgHvbOqTIhpNTnhviWfrf
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43e31a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WEtzvTudP8oR8f9B9VsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jsnueUiUguIXgHvbOqTIhpNTnhviWfrf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0NyBTYWx0ZWRfX190m7vYK1uCA
 CFT87fQ4UVDXXI/L4U0AAstQ4f9T1ItJtxEilKsXdMPachSoPwIJ/xFJi8o59Fkqvqf4vBmeAb6
 yJSf+Yppb0G+cheK7qHy6gp99NK9gy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115495-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:matthew.leung@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0980D6E60DD


On Thu, 25 Jun 2026 20:38:57 +0000, Matthew Leung wrote:
> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe controllers: one capable of Gen3 x2 operation
> and one capable of Gen4 x1 operation. The first patch adds the device
> tree bindings documentation for the Hawi PCIe controller, and the second
> patch adds driver support by enabling the Hawi compatible string in the
> existing qcom PCIe driver.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      commit: 6c3b60493693b7681bda206515a82cd3f99af543
[2/2] PCI: qcom: Add support for Hawi
      commit: 67db6fece5db59c5fd0d7c0a514eac5c7f37be8a

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



