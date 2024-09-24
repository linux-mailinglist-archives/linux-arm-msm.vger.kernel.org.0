Return-Path: <linux-arm-msm+bounces-32375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC3984EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51190284E53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB594186E34;
	Tue, 24 Sep 2024 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoNN2a4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFD6E614;
	Tue, 24 Sep 2024 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220327; cv=none; b=mHcoeMCgdVa67CRteA2+TQPTJkPLPwS2xt4Se8Ud91WJs0H9jBotc4E6L48/bKgU0O6yA2xEcxXw2NXGiyQeSY6FmEBZpmI019rXNANi6E/517szYMzvc5G5jTvfKWo3dNJDwc3yV119dNJPodKXCZYrVIYWFjLboha3Wf9zYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220327; c=relaxed/simple;
	bh=912y+YG7XFuAmtXvG9yhctVKoh2TVVdU/C0h5V6e6Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crMJXXmi6fi/66s8ckD8C0hqYuTdkN93E+5TfC7xjel+RzGzu6i7HRscY9ilycAdLIezwjfdZkW98+l+JARYbL1a1DUVjwdGh6YgMarxsafx8vCuxOEU/HiybpRcGWueIdlHX1Qt1eYf4we2Noj7QxgYLYVhaex+Hz6oXv8gfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoNN2a4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17812C4CEC4;
	Tue, 24 Sep 2024 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220327;
	bh=912y+YG7XFuAmtXvG9yhctVKoh2TVVdU/C0h5V6e6Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoNN2a4rxN6rdy9YVVGu8gvrpAbVzF3PuANAG+jfsbEZlqyow388KK7dgyoHYjos+
	 3JZdGrab3d/ag8O576eVySaj4PyATouza3Vx4Mmo0zWz0glUt39HQRuTFFpf7QouKQ
	 4JV4miZzXUrw2S5KS9rofYHTQ7pOZsqz5oBFIpwDgnKLavDSKbNaYawW+9qS6CmYHt
	 XCVPOXcSFYMJ5v0MMNzqTuH6iojbgfKgS7V/iE/yXCJnwqsvnTi6e3RbhtZTa+sFek
	 yvT38trERskiwfWOJoIEwlOdS1JEagtZ+rB4c+3ddPjyoVyCrylDBs/j6g+tLoNhm+
	 A+3Jw9Zjf/L+g==
Date: Tue, 24 Sep 2024 18:25:26 -0500
From: Rob Herring <robh@kernel.org>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280
 cpucp mailbox instance
Message-ID: <20240924232526.GA563039-robh@kernel.org>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-2-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924050941.1251485-2-quic_kshivnan@quicinc.com>

On Tue, Sep 24, 2024 at 10:39:39AM +0530, Shivnandan Kumar wrote:
> sc7280 has a cpucp mailbox. Document them.

And is different from the existing device how?

> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index f7342d04beec..4a7ea072a3c1 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -15,8 +15,9 @@ description:
> 
>  properties:
>    compatible:
> -    items:
> -      - const: qcom,x1e80100-cpucp-mbox
> +    enum:
> +      - qcom,x1e80100-cpucp-mbox
> +      - qcom,sc7280-cpucp-mbox
> 
>    reg:
>      items:
> --
> 2.25.1
> 

