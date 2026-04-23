Return-Path: <linux-arm-msm+bounces-104354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBJdFU0k6mnRvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B84534CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5579A30074EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4826E29D260;
	Thu, 23 Apr 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Sf0G/QlJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dmU3Se5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C42248A8;
	Thu, 23 Apr 2026 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952111; cv=none; b=XpeENBxbNzAtvWSJgyAN0AX00EaHA2+fQ0Gnz9i65uGmwewkeyE1/Eb5xu/MSeN9RUoQ7w4RbWWhHZidmIY2yJ+NP0kVAonm3DfGgbvNXJpGbPYCvmprzOolmrXL/QOgL3sfGbx+uwSPQIDU9o0ATLidsLA+2O8NCqjIodE+28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952111; c=relaxed/simple;
	bh=CD7JbdUIZT8JduFaMDsHEf2I3lR2qNGtYUCVh8vYBLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kilj4ldBCtx6/6ioig2FfdwSZbgAXgRMstzJdE0B9l4kwLNJoidnpXFSk/wui9Xth9fcjVtNIyuugcaFgiX3n/O8zUHf2dcbrZO0y2sF5AsH+GVANepelerG3aMFaissr8UmqTp/zs0NRfD5MoTmHCzZdlQjolrdRWbg4fCUUCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Sf0G/QlJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dmU3Se5U; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776952105; bh=w5k0XO8LJEIzi6AeWI+9kH4
	GzIhYNOUnnHZx6jNXtLI=; b=Sf0G/QlJLFx5a/B42BpSfdf1AIeSuvCrIFSdb2/HeyjTUDS16k
	MluuICBT8AJ8fjiGGu8l/5ACDhhVbuVe0pmDFuN1L1YWEvP4fivcz7L69dpzQAvbcltcnP8U0QD
	z211VfVmfX7HZRjdeieDRpTZaReKaJMsRv434qyjSRHtko1fmf8TQr9b6Wky4w5j1giQ/IYh6QQ
	74EDrMjHwKW27zOguSfhI6Jz7N44oPDBQpbg1XLLGYNjpz86iBBcFVVbPkjwRGniG9dLd+MH4f1
	0Ga0go3lTfHh/vSKUWRlHCqMxFUSGwS7GQKZURQGcmxuLXWQ571+5YdW4/j9pM8MzHQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776952105; bh=w5k0XO8LJEIzi6AeWI+9kH4
	GzIhYNOUnnHZx6jNXtLI=; b=dmU3Se5U5oPHiS5IcYaIuxorVkqWO1ex+d0PrilJTMQzOX7LcR
	XOyGrxVhVHSiz1MO5e7O3h67NnFdQ4k1fkBA==;
Message-ID: <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
Date: Thu, 23 Apr 2026 16:48:24 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104354-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 514B84534CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


23.04.2026 16:08, Konrad Dybcio пишет:
> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>> assign it to the ADSP FastRPC node.
>>>>
>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> index 36b419dea153..af2bc29ccdad 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>                        compatible = "qcom,fastrpc";
>>>>                        qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>                        label = "adsp";
>>>> +                    memory-region = <&adsp_mem>;
>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>> Please double-check that, the VMID used to be different on
>>> older SoCs
>> Do you know how to check that?
> The least painful way is probably to add debug prints to what downstream
> calls hyp_assign_phys()

I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:

VMID_HLOS= 0x3
VMID_CP_ADSP_SHARED33

>
> Konrad

-- 
Best regards,
Nickolay


