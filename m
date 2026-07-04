Return-Path: <linux-arm-msm+bounces-116490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qxaCBE7LSGqLtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:58:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293C7072A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:58:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iurhp0ka;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23D8B300A594
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B8A39D6CA;
	Sat,  4 Jul 2026 08:58:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D003A1E96
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 08:58:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155529; cv=none; b=KvD+lQHPic+kwNfdZqqrPyKlStjIu+mzDDcVGdXW9iGrcMOzUIeQmNEdEKq1Irr8D6yiNHwF4cl4nSCIqfpNcAf+oH9N3Zbxw3dM8sflWw5kzlcTzvGTI7eG5aIErPn+d/tR4lcCUcLdnGrpX6zuQ85J2KII43vPB1neBR3lnlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155529; c=relaxed/simple;
	bh=GO0cPmRaJ+HhoODbOUmJooxCNjwQwnK9RN6Sj23Fxbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEKNq5xGpZqqyxT975JFvYW+xZTR1jQpnasfznJpp+s51GCLGCAOs7UrUPKDTlPMO++LnG6CGKATfP6oZJ4gtQKyOua4kNOffoimxn3yD7D6WRn+b7OFcipUkWo5RyUd7mCTEnp5BRMqjEkvOtsv7LSGIryARRk63xeY4quisBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iurhp0ka; arc=none smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81062fdeaf5so30526357b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155527; x=1783760327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=iurhp0ka4+sQspOkzfmtRxfaXR20joktFvOY3+SR6BFKoQabAEUVIlCKI7D5Pt4uf5
         atZD9ghwssTpRBIwI1xv5QHKZdMbMfSf2Jjn/lq72rADXBUV7G3nsEVYe8kEG2r6pyKv
         TRVS3RuI6Pl5CWouNgycCky0e2lJP+EDtgnWGbgNEcSVKFVVt5lBnmN/1s+l5/WqDWgI
         B5iv/1BSsDtLVnJUOuTahAxiETFOThbYYQn/8jsIUb8pAM72fTSeIOFVzFu5l1oZlh/T
         QfJl6+ymRokEBl1AbF6oK+SI8sfraGtThwIf2MEdEELRMVRuHNw2Rkw/R6Pb1XBK4pfX
         Bhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155527; x=1783760327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=dSIMetIlHs3Rihl24lgFXInlUwu5MzWC1UgI0i8x5AKvPfuu+M7CA6v9Qkhw7eVXNW
         OYaO0DaJM1vNM8Jyqj495n6os6Uw+9knCSK/tI9ouxVL0GhKv9st9kh0boHe/YmjFmxQ
         Ahq2E7SR4UlJ4ePCIzXVj1D90fPIQGe56O+FhX4YOSmzIXJzqmhFCY7ZS3V2nCFCO+2v
         VI6zrgXmPmuyyLrLH/9PAyMuHNG9qpsAuMIRI0uFl7AKgbSrPcUC0QK5t8tkDpBNuGIt
         qQ/G5SSarcmMZu7GfCnPuqvk4TQp/ylNqa24QHULp6oIazmyJKwWdo+VG60d0y6jxVwj
         jULw==
X-Gm-Message-State: AOJu0Yyuken4oWhj+ef5RdsUkM1kNGOE7CXl2QCu0A1/UWTo4iT6T/cn
	1MtFEbQe5wa3JkAJAz4VTLx24lWNqtg+ee+QmroJUhQMEwDR53nLdv0J
X-Gm-Gg: AfdE7cmCCJVCCCymAMgbBpJUZSTpuKWYXhkl0NSKVuYoTk8/wSx6pU1BF5GdixIocRM
	uxjSZk5Wzn4P9rxqAx3kvQmhxXZ15k0+hk8cODRGtugcKHN2WfI7mqyGfFsxeXJf7bf8QktV36o
	EucAOGJc8EgAwhs1ZkWvl5f9gA/Xl7AXCLPWrQPa+guNEUuuy9/OpoQHaajiXBG6+t9In+qpa09
	al1saJOG4/fyiTLkDE6Ncqczf0vmVgjwkiMW91CsCpFi6UkopKWccZacoSoOigE/sz0Tzh3F7Xk
	8FADDTDFMzDM6wZqiYxHjoV/dAQREXPptt2gyo0Kc1f2YZv9QOW7uX9HFesefDIIucflWutwf00
	qd9O/EeQzVcN8TO4vlJYfn4lj5KJL5f8mu+YqBuZqNPaPMLaPHHhN0aDeSV4hoQArvtxc7rqtr3
	Tl5Gqy+gnt5JVOC94=
X-Received: by 2002:a05:690c:6088:b0:80c:9e87:8108 with SMTP id 00721157ae682-817423a4278mr24400637b3.15.1783155527356;
        Sat, 04 Jul 2026 01:58:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b73221dsm33341637b3.39.2026.07.04.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:58:46 -0700 (PDT)
Message-ID: <2dd8c0a0-7443-4d43-972f-979b7ae4b666@gmail.com>
Date: Sat, 4 Jul 2026 11:58:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-116490-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0293C7072A0

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. It must be because this device does not
support USB 3.0 (super-speed).

