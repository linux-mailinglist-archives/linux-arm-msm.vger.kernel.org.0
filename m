Return-Path: <linux-arm-msm+bounces-117007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3+I4K/UGTGoKfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:50:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4491715257
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:50:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nnzd729W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jsS5pW8h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F6CF3368A04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D0B438470;
	Mon,  6 Jul 2026 18:26:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9897437874
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:26:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362370; cv=none; b=mCltyOdUXy41w+xJMls/83Tm1TZxkWwGKwkh8dN3g9DXN/yQdBX/k1f0zDQTCCLErZLnOyKu23bETPdRXBm/XfPz5/y8vnxovDblzoHkS5XA1MfvPCwcomhMbZx92bplD0m1KEa4wPVNisPdFzh2zZ6ETCX+7HqZ4+lpE/iBXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362370; c=relaxed/simple;
	bh=a3oNKlr4mhy8oV9tBLz8pFFNqII/cGarZHTS05gJ9ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psCpJJsjuk26GfuIfUgbtUij2ZeiwbRSi8FKG3tJBJDEVcf3Nr4NFtw56o+04zmgxrym0W78AdH+RHpikHMB/2PlZKaN3xjD2LRCcN9bCw8ZME04UN4saBV8kEJNcxDW0rMyzJACqLzmz+2DP4WrLo59nimix7uv4ofwIsI6XgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nnzd729W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsS5pW8h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDCM990337
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55amyOyk3SFaqX4ySIofcBlt5TbW1fvejlu8KZh8qf4=; b=Nnzd729WR/SQpRS6
	bIFy37y9ersudNsomaGBoM8S/fkl4V3+NzMxoecDUDcIwiSrCZaF2osCnVFvisJs
	fIgjO1Vq71sirnrVzszRkYbp7U9om3P/m+ibN4pQC0skeYp9CoZFBF15CKu23mIM
	1nfKuF5XfUG4gRSuEYQOEQFyZmgSvwBPv8r0WziIcqF5D47o70VAV/97ZT8PaW/H
	WWcBP38HIXCsx+LIGBS1QwxzXIjy0KbrgT9m43qrZGy8qQXJzYHUORD8fl1HEpTg
	UHdGMqvYD4XS/rMiZoaVq1V11YD3mER7Zvi+chD8qDmOkD7r/dSwV0sNCFkoVVNG
	eMpR1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtc66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:26:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so3061945a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362367; x=1783967167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55amyOyk3SFaqX4ySIofcBlt5TbW1fvejlu8KZh8qf4=;
        b=jsS5pW8hY4V4isAle4M6icCuGE+o8+HYynh7PytM0xajkzOEg76MiwTQibQUZVyUtr
         IGRlNsb79uCxy3S8RFGp3tVWwLvDcowU9ANLSNgo1dmaZCFtKEkXHQENbHUXp5wgvX0U
         0GhY8Z0zBcqIIc2HXAmw2XVg83QHCrP5Nm510t35Qqg8AJA+9WVbuP9HZdN9vXuz8yGc
         gIYuWr+sNJfFFzljNpm++B/lOhFRrZylacoXqRMkUfKvY4B3mHDsum5ZlZ/inrqLDTEp
         RebJqvIx4QOr0U8KcmQtPlratP7FfKr0RA/vUYAzMfQi78NcrLPaf/yZghd+UWMkeTX5
         vC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362367; x=1783967167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55amyOyk3SFaqX4ySIofcBlt5TbW1fvejlu8KZh8qf4=;
        b=Q9mk5hiKQmZdos5fyLOzjh94ckSUqkoNrQmNxThfvRTP6SfWHJD9tW3Xi+3glcjqKR
         e/2ziLMJsYRqyyoeavwVdp0lIBB3agrlsiO4aQ88lqhUoB32pywA5htFTOnefQL48xTL
         kld6fwtYdNun3V3FWTokB2ASfOMjuhyMstF0mk2AOH37QFANEplfqVA/OYo1a7odDw3i
         c5D3/5rAen6fSk9+xOb/M0411aFf4qtYHUpgKhmIgKNSTOF4FWXBv2mPNlPE6f8qRCaQ
         9APbP0aL4rGXmb/4m49GPLQJBC9tBZtGYBG4WAvPBJmcuG3P+vWTw+P5FFUv02kwFSP0
         96yQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXz2GIz4qcJ/uh5htVLUDxbzLPpdTjTA3xliUUizMbhUMkpdNlL1e9PIE1mU6WyyXucXVruopyghIOVtvs@vger.kernel.org
X-Gm-Message-State: AOJu0YxplOaF+2DecrGf1UVg+nFvv014YqSmBOzfCN/WApyxz1KzFovm
	azEq5LEdvnZxMch4EwOCd1uMbrmkut4floeAKDq+dTpaOgcJ1oWSTV8KAkJTlmFz3/TFcLXN81/
	u41vA10N8zLCtar7NwfIl8Ufp4LxvalNejLwVjyOKAjH4B8LWZ3pX2eI1qKqofdJCZKtQ
X-Gm-Gg: AfdE7ckUMDGv9hpsjtowKH1tVkiFs5Vg53L+O40T+cuzXIQQ4SXtDrfzfD0qePXtpDx
	BJ7bkD6VM0jLWvchZzKaAp4os7kxTTHY9t2t+br9Vh4aKY32koiI3RujxSApWjEJui42A/l7kZY
	JRRr3uRrhYDlRZb+WQmEZbjWG2kHjv+ZjQs/kx3kbQGHWyPcfj9TexBnmF0XaQIqxPT3w/wwR/M
	/NWB8zo0CGyqiylIb0vSfaMyJCwlUYK2HwRe5jNJUCXORF06rOOBZCAQ/H5W6C6ygmd4sZGaKCe
	f0WOOmQgAuHfyGZ5KKXOKwMMKRUs5FT7aLRvtpR0CoUfT9ScWPsoC5WVGkH4LlkP9SQEYZoxcOE
	9Rp69hhYH+WE8Gyn3zVW3r3yGtNsBgzmjZ8WA6pNrYbg=
X-Received: by 2002:a17:90b:1d52:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38756ce150bmr1900108a91.16.1783362367372;
        Mon, 06 Jul 2026 11:26:07 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38756ce150bmr1900057a91.16.1783362366914;
        Mon, 06 Jul 2026 11:26:06 -0700 (PDT)
Received: from [192.168.1.10] ([182.65.247.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f1595e912sm63180552eec.31.2026.07.06.11.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 11:26:06 -0700 (PDT)
Message-ID: <3857112f-3f5a-4116-a999-eeaffd59ec94@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 23:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
 <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com>
 <20260706-busy-grumpy-limpet-c59789@quoll>
 <CAMRc=Mcg-6XajFJCjTDgGACQ7YLGggw5TEtHv4QMEA=dFLOhTg@mail.gmail.com>
 <549ff994-6b6d-49c3-a764-4c1e134a4a14@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <549ff994-6b6d-49c3-a764-4c1e134a4a14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OJ_5-bkLYax6CPmA1HpVK691h7MnQN3N
X-Proofpoint-ORIG-GUID: OJ_5-bkLYax6CPmA1HpVK691h7MnQN3N
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bf340 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PVj2vuZyEA0yLiFZlqDmwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2G9IhLSBF7q6IwnLtzAA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX0a13gVcKRTLz
 w4Ypad/fiBIiDUPx088q2pVPTV5+DHHuwCctE5XFl4zo5+RQ+Jro6NTzGIKvoF5/hOLTEesLIhx
 4eN49433NwRQbd1UHRGf0/IIaYYO+jsDtD8d5evZsuJ4VMEOfggIAV+kfStU4m3ZAQbWKqSpezZ
 thX0NOqdVFGKRG4LEabWrLMJxc+4AW4N47uUexdwKs5+A2xF2t+wqw3knE0ixdGDS7/lYcOCZKC
 po3jDhYbnNfE1gzoTqDFnr4FZuRAUhLLzrSwGijoZ1mC9agUYnZk8R9vdp7E5XddutYBaQIS6kR
 CU8aazg67yYj5nzsrkxwgyF6XNne/ZR7FTLNAmz3jzFTCLk6VV1cb08WKJnw+enN6ippcs3m+fH
 ioSfO2GMrEoUnxl3kMdboOcoI70ngkefSxSVu4g1b1Njrg23KBJu2s37VLusHE6v/P8TQBUcUXM
 ma83XRn8S232dlcnToA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX76cc8V5iwsNA
 zkmGBfbvNYVBvlcIQnmEO3TEUsd4rmBMvSfDAfmoIJ6k323wBnW27DHswvKN0wjg+abSC13hD/I
 /7YvesD2+o7TxqHI4Hp48A3dZ6v4sMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117007-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:brgl@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4491715257

>>>> With below patch, we don't need nord entry here.
>>>> https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com/
>>>
>>> Patch has conflict. This (Nord) should go after above one, with this
>>> fixed.
>>>
>>
>> The other series still hasn't made its way upstream. This one's simple, can we
>> queue it now and rebase the other one?
> 
> This is not point of rebase, but conflicting work.
Yes, my patch[1] can be accepted straightaway(after review) as it has no
dependency on any other changes. The rest series has dependency but not
patch 1/6.
It's best if 1/6 goes in followed by the other efforts(Shawn for nord
and Jingyi for maili/hawi) to avoid conflicts.

[1]
https://lore.kernel.org/lkml/20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com/

-- 
Regards
Kuldeep


