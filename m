Return-Path: <linux-arm-msm+bounces-95106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNNCAmy6pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:39:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2F1ECCF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B37B6304AD32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844BB386C2C;
	Tue,  3 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HopRlnmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F6386437
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534340; cv=none; b=eR7V5mRk2jxyWxCEhNJe1JGhJbDbylpBZWhfgz05j1nmGia1ERXYbS5nDXa9z+ETiF0l4zkj1tbZSjfWh+Hw6iXxfjoJO5HZrkOTL2UzTIspw9tN6ZkYuzF+GEsSlnApKVHIJtHWdWr3KVApK1zw03GtyuDc2exNvx+0zRwtOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534340; c=relaxed/simple;
	bh=Xhw0Xz/0Ox1gpbJ4gKGz6yQieQDrmSq8KYg90eBej54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggkphYgR4I5fWfxisY723rbyWkwNpMMKpxVApWpd1mnuinUoxUsBzpv5BG+lt5puB1xt4I2e6qaHRr7NjuaF0e3Rw6tMRS9M3dLzOdUYIDfHCn2USAgcvLM3Qjd3PzMRLLWfro1O0GZZg+tUdlghpzx3Ckx0250q3Al22dvfzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HopRlnmb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so2089124f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772534337; x=1773139137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=HopRlnmb6nM0zXzz5Bt3pWK3UFzkM1wto0nwlKqt+xig6Rid8pIU8X2NglC+Vv8TXu
         EIdxanUwHGC4VQTY7cLd1M+iKSthIzKBKjkVfKZj1isABxAd2uowp4cz4Y1At2wT3RWw
         rFNCYWkw/Vj/jJ5HY8JCfYyynbK5/6CRGgqJRwexeVYPHrnMMAgj6/sLb8l5ndvsXiAR
         vEfY3Y48Nzms7JRRhmTZWQc6I42ZFLlUc8gprgMGaHV4l3v29MpcTY2tSvCT0ATR8isk
         m0XphBSbgSsw4a1CFxGIEYaOFjH46EGe8myTvS9I6WlCo+OduSgtQ8OYPlqUOzrCMrWF
         XvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534337; x=1773139137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=cBwLlz19Xxve0P/CURv897nKzGA5BCsbnqQqKkOsf83xwJkPKWvFZ5te1mARGof7oV
         gtW9sMJN2YEqVJrR2iJ7voMj9jw8cr5PsOG6sOTpJp9E12WkN+JxnfoGA5SSr7HFSq+1
         aA/8kTKiEX13ylHSEM6WJQB61H13BdOpEqgx73guyRt7MaE7jMzpfRGEs+q/Q4ybMhz5
         uqnHSVvrEpeRM0ZNq9o+sGNVvCecYx3Xlb8BffTBKUk6/aYeXZcHxZyZ7WwiGe1p/gkO
         M+jGzAQC1zqQBzXTtqtNftPcIG5u6/YHKYPjsXw5IrWZKteiC0s+5xVOOgrbCsL4jaDC
         DeGw==
X-Forwarded-Encrypted: i=1; AJvYcCVBGu5FNazaY6uiBmI1PnogUtoOe8QXkeyQaa7nid373/pkY85WFs86GC4utUnbtf9hY8ED6ErCW+t1f30B@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOwOYyanW+RkicmLTx8YRPpjtnfjHzSu/GS2XoWEnMuUjAx1e
	Isb0JYaMhQUsbSwnGmddqUmWPgee3VbXWvz3usyUOVhTXBUShr+Qp4PhogMh7dpqUfI=
X-Gm-Gg: ATEYQzygTtUN+xeBeL/P4oztnfRJt3oUaheQu4YpAkLk8iK49EmTt4ZXtlv6zTXzS4j
	1BYtHulX9KnhhNWPsPTwgH6nqrRzss92LBuFFa41oFoBE7+wM0z2FUqpbNVgb4kPw59VUcEtZT/
	MVl4etrhS0k54PESGNMYbBrIZT4hcnO17EVnhYbEBhMQDQxWycrsq9SrGNyhcdCkljPpl0ZEjna
	fm+SAXHSvaYk5PZ9sLKzqFt8t7noXRUd/XsWMVuI9sXmWXLR7yHIE8XGTryUn0m0zg+0FU3tCrR
	ICK0pAU/pniazAPPtr8saenhB+rU4czLpMzij2HP3h7TX489zjRHGFup/hdVlf+y7rDQZwqOCmr
	V4F4Kz7IolmCc7mIxtuNq3heDMcvtOF0tyNaNoJ+F+SwbzUeyVlhi+gHwwvV5IIvPzmfe8NsJ+P
	LIBr7tIaRn7fQ1lOpkgvtn+XtAkr1vR355BI4+1QudOUdBiuu03M5Vh7DM6bai+YTM
X-Received: by 2002:a05:6000:25c1:b0:439:905e:1236 with SMTP id ffacd0b85a97d-4399de0b748mr28113369f8f.2.1772534337547;
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm17020410f8f.12.2026.03.03.02.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Message-ID: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Date: Tue, 3 Mar 2026 10:39:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4DD2F1ECCF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95106-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 03/03/2026 10:22, Konrad Dybcio wrote:
>>> Squash down and Co-developed-by
> Suggested-by, perhaps
> 
> Co-developed-by usually reflects pair programming and requires a s-o-b,
> and that carries legal meaning.

Hmm yes but this is his change so he owns his own Co-developed-by and 
his on S-o-b ;)

---
bod

