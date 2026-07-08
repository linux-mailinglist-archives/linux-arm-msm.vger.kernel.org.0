Return-Path: <linux-arm-msm+bounces-117804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ObwAD7bDTmqZTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:40:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527A72A971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:40:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=JBsx2lPo;
	dmarc=pass (policy=quarantine) header.from=proton.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117804-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117804-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4D5B30AA16B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 21:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2ED3C3448;
	Wed,  8 Jul 2026 21:36:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD93F6C5A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 21:36:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546568; cv=none; b=RRnJMBDhSD8TxcIwRGupFlz4MGWjdnhffKQikH0Lm5geJOOqDD1JUJv8AqXayZSjCRsv49bj4vrgm0i5ZmmCXkDcPd1fiHk+DdtYUZO5G+ytwUpZz8baI2pwlZiFmm4q8PQ8dRfdAKnuTAPUMQKru38YuH5vRR56Bf+VGnaDWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546568; c=relaxed/simple;
	bh=uW3KpuuRhONSI4WnwH7ciiMe9KKhWTDUZaNxZJWu9ts=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HU5+m8VhNzcgNebsrDDvpryNSQTIsEoFadRDHklSbk4Gd2+gHmsItPqkIMuIoHT3Uc1mbCrRrMY/d9ZLJPQ+iVdorZPSDdC+V5+oYNGd/gRDEzZK+yoxXShb9l1qGyqN3pNIh2rqdtBzY+EfSvCO0hGPccaJiKo7Ukl9iX+f/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JBsx2lPo; arc=none smtp.client-ip=85.9.206.169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783546555; x=1783805755;
	bh=OaFK8xchxZpdcSqUAlwbyjWiLLlhU4uj9zauzAG6mTM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JBsx2lPoXe0XnnsfV7iz1fLtcAxOvIzUT5rz3EklYgZFTRxMnULH/axoylwiMmuzg
	 XtnV7eewtqFFQHPhsmaNTZlvXu9NQWs7abX7HNm27R7HTphTiq/Rvi71d2F3wtQUpV
	 d8/CIBPtzp42Ec9ZswoC0mLOKZ98GLY6Tong1397mTKCNqqUJxUCQROqG2K/bvZ1jo
	 EJWqCTpvW1fdx43LrFuGkN9gyNKukcIgeo5BZR0nGYygvqyisQySJZdz/8q5+/UbmV
	 Vo5riulTp/uK8YF2/lWlnJSJPlgUQK6t3ni1HldwTZ7TNTmG4Q44EKKI1rH3ZvvSyQ
	 X7gEegdqacWfg==
Date: Wed, 08 Jul 2026 21:35:51 +0000
To: Alex Elder <elder@ieee.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 3/3] net: ipa: Add IPA v5.1 data
Message-ID: <e89985ff-adf2-4014-95c1-27fc32f774dc@proton.me>
In-Reply-To: <b810c574-0f60-4d3d-ad5a-4205a119fe00@ieee.org>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me> <b810c574-0f60-4d3d-ad5a-4205a119fe00@ieee.org>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 7c235c73f6aaaa99f540929f35efc5c8c9a7c78d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117804-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elder@ieee.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codelinaro.org:url,vger.kernel.org:from_smtp,proton.me:from_mime,proton.me:dkim,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9527A72A971

On 7/8/26 4:06 PM, Alex Elder wrote:
> I think the DDR values might be wrong, but it's difficult to be
> sure.  In some cases, in arrays like this in the downstream code,
> if there is no entry found in an array, the *earlier* version
> values should be used.  (Unless someone better informed states
> that this is wrong, I think it's fine as-is.)
>=20
> This information is found in the ipa3_qmb_outstanding[IPA_5_1][]
> array in the downstream code.  However there is no entry for that
> version.  Given that, all zeroes (as you have it) makes sense.
> But it's possible this applies instead:
>=20
>          [IPA_5_0][IPA_QMB_INSTANCE_DDR]         =3D {12, 12, 0},
>          [IPA_5_0][IPA_QMB_INSTANCE_PCIE]        =3D {0, 0, 0},
>=20
> I have no way of knowing; perhaps someone from Qualcomm can
> get confirmation that all zeroes is correct.
>=20
> (Note the order of values presented in the downstream code
> differs from upstream.)

In downstream ipa_utils.c there's a function called ipa3_cfg_qsb() which
is in charge of reading these values from ipa3_qmb_outstanding.
Since these values are not present for IPA v5.1, one would assume
they're not set and that, since this is the first time such behavior is
found, additional changes would need to be made to the IPA driver.
However, looking at this function, which I'll leave as a snippet below
given its shortness:

static void ipa3_cfg_qsb(void)
{
=09u8 hw_type_idx;
=09const struct ipa_qmb_outstanding *qmb_ot;
=09struct ipahal_reg_qsb_max_reads max_reads =3D { 0 };
=09struct ipahal_reg_qsb_max_writes max_writes =3D { 0 };

=09hw_type_idx =3D ipa3_ctx->hw_type_index;

=09/*
=09 * Read the register values before writing to them to ensure
=09 * other values are not overwritten
=09 */
=09ipahal_read_reg_fields(IPA_QSB_MAX_WRITES, &max_writes);
=09ipahal_read_reg_fields(IPA_QSB_MAX_READS, &max_reads);

=09qmb_ot =3D &(ipa3_qmb_outstanding[hw_type_idx][IPA_QMB_INSTANCE_DDR]);
=09max_reads.qmb_0_max_reads =3D qmb_ot->ot_reads;
=09max_writes.qmb_0_max_writes =3D qmb_ot->ot_writes;
=09max_reads.qmb_0_max_read_beats =3D qmb_ot->ot_read_beats;

=09qmb_ot =3D &(ipa3_qmb_outstanding[hw_type_idx][IPA_QMB_INSTANCE_PCIE]);
=09max_reads.qmb_1_max_reads =3D qmb_ot->ot_reads;
=09max_writes.qmb_1_max_writes =3D qmb_ot->ot_writes;

=09ipahal_write_reg_fields(IPA_QSB_MAX_WRITES, &max_writes);
=09ipahal_write_reg_fields(IPA_QSB_MAX_READS, &max_reads);
}

There are no conditions for writing ot_reads, ot_writes and
ot_read_beats, which would correspond to max_reads, max_writes and
max_reads_beats in upstream.
Since hw_type_idx is set to IPA_5_1, this should give a null pointer.
With this info, there are two possibilities:

1. Null pointer dereference, resulting in a kernel oops downstream.
2. qmb_ot is set with all values to 0.

I have never seen a null pointer dereference downstream, so I'm more
inclined to believe option 2 is what's actually happening.
IPA v5.0 also zeroes these values, but I wasn't able to actually confirm
this.
This because in downstream, IPA versions are split into subversions,
which are:

1. Normal IPA (IPA_X_Y)
2. MHI IPA (IPA_X_Y_MHI)
3. APQ IPA (IPA_X_Y_APQ)

Data for IPA v5.0 seems to be of the MHI type, since it's only used in
the SDX65 SoC, which I believe is mostly used in 5G modems.
I realized this while cross-checking since some values didn't really
match, so I had to cross-check with different ipa_data-vX.Y.c files
because of this.

> And although ipa_gsi_ep_config is not defined in this code
> base, here is what it looks like:
>=20
> struct ipa_gsi_ep_config {
>          int ipa_ep_num;
>          int ipa_gsi_chan_num;
>          int ipa_if_tlv;
>          int ipa_if_aos;
>          int ee;
>          enum gsi_prefetch_mode prefetch_mode;
>          uint8_t prefetch_threshold;
> };
>=20
> This might not be current; I'm using code found here:
>    https://git.codelinaro.org/clo/la/kernel/msm-5.15.git

Many thanks for providing the declaration for this struct.

> In the downstream code--confusingly--ipa_gsi_setup_channel()
> doubles the desc_fifo_sz value (for GSI, versus the older BAM
> interface).  So the ring size becomes 4096 bytes, and that
> works out to 256 16-byte GSI TRE entries.  I'm not sure why
> 512 is used for IPA v3.5.1, but it probably just means it's
> bigger than it needs to be.
>=20
> The event_count should be the same as the tre_count.  Again
> I no longer know why that's not the case for IPA v3.5.1.

For the record (since this is off-topic). I tried to get the modem up in
a device whose SoC was using IPA v3.5.1 and I was experimenting weird
behavior, such as IPA crashing the SoC when removing the module or when
it automatically loaded at boot.
The reason I mention this is because a warning similar to "channel 4
limited to 256 TREs" appeared whenever IPA was loaded. That may be the
reason I was experimenting those issues.

>> +static const struct ipa_mem ipa_mem_local_data[] =3D {
>=20
> IPA has local memory that is partitioned as defined by this
> array.  The regions are used by IPA/GSI firmware and/or
> hardware.  The configuration defined here is sent to
> the modem in an ipa_init_modem_driver_req QMI message
> so both the modem and AP have a consistent view of
> how the memory is used.
>=20
> Many memory regions are preceded by 0-2 "canaries", which
> are 32-byte values initialized to IPA_MEM_CANARY_VAL.
>=20
> In the downstream code there is structure ipa3_mem_partition
> that defines these things, and structures of this type are
> defined in "ipa_utils.c".  For IPA v5.1, ipa_5_1_mem_part
> defines them all.  The mapping between downstream and
> upstream is not trivial and direct, but it should be
> obvious how they get translated.
>=20
>=20
> With two exceptions, what I see here looks like you
> correctly transferred everything.  (The two exceptions
> are entries that from what I can tell, should not be
> present.)

[...]

> The next two entries look wrong to me.  Can you explain where
> you got these offsets and sizes?  Is it from "ipa_data-v5.0.c"?
>=20
> Here are the relevant entries I see in ipa_5_1_mem_part
> in the downstream code:
>          .stats_flt_v4_ofst =3D 0,
>          .stats_flt_v4_size =3D 0,
>          .stats_flt_v6_ofst =3D 0,
>          .stats_flt_v6_size =3D 0,
>          .stats_rt_v4_ofst =3D 0,
>          .stats_rt_v4_size =3D 0,
>          .stats_rt_v6_ofst =3D 0,
>          .stats_rt_v6_size =3D 0,
> (Since their size is zero, their entries can be omitted.)
>=20
>> +=09{
>> +=09=09.id=09=09=3D IPA_MEM_AP_V4_FILTER,
>> +=09=09.offset=09=09=3D 0x29b8,
>> +=09=09.size=09=09=3D 0x0188,
>> +=09=09.canary_count=09=3D 2,
>> +=09},
>> +=09{
>> +=09=09.id=09=09=3D IPA_MEM_AP_V6_FILTER,
>> +=09=09.offset=09=09=3D 0x2b40,
>> +=09=09.size=09=09=3D 0x0228,
>> +=09=09.canary_count=09=3D 0,
>> +=09},
>=20
> The remaining entries (below) look good.

While cross-referencing IPA data files upstream, I found these two
regions to be present in data for IPA v5.5, even though they aren't
defined in ipa_5_5_mem_part. At the start I assumed these were correct
since they were present upstream, but I took a closer look at that file
and I believe data for this version was directly added without going
through a proper review process.

The reason why I used IPA v5.5 memory regions in IPA v5.1 is because
their memory partitions are identical.

Now, with this information, I would like to ask whether both of these
memory regions are correct for both IPA v5.1 and v5.5 data files.

>> +/* Memory configuration data for an SoC having IPA v5.1 */
>> +static const struct ipa_mem_data ipa_mem_data =3D {
>> +=09.local_count=09=3D ARRAY_SIZE(ipa_mem_local_data),
>> +=09.local=09=09=3D ipa_mem_local_data,
>> +=09.imem_addr=09=3D 0x146a8000,
>=20
> I think I needed to look up the imem offset value
> in Qualcomm documentation I no longer have access
> to.  Perhaps someone from there could confirm you
> are using the right values here.

After cross-checking I believe this may be the qcom,additional-mapping
property downstream, which specifies the IMEM starting address and size.
I'll leave (2) and (3) for reference.
(2) corresponds to SM8450, while (3) corresponds to SM8475.

>=20
>> +=09.imem_size=09=3D 0x00002000,
>> +=09/*
>> +=09 * While this value is 0xb000 on SM8450 and 0x9000 on SM8475,
>> +=09 * it has been left set to 0x9000 for compatibility with SM8475
>> +=09 */
>=20
> As I said earlier, I'm not completely sure this will still
> work on the SM8450.  Someone should confirm this, and it
> really ought to be tested somehow.

I have clarified this in my previous email (4), so I'll skip this part.

>=20
>> +=09.smem_size=09=3D 0x00009000,
>> +};
>> +
>> +/* Interconnect rates are in 1000 byte/second units */
>> +static const struct ipa_interconnect_data ipa_interconnect_data[] =3D {
>> +=09{
>> +=09=09.name=09=09=09=3D "memory",
>> +=09=09.peak_bandwidth=09=09=3D 1900000,=09/* 1.9 GBps */
>> +=09=09.average_bandwidth=09=3D 590000,=09/* 590 MBps */
>=20
> I no longer recall where to get these bandwidth values
> for the interconnects.  Perhaps someone from Qualcomm
> can find this out/confirm what you have.

This was a tricky part. These seem to come from the qcom,svs2 property
which seems to be mapped to the interconnects specified downstream.
Since the IPA interconnects declared in device trees are different in
both downstream and upstream I had to make some adjustments, such as
using the minimum value between both ipa_to_llcc and llcc_to_ebi1
interconnects.
An example of this can be seen in (5), which corresponds to the SM8350
SoC using IPA v4.9.

Again, thanks for taking the time to properly explain things.

(1) https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/li=
neage-20/qcom/opensource/dataipa/drivers/platform/msm/ipa/ipa_v3/ipa_utils.=
c#L7881
https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/li=
neage-20/qcom/waipio.dtsi#L3404
https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/li=
neage-20/qcom/cape.dtsi#L2723
(4) https://lore.kernel.org/all/3e70d77e-6bec-4e16-ae88-a4f5161f182e@proton=
.me/
(5) https://github.com/LineageOS/android_kernel_motorola_sm7325/blob/lineag=
e-23.2/arch/arm64/boot/dts/vendor/qcom/lahaina.dtsi#L4683

Regards,
Esteban


