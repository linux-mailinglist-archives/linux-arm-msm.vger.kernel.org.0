Return-Path: <linux-arm-msm+bounces-60544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3AAD131A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 17:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C094168A5F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 15:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44454769;
	Sun,  8 Jun 2025 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manufapp.com header.i=@manufapp.com header.b="cOd30LLS";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="PTaRRQgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from c180-36.smtp-out.ap-south-1.amazonses.com (c180-36.smtp-out.ap-south-1.amazonses.com [76.223.180.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA6D13AC1
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.223.180.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397857; cv=none; b=ssnEDzCs7bPMntyw374IXbmUzn/hMcyhmY0AqfPxxc6CX6wOa6Gljc4GFAyV2tUggoOUudpqwx74UE5WOA9i16J37FkyyYFLnpTER4CU1qbugkiKg7IEQXqZ0D5WC/hHZ7toKdpgAJbIBk9al/XjfIBhkMGlJ9KIubOvKCVGh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397857; c=relaxed/simple;
	bh=7TZw21+CY/Zpw6Oo+hkqY7cN4jO69undkZ/Xq+dr0GI=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=KKIfoah4Mzez3QVtxmgaDUhjdAYQY5oldqO7iLUZL8U1n4bbumbHlZyqXHGM8HKIa6Ux3Pga7waDfMQ31IFxlIJcE0pFWkcuoxhTVOYeodyam3odOOYgq2JZyys6To2g8TQzIdAnnzyBzzPmljGug7vYhm435lCAZaR/sfAx0BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manufapp.com; spf=pass smtp.mailfrom=ap-south-1.amazonses.com; dkim=pass (2048-bit key) header.d=manufapp.com header.i=@manufapp.com header.b=cOd30LLS; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=PTaRRQgi; arc=none smtp.client-ip=76.223.180.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manufapp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ap-south-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=h6o5zpevte6lfxu7tr2otugscp3pngwt; d=manufapp.com; t=1749397852;
	h=Date:To:From:Reply-To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=7TZw21+CY/Zpw6Oo+hkqY7cN4jO69undkZ/Xq+dr0GI=;
	b=cOd30LLSqDQTtD0QJpkGXXlrE828VuZOtCELdQllET9Isa8KizsZMinbUNbazQm8
	LsHtVGqQ5n0Kac+udcYZDnBsIW6m4BKqWP4oDIykxAVvqU9vFU2dgUekt5Lo56NTs0F
	rdOlbdRq80RU0gfrZCeo9SfZh5//Z3/xWdYaHU6Hl4GahXfj6dJ4JLXSsJwiOX2t4iZ
	Fz2pQpsQu119ijUy6xqrGbLNM4XzXHEeDTG4TphomVu4Gev68qBrbBOuZ+rx1corRo1
	ujABAbthmwAJ5hsvQj79DpTu7myp1bq9B3oqiHSeXzKOjJQ50qFEB9M809F3ZHWNHk1
	Ruk+yXM/Cw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=dvogjbaa3ou3tduyzvyu4rj5tkuzdi4h; d=amazonses.com; t=1749397852;
	h=Date:To:From:Reply-To:Subject:Message-ID:MIME-Version:Content-Type:Feedback-ID;
	bh=7TZw21+CY/Zpw6Oo+hkqY7cN4jO69undkZ/Xq+dr0GI=;
	b=PTaRRQgiiRPn27Hz8QfoowoZyosPY3sLYdbhGkIh6tZJ2el45Mf5LvUJg1JIQsu1
	iOZ6PTisx/ut62k6lSjFLtsX78KuJYRjIc2zmVZIWnYLEOEP5IpYce3LEFp7qH5pc/V
	euT7a8I2yfqFiqYh68nzpU6bieZ2innEH3BRzEHg=
Date: Sun, 8 Jun 2025 15:50:52 +0000
To: linux-arm-msm@vger.kernel.org
From: Manufapp Team <contact@manufapp.com>
Reply-To: sales@manufapp.com
Subject: =?UTF-8?Q?Thanks_for_requesting_a_demo_with_Manufapp_=F0=9F=9A=80?=
Message-ID: <01090197503cd104-fd910842-4a84-4413-881b-332372c8254e-000000@ap-south-1.amazonses.com>
X-Mailer: WPMailSMTP/Mailer/smtp 4.5.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Feedback-ID: ::1.ap-south-1.LKEWoBVwKNrhElPtObgTdPcEAPX+bqTANIbDBgk4wS8=:AmazonSES
X-SES-Outgoing: 2025.06.08-76.223.180.36

Hi Your account has been inactive for 364 days. To avoid removal and claim your funds, please log in and request a withdrawal within 24 hours. For assistance, join our Telegram group: www.t.me/s/attention678674578,

Thank you for requesting a demo with Manufapp!

One of our product experts will get in touch with you shortly to schedule your personalized session.

In the meantime, feel free to explore more about what we do at www.manufapp.com.

If you have any questions, just reply to this email or contact us at sales@manufapp.com.

For any urgent needs, you may contact us on: +91 97171 15905 during business hours (Mon-Sat 10:00 AM - 05:30 PM IST)


Looking forward to speaking with you!

Best regards,  
The Manufapp Team


