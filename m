Return-Path: <linux-arm-msm+bounces-18285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680418AE3BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C66C1C22995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 11:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB997E578;
	Tue, 23 Apr 2024 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUPnNotJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57756657A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871302; cv=none; b=lY/Y7FKUm5zcp4XQK4SFaMAj3qiJidv5RVFfftvjfA7u/pyAO2GOFrs3zL539lGXBC1jqbmLvem+Emni3+bMsthHpBXthIUuWPHoH4NK9bYbJgSJMxcN94Nf2hX0O6hRy1/N0AH94Z+2jaRIZuUSssUxKEvrgrky9mNvhAgNLYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871302; c=relaxed/simple;
	bh=FPC/+A/W07/LPB/AsnyEcUqbJPV/dqND44/U5fYSxCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOjC1B+gNLMA6JS4DtVRdTG+tI4xzOUlH0KBnhXGN99uasuPgYO2+X7lm/rJLo9VnfeYAuYZCzfJ3hyXjzB06jGn2ty4maKPYKMbloPBJJujIAuT3li1IWurHChI9P5AzbkmhtrWcU5aHXprs/wRTnK8XzW4OsKY3UQ83q954+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUPnNotJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713871300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MNrVKhziuzMI2zBVcw95ga79HUtR021DvTlMsoiMS+8=;
	b=MUPnNotJ4+Khhud8TbNRtitoLywhRysnREsRh1UTbUFBpQTkLmks2HFDyYQsYCAah+aZfL
	E0PZCtLMO1r2lrMnNdLSywJUc++igV60Qvgs2sJqRaof07Pt3UMFBvTwNEBl95C0FDfLR2
	mbwbb8rbiFgKNulIDKk6eHmBEqMfGJ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44--crJqeJJPT6leRdRL7zdDw-1; Tue, 23 Apr 2024 07:21:39 -0400
X-MC-Unique: -crJqeJJPT6leRdRL7zdDw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-349a31b3232so734652f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 04:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713871298; x=1714476098;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNrVKhziuzMI2zBVcw95ga79HUtR021DvTlMsoiMS+8=;
        b=mF2/mUMlHlPRRm1+frin8R2N92RW1WU3pUe/E4Wh/GkNP9vyYm/sg35pdq4RgIIDsr
         aisr4YUHeP5ElIoLEZrK2w+JqrXw+BdKM17OImlN3PcF6isNFCDpUjx9ik9iWpC8LDNM
         2zAdGbCY8lKeDLb2ARYa8m4RGWLFnw1pWDzBvl4+pchugaAiTHixyo0c290Le8zclCvl
         xKgry42njQR63m9AlDTFJqJAzpYW4z13POPKcVN81fupVj4xA0JBYWFbgQ81g4O3uRfD
         3XqaC5ET612OUDEanLCAdz3PNIal8UEh2Vl/LfL24VdTJZcqWGmSTEBNjGhQlV/o8YX3
         /ITQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgT5vzwQZknUgWMRYyfSWeEVbNU6eszuNZLoiEw88gUYe6PuOoW2ipECHS75XO+z+TCviWpOELVSEGp+RcANFVUzqF4Jz/U3y4NuMCVQ==
X-Gm-Message-State: AOJu0Yyah5AVEyqmxvTNFm/dIiti6+tcWzHPC3nPEdDlPBX948NKBy2u
	vpJHOjYT3ubdmr8q94Uq4uZDP1tAoebTn0Ow41M6ReCYc4C1reoJCkzl8BEz+MmgD+TwFIa7EuD
	B6Qid8HM/rAoi8SZJFJoAFflK0/NbUfh/P45ZkfmKN+08Wjwdtil5od4VTmMDQzE=
X-Received: by 2002:a5d:6392:0:b0:349:eb59:c185 with SMTP id p18-20020a5d6392000000b00349eb59c185mr8337084wru.1.1713871297877;
        Tue, 23 Apr 2024 04:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRZrQIdtAdVqxweYR749d1ytwQmJBTSpPkkXtSfywePk0Gd+s8/DoFq4o+RnrozeutvVYdjA==
X-Received: by 2002:a5d:6392:0:b0:349:eb59:c185 with SMTP id p18-20020a5d6392000000b00349eb59c185mr8337069wru.1.1713871297474;
        Tue, 23 Apr 2024 04:21:37 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:172c:4510::f71])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0041aa79f27a0sm2700658wmo.38.2024.04.23.04.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 04:21:37 -0700 (PDT)
Message-ID: <3a09d8e47e4c59aa4a42baae5b8a0886925a94a0.camel@redhat.com>
Subject: Re: [PATCH net-next v2 7/8] net: ipa: fix two minor ipa_cmd problems
From: Paolo Abeni <pabeni@redhat.com>
To: Alex Elder <elder@linaro.org>, davem@davemloft.net, edumazet@google.com,
  kuba@kernel.org
Cc: mka@chromium.org, andersson@kernel.org, quic_cpratapa@quicinc.com, 
 quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
 quic_subashab@quicinc.com,  elder@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Tue, 23 Apr 2024 13:21:35 +0200
In-Reply-To: <20240419151800.2168903-8-elder@linaro.org>
References: <20240419151800.2168903-1-elder@linaro.org>
	 <20240419151800.2168903-8-elder@linaro.org>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-04-19 at 10:17 -0500, Alex Elder wrote:
> In "ipa_cmd.h", ipa_cmd_data_valid() is declared, but that function
> does not exist.  So delete that declaration.
>=20
> Also, for some reason ipa_cmd_init() never gets called.  It isn't
> really critical--it just validates that some memory offsets and a
> size can be represented in some register fields, and they won't fail
> with current data.  Regardless, call the function in ipa_probe().

That name sounds confusing to me: I expect *init to allocate/set
something that will need some reverse operation at shutdown/removal.
What about a possible follow-up renaming the function to
ipa_cmd_validate() or the like?

Not blocking the series, I'm applying it.

Thanks,

Paolo


