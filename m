Return-Path: <linux-arm-msm+bounces-45684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC05A17D69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 13:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B147B16840D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAAA85931;
	Tue, 21 Jan 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRXUoDCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A51194C86
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460819; cv=none; b=Bvwdo6OVa2P0vSduvd+Vkfb72vJa/pX+Zdnwn5QCD7Dt6Ne4DGq0+JlZC3hpZEtc0Xqwgsu5WJEgRhQn6YywmucrtAQLBwTy4vPFN8CsMvSwNTCo364kkeCiu8cU1Z2oXNbQtrAznYIr/Tm1URFPkKsZ9hFfnlatxiB5shMUbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460819; c=relaxed/simple;
	bh=nPI2Tu4vDg6QkI2TbRafgsvHSTzFi4qEsYFDwfP2l9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3qdug5BiOFMXfSfI6VEQ8c18UmDqDhMZm/B9xgg6vnBmrdKMZZTiLg90dEvaAWTRoejR8a+NIYlt2R0m+Jwf5Tf0/nPEgXNlJOpCMzoZgNllzmzIsPxkcbC0xkieqHcCfQxWuN1/qGVJkAf7Mu92/uglK9n3UXI0rrnO16aMjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRXUoDCJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so5822822e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737460816; x=1738065616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4P/Zn5V8nKpm2eBo6r/BEgRfBZnnUZPadl+oUkKO3o=;
        b=mRXUoDCJIhm8uElHrArhUjF9tgJXputNsWtqcg4Yv8HgFGafOLDqOoN3bet0CQUvlU
         aCfKLCnYwh3P6awa6ZkDT/Bl+U35SE43dD6JomzN1oEGlTVi6Alp/sIzMy9WgnJ/Hjkj
         pb2W4Elwu69diWnPVcKNLqh/Yb+5YIVoIHp/NVqlQr39qkUTAxf6YrSXr1lc+c3I05UN
         9MuW/cWqUr1vbQaIMZW6FW5laKKlXACAz5PFavdm/eVFaPn3itui/Pt7kxVovZh2iUH0
         eYfzXj7GGxFGtSBqOQG6k/F3zNoAhHrmDoRx/9XhDQ0dyDafcYBjkMOhIR1zQjPTgE9r
         UTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737460816; x=1738065616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4P/Zn5V8nKpm2eBo6r/BEgRfBZnnUZPadl+oUkKO3o=;
        b=GQRcbJOtT6PHV3l7c/8zhD6pS0JFLx6FjqrZvGc39tgpMN6aCs0nRnQdybsNZ6FN1p
         6kVM4oQxJMBYUgDB6XqOMqMw/bMN526zjLjmBLu7gf7j7FU2kGxToFSahDdes0paSkUN
         6TnaisHrIYAczYWLW1Ho8zlU29BEg8AhgJp2t9HbM7+QJFGH9W8ie1bfx39UkLlZWaGF
         7GBkzzybx6v+Ud96nA6yTHTTs2GDZub99zWDXBPZKMTuW7SGlAYNQjCMHL4UT5Ju0x+i
         Eg60yhVcYU0CnI2uMELFMzAtmumTN6yyJXhe35yF2V8aT/plkAALxPXBRt+DGaX6ccrE
         SsDA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5NFs36GPKzapKOZ5i0mIu6QKsJOrU2w+inpRRSB0SuSkLJXs9YuH/JzBbG2bEtUXdclyug3nW1UXc6sS@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUhquDjU1x/x6oSDheFOdovKNAMX9x9KIcOXlfcm9krkMAFgQ
	apHmqZsyMA9ub3aRTil8hKkCpH5GAzlSVBTS0ZTF1I1yxFlo/HNLP14Y/CkXkcg=
X-Gm-Gg: ASbGncumnvlOxSg+e+p5Zjc+rJUAsv7WfOYp8kCDbA0qEIDNqorBC0jl7984a2aJFoQ
	SbyX+Pel75opxzU7Y01nUYITjot+ip7o5KRl12EeFOlK9OcFv2zpn/XulC3zKAJtm3+7B7DD+/I
	6V2jcnvrhdgzx1g4OxXgHWEXqIoCY0hEL1fC56LuqwKxId+if2sbWVS69D+jVDuFKiZ2XWhBTv7
	yeNy9MLndlvan+NctDw1YqVsDR3m46OYqw4Pjg49NIujL6e6gvV0jyr68Jht1l6QzmURq3ovACJ
	ZzWW+kHLPDlhYBkv5cJU1Hpb3EGg3dC9AreFhzZLo/kTxP8q5Q==
X-Google-Smtp-Source: AGHT+IFCmc/JAhkLOPNv7f5yLzYMWONW1GAPcT5mOvgv7rX5VI+rhMMKYFVHMonn9Pn1wBdbPFsNzQ==
X-Received: by 2002:a05:6512:4849:b0:542:29b6:9c1a with SMTP id 2adb3069b0e04-5439c2877c7mr4917779e87.51.1737460814966;
        Tue, 21 Jan 2025 04:00:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60936sm1838789e87.107.2025.01.21.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:00:13 -0800 (PST)
Date: Tue, 21 Jan 2025 14:00:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
Message-ID: <ish2ucfiwb2wmsjhadcsdirkawgfcpuc5fmz27ifved6d66itg@eeo5jcg6sh2j>
References: <cover.1737459414.git.quic_lxu5@quicinc.com>
 <a24385bf8e4c25228f853a14294902c483737c4f.1737459414.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a24385bf8e4c25228f853a14294902c483737c4f.1737459414.git.quic_lxu5@quicinc.com>

On Tue, Jan 21, 2025 at 05:24:04PM +0530, Ling Xu wrote:
> Need to remove the context bank compute-cb@10 because secure cdsp
> uses the s2-only stream.

Please take a look at Documentation/process/submitting-patches.rst and
rephrase commit message accordingly.

Also please use necessary tags (Fixes, etc) to describe the change.

> 
> Acked-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0aa27db21f3d..81b2fba94841 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4585,14 +4585,6 @@ compute-cb@9 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@10 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> -						iommus = <&apps_smmu 0x214a 0x04a0>,
> -							 <&apps_smmu 0x218a 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <11>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

