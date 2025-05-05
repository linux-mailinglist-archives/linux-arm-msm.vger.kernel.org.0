Return-Path: <linux-arm-msm+bounces-56780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C46AA92D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A4DF1772F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 12:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618B1250C11;
	Mon,  5 May 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwwMaSql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D862512C4
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447427; cv=none; b=efWPDk5fNL/L+ZeD+020aFMT8KU0fN0GkbXtIa6Wj6fvzHODXrzJggO24V62ncPWPMA0VdgoNEpw0WX9iovtY6GEjWaea3kZxwDgfYTEaf7ates4Am1m8sAWdZljLO9FsO84qXauHx9R+/woyLIEmFNJoyHaaprv60PXhRmKFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447427; c=relaxed/simple;
	bh=NlALIoe0iC3WSYUHgCo9Umj2JugDI/3o+WdAPXUGUuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m02v5rbmLyV61zrQcz1QpRHLCXnzx/N/+o4T2ylZgFQvbchr/7cwBl0ne4j4+GjHpoYouzqNggGh2WW6RFki3RG0kEzPRXt/hYud2ubE50/BvomAxVS/lINp21UlSlFNXT8ovbAQ6HJi0EtvZ7tDHw3sjeK0xO+C+ZNoHAcEebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwwMaSql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BG4oM015271
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 12:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cBmlj28SvCZ4M7S1nnJEd0Nu
	gRbJw27zy6tWxbAN08U=; b=NwwMaSqlGyqRvyKGNJ4+C1B+9YKaFTYBTkNhornd
	2AOd2MXeKxG06zHKKNR3jr0sGT7YdDLBl0UiI17t9lhK1rK7ZHil4PlrTxPqONyt
	L+ikGsVhbN44SDGelGLeWz6jMuEw9vUu3zWMkhXx1y3eznr4EzjzExJpDi/FepjS
	p4/V9e3Y2d1AnhcLVjzH0u3h5bo3lAtoYoQWXXoCZp+8m/qZbmKcsSny5GONbOR1
	SKBmedWBK17f/h0Y5GDKY9Ta0H7bUiUBJTvmw4AUw8FrToMn6m7WfQAClFmzFin7
	6maa2wsCbtJBguMt74RI30b/CH9YNhBPniGkZe4F1Ssgag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n3wyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 12:17:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ed0cc28f7dso127584396d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 05:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447423; x=1747052223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBmlj28SvCZ4M7S1nnJEd0NugRbJw27zy6tWxbAN08U=;
        b=kWU3IH1XiQQMuUBa3r68VQhQqBSy6qTTv7KQ343hnLF8c0+qAHiKPrAo+uV19lCrOZ
         RzYX6/pvyN9CHsjaLqUNxehYkQDqJdLTP09byjfgMDN4wGycme8ekIQ+1mYnnQWldFJ9
         7cjVNl0604kbVMGkkrGAsWuqeueTvs80LilDkh7fGQTv5foaCePk323j11CZ4cd+X5L+
         +9eRBIMYPBiqS+oW8CFuQFmX/LVqA55BhkUo+WWGO0cybBcNgTxcsCmJWJIEtPOlKrwq
         MtYCrybLuPG+wGeru8YErJzCGU7EYTawDFdvQELODwlpLLVzJ3GMuK147wsfjAW49ZqE
         8BhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFJgUgBSv7YFv2ppbXHEy1fyMp/BzYtXvu4bjoAOpekrjRray8Jo++fQ9iTRMm3XtG2lzk24e1/o5Cxzl6@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgmsyJnuW63EGFFrij2ZzcO3ywnyceyeV5/QSPoswtpmmL/5k
	WI/1GPvR4Bx0o4xCh873R02/G9dpzT9FWILXTH8ONLkt0olRWw5a5L6OnnPf52Q4YgHOoooWkbc
	ayeuuxuzhdeqNgOIiXOV7g9mybISDSqXVgczMxNLV3YWJmZFlYKMa5o45b/q3AAcy
X-Gm-Gg: ASbGncsbrcCoQbrE0iRd3BWFFkywZekYVDcF0yqQx+3KFS+OhgIhO6CSyvfPP+NMlua
	P/mt7Gx+bA6tGrX4fdvJ18DZi6B9Q7fI8lmzj3nGw5Erf6sACGqbDHoufApnv7YZB751w7NZEGP
	EWu9ATJrDRZH9dkTHzaeago2mCcuo+pF7sBUqHKsGsZyz4klw0x+iZ9XyCdpq9Kl0t92RXLeK3x
	OPIWhFhI/9ah1qlCLBZYQPd+aNExLC7Nf2cJ0nGCWZ5bHNrWuENTrd4ewjUjNDITkZZt4X26N7k
	Oc/z0/wo3W1ozC+2JrVk0P3ctGURZtK5OxdC92wWRpReTVZvHKuNPwDbSYSZh27OvZaXUR7DfMU
	=
X-Received: by 2002:ad4:5e89:0:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f528c36377mr90487046d6.1.1746447423068;
        Mon, 05 May 2025 05:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI2miDMGBi18VyNdPKWOTeIPliK5ntOZYPJ0fwhi2n4q9Zd33W6e8RHT8wR9jc3kvFT4tTjg==
X-Received: by 2002:ad4:5e89:0:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f528c36377mr90486786d6.1.1746447422724;
        Mon, 05 May 2025 05:17:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b176dsm1684252e87.14.2025.05.05.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:17:01 -0700 (PDT)
Date: Mon, 5 May 2025 15:17:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Message-ID: <aw6tjh5q6t75bif4jyusrdvroq53lbwlljo5cdgzrofn3a4loz@ixuu3yw4ucil>
References: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
 <aBh9WL2OMjTqBJch@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBh9WL2OMjTqBJch@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNyBTYWx0ZWRfX5fgaOqTzmmXs
 cvKVEEp9O9+OAlSJXIrXYY2rXXJLunjJN99q0F3868ILb97CwcTnGg71zGFNHTY0PnWsUN9Sjqp
 DFLKPz3F7J3bi8E+H1PCRQWqX4B23OseF1ICPHP9TCha2/hFEhnp8/LvKEgy8KILyno/uHhG9Qe
 NN1uf8J3ufX5SPFAWWo50Mi1mJOuu3kkmQxc3AwXL4mCN02bwBn+t5GTCQa5iXwZ/aT6XKotBr8
 whZPO5d1/3lCs+FPr2IlPg0xt6ioFZcE8ggijV+4fdGhQkysJAGurpduXs2UPqqWLPm/fgX2HE9
 OrELGCQQBtKE7jby+SsZcHJORu+ZdoJwwT/MOF2V1CrT9B/cQMd6yuSgyMOs/6202LwA9xt4/Sy
 Uci5Pbkw1rblLT7xP/Lxw9j9tpMrQZw7ATXE7M/Wq/JLl9urd5qesu5Qx0L0wJ3YEQgMwoLN
X-Proofpoint-GUID: sr_JwVsR6RSKvKKopnxOz3HGF4xOy3h-
X-Proofpoint-ORIG-GUID: sr_JwVsR6RSKvKKopnxOz3HGF4xOy3h-
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6818ac40 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-oSGpTHasqKTVeQyqFYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050117

On Mon, May 05, 2025 at 10:56:56AM +0200, Stephan Gerhold wrote:
> On Sat, May 03, 2025 at 03:41:43AM +0300, Dmitry Baryshkov wrote:
> > The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
> > underflow") made sure the BAM DMA device gets suspended, disabling the
> > bam_clk. However for remotely controlled BAM DMA devices the clock might
> > be disabled prematurely (e.g. in case of the earlycon this frequently
> > happens before UART driver is able to probe), which causes device reset.
> > 
> > Use sync_state callback to ensure that bam_clk stays on until all users
> > are probed (and are able to vote upon corresponding clocks).
> > 
> > Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Thanks for the patch! I actually created almost the same patch on
> Friday, after struggling with this issue on DB410c when trying to add
> the MPM as wakeup-parent for GPIOs. :-)
> 
> How is this issue related to _remotely-controlled_ BAMs?

My understanding is that for locally controlled BAMs we can disable the
clock at the probe time as all the users of the BAM will be probed
before accessing the BAM. In case of a remotely controlled BAM there can
be a user (e.g. UART) which is running, but didn't request DMA channel
yet.

Please correct me if I'm wrong here.

> The BAM clock will get disabled for all types of BAM control, so I don't
> think the type of BAM control plays any role here. The BLSP DMA instance
> that would most likely interfere with UART earlycon is
> controlled-remotely on some SoCs (e.g. MSM8916), but currently not all
> of them (e.g. MSM8974, IPQ8074, IPQ9574, ...).

This probably means that the definition of the flag needs to be
clarified and maybe some of those platforms should use it.

> The fixes tag also doesn't look correct to me, since commit 0ac9c3dd0d6f
> ("dmaengine: qcom: bam_dma: fix runtime PM underflow") only changed the
> behavior for BAMs with "if (!bdev->bamclk)". This applies to some/most
> remotely-controlled BAMs, but the issue we have here occurs only because
> we do have a clock and cause it to get disabled prematurely.

Well... It is a commit which broke earlycon on on db410c.

I started to describe here the usecase of the remotely-controlled DMA
controller being used by the BLSP and then I understood, that I myself
don't completely understand if the issue is because DMA block is
controlled remotely (and we should not be disabling it because the BLSP
still attempts to use it) or if it's a simple case of the clock being
shared between several consumers and one of the consumers shutting it
down before other running consumers had a chance to vote on it.

> Checking for if (bdev->bamclk) would probably make more sense. In my
> patch I did it just unconditionally, because runtime PM is currently
> a no-op for BAMs without clock anyway.

Please share your patch.

> 
> I think it's also worth noting in the commit message that this is sort
> of a stop-gap solution. The root problem is that the earlycon code
> doesn't claim the clock while active. Any of the drivers that consume
> this shared clock could trigger the issue, I had to fix a similar issue
> in the spi-qup driver before in commit 0c331fd1dccf ("spi: qup: Request
> DMA before enabling clocks"). On some SoCs (e.g. MSM8974), we have
> "dmas" currently only on &blsp2_i2c5, so the UART controller wouldn't
> even be considered as consumer to wait for before calling the bam_dma
> .sync_state.
> 
> It may be more reliable to implement something like in
> drivers/clk/imx/clk.c imx_register_uart_clocks(), which tries to claim
> only the actually used UART clocks until late_initcall_sync(). That
> would at least make it independent from individual drivers, but assumes
> the UART driver can actually probe before late_initcall_sync() ...
> Most of this code is generic though, so perhaps releasing the clocks
> could be hooked up somewhere generic, when earlycon exits ...?

The spi-qup commit looks like another stop-gap workaround. Let's add CCF
and serial maintainers to the discussion with the hope of finding some
generic solution.

Most likely the easiest solution for Qualcomm platforms is to add
additional vote on earlycon clocks and then to try to generalise that.

> 
> Thanks,
> Stephan

-- 
With best wishes
Dmitry

