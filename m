Return-Path: <linux-arm-msm+bounces-16757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D089B773
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 08:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D08E1C20F9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 06:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2B0849C;
	Mon,  8 Apr 2024 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqAW1Qct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4D6FBF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712556300; cv=none; b=FvdwapPp+FdGz6BieZ1TbMkvGGcUY0+LWZehA3iPOLtu6LWxgouLz2HRAiD1P/QIuUdDXuopEPaKtHGVKw/FmLzTvdAYAsG2GxlwP9N9q4vndH9k85ONEzyAss6Jbwx30vFyvuGaJpdzgxp816tdixqym/LVt3CMEWxvfazdT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712556300; c=relaxed/simple;
	bh=fAuNEA1i9zp4LfY4v9NLyPlSXuhbvpQ2lcsUTLbM0Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6wcL4BdIA8jNpDGiGt1h/PPwO6Kbv8BMovbxMSrRvNI4QvHjnEp4LO/VBxme4noQhxk+nDnfSCJDBatDMdy30GCrl8IgMkY2ZHzEBGc/j8fjm05az9b07gcNAf/Z90tKgwrMc3d2SrxQvQ5RsdMNgqyRiv61Q2wXmgLeyvDdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PqAW1Qct; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso789647a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712556297; x=1713161097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgB1JIhvuY/BO7MAAZPSEqht3ry2nTR4m4F5uYSapxc=;
        b=PqAW1Qcto4V1Dkp6m1q20/CvN4/7aI6RD5I+9r8mpESZ7/snDNP/tvKVIIrhZA0eZc
         DG9Sbx9WXI7/vLTcz/JY2BWW+6SOSm6whXcVgEZnkTI/HizTjse0+zC++Q3I9JXoS3dQ
         j+UUfhZWHHQlPHl8la1PJMcBuvlvnlAREzw1hQ1snAb1/ffXeon6mYqe2NZq5aER9HHz
         5faZcxA++/nRGKSgNAG97QP9adaKkmAZ2V6EJOf+RslXxizKL2YG12HOup/SHcX+/K1Z
         IzDZHBLA0wnm1Hf0dHZ3dcGs22b+y3PVKbLa8pzkMjbDU9YU/OcUIi/LNT/iHrl7aBfu
         8M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712556297; x=1713161097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgB1JIhvuY/BO7MAAZPSEqht3ry2nTR4m4F5uYSapxc=;
        b=MOaiDQevLTDxKGBPkY4XsVRDq8y2rejLLO/rXewjXZc9OcbxD5RUAj0QdpE1ekShpK
         KneShJsezWdwD8/SrsdHvhlBaXcmep4P0sZK5sKDMTSHLHcXATPhfNqnstE8rXQeSq7D
         25MFzpNZt4ZY8SDB5Q3l3mN/yLKA4gGRVmvx6/ZyFwdGR4Yl8xPCkwQFEMO9tlfAzPF0
         WdTaKnH6Qp/zJPjqU3KKdYTciWL9ItEYDx1yetPOoc+ZwybRqGI1TJwNQXt5eRdXveIn
         jOi4c5vA74wiy7p4lStlzQADCXIaYlY87v51CSVvjSwGbyHlcwq3O9gRnMvlerK5aa5y
         Blvw==
X-Forwarded-Encrypted: i=1; AJvYcCVQJeJTYDWuelODBgsum5/HQDcU3a9Er8521EDDWeJO18V+TBhZ9C9vXZ11cG0SE8I2lki3ZbxTpTJAi46ZZu3pl3AtbHeIuce5WHTMiw==
X-Gm-Message-State: AOJu0Yy58A0b89nV9aAik3JDbT4NhZ+SCySke37ROg9aFdTQDeEPtXQH
	c67UpbJlg7/ZxSZ1USBPdT45jjTee5+Ws+Y1LIEXdVjUU7AtNWkPQOUCbfSrZRI=
X-Google-Smtp-Source: AGHT+IFDXy3tWRm2lGYd0E3HusgZ33A7ZYQowDKLk1RHjwU5BYJRl0sgFa686Sl3jgUpELE1zMqbzQ==
X-Received: by 2002:a50:871c:0:b0:56e:2e9b:1341 with SMTP id i28-20020a50871c000000b0056e2e9b1341mr5971901edb.38.1712556297079;
        Sun, 07 Apr 2024 23:04:57 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id di19-20020a056402319300b0056b7ed75a46sm3764632edb.27.2024.04.07.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:04:56 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:04:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	David Collins <quic_collinsd@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Message-ID: <ZhOJB8o9cRr7oQU8@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
 <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
 <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>

On 24-04-07 19:07:03, Bjorn Andersson wrote:
> On Sun, Apr 07, 2024 at 07:23:21PM +0300, Abel Vesa wrote:
> > Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
> > buses by declaring them as child nodes.
> > 
> 
> But is this really a "dedicated schema for X1E80100"? Isn't it "the
> schema for all multi-bus controllers"?
> 
> I.e. isn't this a "dedicated schema for all platforms starting with
> SM8450"?

Suggestion was from Krzysztof to add platform specific comaptible (and
therefore schema). Since the first platform that will support in
upstream proper multi bus is the x1e80100, the schema needs to bear the
same name as the compatible. When support for multi bus will be added to
the other platforms (including the SM8450), they will use the fallback
compatible of the x1e80100 and will be documented in this newly added
schema. We did the same thing with some PHYs drivers, IIRC.

> 
> Can you please use the commit message to document the actual reason why
> you choose to create a dedicated schema for this? Is it simply to avoid
> having to schema with either pmics or multiple buses as children?

I can re-send the patchset with such a phrase in commit message.

One of the early versions of this patchset was actually submitting a
generic compatible for multi bus, but I remember that there was a
request for following the platform dedicated approach.

Krzysztof, can you please provide here the argument for why that is
preferred?

> 
> Regards,
> Bjorn

