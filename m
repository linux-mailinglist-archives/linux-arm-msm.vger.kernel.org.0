Return-Path: <linux-arm-msm+bounces-70269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923AB3110C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8174B16D594
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1372E8E17;
	Fri, 22 Aug 2025 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNmQu34o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACC2E4242;
	Fri, 22 Aug 2025 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849664; cv=none; b=YxyA5QuJ8DFEJHf9ltpM1XTv6SziCPQa5eaMrCSVPwEt7TPy/dSt+EAeL8dyxACO0fqH+UkyBmuiF8zfY9xaz0urrTrw/XlJ2YKDNTrvO4w0TQ/otUiY7yVmfcxKs0ObKmOdgYFfN8m1GZL0250m+Zley9d1dbW60qEULxFU0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849664; c=relaxed/simple;
	bh=uC26JqEiQGbtiNiyp2VYco+vwNHUF6suPmJlWVXzIJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLOtIE5lp0cxH9xsJNNE5MqjcAKEXNSYWXvRX5VZOCZzbxOyV9kY5jhlhLBztIhAJ6xJ1hae0y02J9NtrMFOgFvnReRjFGiDotflbhgJ5dypXJBbhyJQ3/r/qCvQKrUwyrxjziSx3tVDUOE5/bdK1wP2BP8dVvymqiG2ND5FIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNmQu34o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64535C4CEF4;
	Fri, 22 Aug 2025 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755849664;
	bh=uC26JqEiQGbtiNiyp2VYco+vwNHUF6suPmJlWVXzIJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNmQu34oDae4aGvQ92XUvdZFIB2IIp4cJd0MqufArJOmPa4rC3KByJJxffyRs4UKy
	 XLX+iFctrzYXh7ScVje3WY5iPV42ZcpEkJh5d5Cfbi4J0eOniq3xwoO8O/ihtik7AR
	 D3C0Y23qxrqs4sYV7UbCc+7pLI/fH5dET05rGqGBbYCOZZWfsoIr7I036z7iDBKIVd
	 E9mXUfV+IpoZbs+9/5kgJYDzlUC7iFRTr3TJcj7UmaPJQPs15RkOXMYr2SF6Tw1fb1
	 TTkybRTpEH0N893BWPBBVSp8ZdHmz8KCPLFkIV8wwyhwTcsr6hNVUOQoeY0rjKM4et
	 aM3ENDoqQ0s2Q==
Date: Fri, 22 Aug 2025 10:01:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Gaurav Kohli <quic_gkohli@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
Message-ID: <20250822-evasive-baboon-of-piety-82dffd@kuoka>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-2-97d26bb2144e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-2-97d26bb2144e@oss.qualcomm.com>

On Fri, Aug 22, 2025 at 12:25:27AM +0530, Akhil P Oommen wrote:
> Document compatible string for the QFPROM on Lemans platform.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


