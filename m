Return-Path: <linux-arm-msm+bounces-107953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBtvGbpTB2oqywIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05926554908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5ADD03049AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB7C4C6EF9;
	Fri, 15 May 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+KT3E+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfcwHV0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B332949E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863956; cv=none; b=H7FdLBDGLTE8lRWxzgCBWdI6mo1uNrXiynDZe2S7Umc3Kx2sh8KgrJw5pt8a27vTytu+BwoT7/hrAE5s5dGC5ajN/ytyNi1XG7boBZcE4yqGEgVuXqpaDPGxzK0N6rnbzg7cAA91ae0du21/eSUZjctKroGDIE2poiEvXdNhhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863956; c=relaxed/simple;
	bh=T3GjOTpYeHPz53pVwWaV3M8mUgMyc/KwFdDndBzPMLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZQU5OurVFJQPKKBcjqfUd8CCiiTCMHHkE7S0BMAYDASBGia5dJSII/iCS1RZ4B2RbE9mCsPrhh0PCysBA9CJnAqlwNvh7XM4UY3t4DeiDLF2bp4cB5BEe0fBlJsBqtPobh30Pp3pi8fL9KPJrSWOcYlQvwQ5eDNpKcDv6hMdkb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+KT3E+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfcwHV0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAoC7q3512955
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/E17C5QueuzhDFwixsSiDn3qQUgxnX0ykvGt2FzYvao=; b=X+KT3E+834oakU/J
	eVSbdNhZYzTmaAMsh5iuoaPwLN9ekmHaPUFkui8Ht7UfHp6aeV/hbyxtCwK9UAkT
	3jKs2oLBbDMjDgdOWxpk7KsX/oM7/XhPmuRnQG0w1rG2AIo9TN+AUi6TH35bfaCo
	T19xt2PwsmiIcq3uCTQEd9Oo/YLDa3Hj5VNCllWaat0JqL7oixEB8HMP/KjK/AoF
	ahmnjI03WXkF7ZHoj5vdE8dtUJJzjxgYLcvKy1bhjDDFgyrNB7DibaTfCOSicmxI
	Q8bNQty3wWLT5xJfsofZihrnYT9bkZ5rhR5pEdCn9NNnr+6JzCCu6gTuaWf1V+g8
	A1mx+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vc46g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so628545ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778863953; x=1779468753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E17C5QueuzhDFwixsSiDn3qQUgxnX0ykvGt2FzYvao=;
        b=BfcwHV0XAZ7TVFWp778rjjb/WSNtwZOOSg9lt0d9LF2NV1UIGJXQCys6nnSfpEMKEw
         Jaz5LEzvnp8guXoZYzsga64f1aWPpzSfn6u4fSnDhKRXQshDBCJBxK4AHhodvvN1RcDP
         nNIfFw7cvH28Rj3hCgvqJfqm7edD4e4YrK5nI1TkAz080DUd+YykyjgEaR+Y7umBoAvU
         ARa5hs7mC2O1oY106tk6fUO9G30DXDHaqrVEk1xQtg979TOa6b2p3VX+yul6s6nnKWg3
         51Fo707m699tjoecl424wlWXKaXzVInVxVH1MATSiXVUTKOY5rMTI7qII/RnbHj0QwZo
         3Qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778863953; x=1779468753;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/E17C5QueuzhDFwixsSiDn3qQUgxnX0ykvGt2FzYvao=;
        b=i7U/R4BdDQ1pDyQvKWzCr3y0v/OB/ly1MjtNfhlzxzbj478qP9yE/2ZBvSJ8wVR16Y
         jL3vbrBhLNIHFu2jzH2CknLkLszXcXKM0YzZ+Sjqno7phLzjnmgD7VHGHB2+A2N0WSJS
         +dY3MgIFiWG4GHQ3xfK9mFllZrf354Q+uuhcdptHHKEpPz8MgJ93br0UDyJz8+fzl/hq
         o6fynxbOi7BSFWZxELuCS3w28qgzUh4A4vPvSYMcxHzFFYrj9AmXbKneELkO1vCa3PgZ
         WrQNxPOAvD9vjZy5/OAQhJzUao35/ibS55Rov6YwSOPwOZhHyTvUzsvAA6FSnPwZRnSW
         qceg==
X-Gm-Message-State: AOJu0YxQKv/Fn7E5pj0N2SduvRQ7fwAlLn8eKaPgNiheSf8aILt1spB0
	EfsXf0XauuTrXFd6BgCTPaEeu7nxBp04gSYD4gHjFZYmi0Au+i3sIwWmAbdf46g3ipunfTu9kHU
	UufCTF7UY2iSj5zy5RFwbiqQK8me59kHzty9Q6N/tFACaUlVj2NXEPAUeC0/qPb6TkU8EnoNarS
	0W
X-Gm-Gg: Acq92OE4fMrxX3rWk/+xmMWItdF1KJGu0OXtaWiTmc8gA2qnGxn5MZi0THkYv1BK/Gr
	0oIsc6Y7qQIPwfStWPFPzE08sto9WbkFm6lEj10OFynMUonVo296nqncX6CYH/HZ5Y8udd3iV3y
	g0CyTUM2yRVfgqSF8anJ7b6EkgQccInz/bho6iPVRrrO1/rOm5LoMtgZalVkQpuIS57hsfrpnKX
	iv/00GCt9tnoufwODE4WHSe1G+HWkutqqRvKalgC2I3/qBjbwGl8sErdY040IicD2uacP8pM5y9
	O4J5J2t8MIspXLUrcAiyyLyKQYZ3W/w/To+Q/v2AkgnIaVd9Vf9mCC/kOxVdvNGVvla4xUDs4cc
	tlnZC4open9fJDpkSN4rN
X-Received: by 2002:a17:902:8689:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bd7e7dcb05mr39484345ad.14.1778863952710;
        Fri, 15 May 2026 09:52:32 -0700 (PDT)
X-Received: by 2002:a17:902:8689:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bd7e7dcb05mr39484065ad.14.1778863952139;
        Fri, 15 May 2026 09:52:32 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.141.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm58330965ad.38.2026.05.15.09.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:52:31 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
References: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
Message-Id: <177886394865.8489.5707435379388898546.b4-ty@kernel.org>
Date: Fri, 15 May 2026 22:22:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3MSBTYWx0ZWRfXyCrEQMincD3u
 43mOgwiy6ha1Q/C1GBvPiOVc8aQrcTW3dTzpb4IieUliR8WC/eYLQHL5k6PRHSzeJaUaXtqyqsO
 gWOU5B0UWCcgElNSfjp+/R158inBpj7DhImjyQoT6TepawpU/MTdoeZdVt1RTsneyQ78TdRZyC/
 A1GK/cgPPkrTB8OhcfwjyuV1/W7BjVMI35wZQ/+eciORwIkW1skQ1paVP+Qly+QgFBugHZP0X85
 rBC8C0fn91ssfiE97JlzrFSpbfaWcNzxbPC/IBwacxGUHP9ENdXn/dBI1WjHzb+e/mdLn6495YT
 +OxwZQycbyRrkwbEKDfmLvVIAs00D0+PJF4MiP3NbfvWHPrH/ZGuW1tUWddmjtAWrjhnLoeEmYD
 eYVTgz3H/LRaa0szucMWrqu8n6KTMF594UWIlHA8jqCymRa6CJ966I8qWcyIIzd2gwjWL9hgo4S
 z6vkwjNKa3UWzOPBqgg==
X-Proofpoint-GUID: sZi8_QY9uNonseYJwzOeP0TfNfO4do24
X-Proofpoint-ORIG-GUID: sZi8_QY9uNonseYJwzOeP0TfNfO4do24
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a074f51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=8TBCxnFsifAbGBbxUCxq8g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=JucjwYXNH_3_nybdtf0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150171
X-Rspamd-Queue-Id: 05926554908
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107953-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Fri, 08 May 2026 02:54:19 -0700, Qiang Yu wrote:
> The driver currently supports two PERST# and PHY DT configuration. In one
> case, PHY, PERST#, are described in the RC node. In the other case, they
> are described in the RP node.
> 
> A mixed setup is not supported. One common example is PHY on the RP node
> while PERST# remains on the RC node. In that case the driver goes through
> the RP parse path, does not find PERST# on RP, and does not report an
> error because PERST# is optional. Probe can then succeed silently while
> PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
> silent probe success makes debugging difficult.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Handle mixed PERST#/PHY DT configuration
      commit: d160e4d32a8b94e534f7c491374b99cf44baa4e0

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


