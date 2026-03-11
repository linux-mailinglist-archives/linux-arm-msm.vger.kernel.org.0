Return-Path: <linux-arm-msm+bounces-97086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J7wER70sWl7HQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:00:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950526B06E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FD783061635
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B8239C005;
	Wed, 11 Mar 2026 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OL9MztPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8439B97B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270009; cv=none; b=chsE/kj+3u5oj0xN+idN9egAw2dYR2uSIv6YpT1y9+nk6pooTQz5mK2VeftgG1KFWBzOs/C+iP+iSiZh6iZHPDAbKObKrdq3Yx1KPNvG/Chpo9Vq2btb2+zMdOa1VwCaOuhg2nFuFxdBTBcIunuJAVR5Cqlp1vSpEn7k0a9klqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270009; c=relaxed/simple;
	bh=s5AopRXpE8NhdcWEB4P5k4k323BPvt9P2y6xxrqlwUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJ7xtU8Jov5Klev3z0nxiMovwwBKf5SNro/lTGgeLc8U0MFvflgL/MNkCne34hx+qL08g42+brvPyF1aF/Ro6VSynoK4MpfLc5MNTEDDDgoRnHOijsKrdVkJ8DgM7gIe/YQjLW8OBFmavFZAxuTSSKOjZtr4Gs/UzjsgmlZW4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OL9MztPI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso4420795e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773270007; x=1773874807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUwcwJen0TL6VZ/9cqC89GRV2b+O9DeXb1am5MEKIGs=;
        b=OL9MztPI27Lbb2PCyEGbBSGc4gbQMIxPbD6gx7YFZkf8HS569sTIK0UpuebVS1R8gv
         XspKYykMp1P7oexRwBGyZzlxYPdD5kmEIEYgiCrGq9oeB/zI7v17FVczfSy+BN0fFe4n
         F3qnKlYEcTM2+cDh+WcUs3piNLikucUIAQLbjwO2HE7TdDgWI9wFWH/aNCXkM2lRjrTE
         ux4o9aiVptYlDQP2tTxtteHM8lNqrbJgWoHr8ga4ZXm/f0tI1qfD2h36AgrnljhB1qGm
         OG5T1qUbWOogWhrAqvxnELI0j7q6dhstbX27NqWigQiUDIwqNAGlcVuht196yyCfpfr+
         UC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270007; x=1773874807;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUwcwJen0TL6VZ/9cqC89GRV2b+O9DeXb1am5MEKIGs=;
        b=Jy5Krzy2cWnRXr0f5PlYU6wR+WrDRF2u4B7NHtNgV7haq3LeXRYaZBSSVX/r4pDqud
         GEb7joYoO0x2Ma6zBcCXPx++8bRvFy8krKGFbOxfGmSXNRn1+Qm82MqK6RnjCmgqmBAM
         PXACovM1WZStKw//Xe07InBerL9a35LNce2AGcRxtF18JhWrf+/EZz1snzrJP4dGAMj0
         qficwiXaNaBTsOWg72qd3Pps5dCknx7t2VfCJ7RnGfrChsVKN4kBmm6e8userdjnv1wQ
         vAKYKKnWpD7y3E934U/xVhX4/F6WO35md/e2Ime/u+IUhJx81f6Yu2IZLaWpbdM2yw2g
         POtA==
X-Forwarded-Encrypted: i=1; AJvYcCVT8iC42iGqN17pMJgNcNMxSPXHUr0RGq+ymanHyNw2dveXIZzk7IYpUYu63nVCVgMWj5Jy0XyY2vAFpp2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+166XGx2QisPwVZ4MEkxCL7KAWUFJWdqubKyovAc7fxNoTZx
	1WPn81KHo+OpFxUzJ6KFQUSyUhNH+d2V77YFINdqPEpE51Bmrp8YTsrylDFzTULxxwM=
X-Gm-Gg: ATEYQzz6afGtr9k0CjC4DvRRyQPDr912BIs0h/BYbGg1GPDy+S+AD37eGdBUzQV8UOR
	yJTTz8kt1NDOX0UzVotendPkLJ41lFBR34OD7DQyEDzH+yrr85nEiAfu4UmKAEUmFMrtFrQEhPo
	IE7jLgOZ2e13/IAxQlhAIMMYutvmDB/KOhW8ZQhYyrx1XCOb2CCpfoSB3qzfEwVEza+P7H5HiEM
	mOgr7EG6uuQ2V4i1x3lCO0+f0eD6F1k7Vh9l235pKEia0LmP3JnfJkPJXumdq0klteikNh7EXQa
	g5w3yZAX/WauoAphA7P0iO47psUTDuLcSXtIwevRSsv0fgio1io+CWuV9JupiKCLaqUit1Cslm9
	tOSItTBV03kCU6gYhB/ZfF1t+rqJD2mFAcM3f1PQUo5D31LiJHm747hOoDGaADJLY91kiJeLfPF
	GzlBDMHNclzSG9AawT9uEyXaiJb5c0iwm7AA==
X-Received: by 2002:a05:600c:6305:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-4854b100b22mr79689175e9.19.1773270006630;
        Wed, 11 Mar 2026 16:00:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm2699459f8f.24.2026.03.11.16.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:00:05 -0700 (PDT)
Message-ID: <89771dba-ffea-4f56-8bec-df54eed441bc@linaro.org>
Date: Wed, 11 Mar 2026 23:00:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] usb: typec: qcom: Add shared USBIN VBUS detection
 via GPIO
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <920ae606-3d7d-4f61-9d11-bd970abc5177@linaro.org>
 <v4m49h-DK1i8hRbJZVhc1GwDH7oBTRgeXg0hIE8chXTULQuFFfSibjXs19m5E4srNt4852h-x_YcxMoPaUjzPqmwYHI8-tRc2-X2DaIKI-A=@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <v4m49h-DK1i8hRbJZVhc1GwDH7oBTRgeXg0hIE8chXTULQuFFfSibjXs19m5E4srNt4852h-x_YcxMoPaUjzPqmwYHI8-tRc2-X2DaIKI-A=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5950526B06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/03/2026 17:37, Alexander Koskovich wrote:
> For the bottom port there's an independent boost converter

Ahh..

OK for some reason I read your mail and thought that the PM8150b was 
sourcing VBUS for both ports, after realising you had a RT1715 aka 
reading your cover letter again.

So much for my research on how to make that esoteric setup work.

---
bod

