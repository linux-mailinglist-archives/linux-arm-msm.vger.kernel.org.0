Return-Path: <linux-arm-msm+bounces-52256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FAA6CF50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 13:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6794216D656
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 12:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AF82E3375;
	Sun, 23 Mar 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=dubbelgoed.nl header.i=@dubbelgoed.nl header.b="PAL+KcGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from elegant-mcnulty.217-160-76-156.plesk.page (unknown [217.160.76.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B081EB3E
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.160.76.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742734040; cv=none; b=rfldkRnsg66KoTnX7C/95NDmY5fl00BoKOeHXEV7O57DU4b+5vTMEmnr1Os6iU2PmDdzIjIPRP0Nfe9FYlnuVCNuJcthjnui7ZQ0LynUc/GUfRl6hXkEo9LTeXjP1iwbLV1WFV/Q9//qmZWeZjJ13iGTd8j0c2wj6bSUz63hQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742734040; c=relaxed/simple;
	bh=C7MXweiX3JucHhH9EThhOcx9eMIeFeAtyOGxHQQA6lk=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=dSYvsleUPoeNr1awoiYcZpES+30lsMh2sBCqcdYUhIosrIdxLxdfricKFf9okiCMnqyrJj6T/l7ffuJ5rOtud4BrcME14spjLwlJK4lHkm1pkjPkMd/+DDqOM6KhhE4W0+K84dq7FaUTOTA9oKHQMEuPrahs9dPI0K6Wwcbr3K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dubbelgoed.nl; spf=pass smtp.mailfrom=dubbelgoed.nl; dkim=fail (0-bit key) header.d=dubbelgoed.nl header.i=@dubbelgoed.nl header.b=PAL+KcGh reason="key not found in DNS"; arc=none smtp.client-ip=217.160.76.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dubbelgoed.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubbelgoed.nl
Received: by elegant-mcnulty.217-160-76-156.plesk.page (Postfix, from userid 10006)
	id E7D65C9246; Sun, 23 Mar 2025 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dubbelgoed.nl;
	s=default; t=1742733578;
	bh=k5ZEFhwPk47LENrjVXs3+OmN2tD2gD+L125wtkz7O30=; h=To:Subject:From;
	b=PAL+KcGhBSU18SmrO9plNyviVU7WYx77NuYSgeD4KhZgiZdJ5olVA2pQ3fi3Xv6Nl
	 WDFp/nqvvwHilo/aLt5aFPnwHmyG7SOPrI9EBTSTOMui/27QBn/KXC/wD/R7Ltrudl
	 4TkT76geaBa/vfYUjC9qloq8Y2QCxgpQ849mlC03Kb4tpSjTATSxnb+bAb6tT2NfJ/
	 /VQYCUaJjj8as8lCCmd4VvraqZeBNLxm2j9/c9FzbuABLrBVii7zhKB5pft2mo4qZt
	 WE0oAgZgO0UKqmw+/WsqrKbGyaEQdYamfRZfeYQf1I1zSIw1rSUyy1E9yaIEBIN55G
	 mmUVyq8PHcLrA==
To: linux-arm-msm@vger.kernel.org
Subject: contact formulier Dubbelgoed, reactie
Date: Sun, 23 Mar 2025 12:39:38 +0000
From: onennalelm <noreply@dubbelgoed.nl>
Reply-To: onennalelm <linux-arm-msm@vger.kernel.org>
Message-ID: <MnzthZfhw8pOFYFbZBGRvttpj1kV4yV5otyPZQrwmJg@www.dubbelgoed.nl>
X-Mailer: PHPMailer 6.8.1 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Hallo Caspar Bosma, 

U wordt benaderd via Dubbelgoed: 

Name:     onennalelm
Email:    linux-arm-msm@vger.kernel.org
Subject:  contact formulier Dubbelgoed, reactie
Date:     23/03/2025 @ 13:39

Bericht: 

Hi, this is Irina. I am sending you my intimate photos as I promised. https://tinyurl.com/2aq27855

-----------------------

Additional Information:

Site:     Dubbelgoed
URL:      https://www.dubbelgoed.nl/contact/
IP:       165.231.182.51
Host:     172.69.136.206
Agent:    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36



