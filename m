Return-Path: <linux-arm-msm+bounces-58568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E3ABCCFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58C08A283C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0FF256C60;
	Tue, 20 May 2025 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7PtjAlc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A41A2C11;
	Tue, 20 May 2025 02:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707311; cv=none; b=s875IU2sWwE/MWIbKrgXqi0k2zOC8J4pP6BuhJcH7Rkq6C+vdZZLQjpGlMXT9UmLoCh+aqZbgSOIibNQ+BAiUo/egHcfcoWQhr6AffJWRfSxUFTxPCWZhhOb8iVrilssEEmIlqmJMNAzdu8xWd/d15+V+RFw44qWNnGxP+b8ZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707311; c=relaxed/simple;
	bh=Mx0XLAklA28eCNetr9AdT2o1JcZr7nMVYVkLtVr7EWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8AZwoKUSekhEhOV4evDhgE4QIiXbsLqQGwGWsQSkDkBbB/MdwxdOGJQoweQAN03Ttn134k+/yLDTsy/maYNzaCqKQX9W5z1EbKsbXqn541mIurUSGj50bZ1TG9DVmEitgt7e5GHjHvGzrdYc9Tg2S/KDgq4x48YobZXPRgdVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7PtjAlc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C43C4CEF1;
	Tue, 20 May 2025 02:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707309;
	bh=Mx0XLAklA28eCNetr9AdT2o1JcZr7nMVYVkLtVr7EWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B7PtjAlcMpQqWzXobw4n+zingfANyjwpQ4punFf2tgqRvodUJl1HfMzVXjFvYGIi5
	 p40Gij8Nrlr50g1yjj1xnJbFFGNyM8dQkuit9Avwx02zDjUj6f8YBhIgI6rwYsiybx
	 r85wVSYj/eXXWEKkJyv+OK0/Rvv3NafXfknccdD9CwUphC+X/ls5CypSVFR31kvRKv
	 tB9XKETnVh5/ppxUkMqh4ex7196dzA15xw1+AsGm0L0VSx10Er8UkrUJFwEP0s428h
	 v7V5F6ZNhxBHUlWIlOUqY1CqVZEg6Tm4aKeKMx4sFDjfF13KiE8OBPAbRNiq5Ee9uB
	 lWr+VZAM8Apyw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Jos Dehaes <jos.dehaes@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support
Date: Mon, 19 May 2025 21:14:40 -0500
Message-ID: <174770727732.36693.3397573748594284198.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Apr 2025 18:35:44 +0200, Jens Glathe wrote:
> comparing with CRD and other dts for a more complete support of the 7X
> only retimers, gpios, regulators, dp outputs
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support
      commit: 299038d824180f21803282e445459ec5d7397c10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

