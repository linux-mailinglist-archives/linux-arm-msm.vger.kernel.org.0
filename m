Return-Path: <linux-arm-msm+bounces-791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E07EDFF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A476B1C20847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627132E634;
	Thu, 16 Nov 2023 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrBHjEK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4738D45943
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 11:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC983C433C7;
	Thu, 16 Nov 2023 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700134599;
	bh=hpHmPkkzEBbYwUGG7suf3v/0ogk716c/GZeTCmaVrbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrBHjEK7bf6jIinBjHMei4/AC9pS1WKVF1CgoU3cRWtMrqBRYh1ZBezWH7KndSDWd
	 wNWWVthB6/dsB6YYSnKVFj70tBw+TMcvalwNQNAeuZ9TXBZHMs0lHdAhSpEQPr9z/7
	 15Ds54zW+Wbfwpf08LYTXK+Tw9VhRNNhRaWT7NDYRgck/GvieYpXvwYqfvPhfJQa2o
	 gXFWvCUiZP4cK1tu+tUTxa6yW4jt88MLpwEEhZVc2hYV71+WyPv5fSRTq/nBJY6u+O
	 or/jTiFoM858hFVXYfbrOeOfaMryoBGDqwTQES89P9UuaJeCn/vfPZ70zoafmLGWIP
	 jK4vehT+i9JWQ==
Date: Thu, 16 Nov 2023 17:06:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-combo: correct sm8550 PHY
 programming
Message-ID: <ZVX+wxvOnK1fUTki@matsya>
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
 <aabb8345-7b5d-447d-af79-1e5743465315@quicinc.com>
 <CAA8EJpoQ0k_4GSQyrziLYn1v942ppzNOvwxN55sLkZUUDWLe4w@mail.gmail.com>
 <67518705-cfc2-4ae0-9cd2-0c33146cf48b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67518705-cfc2-4ae0-9cd2-0c33146cf48b@quicinc.com>

On 06-11-23, 15:11, Rohit Agarwal wrote:
> 
> On 11/6/2023 3:07 PM, Dmitry Baryshkov wrote:
> > Hi Rohit,
> > 
> > On Mon, 6 Nov 2023 at 08:46, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
> > > 
> > > On 9/12/2023 2:08 AM, Dmitry Baryshkov wrote:
> > > > Fix several small issues with the QMP USB+DP PHY programming on the
> > > > Qualcomm SM8550 platform.
> > > Hi Dmitry,
> > > 
> > > Can we have a conclusion on this series?
> > Yes. Version 3 of this series was accepted by Vinod:
> > 
> > https://lore.kernel.org/linux-arm-msm/169719381727.165658.9377101716537787206.b4-ty@kernel.org/
> Thanks for the update!!!.

You need to rebase your series as send

-- 
~Vinod

