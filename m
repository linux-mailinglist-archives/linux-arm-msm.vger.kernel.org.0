Return-Path: <linux-arm-msm+bounces-92579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIpPL1ovjGnPiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 08:27:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B224121DCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 08:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8FC301C8B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7C32E141;
	Wed, 11 Feb 2026 07:27:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899732860E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770794839; cv=none; b=CZGJ+BKfXKJfmvXwzuqM+Zxq88Wts9CTrPrjkIr61HmxQYwdsLT+hUcfbZKH6HPyvQbj+z724V6S9d7Hoqy402upefwcH8ysa3/MMRnHaNWBBrrU76w8YX1wLKSY6PqyWGFflZCRWTR1m8JkUeeL1AP89KI+jkgxfdMXItHmcoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770794839; c=relaxed/simple;
	bh=KHE4U5tIbOhomUd4pcaSSa9ItTiMhppFcZLSMDUeblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/3tTnxrKrwd3RUObbu2Ws4xj8NoMNpCAUeg1dbTTr3lHtVB2Ut9uqJvZ8+92dTL2qjJ5cwi00n5gF732i4rkWDhOTKEDvCqrKhVU6qRrb9SegGDCc7Z5yT8neXZ59wNBB0eruh1lt6snPzmUTOmDS2hdMHdaNJ7WavlIqhtOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-793fdbb8d3aso64000577b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 23:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794837; x=1771399637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHE4U5tIbOhomUd4pcaSSa9ItTiMhppFcZLSMDUeblE=;
        b=Cyfh54Iw8ibTbFndhWkQdaWcrpqZWi/ODSueFtY+lPukqnX3ZkIpksh3Czc5v2/hGo
         yeup87ijdQzD+qiavbhV16+/KoZGuMNgSqT3S3jMa23G0+WYw33kJ3YOip92IUQqt7tO
         NCx8xI9agiLvUa9yBH8IJKo1mQ1Cni30NldD+XM+/PX/QBgNjt6+e6zYrgOTZ0+TKXiR
         Eoqzafm82O9uJwlo4FYin83XJg0H4XhqdeKAm9CljQWddQULflT+FpRgNXMAKSTQQlDz
         yZ5EDwARtLGil+2Gqg9l0GkJS3QAWzPGclNIlyamDmBo2gzXfRJ7cyw7MI3YDkswc1gT
         xswA==
X-Forwarded-Encrypted: i=1; AJvYcCUWdUQ6as+TsVje7tlFHsPSS9XQDHSxZ67zJcJ9oWebGpfRgrkh+AbnM/Yp38dp2jo58nRSFBZT+h4Y9Beh@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIQIbLEo4eGkMGfSMgzf4rtBSbvn2c7OxMTU9o5om/oOHNYDD
	G41/g7ZKvKMuvZn9zk9mH7BkxGPC8mQDxI8K7Tny5Y/fcuDOIAO44T3DBjBaug==
X-Gm-Gg: AZuq6aKweeSvlM/lSwIAN8UKckOGSAZ+Cmy636DaDDVpDnpWMq3teXcX6M+69jbust8
	3+FKMfQNmuNgGI2PAYhg6NGt2r5UtMYvqTEJPoFebkvg/V4oDzipYs8qi56OK3/UTZ5+T2pOhs4
	/z0N1zzwZqUK1ECzJhTi+4rHPlSzZt1/BHJu68b7S9Wtv+cE1MtlQ2DTJzhno2fdKRiGcMqkJux
	dG6hESCXLQI/qF+52L/IZUI3Q2gC3gLYtyWg3EHUyaxCQtqWM+kstzhCsf4FOpv5QRhXnGlLKB/
	fxjaeLGGp3B1MNE7I4rnumhrRCNMiAEjUXsiFKayr7+QlKdJPZ+MkTmsZrs5hPyfsR/37+KfGoW
	Lx6P4Hgh1Cx1BOdqgacujq74f3Me/hkFJOj2VtJsZrzEcBjJi1yuRFbVut3Hx3chmIH/LhQWGBq
	mUzE964iqvViIoOps+KMwaKGuedNUYEQH5iIkT+iDDLRt5he4GEdeG+A==
X-Received: by 2002:a05:690c:3392:b0:796:3d5f:a2aa with SMTP id 00721157ae682-7966c129849mr9632407b3.70.1770794837485;
        Tue, 10 Feb 2026 23:27:17 -0800 (PST)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com. [74.125.224.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16e7c6sm9299667b3.1.2026.02.10.23.27.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 23:27:17 -0800 (PST)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad9fabd08so3538766d50.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 23:27:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWgsWmeME3etqChr9lMT4rPbEfI19Any+XnJp3bt5mu+Rp11QimOGes6drSzp/0H65g0Sv0s6IXr70jILY@vger.kernel.org
X-Received: by 2002:a05:690e:1482:b0:649:6658:ea91 with SMTP id
 956f58d0204a3-64afe1d117bmr595603d50.0.1770794836703; Tue, 10 Feb 2026
 23:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org> <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
 <b1d791e3-849e-4d76-bda0-816418f98e39@oss.qualcomm.com> <CAEQ9gEkA-Gw=96LJe3vf3S6ada5o-mDqjY9B6NNpSaO8saSfvg@mail.gmail.com>
 <24cfbe35-c611-4d52-8a4c-b437287717f0@oss.qualcomm.com>
In-Reply-To: <24cfbe35-c611-4d52-8a4c-b437287717f0@oss.qualcomm.com>
From: Roger Shimizu <rosh@debian.org>
Date: Tue, 10 Feb 2026 23:27:05 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=p_94p5Rnn===2qMq9MNUePbGaRgJkbkoLXg6X5oywvA@mail.gmail.com>
X-Gm-Features: AZwV_QhU33G1QluEBOzcZbh-AGbKrmtJBKZMO2j9SdGVc4Ffm4zjx-bk6wU0LpY
Message-ID: <CAEQ9gE=p_94p5Rnn===2qMq9MNUePbGaRgJkbkoLXg6X5oywvA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92579-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B224121DCF
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 12:31=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> It may be that your version of pydtschema is wildly out of date.
>
> Nowadays the general expectation for using bleeding-edge python
> tools seems to be for one to grab them via pipx

Thanks for the info!
Sorry I forgot to mention that I spent some time last weekend, and
resolved the issue in Debian [1]. (patch was enclosed in the ticket)
I prefer to use deb pkg, over pip install.

Now I'm using locally built dt-schema deb pkg (updated to latest tag
2025.12), and and run "make dt_binding_check" successfully.

[1] https://bugs.debian.org/1127460

-Roger

