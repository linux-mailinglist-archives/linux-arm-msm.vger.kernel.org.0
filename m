Return-Path: <linux-arm-msm+bounces-100140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFO3DOZ3xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:16:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C170C339E3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E4530571BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6F7370D7B;
	Thu, 26 Mar 2026 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HndZ3hXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdJIOE8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1BB2264CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548295; cv=none; b=khYMHu9OPVGPtA+2xgwuvrqcPbJkCX8r92ZioZaQjx1s1ZlKflbbgVIe8C4yCuRGHSCyJ5RoH0tfHMtiHl9p/UVloIxZk/2Bz7iD8Yvx6mbzQQofBqaft25kvj/VnrK+E4frZdNgggriWtIgMsiYuyGz2mtUPDYY9XHW9VjlyJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548295; c=relaxed/simple;
	bh=OEPIZk3rlUGMq397PpTGbFOpvA5h9JbnqiBuyhQBEoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sWa6FtLmh1u0NtG2GjqUPYRPIp7fLZZL975tcD9sJCUse02kLHj9pgbJw1zjipzNcAmM7zZU0Uz2C2bUHCRkKa7HqkVg6LKCpgjbx/Gg6wC1AfVw8VooKJ0bcq7NOUhy7im2hGjlGXuZwLTV0o+PLBiv5XQCSWEGISens6AN0Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HndZ3hXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdJIOE8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9jns3898356
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tc8olBwv+N4J5aSYSwGihdfIDmQvkHQnOlnS5AzLX2o=; b=HndZ3hXHtaQPsiE5
	Ry6bCHuwfOLYOC+dDvkRPVljhoeqjkjJ1nrASVAIw2ry30Wm8uUFl8HxVOaVXa8B
	r090FStmucsoXhA7UITsmimiDBtSrBkqS3xbVIAWpCcowFlnfWPU1PztRHBr0z7y
	hNBRJ+SIyzSvByk71qyyG13dTGUCbqNEVOt3Es22Z3Tla5yO704GIUUV+O+59ezQ
	PYbIDLRrEQrgKtrC8wQuS/WIjK6I1w9YKAsoD6O+hPp0hY8+QGvPK2sa2BQ50Xv0
	gLmu63mT8E2nt0Ptjc9WKc3F7NmVIBeQBS/Fh1nhHMo1GOghEEYJ563E+2E8DQII
	BBJamw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kga87s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:04:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so1649726a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774548291; x=1775153091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc8olBwv+N4J5aSYSwGihdfIDmQvkHQnOlnS5AzLX2o=;
        b=KdJIOE8LH5E5Vv0BR7Yy5NXzr9x+MYS9sZmgqp0cKmRxKdIQh73CFpoFS+pZRPuSXJ
         a/THd5TtSvoAcHPc3nHmxU9sTTBzYsY6LL7cmQTtl+VVGuanj0RrbvLgVKJhWt1CU6gw
         d2FDhVupXhO6q8NPkCzIfQzNB5RLYzakgpxT2Zm12rLjRPf+7U6R+yPFK7WHn3+Df8Ye
         hXuOiBKqYTnBACy2jM3i3tm/G4Wb6J6M1FCWyea0KkkGtaiv9hNoXO101i1RPf4CdfK1
         RtbkXNzotLFhIdTbVXiU48T0ATgQsD0I6fz45de+fdJOvXNGr232nm5N6P8ybe1yRcYF
         k1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548291; x=1775153091;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tc8olBwv+N4J5aSYSwGihdfIDmQvkHQnOlnS5AzLX2o=;
        b=pKNnWnPu7vD8N1qyRyfaO/M903Gh5qPgBxNkDbBnIdnrhw6NNPO1seVvB+F5uVBVaJ
         PYSTAVidtgzKprWqXTLDqlGGwO6KA9PKNvIqsgOWZPArUDoPYzCDT4fvaOS0ROH6fbuh
         Nw08civnMqBU5hRzeuRZltd0vbGmUjCok+WmB8W8u6XLgyWi1budAKQQ5x76C8DQVfQh
         Sq7xKG7C5J2ux05Os3ja/aK3OeNnQk6c30l3ZMZQMO5AM5UlebbPxWs6R8gOCgAlj9U7
         qaxj62KwXL9FewgC/c3PZA7gkjGNvrjV2qUTTTomrK2pYYYHkUAMHu7NHzqsaL8+D32w
         1gWw==
X-Gm-Message-State: AOJu0YwwoijAX/rdkqV3GOssogrrfOkx3UY959vCcm8IKSbhWcCZYHI3
	cmMRkGnF+ctJkQU5UFwFgeOlz+Ek5O43WCVhaBgfJP6ORaYeggAqVglNrPAuUKqAPKqpp0kCSIY
	D4hrVpQfZg94P/3Iq9oEuLEAMuFrngeZfhY9id4IgGGbd2/0h4S3b96B/uKmj5AYHUgqO
X-Gm-Gg: ATEYQzy44nd02lYVKg0T0xGu7hpDyPtaWR6cIu5+d1xlZqLLnwJFz1kZE3m9uFsIMyX
	ITnYv0bo6P7Qvb3eFxs++VvTwd21yElvEII1/aN0Kz77OmLM2x3zHKMl1B98y0IIGiTOYcS05Jh
	w67apEsm9J3Np/iHUxB1hnuOzAh9iX9tQsAtg4lkqa8MmMSMQNzsfA0DHbgCBCUTIi6sOxQ5HQ2
	8XiABbqo+6g9lldPM8T1k34d9ms68FECmOJt2FwH0AgcfUyfD/jA2QsxDESPr0G54O9RvoaiuxJ
	HVaDr0FyPjyHCqS4BUVvk4bfZL91RrLkMq70tth/3+hgqc19NFjLWR7uKCKcLDve9ZxKk6HC7to
	4hjjV0XcynoMya02nODVFYtk=
X-Received: by 2002:a17:90b:3dc4:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35c0dcac4b4mr7549350a91.12.1774548290785;
        Thu, 26 Mar 2026 11:04:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc4:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35c0dcac4b4mr7549317a91.12.1774548290258;
        Thu, 26 Mar 2026 11:04:50 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22b9fc96sm2123849a91.7.2026.03.26.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:04:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command
 completion support
Message-Id: <177454828672.465511.13212183361634149952.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:34:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c57543 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=xtLazmnn-CEJS8-SaToA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyOSBTYWx0ZWRfXwnvQomuSDeqq
 TjEy5C+Yu8ShzsZwrijm3JJCOl6Gsz3kU/9RTRdOqVDeTuBaeA5ZwejsdSzUENjVg7XR3aZ1ENn
 Lxd41FqIT8cyZhjnXIFHYE9o0ICb9tQP1JvpNXQ81Gd8+S3n8S3kVBQN5MXvVc8F9fTfkN9xGjH
 67A1Ib6PMhJ6Kq80K/gtOs9iNaNUSPwVMstWa20gq89R4c6Kp4H8jSrPyx6kaktUBLZNBaXlp6d
 e+SyfsYcVFaTPnKV/bHmpzNWlw+qOOJPra9SQWTUo9l9/PznNu5bxpopZZYf1a1IUgJyJ9+n2OX
 DXDrSAVS3Iy2JodU/M/8DEumkAxMvf4MEF6EY4OgiGSb7rMN+E+cZ1SeApglD4xqFdbJVyGy0uQ
 S/NWZXrMNIrw1cWQ3S0Z3JhcjqX+p68v7RCK4H8wR4B/wJzOG5wK5xacNif+BrtEYObX1szoOeG
 94Fb2Z4JBaa4AF2EBQQ==
X-Proofpoint-GUID: X3zgnhWQnjZe_UMbTIpeWAOty69yeebh
X-Proofpoint-ORIG-GUID: X3zgnhWQnjZe_UMbTIpeWAOty69yeebh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100140-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C170C339E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 14 Mar 2026 07:26:34 +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controller advertise hotplug capability in hardware but do not
> support hotplug command completion. As a result, the PCI core registers
> the pciehp service and issues hotplug commands that never gets completions,
> leading to repeated timeout warnings and multi-second delays during boot
> and suspend/resume.
> 
> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
> Capability bit entirely, which also disabled all hotplug functionality.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Advertise hotplug with no command completion support
      commit: 33a76fc3c3e61386524479b99f35423bd3d9a895

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


