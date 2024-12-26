Return-Path: <linux-arm-msm+bounces-43437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9509FCEB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3761608D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168C71B983E;
	Thu, 26 Dec 2024 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NORAX7+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4641D9337;
	Thu, 26 Dec 2024 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252752; cv=none; b=E5WPZvY8gv6ncOjs+bZ5R0BfUfXGOgb4TDicojsBAnGnWnmJKPR4w/7rOwyQGTIX9JMdu0ZvfOU8N9UApeuSAbeqvHF2Ps5lu6AERP0ZBZ2nUD9x70CVButrSvFt6VQiNCxxzIdgMY4n9wWYwEF/Ep1ek+3NR5V37+8if3dHZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252752; c=relaxed/simple;
	bh=Vp3T7quX47cY+XoQB9X+6J3rtyVQ++kULjxIRvZAObc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNKrdLQ1Z+NoTc/oHSdVAN+65pETDco5xbuI9llQ4M14xizPRWmiFTSXyphuv6foztg5/a2VWjvMd2k8TCLewayyI3ubUWVwqItOkryVFXPGfzNiNvokZqDp0s7oSjp0aMWeDg+vOr4boT9XgADq6xj8D+qXUU7TA6CVz17shbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NORAX7+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5C1C4CED1;
	Thu, 26 Dec 2024 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252751;
	bh=Vp3T7quX47cY+XoQB9X+6J3rtyVQ++kULjxIRvZAObc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NORAX7+6G/1G1aT8OzkDDyaXGeuVB4cgOH9uf5AmpT9sW/jN9NAE6D7puHPlrhcMb
	 aoSO407UiGqi8jjMEujF83xyNuHoMUliYb6gWtWYKx1KFh1vmLKT29mTeKHbkgu+3W
	 sjbsfITW71YTCfsaKqC7XB7iZCufwbwYJ/CYSjzmmVfnWY4YLhWNIuqR5Q0gzh7vg8
	 EHiybAZ3lkHgZVx9ZK8rxycGRuO+CcawX9/WN2Yb1IN7FuXkSlh9NQMbw88MPT/Le1
	 UbkeFzwfBMyPjJwJmf9KN5OLhpMd+gei6Qh5immNk3pB12Dtk2yYckxRpuii9ssLq8
	 hRdN2Y7wwsX8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id value
Date: Thu, 26 Dec 2024 16:38:41 -0600
Message-ID: <173525273261.1449028.6524899768190730684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
References: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 09:55:01 +0100, Luca Weiss wrote:
> The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
> SM7225, so drop the unused 434 entry.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id value
      commit: 7fb88e0d4dc1a40a29d49b603faa1484334c60f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

