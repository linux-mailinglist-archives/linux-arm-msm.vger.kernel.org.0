Return-Path: <linux-arm-msm+bounces-65316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9EB07E28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C75F31C42DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF322BFC7B;
	Wed, 16 Jul 2025 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq5sB2FY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB42BEC33;
	Wed, 16 Jul 2025 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694863; cv=none; b=SLEEfSaZWiz/nEPkghfcZHFa/i0GFs3TmN1PVGdPpgmvCEUC2tvi7su9/HDm+8AX9b91q4E7Yy8L1asVu91SR5XuLH9MMwaOEss7+vexZy5lP8fnKr274FvDF5WRmUMvgC43eKpgQEJlLSbAVyutLLPeW6zjWpPyf1iSqEbfJD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694863; c=relaxed/simple;
	bh=jzMHanUDJeGDIMFxgKT02ILDgxEaN4iMP49kO5kONh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiEhbTQa0a8Ax35xbdA+xdx4ZhMi1l224+vffAddVoBnej3OOhV6ebLewrUiUTfoRjMdjMr2+uBZfjZnTJqajPbW9jus69Zy9EFUJBMI6hU0hFE1NbC0qNpJrOzX8AuAxD47KSqJyaZFGaCSJ/QOSp9spDZ7JRU6Im0Onx+3ZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq5sB2FY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2742C4CEF4;
	Wed, 16 Jul 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694863;
	bh=jzMHanUDJeGDIMFxgKT02ILDgxEaN4iMP49kO5kONh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hq5sB2FYAYe34zhj8X9xR1MDqA8IGGRhKXFLJ28CSO+fn9LUfVlQUpzFGvRD5RTJd
	 8SpmG5CAtCLhUbowO8jM0b5JwrEQYo6saVi8RMnGIvVaxeN816d7QH9nrADAMirIzP
	 8qkDEovDC9ifgOnltvgEZsPwz0BH98Uz2vGH6VLOanNdjGUJxHlDNX16gLmG7O0p25
	 KliY9JQHs6LjaJGU8sWKPJagU50J9vT6vaYyFq0pZ3ImwNyrjp6cXxVLdRAYX9O/vK
	 Q0ChIRmcCykk9ODjzyoybxQ90IURaktphBThhTJugfp6hLYbSLiTbIybD1xNeqh4nz
	 n5O4faGOHt1ig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Mahadevan <quic_mahap@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the bindings
Date: Wed, 16 Jul 2025 14:40:52 -0500
Message-ID: <175269485296.105136.14179247922620933063.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Jun 2025 10:23:35 +0300, Dmitry Baryshkov wrote:
> DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
> not just "bus". Fix the DT file accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: rename bus clock to follow the bindings
      commit: 84742ace114f881e92663f02ff8c6d65f3b06e27

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

