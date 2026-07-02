Return-Path: <linux-arm-msm+bounces-115819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FIAMDWTxRWrxGwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:04:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F86F3815
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:04:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=snWr05SU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115819-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115819-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C8823036CF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 05:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28D43630B3;
	Thu,  2 Jul 2026 05:04:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188525A359
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 05:04:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968666; cv=none; b=lqR5PY3RmnOco+7xKxlFUCg4ykb8MvL/PIPt1IXq1yEpi8qGCujOT8OkbeXQonxy7FD8l+p42PkmX2ZNZ9EfyhE+FUVWA4nR6MjT3fxxALMOwJ0Gl5jUP562a6xZYV/5TL0llXm78EX/SqR9Erzg4u4erj0JqjZBiby4YB0ekhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968666; c=relaxed/simple;
	bh=KY8isj8qnfFeVbnhDgajn0TKgbt63r5onHjMkJEDVBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2/CxmoNLrSDyCaQs9gCq3KmBXSL1ekBkk6HOHR1nRQdt+65qoVz8KHd/3tyLKY+wIjfEkkolGd32VDJIPTL6ygLM7L5cdZx7DTgY0UAmiAI5gL8doJMHQfEnvBxW+mSa1F3FIvct9Jw88YnT2bgsZC48XhUn5tTkF7Y0X7APxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snWr05SU; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37d70036426so860541a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782968664; x=1783573464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Oy0cfahmYAXjNqu8zns/MhJDGK3lg7nw8uo1AFuaGQ=;
        b=snWr05SUa29AgH5E2w3tvi2Q0PLnBP04IEEhVsVBUrbGf3cBT84L0lQXqzBu+g+BI9
         LNxJVjsnrz/fpi3dg3X2twVaZyxrkkA17a+8BicPLJ7yfG8rg9RFTyY9Achz+Z5KtJ5m
         mDLXB/YrRlkTYo0DsoEbLGDB5MM17s80Hs/JxGDJ3D4i5Lv4HBBPzL3jS8KFPcD635n/
         UJXriLSDYTwDwQz9h3pu7tIaPTvmjbOJI6BBGS3Upo84oi21H771GYbYrBimXG2gejvE
         MBoZBTVIFkNb628aPEwmbQZmo2gD09oz4qov+6YEQyHzOFTEFi8c4KO0/g4MbBKArkcp
         PUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968664; x=1783573464;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Oy0cfahmYAXjNqu8zns/MhJDGK3lg7nw8uo1AFuaGQ=;
        b=qMdjKUs0ckm0VrZ7sFdv2QsOFjStjbZVUaQrsdet+8xh6fzBJs7lV26TPhwI7fdd1E
         NAQrkjcF/K2muL4l9WDhrGQUy57aeS71PB/PK5++1P/d/1w20AiuyYsgnM9pypfgdF3h
         cNuSWqm92XZ+HYum3/oWIFuRMgiCuIEVoik/93MDjoN53o/X/ICf5zabcGaWIs6O/YQt
         Otg/GxQ9bkZMw1gUJlxmEFgBxTrZGwyKcvXl3KsCkpxRe7TAERaKZ8JQNV+GOzOQCkug
         +e6WHLeLZFA4h9Xl3bLm1t8XdTU+fEzhkBcSd4OSc7l6FbZxyBTPDeHBFwS8PhH9SP4T
         zf9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro0ma68bVHHeXiFxPrdaEQmlJCnwhVesiuWfvMSoxwlTLCmvcxTsoNhaqPrt6HH2o2V7iqg0sgfQdfvirwM@vger.kernel.org
X-Gm-Message-State: AOJu0YzAI9uChOT5qlvnDob3PQ3eJbJ/Nv13hjF2ylOU64MAVQpTvbkA
	YsigO8AmRddzlwOmuytBrkDJDhse8J+MKJQMfaTzSroUqX/lqCwfH6U+n+IP93BAITk=
X-Gm-Gg: AfdE7cmoz+ALiBITdzNQNI6OhUFL1G0BkQD757JoOIMB6ltJqpgA2WO/2PTmrm0Hgl4
	KFkWL72PWsp0y1hc+wtnj9VZmXu9SQz+TLJTPZreZ6nrbBv6q8cLaHAkUHnFWilQDDYC0s+tvkp
	0wmSECoQh8+Se99A/k709WQOLUqPB9+Rjalbfa/kCre3DzzlKPBg8Vwb2zEFOVh5FcVAJe+VCM8
	oouMa2uQREe9jlh50pN5tYom/K6Pr50VnKNfvDzm2zx1bwgJWn/B9VfLTFAOaEFapifSHoFn6uB
	HHwZJR0Qt8DRQA/Qy+VAS3rOXeAgwsasJNDGAv2PWOMbkYmTbr4z1E3WteCf+3Bfe8pmfb7XY7m
	lL8I0jYctyt4PxtI8KxZaIeUy4qsLUOn41oxQCtV/qSQBZEfMmUBmplwaTqeWPIRLCPh7kIpIsQ
	ysBGhC+pSvuIX03flBBIUMayM=
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr3476721a91.0.1782968663686;
        Wed, 01 Jul 2026 22:04:23 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84366sm6143858eec.16.2026.07.01.22.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 22:04:22 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:34:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
Message-ID: <k5lgi2x5y3li2cwqdcznfgupd3fhbvrcgepf56ukahlrexyofc@moqiz6k7x24r>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
 <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115819-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:rafael@kernel.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,moqiz6k7x24r:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC4F86F3815

On 01-07-26, 11:36, Konrad Dybcio wrote:
> nit: checking for == is easier to read
> 
> anyway
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Applied 2/2 with this:

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index b2aeda7c564a..efa766e98d86 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -205,7 +205,7 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
        case QCOM_ID_QCF2200:
        case QCOM_ID_QCF3200:
        case QCOM_ID_QCF3210:
-               drv->versions = (*speedbin != 0xcd) ? BIT(0) : BIT(1);
+               drv->versions = (*speedbin == 0xcd) ? BIT(1) : BIT(0);
                break;
        case QCOM_ID_IPQ5424:
        case QCOM_ID_IPQ5404:


-- 
viresh

