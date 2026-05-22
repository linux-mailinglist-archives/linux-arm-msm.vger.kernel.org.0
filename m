Return-Path: <linux-arm-msm+bounces-109430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI7QL+XLEGpAdwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 23:34:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21E5BA7CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 23:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A83EA30036F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D2438D3FE;
	Fri, 22 May 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0QTSxGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68D38D3F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485641; cv=none; b=fHyeIuEL6zp/WTnBBepmUpewUSyu441oZm0xQJAKkUKp6OqorvD5hNLe4bDtn+nwktIhd+Vd4KsVjFzpxC/RLakNwuqeztPW36IUcYbc4rZjtcxhApxgMqQpqgCTNHNYsu2UoGjo8+jhUYHV12WsOC6VOuwOejAaVKDXqxZWELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485641; c=relaxed/simple;
	bh=xN16+V+XaUhGIrCQOmLTnW5xy8s6zmBTnZvA1J4feFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yjh13aNovl/KE446Zv0e1WiiV5j2e5SHr1rRWQj0xTRdWkB6UE8R5gTgcIjHRJclt/kCoLZQSoZb/bAPpY8vfd0WkWvI+7R+UzpKAwxHZQQUTm358iz7FyFO6F2aNcJdp98YWmfmHXRQgtXzyt6/OfKmtWU84vfPq14CkCuLJSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0QTSxGY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49048e043e5so5936825e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779485630; x=1780090430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEDekoRqr3IuhM4WvgAwDyzO0pzOp2MJJnI/rw2z0EQ=;
        b=C0QTSxGY5CUlX3LctAasbwVEffFZ5Ot0SCP0XgjG56Z0uzDI6cRMA14ujPUH7fvI/j
         hOJWNcduXrbrhr9kxmlzfdJX9P8OiI8/2JCUJ7fsjiQcbBg+QJMXosboJTgBIO5aLg4f
         3dcIduT1wqhTx/+vv4lnvrzXpv/MKT86gq6aNcwUBLuwuW3jFaTzsWd+p7bWotZm/D72
         gYOCPVIxZQvjXCzitXeDVeoIphYMDEdoHQFf/gJqQWkI1B0/7qbiiTfXgpqUD4ADKFUD
         gNISviX880yBUqG2hPFbAWzP3zIPF/1+t0nhHtj2sPo8EDBDH62cr7yvLcdPX+b22W0L
         4X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485630; x=1780090430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEDekoRqr3IuhM4WvgAwDyzO0pzOp2MJJnI/rw2z0EQ=;
        b=L2HWY7T9lw6AGtOJ/YJOsmWaFGl7UEtcEjvqM5sS4HEj1OIDZLhwH7F9WpB/MuAWr9
         zrnrNu6xCufocS4JyWg0qMl2WacdyYJl97y8YtVQEqHbGX3rZxeEDilctfS1URdYtw4X
         cPfbI5NLYTtPx7RRhTtkVA/pRRqV+wKekRyCkXoAIXVhpFVztsWe3yGwJRUB2oNxMefM
         hXiz3YvBwQQwqX7JOWOH7JijTbFL4pxEzBLbQu0eIESGKmHpFMjCSK8DsMUnMRMNqkMB
         EIgNQo/UBgjvWpIq6GadsriezTIiazU80aRSxhD7m+ErA74pzwkt7DFAHmP5JsnmEa63
         vyOw==
X-Forwarded-Encrypted: i=1; AFNElJ/AZA2zE6MrpALEoGWxJz4d+EKvoGIMk3i+4+UX2aq2ukoEVhsFPk0KGILFdrZyKx0yo3m8SHWox4YWcaMS@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFAuoPtv8bwltLiFdAQinUcd8jhe9b9sNXptXod/XUVys44Sb
	urujuecLJ4c9vXmIIRLweZs81rtt7PO9k5N7Vtyg8rhjgcpkgaRc1KOsWxH6EMjh/nc=
X-Gm-Gg: Acq92OG4St6XadPpJOXnomFvQN22G5IsGswIBR+c/Wfuu7o8GPyE0i4x0zBi7HpE8oG
	VaO+BQChOMXIJ3HEFTmFLgGfbgEoYw+YQ9jtguvf24N1zgvQzhDjtfWRJ535PtAaK3Vm5zFVE/K
	55SzwbLMVVYT+LpZh9q3uQzo4RWVawe0hR7G0vUTyjD1yssbslq2eE+uqfmtB8gsb1HCy7RWJTE
	jBRu0aacob4nDIOh6+ycGl8chQcHefaL41dJ9TpbNXFgtDgS9+if+m6vvVkc/z5ua1w5kMZsLnV
	EDZ4OqZ1dL1g4TFl5DJJYZrkvBYgZ+kD0zGfe1uHHSAtcgE0f9Oy4WqktQkucT7uJligzbEPoKv
	spxw1SVE0lb1Vbl7eHJib7nA1/mVLat6uUXhw3VShQUxqpF6piya6oxiBJsZD1pPLvseXwrIS33
	yUxHR3crcqTNz2wb4ayVs5K8itU8HJMFNmsxsDFjMIM5mEINOqnzyuuwzs
X-Received: by 2002:a05:600c:4ecc:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490426d4d7fmr76531935e9.17.1779485630196;
        Fri, 22 May 2026 14:33:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.110.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490469f61b0sm19105135e9.5.2026.05.22.14.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 14:33:49 -0700 (PDT)
Message-ID: <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>
Date: Fri, 22 May 2026 22:33:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
 <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-109430-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,i.mx:url]
X-Rspamd-Queue-Id: 3A21E5BA7CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/05/2026 18:16, Michael Scott wrote:
>> └─[$] <git:(0.7.0-multipass-v0*)>
> 
> Good point about the libcamera version. I debugged this on Ubuntu 26.04 
> (v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to 
> API changes with other parts of the subsystem.  I checked the diff of 
> upstream between v0.7.0 and v0.7.1 for the dma allocator code and I 
> didn't see any changes, but I wasn't looking at the software ISP changes.
> 
> This highlights that "I'm doing this wrong". I'll move to a cleaner 
> rolling distro where staying current is a lot easier.
> 
> The GPUISP support looks great!
> 
> Dropping this patch as I'm not understanding the full allocator story. 
> Sorry for the noise.

The whole make CMA bigger thing is an error I was pushing myself.

CMA is required for some systems like say Hantro on i.MX where - the 
encoder doesn't know how to deal with non PHYS contig memory so when you 
are passing framebuffers around from once hw block to another, you need 
to make them physically contiguous.

Not a problem for us on Qcom hw though. Like Rob said, I'm actually not 
sure why we need a CMA block on Qcom hardware at all.

GPU or WiFi I think but not for Camera anymore anyway.

---
bod

