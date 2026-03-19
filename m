Return-Path: <linux-arm-msm+bounces-98806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JAKIw46vGl3uwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:01:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2852D0752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5126B3071F43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C96A3F1659;
	Thu, 19 Mar 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDRwsKEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1282FD673
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 17:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942515; cv=pass; b=ZUMcWp4SQsnN+941q4McLM3IwV7w1fNgfgeQCl7BYFCb2BKhw8mLxNKfpQx7M0SSsoNynRZY+Ybflzz2OQZYsNapT+Zz/JkgmUhEFIvLDPcCdUvDWUhWPfa1VPVnI4CKr4hGSR1C76vvo9uq8bpBPZ4mBCBzdfAWqlczTnYa3zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942515; c=relaxed/simple;
	bh=WrDhgfFwGfVHHj1HMTtxgwEW21+qVX7MC2QJe31H68Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoHZTu087NzH5LXpT+vkoNcD7b9jxmR3hoS9ifza/zTTm6mB2FkTBfurhENYtUSIILDcWhCCCD6/t2u8qB9QIFyssWzo30iGQ2fJ3Skac3dryVGrMb5zjIr3TOapyRPY5a51Fmi5bt9z3cwRwPnnWcBM6ZrS47C5icBvJ+4AMPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDRwsKEM; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a27c329e98so1780902e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773942508; cv=none;
        d=google.com; s=arc-20240605;
        b=NaACi0CVpdN1n2MKifskKhWn0AiswlNlDO9FfMu747/XINlpRkYO748SPs0bPFDGVT
         KEJZ71VzbAqjQpkhXTfi5+/79bnmpzY6tTjduI/vLT/DhVe5yZFi++9KsJi9t2Wc1qIK
         yTvJU1xw9prg8SW8/bi+7yz4VmeyICqJCrHlWO5VnKAHM2Ep9cL4QSpEY62CsaxMg8Nn
         p1H6rSkK1/l8bmNPoSa9CWyckEits1JcLvWNicjwYkNfz14YAb1Zskj360yV+xlQFRmc
         JzbIbZk2fbqrThA6L3ik/zPV0psJPRRlorC0DmMOStiF84jDkPYGCzpfZGHXYDq3sb+1
         UnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hG82PI/sd6f19ho1TLWOeLNBvYrL7242Yv2902nK2LQ=;
        fh=Un20DLoojhPO5BY062vozYyBFD/iyvYyoB76FZ95jcc=;
        b=QDCeXUb6g+3W2VHZZDQ4Dt3JBdBvcJY1eez3hSPLDKutt94A0TSQ7cEMmaiZVOkBIg
         APYBD0i+t8tLT9yQZl0lDIj9Nrr4ghCUVGsxIy79eymsWgxUvJ27WCOAVojkrLZm9bCS
         QAjBRG3StLNFUvyMnVm3enTH/0rD57VwiKobfHq8a60t46pg9T8sJLl9Kwo+RorKDTa9
         o8CKm1zSr/BYgoSkvRnG6X4mIrdK+z1cMqlPbz9+B5K9yogqlsNRF3b4U7VvXqzHSQLY
         1rRAkIk73yLpQ02yOgxZ1ReeGMGntKwhj1b3dtunYsZqX5Mw3wof9gGpuB4TL4D2A3xL
         K3dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773942508; x=1774547308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG82PI/sd6f19ho1TLWOeLNBvYrL7242Yv2902nK2LQ=;
        b=IDRwsKEMmtotCDdq4vJMKaPaUreXcqUSBb+098O2p7OsNRDkP9FOXJUzqh2yRe5hzU
         w7ruvKVjEZIQMgDzP0q0RMrGT847dhFXQiot1LFSc3AwWk7R2ONHKjlC+cE2mhocvOH1
         OOVzn/I565JjOIbf/t/5TbOygkksiiWzR2bvGLgtmnCvGGKAbC6ze0RPPcRRuIPkvLcT
         CBSF9/GokGT4JXO4fiOdRnTXbaXjeTYPL2Grvmb52SfYqM4crO6B/CTSc/RubjSMvAUr
         bvoIOenJjwpcrlX+fG93GDcXWnzIpzQWnSk1YjwrU9gYDd0XdCJL9i16Xi7ffLzBl47F
         RkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773942508; x=1774547308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hG82PI/sd6f19ho1TLWOeLNBvYrL7242Yv2902nK2LQ=;
        b=ihGAnsTFYZD8kDgwxCZcaGTg119zz3dEh8p4Vimj0mylPpxT4rUtgzz9ulytdQi5j3
         E/2j1EmkbMgFVgFaJtHWeciW2LvbykayBqvQWQoUgftnwVw/tlwFW9Mpp6VPeeS3CSpE
         GPDHgQjqqizodGZJhexE4mahpwV+EWEzDjvzyS8rZJMWwutwqc8AJfdV4hcL53eC/2Af
         ZGun5j2CWGjwDYgx1phVD1s/BjlSx6Vl0cXN3y6zqJWJMFNNH9MG7cqm58d/htvmApBU
         Fm07Y65xzQo0ge7Wtn/DoD9pGXv8Y21px+Pvd07r2/k8f4Wmj5dXzIwErw4ez6d4j85v
         OtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/bmtMC7sP4TDZZhxRq+OHjd5mQ3DixV5OJUBg44rhOKj1AZMhbemqZq9QTPUk5HI5VHmv0OpDKE/mxhat@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTZSorE2xGEThxSrof9g0Ldb2ht5nTXb3e6Qvaui7taeOkrxU
	1WbXHLT8dYSZ4rgbStjR769vl8NNsJlVkBPeFxOaLc+QmCVa9tf/TMtI5ft8r+DudSQQHgQet2A
	Mee8zA6EJKMTNhmG4UVPD4H8wocb0iGK8Kg==
X-Gm-Gg: ATEYQzy3++99+TPxUwYzZ0/JoojsWmCGLw191n9V6RHzzDpinXRk2uMpPPGWSzL2Loc
	npWRLSAKM/xydLfPZmb2oYrAHzQTrx8GrLVWKljJLgi3Ub3moHh7jTToMd6nYHiE5YWJBK5UyCm
	QVq4XU/C9thkMQBiHaH2lODKZpIQVe0oQw4xpjaa9a9KKO3mGyYnm5+J3dgP1p8Tp1eaJynBZWo
	k6frmjPAvCTadktDtbW+Hg+4o9PomDycJBON99NehgZnDtQMCunvRfToiw9f+IHPvSfv02DEKMD
	hTHHFYOirHuP4JnbMGfuwgCMoubbATKnj10WvmXREoAAyLEhsOeg98xupHbBvPDRON+2
X-Received: by 2002:ac2:4303:0:b0:5a1:3f54:b3db with SMTP id
 2adb3069b0e04-5a27958551emr2698841e87.8.1773942508108; Thu, 19 Mar 2026
 10:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com> <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
In-Reply-To: <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 19 Mar 2026 12:48:16 -0500
X-Gm-Features: AaiRm50o3rn2ghnk5mErj8pByoXlp43M_qTNlsb4C9m6TK0MVPM6M1ialjJ0WoU
Message-ID: <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98806-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[teguh.sobir.in:query timed out];
	NEURAL_HAM(-0.00)[-0.869];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sobir.in:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 3C2852D0752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 6:32=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > The AYN Thor is a high-performance Android-based handheld gaming consol=
e
> > powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> > AMOLED touchscreens.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +&spk_amp_r {
> > +     firmware-name =3D "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";
>
> That's perhaps a dumb question, but are they actually different between
> the devices?

To my consternation, yes they are all different. Most of them are even
different file sizes, it's not just header or signature differences. I
am assuming they contain tuning differences per device, but I really
don't know much about what they're doing.

Aaron

