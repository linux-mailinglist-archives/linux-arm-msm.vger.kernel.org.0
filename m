Return-Path: <linux-arm-msm+bounces-45540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B6A1661A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 05:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C650165F68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 04:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAF31494C2;
	Mon, 20 Jan 2025 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vijayavarmabeachresort.com header.i=@vijayavarmabeachresort.com header.b="TEVohQbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from uksrv4.websiteserverbox.com (unknown [185.221.216.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8189884A2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.221.216.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737347797; cv=none; b=NhT5IbFMaHIEdg6uDKG+Q2eOywE6rjBfttIFgivw2m1WjFt0eQAW9IDt+8hu9Ym9uNdRJzC2i9MNH3yjNTaM0EvUHCVyduFD2cxbBLkFb0xRh9vfZkQ/YNZqK63ER625TLt46PTlTOuKCXWipC0ikmFhrgzXJtYAL1snlLLRhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737347797; c=relaxed/simple;
	bh=ZiEU8IdyrTpMqIkyrVFwZEfVUYj31DqDwW9OFXIRhC4=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=LSpAV7+8I1c80ac3pF28PGOuVS/lohAa3lOkUAVdGl2H3uSYKLCGaXJG+Q86msHUHwuySxSfL5cmuYUBJg9OrWG5GrlFkOxqGDK+WY8BgmMT0DYiPKg30pd6JQRaGdnvamCsDyNMyd2go3kcL/sNKBgh4KP5X8rjPPjew2g78TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uksrv4.websiteserverbox.com; spf=none smtp.mailfrom=uksrv4.websiteserverbox.com; dkim=pass (2048-bit key) header.d=vijayavarmabeachresort.com header.i=@vijayavarmabeachresort.com header.b=TEVohQbk; arc=none smtp.client-ip=185.221.216.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uksrv4.websiteserverbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=uksrv4.websiteserverbox.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=vijayavarmabeachresort.com; s=default; h=Sender:Content-Type:MIME-Version:
	Message-ID:Reply-To:From:Date:Subject:To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ah4s0HPyxtIvMpQZSkmup3VN8eT8q4oVWwiSLrDJDrI=; b=TEVohQbkZ5GBu90BsmjMqeLrmG
	b0QRyKkXuWFs+xhmFYSXkTdwlKcKdxO+V7b6iJwYPSM+M5Sif0+vcNWoCLsgfLC84D8eHto2cupsB
	YYBwfgvju1OP7bJa47EG4zd2+YnS+QkkLGS7zmAMuvaeQKsSItQ81FqnXapSr/aHtbafALnxkGjQh
	rlRNJwkXQSQX1TCUDyoe6gJAsd1T7xfL8UxL/ih2uOc5rPqMv3V8075Q3wrwALSQAuWtIMOojhjSD
	YRVro3DfqiDj4x4QVOHTCt0//f05FOkKomWCnvDEC7/jRTc+yM4PqgvbkEJ+2TR65zMqNNHZ4UKtw
	8fIe4jfA==;
Received: from vijayava by uksrv4.websiteserverbox.com with local (Exim 4.98)
	(envelope-from <vijayava@uksrv4.websiteserverbox.com>)
	id 1tZjFq-0000000Fh2W-2cNj
	for linux-arm-msm@vger.kernel.org;
	Mon, 20 Jan 2025 04:19:15 +0000
To: linux-arm-msm@vger.kernel.org
Subject: =?us-ascii?Q?Vijaya_Varma_Beach_Resort_"Your_account_will_be?=  =?us-ascii?Q?_deleted_in_1_day"?=
Date: Mon, 20 Jan 2025 04:19:14 +0000
From: Vijaya Varma Beach Resort <vijayava@uksrv4.websiteserverbox.com>
Reply-To: admin@vijayavarmabeachresort.com
Message-ID: <4hrGYANk4nN9hvlu5uBHwI3UEpIdMAtQ7sawruXk@vijayavarmabeachresort.com>
X-Mailer: PHPMailer 6.9.1 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender:  <vijayava@uksrv4.websiteserverbox.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - uksrv4.websiteserverbox.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1064 977] / [47 12]
X-AntiAbuse: Sender Address Domain - uksrv4.websiteserverbox.com
X-Get-Message-Sender-Via: uksrv4.websiteserverbox.com: authenticated_id: vijayava/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: uksrv4.websiteserverbox.com: vijayava
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: rewritten was: [contact@ovatheme.com], actual sender is not the same system user

Message Body:
Amernmype
82334961813
Your account has been inactive for 364 days. To prevent removal and retrieve your funds, please sign in and request a payout within 24 hours. For help, visit our Telegram group: https://tinyurl.com/29ga6s8f

-- 
This e-mail was sent from a contact form on Vijaya Varma Beach Resort (https://vijayavarmabeachresort.com)


