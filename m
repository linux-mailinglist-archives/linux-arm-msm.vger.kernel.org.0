Return-Path: <linux-arm-msm+bounces-95487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KANEO1PoqGmfygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 03:20:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226120A252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 03:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A64D8309A104
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 02:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC5921ABAA;
	Thu,  5 Mar 2026 02:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n13/4mOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F333C1A01BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772677111; cv=none; b=Y8kzzgjCDvY/B1+wB1bmGXlTof5N+wbVQ2buoDm0kf+j50VTvy7C/fiCNPPZPBCB27p6KB1FoxaR4xgv09knoH8cwaHqXf50BcfqzQ565Yxi0B4g4zsvZ8Nq2t3ybxe+jbGfxS0glMVqm6m5ZKEH/uWtA2mqt28p8DpWHeut/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772677111; c=relaxed/simple;
	bh=omuNtWtOuCCJ0PrwP0Y/lM+iymvlPgAem1lThEqQuY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN960/5RprUSLYR4cy3DzvbEc6E6TM2/b2++wBxeH5Tp3WGl10VFoEwgQ7Q0h4ypEwpUH22CZYSGk761M7gwsP/+Y03s4hdzPkl2xEV6E5MmCTkoD+xmEeQmmSYlmd8dVUJXyWMYE9vScxSE2OkeL6M501Bhh3c+BQWlcWqaynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n13/4mOk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483a233819aso74016955e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 18:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772677108; x=1773281908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmOdcRI/juiCXIkhIn1qeTo3SGfYdV+4fS9rxks7eyY=;
        b=n13/4mOkPLE0iXCGZfkGHjnUv2jM0LwbWucojVxtzmKji1z+eAcJDtn15JVnW8EaIe
         d86pqH0rLkSSqIXuS6klZwCf87ZGi0sxfm9WUfuXAs7M1gKT0NPqq9/FWB52cv3e6HYi
         YTQCAEPuIyWoLVjPbpXIT5SpKFAExlUGqpRgXKh/bkYpcfhU+pMk+SFyLUF9YqKsFuMf
         oucBrsPK4Gte1xlJBy0aFw21MhXXL/XtXGM3h25+vF8le3hf85VVDRedVdP34pF1v7iE
         uGPKrXi74xsoFjmH8wz0MHGJisPFWHleMb53rX6mkqZ9xtFnfUUTnFKfmoy6YWojl5hj
         jQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772677108; x=1773281908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmOdcRI/juiCXIkhIn1qeTo3SGfYdV+4fS9rxks7eyY=;
        b=LKXuZjGUTmMdJFnqLfyWCpB4i+TruQZsoXHhF9Ee2kwK4yN8dijdChfXeqLzeUcKl6
         GSSUW09eEaIljhu20es7EdFRRIikx+yBDivQp/vd4S6+1zVUz0eyyKc/7GfXlUH7Zj3v
         Z3RjAc/f27a153oejTNE+jB/IjBq3qJY8LxkqRzVTPk3y+95N3x7nGoGI53GO4e3PRln
         6Uo/avJa0Q0NSa+YurmqFEShro/Wx1e6vEMf2WVRj+oPlxSLTh6LAKZr3hHGG9Ft+5if
         DhbFRndiigfLPkZX5+D0aZQovnPwn0e0e8eTU2vmGtXS2l83Q7LzUQqgbSOVnfpFFi6Z
         R/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeJ0g1X5X8YMXjEjo1BNOn08omwCV4zcM85cnpD4KO6Jjsy0oAwzWoZBy6oY/MO2XekUCeD9Zsy5vXREs2@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM+3aTOOuGAkyk2rL4aQBh7UhtsC2ZaT3G7S6YmWKFSjgf4tG
	dLW7IzMoWkP87mU1y5omqeZqn6qxcoHhJK8TeDMqzk2zlcp5j/AnJ4qGhhj08pbNF4g=
X-Gm-Gg: ATEYQzyJ6kDKWRJp1ewIHwcOTQB/sDyXGhSZ8hqUQlXEVPkFh0hlReZJM/JrFFkrFIV
	qvW72KN/B/JfUuPg4gFTrWzm9OTxLS8nn+FyiIDTh9aFulVW7dqaMS9HWK00Jcqc7/SKmjzqYl+
	wNd0qVqFw/pjwfS0VJpxhO8x9kG+Q1k4BCQxdSY5Cplu3/jJHNYfu6z5wI/ng53OAaHs7QAzB2W
	1eep9/vhTzh58t+zzcConOK3pPgjuLz3K9eRMeMg3Ue71g5+WEP2K/AF0o4UfO0UtD/cbL8ZYtv
	92v4e6wsrAw5bTleFdrY0RBg3IFd/U6qMUIvYzuzkCp4XsjHbjodJZW8mbAPlQ+1Acgob2lqplD
	lzmTFCvCokCPFlfUeUgY5FLP5G/oebM12PvaP60tzdvGk1XCeEjXvXjOH8h1v0RF6ycOFKdZZRd
	rQ1BJU+xKq0//PbFE02CQO9ScMMTd7cO9G38L1/lHsK8TvKDCelLC1jHmt7SL91m43
X-Received: by 2002:a05:600c:190e:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-485198bb48fmr74724055e9.35.1772677108366;
        Wed, 04 Mar 2026 18:18:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a13sm6688815e9.11.2026.03.04.18.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 18:18:27 -0800 (PST)
Message-ID: <2f1bdd7a-04a0-49a7-b275-4332f2979378@linaro.org>
Date: Thu, 5 Mar 2026 02:18:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
 <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5226120A252
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95487-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 05/03/2026 00:33, Dmitry Baryshkov wrote:
> I've cross-checked this against X1E80100 driver. The main changes are a
> drop of IFE_1, SPE_0, and two PLLs. However it also:
> - uses hw_clk_ctrl for several clocks
> - uses rcg2_shared_ops instead of rcg2_ops for several clocks
> - uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk
> - uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc
> - uses non-AO clock for cam_cc_xo_clk_src
> 
> Are all these changes expected? Are any of them also applicable to X1E?
> 
> At this point, I'm torn between suggesting the merge of this driver into
> X1E driver and ack'ing the current form.

We can test the diff but, I'm not sure that will really answer the 
question if it is the right-thing-to-do.

OTOH if it ain't broke, don't fix it.

Reverse the question - is there any reason to have this driver at all ? 
Can the x1e CAMCC be used as-is ?

If not, then we can accept this patch and potentially look at merging 
the two drivers later on.

I assume the code submitted has a purpose though i.e. its not possible 
to just use Hamoa and Purwa interchangably.

A few community members showed me CAMSS working on Purwa last year in 
Amsterdam with the x1e code - one error if I recall was a clock splat.

So superficially it adds up to me that its not a 1:1 thing with these 
two parts.

---
bod

