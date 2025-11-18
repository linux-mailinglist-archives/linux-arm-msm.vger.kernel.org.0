Return-Path: <linux-arm-msm+bounces-82346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A671CC6A1D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B8A135D897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6A935E533;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J567w+4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4235CB91;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477548; cv=none; b=N8S0HXwPloFSfItFcJe/E7Z1iZuAZJx94JEZGqE0zOS0BpdyDrKAAN9sksZ8yksDx0MxP+nZvBtXnX207fjk68Bhx61kZM05gh86taGYps1aUTZmj6gblzfKsog2u948AqEyakwan+IgR+g28EN3xKADfNT+52wc5Dx7DdgR7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477548; c=relaxed/simple;
	bh=mSOyn6fDaIUa/uROigj1akZ2xqYPmv8o0/RUvLGCbb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NEwE3idrKlWBGCzgEkPM1+/nyuINKePBEOXyvfIERQ/TFMkoWm3heFdui+FaFkR7T+p9Oj0L2ftyrAaz0ZGYrOwutA6WzdMCsmRaZ6uGiq6h1bKHmcdopQpzOR6KmO7ZGsgvViFv1WtBJPDVyicHqvWj2iQiHkXgHN1G5x1j4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J567w+4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DCFFC19421;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477548;
	bh=mSOyn6fDaIUa/uROigj1akZ2xqYPmv8o0/RUvLGCbb0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J567w+4q3F488IdZLXxSJsRNRLaMamr4eSNUtgs3WNqPYxTpOCrEERivlrSdNIG0k
	 d3DROvmYVUw8y3xYlbYyGW01RcqkphzYvxCjrvmx3mgOxAKIxjH/P91ECUjzZ2jv/2
	 +pktY7M7EF41VjmNXCLehk4jxvZP/jVx8QDN4SOXfn7qVAcuHqsYO5rLV44aHJfjXh
	 D3pn+otlwRjVlRo9zOTV7VByin8SIjDS+Nr+XBq0hn02wVH/RXXx7WFTB9h1CynWE7
	 wTVV+nuHi9rzzOenBVrc/AB7jRMuW1ZxzkRWDGUxc9Z/w/OsOFGssEMb/wqd9pPNOT
	 MjbvaoIMRCoNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E9BCEDD9A;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/3] Regulator adjustments for OnePlus 6 and 6T
Date: Tue, 18 Nov 2025 15:52:24 +0100
Message-Id: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACiIHGkC/4WNQQqDMBBFryKz7pQkIk276j2Ki6gTHZAoGRVby
 d2beoEu3+f/9w8QikwCj+KASBsLTyGDuRTQDi70hNxlBqNMpbW22C2CU6B5XAUj9evolikKKuu
 cs5VvXWkhj+dInvdT/KozDyy59z5/Nv1L/yo3jQpvd98Yr7ypyubJOy/X9gN1SukLbIBILroAA
 AA=
X-Change-ID: 20251118-dts-oneplus-regulators-08aaa85fca38
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mSOyn6fDaIUa/uROigj1akZ2xqYPmv8o0/RUvLGCbb0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHIgrWUmZancU3qRBcKEMRSOrbh7vx+YhDN+X2
 Hmf0l/mX2SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRyIKwAKCRBgAj/E00kg
 cpskEADNBFNDvXehkx8jA6ZdvRz45wiN94bJ2q4PtYiHSQCz8l7meHQoaHBfk3ecXqk/m53r4hy
 wuS5fPIkA7ANsp7NopvkXaPhWj+sjPol/W6rIy1fkAIq2KiVQsZq4oYLFp4yky9QtFbT2quoZY7
 by5IYyJB6U4/h96Y44RqLZMAoZz6KVyHCJtn+28YSte8ed3rK6dacWsra5SlhVXjswBMfL8RkBk
 rY9kxAbWP6M25hclynVOC7voX4kiSPHUuBTxp9FntIwrpjWBYoMf8J5gNJb03CZqPeT9FSn4Tct
 7oIA7i728EoIlBiAhKYPna0A93FwPrgwk+FgZggxEyEPG4+ZAfxd1U0A7j8cWyNXRmpG+BLOdhI
 5yTt3e5UPROcL7nkHPQM5xj4sDhAkpi6qUq4HeOwT8hEJhifm+TDlTTM95iQ8p3uAn2Ga6Cz82Q
 tQ5ZVAqinl6s7XGImXoUnu79YkWDCkRsc3u5LdkNzCYguwYW7WSaTe8oCmYv6gRKZyCtL9A43fx
 46UkjDyQ0OE/PIhwtBtsfdEsKHQF0Daa8fy/9lbrLNcap74dg5QTHhG0oTxrfRVhrmv62C0+uir
 i9iBlUr1j3sOLCq8ZSKB8igQXh4uffi/5Cshg3+73+1lqcKhpMtlbLsys1dA7i5oDBzup56kN2M
 PXepJM54Hm6sAPg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Small regulators adjustments, tested on sdm845-mainline and sdm845-next
tree with recently fixed (6) and upstreamed (6T) drivers.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Corrected description of
  "arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on".
  (Konrad)
- Added Fixes tag to the commits. (Konrad)
- Link to v1: https://lore.kernel.org/r/20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz

---
Casey Connolly (3):
      arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
      arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
      arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-oneplus-regulators-08aaa85fca38

Best regards,
-- 
David Heidelberg <david@ixit.cz>



