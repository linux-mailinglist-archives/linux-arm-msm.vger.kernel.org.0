Return-Path: <linux-arm-msm+bounces-56718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434AAA884B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 19:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEAA13A3C64
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A97E1DED53;
	Sun,  4 May 2025 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+GO2Kb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82D4A29;
	Sun,  4 May 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746378567; cv=none; b=HTTwTlDQmpcdY3dZHRjAvQIhe2n9TgTFJW+UkpYKB5pDqOSWpAf1iLjXbOwshfHob+9hnsSc9IKR37vU0D50rZl+VKaZcvZAM9jeWYwmqVhk2ymnxlbquWQJgzMcI5cfHBVew2OqRANjpv11tZhKU30ZoFs5ELc7xc5NtRYE3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746378567; c=relaxed/simple;
	bh=92AEqlenUe5Nv1fFi7NCRuvItiJmUMKUrd9jJwbzQhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZ77moiaqM8V8fyA16vhjSxRzoQp5hTfhkhZjTiQmUezD0hysUSD/EB8VHuvjMOFGJUWgzm9i22Hb/XuA0jpgVPL4Gd0Tr1d5EEdaUbS0aVDewfn8G9y2TNY+XB7ThVQIeGhCyl8qfwcJvV8+U8pQgZjcIYKx4h46f5R8mPcNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+GO2Kb/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5440C4CEE7;
	Sun,  4 May 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746378567;
	bh=92AEqlenUe5Nv1fFi7NCRuvItiJmUMKUrd9jJwbzQhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+GO2Kb/+msEBeUgksuEU3BZbH9o0CvSTOGomba/MUmfJLbycqr3EWFjN9f6CVsEL
	 uER8KvMmKn3nsZz/QDBd6lW6Ddnlp2jyjWmcXwIRQzQQyUGBL5sakrmMXYLJ3ZxtxK
	 kOraRR2N2qQewi5q/D9ku83guPAceyN6ECqZlkMGqsBxjzEciafE0QYOnhb/idQGpe
	 FYsejoRe9m8XkxIUIhRU3bPaCjs0w6xN1Z6rxCXQjThdHrRvpnXGc9MK1GCNZwA0Eq
	 rwN+w3nb5D0dYeuN7XJV9Dul6Df7KJvgfq1UL4Kmjqllk04gi+eB7cZAJiyh+M6ip7
	 ZdiUBxFBD6ssQ==
Date: Sun, 4 May 2025 19:09:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, 
	quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
Message-ID: <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502171417.28856-2-quic_ptalari@quicinc.com>

On Fri, May 02, 2025 at 10:44:10PM GMT, Praveen Talari wrote:
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    serial@990000 {
> +        compatible = "qcom,sa8255p-geni-uart";
> +        reg = <0x990000 0x4000>;
> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;

Why isn't here wakeup interrupt? Commit msg also does not help me to
understand why number of interrupts varies.

Best regards,
Krzysztof


