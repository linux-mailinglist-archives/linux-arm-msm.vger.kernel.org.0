Return-Path: <linux-arm-msm+bounces-78184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA7BF6EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95D8A504C7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4790D3396F1;
	Tue, 21 Oct 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs1OoVm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3463370EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054905; cv=none; b=Svp+bkGx7o/L6ZNXxGl+YHLNkg2cNOvIG76ocvB7lcuNOqIYTidWh/1bhuS/bETCcRc787YsLoHY9R0vruLfbdsShZbf/DbtMOx9+XXZ1GzDgqvk6Dwjgz2w5dmzeQ/PSxBzGlHB2f+s3mr8bvZNPDwdLEPPTReNilsgf74vLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054905; c=relaxed/simple;
	bh=dtENIpP2ymfiJq2a+uxczvxyLyuLM+4hnAglKE1I+no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jji90E23QJZ9ZRmT8V1uU7Wsv+NNTSq9+SlKidoJ6igsZqi1+NVqOmjj8VEqroFf+I8h+PGXMuus9rXBMNi+u7nBp4PE9iGH+a04XrfBqwVGr8Y55vuzeTqJoybw3yz9Pa+2MeIG0uOi0uuZBRXgM14rQLJ5KFJz0a4aXYkVa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs1OoVm4; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-781014f4e12so70063687b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761054903; x=1761659703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MZkRqgQmvQUxe0HkH7YLcOV5VrwBVz6cPfsq0k36X3M=;
        b=hs1OoVm4puVOTtiW5YZKgNbhd7ncj7IncEdJ5JkCRy2ciVfXlDyCAV5ogD0ch8ChhT
         FWIDdh8ZwsHEOpyRj/8cUBJClnR9wCE+WJiLUUZHHQfPBABgkxLIxzltzkL6EBHq8yxb
         r/LVZ2JHgzvbiUwRd9M3tzPjV9LkiDmrSYVem1EQBQ+JRvb7fDDWUAvgEccuTA31hYGe
         JpO9bModiWT1/Ca/uuIU9EdCSOfCZAnMucQVYwbVaCdK620HVzoEoDePL6im2E8WD7VP
         3PJnI1jNWpQOmgEM0tWumPq8RHTuczLWxBPT0u5UmGSGsLDW4ZhixaygkS80rWwjswyR
         nOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054903; x=1761659703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZkRqgQmvQUxe0HkH7YLcOV5VrwBVz6cPfsq0k36X3M=;
        b=UMMngLKUsE/zaVFbMgmY325s/iqiipiQqllm+aEdfRlLHXxUiQ4Ngmd6uY71xw8Nzm
         0x1mQIC6aC0F7FNxgfL3OZFS18q+S3C1/vpNpaTuAMXITXmyR2S6OPcjdfj5eGxSxULB
         yiSRtppCps8Y4H+Gf3gRPUwMqkTbAUyVATuwMSGrGLGo4rgOBoMkRkfDHm3bII0cfHjw
         ivt6/5c+RMLpifDypAM7k7MDwN8QtXgSOwI7XbI4DAtQyVJIK+CXdrrjFoRxvA38+2Rq
         6SnCMZqcBwS8O1BNXNltcXgA6kgIqIFHNGVIyOiBxTfeWa4IbKmUKmZcMczNcnX6ngvP
         Ey/A==
X-Forwarded-Encrypted: i=1; AJvYcCVOa1nWK8/wNshwA+TvUwzjfFIeHbNk5BqIZZlq/+1zvZOFnoI2FJ2ibrXTWeUYQl4eAw7SKtLdOa1lmrQj@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXF3MzCAIHKmTbjclQTU9AulSPJ/68o294YVA+5klnVGzNX+N
	oVl4RTbeqizHVUcdONESRIt4a3PWQ0OpgaZBqLog7ItX3OraZcZvxurcaKOc0egUFqR5qE34kZp
	qHSxCt/bF/o+HE3PdWfItM0AcHc9XxEJtExIOPdhdHQ==
X-Gm-Gg: ASbGncuC5GN8fRyq5UQVLOZa/XJjC+xBgy4y5nq9tVRpeCwiOk/kGb7g70o8YQM341e
	Ic7vqqBjAH1Qo9bwWagBzlivSuTPJ7Lo4YjIEW0GKvm1t3kMYxn5IHtUjSIpGWLyXmIRFQ0aFy4
	ob9vkUb5PVk3ZvqJ8cTeASgZZ+9dtpRyYCwho44JcY2JspNN4e1NyJVzl9hsT/8teCx39Ma0dE4
	eOhIYv7dO97/UWT3v5gK6es6FKIJeI4vd1A+PDr0YzmT53ukp8ItfAnWy/zjWg6vMlnEsRi
X-Google-Smtp-Source: AGHT+IGwCSwvvGE3O6NbkG51mymMqSVErgL+88mCbcZ/Sh4giHy8+THUXBi9OuVSQ8LD5w3yhlK7YcdBM0SL+BQqwY4=
X-Received: by 2002:a05:690e:134e:b0:63e:3296:8886 with SMTP id
 956f58d0204a3-63e3297a274mr6263197d50.42.1761054902681; Tue, 21 Oct 2025
 06:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 15:54:26 +0200
X-Gm-Features: AS18NWBHdAFp1mwITr0UmXnrlHznqrsFfmK4pqdcEpQD90Zx_dU1-YGQ61Q86vs
Message-ID: <CAPDyKFofohpEDcowp-MwtJqKu4wN4qvXz+BKOG6=8jhWS_k-PA@mail.gmail.com>
Subject: Re: [PATCH 0/3] power: qcom,rpmpd: Add support for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 01:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> Add rpmpd support for Kaannapali Platform including RPMh power domains
> and new RPMh levels.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Jishnu Prakash (3):
>       dt-bindings: power: qcom,rpmpd: document the Kaanapali RPMh Power Domains
>       dt-bindings: power: qcom,rpmpd: add new RPMH levels
>       pmdomain: qcom: rpmhpd: Add RPMh power domain support for Kaanapali
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                     | 28 +++++++++++++++++++++-
>  include/dt-bindings/power/qcom,rpmhpd.h            |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250922-knp-pd-f639194fd7c4
>
> Best regards,
> --
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>

