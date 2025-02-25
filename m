Return-Path: <linux-arm-msm+bounces-49367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03454A44A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3959B3B86C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C70820E6F2;
	Tue, 25 Feb 2025 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwcmLhdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A420E6E8;
	Tue, 25 Feb 2025 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507515; cv=none; b=CIDrGnEbYNd8cep6bgXt2BZRKe90HJjPw/DXR8Giw5OEIf1B/Qz2ddk02/ga/PnigTqELlrxedh/Dc8EZH+DUbWq+Thhs/8Fhcy+JcSYDsF8WwlWa9jr013uhezobXm8xHNCYGJrhrkYmOyWTXQT5RQPz/duViaZTbtjhIJ4D1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507515; c=relaxed/simple;
	bh=itIdcJdf3pYDwDpVxtiAVsBcAWootq6VBZtjjK/lSmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHJJn2mKDmDIvDw6RZqkp8B+Yc+KJ6pkbjZ+0g155icC42zjfUNOQmAWzcG8PQo9Cfl+ZjhUZfHQijLsgaMrfhUYv63B0wEYjyBOV8ixoaQ4Gq772ozCoLT/Ch9nz+2zvoskNVV+vjkTC8ClgH0qGUQ6+JYjVY9jIf58W+DeT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwcmLhdu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30833C4CEE7;
	Tue, 25 Feb 2025 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507514;
	bh=itIdcJdf3pYDwDpVxtiAVsBcAWootq6VBZtjjK/lSmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwcmLhduwKrkN+vv+YcSgpCaCzfJsfIOS/9tV5QyaoWi/Jd2HYrCNnHXfo0782UeI
	 os6jAS5Zeq2auwUcQJjqEHVoizOXU5AUtr2u2XGiWlNbU3+J0xxRLZUSXdy+nAKfWe
	 k+WxCJPqBTkXHr+RJQD5jGs8zQ6hOAskdwDj681S5kehBl+8O1+z03OUraAT7bhB9L
	 XXNqLnxEloOUI1lRLUUGjMnkrdE2UQkgsYic5efUyQUixizjJDcNBnO320Qla+JyN5
	 +JuN2f4n1ptTlJtSYuMcZARNHFR9uVaZ0mkyrkUntRLG4LRm+8eKoCdwyOZwcXlNcY
	 LS/4KuuX0rj1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_fenglinw@quicinc.com,
	quic_tingweiz@quicinc.com,
	kernel@quicinc.com,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/2] Adds SPMI bus, PMIC and peripherals for qcs8300-ride
Date: Tue, 25 Feb 2025 12:18:11 -0600
Message-ID: <174050748692.199016.14073730040368196013.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee94642279ff@quicinc.com>
References: <20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee94642279ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jan 2025 19:00:16 +0800, Tingguo Cheng wrote:
> Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The
> qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
> 
> This patch series depends on the patch series:
> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs8300: Adds SPMI support
      commit: 8d6a7321514964ca2814edc6232ae47122874a5e
[2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
      commit: 9221ec2a65bc8beabb28fcbd9a3c53e743633b3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

