Return-Path: <linux-arm-msm+bounces-47325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D312CA2DEC4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 16:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCF403A3A93
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977C61DF269;
	Sun,  9 Feb 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWs1lQi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2CC1DE4C8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739114511; cv=none; b=mGhMQBkJt7zr8gwsZjdCYhDm82UuWq4F6aaovks8STISQZRxSQoN7c23GH+FQNnx8BKF4SOJ4cetZ3ZZLG4m8HsugX0jT/g8/gAYbMvrX6dOlDrf+wiaWF/RBFsrcYq1iPDttF7vP4gSh0vg5NwkDbZTfYJW0Nd2y16MGb3Qfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739114511; c=relaxed/simple;
	bh=B+Taz8FFto55mnsYPpqIlTqX7N41JrWkgq8m3UsOdqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcgrlNb2HmcH7cpfST09XIMCbMf5zvE6Y/SoTN2VCIiLEtQdvGwtdhAY2+g7Dz3iTQAuQYokk3eGQLjlnYG7UXFkH83zc6SZ4TW4ZcVH8pxt8XGgLFaSvaj8r+a3sRy2XKfCo4ogcBAY2u9JE2r/jGcc8elJD6yBdWgEnTB2hpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWs1lQi3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso5587708a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739114509; x=1739719309; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JljyH7L9Kp4vXvGrsHV+BTlHpLmdgYdjpTOUSBHWabo=;
        b=XWs1lQi3+dRO7oPD7nuQWcWbqBJgVQokH5fkTFGwAtVzfZS68j9/ACF/J572Om5+xs
         JWOyQwMzaVAacYRNeY2ibxmGndnkexd2dKed846fPwhIarTBvgU+gLrIFHhy3/3gRPmI
         +FmZihmgfR2jxcKthK0pTjNhXaFiFM+808fOqc9cr/yb0M2akwHe258m0i8QQSLeqfRC
         Bu/W2qv4+WPWI53jIDCLdZ7XEkW8G5T/53Y92LG+J0K6Y0OKlaTvjIz4/fW/hcAsb9oz
         jSUl43ogBpCdTeXLZ94BV0LOgVEX4PKztGMAU27zGzRKbGSE2gDI9dBNs5iolIUQApMk
         4Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739114509; x=1739719309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JljyH7L9Kp4vXvGrsHV+BTlHpLmdgYdjpTOUSBHWabo=;
        b=lOxNJqZq9JD0+QnTlZojMKNDux426BD6haLdXivSFH2oz6GV2tBOxngNMrmsLMTP4B
         2kqi4pyOppqpAENe+1W4M33O6jz4SszbSE5QSjaSNG5n8WwbqL/1HWysSORd41xvG62I
         r7ij5fMWVsrDarpdYYBX9WqnNe3FVLXg2tYazF+m9DIpyv2OMOhC9KwngCVHjFAlKV5u
         dNxZnqmhEEaCmB7/ObrGP9AcvnhwunF9lUzbbZXKmQTqi44dcL8fFNMJUna5ji0NPDRh
         LfkAfOSkt6ZzhA39Qi+7gjGG4kAaBPiXLWgbcjWXNy5U0XKuQDHK6+aHZwVaAPJk32MQ
         WntA==
X-Forwarded-Encrypted: i=1; AJvYcCWfBpAKlSY9cfNKLHguWeI+sKanDu4piTgFI6bHLbM4e/c0vXnmqyZ+1CyQqaIarJVg3DQMFjoj8dxPIx9k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk9hFxsif0lINZTZSm30YMGHl+n+o4BaNSvbiw2nHXJyai/lPS
	MSoVDkx4/5K/c0jqcsp4B/OjCJ25nIkLYjaOLQRpF91kL8vtq47hQvgWmZfvRA==
X-Gm-Gg: ASbGncua6jNJEuoNokGKx+OVDyQ89djVt+PEVFHLG9c8ykwTGQcGdWNLSF8CHRdOB6d
	p9UaS3V/NspgfPQjTsRNf6iN/qBsObUZeyUvGo8GCVo615ltpwUb9xlJHx07B9BCtNalTyZiRlC
	cvco3lWAMR7vez3Pv2rXjWjNP7CYi5co6/bg/A0IVE+SvToaU2pG9ZMM8S9McVcJVJgh5y8YTDR
	s73Uogsb3Mi/9tCWun0tPej4FI1ucUjlyDOLE2uE0yW3pEkih1FHY+HJGNTDme6F7S388V6mXg3
	LAR4Cc1TmNL6Thor9XVj/oJ783+C
X-Google-Smtp-Source: AGHT+IGWNpvwwkvO1VPlAyxGXl/1r1Q1NAlHKL3FT+xI1xaRL3g54LRlf6f/W3+YFvSs2/+0N4SfAQ==
X-Received: by 2002:a17:90b:3847:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-2fa603e909emr5034546a91.2.1739114509226;
        Sun, 09 Feb 2025 07:21:49 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0b9c5872sm3020467a91.0.2025.02.09.07.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 07:21:48 -0800 (PST)
Date: Sun, 9 Feb 2025 20:51:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH 0/5] Add UFS support for SM8750
Message-ID: <20250209152140.cyry6g7ltccxcmyj@thinkpad>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>

On Fri, Feb 07, 2025 at 11:47:12PM +0100, Konrad Dybcio wrote:
> On 13.01.2025 10:46 PM, Melody Olvera wrote:
> > Add UFS support for SM8750 SoCs.
> > 
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > ---
> > Nitin Rawat (5):
> >       dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the SM8750 QMP UFS PHY
> >       phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
> >       dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
> >       arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
> >       arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and MTP boards
> 
> You still need the same workaround 8550/8650 have in the UFS driver
> (UFSHCD_QUIRK_BROKEN_LSDBS_CAP) for it to work reliably, or at least
> that was the case for me on a 8750 QRD.
> 
> Please check whether we can make that quirk apply based on ctrl
> version or so, so that we don't have to keep growing the compatible
> list in the driver.
> 

That would be a bizarre. When I added the quirk, I was told that it would affect
only SM8550 and SM8650 (this one I learned later). I'm not against applying the
quirk based on UFSHC version if the bug is carried forward, but that would be an
indication of bad design.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

