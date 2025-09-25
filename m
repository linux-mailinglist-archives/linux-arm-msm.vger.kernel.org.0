Return-Path: <linux-arm-msm+bounces-75009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F105FB9E042
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B257D3BF03A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC7926E716;
	Thu, 25 Sep 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFl0E+ba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3919CCF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788299; cv=none; b=dftakgzJWaon9MsI/MGmUYzYxYeTz28uMQmoMd15iiZaSpy4oAakR8JEOp9k2XxxSmNjUKqEY91MBxRo51OCCrU9G1iYU9jx/blzeOjJ5H6ALmj4qEm721bZoSrto89paCPYl/Zaf5aCmJh0tqanjaRK2O2mfaylx8z6HSYzwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788299; c=relaxed/simple;
	bh=3XjGoRL+nDOKvvEIyCMJjswiJhKehlRGeI7uILuIwqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov48qVbj4pCkcD3X682gL7JVybVPntEx9KIqyjastTbiDCNo76psZXwWFvseU7zLobMdt51sbDFVulyJVbeJo433mj2n+CL7B7ZTMY2c7L+h7Lm7vl96KCCQIrr+F8YvOLCl06djGf9T7dfUwvYNXqOY/vt1fasmWQAYaIsnWA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFl0E+ba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010E8C4CEF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758788299;
	bh=3XjGoRL+nDOKvvEIyCMJjswiJhKehlRGeI7uILuIwqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OFl0E+ba8igVJZL/51RTafxRFRzvAVl8V9ynqYvzRF1KAZVyqXFawfd5JWp1sRvlg
	 uK1sNupwNkw9gCsDLPgzVD4pT8krDUh8HFTbkiOzU0edtXvHrugZ8Wn9m5FAmLA2lB
	 GSlm/kBUDWuwv+p8QYLHiv7O6aeT5nMp3vQKSnhuYj6kMogI28REKGBZNASxrhpliD
	 MjiK+bwl8RQwxfY+P9ApoleOM7GBXngb+s0x/kT6wysw4t3u6tjmU4fPyHcg34rDCr
	 iu6uhfSDumoCqZPcglTYzCXnhbGQbUz1azxRwihCmQaUbPv4Jl+wrGUIpZobxak7vP
	 5VxM96TwhY+9w==
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b5579235200so530917a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyOqYlzubr2rWMgRwJg8EuRbBj17a6AMerdszsgLwQMwziWJVV8ync4qffWH6KDeg4w3+PBF4T1yAY0v86@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSQPAV+PXL76yQa1RLBnKqdZEug1NIDvWnQwUbxURvBZIBZIl
	BJ0hkplZN4n+81cHCfGyhhTqDljKieDHTRDtjeV7K1sPLhPWAHJ+zKpJL1AHy4tmq55tQvfPLei
	AB6hthrMpaT5pCm25kGqmvKY3M5AQEh8=
X-Google-Smtp-Source: AGHT+IE18V3dB8tMQMRDIxd941y3mxvNGKDjuMRA9lI0+1qI8Hj46kQlJ4YAHFWNzqoTh/tQWZso8mE214Lp0ZY+w2Q=
X-Received: by 2002:a17:903:b8f:b0:279:5685:3b7e with SMTP id
 d9443c01a7336-27ed49d5fd6mr35433045ad.20.1758788298601; Thu, 25 Sep 2025
 01:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 17:18:05 +0900
X-Gmail-Original-Message-ID: <CAJKOXPd97tJ_1cRZQmKE_1-B7AqgRr_CJ1cYMe=v4hBb9Z3eog@mail.gmail.com>
X-Gm-Features: AS18NWAULnc83IwS5xMqoNEbiR6q7G7MWJnOm6LL0LpbF8J-7ef11IeaI8Yd9_g
Message-ID: <CAJKOXPd97tJ_1cRZQmKE_1-B7AqgRr_CJ1cYMe=v4hBb9Z3eog@mail.gmail.com>
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Taniya Das <taniya.das@oss.qualcomm.com>
>
> Support the display clock controller for GLYMUR SoC.

One clock controller is not a separate commit.

Stop inflating patch count, you just makes it difficult for us to see
complete picture.

Is this somehow for LWN stats? That's why one node per patch?

Best regards,
Krzysztof

