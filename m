Return-Path: <linux-arm-msm+bounces-14902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E98874D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A4551C22436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E86482877;
	Fri, 22 Mar 2024 22:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QegqF2HL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597968174C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711146732; cv=none; b=hh/AJddQlJvpgA2HmU1Pmqeoa3UVSXsqBV8EBWP9XBipZs/ady7crZQSzJqNPuxsr9HCwUTUtSb9ucrGY94bF235Z3BjqQS3elV0SNa5SZoB5utFxztavcolC0FiqqbREvNvOFlkiuMxVloWDu7bNzB7wueeylpEeRjvMyFB2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711146732; c=relaxed/simple;
	bh=SqoB37OT1HojDKRhowyuuzQ4ERbxzLBp6bj9r5cbVYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lX0GtJ0VnOgm6XkluNKdHm6MKNRB+omj1CSgQipn5cX7NAxv9oy2mAOI+GC0H5fP9B5k31hDrvIkYy2LDDuavXHUh4OW/jNlLFwkadgQC6HRrIXb14+vJV9bZcHNOp9+mYSgjfhldLh0NVBWfn7VXyuolHLJIelIrMRuKcN9Mcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QegqF2HL; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dd161eb03afso2334601276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711146730; x=1711751530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1a5pzjd5I8Z/mJlSaH96qG0n7ip9wTr8Kfl87ju9Mw=;
        b=QegqF2HLN8XPZETmZCUND1lYGIhpClbZxuugg2tI6vvE6qnzi4NNLdlX2X7Xp2QgMZ
         VyYbaxx+Vqd7ErgAvPqNsnS2pRYBblWEZeF+2WrJA+PQn46Pu4Gxo25fECJQbiKGz1L8
         iBQINq5C5oHB17e7VXI5bCLhozJ4lba2RjhZ2CjAInlGGJLqVEXpJBRAlpDyU0B2Vm24
         3dr99q7+nh23HjzzIkttiMs+x7XgwI00sX15+sn1CH3iduIwfz957j9e1KC15BmZl9I2
         AGcPy63KaBBV8YyH0hSNdS8/WX7AXKGeuNlviA8Rgy6zJoBiNrHLrrJxjpuiVvrEDiaf
         j7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711146730; x=1711751530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1a5pzjd5I8Z/mJlSaH96qG0n7ip9wTr8Kfl87ju9Mw=;
        b=n4Q7d071ab3ZuTpF0sHEXnCq0DcuElERTXC/6JLVkZ/G4PJvlDOLjQuB62FFS3npZT
         /tZxm8wepFWQYoXpr+KCCMyf6++Jfzy+nC/eONSPGTdI7de2tCVWKcXDYvOu80tu6Mla
         40Ah09hT1ADPEKTRJnjnu734jETwJ+2OhlpqLDEam1IJKvqQ4IGkkF+g6NMoow3hIIvM
         NE4n7QOmOMYvAET/j1Ll+gUmYCr7APIHZilGdmZWgbBo9DnHHC33t0MmcLzH9p30emKH
         5DhWsr26DyDAjqi0gdnICjL8GGYnBFCI9fmUHNmRbu+C25Vhe3BtZ5iWGy/jd2Rt/S+t
         ii6w==
X-Forwarded-Encrypted: i=1; AJvYcCVIl2GtBowZuv9gKBsUdUlcVeEM3ou12kQZbnwTEyPlyBuDKgC3708bpeXDYlD3C1nkOC/OeWIdZpmTBC5hidHirQ4URMtZKaZlffLahA==
X-Gm-Message-State: AOJu0YyZQ1JeyEy9/F1zSKPIspKuj6s8z6qpK0Cx9KCEAgnDjGQ/EvYU
	LtF2/I3LmGjFa/1AFEGTMOA1C+FbKLiTRBwQb9wstdeKJUrysbQsuEp3dyiy3EQAL6k6EKmrzM4
	2JE8pKwqv5eURt14/Kh/NDUtWo//ElTr3SX4SyA==
X-Google-Smtp-Source: AGHT+IGLQFN+Cx2L6/BR6lRV32tv9zuTfkKLRJ9nOBrx94hSRHDg6IOx4CBERz5ZDrf0Vc5gYEkGqgbLxSkOYOtCH9M=
X-Received: by 2002:a25:84ca:0:b0:dc6:e4f8:7e22 with SMTP id
 x10-20020a2584ca000000b00dc6e4f87e22mr651683ybm.62.1711146730353; Fri, 22 Mar
 2024 15:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org> <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
 <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
 <5ea4a187-1971-4970-a289-826d96c0351a@linaro.org> <c0f1e898-7638-4b7b-a938-9e31e5b57e57@linaro.org>
 <0b091595-1587-421d-bb00-c00ef729d143@linaro.org> <CAA8EJpqvwhafFoD_=GO4E93JBQA2A+xY0rG14pgPm=xgJ9Yz_Q@mail.gmail.com>
 <7cd6768d-780c-4cdb-8091-c7a161eab23e@linaro.org>
In-Reply-To: <7cd6768d-780c-4cdb-8091-c7a161eab23e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:31:58 +0200
Message-ID: <CAA8EJpoDZ0cQmKk=MBbQf446PXZf2-93Ne121osyUGRvABoing@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port description
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 22:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/03/2024 15:49, Dmitry Baryshkov wrote:
> > It's true that we don't describe CC lines. However In most of the
> > cases CC lines are handled by the Type-C port manager directly. So
> > there will be a connection from usb-c-connector to the pmic-typec
> > itself (which looks pretty redundant).
>
> I think it more logical to associate the role-switch event with the CC
> lines which actually handle the messaging than the HS PHY which does not
> to be honest.
>
> If we predicate a name change on fixing the namespace then we should fix
> the namespace instead of reuse existing for expediency.

It's not an HS PHY. It is an HS host  = DWC3. Anyway, CC lines do not
go to the DWC3. They go directly to the PMIC.

-- 
With best wishes
Dmitry

