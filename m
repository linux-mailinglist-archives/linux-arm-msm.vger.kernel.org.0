Return-Path: <linux-arm-msm+bounces-33383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04256992F12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 909ACB23617
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8DD1D5CFB;
	Mon,  7 Oct 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3K84RtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDF1D5CCF;
	Mon,  7 Oct 2024 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311172; cv=none; b=RpbPm1H8Maon11Jz5eUJu+GfgQsUS+xsz3KTna4CXtJ1PnUGZVmPlntt/rAVY+gHMwcbDjKK5bQZgwX3mlIFH6JrzgeeY1K47jes6IpmlHV9TnwQLYhFoH57G1uaM/k9hnPubU1xx4QpgeH+XuMas+3zMXlVXwjeO8LhZtwpMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311172; c=relaxed/simple;
	bh=5yoeWZDaiT1rHV+GcZ78vH0hj4w3W6TEeDPchcWCYZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUa0AcT0wqd+A3izRhY9fh5k+fa2LU3qMjzurwxY/WTgjL7uZ18pO2Rj3KcYRKZZ7mg58npWajuHIj/kSGytgHMD1OKHTYUbSsA2ZovCjMLLVU4luDpSHKfveGDwfNvq+1xZ0IZnGAEoPqyBsiRSyf9sRywtnGaMobbrtjM8jk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3K84RtG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6403BC4CED0;
	Mon,  7 Oct 2024 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311172;
	bh=5yoeWZDaiT1rHV+GcZ78vH0hj4w3W6TEeDPchcWCYZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3K84RtGIb9WmjfS6VUa5hFZzsWPJEandybeBQui41o4z6C+5qGurVt1snz+/zu4t
	 8fikPAF+etx67Zthq1x0mMLTSDYwJxNtmMKzoSk1j3gQQNIEosn7nZmyQMS8r53ERl
	 ou0p8JDzyFEmTXM8dV3bmWwwpKpi0jH4wo043XCHf9mTUJxbXi+oJOiASxcTa6hr7s
	 LolEEBvguGEKaC9W46ne6pPMkc/j3zTo8AQeOU9rwdMQ7IwOywvDjiEDJvvNLdxcwp
	 vUU4ME5geJUDzt78gOJV+1jEPue4LXgpD9pUV82ZSkeN/v2n8/7uxf1bfvWTwhPDKi
	 nLSzJHRoYQxPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [RESEND PATCH v2] firmware: qcom: scm: fix a NULL-pointer dereference
Date: Mon,  7 Oct 2024 09:25:47 -0500
Message-ID: <172831116168.468342.619088735537365838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930083328.17904-1-brgl@bgdev.pl>
References: <20240930083328.17904-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Sep 2024 10:33:28 +0200, Bartosz Golaszewski wrote:
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: fix a NULL-pointer dereference
      commit: ca61d6836e6f4442a77762e1074d2706a2a6e578

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

