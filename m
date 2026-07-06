Return-Path: <linux-arm-msm+bounces-116764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hasyBP6QS2qSVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:26:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE870FD3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:26:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NdgyLIho;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MmoJsIiS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF7D73031FDC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA993009E2;
	Mon,  6 Jul 2026 11:25:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B8C3FE369
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:25:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337155; cv=none; b=k21LTAxrPTZVjBJmSiRD3Ky6I5ePKGvJCtMYQy87rRYcmPnpkIHSpHIkJaD6O080UFq6kk9XKs7kjf4Wfj1NB9Fyeqryluvj/gaAZUoZFOHgWx8cbjrHhpzIZMJ8zFRgWUTCDIFWYXReC183aihDjI5aLcySGn11sjNgRuVqbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337155; c=relaxed/simple;
	bh=mZjpfXdg1eZgVj+gUu9XkiaycK799bI+POtKiloa1KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A61KHM+FhGJZNlvymEtqqc1SC4Fh3x2Va1oyw7vIOqP7h4JH2JBuJYSPnLsXXgDFq5xGQibbM9CpJ5BWqCVdDDGrBp+hqERoTX8sv1B3yNOYGRCjIzDtOI6berkpbU+NG/qX1vaUKlUwaFtPPi+GVS6ULzNot1zCDp0Uhpt2k1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdgyLIho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmoJsIiS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7N9245535
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKgKWQ+xIVE13CWGd/k7b98wHY3plb9noY75qci7lNY=; b=NdgyLIhogU2NCEYA
	yrKn37lesPgEkNl1ivWs5RCx64RhYy0A+MJrXtfOhHk/Ef+f+7zGpoTOjWqjMBWt
	96Rx67tfjsq6Z8C9Q0VPPolG2wz7T7fZoNWP30Jv+xIMt4kGxU+YCmeAr2VcNmWi
	CHV6TNiw+rOXOT9RJcwHelXr4sdppnWX1QIPmSZESerqAMq8yfIfSeUmzhm+ue49
	8qdUWN8GMLmijxhHtCqLZ1RcBGDLmYhtZ4bxo596x3fTpMsYrJMyxhqtUbMzwTDk
	aJ0UjilegkvvQFq/Wr+ABekVGsd5gekalEIXNQUGrGTeXrojpGLBH+oB+SJoRYYS
	k5l8bA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g9r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:25:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9708091cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337152; x=1783941952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKgKWQ+xIVE13CWGd/k7b98wHY3plb9noY75qci7lNY=;
        b=MmoJsIiS6PrhxVTIryWrOfH3vadIOCwcjbIfxlRT3VRVdOoDNWomXslJ0mymNKNVtF
         bRmrseH8iMjRrTzK5OIaDC/SgQV/HnId2z2wGZozJyKMbxJugzmIdaLaPF32CL2+uoV5
         V42O3fAjmmG4wB6Xi8kneJYNfznrTfKXsARBomzvzo0aoqLLf68jrKQfgk0dCwVODvuK
         dY5/A2Yww+0yvEsjfcbpXxdj4WrydkNQlug/puHBt5St4Mxn7lAvAdTw4tqvPHGzJ+xb
         EMKVcqyKDS50c0uVNmSJelRYeGw3+9jbO/iT1459c/+jI+XyyTWe2p2YfUhcYFWcjTeU
         N8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337152; x=1783941952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKgKWQ+xIVE13CWGd/k7b98wHY3plb9noY75qci7lNY=;
        b=sqCAxAcKep5QrF6frJq34FcrDMRXKIpCCCW8ag/hAiP9Eigf1Vou/NaB1osXcWgPwI
         L0o94ljYgiAgw78hrlgfLAIWfge8fYYcmfkCCzWyLNazoG+1MBxyGH/bsQYr8mvLU1Vg
         /qg+gZ+NfHkyE54MIuUVS0VPwzZPNmfVcceGWhGtDXgNzQjg799mr2ZR5btuHMXckC/c
         0uovNP9BPJV2HgX3zIv10uwvaDzjW+NT/NT7ihdYbjTcw+69+k6EoGUFeCqCAa8tw8J0
         VmmzFVNKZ24mXUVAFzcqnK139l9aZjEWc8ftX2/gkpKjR3wjMyUK5P/RTzHZpQXqoNuU
         nkmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcbE3AtdHdtetIyZ2RiuUEFDkFkppPczt008kxWQfiZE1Fwr9aGgFL6NAZ/wwW9ZKlqMOMgb0whDkj4HnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42rf8YZfDEUqmjTGqdRmbP1uzxRnCQlye+BdMWU4NTXSHSoJu
	iDG1DllXYA5JldxQev7eKs3fq9KhBp/LW4UFRz+tGoWtFeOHb3mceVScg9KKx3l7AduJT9rV5ni
	KwKWSEDDFY7hVUN1zZyy+nxeF+TD94ikdQ8qRvjATFQjbsrhocEISZxRHx07wA4Hqfu3f
X-Gm-Gg: AfdE7cmxhphiINZtsRxkLcTbLEZWUQcMHnIkk1yx5YX97cGox0zx0/ZgrDe69Bffzfk
	+HIaXffzRx+TltiqhNlFn6m3Ejr9lzpy9KHIKnJutu1mGAlETAx8Zl0+6HZ98l5L9TBZCOAmcGV
	fWctMAjDyBr5LAgFv65hfK8SYM8HdCmPlqNsysVXXShyWQAoXJ9SCDRG2ZD6qikalBfo5ePPHnz
	naW9LtN2E1rv0aATpjrFs3JLDnK16coK67Z8l3Wf51YVRAXkUt1Dfii7BbViWeWF+NjS1mOn8Ay
	8iMeW8OhKCOV6rI/KOvzYvEkxm1VrQC3QimmxppUSL+ZZzBlLBeKWC54e1mcS6rOOpadLtWn4Yh
	igLLX0OB/sW2fhRtBh8P5WXzIj5/BDDa01Wg=
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr93371141cf.7.1783337152284;
        Mon, 06 Jul 2026 04:25:52 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr93370951cf.7.1783337151785;
        Mon, 06 Jul 2026 04:25:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm711584966b.39.2026.07.06.04.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:25:50 -0700 (PDT)
Message-ID: <b8f7df64-3e1d-457c-9e8e-57e4d2bf7ca1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on
 driver unbind
To: Jonathan Cameron <jic23@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
        hcazarim@yahoo.com, linux-iio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260529095649.2452-1-sozdayvek@gmail.com>
 <20260704000415.2446940f@jic23-huawei>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260704000415.2446940f@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b90c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FWEFCM-Gamp2U2xr488A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNCBTYWx0ZWRfX1wQIxCT8HnIA
 ZEdZVBNj7O4HTHLzYHEa/66uXM5Wp1/3cNEEbt3ptVwSNedFcq4UWTvy7y1sQGwBJNrYunVpE+2
 xSj6Sss22kTCWlrqR39azHyuPk/ftTApkSMaMRMi5sE4qd0qIepm0PWirlXMS757kcilBUi6d2e
 rN6aJJuShLt+yUB6+Dl7snNT8msoTTTaLkdMfhifjX3DrRgD/iLgBJ6CZlkda0jbWPWWnlsz8Nw
 ePdQ/NWzIFHRiaOvi9uXzVg4Pv2uU/RT4S2iATUyTbM/1usApdR47qAh4MSgnu6l3HrwSnjKZ6y
 TxawR14g2IquWAFW2o2snB1HpYqUNzOwN0hoqj8TDGY1UGNEtRMUzpVEIgqRaLi96I2F5j12ZSK
 Iyo9Q/AB79tj2O1u5Pz6msDjgCfaNeqfc+fGXvjMHWX0B89TgFPPS5x3B8phyh6c7fVGZF/858M
 MsAvfhElNBeJbIEfNKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNCBTYWx0ZWRfX9hd9+sic/dwK
 5mQt5gJvWo4UZmGWvqrAJO+KvUJJSR4O2FSgY5avyh70Pjo9Q/tPluHN+WgmdAIZJwKoghvwmYK
 Rh2bjWO4L6f3A937Iw7aNRhlHhgF2jQ=
X-Proofpoint-GUID: BLaxnuwAS-6MbvtByQYmps1iunh6wVzZ
X-Proofpoint-ORIG-GUID: BLaxnuwAS-6MbvtByQYmps1iunh6wVzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116764-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,yahoo.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sozdayvek@gmail.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:hcazarim@yahoo.com,m:linux-iio@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8DE870FD3E

On 7/4/26 1:04 AM, Jonathan Cameron wrote:
> On Fri, 29 May 2026 14:56:48 +0500
> Stepan Ionichev <sozdayvek@gmail.com> wrote:
> 
>> iadc_probe() calls enable_irq_wake() after a successful
>> devm_request_irq(), but the driver has no remove callback or
>> matching disable_irq_wake(), so the wake reference count on the
>> IRQ is leaked on module unload or driver unbind.
>>
>> Check the IRQ request error first, then register a devm action
>> that calls disable_irq_wake() so the wake reference is released
>> in the same scope as the enable. While here, drop the inverted
>> "if (!ret) ... else return ret" in favour of the standard
>> "if (ret) return ret;" pattern.
>>
>> Fixes: ce0694841ea6 ("iio: iadc: Qualcomm SPMI PMIC current ADC driver")
>> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
> 
> +CC Bjorn and Konrad as we don't seem to have a more specific
> maintainer for this driver.
> 
> Seems low risk, but nice to run it past them.

The robot pointed out to me that this makes probe fail if the
irqchip isn't wakeup-capable, but it seems like that's never the
case for the one that will be used (i.e. the QC SPMI bus arbiter)

so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

