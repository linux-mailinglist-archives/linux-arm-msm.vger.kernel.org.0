Return-Path: <linux-arm-msm+bounces-28349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747594FA0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 00:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC253B220A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 22:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4587819A2A8;
	Mon, 12 Aug 2024 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oLB1WKxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7362199E9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723503406; cv=none; b=JvZ/SWvFavH6PK1Dp5zty60m0x9zQ7byDPP9q9fyxO0obxZVeBD62gltaDtTHgLsuo5JPTE43IQqAfS86c+cdgMx7dFfkDEQuMWUkyFdmRHjvXVAK2LCNiuwPAFnxbnL1WMM1KSr/5N0BDwYCvOBe9xQ6nmW/LI63vMemd8sPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723503406; c=relaxed/simple;
	bh=TDAFnAsAIlt7GUac6z87BZGGg+Ppjb6edcH+t/DQ8Xo=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emLJYTL1DyMCm3rTskrWsx1hflrub7ciIx6kyQAscwWuJtdxwzhVH9wTt3VqjHOsntiWFnn5wvVm/HY8GEQk6blTV7lb5Y1uTBu1aZa1adfF+7xA50vYIPsiT3LlKvdqQe47OjXA+jxxxbUdiXpk94Vf4ctAf5USzacNNL9QDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oLB1WKxk; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-492959b906eso1847818137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723503402; x=1724108202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7jJkY+aM6TIgUDL84Xadt9JnUn+AdEGCBMx8uOh7/g=;
        b=oLB1WKxkhYAHywdPE9NNAS2lBK5H8Sm8YwSc4vONn99mv4I8anKEf6nbjfbFa1POin
         4nhmKFzMN6w+J6BXEC9QAggmufy2KhNDrD8tsUzTHMV6GyJMsWxAyxAa5vy1jwBk7NiP
         ZbF4UNgnL3ztEAv3XAqk/GqteRT0c+VgD9y6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723503402; x=1724108202;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7jJkY+aM6TIgUDL84Xadt9JnUn+AdEGCBMx8uOh7/g=;
        b=UrjSkcmHJAXc8wmulwF/MtWLRAQU9SlCNEagG8eyhq44neArtnmJqCy+1Xs4hwqZVT
         obA+/F1Ine4US8xa3KAiuU3bODDxv1hBPRuSm9iSNdqLa3CCWffR//fEuQR1LdyBGcIM
         0zvgAdoq2gdlS24flxK1Y09WQeC3CXd0Z6EZrlyxY+sMh9jidUmT/gc8U8i8tHNKiCjD
         kINDQjMdHXNTo8VpNJlydBKAoV4pUlaePdirv2TDXyBaSg/xzLEtIIywxJ3y2i846Aq6
         C9fdSto416TEpTsJY9TLaKt59yf63+qYwMgHzLCWvp0czzEhufo480UeuFV3qLkAlpdQ
         NLow==
X-Forwarded-Encrypted: i=1; AJvYcCV/Hsf7OuBaqnD5U3qzPFeb4zuCUZV6INc4ynMfO5gcXZ1j0dD07AwDhehKuQEMQ4QZ4kikEM8TkbcC+J0we/8V+j8sArxS0qKBIxkOXw==
X-Gm-Message-State: AOJu0Yzsx3OP8y41s+a2JF/pML9+eDIb4ezljIcBY1ownatPeFCU/HhY
	+rlvW97Qp+c8OtUGNJASQeXRJISiPoJYbUF/wCRCo7kJ8kfFs3r6ewnsh3t2KWbchOOI5VOAJI8
	dS1uuxb1vAq7cNYf9kiuh8DBsxVgLTF2bSerK
X-Google-Smtp-Source: AGHT+IEeTYhY39+ViVOJixCzuFtfLr+iEfUF4v0iDpY24IPmZtS8aEfqicfeMFy71mP9WrhiDutxNe0lhTErEH3RBQI=
X-Received: by 2002:a05:6102:d8c:b0:493:bc65:5a79 with SMTP id
 ada2fe7eead31-497439f71c3mr2437286137.12.1723503401823; Mon, 12 Aug 2024
 15:56:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 15:56:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd2drhMGTsvnX1aqwpDTOkK_+n2OKMYY1Y9ONHyYiFLTSQ@mail.gmail.com>
References: <20240502224703.103150-1-swboyd@chromium.org> <CAE-0n50VDgsg-4QnynvLOzykr3KP5JsnHqeFPA=uRT3EfgL19g@mail.gmail.com>
 <CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com>
 <CAE-0n53X1Gv9nnyDfeivYd7n5W6D1WFkO0tCvYc9drb0+4hQbw@mail.gmail.com>
 <CAMi1Hd2_a7TjA7J9ShrAbNOd_CoZ3D87twmO5t+nZxC9sX18tA@mail.gmail.com>
 <CAE-0n52JgfCBWiFQyQWPji8cq_rCsviBpW-m72YitgNfdaEhQg@mail.gmail.com> <CAMi1Hd2drhMGTsvnX1aqwpDTOkK_+n2OKMYY1Y9ONHyYiFLTSQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 15:56:40 -0700
Message-ID: <CAE-0n53pjPjSw0m93biWOXRkV=V5u-HVqBx8=MLgQ=Z2ydfEKA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Park shared RCGs upon registration
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Laura Nao <laura.nao@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Amit Pundir (2024-08-12 02:39:47)
> On Tue, 6 Aug 2024 at 03:07, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Amit Pundir (2024-08-05 03:43:14)
> > > On Sat, 3 Aug 2024 at 06:29, Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Also please send back the dmesg so we can see what clks are configured
> > > > for at boot time. If they're using TCXO source at boot then they're not
> > > > going to be broken. In which case those clks can keep using the old clk
> > > > ops and we can focus on the ones that aren't sourcing from TCXO.
> > >
> > > Thank your for this debug patch. I thought I narrowed down the
> > > breakage to the clks in drivers/clk/qcom/gcc-sm8550.c, until I ran
> > > into the following kernel panic in ucsi_glink driver in later test
> > > runs.
> >
> > Thanks for the info. These are the clks that aren't sourcing from XO
> > at registration time:
> >
> >   gcc_qupv3_wrap1_s7_clk_src with cfg 0x102601 -> parent is gpll0_out_even
> >   gcc_ufs_phy_axi_clk_src with cfg 0x103 -> parent is gpll0_out_main
> >   gcc_ufs_phy_ice_core_clk_src with cfg 0x503 -> parent is gpll4_out_main
> >   gcc_ufs_phy_unipro_core_clk_src with cfg 0x103 -> parent is gpll0_out_main
> >   gcc_usb30_prim_master_clk_src with cfg 0x105 -> parent is gpll0_out_main
> >
> > The original patch is going to inform the clk framework that the parent
> > of these clks aren't XO but something like gpll0_out_even, whatever the
> > hardware is configured for. That may cause these PLLs to be turned off
> > earlier than before if, for example, gcc_ufs_phy_axi_clk_src is turned
> > off by a consumer and gcc_usb30_prim_master_clk_src is left enabled at
> > boot. That's why we force park clks at registration time, so that they
> > can't have their parent clk get turned off by some other clk consumer
> > enabling and then disabling a clk that's also parented to the same
> > parent.
> >
> > This same problem exists for RCGs that aren't shared too, but it's
> > particularly bad for shared RCGs because the parent PLLs aren't turned
> > on automatically by the hardware when things like the GDSC do their
> > housekeeping. At least when software is in control we can enable the
> > parent PLL and unstick the RCG that was previously cut off.
>
> Thank you Stephen for the detailed explanation. Really appreciate this
> knowledge dump.
>
> >
> > Can you narrow down the list above to the clk that matters? I guess if
> > USB isn't working then gcc_usb30_prim_master_clk_src is the one that
> > should be changed and nothing else. Although, I noticed that in the
> > first dmesg log you sent the serial console had garbage, and that's
> > likely because the rate changed while the clk was registered. I don't
> > know why the gcc_qupv3_wrap1_s7_clk_src is marked with the shared clk
> > ops. That's confusing to me as I don't expect that to need to be parked
> > for any reasons. Maybe qcom folks can comment there but I'd expect plain
> > rcg2_ops to be used for those clks. Anyway, if you can narrow down to
> > which clk needs to be left untouched it would be helpful.
>
> gcc_qupv3_wrap1_s7_clk_src and gcc_usb30_prim_master_clk_src need to
> be left untouched to fix the Audio codec and USB-C host mode breakages
> respectively. It seem to have fixed the serial console garbage dump
> issue as well.

Alright. Can you try with this patch for the gcc_qupv3* clks on top? And
keep gcc_usb30_prim_master_clk_src on the new clk_ops? I think we need
two patches. One for the usb clk and one for these QUP clks that don't
need to be parked.

----8<----
diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 33c5d422da9b..1ce41fc7e77e 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -536,7 +536,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s0_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s1_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -566,7 +566,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s2_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -581,7 +581,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s3_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -596,7 +596,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s4_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -611,7 +611,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s5_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -626,7 +626,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s6_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -641,7 +641,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s7_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -656,7 +656,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s8_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s9_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };

@@ -700,7 +700,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -717,7 +717,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -750,7 +750,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -767,7 +767,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -784,7 +784,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -801,7 +801,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -818,7 +818,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -835,7 +835,7 @@ static struct clk_init_data
gcc_qupv3_wrap1_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
@@ -852,7 +852,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -869,7 +869,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -886,7 +886,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
@@ -903,7 +903,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -920,7 +920,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -937,7 +937,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -975,7 +975,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_8,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
@@ -992,7 +992,7 @@ static struct clk_init_data
gcc_qupv3_wrap2_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_no_init_park_ops,
+	.ops = &clk_rcg2_ops,
 };

 static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {

>
> UFS on SM8550-HDK has it's own issues when booting AOSP from it, so I
> couldn't test/verify if the reported gcc_ufs_phy_*_clk_src clk changes
> make any difference. But I'll bookmark this change for future
> reference if I run into any relevant UFS probe deferrals once we fix
> the existing/on-going issues.
>

Ominous but OK.

>
> Thank you for diagnosing this race in ucsi_glink. I needed to run an
> overnight reboot test to reproduce this crash, and could reproduce it
> on ~380th reboot. I'll check if it has already been reported or fixed
> on linux-next.

Amazing! Can you add the msleep() so that it is highly likely?

----8<----
diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9ebc0ba35947..12169b0d2adb 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -97,6 +97,8 @@ struct pmic_glink_client
*devm_pmic_glink_register_client(struct device *dev,

 	devres_add(dev, client);

+	msleep(10000);
+
 	return client;
 }
 EXPORT_SYMBOL_GPL(devm_pmic_glink_register_client);

