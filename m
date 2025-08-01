Return-Path: <linux-arm-msm+bounces-67353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C417DB181F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AAF3A6C99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258E22472BC;
	Fri,  1 Aug 2025 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4xz+r+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83491F16B;
	Fri,  1 Aug 2025 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754052243; cv=none; b=oqXujBushCaRUYdVBH8BlQ8g3OazA7Nlmmra3o7/9V1Ak5ggFmr3DZrAIqH02WrfJVhr41okiRgwi8NnQKE28RJU5voPbxkTSxkSRntVikyrklHhdEm+oA6oy211kQCdEHSg4wvT9UX2rtbdcD1ndeX8lHk6y/jVxZV9TBWkiao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754052243; c=relaxed/simple;
	bh=FiT0425S7X3WbHUWOMIF4UULdXiBKCkvWg3ZnMqeZM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ2nb/wdKerkWPI0n7Qpk7ntw1uw4QzO85t6vmzwoBr08Kuh3LQUHWaDej1ACs2nQJ9vkrlZ6cdeeXMlXOWnAZHnEqHXccopdU0RaEwqBTnfwqIA2prTTLsM2eVs1cNY/pnD+R2AnP4lZ7kw4BsWvzAkaxNMKTlCDHcEZN0f0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4xz+r+3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E529C4CEE7;
	Fri,  1 Aug 2025 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754052242;
	bh=FiT0425S7X3WbHUWOMIF4UULdXiBKCkvWg3ZnMqeZM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4xz+r+32ZjXVU+0L086jLIp1hvyCbtHgcWwNT6uf6pw9E3Nup1mfRV+FBNlkUCbJ
	 DunzKp65I/bVG5wz5ZAldHNQzx+0TNCGZDB8B9GxmV22IGd4k2Sncj0GnrDFVIkfH5
	 zyXHELvWnEh5taOHjSjau+NDYsQG6ELyNzaOl7BnRsPUpmQ60581KLfjkXjFwgZLu/
	 QNKdJcz4emONeLI0/u+dxcM+ncndrzTz8XDE4I4lPJLQ6e0uKf9PpnHpsnIZBAR1KS
	 ysojmaTd0rAVZLGMRQzLG2nRPQGXQ9A0miAMOO5TqasPSBX5zQosSQ4NRiFjRaM0LJ
	 CW+BxBMS1TkXA==
Date: Fri, 1 Aug 2025 18:13:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 0/3] Enable UFS MCQ support for SM8650 and SM8750
Message-ID: <u27jbp3wkgw2cyyans3rmxspqqwufymkztvyfjacrke252nbud@yfutnxhwcspr>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <aff38b98-23ff-4dcd-afab-2a0d8c8ad599@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aff38b98-23ff-4dcd-afab-2a0d8c8ad599@linaro.org>

On Thu, Jul 31, 2025 at 10:50:21AM GMT, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
> > This patch series enables Multi-Circular Queue (MCQ) support for the UFS
> > host controller on Qualcomm SM8650 and SM8750 platforms. MCQ is a modern
> > queuing model that improves performance and scalability by allowing
> > multiple hardware queues.
> > 
> > Although MCQ support has been present in the UFS driver for several years,
> > this is the first time it is being enabled via Device Tree for these
> > platforms.
> > 
> > Patch 1 updates the device tree bindings to allow the additional register
> > regions and reg-names required for MCQ operation.
> > 
> > Patches 2 and 3 update the device trees for SM8650 and SM8750 respectively
> > to enable MCQ by adding the necessary register mappings and MSI parent.
> > 
> > Tested on internal hardware for both platforms.
> > 
> > Palash Kambar (1):
> >    arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller
> > 
> > Ram Kumar Dwivedi (2):
> >    dt-bindings: ufs: qcom: Add MCQ support to reg and reg-names
> >    arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller
> > 
> >   .../devicetree/bindings/ufs/qcom,ufs.yaml     | 21 ++++++++++++-------
> >   arch/arm64/boot/dts/qcom/sm8650.dtsi          |  9 +++++++-
> >   arch/arm64/boot/dts/qcom/sm8750.dtsi          | 10 +++++++--
> >   3 files changed, 29 insertions(+), 11 deletions(-)
> > 
> 
> I ran some tests on the SM8650-QRD, and it works so please add my:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> 

Thanks Neil for testing it out!

> I ran some fio tests, comparing the v6.15, v6.16 (with threaded irqs)
> and next + mcq support, and here's the analysis on the results:
> 
> Significant Performance Gains in Write Operations with Multiple Jobs:
> The "mcq" change shows a substantial improvement in both IOPS and bandwidth for write operations with 8 jobs.
> Moderate Improvement in Single Job Operations (Read and Write):
> For single job operations (read and write), the "mcq" change generally leads to positive, albeit less dramatic, improvements in IOPS and bandwidth.
> Slight Decrease in Read Operations with Multiple Jobs:
> Interestingly, for read operations with 8 jobs, there's a slight decrease in both IOPS and bandwidth with the "mcq" kernel.
> 
> The raw results are:
> Board: sm8650-qrd
> 
> read / 1 job
>                v6.15     v6.16  next+mcq
> iops (min)  3,996.00  5,921.60  4,661.20
> iops (max)  4,772.80  6,491.20  5,027.60
> iops (avg)  4,526.25  6,295.31  4,979.81
> cpu % usr       4.62      2.96      5.68
> cpu % sys      21.45     17.88     25.58
> bw (MB/s)      18.54     25.78     20.40
> 

It is interesting to note the % of CPU time spent with MCQ in the 1 job case.
Looks like it is spending more time here. I'm wondering if it is the ESI
limitation/overhead.

- Mani

> read / 8 job
>                 v6.15      v6.16   next+mcq
> iops (min)  51,867.60  51,575.40  56,818.40
> iops (max)  67,513.60  64,456.40  65,379.60
> iops (avg)  64,314.80  62,136.76  63,016.07
> cpu % usr        3.98       3.72       3.85
> cpu % sys       16.70      17.16      14.87
> bw (MB/s)      263.60     254.40     258.20
> 
> write / 1 job
>                v6.15     v6.16  next+mcq
> iops (min)  5,654.80  8,060.00  7,117.20
> iops (max)  6,720.40  8,852.00  7,706.80
> iops (avg)  6,576.91  8,579.81  7,459.97
> cpu % usr       7.48      3.79      6.73
> cpu % sys      41.09     23.27     30.66
> bw (MB/s)      26.96     35.16     30.56
> 
> write / 8 job
>                  v6.15       v6.16    next+mcq
> iops (min)   84,687.80   95,043.40  114,054.00
> iops (max)  107,620.80  113,572.00  164,526.00
> iops (avg)   97,910.86  105,927.38  149,071.43
> cpu % usr         5.43        4.38        2.88
> cpu % sys        21.73       20.29       16.09
> bw (MB/s)       400.80      433.80      610.40
> 
> The test suite is:
> for rw in read write ; do
>     echo "rw: ${rw}"
>     for jobs in 1 8 ; do
>         echo "jobs: ${jobs}"
>         for it in $(seq 1 5) ; do
>             fio --name=rand${rw} --rw=rand${rw} \
>                 --ioengine=libaio --direct=1 \
>                 --bs=4k --numjobs=${jobs} --size=32m \
>                 --runtime=30 --time_based --end_fsync=1 \
>                 --group_reporting --filename=/dev/disk/by-partlabel/super \
>             | grep -E '(iops|sys=|READ:|WRITE:)'
>             sleep 5
>         done
>     done
> done
> 
> Thanks,
> Neil

-- 
மணிவண்ணன் சதாசிவம்

