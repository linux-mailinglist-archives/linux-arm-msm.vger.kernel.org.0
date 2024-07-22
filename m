Return-Path: <linux-arm-msm+bounces-26818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CBC9393E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 20:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430BF281E21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 18:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7683B171066;
	Mon, 22 Jul 2024 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0qrU/Gp1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="gRoxqCba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85871CF83;
	Mon, 22 Jul 2024 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721674703; cv=none; b=W3khiIZaQF8HgsDALkUlYKGWmj/vrVnHsx8++jxj+N1/suvSKYn8Y+8P/DKdZt6Qthi7y6es72kxAaPGrP+mK8+ePX4vy85saD6E53Rizbw61Ha1c6Vbomm4V8bOSSeSiw3l5oPOG4d3OFnWJMECBDHEJ2hFxA9rwWj1Y96SZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721674703; c=relaxed/simple;
	bh=OSMXzSOmTTiqafEHa50ECyYswTH7ZWRB9GPeb6pws4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbWLjN5ii32zt0EIeeejpb1tYad6VcHyWNOKJxYKcOtmLID9+/zpwK0y1Xu8uZFrbw+7mh9wmFUEOsp2I8P/JcqUo3+5/9GY53uEy/ljIsZV2HxPVbW08xJwPVxZLFDFbfSr50E2eOXg7dwHXZhRAPnu2vhnTDieawNx6qBcbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=0qrU/Gp1; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=gRoxqCba; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=OPm/EdnXheNgF7FGrsEGZgL6qdviqwNABtAR18c6H0Y=;
	t=1721674700;x=1721764700; 
	b=0qrU/Gp17yssnKcsPCPE6F2S6pe/oHRAM5py/TiQvFwfiYo8Q8hKnMQXvD2DSqIl3JxwiP/IiH6kZs0qwdNIjH4iYI5TCdnUJ9oTFAj5Wv4Q0I3FNcQuJ/qFVF2NpeeT7DQawNQGeDf5X0bNLPxImAR7rFdnJAUndJO1/eI4q/0=;
Received: from [10.12.4.12] (port=58882 helo=smtp37.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sVy0U-00E64a-8S; Mon, 22 Jul 2024 21:43:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=OPm/EdnXheNgF7FGrsEGZgL6qdviqwNABtAR18c6H0Y=; t=1721673814; x=1721763814; 
	b=gRoxqCbaz54ZQ5OR7vVEvWbiN4WK2jvyru3EFyaTCmip2vkKElCd9l/2QRZDlO/WZfxHvyWC7kK
	VQMOn5clTBRQgOv1eywSm0U+34NbYjC9+8L1QZdgl3fCkuU7lKaO2rOiFqYNW+zDpfmNG3pJEvvlp
	GRBxMQxDAUaYlYDSn8s=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sVy0D-0000000068S-0LmM; Mon, 22 Jul 2024 21:43:18 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robdclark@gmail.com,
	sean@poorly.run,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	fekz115@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	cros-qcom-dts-watchers@chromium.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 0/2] Add Qualcomm Adreno 642L speedbin and update SC7280 OPPs
Date: Mon, 22 Jul 2024 21:43:12 +0300
Message-ID: <20240722184314.36510-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CE050A5E50D666DD0D1FDA9CE13C33044182A05F538085040A2FFBD098F5F787B3DE06ABAFEAF6705BEBB65AA4D12FC2F48430ABBF7BBE8AF7F64C579677A1242
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7904AD829351C4442EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D99F96657F58F1038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D7F4317D09BF9B40EEA9110145ECC81A5B4CF0192991BA58CC7F00164DA146DAFE8445B8C89999728AA50765F790063735D2385A5E2B3AC3389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8E753FA5741D1AD02F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CABB3490C75E892806136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C30EC065BD0AE56831BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF7EF884183F8E4D671DD303D21008E298D5E8D9A59859A8B65FF0BFC5AEE34BE675ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-B7AD71C0: F8D540627A99B4FB7DB86BB5CA128351461DD7A0A9FF8BE1E8F7B195E1C97831E896A1E74BEF4DCA99D32A3E8D98C3BE
X-C1DE0DAB: 0D63561A33F958A57738EB63184333AE5002B1117B3ED696B4A40075F92D44171BDDAE3D1EA49BEA823CB91A9FED034534781492E4B8EEADEF0AF71940E62277C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD75DCE07D45A7499577DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0A3ABCA45B3627C90D12FA681051EA9C84AFD540A386D13DD03F8F74A4750CD924DE828755D94EE916E58414F0424C726D9B744909E6DAE7172AF92A66CE5F5B5DF44ADC15825ED48100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXha/rcnMLv+KTLU88joHekl
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28EF33F69C7E48EA1FBA7A408BA37DB7622AA1143A990D0E1402C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401F4E5391F75DBFDFFE17084D77CFDC2BDB7F5C7C293ABA3049FFFDB7839CE9E832BBE59233B4F379E6AD49EEBF0B07C8227DA794266535525CDCEF1474E70C7
X-7FA49CB5: 0D63561A33F958A5C671C8A61CDE276BF8E4E530E8CCD86084FE5B4602F0EE268941B15DA834481FA18204E546F3947C27087801AC92D1FAF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E86CBEAED33ED63B389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C35499B88F6F3D8F3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiPu0/l/w6bsKA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This patch series adds support for the A642L GPU speedbin (0x81) to the
Adreno driver and updates the device tree for the SC7280 platform to
include this new speedbin. The A642L is used in the Qualcomm Snapdragon
SM7325 SoCs family, which is identical to the SC7280, just as the SM7125 is
identical to the SC7180. Therefore, the SM7325 will use the SC7280 device
tree. Patches for the SM7325 will be sent later, but in the meantime, you
can find them at the following link:
https://github.com/mainlining/linux/commits/danila/spacewar-upstream

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Eugene Lepshy <fekz115@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: cros-qcom-dts-watchers@chromium.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Eugene Lepshy (2):
  drivers: drm/msm/a6xx_catalog: Add A642L speedbin (0x81)
  arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280.dtsi      | 8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.45.2


