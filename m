Return-Path: <linux-arm-msm+bounces-92992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LtTJww3k2mV2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:26:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44111145847
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B247300B1B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3DC328B40;
	Mon, 16 Feb 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOVNsyRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791033164C2;
	Mon, 16 Feb 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255556; cv=none; b=oJ2kL6U76h8jE2+gebnged2W79RT3MqOSo088/EioVGHjI0dojMgvqyIxNtqc+QetyPXbgLohWVQdd4aXLaiztvztxRkKt8n1k3h8ySKe4NWjZkGaDc7ss3FFp219uGcrOuxq7uKCaJHf459N9sEaEERliirqY1qEZf+kAa0rBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255556; c=relaxed/simple;
	bh=vDRtpAkL1bnKQgVXh7lQ/WNyK2vOaJ7GqBnIwfLExZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDqu5BKTASL2QgUW79wqE2vOdr8gy6iSS7yfLFv9ougBLEwpFRk//owuZlDgfAkEEl06gQA5JR89K/L7IlYNmeHB5Lu4mMI1i4yG1Z+aQHl3/sJW+1UkEgQ0AqkIgRm1lR2AhNuN7FqDqa80jnK3FnF2zpAd7geXpjwAubAvKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOVNsyRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1B7C116C6;
	Mon, 16 Feb 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255556;
	bh=vDRtpAkL1bnKQgVXh7lQ/WNyK2vOaJ7GqBnIwfLExZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOVNsyRqJvlzFkG//5rB0ckYaEEUnPwm/t7YDyB3POV6NQTluEW4+iPIY7fXEFYvI
	 l8gqFXae2lMHa/PIlGOHNxNQdlcBdyBjs4xOX/tkoNRwpBucuhIh9U2TDXCgZtC7yU
	 Uooq4Wh7GbucBpvboGWR9BPGV5V1yWX6Qzx0ov94SaGcTs87TfwOKpFnpymwX8fifx
	 SjSVCXs0iZ5/zZ3BY2nKmH/gSOaAfhLvedBkd0fFFp3D0wtXrTHYEvtBp6CUwkhD4O
	 IKFL4v77u6nzP72AY3DFsgT/CH/i5KeCd8Ut23A8l6rggkw+j7+Z2Q+W6i69xIVlEq
	 5bbOS9QglDO5A==
Date: Mon, 16 Feb 2026 09:25:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92992-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,urldefense.com:url,ixit.cz:email]
X-Rspamd-Queue-Id: 44111145847
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:58:35AM +0100, Alexander Wilhelm wrote:
> On Sat, Feb 14, 2026 at 03:16:55PM -0600, Bjorn Andersson wrote:
> > When encoding QMI messages, the "source buffer" is a C-struct in the
> > host memory, so while the data that goes into the outgoing buffer should
> > be converted to little endian, the length should not be.
> > 
> > Commit 'fe099c387e06 ("soc: qcom: preserve CPU endianness for
> > QMI_DATA_LEN")' fixed this, but did it by copying a whole word from the
> > source into a local u32 and then operated on that.
> > 
> > If the length in the DATA_LEN refers to either a char or short array,
> > it's reasonable to expect that the struct is packed such that this word
> > will contain not only the length-byte (or length-short), but also the
> > beginning of the payload.
> > 
> > As the encoder loops around to encode the payload it runs into an
> > unreasonable value of "data_len_value" and bails, with the error message
> > "qmi_encode: Invalid data length".
> > 
> > Rather then complicating the logic with local variables of different
> > types we can instead pick the u8 or u16 "data_len_value" directly from
> > "buf_src". As "buf_src" refers to a typical C-structure in the client
> > drivers, we expect this field to be naturally aligned.
> > 
> > We can then return to the original expression of qmi_encode_basic_elem()
> > encoding directly from "src_buf" to "dst_buf", with the endianness
> > conversion, based on the size of the type.
> > 
> > Reported-by: David Heidelberg <david@ixit.cz>
> > Closes: https://urldefense.com/v3/__https://lore.kernel.org/all/dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz/__;!!I9LPvj3b!BCfk4-YtwbkEy3mc_UUojT1xCH5BW5COilqBek1tBnJyWzp2eK716Cj0C_35FQwo8__BS8qk_PK5oJs9i719BCjcA-rnMg3YY71aTHHs$ 
> > Fixes: fe099c387e06 ("soc: qcom: preserve CPU endianness for QMI_DATA_LEN")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/qmi_encdec.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> > index 28ce6f130b6ac355820bb295c8c96f9c6a6e385f..45bb26d010da77ab8d481897026b718c2290bad7 100644
> > --- a/drivers/soc/qcom/qmi_encdec.c
> > +++ b/drivers/soc/qcom/qmi_encdec.c
> > @@ -368,8 +368,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  	const void *buf_src;
> >  	int encode_tlv = 0;
> >  	int rc;
> > -	u8 val8;
> > -	u16 val16;
> >  
> >  	if (!ei_array)
> >  		return 0;
> > @@ -406,7 +404,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  			break;
> >  
> >  		case QMI_DATA_LEN:
> > -			memcpy(&data_len_value, buf_src, sizeof(u32));
> 
> Hi Bjorn,
> 
> unfortunatelly, this change breaks the `ath11k`, and most likely `ath12k`,
> execution on big-endian platforms:
> 
>     ath11k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath11k_pci 0001:01:00.0: MSI vectors: 1
>     ath11k_pci 0001:01:00.0: qcn9074 hw1.0
>     ath11k_pci 0001:01:00.0: FW memory mode: 0
>     ath11k_pci 0002:01:00.0: BAR 0: assigned [mem 0xc10000000-0xc101fffff 64bit]
>     ath11k_pci 0002:01:00.0: MSI vectors: 1
>     ath11k_pci 0002:01:00.0: qcn9074 hw1.0
>     ath11k_pci 0002:01:00.0: FW memory mode: 0
>     ath11k_pci 0001:01:00.0: invalid memory segment length: 83886080
>     ath11k_pci 0001:01:00.0: invalid memory segment length: 419430400
>     ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 0
>     ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
>     ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 48
>     ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
>     ath11k_pci 0002:01:00.0: invalid memory segment length: 83886080
>     ath11k_pci 0002:01:00.0: invalid memory segment length: 419430400
>     ath11k_pci 0002:01:00.0: qmi respond memory request failed: 1 0
>     ath11k_pci 0002:01:00.0: qmi failed to respond fw mem req: -22 
> 
> I tried to analyze the regression I introduced and I think I now understand
> what went wrong. Previously, the code looked like the this:
> 
>     memcpy(&data_len_value, buf_src, temp_ei->elem_size);

Above log indicates that we have a problem on the decode-side. This
patch 1, changes the encoder side only. But we might have the same bug
in both cases(?)...

> 
> However, this never worked correctly on big‑endian systems. `buf_src` is a
> `void *`, but `ath11k` and `ath12k` always store the data as `u32`.

This I think is the actual bug.

Based on the "invalid memory segment length" error, I can see we're
talking about struct qmi_wlanfw_request_mem_ind_msg_v01.

This defined mem_seg_len as an u32, 

But qmi_wlanfw_request_mem_ind_msg_v01_ei[] tells us that it's an u8
(elem_size = 1).

> Assume
> the element value is `0xABCD` with an elem_size of 2, that is, the
> `sizeof(u16)`. The memory layout on the driver side then looks like this (X
> marks unused bytes):
> 
>     +---------------+----+----+----+----+
>     | Little Endian | XX | XX | AB | CD |
>     +---------------+----+----+----+----+
>     | Big Endian    | CD | AB | XX | XX |
>     +---------------+----+----+----+----+
> 
> When `buf_src` is treated as an array of `u32` and then “reinterpreted” as
> an array of `u8`, only the first 2 bytes of the `u32` are copied, which, on
> big‑endian, no longer contain the actual data. After the copy,
> `data_len_value` contains the following data:
> 
>     +---------------+----+----+----+----+
>     | Little Endian | XX | XX | AB | CD |
>     +---------------+----+----+----+----+
>     | Big Endian    | XX | XX | XX | XX |
>     +---------------+----+----+----+----+
> 
> So the original value `0xABCD` never gets copied at all on big‑endian
> systems. This is why a simple pointer cast cannot work reliably on
> big‑endian architectures. I did the following change:
> 

You're analysis is correct!

An incoming 0xcd will be written as 0xcd000000 in the 32-bit
mem_seg_len. This is confirmed by your log, which actually are the
values 5 and 25.

Looking further, I see that qmi_wlanfw_host_cap_req_msg_v01_ei[]
contains "gpios_len", which is declared as sizeof(u8), but gpios_len is
u32. So the ath11k driver has the same problem on the encode side.

In contrast, you can see struct ssctl_subsys_event_req which defines
subsys_name_len as u8 and ssctl_subsys_event_req_ei[0] specified
elem_size of sizeof(uint8_t) - which is the source of the bug that David
reported.

>     memcpy(&data_len_value, buf_src, sizeof(u32));
> 
> My attempt was to always copy the full `u32` value , but it seems that the
> modem on the "Pixel 3" does not actually use a `u32` there, but rather an
> array or a packed structure. I’ve CC’ed Jeff and the `ath11k/ath12k`
> mailing list as well. Hopefully we can find a solution that works across
> both endianness architectures.
> 

This isn't just the modem on Pixel 3, that message is sent on a wide
variety of Qualcomm SoCs.

> >  			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
> >  					sizeof(u8) : sizeof(u16);
> >  			/* Check to avoid out of range buffer access */
> > @@ -416,19 +413,16 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  				       __func__);
> >  				return -ETOOSMALL;
> >  			}
> > -			if (data_len_sz == sizeof(u8)) {
> > -				val8 = data_len_value;
> > -				rc = qmi_encode_basic_elem(buf_dst, &val8,
> > -							   1, data_len_sz);
> > -				if (rc < 0)
> > -					return rc;
> > -			} else {
> > -				val16 = data_len_value;
> > -				rc = qmi_encode_basic_elem(buf_dst, &val16,
> > -							   1, data_len_sz);
> > -				if (rc < 0)
> > -					return rc;
> > -			}
> > +
> > +			if (data_len_sz == sizeof(u8))
> > +				data_len_value = *(u8 *)buf_src;
> > +			else
> > +				data_len_value = *(u16 *)buf_src;
> > +
> > +			rc = qmi_encode_basic_elem(buf_dst, buf_src, 1, data_len_sz);
> 
> Here is the problem again: `buf_src` is once more being cast either to a
> `u8 *` or a `u16 *`. This does not cause issues on little‑endian systems,
> but it corrupts the data on big‑endian platforms.
> 

Correct, but prior to 3ced38da5f7d ("soc: qcom: QMI encoding/decoding
for big endian") only temp_ei->elem_size bytes of buf_src was
considered. I.e. for a elem_size of 1, only the byte pointed to by
buf_src was considered to be the length - and this happens to be the
same thing with little endian.

And as the commit message of this patch states, if we change this to
always read 32-bits from the length we're likely reading "garbage"
beyond the u8 or u16 length member.


It might very well be that the underlying bug is my expectation that
elem_size should be reflected in the struct and not only in the encoded
message, and hence what I wrote in https://github.com/linux-msm/qmic.
Perhaps the length-specifier of an array should always be u32?

@Chris, what does the downstream generator produce here?

Regards,
Bjorn

> 
> Best regards
> Alexander Wilhelm

