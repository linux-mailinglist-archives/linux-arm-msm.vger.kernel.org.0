Return-Path: <linux-arm-msm+bounces-31970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913C97BF5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 18:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15221F218F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 16:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354961C985B;
	Wed, 18 Sep 2024 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIuXeXLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8831C1736;
	Wed, 18 Sep 2024 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678796; cv=none; b=S8UZdrFShItUvoYAdYSvKtI0nRQeNTFh9s1FYHuH7+6oPvDoa1CtnY7FggqISzJb07iG93zouWY+4WB+UInf5ldMZAsmNqxy0SRtSLNfNTKjhuY3PxyaTSzTTjLNbSH8+plEK4fEFB9ih+o6knhoiNTWdpBLzy6Sq2DtCDN0jZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678796; c=relaxed/simple;
	bh=NC9j+2ZyLN39hfDlR7lvY1YWapL1nV0mLnxgFAj1QaQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=k10XhXoRnOLPzdm4WRQDwmCuynMSO8hVVUwy+1RtRYRqUNxV0Hs/vbThNF/loAFaBcf4IsSnXlswjrHKzkxk3MXnco/1B2yN8JEbyE0nAC+4vK+laSQ9zdFk4GYsqJ4Q553dHVn+92/kDWmNOUc2eiM80PrdPfOqUKGhcfjQX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIuXeXLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53176C4CED1;
	Wed, 18 Sep 2024 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726678795;
	bh=NC9j+2ZyLN39hfDlR7lvY1YWapL1nV0mLnxgFAj1QaQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vIuXeXLRfNt4cPiR81A0Xra4qQiN9AIYGL/AcHOalR/QFAQM+fwBRVg16KB5CeIgK
	 U9+yxMxfTXJliP4cylJl2UfBpOXehCb7quimSGRaZA/AG8EsMJkN+iQm1wv/uo7sNY
	 XKsnmsg8r907jZIu7kEfn1f6g2JxN8h3uXOAaRT4U9bYtskWCFKIRAahZla7KrIh9/
	 wcLGYYHB5m64UyO2skiFgxavqaVRYabm8WRUYoU7dK8dbX1pTuZ9qZk3EknWxul3n6
	 RGNcTEf+tkhCJF5DE5wlIc06CCR29Vrqd0GAli8vfCDH/zJLkvEyv/r5mKWWsJbzx0
	 uokv3la2tRRuQ==
Message-ID: <038cdb46c8e0a615894b25e3aac5483e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240914223233.1342-1-andersson@kernel.org>
References: <20240914223233.1342-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, Luca Weiss <luca@lucaweiss.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Mike Tipton <quic_mdtipton@quicinc.com>, Rayyan Ansari <rayyan.ansari@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, Vedang Nagar <quic_vnagar@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 18 Sep 2024 09:59:53 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-09-14 15:32:32)
>=20
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>=20
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.12
>=20
> for you to fetch changes up to d628455ab3c22bf633935f5d09451530c44c4ba3:
>=20
>   clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's (2=
024-08-20 17:15:16 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

