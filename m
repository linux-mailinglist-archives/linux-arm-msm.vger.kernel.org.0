Return-Path: <linux-arm-msm+bounces-115525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ExlyImcTRGpGoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D25166E7661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hS54l00K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j+gyJzl8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D328730356F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF315386C0A;
	Tue, 30 Jun 2026 19:03:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696ED367294
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846201; cv=none; b=XBQ48/cUAsgtOFZeda6HQsleyOm1pDVc5iBvgZOccB0Ab5L5LUnRmjyR45qPGVFQr5mqqfAZXyNnBX/5DuPkY/o1G0JRTTefF6Dz7YMbVVoFXwBKk/ljKerIvPWthQQTzls9SFIScdzTH149yYArWkpzmDsfpthuBo7TH36puCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846201; c=relaxed/simple;
	bh=LvlwbbSfGWB/DCQMdh/o6bn7mfpSa5BBkE//6kj5XNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CyHDWRuNDgK9WaSoeB0QCmMiD7a8uPBS9m5Ti/OKsXPdTQLG+w0OypJCB4fVQZmdg0nT+a5TWbLKa8RdpV9k3pGPQwO6wBcI+eiQiDkz+DAjsTyeHrEnvfyNJbr9nP9i9IePbEsXCjv66pTE5hr0RhfwIU+omtIVr6rJOC1LjgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS54l00K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+gyJzl8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkfbd2723780
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=54AYRgZXvf1coJSYDJ7gWV
	G1vab9Ivg+RUjNrzNJr9E=; b=hS54l00KM3CPK3ibO6D+sKBkMYZKKW5zBhBPMj
	FQoaKd34lrUQNQ4vqR06liGGQzQUFZCqquOZbaiV++D/oP9/26pv+3FxHl/KFMH1
	UDPBtcWORSPnx0Ne4lh94tmcOEAnWcp7bgSCJfEpVIHi8bfrgm3EkfYLwB1aFx2l
	yjaTC5dWjU0xLvtRQgB+xACEtYJSyD1BlBwHqJNoz1OK5Rfe6SKQXoDVvmVYGKjM
	U7k8iC1RWLXCp/hD+0yl+aZKHwk2Uz819LAB10UU4C1wItrkwVZoNjv7Q6lfv6FL
	SVE7HVRmpgHMFmnw9VnSf4FJlOa+oGBtuhDmYqAzJ0e5v3oQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpts45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so675479eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846198; x=1783450998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54AYRgZXvf1coJSYDJ7gWVG1vab9Ivg+RUjNrzNJr9E=;
        b=j+gyJzl8lJ7hHfhpCdiB2cu9ZTKGEsShylZdNbDVspvb3bUuPQOfBmaMapdRZEClBy
         BYqqMvD6fzdL09Z/W4KTzfACiZZIRE00E7ufqyxp0rQC+3gD/U6v7uc+8/yxC8ZV0Gzt
         y7gUTFUK1MI0m/0IGYEg/izkWPVANpyxj2Wk+Ml1UBCAXwrcBOFvzm7waS1Xzv24069o
         tw9uFSjVDpUMApuJUpOWe4yHBm54mFxwNCapJ8hD78A4v3N4yDZQsrsZsM0gT+rLa9tb
         r/uj/5gkZLbcOgOKRsLjbNmFp4lefZky4FSQdHtEtsgYHkpFlrXhjov8rBO07HuzqfMT
         0w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846198; x=1783450998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54AYRgZXvf1coJSYDJ7gWVG1vab9Ivg+RUjNrzNJr9E=;
        b=A5mrjNTunkUEezVtTbTUUcHeX1tWv8HfQjmIYG7WoT2tFX/cbF/v2FNdl2DMf1Z0jU
         2Vf4eEyg2D2vpHdMRyDhQZ6bG1XEybvxblt3Ypcgdff0svPw6W8LwdDN9UoF96VSnuv/
         Hmog6qaltT2DX5P29Di7ezRH62Q8VDx1QlfzBYVU5a3cRRVPIU7XqKsthBUKexrytFNo
         W1iQfSE3ULvAcyTC6GBMT/KbIkrze1R5WJT+y0wMNNDha8vMrvUaSGN0rfstgHILfchb
         NuET9cUbSORB57X1RM4iiAT5HV9DUh6F7MuYDsyVb+ZSZFfyw0Aee2mbzNSnqyGgVXQ1
         Wgqg==
X-Gm-Message-State: AOJu0Yz7/O1FlCqWhu4Ocg3YqUbU2lM8WSPzdYzpgeR8Wf3SZr6rlYOA
	fedLMYcQsvDPPNpXq4LLRnVfRfJiF2YJUwsEfWMo4hGRtCgVtD39JTlGkke9NQTstOjPEDQweY7
	XuQebMYKp/5gzmhMtkGvdIG0ONj81YQ+lHjQwJFcZIb8pUF0qF4P6I8h3coIlM/APlAYd
X-Gm-Gg: AfdE7ckn4CmFaceWHz4Wfxut1jaDUGxm1EGqb33dNpOv9erYsQg79/4KsjXWV3dvBpc
	auJm2uvmkW+7cICL9rlzB8ZJFOSWbm6iAEA4wIjO6rLVbZbTsMCX5CUBWP9LmYhfWhdTOWL6DfX
	N418Q8q/YYKI7HPoQudD8znq7XcqCh8cGV2sgOJ4PKf+Y4ynnIgYhzaxGWmDTq71lopltLY6Z1Q
	Mfmy++6Zu735P/xOz2sEVgeicFXoJoLbhz49iuhW9EMsTUyljTGXaVW0mjr7QairyZpwgEnJ94p
	L10oBvqyiMPwTB98R8/mXC8ihHhCLeyOh7MzX+hor70/Mzk2mY8l+hbbiV76CA3xixTKeoFH6G1
	UXMm7LnTOglP1tS1gK2NmGQ6XdY0YoNDwbMmGXwb6TEseXVc=
X-Received: by 2002:a05:7301:e02:b0:30c:6025:da8a with SMTP id 5a478bee46e88-30ee134962dmr4071757eec.14.1782846197979;
        Tue, 30 Jun 2026 12:03:17 -0700 (PDT)
X-Received: by 2002:a05:7301:e02:b0:30c:6025:da8a with SMTP id 5a478bee46e88-30ee134962dmr4071698eec.14.1782846197362;
        Tue, 30 Jun 2026 12:03:17 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:16 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH 0/9] PCI: qcom: Add PCIe support for Shikra SoC
Date: Wed, 01 Jul 2026 00:32:42 +0530
Message-Id: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANISRGoC/x3MzQpAUBBA4VfRrN2akS55FVlcDCb5aQYpeXc3y
 29xzgPGKmxQJQ8oX2KyrRGUJtBNYR3ZSR8NGWYeCyRnk8wa3LnboRwWR3lbel8OhEgQq115kPs
 /1s37foi1EFVhAAAA
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=2304;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=LvlwbbSfGWB/DCQMdh/o6bn7mfpSa5BBkE//6kj5XNQ=;
 b=3763bsqpx1pPGmDO0q0eQLi+UTbzjWu7ITIUvsYsUGaOWDX8P5RJYqmMHKnQYZmHQ3zKg/ClK
 xZZ8ExeoEK6CkefBKEg/3J2RCJy7MpS0xinHTnq6FQpeWGyLNJYnjmk
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: USygvV12HWXTckW-otqYEcTI7WX6k8ot
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a4412f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0S22rWqy9xk-ZxXqdxcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX/iqkPfijELru
 85ufjQqgA3sWHu1QB++anq1TCC+1Woq4m2bd4S5ctIuygk/PFjrK77fta2mWaEk0KwPllN/fN0j
 l27M/F1+9H7pZa9oRQOBRtEoiQC9Q581Yzdq+Ah5sL/7Hm3bQQe6ibcV2wTgjYy0J3WIzwp5Uo0
 B0uGWg5zvRe+NdiOZedeVmdYvpOhfUzUgPNXJTV1W6Swxz+NdcSC4OS+a9kwZgqdnKSEDfxL+Az
 iV2w92dHH2dlIUOMYU+SQ3Dwx/KYJyp+7kvnM+fwONo6gMFvVPoctH7MSJwzLO8NNOAsHwyNiU2
 yCkyWDDFtVEye3sSmlSPAKWjmbKG6BcCRyr1AyBvN0SdgGYoS0cMUxkCtHxNcuP/zUcbmt+9yMO
 vOstFYN9kn4HXQl4g9OWyigxFr0qeH8EQoQdJLs+NpgP8p+/NQKQ3w+muoIBS1U2v1VUs18Y0kL
 yOzf2cywrM4pJbuxELw==
X-Proofpoint-ORIG-GUID: USygvV12HWXTckW-otqYEcTI7WX6k8ot
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX1Is/c+eHhhK8
 FHtTNFRwncE7MT2OfryykqzkP4I6JkfjIBWSNrfOG/xQnJedJzuZx4neA0SSuwB5qK60l9559JI
 HPXiNp/RXUazQa6PEF+wpXx+FYIu/MI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115525-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25166E7661

Add PCIe support for Shikra target, by adding dt-bindings for phy,
controller and corresponding phy & controller drivers/device-tree
changes.

Shikra RC is connected to TC9563 PCIe switch on all three
EVK variants: CQS, CQM and IQS. The individual downstream ports
of TC9563 connect like below:

DSP1: M.2 B-Key for 5G Modem
DSP2: M.2 M-Key for NVMe
DSP3: Embedded ethernet device

Power and reset to M.2 B and M.2 M slot are controlled via
TC9563 GPIO's. Hence, add DT nodes to enable TC9563 switch
and include corresponding changes to configure power/reset
to TC9563 endpoints as part of power on sequence.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
Sushrut Shree Trivedi (9):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra PCIe phy
      dt-bindings: PCI: qcom: Document the Shikra PCIe Controller
      dt-bindings: PCI: Add bindings for endpoint gpios
      PCI: qcom: Add support for Shikra
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Shikra
      PCI/pwrctrl: tc9563: Add API to control endpoint power and reset
      arm64: dts: qcom: shikra: Add PCIe PHY and controller nodes
      arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch node for PCIe
      arm64: dts: qcom: shikra-(cqm/cqs/iqs)-evk: Enable PCIe PHY node

 .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  22 ++-
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           | 152 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 154 +++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 152 ++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  73 +++++++
 11 files changed, 764 insertions(+), 24 deletions(-)
---
base-commit: 565fa02f75448ce1ddd18bda6b31ad985cf75411
change-id: 20260701-shikra-upstream-14b8668f1001

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>


