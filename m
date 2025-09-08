Return-Path: <linux-arm-msm+bounces-72584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C029B4908D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FF4A7A74D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C7A2F0C6E;
	Mon,  8 Sep 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gYYpZSCh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XYQvOQiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833812FF153;
	Mon,  8 Sep 2025 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339950; cv=none; b=NDpN8o5gwMhca7MVJ2hamorR7D6y7sziQOpLloYe0Pz2bL9hpwEGBEc4GjoaJwitZB6/p3wuZWftFUGpKISXWlDwW/pp4YAvSlpSK1wtIjvvS0XhrNMiDUcmcV24W0FB5+zNqmvPKZKQvcJGtFAN47e4xKGbIkFrn5ruLwJ9gN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339950; c=relaxed/simple;
	bh=T0DRC9XOXWPDokyYn/CqYBbxHneCf5W2VpWUn6JME1o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ahfwy6+k6WQSOl7MrCOG5AomZ2jhFM1kNe/MHsNwBMM2lvJfsLwT7vh274Q/EWC9Micx3yhAcj0G1I8K0D5M3w30CS2bMPmum17ZnEnzfdBMfjt762aXZurhJHf1w5p3ueYmcY/c+sIH90ejv8foJatuZrGxCxDwXZ67moF7Sak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gYYpZSCh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XYQvOQiN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1757339711; bh=ObNTPgZsSMGctkGrNtmJMCE
	X17DjO+Wm+543Fqz6F3k=; b=gYYpZSChtVuLydo0B6v5Yle1W0H3yuCG1/ZR//KidLj+CGk9OU
	8M4QgammX16MHY/HtrigX8/DnKiHCA2OZ8iBPGi8xM54lhwAeDgPog+LziRDEA/DRpKT9amBpbC
	VkyMAiAVVrRB491RklOHhhq/WNdLMo/b+7GeNmQpK1sZ6LjnY+6diEbY4Xt1j7BEwTUzGm6YfsI
	UwXlclKu8bh7sbe8hWPXvqP+qWBCa/HDy5Nkib3nwFYp377OceUicOFtQUz8stq7T58xYIPMy5F
	Hb2W2iHpdTsG4gS83Ow5opyKBkb6DENa0zefOVTd8T+P211I64h42ontc8svFGNolhw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1757339711; bh=ObNTPgZsSMGctkGrNtmJMCE
	X17DjO+Wm+543Fqz6F3k=; b=XYQvOQiN7iK7IL82Mh/2vNV6OuuebiEoYFRwqXx0lPFimca01u
	xSm+feA7ElPpG/6R5Ew8QMApizGFJncux2DA==;
Date: Mon, 08 Sep 2025 15:55:09 +0200
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH RESEND v2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
User-Agent: Thunderbird for Android
In-Reply-To: <20250831-fix-qcom-smd-v2-1-a1c0a59d6a3b@mainlining.org>
References: <20250831-fix-qcom-smd-v2-1-a1c0a59d6a3b@mainlining.org>
Message-ID: <5F4659D9-F163-4149-8602-F53A8AF41568@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Should i resend/reword the commit? This change is important for SoCs like 8=
917 what are still using qcom,ipc (because of cycling dependency) in the rp=
m,smd node=2E

On 31 August 2025 00:39:43 CEST, "Barnab=C3=A1s Cz=C3=A9m=C3=A1n" <barnaba=
s=2Eczeman@mainlining=2Eorg> wrote:
>mbox_request_channel() returning value was changed in case of error=2E
>It uses returning value of of_parse_phandle_with_args()=2E
>It is returning with -ENOENT instead of -ENODEV when no mboxes property
>exists=2E
>
>Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_wit=
h_args()")
>Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=2Equalcomm=2Ecom>
>Reviewed-by: Stephan Gerhold <stephan=2Egerhold@linaro=2Eorg>
>Tested-by: Stephan Gerhold <stephan=2Egerhold@linaro=2Eorg> # msm8939
>Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainlini=
ng=2Eorg>
>---
>mbox_request_channel() returning value was changed in case of error=2E
>It uses returning value of of_parse_phandle_with_args()=2E
>It is returning with -ENOENT instead of -ENODEV when no mboxes property
>exists=2E
>
>ENODEV was checked before fallback to parse qcom,ipc property=2E
>---
>Changes in v2:
>- Drop already applied patch=2E
>- qcom_smd: rebase
>- Link to v1: https://lore=2Ekernel=2Eorg/r/20250421-fix-qcom-smd-v1-0-57=
4d071d3f27@mainlining=2Eorg
>---
> drivers/rpmsg/qcom_smd=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/rpmsg/qcom_smd=2Ec b/drivers/rpmsg/qcom_smd=2Ec
>index f0f12e7ad2a61922723c16e45738e93bd432c6c6=2E=2E42594f5ee4385c0071c91=
d9a5a05fb8517c82bc0 100644
>--- a/drivers/rpmsg/qcom_smd=2Ec
>+++ b/drivers/rpmsg/qcom_smd=2Ec
>@@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
> 	edge->mbox_client=2Eknows_txdone =3D true;
> 	edge->mbox_chan =3D mbox_request_channel(&edge->mbox_client, 0);
> 	if (IS_ERR(edge->mbox_chan)) {
>-		if (PTR_ERR(edge->mbox_chan) !=3D -ENODEV) {
>+		if (PTR_ERR(edge->mbox_chan) !=3D -ENOENT) {
> 			ret =3D dev_err_probe(dev, PTR_ERR(edge->mbox_chan),
> 					    "failed to acquire IPC mailbox\n");
> 			goto put_node;
>
>---
>base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
>change-id: 20250421-fix-qcom-smd-76f7c414a11a
>
>Best regards,

