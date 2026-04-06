Return-Path: <linux-arm-msm+bounces-101949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OP6KIOk02m1jwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:18:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EAE3A33D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1AEE300D969
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 12:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D66F318B9C;
	Mon,  6 Apr 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kno0LClW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C4883F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775477873; cv=none; b=XU7T07Jh0/qvfetdzYvUQDWpRXn22FQEg+YYtfX9mDbQhL12oqYz3PAA96reu5sxpQHnu+zjdEkbEeysp4AcwSb1AJjFF0x3YT02+K8uDy4b4mIoKB8D/NoSZltslstd722pJSoZ50MNG27SpLXZI4u8VM49peceWe2OdtuxAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775477873; c=relaxed/simple;
	bh=yFdJwiEVINgONrJy1w1Fju+r6dDcyJdI5aC2Lb90A3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR6TC82BaHQtEZzyXdzfN72Z3K32l6iF2l4Fx/1sevlD195zsFRUmLhkhSRXXqKGFYrHwHIKlEVqtF76gVXl5cu4r7YdkiSxunimS5AzJm39G0udMK5RlvP0pNzWtxKaQKk41itl4qZASieL0dE4KGK0zV528n1LGFacadv7uGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kno0LClW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38CDC4CEF7;
	Mon,  6 Apr 2026 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775477872;
	bh=yFdJwiEVINgONrJy1w1Fju+r6dDcyJdI5aC2Lb90A3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kno0LClWBQSLnEk5FONJtokVkIhIfQRu5IpLb+xTlZZnMcmNr0f8aGieqAcXB5WyW
	 k7wRBHV+QTicmmy4Gxd3Kjp3KMsb8+7jVWBF74iKcLp9ibzei62TOoRs6Io4VDuogX
	 30C3FFB/lyHrF8CTfFa6YUMuMy1Gkt46ACixi1bO89gbCdBBzlXYPStWUYcarcrKEv
	 Gwz7er9+8VWfxWe3w+vyrXRGzjJ3Nf3nqNp/Y+55RM+zE/waLjSc0wrGrN+5+a6WRg
	 DLPGvuQTEbbmuhqKvKjFhf62+p/r8yQZ4YIWLAF70uYn6GGTYTIGmDDt/3rywLGDnG
	 ufcS2fBJrchdA==
Date: Mon, 6 Apr 2026 07:17:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Swati Agarwal <swati.agarwal@oss.qualcomm.com>, 
	Val Packett <val@packett.cool>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Biswapriyo Nath <nathbappai@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Md Sadre Alam <quic_mdalam@quicinc.com>, Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Yijie Yang <yijie.yang@oss.qualcomm.com>, Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Paul Adam <adamp@posteo.de>, Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, 
	Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>, Roger Shimizu <rosh@debian.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, 
	Xilin Wu <wuxilin123@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Ayushi Makhija <quic_amakhija@quicinc.com>, Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, 
	Erikas Bitovtas <xerikasxx@gmail.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, 
	Petr Hodina <petr.hodina@protonmail.com>, Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
	Raymond Hackley <raymondhackley@protonmail.com>, Sarthak Garg <sarthak.garg@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>, 
	Umang Chheda <umang.chheda@oss.qualcomm.com>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Xin Liu <xin.liu@oss.qualcomm.com>, Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Aleksandrs Vinarskis <alex@vinarskis.com>, 
	Alexander Koskovich <AKoskovich@pm.me>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Christopher Obbard <christopher.obbard@linaro.org>, 
	Gabor Juhos <j4g8y7@gmail.com>, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Gergo Koteles <soyer@irl.hu>, 
	Gianluca Boiano <morf3089@gmail.com>, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
	Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	KancyJoe <kancy2333@outlook.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Le Qi <le.qi@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Max McNamee <maxmcnamee@proton.me>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Riccardo Mereu <r.mereu@arduino.cc>, 
	Richard Acayan <mailingradian@gmail.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Wei Zhang <wei.zhang@oss.qualcomm.com>, Xueyao An <xueyao.an@oss.qualcomm.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.1
Message-ID: <adOh0D8wQW4yT3WO@baldur>
References: <20260401142242.1068620-1-andersson@kernel.org>
 <2c5402a1-9724-4fb1-bd31-6e8d133f3b88@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c5402a1-9724-4fb1-bd31-6e8d133f3b88@app.fastmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,mainlining.org,fairphone.com,packett.cool,linaro.org,gmail.com,ixit.cz,quicinc.com,oldschoolsolutions.biz,posteo.de,debian.org,canonical.com,protonmail.com,vinarskis.com,pm.me,glider.be,irl.hu,thundersoft.com,outlook.com,proton.me,arduino.cc];
	TAGGED_FROM(0.00)[bounces-101949-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[85];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 11EAE3A33D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 12:26:17AM +0200, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 16:22, Bjorn Andersson wrote:
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> >
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 
> > tags/qcom-arm64-for-7.1
> >
> > for you to fetch changes up to b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
> >
> >   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 
> > 09:35:01 -0500)
> >
> > ----------------------------------------------------------------
> > Qualcomm Arm64 DeviceTree updates for v7.1
> >
> > Introduce the Eliza, Glymur, Mahua, and IPQ5210 Qualcomm SoCs.
> 
> I pulled this one as well now.

Thank you, Arnd.

> The contents all seem fine to me,
> but please try to group the dts changes into smaller branches
> so you can send some of it earlier when you know that you
> have a large amount of content queued up.
> 

I've considered splitting the branch up like so, but have not found
a model that seems feasible. New platforms are intermingled and there
are often cleanups etc that crosses multiple targets. Forcing a cleaner
split of such work would seem to result in more work for everyone
involved.

I will invest some time to think about this.

> I know this is hard, and I also tend to do things in the
> last minute, but it would really help to have e.g. the
> newly added SoCs in a separate branch, or even just
> the stuff that you know is ready by -rc3.
> 

I generally don't rebase these branches, so starting earlier and then
following up with incremental PRs should be straightforward to implement.

Regards,
Bjorn

> This pull request alone has 178 files / 258 patches / 38000 lines,
> among 686 files / 913 patches / 68376 lines that are queued
> up in total across 63 branches we have merged so far for 7.1.
> 
>        Arnd

