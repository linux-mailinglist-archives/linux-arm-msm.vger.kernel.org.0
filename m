Return-Path: <linux-arm-msm+bounces-57899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FDFAB7349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 246177A249A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3827C280304;
	Wed, 14 May 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcd83feY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AC1F4607;
	Wed, 14 May 2025 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245231; cv=none; b=NgoTit5I7iz4NGEBBzuJWosGju/LRzkEty9+ygV3UCWru3Pm4zf5UeJlcYuVkfsLbzlM0Svy8SclkYfXKl4vZ+bHNa1prOiWkpiYdX6b0vofmQZzWbSj3pAHbrxC7H6JKEisf3yxRDuapxkCRvucQ5KZwv/glAoveWfb6At0isY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245231; c=relaxed/simple;
	bh=0aB7Zf1FjNrjHWMfXxq/GZb+CC83CIEm1R4JLzr4fIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=duONkQsAE+0Rhn1jlNiJW4pm3B0mKm5zUHKolu4PR93v9X+DrUNN12BbpclycJGgcO+k3XEw55QocExgTUrorzp4QwXUwNkWyYnyMJ5QxU905vjs1IW/zYWIuArvOxlvoIbdKcPfJy6Kj3hTj6VfORnBLR7YHfU6sb9r0CwsdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcd83feY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D16BC4CEE3;
	Wed, 14 May 2025 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747245230;
	bh=0aB7Zf1FjNrjHWMfXxq/GZb+CC83CIEm1R4JLzr4fIU=;
	h=From:Date:Subject:To:Cc:From;
	b=Hcd83feY5Lj9t7DrEIwBfh+va0pXhDL0MIZ1ZdBpZve0KF6IMe7WGaV5O6HM9U1lH
	 oApRhUzXE/hsQuKw186x1QXpektlLW5hBI5gu7o/NSai7E98pMatFzrT50AVIQCtQ8
	 wtE/lx3B9kZxzhYnHFkGxGcEa6RwbdUim8rycRnm/0jwq6VAADHUnobsQpU9LahzUn
	 PEahdDvfKT/rOt16wfsLNR7qkSiJw4rxuA4CCWsBF/PRACH3ns0TqYbDc8yDWkKe9M
	 K1X0gk+opL0n50DgfuHri5fk/bigIwR8DXAdNxMG7cTEzB74/I/dMkhLFmv7VFNdav
	 tGVYMJ0btuv1Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 19:53:38 +0200
Subject: [PATCH] ASoC: q6apm-lpass-dais: Print APM port id in decimal on
 enable error
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKHYJGgC/x3MQQqAIBBA0avErBNSm6KuEiFhU81GRSOE8O5Jy
 7f4/4VEkSnB3LwQ6eHE3lXItgF7be4kwXs1qE5hh7IXtw9sxZa8NSGyu81FeScrUPVajwOO04R
 Q6xDp4Pyfl7WUD3I/AQRpAAAA
X-Change-ID: 20250514-topic-asoc_print_hexdec-524337657995
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747245227; l=1175;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WY0FCnwcfqmDBpegGuUNmfFMF0650DhHOEzIRDiem8c=;
 b=mto0jGaH93OINWmFwcr/neBFIyIfQyzqRiRNXCWllVQP2UykyWkIVQAC2c/89linOlsNqoqFR
 PoNXpaCWpASDCOIKgjzHFBbCD5yMossZq+wzad6O3ATUJockzfvALJ1
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Change the port enable failure error message format specifier to make
it less confusing.

Take the chance to align the style ('fail'->'Failed') while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 9c98a35ad09945173c15dd6dff34830f43fe9388..a0d90462fd6a3807502f3e272dfb852d4d9c0f62 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -206,7 +206,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 
 	rc = q6apm_graph_start(dai_data->graph[dai->id]);
 	if (rc < 0) {
-		dev_err(dai->dev, "fail to start APM port %x\n", dai->id);
+		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
 		goto err;
 	}
 	dai_data->is_port_started[dai->id] = true;

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250514-topic-asoc_print_hexdec-524337657995

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


