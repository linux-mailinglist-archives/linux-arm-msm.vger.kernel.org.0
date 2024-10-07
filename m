Return-Path: <linux-arm-msm+bounces-33359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F5D992B8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EEF21C23807
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263661D26FE;
	Mon,  7 Oct 2024 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bHLM+SVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31471D27A5;
	Mon,  7 Oct 2024 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303662; cv=none; b=LhtVHy2L3S9BytasY5kPaRD+lAIRv7fiJC2dx3ICGN5GsmK/H3AS6MIHNhXpAG/HA8IYGtprLOrX3NJevjulBBoumzCpS3y7hNZB7pk/qpnCRV70gJqpoesQz9clHD0luV8VEi0joKR94OlncV6VJKdHS7igDDf1iFeE3ePirWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303662; c=relaxed/simple;
	bh=/GmggK7t18GXzw5zOZycQRz+IDt5txZjeSYlbdPeeY4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MuChDahf4ewcfP2RgdOkonwGRs+tj12W+LQAUTlccil31wkLSS9UP3z5r1i2Gk2EBQFyshS1AwWiyms1LIXQeH1QFRXEZHasBW4OabNgdaYTOY7rmY6bN4rCyqnNTSGRFxwB7Yjwr+wQvnVdY2tt4AjXo6SVc8OJbhZb6RZ3rcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bHLM+SVZ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728303634; x=1728908434; i=markus.elfring@web.de;
	bh=/GmggK7t18GXzw5zOZycQRz+IDt5txZjeSYlbdPeeY4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bHLM+SVZWlGSCFlphG9GUsIP7D8znN7Rdsr4oAww3t1c/KttrgRLnXh4cN4WJt4u
	 mEz1P95u8o5h50Ut7gRb59Es1KeIbA8w9PRWd91yiXXepiGYhHTgdXl9IG9d9YJtx
	 GpL3c418aEO7XEVXYl8uL7g7cmL0tw49AyJ/hGQo87q0sceUY6lJcbd34d0u9FuE1
	 YzzcB2t3R3hWK7zFnYdz7S3wNDOzl+i2MYQRQLJf63bca01kDZTC+I2lBRMT/qstw
	 AdX8sQwBdKy+ob+YXbU1SYkfVE+F9hGnipVi+2B38F9l2anx+jsVwFfBn8/s15aIY
	 ziZe2Qy33Djq5Oa8Yw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1trPmp0v7t-00se2x; Mon, 07
 Oct 2024 14:20:34 +0200
Message-ID: <78ce32f1-0037-4caf-98fd-1e73216e3778@web.de>
Date: Mon, 7 Oct 2024 14:20:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
From: Markus Elfring <Markus.Elfring@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
 <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
 <2024100608-chomp-undiluted-c3e2@gregkh>
 <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Content-Language: en-GB
In-Reply-To: <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0/I9nLZtNHJn+8QIWefoO9WcBYmjaQQoCt5aoy4FevRamxm7P0Q
 Q9foGI8xfnQEOl8gd8qHaI4rbnwqgXDrPSvIVNBZxHpmO2S/51vo9R1PidVJ9ShIAjYGEe/
 I3y1XsZLH0yNLQpanCWT2Px+hVrkD9sQQa85Gk+gFp9Xmhsmm1G1GTBdw3jPWVwkIsmkPLo
 O6RGxdOCvKk9XmGiTLNXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9C7O/4L1sAY=;q/IaW97ObEBUXcpA1ESM21aujM2
 aPpH6dgfr8LrKuNnoKkSuHYPMaIKQkVpFDQ/j87UpMeh1FNFOXCeR9RBnKPRPs4NZ/Fip6EXj
 79Gks+a3lZFWS60vXOEO1ZOwugvU/Or1rbLX7A8O7lIIyJfDjfwpUHGFXNv374M8WgyaaGR6J
 0nAyGEpiVwAJWPlc2Q36PaJB4OLFwwCt+Q6Ez9Q2Fm5ssFW7Rk70VoSIfEj77+kKacfBDO33B
 BZyi97p/a4Frs9xo4J9kupmxpbmP7ci9/pGwowMd8BbMWQ4W0vv3Qwrt6oYNqt82lhE3SVsn6
 H6eRC4hZAeCbEsSaSvylUUzcop9RWafF3C+4tiNa5Mih/TVQ82JZypApr3sNbSWuAJQcbr2p9
 rofnZQIwjUu+ET5YuGdqmM9fbf2DXfeyIOFxkL0/sDz0rRxbi/kVwPDeSbR+K2gUXFvg9eJob
 7lj4PHRb/6Biok0jzutVZI/mGQMi9d8d8JmIrljoRB9Q+6sWde7ah8Ci9fdZCKtmQd7t1Gcvf
 Y1TCwznjPMXgev6J7br+fN48lmXMctT7OJ63GL/jxMbC9aqvJoALKxSsZk7IE28ID7mLJoWzp
 sYMfNYkiBGRMrCsk1cbPSCXs9pJHGhQCkeA2tVyVX0V/nRshIG260EjfJbNdaPcnaY1fdpcB4
 ZGgc4mPVr9j5RGetnKskUyA9ps0yaVu91Dx8g3ltsu+3FXNwc0RivmhzO5H7En1psa6Rl/FBJ
 JdePx+nHyophij3lhiA77rqHfVSb1ORcHa8172Il21JH64Tu+2KhgbOuaOBV9+LmHDJPDVFXs
 TJ0FwmNsv0RKyJly8dQz1Wbw==

>>> * Do you find any related advice (from other automated responses) help=
ful?
>>
>> No.
>
> I wonder how this answer fits to reminders for the Linux patch review pr=
ocess
> (which were also automatically sent) according to your inbox filter rule=
s.

See also:
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22

Regards,
Markus

