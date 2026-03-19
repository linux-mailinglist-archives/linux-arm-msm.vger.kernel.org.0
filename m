Return-Path: <linux-arm-msm+bounces-98619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QONWCO6Gu2lWlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:17:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACE32C61D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C6A43029C28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25802397E8C;
	Thu, 19 Mar 2026 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TL3mCY30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64349397E88
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897451; cv=none; b=I27gCBFHLl09iPB93ewtGn8mJGZhxUHFZ5qCsrAOtH8RoKbSBMeb7PP7kpxPLZLju8nTlqEZ6T6WXYtJK1OaOncavgjD7HUxZOb1Ph1jL9hpeTv8RH4dBfqlTcZgStXQq1H6TI1ypqN8zKB34qDsJRFpuT3NXbTxaFWbdHhP67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897451; c=relaxed/simple;
	bh=8iSqG3x2o6WvyVuCa0n3oqyrmMUTpcn9qdWP474vCcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXZfQeDQPoEbBEYGjpQyvZRtktw9B4SNhNAw5qGwgePplYN/3qvieYBdEoF1WaT7jox2OFNmsrdtHCTLodwrUDzeoXpOrjwyPomMxnvJnfrIrwwC4w/FM3TH0q4r1YDcZa0UmXeVXy4qTp02SCASIfBDf4+GBr5b7x+6nUtf3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TL3mCY30; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773897437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGU76WHTiNP96NxusRYJzGZVbv7nm2kMIO9LDJdid6Y=;
	b=TL3mCY30jsexb8LxKKS7BdXmuiUi4JKVRpIa0JB8v5UeeQXy9lBUKHWpQbDLkm+PKFQ/eX
	vfF1U3wVd66GmG8Ixi0YfgUCMjZDPw/KTCLtgEyJsYKdb2F4DqUnutyx9vQey0M1R/dcwf
	tl8iPIUedkPMl7jmjxjmBKghUH3hEFVPQOPwgZTMK/uW9eQWs18RyEWntcCrywduP+6uDv
	wxKQV3enFkFltIWhky+hV5JOa2KavHIZJJQAkNqeTo8t63Od07LfsyvDion6eItJSQkqqd
	u5Sm6WrB+i4AxD0XCcqVD6LpgRzJp7VHRFbXDGXeFiiktioWwKoofSsLsWJqsQ==
Date: Thu, 19 Mar 2026 02:17:03 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mailingradian@gmail.com
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98619-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.892];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 8ACE32C61D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/9/26 3:51 AM, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Introduces support for the Senary MI2S audio interface in the Qualcomm
> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
> necessary mappings in the port configuration  to allow audio routing
> over the Senary MI2S interface.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
>   sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
>   3 files changed, 41 insertions(+)
> [..]
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 43d877322bae..7bd40e32f758 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> [..]


One chunk is missing for this file, adding it to the big switch in 
q6afe_port_get_from_id:

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 7bd40e32f7..40237267fd 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1783,6 +1783,8 @@
      case AFE_PORT_ID_QUATERNARY_MI2S_TX:
      case AFE_PORT_ID_QUINARY_MI2S_RX:
      case AFE_PORT_ID_QUINARY_MI2S_TX:
+    case AFE_PORT_ID_SENARY_MI2S_RX:
+    case AFE_PORT_ID_SENARY_MI2S_TX:
          cfg_type = AFE_PARAM_ID_I2S_CONFIG;
          break;
      case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:


With that + adding senary to q6routing and to SoC specific sndcard,

Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

(WIP device, patches coming Soon™)


Thanks,
~val


