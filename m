Return-Path: <linux-arm-msm+bounces-11606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685F859924
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 20:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA08EB211C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 19:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA93171B5F;
	Sun, 18 Feb 2024 19:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="V7Pr+ZX8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="f3kw/JVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9171B50;
	Sun, 18 Feb 2024 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708285837; cv=none; b=tejEM9z2CCAGihmJMdOqYpMdYB0fj6S5nYwMboYCbvT4n1vb5Yo27EcV3WzgE2bIGcAyDKf2W+v6aHQf9TRmHxOn+PPEkvP+UT9I7tysoualEhMOfuLq0I0j8uBLYAK6wzyC5rQj5OCiDtuUFs2Uo9N8Vl1wVYr27/8jDhiK6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708285837; c=relaxed/simple;
	bh=TKFpfcPeRcYsTV4GjB4ihe2ROClfaTY/nzWAwE89fp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBmyQup3TrXU8Nu9W+l9M919IT90ApbHPUHS+7k/iOuHYp3fM9fgQrjlsKtMonmfHuwi/9Kpzl5eRwrX/76zcep5108j2wySOmYEcJApjcHAN0B5f1KuOl6Eh/CBt+/6PcTyjI0zMPBZ7iGs38x0JVeBE394Y/ZUaoAncNeGc8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=V7Pr+ZX8; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=f3kw/JVt; arc=none smtp.client-ip=79.137.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tXspQWyU5ixVAVlp5U9gqUu7jfcvFsgDQXNLk+jO8bg=;
	t=1708285835;x=1708375835; 
	b=V7Pr+ZX8tNwVDHIP5xSPQVjKrchLjPbkVXN0I52zJczP2wXvWxUJoC74reFwu0jAEBAQ6ZrbmhN/hP8Nium34p1Zm4D/4WkmY6YC4dED3tboZJTngE+36TDgmV3j3dHjfxwuEA/u20cHweQAisKwC4YAl2yZiwgC/mYCXR/dcXc=;
Received: from [10.12.4.2] (port=40366 helo=smtp29.i.mail.ru)
	by fallback17.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1rbnBC-006VNm-S1; Sun, 18 Feb 2024 22:50:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tXspQWyU5ixVAVlp5U9gqUu7jfcvFsgDQXNLk+jO8bg=; t=1708285826; x=1708375826; 
	b=f3kw/JVteltJ5n0sIpOWnzS2nkQ3N/eqIupQlj4qkftI3VyqTrMy94ULR4rKpIYwR0eQY4ThA2W
	ib7txnEDhz0FCAhRmsW1UnrzchEdut0ukE6c2JO6xccSdTyS4phJpBniv92BnvjzTu+qiApRv5PLg
	bhzmxSFt9gNU54wFgyA=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1rbnAx-00000006hY1-1A3u; Sun, 18 Feb 2024 22:50:12 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	konrad.dybcio@linaro.org,
	johan+linaro@kernel.org,
	quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [RESEND PATCH v2 0/1] drm/msm/adreno: Add support for SM7150
Date: Sun, 18 Feb 2024 22:50:06 +0300
Message-ID: <20240218195007.89960-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9001F8F2F6BAD2021721DFC1638C0DE020CB518295F388C0600894C459B0CD1B9C77F9E135FB311277FBBE522E338CBBD4F378ADE17706A3EC08A02FB1A177B08EB35CB8B4FE073DF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE798269FE5AA193785EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637645995A778B1BFFAEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD8711589BF73563D8407093479921BAD48A3948C3A82C744136BA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7BE2AB513042E4E129FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3D6B8D1F75A55B56DCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249FFE9C0405BC51A3F76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B7547E92DF89C4BA73AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B37C49EB0B884C57175ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5265660B97ACE595F5002B1117B3ED6965AFF308CB0BD5349C81EEE05487B0209823CB91A9FED034534781492E4B8EEAD303003AC7AA20DD0C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3433E9BC74ABA5769F16B612D1C39FDACD7B0A6DD036440DF1FA0C74E345090A5B265F7A2B2E00F9671D7E09C32AA3244C013BCB53386EB223A0CBE312C330D7D57E26A65F5B837995EA455F16B58544A26EF364EE5276B8775DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3ZJ49a6yxuuDFfkek9VGiw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B81DDCAC1631E747BC5A20191D90C84F10E1F135C96F09699EEC88A1604BA1852C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A77971E4CF73965D9E271BDE2CCB4C0C00F71F5ADFC38F36049FFFDB7839CE9E8F5A60B08382AFE3E0F7847E6FD998847CA377D8584332FB0A79A39ECE7D8497
X-7FA49CB5: 0D63561A33F958A5CF20B0C07028F51B1685AF5695970D5B67CDFC33E31574E38941B15DA834481FA18204E546F3947C6317DB91DEFCD113F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063713EF0ED8E3D2D567389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3D8B0ABA717EF295735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3ZJ49a6yxutrK0NJO7Fvdw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This patch adds support for SM7150 SoC machine.

Reason for RESEND:
The discussion was resolved. As far as I understand, everything remains
unchanged. Let's make a RESEND for the patch so it doesn't get lost.
- Link to v2:
https://lore.kernel.org/all/20230926174243.161422-1-danila@jiaxyga.com/

Changes in v2:
- Use a630_gmu.bin instead of a618_gmu.bin.
- Use squashed version of a615_zap (.mbn).
- Drop .revn.
- Link to v1:
https://lore.kernel.org/all/20230913191957.26537-1-danila@jiaxyga.com/

Danila Tikhonov (1):
  drm/msm/adreno: Add support for SM7150 SoC machine

 drivers/gpu/drm/msm/adreno/adreno_device.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.43.2


