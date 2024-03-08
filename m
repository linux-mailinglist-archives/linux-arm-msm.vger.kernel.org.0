Return-Path: <linux-arm-msm+bounces-13736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E041876DE3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 00:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1311282674
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 23:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D583BBCB;
	Fri,  8 Mar 2024 23:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUcJjUnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3F1E4BE;
	Fri,  8 Mar 2024 23:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709941407; cv=none; b=MH/uqGnkX2Rq9L7fMVVQS/YNvr6wnILkuIkyB0dSGsWgnUmI5q9E3pClu6z/JxyDGfDEJtKpi0FEC/d96Mb1r83+e7I9RJHHR2bMvzsLVJNzkJp05xJtSJfjIIAHz7uTUY8e6r1GdiyfFZ7y7tmOJm8riNCkU7N8q93wccnDSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709941407; c=relaxed/simple;
	bh=lf9bXXOg8t/e1+SYxRNGOQP7tXnAg59Eb5F2iUMFkwA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QJz9wEXO/UE830hjB/HYna29zPadetYY/d24FBWS+uzB1iCEkXYxwDPeePr3VCcHm8M2hnTXmbqPfvitQl91ZFwhERu2uOCOGbgfDm3e8kdvQ20KmOAwQEKxVsSoDum0ozrtZCNOQ9os4ovKSv5WNFPzBc4qRx4FB2Uakwa28lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUcJjUnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A6DC433C7;
	Fri,  8 Mar 2024 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709941407;
	bh=lf9bXXOg8t/e1+SYxRNGOQP7tXnAg59Eb5F2iUMFkwA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hUcJjUnwMeuRjwRSm68+02Vq45FRLo8pGccoSSSE1bBcmPObY8QCLbKXQ9LkJjrVO
	 mjGyJ/61pCEPGRqKytLyc8vFFgqCj2EsDeJm5IxF++CyOtpR1zlWGBPQ+7E3ksIgQQ
	 4nZPYepfOSzx3skGZNuG310mj9jYVKVEkZYOxnnl2vTQuvP3W47vpavtyRtrIsXfkP
	 6bnzJvnoljIQ411X5mAlYcYH0lLPzxA0XjOjcyl99XE5Fbbh+P2I7KmokkKsPzBq+2
	 vmBfvvE2FkTLzPXlCTzQZAFqoVNcBRSyNKmGClhLJx2NoI8ljUpGEyGgKPjP7uQbNe
	 DPoGfcDbijW0g==
Message-ID: <47ef5ab18ed8e995fe1bb0c2fdf20c05.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240306034326.2358489-1-andersson@kernel.org>
References: <20240306034326.2358489-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Vladimir Lypak <vladimir.lypak@gmail.com>, Amit Pundir <amit.pundir@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Fri, 08 Mar 2024 15:43:25 -0800
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-03-05 19:43:25)
>=20
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.9
>=20
> for you to fetch changes up to 7d474b43087aa356d714d39870c90d77fc6f1186:
>=20
>   clk: qcom: gcc-ipq5018: fix register offset for GCC_UBI0_AXI_ARES reset=
 (2024-03-03 20:00:49 -0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

