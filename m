Return-Path: <linux-arm-msm+bounces-85641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D8CCAB0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446113033729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 07:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DC1322C98;
	Thu, 18 Dec 2025 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqgYZDk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMp3WXQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AB263F34
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043357; cv=none; b=iFfg0yVvmbUsQKYUkMh0WGSEOQwgOP34gJKR5jnkVhFVmX//nP31X9WuFOrbOZNcBKZTByjExRwADcB8dOKVE6cWVZORnfLrnNtUXpK0UUeB9gqlrkvA6PDpFpjWmy2nnSD0bwienOuYisSoOfEvj9xHOSWNQ70Pb9XoXe1qmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043357; c=relaxed/simple;
	bh=6n+IMOSEgat3Tj18bXe0zNndbG7l2DlP/cMSc/3HqsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oWKfB2Br7GpOMjs/rhyuAdy0aGW+vZjkBNPw3oKi0XVDPpRFrrNJ6A+BB6FfOyK7eWCc5fp3RvQiWq1xoQWxZLRbY0JfLZZEBCmjp27seUk9w8n6lfVyM/yebaXbV/+YlmLGyV/ef12LElwd9X4IFER0zV5TrwNrnuWbV4qbCiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqgYZDk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMp3WXQb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YU9r174246
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyBiHIU9DR8DtiBtV6NrK7oc04ZzyQThNtKsERGP6ng=; b=MqgYZDk3AmTfzrrN
	r+9LeOJRAY+zIhqzfcEzCtUIIpNP3uuyowbbMv+FSwd7MFmViBu1vRse2b3/kkiX
	Gd/E6BQqMdWd1yZoMuiSYxa/ZAGsNkitBRSQAC2Bl37BD37xakeW9/p08gutrvdk
	kbIc+tO0poQ0jxiWdwrDrZ8shLExsIyydVQehgvFePfCEtJ/wEuu2vQ76BfvxHxY
	FjMHB55oKpHWtUO+IaMcnAyE3HWjoJa0gDEORCq11mBPGVtzffkHVifj8onXmeIy
	NCrXmTX7ZmBnTJnkdw8/VJyUmY8yIavCfQfuwHjlbCoRu4zoU9zxhvNBgZl195bl
	zKSoXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmskg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:35:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso989670a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 23:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766043353; x=1766648153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyBiHIU9DR8DtiBtV6NrK7oc04ZzyQThNtKsERGP6ng=;
        b=BMp3WXQbOrrYtTi/Q+aveZF/1REblMeyBtVMWmzpwAEuw1v95sdnFyA+js4HdqgVrv
         4oGHpOR441+QsJglw1HURzcuGK2/7uIs80EMl00f25IP1bjfAPjd30QeJ+21BzgffyW4
         Q3gnSahsuxDd7QoQDTsc8FHaFpldowgRK5gBM3vccc7HI7K5wqBilaWZ8/8CFhSA1mzp
         sTdTxRtbnuDmG+eUPEMZ0nWcBAXDwejRk6fQcXtkWCxG8anPoVlakPro+1wonMa2m4pF
         JqgsTuPzbn2vq9tb5ktH1M+aaao5ZTjRhTK5bij9Evs2ZV44tMVJr8puuNTyJFMlbZUN
         OXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043353; x=1766648153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DyBiHIU9DR8DtiBtV6NrK7oc04ZzyQThNtKsERGP6ng=;
        b=q2YcAmM7hFRwsRknE+3kZlFP/7Od4s+pt+/flzflzVxLAbvrvxgepP1GYmZxrW4KS7
         cgfdT3vwUZCRzrPeo6Jtu8l3Hqp4tmzntzSqapdEvrHiH3xJZ3Lx66SYl+5Oj/hBUikO
         TZEd7Uaqp5MR72KQvN/ljuiVLnMsjN6Ur7RGT7H95iei1xCeg5sxPGFJg7iiJVuAxlPm
         /1G4Dw9lTmhzecFzGwwmHWQUoGjdPWaxOkA9GpZtjFh7l5Ah0YuGCUFSHx3l2hoDAFdu
         Aw0Si0T/pjzdWc2s+gKvPWXDi1BuKANy/l+e8RAxPABpqqR4fNrkw04TMrbTs89kgqyg
         Ppwg==
X-Forwarded-Encrypted: i=1; AJvYcCVaT7R9UbZRP2Fh+n2O4eYPKf+FZeLoKZFSWL31sK1DIsnu/TNfJUjE6bxh6QYCW9NAE0QKpAIMqUd7DJz+@vger.kernel.org
X-Gm-Message-State: AOJu0YwUYm+HjOtr4mGeNywvpDz4bCv1LYY0s9PSvEGef4vb92Mw/x+B
	Iy1+2Wlw3iB1og16VqDeqBLVktn8wxG7h8F4qSREcX5yef+W4NfDavnpjcTPXS69RM/20fyOfPP
	ZyHfV3wWd17q+yKxNZZEhfillAJhJIOj9hJM1z5UB8CYhalcc0TXXNhWPTApg/ATdMSS5
X-Gm-Gg: AY/fxX5ohoXswPjt5udTXZRDysGLjg3WV4V4pNT3AaxhnvpY0HzqsubAgpSnWK7txth
	lgPV3fCEW9g4SCPdMQfP+ld/QWVRtzbU/b9YV1bM478UFm3opSb/TwJSSALtprdqrH2rJKtoGeu
	RW5JWhOhs84Ap4rb5fLBPNDiRSBKTHStr9nmpPS9zzEe5G0Pekk+c0SmeZbtPCM8ksfbHFL//fy
	JD18N3VZHdOEYyLFqABT/ymcSvinRk+qBVCwqWPVRUKT+FzZfDnFvgVM/8YRA9kVk7Drxem6tfW
	0H5tj4m+tQUJH+jEJ7Y6u00lA9BSH/83W034v62e1NaAmjqZUkFoa4Y64mqLzJ3YcIwzxAU4T1P
	FvBqqi5/w0hE=
X-Received: by 2002:a17:90b:5883:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-34c2db65c0amr17034940a91.0.1766043353126;
        Wed, 17 Dec 2025 23:35:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw8FXg1nPzbXznGbhv/sFTHWfXcEofsq6S8QK2Bcfzct8iGZQISvvb554tA14/5OShVw5wXA==
X-Received: by 2002:a17:90b:5883:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-34c2db65c0amr17034935a91.0.1766043352602;
        Wed, 17 Dec 2025 23:35:52 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbc9d6sm1583665a91.10.2025.12.17.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:35:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
In-Reply-To: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
References: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] PCI: Remove unsupported or incomplete PCIe
 Capabilities
Message-Id: <176604334948.837916.5544634528057993616.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 13:05:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: eegTJKRD4V-GQ2BI4FR7NWVaAj8nwmxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2MSBTYWx0ZWRfX8rZKSy7fPv5j
 AcXE9VEqMEokk34egIsgsLDq9GTvhGNhBQPxmU6/a/qb8R7TiR7Lr1ZUvMvsvmhQnj9YESl/xAO
 HqhbM8VJbee3YSxpv+r6HecHTRttoNm1kZidd3aWu//2SkS1AQoEq3lerbrzqXld1yFSBGCmAto
 vtU1Rp5699ALAUfl5rggAqwxyJ3TrvcRsQ/aMtg23R9EyGiMjAo03fTIXK/TVg8YEPKhwLu0Azi
 eBFrb7BSiwuve65bmOnFBl+5o3ED6dazZAxbXldeRkjWSc6VecZ717WZvEzQh6IgAhKs/5Rxyyi
 H6H1sMmsLmPC1pnaRD9ydpsWNDp2A8KVQb2+nk3fuPN4lEGaqS6PUt26uXrTGmSS1M8l2NurPb0
 QxwC7J9JoJjhCx0qrNpnMnu30bOpLQ==
X-Proofpoint-ORIG-GUID: eegTJKRD4V-GQ2BI4FR7NWVaAj8nwmxw
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6943aeda cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=15xY4BtIdfvhjXbsFDsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180061


On Sun, 09 Nov 2025 22:59:39 -0800, Qiang Yu wrote:
> This patch series addresses issues where certain PCIe Standard or Extended
> Capabilities are advertised by the controller, but not fully or at all
> implemented in hardware. Exposing such capabilities to the PCI framework
> can lead to unexpected or undefined behavior.
> 
> The series consists of two main parts:
> 
> [...]

Applied, thanks!

[1/5] PCI: Add preceding capability position support and update drivers
      commit: a2582e05e39adf9ab82a02561cd6f70738540ae0
[2/5] PCI: dwc: Add new APIs to remove standard and extended Capability
      commit: 0183562f1e824c0ca6c918309a0978e9a269af3e
[3/5] PCI: dwc: Remove MSI/MSIX capability if iMSI-RX is used as MSI controller
      commit: f5cd8a929c825ad4df3972df041ad62ad84ca6c9
[4/5] PCI: qcom: Remove MSI-X Capability for Root Ports
      commit: 7c29cd0fdc07e5e21202fdeed0b63cba2b4f10c6
[5/5] PCI: qcom: Remove DPC Extended Capability
      commit: 6a1394990902f0393706d7f96f58c21d88b65df7

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


