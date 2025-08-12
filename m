Return-Path: <linux-arm-msm+bounces-68640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E759B21C34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 06:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5112A3E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750BC311C0B;
	Tue, 12 Aug 2025 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtEkAWmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBC56B81
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754974014; cv=none; b=r5YqOU/O7r9nhrQue8C6vdLvu5qNQf6Gtox9bZmRsggYFTV1SWpC7+urbHgY/vYRcbwLjEZvaTrNgjjqSz/6qqTKDaIDpWMHCNWoyQ51tZbOfETCImrGgo0SbDWmpxH7WMOVlvR57CmW9gg7AJAyYE+Fdumc4g4xXTIHT9kGAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754974014; c=relaxed/simple;
	bh=wC3ytpNQLFhZ9ExmBiZv2b74og9kvNU1YGCPkEuFVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjf4raLQ39jvcDARSHtpSuFbtRnry1SZrTnHQ7B74clhAq1jXKCET/0F2kKXQlUHr1kdQBght5jsAHzJyyhXhDsy6S6PbgIpCyYfRrGADdm+NYcWL2zaOHZvh1ECi37b+/sg/d5ahZ4QXuJbWF1fCEFv97B7YLBFhxoJrrk4lJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtEkAWmM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso5538625a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754974012; x=1755578812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/PAp/p0CKEU1PLaC2oOhrdXss1JcDMsVFpCnTxkIB8I=;
        b=mtEkAWmMoD3Trl0Q+VzN1HOiZcJw4vXeUCB5pfADvIHMbGRFsQXIxJu9T31YUGDv5T
         YH6KGH914GnyqyAYkgpWumapQdTT0u8r/7/yoANfqZnU7r1Sq6s1e6XNXWX1+B2PqziF
         mFm5TcP/EcgsWtUaJiDJvWgOCjNZDEeoLDHY5ijqbGIu2UJE4lgqCJKnUfR699X9dtW9
         IHo6PaWpcrQhR9UrNiyU9dZLq0/IgUOxxS+o6rI0ajnoSy7raBPEolSvnsNCoCJ7Vp/6
         YMO9ofWHfOeeiMZnUf89QcntlBKSSP6FBvNJbK5mQv190bgUo4Kl6VzfoWX5XlUy/VO7
         5OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754974012; x=1755578812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PAp/p0CKEU1PLaC2oOhrdXss1JcDMsVFpCnTxkIB8I=;
        b=cAmMyHd8zs/yeFrSRa+yLXKKPMZF5oUkrL2B8Ttk+s0IDKFszaD8+YyTNPMmX9EsIY
         lUKwXXT2YQ133GmhP6icrgHAcn5c6gUq61UUdlyjKsnZFZzgCIUF4rrgjEVGUwLsLgHy
         EzrXr+lyNlUnnGHuGQNcfBk5tlptntOmlZGs5iY/wrEb3cM16hXKmdNZRJSO8o73n5zu
         WmTfjAqIbItDV6FnHmSwL9JJxRCJmzUPsEEhg7PidEydSBLpEd8nxxS0yTeaiomlQhFe
         9lYMTarf6McgsFOifUjjsJf6qdIkB5jlv3ACsPCK8+cQKFEg44ZPXF2XIv7rVzWv/qHm
         E59w==
X-Forwarded-Encrypted: i=1; AJvYcCUKKwfHTbfE2u8JqE1PyDbJL/8Zc+paSrflKIYvM6jUYQauGZXhRkcMrlQPjdCmUfLuxjfdDCvZqy66zvvk@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRE5YUwhzqSvCvJR/3ZrPZqcXfNP7wn+YgFOz5RnVNP+bxHCW
	FmGCWC6l6p5sjn9lVC8N2wDvNAWmnX8l+K7rzV9kBfGp71YTAOmPRpH6czXCnH2EESQ=
X-Gm-Gg: ASbGnctZSotdjgV9DGXkdaH6IFJiORmvihJTze2PK2z2HX5FjKe9kYKgowHmAfSoGco
	Y77ozqdVEut1Uf80GFwHsl6dqBN22pfmFx9OBCGEO2gjbFy0ouMxYKLwP7At4J2RJyEYFyKmVo/
	od6ys/sH354GTNAmS0fGsS+vrVHGWOZBZLcFhzjN6Qwa45N/x7BVakPd1qY9W9qDBGEZTeYIO8i
	9zOHij8jTaN3jQJqdGkyfj/NKsrzYG/1xYzaeFcpbO1GAKwFWVK9t+WrvAPjGTH8edK0A1BMEYI
	SQ/WwgxCyJmibjc1lrVa8I0Gg41s+83Y+3s4Epk6Y+i6VjwO+9zOfaK30WiexR0iGhyTI3i44VZ
	OwsTK6mz/PkHY9io3R+6OdleS
X-Google-Smtp-Source: AGHT+IGjPX0id8Dv8vez0mnwgena9eAtzVTtJZ9HyxZHou00TWOaELyAHtHLqaUQtbKMZdNuqWLIpA==
X-Received: by 2002:a17:90b:55ce:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-321c0a6d1c0mr3313417a91.15.1754974012349;
        Mon, 11 Aug 2025 21:46:52 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32161282ab6sm16525053a91.26.2025.08.11.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 21:46:51 -0700 (PDT)
Date: Tue, 12 Aug 2025 10:16:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCS615
 compatible
Message-ID: <20250812044648.7rifiugfjrdso6f6@vireshk-i7>
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-1-df24896cbb26@quicinc.com>
 <3xki62glazqka7gngvrz3jifk36vkjlqjm6gv4mg7lqbhnnlsa@ryxyt2pcsfk2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3xki62glazqka7gngvrz3jifk36vkjlqjm6gv4mg7lqbhnnlsa@ryxyt2pcsfk2>

On 11-08-25, 22:46, Bjorn Andersson wrote:
> On Wed, Jul 02, 2025 at 02:43:09PM +0530, Taniya Das wrote:
> > Document compatible for cpufreq hardware on Qualcomm QCS615 platform.
> > 
> 
> @Viresh, @Rafael. Please merge this binding patch through your trees.

Applied. Thanks.

-- 
viresh

