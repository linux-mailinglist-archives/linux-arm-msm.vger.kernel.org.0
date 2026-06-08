Return-Path: <linux-arm-msm+bounces-111641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BDbLMgAvJmq/TAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340A652595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:54:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=gHnag+Kb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDB4F300678E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737BE33689E;
	Mon,  8 Jun 2026 02:51:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731104.qiye.163.com (mail-m19731104.qiye.163.com [220.197.31.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D83358D6;
	Mon,  8 Jun 2026 02:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887119; cv=none; b=DAa8/6I1vTptLxhFEjfMvUaAlUYDShavaxrr01zzKuw02E/UNBZzdCsSnM4bAvBRdJ1of35cJQDaGVWuQRdAt/A+klUB9OwBPYsfis6C7a0DbEwnKti+jgdtt+3l7FG/AhXoMaVWLBMyrEgB3NtwUOgOmSPLM2d5UBWoJdylhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887119; c=relaxed/simple;
	bh=N8vUXE64W18PddgRde03vNdC4qGDFahuP3s7CY3yLCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5gHX8BrQVacp6t/zuJcFKQOpwPLgS7XHegtI5feYVG4ENFEeozS/0BYRpATCtJHsbfXT2E12c2uLaEI3OzSk9hYSXYXwVez8RLzyc+935AQ8L5N7aoHZ6Xi0YcRR4ptsI4wSCcEVlAkTI/1aDK4wMnABXOG9A1wemhcjTcvCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=gHnag+Kb; arc=none smtp.client-ip=220.197.31.104
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416dfdcb3;
	Mon, 8 Jun 2026 10:36:20 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3 sound card
Date: Mon,  8 Jun 2026 10:35:54 +0800
Message-ID: <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
References: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea516918d09d5kunmbe08a6ae1cf591
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxhMVkkaTRkfSEkaGBlIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gHnag+KbBmDxSfNbzCg4SJ5D3rHhzdTVK+WSqUD+j2WjuqCsW+VRceOpHD7vM/LsCDs/K5Yf/HC/j5hRsQ3zqsXQcQOK0tPY27taggFg/cV2fF0S7G6L0a3Ey4AeKU6s1nn8RRAmCBluiXmXlaID1iv0W5KCFD8XuSqc3qD/9p0=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=w0y2HqBqO72JeGZBjz2G9m+/S0jNLXjZrbfu9iyJgQE=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111641-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,endlessm.com,thundersoft.com,katsuster.net,gmail.com,oss.qualcomm.com,perex.cz,debian.org,suse.com,loongson.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:broonie@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:drake@endlessm.com,m:hongyang.zhao@thundersoft.com,m:katsuhiro@katsuster.net,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:matteomartelli3@gmail.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:perex@perex.cz,m:robh@kernel.org,m:rosh@debian.org,m:srini@kernel.org,m:tiwai@suse.com,m:zhoubinbin@loongson.cn,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9340A652595

> On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> > Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> > Thundercomm RubikPi3 sound card.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index 15f38622b98b..d95e072fab25 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -48,6 +48,7 @@ properties:
> >            - qcom,sm8250-sndcard
> >            - qcom,sm8450-sndcard
> >            - qcom,x1e80100-sndcard
> > +          - thundercomm,qcs6490-rubikpi3-sndcard
> 
> Would it be better to follow the newer pattern and define one compat for
> all Kodiak platforms? Or would it be possible to use any other QCM6490 /
> QCS6490 card as a compat fallback?
> 

Thanks for your review. I think my commit message did not explain the
reason clearly enough.

The RubikPi3 compatible is intended to select board-specific machine
driver data from the sc8280xp OF match table (added in patch 4/5 of
this series). RubikPi3 needs different configuration from the existing
QCM6490/QCS6490 sound cards, including the ES8316 MI2S codec clocking
and headset jack setup, so using an existing compatible as a fallback
would select the wrong machine data.

> >  
> >    audio-routing:
> >      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > 
> > -- 
> > 2.43.0

--
Thanks,
Hongyang

