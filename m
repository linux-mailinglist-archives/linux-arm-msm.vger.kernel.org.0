Return-Path: <linux-arm-msm+bounces-43398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5E9FCCD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F87E160AB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BAA1DDA3B;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhP22PKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D41DDA2F;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237653; cv=none; b=AjqqS228ata8ydowTBuEV2xOW+qil0XA85pxqrPa7MSZybGuWmHaof3B6ymoQx0MX5ang8BB4pQtDpst4V+SaUcQINSXUK5zdUeXO52cIl8YxMXFHeq7dMnh9dx7Qp+AvBbmIDhvZ+7t1jjNU5+0LYWkmVdWIN7id9yRIUktbp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237653; c=relaxed/simple;
	bh=gHQAWPwCaozlVd2yGVO+t5k0eXATs/AhfTYeUPHrp60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIKiN2127oVnPdSEMkcUHn1nCTbeSE48b/AHHxz15exrvMVyGMUaACDPPMfQ5rwFBEYFay+3DZWfPcam2+4DTTUTNpuUuYzlwYCI9SuyOjM9m/wb5XeTQF74RYe/feWHuucz0hiOG/t/XnpDCi8o6mZ9jMjEGfiatjIx1g2PsfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhP22PKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C8DC4CEDD;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237653;
	bh=gHQAWPwCaozlVd2yGVO+t5k0eXATs/AhfTYeUPHrp60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhP22PKdPQSUlZAWLUdbw+Dc8N8dKdIQKhYjjxGvVyfMJfwmH9X3XZs5xl92cliXG
	 ScaRMba+upWVzBsmZZhsR0RcqU2jEYJbcEGDKN4WJmMZwSN3EZYGwqvlWGmIII7zt7
	 g3M5ikL/tfTdF54Kk9p0YVH5SLXPHZ1Abmjj0MprBDJv0nrZ0MzVqzywtCWnvFKjXd
	 xx++SC4ZEhkRjo6yw50SxzyQOKlqVfOf6QtOq4UaX4qngJ5CRpOpYddbl0gKoj46xG
	 WHPrMAEPUMSwxiMI13wkV3kxodXVp9zvQpNH4kYQqQOrH+jatmvsE/mMkoVlsUUxyQ
	 Jt+uuMCM6s15Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on the asus vivobook s15
Date: Thu, 26 Dec 2024 12:26:51 -0600
Message-ID: <173523761390.1412574.15291536546079214662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
References: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 Nov 2024 14:44:39 +0100, Maud Spierings wrote:
> Add the asus vivobook s15 to the compatible list to allow access to
> efivars
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: Allow QSEECOM on the asus vivobook s15
      commit: 9b01fc6bb1fca6ab2b7edb04b55bf106cf489118

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

