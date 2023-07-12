Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4F87505AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbjGLLM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 07:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbjGLLM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 07:12:27 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A2C173A
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 04:12:25 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-668709767b1so4052807b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689160345; x=1691752345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVwe3oATxadInKWfhPahYmr2Wuk+PoT6QXJO53ETr60=;
        b=Jy4LBq1/y7Q0k9uVaWzUYa3AMrhNie3O3EdPzirb8suL2pzU/POTsrG1VzQFAz+gsq
         AmHYiC+BfeddTyFWOP5hyJrUxkb1N9VRdWIkKo3WqUWGiJUU3V00Be7rwC2zbTmUhfRB
         N/TcnPDEm496ciCi/6rRvYwN4nQbYW5xLvT/x3c8fdRwDRlpQ/TpcUJu5hSCxFANqo5Z
         IVvAOhkvrmYBKJ9JBwYOgKehjoJGw9s2Y3snVz6aE89RKM9BGNWEZ5v6KBaxOq9e4h+s
         G+rGGzFurBKpa6wSXSltZ1WxcBvZrKPEKXPH7uJTKqX62QsBo6Z/E93RcRHjyXu3CI1B
         La4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689160345; x=1691752345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVwe3oATxadInKWfhPahYmr2Wuk+PoT6QXJO53ETr60=;
        b=LehTNt+YVe8c6890cjyBctWJsajv9QeXB3qlXaDfDNxRL5TM3OoAj1Hrjhmwb6H/jp
         S1o1kqd7Tu67Y5Wuoy/qebEjIUb9ADllvLt+ejv0R9ZzJeEhKN8zjH7yCr3L1Uy7/Pfn
         SFOBlaH/Wg2W3scc9jTV/W6VC/CZy9OAXaw5ZKCe2pKpIOApyMzG50vNRB1JPCi+KfZ3
         /QbO8PTmhmTQEbPs1UcbFGJin/QbV07afwoRoGh37Ot8XtyOKFipvSSkI68lewQGhyJP
         mi2h3YrH4akvhkFElDKteUWzR4gK2SUpAyRNxuS6SIhsD7jwnmhwCzQQZp9ynXp3+OEd
         v5xg==
X-Gm-Message-State: ABy/qLZm/n1jQAVMqp9krm/hzwStGaMbDHSOlwC0ElrAHETi7VieyUUj
        mBdDVipN9KvzksUJ8gZrO2FZ
X-Google-Smtp-Source: APBJJlFnl85MjQWlkwn1Zyl5TcKEjspNtR5ngVg7G/HHZviVEXVBaK04YsU6EWzsFEru4iHW4c8IVA==
X-Received: by 2002:a17:903:32ce:b0:1b8:b4e5:15c2 with SMTP id i14-20020a17090332ce00b001b8b4e515c2mr17966878plr.22.1689160345081;
        Wed, 12 Jul 2023 04:12:25 -0700 (PDT)
Received: from thinkpad ([117.207.27.131])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902848100b001b03cda6389sm3695566plo.10.2023.07.12.04.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:12:24 -0700 (PDT)
Date:   Wed, 12 Jul 2023 16:42:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     John Garry <john.g.garry@oracle.com>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 00/14] UFS: Add OPP and interconnect support
Message-ID: <20230712111208.GA102757@thinkpad>
References: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
 <35256e49-2a34-1334-698c-161d443ab3fc@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35256e49-2a34-1334-698c-161d443ab3fc@oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 12, 2023 at 12:02:37PM +0100, John Garry wrote:
> Did you bcc linux-scsi on this series?
> 
> I am just wondering why it came directly to my inbox and I am not the to: or
> cc: list. I also notice replies in the archives which I have not received...
> 

I initially missed CCing scsi list and maintainers. So instead of resending the
series (since it has too many people CCed), I just bounced the patches to scsi
list and maintainers using Mutt.

From the next iteration, I will make sure to add everyone. Sorry for the
trouble.

- Mani

> Thanks,
> John

-- 
மணிவண்ணன் சதாசிவம்
