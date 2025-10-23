Return-Path: <linux-arm-msm+bounces-78590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7CC010C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422473A9DEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE91310784;
	Thu, 23 Oct 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOXcVqZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8403093B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221797; cv=none; b=tQGuZvcFonJo2hRrVR2YbeK9/C/5xxu/3geJmEted5p5Pddido6lMtt32375jweMUR+T1FMmsy5OFrIUNmSYw7zk68A4aQ0Q/hICjeukjRyNOAIL3oml0ksytdnyBb/Q+kNmLqP0zOijsnlAip8uDYpBL/cP3bYg58rwAJLgGXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221797; c=relaxed/simple;
	bh=63w4Oubk2b9HQpsZ7UfW3R8E4afh0HvTI9mB0GUsn0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ+aXlmWBaHwo5LmpGp/HR65KSLnd5N3dNuEiWNaZ0dCgV2frl8SOw4IhIjx7Hgxa3rpUys78ijIzbanV7pIrp/yd9+hL6R4zx2WljpTyaOHskXRo2u+4yPicZpOOpmqLM6kUdnRYLS8xFUVeNIVLVVrzUF3vSvfmEhZKvFaF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOXcVqZH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so4206215e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761221790; x=1761826590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsMGC1kCHKoVmEzx/3J2+LZIPEEzI0s7H5COsJ+wzeA=;
        b=cOXcVqZHhzJPb/AikVkdp+qMVGJe9QiY31Nbinlo9vOlhEMPqgvU8MOmPvxbdGoxoy
         JvRwY/gYx7Dccd7bhyFm0r3eSlSBQdwrxcneWMaCiepgg3Qamt/4du1gzR145FSZvo6S
         1AjMllEwEa1KAIt1vaouxzWSc75MmDQYjy9ZqPEq2wiwY6zv9iWDfaS+RSTXSSoZ3xqx
         FvMF8jRGqt9Kdfhp9g2d8NWlLBQBu1F4xJtbvR+XKk34ndS9fz7fKMa6fhPhr6buUzHA
         zC75FbmiTvZnwbi881wcter8Ki/Fh5RuGMZ4fM668gjobQaMzpQOITGRDzoLaPVEUAm/
         StYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221790; x=1761826590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsMGC1kCHKoVmEzx/3J2+LZIPEEzI0s7H5COsJ+wzeA=;
        b=fBnEcsZxQUYz5ekKjBDTG7zUB4Vyue3nK4ZF+bx4Q6h7W5Xe0qx1VbO/P8OqGGQIi3
         45t7rXZuQF3D3NY4NP4tn+KIWPlUFE3WZxe5GWN15lh76yDhHgVL7Hj56vwaQuixmr9n
         FFIOVcREMUXuYO3S/veoXM6AaZJ7zQSx+KXoJxYP6V0VgAggawmAFDctQnuP1qCm0Y+5
         86WvK1ER79ZCicVH+zgQE3kE6+F6dPSioW0gh0eqp721PHsc//gyxBGeM1DfHHgwu2rR
         mp3FV38loH6q9poYFNhtsbyu/jbiv9HMBOvGRFjYeHBsS+lfKsjVob1IVvaCqmwWkVq4
         AaGA==
X-Forwarded-Encrypted: i=1; AJvYcCVzPSxno/gpa/SOJOLMYQp5zGnOGebqwC6rLnTGpHTDS1yM5BuwV8Aeiy2vJtrNErItvcYzepuo0oQl5NLo@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0T1vUb6e5c9tTvI9/vEQO+eiIuRgE4E/9iqADqeHZZkJX9wc
	E556wW8KJTsUwbFEXSg2YiYo5NERZmX4H/LZTTy1PJex16INTimHRiDi+IylxoBOvSc=
X-Gm-Gg: ASbGnctsN6Ns8lIS6OzUphTryqimY0JaTvZYI4EMCbt6StZYoBlyUIlMyu5fp4LfRdk
	R1I4zu2lDWA81PUde3+Y/QGyAm+si+yLknJhwWuQ1lhsJ6jWIyyS7O8C9EPOx+6xdBweex/RfO0
	H/Rh/24W7dBzWxwCfK9ULsLGdj6TuizzMRhFzqfczrpfhkiNLTcBdkmg2rGfoVac6w/z2Qte6FW
	gPuWq0dRwzDvdwOCYpr9h1Mm5BBG7pBFbkxXBNdOGs8axB28SQiidzNt3FrmfLErnOfjVtqxmNI
	ej94x64VQiGjbvPplRH7DmTiTTM74hrbWhDx1Hc1vOrdhQzMQRjr1xgrArngk3xyJa1qw6fHSoK
	ZvJNWfAWJQ59dbd2UlGURPUqy2nsixdGRA/PgDipHdVO4NFQvJjBGT7L1b60VOn8t61oQ+mvTbR
	brW5QwqAU=
X-Google-Smtp-Source: AGHT+IHFjzVLSym4Q6bXgkW+gQE8VmDlbUGdEH4H/I7XmfcC+FQGVre5Ex5Mf79etOc4+NZ/f0kF/A==
X-Received: by 2002:a05:600d:8394:b0:471:1717:421 with SMTP id 5b1f17b1804b1-4711790c587mr119581255e9.19.1761221789853;
        Thu, 23 Oct 2025 05:16:29 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4378cbesm90781295e9.16.2025.10.23.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:16:27 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:25 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for
 sm8750 mtp board
Message-ID: <h6cpk4z3q2h6ymy565dytbza5mbldruhctg36utzdwjrd6ohjq@5rslxi2tm4z4>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
 <20251023112924.1073811-4-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023112924.1073811-4-sarthak.garg@oss.qualcomm.com>

On 25-10-23 16:59:23, Sarthak Garg wrote:
> Enable SD Card host controller for sm8750 mtp board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

with the card detect gpio added here ...

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

