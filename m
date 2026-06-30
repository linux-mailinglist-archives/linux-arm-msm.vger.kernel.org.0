Return-Path: <linux-arm-msm+bounces-115381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nOYzGYymQ2oveQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:20:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1A6E384E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=geaTFVZu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O+fxBZo4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115381-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115381-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40D83178B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FD63FCB22;
	Tue, 30 Jun 2026 11:10:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEF3FC5AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817804; cv=none; b=GatGhFkKDMm16RLy5aeSHUH4WqeA0S8RmZW8cWMzlte7e8JMWdQJoMFUCx2caGYQVglBMdwXpT/Us5cq55YKUFHXSfz7yxDKwBoPZqbvaPAgjf4yadAJhjCpHNJsb2Qr/+dbgvUaruGy5fWBBq29etHCJrsC9Lkdd0sIWWkas3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817804; c=relaxed/simple;
	bh=4gAfGqeCeRVqsOicRrvppeNGdqMmWwPXp4y9ei6B290=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tZLmy6c3iLgf8co6LQKsJsbGnapFim4h8r9KbeGd54VJVg0uACCYVuZ3vZTO6lkws/RI+pDCG3zz1qZo5myFIo9O+iBTzL4sI7TMPUuX2XnX3z5V/qFiJOj0SOWUYcZ9wujrosjWTNGlR8J1Bes0zhhOsHMuxNEuYU4DngGJ+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geaTFVZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+fxBZo4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mpfK1611513
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3nQCw5UjxNS30KSjgpkT46o4N+36B9c6Skaa5RF0tk=; b=geaTFVZuTh55EGFr
	ROVWS75OnECDmw8IH69yS8hFhbXF38RSeP3hve1YTAmJP0pt4dNN806qAwup9FZi
	U0qPgNYg1tyJMBqNIMhUTlU3wcPL8QUw6zsXk89VRkmyoUBLEjrOVHfme67/3wKM
	ZEQo97P8n6oVHBADH/GFbNN78BCB7gGgkxxBDwm/g0r2kG5SSEpoV7/bZll6gCBP
	oM+HvE2Ol9am/ljdqj4mX44loVbFnGLXekRRX1z6SrBsz74ffESSP0R51sUY7cdx
	f9/ZXbgjvSSRSTZhCnbWd1d7l1d4S4xB8qYBLm6qppqeeE2iXyLjN60+yMWoQ4Ra
	PjJRFQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt955-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:10:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b70ca7e5so9410286c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817802; x=1783422602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3nQCw5UjxNS30KSjgpkT46o4N+36B9c6Skaa5RF0tk=;
        b=O+fxBZo4fKXHOLroyD0OyRCll7HvoqkFxuO8Xltu8755F7hSqmC/xobnWb2VYybpFX
         77XINSoAl0oEI7cZqqcFtpnAFuasRekECiSzQERXFe3FwVKjgBqUiHEBd4u5DSmjTfGX
         AlcP0CfrAVsaVDpmvwHPKrzPU8ykMNF0KQTGpCdockKt2+lJz4UcCa+eXFyuHCZeePBL
         w3eS9zNaVy9LAT0W8hfdk1SKfEFbY0vxsMdmbDMtFikk8ga708KWhagWmv8xtzKmrgJ0
         tdL2U2c2oGtKbu7HY5ZLEp78YH0YqHtp92W0v+uk4asNrVzmKR1GZ68x+qPhICpHp0zm
         9Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817802; x=1783422602;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3nQCw5UjxNS30KSjgpkT46o4N+36B9c6Skaa5RF0tk=;
        b=b1IdR1ZyznKgmC3Hobpsr50I0mBpMNiyH8Ezqs7c1O0fOlQJhpT0VjJ5qPYzjiwk81
         bpXxqMF2WDGXK6AlcKS+MoWUmI64uhN6lSPKGYscsoMhseA60aY64blC5SZsJ8ewWuAC
         u/XjpSW2s933JAcfOlQM41qOIz9m82UEnLh3frEb45tRAOnqOdQKSYRXJNqS705JZDT0
         wEUF06b9+v3s17/x87YZM9BQGFw8+U6bMLJ9auD+oEQ/pVU68t7H+ZQ7v8CZNTH3zBtn
         RksA2XTNKVKPq5wnJGKJEbaOvZ/bDPNlAgoJQVBgbxfQZ/qsX+/kw/oPM637GLjwjjwZ
         niAQ==
X-Gm-Message-State: AOJu0YwFQd9ldJrZt5Bjg9XgODx38ep5rW/AboSJBfVxdPQOQKQb9QaO
	b4viuuWVt9NMm6lCPQWmGpw+H6lLzxNxokWNdVOTB92XherB4CH8q0U3Ipr9ruQY6Uyo2s7zC2b
	JoynplyRWPT6kKzW+yziEYQJnJTSq/3bwW9jL02dvJ2CT8fUDSKo9Twx4Wm1D4q4wxm5P
X-Gm-Gg: AfdE7cnT/6VLLAxxyXqfshnqQWMBNb173uZ6+sm3z7sJLMha8glAt2Soud4TT4dnAXk
	Z2+ezWJfqrLFWqzamByzZXBFO28HFBjaAc1Rd9glkcBC/pE4sDwgAHnCE9sdH6cWTgHtlgi/bcd
	ToFxg6BSY8bszZxxNPBO7Ci+hnxgRuozCoKyM47iq8faP10adgR1z9A6ykuNy5xTkkEM1ig4k88
	AD/AIcRJ3jxgWS7Kr5patRnS6t8anjTjLadWhmTWGb6nJELaHvOwMsv0+Ep54FaY01X12CtcaGc
	QZ5uSwv+sHs+WOJhvxUflHO4+jLuq9HIrUJlGjnrjTYcbG6BwGzRLNi58g7P0y/WaWKEapV+rcQ
	pY00CO36TkAsIpzvadsNz+DPXl6i7
X-Received: by 2002:a05:7022:384:b0:139:9ba1:dc06 with SMTP id a92af1059eb24-13b315931e5mr64797c88.38.1782817802315;
        Tue, 30 Jun 2026 04:10:02 -0700 (PDT)
X-Received: by 2002:a05:7022:384:b0:139:9ba1:dc06 with SMTP id a92af1059eb24-13b315931e5mr64759c88.38.1782817801342;
        Tue, 30 Jun 2026 04:10:01 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.202.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab20921sm5310930c88.4.2026.06.30.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:10:00 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add PCIe binding for IPQ9650 and IPQ5210
Message-Id: <178281779620.290473.1071815117567946655.b4-ty@b4>
Date: Tue, 30 Jun 2026 13:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX/JHAnGCCK85o
 D+cPS86rkI1dyZ88vn4jE5stUwvTrQzVpwaYalICIZIrJqYiiQXjpiEUQWOrPI0V1ETFk30c95a
 0Vi5xcrJVHaC0wRmZ+S+t6QFoQanCGY=
X-Proofpoint-ORIG-GUID: UUl1FM-RUYPYf-pJiXexcT0QGkrMmkB0
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43a40b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=d0NiXODO0fVjScRmrPHHeg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cte5UXN6-ljhghk535EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX0ks9NG9eQzt2
 4DXZE1SBMpODhfH5/icUhqKvE03pwfmAoB62OrpyOkKvUMmavbwg4rU59XfngfqH277im/Eyihb
 B0qBrFzRvj3tNXmwxD0tbgwdpcI8TW6v1bK7WXhEh6PeQxjW2vfTJFEFEtFjo6wT/0OYSYw483X
 ED1LhcA1Uqv0p7kEe1Y3ateFxscHPuhCb62JIIxBZqFRBjTDuyrZBp1TWyky5xaU6G16Z+99NPT
 xiOUkO/M7/pes3ivAjG2trujLebO1sEtzJJkV1YQF4gJg659u2D98OGCXkW87yS+5E0In5/lqIt
 c+vXGJVgXepoNRJZILavBarPZM7F8Qw+N6ghc66ALI6+ONdJ+YHyNr28YzKjB3HjyYkh/abO/pI
 soIKdAH3+UqQrVN1r7w16Put1POF+rDSYzM+mlTHOvPd641MTk5u+5G3VjKovIyRvCJT2FWPZE+
 GooezWiEiDqXxytuZuA==
X-Proofpoint-GUID: UUl1FM-RUYPYf-pJiXexcT0QGkrMmkB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115381-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8E1A6E384E


On Wed, 10 Jun 2026 16:30:52 +0530, Kathiravan Thirumoorthy wrote:
> Add the IPQ9650 and IPQ5210 PCIe compatible to the IPQ9574 binding, as the
> IPQ9650 and IPQ5210 controller is compatible with IPQ9574 and uses it as
> the fallback.
> 
> Make the global interrupt is required for these SoCs.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650 compatible
      commit: 5547ba1c0af0eeb0a37c0a51fe1bd0dcc4d0451c
[2/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the ipq5210 pcie controller
      commit: df045ed256f9b3a933466a1ff6903c75d4e5b629

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



