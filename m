Return-Path: <linux-arm-msm+bounces-94447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEboDMiOoWkruQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:32:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C81B716D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 720C830451E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B7A30C62B;
	Fri, 27 Feb 2026 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wjCa6sEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D974212B0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195520; cv=none; b=mI0K5C9JsODe7P2NIRz+CCts9glCS652q4eySS/WOWJRLQYxWLyNIEAuiOft91xZlbKHBOWySQ2dhnfjBNH8bnEM0FvF2GMDIcMfSKlLLPOjVRIkpoVBH9wp2vqwmgROMOQut1pJOLST0gSY+UzZpy6j20Y2hFDvS4vQAnPbHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195520; c=relaxed/simple;
	bh=AQoCa8HSU57FVEnyfNGlpLBzlqZ7NfoICy006X5CqEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=maTSp8gAZ4Q4x/Fyt3C+WLT9YicreivjZQRN4fNvLGunGyNI/ECk02dj09ZC6K0UN5kZWZkBoHytNiCxZ5PmhucUvMl1lch5YY7VCmF9uV15L0l44iUFgjUQp/VcU0pXdHv/V00OQkjF2nLhZ4w5azIbQEYZXAcy6h6cvLNN/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wjCa6sEV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65f71ed7c6cso3612172a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772195518; x=1772800318; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLaJkgzjmvXyubyZDm6S8qBRFRZ4imol4EtJej/eQAw=;
        b=wjCa6sEVA0DzJYkZKpYj5zilHglm+TFvsU+UVdt/dRdH4zW2fdjOpI2EojKvxcjyAJ
         GE2wRGtrzVre42HV6UtoibTS6U1pWOjfpKz5jbFO+hdTJsprMFUxzq5CYGpJqhwytoSu
         Y/AzI5P+nY/nd4cB0dlHnlIXcVKwvUybVVwjddRthstmjUHatx1UQPhzZgKSzcD/ZVHM
         S+3TA2y423mtTY87kcU2N+5oXILrmko0eeRjrLUPq9SYkq7ZjfJMo935CEsefjTxK1Ca
         8rZvHFRym1D8i1YUFlhYRItEP9brG+Jn8mpXGJE7nH95jFDFlDSnOxxG8WoWCEw284vc
         P7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195518; x=1772800318;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLaJkgzjmvXyubyZDm6S8qBRFRZ4imol4EtJej/eQAw=;
        b=UFadEno8eJLjqMUz5Ym9EzfkJpMDPpm/PN8sAvhctVXUmd7/lXTLO6YeRbtUQEViTu
         TXiReu73DjsKKNlg6zVohBol7/PmtTFzDDoskdGGwS+I0sRHOL7cUlcQ/MlYLjOL139C
         9QBsguSxdUo3OBpsLpqKhUygdx15zLUmmDlD4QWfAOnlvkZQe9AurQj88fGAPNh3jO6u
         90Nj7Qz7BAR2uoCgPxMHqThnvni3FdiQnUboAfRqWQ8DWDko6OrCfpk8wJl2Q2QzppRl
         Ai3ep/EyzWm7nVtgOWwK2C8hSkeHtMf1n/dlVVlCEv+9YVbnXjouKB/2mIRvR7rebd4F
         +Yiw==
X-Forwarded-Encrypted: i=1; AJvYcCU+oGI7RPRNU7FFSSyzyRWUVdaglvmTGLxhlDfneVQ0eZB1Hcyhg4IU3CGXm9vSwwC9K+7xEvj4juS5EYQt@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvtJsSJXCohjVPPqf2Zk/5XydILOePmRcyaRXfWeh3zNvGvUE
	fotfVz5TQYfCDM7L+BePWeDrFQzFhHWRrJBxRV9f753a5YvkMoPU5WEs8jUOzDEYrvk=
X-Gm-Gg: ATEYQzxS5gAOdNAOC70umi4W6qwfc7vmPjdpqe26FUzvPz0Qx8UFnqh180Y1pp1IOQH
	fH0ykg6e+ftqaLdCFANsIvc0H+g5mhOh8OWdW5nJuZxLaVHlPiH9WuB6PYshi3hD0YLoGcqdeGM
	KFPMgb20TN+85ADROHnPK+v/O62Ar1jJXNZol/iRJIG64LPfFsVisgCneZwEhBcO38/kbnXkt+d
	L4VWZyHdwKQakJ3+Zv7d5roPPYw3jABNRj0JjwEJS0eO/vwyLO8tKbBHAHjvKHLExwZxkcaxalG
	K21MoPnS8bc5V8l9lGpb8me5nwDtCs7VXswyFLZpnVotvxAPJhMCcc5eyIpvGzCzw1VCBbnI9qf
	UduVIcov81GbUCMg8YuLxwxah7lTBNLjCv0iQjcInm1VDcFxH/OUm/aH0YXcgmWu1HlE7m3ChOy
	0rk6unMi+e+phyClaukg9IGiZZdH9vqeU2yU77aKZXbWhxyxmv4rEI/1Al0mmhypD4wLCS
X-Received: by 2002:a17:907:7247:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b937659a34fmr174365466b.54.1772195517688;
        Fri, 27 Feb 2026 04:31:57 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac74adasm142629666b.27.2026.02.27.04.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 04:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:31:56 +0100
Message-Id: <DGPQVOVH3N31.2XHZP30TUC18Q@fairphone.com>
Cc: <conor+dt@kernel.org>, <srini@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <alexey.klimov@linaro.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca.weiss@fairphone.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <vkoul@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
 <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
 <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
In-Reply-To: <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94447-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC4C81B716D
X-Rspamd-Action: no action

On Sun Feb 22, 2026 at 10:09 AM CET, Srinivas Kandagatla wrote:
> On 2/20/26 1:34 PM, Luca Weiss wrote:
>> Hi Srinivas,
>>=20
>> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
>>> Number of input and output ports can be dynamically read from the
>>> controller registers, getting this value from Device Tree is redundant
>>> and potentially lead to bugs.
>>>
>>> Remove the code parsing this property along with marking this as
>>> deprecated in device tree bindings.
>>=20
>> Could you help suggest how to correct kodiak.dtsi?
>>=20
>
> This needs fixing in kodiak.dtsi, for somereason the dtsi is trying to
> add ports that does not clearly reflect the actual hardware.

How should the qcom,ports-* properties be updated to be correct?

I'm seeing the same on Milos, where the hardware registers are +1 from
what downstream describes, in all 4 soundwire controllers there.

swr_rx (reg=3D0x03210000):
    SWRM_COMP_PARAMS din: 1, dout: 6 (=3D7)
    (downstream: rx_swr_master - qcom,swr-num-ports =3D <6>)

swr_tx (reg=3D0x033b0000):
    SWRM_COMP_PARAMS din: 4, dout: 0 (=3D4)
    (downstream va_swr_master - qcom,swr-num-ports =3D <3>)

swr_wsa (reg=3D0x03250000):
    SWRM_COMP_PARAMS din: 3, dout: 6 (=3D9)
    downstream: wsa_swr_master - qcom,swr-num-ports =3D <8>

bt_swr (reg=3D0x031e0000):
    SWRM_COMP_PARAMS din: 5, dout: 4 (=3D9)
    downstream: bt_swr_mstr - qcom,swr-num-ports =3D <8>

Regards
Luca

>
> --srini
>
>> I'm seeing these warnings on QCM6490:
>>=20
>> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch =
with controller (1)
>> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch=
 with controller (6)
>> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch =
with controller (4)


