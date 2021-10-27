Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A33B43C00A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 04:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238083AbhJ0Cix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 22:38:53 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:37680 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbhJ0Cix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 22:38:53 -0400
Received: by mail-ot1-f49.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso1580990otl.4;
        Tue, 26 Oct 2021 19:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=re9KYIx1IL2WvyPtwp5UIgzDO2YvRBi9kv+ji7Pnlm8=;
        b=hwdWPJcht85bu0HmNQTK3Qqt0971zE9RxaqJxY6g4KB6Y64d1p+mhhEkystPDbKI10
         JT7NX8rY+GrxD+fVvuQqznQ0jgSNCQMvjoLxUKeHiFeEnofv3WWgwwe0xsiGOKELR46+
         Dl5cH57ZV6hw72eGNa3B4hoIcEfDUucjC9bPtc9NOAM5Fdg6QbpXRM3b8j9JmWVg42Fy
         6QrhXGMFTXql4vDZHvtk1JrwzA53Ia6YqJ4/s+TBG5TrvkutO+EtFjhw8c/fT23XhaVk
         Z/7p9yxQ3q3olFBYyxkZLH3wmciNPTawfnGRiadk7LI1a0tddvAI+q1oG4IJbVQNUSaF
         5tlw==
X-Gm-Message-State: AOAM5337ssg+HmyBUHcy0sUcm/76QP1F4GMaugVISdwo5S3m8qJQjXRH
        rxVIhsxNotpc1eYyl7GxsQ==
X-Google-Smtp-Source: ABdhPJyxdubvLwTdDIJey4S8zSgXjUJvMd5s3cDT5T9+mh7/HrcjYBtnmCCAZPcz0RA51CQ/UObb4Q==
X-Received: by 2002:a9d:6752:: with SMTP id w18mr21955626otm.42.1635302188516;
        Tue, 26 Oct 2021 19:36:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o12sm5133885oti.21.2021.10.26.19.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 19:36:28 -0700 (PDT)
Received: (nullmailer pid 3844748 invoked by uid 1000);
        Wed, 27 Oct 2021 02:36:27 -0000
Date:   Tue, 26 Oct 2021 21:36:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>, collinsd@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, sboyd@kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tglx@linutronix.de, David Collins <collinsd@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>, subbaram@codeaurora.org
Subject: Re: [PATCH v2 08/10] bindings: spmi: spmi-pmic-arb: mark interrupt
 properties as optional
Message-ID: <YXi7KxGVes6XtRwo@robh.at.kernel.org>
References: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
 <1634621361-17155-9-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634621361-17155-9-git-send-email-quic_fenglinw@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Oct 2021 13:29:19 +0800, Fenglin Wu wrote:
> From: David Collins <collinsd@quicinc.com>
> 
> Mark all interrupt related properties as optional instead of
> required.  Some boards do not required PMIC IRQ support and it
> isn't needed to handle SPMI bus transactions, so specify it as
> optional.
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
