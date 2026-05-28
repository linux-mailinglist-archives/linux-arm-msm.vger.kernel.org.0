Return-Path: <linux-arm-msm+bounces-110109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL6sHY4zGGq4gggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:22:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D25F204B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94504300E28D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E923EA965;
	Thu, 28 May 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGW5vihF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpwXTA9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D23EAC83
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970956; cv=none; b=HJCiKoSaASlXM3DzeYJbaRvUIp+6nNWKImCJYgcmme6/TtsVfOBt6PWyueEt062scgBkUR7kLeUH+Lb7i4pBak79+8sIk0i5+DcAYmenS8jn3K7NzDlMHDxV971+phfnimcDxhvYBoTTr2JxczDcx7J8hLMjaAEP+mxVXQSeRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970956; c=relaxed/simple;
	bh=SvuHJyVbfp56FKFyv1W9ZIVZyBtnajAZ6S/9O91nNzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XXGiYq1G/p4zllo/d1+JgOlN0q2VdZJBQ7ib79YJOjmLK7aZ09naFBSmx1wUe7z07BK22L3GkA6fQXcP6g4Lrl59+PRFRiN6lM5j/wzJu+4e75ZzlZZvcywVQnZ5sODkvMgztFnWtN4U1nmuNYXrQWXDShLlyR8RiW1tYG9EyFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGW5vihF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpwXTA9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wNDI382552
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAPB2AF4c2u6iDlFfG4VjFwRrc14eX10mPOMfEjm/kg=; b=bGW5vihFvBLuUCi7
	XSF2O5TJ6G0DdFNMnxVOIC0XZATFK94pBE1PKiUdAKqLUSBA9uAZ1E3pLRtuhxRU
	LOgOWk74ypP+4ZTXl585oQYopDRbdo7bw5ywBeTu6/771DB6dy1/2283QciTQI0T
	8/ovj068fNiWkqgMQPtazMWRbcoGRY4HYtvo+E9qH3fdzCDlSwx+fF+Jex32PWpg
	AyNel46V6Um5hKoEu+Imh0WthI3MxXVxMzD1my1Ul6y3y7H+CtbQeowvNOnzfYJL
	YvNsK91F2vEe7arq4pRQdlNOIfZDVK7k9BIe4k0kKu45WifPl1JxuRISIa1ZLxhT
	whocww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrjpet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:22:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516dd6e4ed4so125345211cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779970952; x=1780575752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAPB2AF4c2u6iDlFfG4VjFwRrc14eX10mPOMfEjm/kg=;
        b=bpwXTA9pEOQXNLHbXQGo9Xqzhu0XZXrF+PVSUxLuZXGncrNaksUqrLw+G8AMJ/JbAy
         myYOHmojaAHSF4y+Z56iL/yB67l7mkCDe8Vih6XseS38UfkSLBn+bM6ttRhjiIjzwz5d
         Au8vdNlPJJjtMUGnM9XhV67k1Vlp+g3F4ApBabnEPZgggiIqkJqGT+6izzbWVE0Ncomr
         axcRTgU8nZY+x7dTO4/qNUFt5MUL9znBn0HU+5RjA2PgoWRly9Mw6+Uuon0fWhwfZDoM
         hKITxV49YTwFOuHuSK9+VWNQHe/Xc39i/ErFIcipB2+IotgwTKjqByISlEnVazSAf4Qr
         lGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779970952; x=1780575752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fAPB2AF4c2u6iDlFfG4VjFwRrc14eX10mPOMfEjm/kg=;
        b=sQtc141IBLRbl4K2dyzpqhE0P7YbDRRunzExezNmjwbDToUV42jYTpzkUkuYqNZ4tF
         2PqA2rH/D7I4XFkLE1XDJ2pkmokIejQ5zZolTqP8kk0CUS0IxyCQ+dRlXH9PCqEmce5p
         hzXiG5hHD3R60o+pF11XiaNN/S15QnWI95kDqm3NpNzpvyJaTqcHpQrETmQVlQfb7cju
         Jv7XoOj5B8Y9qzBIKZzgOpeCdfg4prgeY3b3w6lovMJbNcK9H9leQACzU6/Tx1dJy3eV
         0dY3gICtKp8yMXsvdTaFp1nmVXsHBOwDekkUdNsD9ghoTbh2E2ickjOSJEpko5xTNBd7
         FGLg==
X-Forwarded-Encrypted: i=1; AFNElJ8lZmI5QV7einp/2G/Oec5oZy5G9fcd807f9YW5vJI0NP6OTSbSQlqz9LGmZk6UUBirqO/PsP7g+qP3A45H@vger.kernel.org
X-Gm-Message-State: AOJu0YwTij0wB//BVysdr6LBSuy8hdKOMjjQbZBXwlX2O0e6p6APsTh6
	hx1Cu2oUl/mBzUkNDbHcfPACgM4+QPcbWpe6UGCCw/sTdkp+7bAmNzrFL77dR3ZulA6C2wDTnpm
	NwXotlYQvFMHrQ1HpGf8FfDSS9sOIqcNl7KPUWWq5j1Fz6KqsIisNJgCNrtGKIDgBt8Tlgq4V1I
	f+Ssk=
X-Gm-Gg: Acq92OG9tcf07yx+ik5hSoXNSs8yaHXjEBl7Mmtw+ilJcofAeyqZ4t1Fxy9VeuGvdqd
	grq8MuOZXfv9AfQDlvm6hdiCdxfku4Y5sfxJLnMM4BUbZefshw2o08ndGgk1EnTsGwRD/WpQMq9
	ZDc4TifVUBBG1YeZWlM9CLmkMaUiJbvuoZHpE6phBPWpnmOMtYTLcqlDEeov2hatrhTBiVlE8ie
	eiMmIGeMvmaPd1GH8oIAddgimcjqqg49KTdF8Dientj3b5RTfVSlpOSYHQz6FDSugu0arZM/qnQ
	/AWaWoHqqCK2lTHcMjH2tQMTdC0yM6oGrYOA3zW3yDpvcYkmyE7qb5DLwv6SCp/tewC6q+jtiWL
	2EAdQUQnUIPzJLJPBGB+HKPT8cpzCcDvnG2uQ+PlbTHssg0ZWk25ALebEpWZqSIOmRlc=
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr379459911cf.11.1779970952138;
        Thu, 28 May 2026 05:22:32 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr379459601cf.11.1779970951628;
        Thu, 28 May 2026 05:22:31 -0700 (PDT)
Received: from work.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54a432sm18756094f8f.3.2026.05.28.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:22:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
References: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Disable ASPM L0s for SA8775P
Message-Id: <177997095024.9920.18198713178143798584.b4-ty@b4>
Date: Thu, 28 May 2026 14:22:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNSBTYWx0ZWRfXwvz0MxNCsG01
 5o+/0qygkvgNCeotMZ6GXIzX+PR75FyYue8uGjUockVQ5RULUOjoDJvorGfD3RIHdsAx1Lpaq3/
 AK+yXfcWGSyCrer2BcTfBRRZZ/DKy5yW8DgasbGbg2P21ytl+kvQNSXy3WN+A7dJ2yEhgZnqbkk
 cXjblCGAYx8QSSSV7fvP5DJb5zvc7NCjRsPtI4WzRoAZgVG+42IiEfpNyRSZafrND7xYdm0crZZ
 p6Jlc2J2QcjusT/k6F3VKRDBCh7BcnwxdGpN6fZt6s9TWbbCo2/K0AvPtSHCL2zu/X2nfzKe8rY
 vFT2GVoVyMYzBTxzGHtg9usHBHW5j4n/xZQev1G8aHUA1xirp2bS3loxTf+NkdVxz7NZU88g5KT
 Q8Dv8vW1yMZD/j8UkegQPeDK179D6ZgWMPOX4RuznwuWZs3jTC7oxR2ROPATUQbm7FWkH0Rv0Wc
 vtmf90ervZ3ltVQoh2A==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a183389 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=_8kdG1c4Wl3LSQpqaogA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9vF5FxdRp7qDdelxc-z1oCvkRj48IVDb
X-Proofpoint-ORIG-GUID: 9vF5FxdRp7qDdelxc-z1oCvkRj48IVDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280125
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110109-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A5D25F204B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 19 Apr 2026 17:39:34 +0800, Shawn Guo wrote:
> Commit f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port
> if iMSI-RX is used as MSI controller") removed MSI/MSI-X capabilities
> from the Root Port on platforms using iMSI-RX (including SA8775P, which
> has no msi-parent/msi-map in DT).  This causes PME and AER service
> drivers to fall back from MSI to INTx.
> 
> With INTx-based PME active, the QCN9100 modem endpoint sends PME messages
> during D-state transitions early in boot.  The level-triggered INTx
> assertion coincides with ASPM L0s exit sequencing on SA8775P hardware,
> causing Data Link Layer Replay Timer Timeout errors on both sides of the
> link.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Disable ASPM L0s for SA8775P
      commit: 29f692985819f4089f02a86e151a72f6d4cdd90d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


