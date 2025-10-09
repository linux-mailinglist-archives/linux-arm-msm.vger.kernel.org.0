Return-Path: <linux-arm-msm+bounces-76664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D53BC9546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01A3E18938F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C189C2E62C5;
	Thu,  9 Oct 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RngzzyuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A742E1F1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017046; cv=none; b=MOkoyXBDevW4nDeqUrLfz9PFd2/PmM4CnJAoFDWveBzXl/i8ioODKmwwPgO/ZVqL5roDIUOKSHj8y+vSzfCEzwqxYhj2uAQvH8s8AV9P31SWlW73ULlIaydEZKPEJd0XxhnwT7cWjjxjMYdco7jKGBBDwEW24Ktg00hrvv0LCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017046; c=relaxed/simple;
	bh=mDYDlD+MEj5MwUVmU5NuaLpTKU8yZWPjWxvcEYawWcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jb7oqrsLMK9V+oF/aUZ7PQ6KO7e+pParLUTB/MP9uaS/K3N646yMhp+m+AJIGrjaDqGJyGFAKe0d0UfMzAIjUuvTGsT+3RDYLnSkT9ioFIEKndjUK5XYNoW/OrUt8ZtuA0bS+75aDTFcmTpdGI26+5u/jGHnS/OuDGvLqBl0onk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RngzzyuI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f44000626bso740565f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760017043; x=1760621843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dq7MfAZyGGxaYmEOpM20FMo+OmujRRkMe061xLULkak=;
        b=RngzzyuIaoez2cuI/KJq8yraoP1kWdrKQ8s1q7g0UqLeag5G1Bh4Tfwve3niLLzRBY
         0FlfjlertMydQFZo8KDNVnzrmcEM2KDLSYKKih56aTCRO2/kvm1eqDAlvbuxWb+m0PhM
         uuHLqbnydb7bzjc6BU35We1YHgJYXijwnHco/Uxn2bH5KLfAUymBwFDa9+scmzJWXxDs
         UKgWa89Sckdnfk8+ziixXFQrUn24megJ/6sZ954+ne32OybHd1b4LIaB1rooG3gmg7Z3
         IZPXirkA3gTpSuJucp5pVBT+ILQRpxdfamhwKD/8qm2Eqa8q0e8BB64u33RKpFCzIjeh
         P31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017043; x=1760621843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq7MfAZyGGxaYmEOpM20FMo+OmujRRkMe061xLULkak=;
        b=pahtCrJAxv/501fR9TLhobMIYQM7hFGS2d1nOqbVyp2O8DdzE0/NzF4YuG38+OMXSS
         VOoKV8ZHs/Zd8MDUeRFkpFCc6nPwgTBeQzu72cgGMG0IluygpwI+vAFGVaJ8VYNqiZTp
         JPUcd1XleCRlGp31QjvopQjqxAOM0YxEcmf0bLNO8/rHyXPv5XMw7NCoZalv24DKOi6/
         3c95HtlvMmze1QM0b8EQx9Ru/2cANrtHK8NiBUS8RFgoZrD/gqebdDdw3/2fBpl8suGp
         +Im6TgxlDidKlGqCicqBn4Wot6e/e13QMczbdNKUOe88Z9lncpESSJYoT0HdDNrrLx8e
         yNQg==
X-Forwarded-Encrypted: i=1; AJvYcCWkscPno0RtKZcuFyAq4MMezhX21vSfUKUgQNsozIHW+LlnIzMjjcxRGULVz5sn9lTqvFetG7Ua9iSU5CLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1id7Cl1NmcXPMJAq879Z2P/6OjOmOZiPZCJ+zdycfPwkOlVb
	jiHM50LXLxT6LKJ04EusaaZM8UQf9cHGf1SwNMcybPDH3u4UkL798ykDtoZlkmee+yoGndgYlKj
	zyBfT
X-Gm-Gg: ASbGncvhLJU0aXXM7o+PaT/AEwbeQQDL34IIP2nihxwRojKvQNy1+ue7de58x7EwjhG
	0UscovGpHxVR/CzFrReKAM/i1FAqEH4rizPihfhIUG/h5XKf4NweD7i7Z7t8H8+aSyIRIW7Yk+9
	l2LwXr1DiTGLcQEAPPqweavZxThwiBm4xXyI3hi2w5w5aCTGzLeSLP338QVSUDApMryg3UllUIZ
	WYkM1SM1XjT25+bi4CcjlDCVXviJPPUcXz/NanGZ7+0vze4LCIFgbGnRbxzMWTJ09P1XwWXbW6s
	eD3d8AqhONKFYRysn63Ni9C4bSLPlvWgpVREI0+rOvakCNVI6CIDSdC4W0itXLe2eyXW3b3D/gF
	YZPJBgTSHVag++ViqOG++DFWUvvQODalPM6/GO27AMEK4Csw=
X-Google-Smtp-Source: AGHT+IFYabcVFHaPLEaZdWVgfaLIPcYjQXcICeP9Ed2Hj3ZjwMcQN94p9RtEMitSp/6LIwax0gqTng==
X-Received: by 2002:a05:6000:1a8e:b0:3ff:17ac:a34c with SMTP id ffacd0b85a97d-4266e8e46b1mr4959913f8f.59.1760017043056;
        Thu, 09 Oct 2025 06:37:23 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f083asm35033794f8f.43.2025.10.09.06.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:37:22 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:37:20 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Describe the full 'link'
 region of DP hosts
Message-ID: <yblmrllwwincbchnjcdmsoty53dogkzptmap4jcupnnoqzbqn3@7hc23mopnplm>
References: <20251009-topic-hamoa_dp_reg-v1-1-4c70afa5f029@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-topic-hamoa_dp_reg-v1-1-4c70afa5f029@oss.qualcomm.com>

On 25-10-09 14:59:18, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The regions are larger than currently described. Rather inconveniently,
> some control registers, including some related to USB4, are in that
> left-out chunk.
> 
> Extend it to cover the entire region, as per the hw specification.
> 
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

